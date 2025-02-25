Return-Path: <linux-arm-msm+bounces-49326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCEA44687
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74CE0175295
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FDA1991A4;
	Tue, 25 Feb 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffFRVg5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA4195381;
	Tue, 25 Feb 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501564; cv=none; b=Bl/+c+FLqSuel0sCwEEGIkYJAmvNuRKdefh+oSMV4fuM8LFArdRn55744TjBKl4PTZ+ZohYTt98+cdERCDLxtZuesq5hnBIYjnL3LV4x33rl0kM/+StPyGlSKvdjSbuEGHx5aZgi70fTUt/2tXVynYDVFKkGLreSrw6Et+hjkBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501564; c=relaxed/simple;
	bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bDVwBpIRFhlat1zQSIRkMTE2YwB1GhJwLAXS2hktbiFj5WqQKtpZ4h9XTyRwbU0vbV20FLFsxhvMIeDGbqjXfRrM4f1B1g8VYFBB2P7QFmqfjmvxfgtpI1urPRFzLc3eLBMsCnMC6fgJ4fWHSqbo9T/ZKeXCHL+WwuyMwOdbJDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffFRVg5x; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abb86beea8cso1041623766b.1;
        Tue, 25 Feb 2025 08:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501560; x=1741106360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=ffFRVg5xIIbO5eCvPfTO9fQ3gZt6DcTIUuChD6zxmv3IT3VaozcUndJ6qIIuGyBOm+
         8Lgr2W/SULp+QJuZWyQhy1cLw57O+78wp75aRYP47FjZydd6ugqZHSbVBWgF/rjldEzb
         QZ+oTmt0bMP5fB5cAxk5RIlBPVyNbXU5//4EaDWJxFeD9x96bSSd322XlhElcksYVNTF
         AGJZWKhIYX+OyzY+erl7nr6jLPf+jIk7cyyeIUfYiaNv+mMOiZ4ZcanOusitUJrq1Nt1
         SpdIXd08oXRj6QnC2wDX6twvrB9hqoAc/70yjFwQ4xsCsj+UwCIMqWKKHejGj4wT6uj1
         RY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501560; x=1741106360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=roZU176wuR0nvKocLrFbWMC6HuYAOW2/+/GV1J7Y8BXwINqhDEWneI5mIJTlYzguWL
         VR+Fgx7ZgbFbIC+GJJAlN+ZmZ81KV1+XzrnynQYp7kCTZtmbfP8DyRS3xo9gOwbqW8iU
         lSVV2ZLMkNAT4Py+cmRYwAEwc1v+CMG74LzO2Wu0rXUJ1AuC1U1Pa8/3kxtRoyh6wjuQ
         +TmlfsgrEXAAgqWd9JyCl1hZQ6ZjvBoHrK70o7po0BxR9tLbVEEYlxWZjTvLMOZDnlR1
         Nd0SQw0s0m9XJJ0eyCP2RTNWBiP2Q27WLJ2FSEqQKuYqkE/x/0YPTjS+BL2sUeeAzkee
         Ke8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfGzAwclxME+ItEuUZvAGoJKqIu+CoTxmMc2aoFg6C5WRceAUAJVCv9Qq4sm8X7rDcQ73Xqvx0eaPHyYqh@vger.kernel.org, AJvYcCWPo/JaSVOg9fm0CWTy9z9Iu0NSUlZHFgTN4QVJL3sfIg+r+N3buFMJG2/TjfD/y2jgM04LNj1EKXvb@vger.kernel.org, AJvYcCXuq+yzMyl3dpuhAQ6VBr9kzidDYlSr5Axp7bCIWRK1pjvmYC+ZMZjkCvNXIm4dnRn8w/AhxeZTxM+PCjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwMr5UNOJKJvUx4XsladVIv9LQ0qxAC/Igz6Xkl9Vx39K9wJBe
	BCmAdsW2LN3Y1hhDUrR7c6njRmCM0QD83rUygV42aqUEnpjBcLMw
X-Gm-Gg: ASbGncvdzepQz493hWc/HIYTzMMYlBPPlyc4Jd99oUGMdbqb/Ws6V1XrsT9661JUbp3
	8QvpKTWPWTv6GPa5ZYAu3h89RFQ82TraRK1MxV8rARo4XTKmGQ6sTre8+uvCh1dayteSiWmtMcI
	cheJvpwx15tgzdS5uKsg08fAOlLwp6yy8e1HZ5i6cTB905//wvZFJ3vLStBjRrev1c+UUKlQNqJ
	WCxH37rWkJ4BMBkczmKi3VeqLTaHTQ5GES7j5hh10asHeM4bf9ChhyW/lwmCx2l7OM9LEKIO7BM
	h+dAF5kMr3zGWGjB9t3ZBQPm
X-Google-Smtp-Source: AGHT+IFl8xWFOIR9f5Hz9FFc0nW6Mx4/QxBIKLHOB/Wz5abEZ452H/QG89X6Ou70ISCYojdiRWhYMg==
X-Received: by 2002:a17:906:32db:b0:abb:b31d:778f with SMTP id a640c23a62f3a-abc09aa6937mr1407796966b.20.1740501560325;
        Tue, 25 Feb 2025 08:39:20 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:20 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:53 +0300
Subject: [PATCH v9 02/12] arm64: dts: qcom: sdm845-starqltechn: remove wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-2-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1185;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
 b=Qr7NVxc2nAGqrEYizCTiaf7EDAA93/dMnDeuW7SXKszlf/9IbeNTMP4o0GFpKsAAvdRCRpiu5
 2HgjTrhGekwDv5wr7ybyPF4LL17oyatnqvOJvJKhp4uQFqUVNJs5Dlu
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Starqltechn has broadcom chip for wifi, so sdm845 wifi part
can be disabled.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index d37a433130b9..6fc30fd1262b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -418,14 +418,6 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
-&wifi {
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-	status = "okay";
-};
-
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <27 4>, <81 4>, <85 4>;
 

-- 
2.39.5


