Return-Path: <linux-arm-msm+bounces-41050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841EA9E9364
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235E028803F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAE522757E;
	Mon,  9 Dec 2024 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7PGWMyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEED3225770;
	Mon,  9 Dec 2024 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746188; cv=none; b=drS70u8uGJxiQFLDLOgy0D8SFIu2coA0LDrgAIztsKMp3wh3P7vH91PxUvkSS5Ou3mu7u7moPnL4wvU899n/V1m3OGah/G8+lJNfjyviVeI9qrLx45nNdzP8eyxEt0gVU/XMqqXitkyT27o2N4HM1Zuf9GrNbtc7f9tAuzGgMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746188; c=relaxed/simple;
	bh=s8D9yeNbQCv2g30M9eXbjNQIQnE1t0x8xMLNaeOtSjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BJAd6i1BLrhYEcEqrZU0gMA2A2iVDoLeopcbqR8FnSFGqOeFUIM7DfKCL2bcQHC9PUO3p4Tzyhbu9ddk7gpWXfZPV2G9NUrxDiARxyrYTsGIiqUsK3WCi16C9xnMwjiJ2QZ8dAlpa6ZeQ2z99teYHk9wmzv2UddN4mop0VrbYZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7PGWMyT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so1813758a12.1;
        Mon, 09 Dec 2024 04:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733746185; x=1734350985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i9ObfepNy3veehtbbhJfycXTaTrD3xqvTIpZCuucCM=;
        b=L7PGWMyTMg96WyPFFWVMue6qG8uIDiUzIMjtq6twGEByUaV+Qi/jB4Wo4TLTuR7fVm
         H1HVC5pGc+qitOecBv7qtRZxvvy8+JOuiPUPH8zDUiBZTB8m5ThdRux8A67TzFaA9Qtd
         Grh8aKU5pef2HFwJT166rgl0rHmG6iRPpr70NjYVvu0M/QQgsdUJ0fAVY1cvmKo9umAZ
         Ium6OOy7xv226VEaJ2d3cYE/toDbkLfohGlykxwL1xfJCrRabexak437JDAJUVhbqdfy
         xw4wNJDdxTMQmjWO/h1fRCqikniPNZvae93KagwLyKdNx8UBXkvGsPSivIDpR9XGLrMi
         hu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746185; x=1734350985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i9ObfepNy3veehtbbhJfycXTaTrD3xqvTIpZCuucCM=;
        b=AmPKBXzyFSM1qpIGpDzhFXXain/JWki4JBkqP9rgO7VOei+IGn9CZWzBY0TijhpD9O
         yRD6xpU6hEuRVn7PniSIXzE8lFnk4/Ou8vRxyd89YgFY9XZcLl+U1NuOLM9TGKmyanNT
         dkUfyz1gHRMMzfcS4EtM4UNK6CyGUs23S08UFaLZSqE8sDnfefOOReQds2e4TVFkJSH7
         LxMyxMj4aE2h5thvBgUXQYklxz+8IZnBfqXFWjV0mX8FiDCmdctF8+/sGE1Qj+2Q49VD
         XFQBZFY++DDvOJMTrCc9O3k7JLye3TWxnvWqyrLV2qMYU02auVdhx6X6y/N6LTghaZxC
         Vqlg==
X-Forwarded-Encrypted: i=1; AJvYcCUD4bB6zSQXDZFOyK3Oj3dQ+6CilDphMd0yhvg4rIN0sD5FrGNf3Uvoyjs0xJiNLbA0sNShK6BR4lI5TN8=@vger.kernel.org, AJvYcCWSo3K3vyK9TWhOk6jGp8WqJ/3rPdvaTcpLjriRGd3CKpdV6ToEqjlSuw3UJf2gM0B3C0U/iowaZ0G2qXRO@vger.kernel.org, AJvYcCXC2Du0WwpflbSzwPiijr+imPVLgfBvPq89S6mdz+nr08aVzowPdf3zkNEEYo0Iqbev/TMZSCwvp+Ir@vger.kernel.org
X-Gm-Message-State: AOJu0YyQMAdOkC6XeskiQer2o1/sdFLyA+sx73Xpi40ynlQKxrrl7oU4
	p0js+BO2rTONjuNpM7FvlRtFol7V7hiIMN9udF4gyvO0TCwq4ibr
X-Gm-Gg: ASbGncvYIBR3lq2IBYkNmwDxmH5tcRBmHcaSiJPi7XTDeSGqUELFa3iRLXapxqfgB5M
	g6/+FFHrRNTGnJUvSw3oU2bLWhsOEYE1fkaLv6dgFdebPTXDOgMHX8GNYdMXc4WA3zbtvRJdCY1
	Z+Oe/72VC9iu0uLVlox/+N7ddo1jnaWbnfiBk3VOxQxajNQdUkcK6rzGVDn1vp1WtHlWuVJf4Ba
	C9vkZdZdaJqoH9gPae5LiKJn5enlnASzUI8qH9e9JtQjC8v
X-Google-Smtp-Source: AGHT+IFKx0pQrWWiP99rg1LvjkAzli3rFoLvLt40Bap2/47L7yv9y17osrpkdcdiGxorPN4cIgNcCw==
X-Received: by 2002:a17:906:4784:b0:aa6:9c31:74a1 with SMTP id a640c23a62f3a-aa69c317730mr27644766b.6.1733746185283;
        Mon, 09 Dec 2024 04:09:45 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa69964876csm37308766b.49.2024.12.09.04.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:09:44 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 09 Dec 2024 15:09:09 +0300
Subject: [PATCH v8 05/14] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-starqltechn_integration_upstream-v8-5-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733746173; l=1421;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=s8D9yeNbQCv2g30M9eXbjNQIQnE1t0x8xMLNaeOtSjs=;
 b=brkQpwlK4Z/X65hK6KKRsbBzasVBI/MioO1da/+IDAAJIpdh6vVh2Fe3lu7scZYUR8ORBAJuh
 y4i5U35nH+JBGxsrkYo9TwCKCyG/CI4/b8TJUPT8fvNXeetfyDgh0pr
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Usb regulator was wrongly pointed to vreg_l1a_0p875.
However, on starqltechn it's powered from vreg_l5a_0p8.

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v8:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 6fc30fd1262b..f3f2b25883d8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -135,8 +135,6 @@ vdda_pll_cc_ebi23:
 		vdda_sp_sensor:
 		vdda_ufs1_core:
 		vdda_ufs2_core:
-		vdda_usb1_ss_core:
-		vdda_usb2_ss_core:
 		vreg_l1a_0p875: ldo1 {
 			regulator-min-microvolt = <880000>;
 			regulator-max-microvolt = <880000>;
@@ -157,6 +155,7 @@ vreg_l3a_1p0: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vdda_usb1_ss_core:
 		vdd_wcss_cx:
 		vdd_wcss_mx:
 		vdda_wcss_pll:

-- 
2.39.5


