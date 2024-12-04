Return-Path: <linux-arm-msm+bounces-40379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 868219E46C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017E8188015F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3AF18FC9F;
	Wed,  4 Dec 2024 21:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhF+sNym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6B91A0AF0;
	Wed,  4 Dec 2024 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348114; cv=none; b=rWao9Yj/aKm9myVG9e560EJqqZKFaCSqmJS0qsg+bRqj1XWx7HQkuOWEYUmL7iUui5IuCseXWJz/9Zd600sVhpscskjXFiDuFWUA9Fg130lQQ4HHigGu/I5mdrcRSDGlS01hHD5Ns0GNRF0sQtIQ/S0HVE1h+mqOvqk3HhtXW7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348114; c=relaxed/simple;
	bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZaAeB841oHWSVT/9M8tdrGa2tRlC1EvcVs+0qHyN3AlniauM9/TYFSoXpcN4HmfOyYDzEcR89x1anZn+26LSlNVCl/ddFa4J8WdssVP7T7axigL8ZHVbs8mtlfH0p+4fN9QzoTWCeMK1BNIoH0erokfpdrrVRnRd8zh9kDtBT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhF+sNym; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa535eed875so30965466b.3;
        Wed, 04 Dec 2024 13:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348111; x=1733952911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=hhF+sNymAFcdoYIv1cCGWc4Ql9QpHaSJ5sr6g/5UuFU7GqlP/4v/MSSOTg9vwJVDaO
         Kab0FRG9lQ1rpH62iW8KP2rLIz8FXZjFW+U3bXWzVeqzd66LbQKJKo1FaXCqtGryGOXu
         xdiVYbBzbvO+F1q03aY2CTu7yx0mB6QpWJdjGpzvL1cQ0HvxmQimMRTK8lo8OgqAOPCG
         ty5xrbY1kvWa6fmQeAm+l1q5simIBGMRHYqh7mA04ER/ee5C0jKdH4pB467LJ0w8k0uN
         Kp0kwlhI/4Aingtbyq48u6yDvyL83YUZf1y8qOSdwa1NLoeAQb40kSLJjCWsK8MaQ6oB
         iRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348111; x=1733952911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7ZPpMIf7KljHM0C/BgCOacX+DOYg1OD4FK+PFwISpQ=;
        b=Rog1dhWWBXSs+3zvYwZU6Nu4Hju73oeZ00/QEe0QRBrDhYy10Kkz8z2IRjUihHVkW5
         GmTgrDR9Ae9kQWGAQl6UdOTxWa8ionFl5FRaVsq8up5u4o+u3S7d9GclpOJVD2qFxAL8
         w6d0BBxYTxx3AWmX9BJx5lM+EvQjD8a3vdEK2CI92RVSLbKrzsn9WnKfe4NldLSRrZnp
         r/B8hy6d4Ve66++6t/0b/NuZqVWOCcwn/EnhD4GddQ+w0+MZsneVeBy+ClFUiEORraPd
         dOFr5cypYacOLhTwUnQJgd94+dlXsDJDArXU/16wpA6DcyjD7RTOBLoz6rz32L+3CB8A
         1dGw==
X-Forwarded-Encrypted: i=1; AJvYcCUPwoQ2Sb0tUTO8j07W0WgKsqJWAy9gYQfm3ieuDXMBsV+3Y9JtNvVbvGvYgQRb5Hya3bjbh/b7K7Q6@vger.kernel.org, AJvYcCUgOqlIBYtIo0uMDqIpqBvIuK0h/Goyfx0xAGqsFk1RDDY4wbvPgpQMe2Jc1IchlnPRtA3/snuyxa6vNFI=@vger.kernel.org, AJvYcCV+qO9EcwKSVfwgWlJ13LKHUNHGwzvfPnVhFnVlzLVC6XvrayIG8aoexomibX06FQ9C2qnCrEW0INCI8mcT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86K5ddA+A3K3emA25SF/wGbXMqGP8OkjsqrDTMiGlwQ2hQr1c
	wqcHc525iP/MlzLQf9FKydLi7+yDqmK6KuhiPq0tEq0I37KVUhsddgdsPA==
X-Gm-Gg: ASbGnctvrd/FZ4PGOC2GrI0lECikKYm1W2s0dQ3Jst8cFRPMAhQgWswaaUxzxAsfrGO
	99QbK7hfRJNdeCyg8qHHX4qsjfu+/ktmEZU5aaZ5ctz5kqV2HPq9y/D4J7oXcg5ci4uoZs05Hmc
	jeT/hmQ85h37/dpmRcPM62RYr0nVWj+IYvCBw6v73KqA+yKC+it5r4OBfwNK2YgufviOxU1//oC
	8+vaYUF3pSews3VTv0WPRVPxB5AtnQ+u/dLkhxrI+Vr346A
X-Google-Smtp-Source: AGHT+IHoZcC2uvYusfFp6uzADPGKZmkYYwBJc0PnB6zL05dukH1+IMVC0T1Gq3dzpG+MVwYNpEGfVA==
X-Received: by 2002:a17:906:31c7:b0:aa5:3c28:e0ae with SMTP id a640c23a62f3a-aa5f7d1b599mr761681166b.15.1733348111102;
        Wed, 04 Dec 2024 13:35:11 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:10 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:51 +0300
Subject: [PATCH v7 04/14] arm64: dts: qcom: sdm845-starqltechn: remove wifi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-4-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1185;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=2tinpZ9cO2Cfmec7WC+wgRZ+VOIH0877oqaFTz105/g=;
 b=wR4NFoRo5HQ5G1JTl0J+kVuDDVxXa3GZUuu7RSVDbwIltJxA1t96sXSHaOTWu87olxUtfoNB7
 NzK5p23EWO8D0CLASLP5kZGa/msERjMTxtX3YSOy6vDL89IKkZLtVAd
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


