Return-Path: <linux-arm-msm+bounces-49328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85614A44694
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114C217D56F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A2119CC36;
	Tue, 25 Feb 2025 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VscTdYkK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF7199947;
	Tue, 25 Feb 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501566; cv=none; b=h+8RJNJH6FdEcxXy1IaoDroexVdHGqjsaU3QyzasdDJF8R9J0xAuZ2bFBeiha9D52Rf4m7GNqPb6904sWlCPDVjb6+prk00Eli3Fv06Ki1Px7Af8aEeWYkjh7SnRLri/jJN9kUb9JcMH55EyLYN6fy/5O2wHYL5etCYU2909wb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501566; c=relaxed/simple;
	bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPnk7NV3xIdKkR3zQuPr9PzHR5YcS10sTkazhAQ8crb+PTI50+D4tn819LmuDZYyEQXivZfOYN/Ub6su2VrJslXy0y9Tp1WY9c2osEZkMeID6b76MwYSf83YqKzl+Y/dN4zOOjgqo5eUapXeT90ODO0H+tR0h3UkKXDGYkGmgvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VscTdYkK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb7f539c35so1128941366b.1;
        Tue, 25 Feb 2025 08:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501563; x=1741106363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=VscTdYkKeb2wWx34Pxirxy+NzqmZ61DMKSfHAgwBNzMM6uLoxwTF4/MCi5LPUz/zXm
         6Kpzu5ygZq8NiMwzTheRYuVNRhxxXhP7Gf1t9XTDlgRJS9tyihcg3A2zpHNI6oGAWuXH
         rJUvDD4vwybt5bvPxVDsPI1/79E32LDEvGdAsFsBRBTrqdZqZ20ppAgV9Ysm/FpWrORH
         VjsatLHqPNsv/d/7z1nN1bWbRoxEb0DUhOMSQHdWxR8PfzTQYipP3HF1uhFaNet0Ydr5
         aFOz8o+HBNrtTrEyskUySh9RWPM1oVF6/+mIlJ+IXznQ2HEMk4GbKeTCZIjaYBIzebQ2
         nb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501563; x=1741106363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L7W9BAIQ/n8Lu+TgBIRQR0dd3Tfyg7NM8s+Xthj6m8=;
        b=l/wy2aFucT/kxi57DXg9d7hkex4cVNntPzoAyDVqZI8V18UGkAPBWCFfFyIxLXkCub
         tADu4lveb7/b62+GBS5InWiqOCq8I1IGqPBgQZ4CzJO9clgDyrQFAs7SJdfomBcCeRK6
         QOMuImRhVzvrgJlike2HS9Hm4wgUA7yV/fjKfk5a6M2Ap61twt6DlUv3lo/U27GEXede
         cgdvJHOO+rvXd7NuLko3P17nvW2vBpbDzX0k1DkdoR551J9l+MtLE3twyJavF1fr9Tyb
         Rea9VPOLK351XtKw9JSuY/l6widrJH3sc2V/B3DnhgNU1d7IdgtcNhNsrB38eHZSTJcy
         Q8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUIonuYUKZNzpDTomB1HVm80hywz3p+tpIiPYjqvPmTNfCvHzd2e0L0CASjbD8ho+zeQC+ZC7mznWvBKy8=@vger.kernel.org, AJvYcCWbbVNT8O+H9k7eQwPcpaMDRN/GdTmDC0EkocLsqkP2mtu+NqRh4vaYDAzaiZIF0MVV5j35tJaaCvkL@vger.kernel.org, AJvYcCXKRZ6Cmp56gJ4PEDG42PTsuXfKqEFEfqXFVvCaQxBaVEVq3lmFIm5Iwt2GrhqLPn5kj0vWVjPwlUJl/lkL@vger.kernel.org
X-Gm-Message-State: AOJu0YyiyFMVNmFV54GA2bZoZ0+YpXn2d+sFqgKvtSr33hwugi7tvwvy
	0Y9EWYKkLlyjPq3Yygnt30VrB3i6gDNO1vE8YCqq/+34EPbE62/Z
X-Gm-Gg: ASbGncvOvmGRigvVPF6vFtLAudTC0o3rfDftcTjRcTsTvjigfFigpJ1CuWlArvBl0zq
	5Lgmrf6LN+yx5RaHHOfCBM3x3aiterfOa/phb6WLSs0+7z/AOrGFRSrXmf3R3Zd1yDrZI1J8Abz
	Br1H3+rPGkq0Kf81MwpYxrTgFua86bohAoIfexUwXL/LN3LMRTc43uaR80MewXRSvb/b5E16KSm
	ia72OlDbB8gZuY0cI6q8TPu6RX1eK1TLxWVsxA5st1FEhpVTyehFEM9/UwJcyq3Q6OSS8OspzlO
	yYfV31LZGop2qFWb4xx/DRfd
X-Google-Smtp-Source: AGHT+IGFqLVarPqNq0h+fD45GI4cDenqu99NGaHbAhOXptmlUIg7Z1jo1NLhjOHb2uhIYzhg7Ulu+A==
X-Received: by 2002:a17:907:1c91:b0:ab7:d801:86a7 with SMTP id a640c23a62f3a-abed0c7a276mr516515266b.3.1740501563385;
        Tue, 25 Feb 2025 08:39:23 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:23 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:55 +0300
Subject: [PATCH v9 04/12] arm64: dts: qcom: sdm845-starqltechn: refactor
 node order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-4-a5d80375cb66@gmail.com>
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
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1030;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=7nGbNBR2rlmrlKV+/i/enn28MQ/yQq/coI0HrSWcwhM=;
 b=ESFhL/n8h9LwDWDOLkyR+plICHwJlJWkP3u1n27K+lbEzu6ryUCl8zYcd9HR5pnB4Sa2Uk4GF
 DpQ6Ojbqps7CofhhZBwucVhFPPBo2b7tEUVpbkYK+QFMSfVmWT3VtWu
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Fixes: d711b22eee55 ("arm64: dts: qcom: starqltechn: add initial device tree for starqltechn")
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: no space between tag in commit message.
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index f3f2b25883d8..8a0d63bd594b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -382,8 +382,8 @@ &ufs_mem_phy {
 };
 
 &sdhc_2 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&sdc2_clk_state &sdc2_cmd_state &sdc2_data_state &sd_card_det_n_state>;
+	pinctrl-names = "default";
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&vreg_l21a_2p95>;
 	vqmmc-supply = <&vddpx_2>;

-- 
2.39.5


