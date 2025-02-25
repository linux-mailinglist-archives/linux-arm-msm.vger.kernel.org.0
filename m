Return-Path: <linux-arm-msm+bounces-49327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E97A4466F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34F7D19C0CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC6419A288;
	Tue, 25 Feb 2025 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpPJYxp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F071990A2;
	Tue, 25 Feb 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501565; cv=none; b=V8uGTFXJf791mEW0bQvl1ezti3FIrYe6ivBv8aXU9Vdo3RVgphUIPlPgGCkH+tOhQJKYV/9cLjfCZSJJSpfCGDlbz+AOe8fn49+QCXho/UhR++fBcUnyOlW1i0FD40uAidbf11wbGeEKozcokhYRV2Nh4AoxlAE2LUZbgfpKy1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501565; c=relaxed/simple;
	bh=s8D9yeNbQCv2g30M9eXbjNQIQnE1t0x8xMLNaeOtSjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XO87+WomL24Yayf3gzBpGWVBal49RbVUzhVZNGqrVX3b+WJ4ewg+Tt2AOD9z4ByLbqQAq49re7H2+j9JiVk7dVhhO9sfYjSDy8z5jWKsYBRMh54taI4XiywKz9uwrjGruOeQxAmKn8+d5fKbErpuKGBrsU5lInaPeQZk5Lruj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpPJYxp3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abec8b750ebso254206266b.0;
        Tue, 25 Feb 2025 08:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501562; x=1741106362; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6i9ObfepNy3veehtbbhJfycXTaTrD3xqvTIpZCuucCM=;
        b=WpPJYxp3gEi2G8VtrFkq196qiwfbpHu+nlSM2rgB+IoUp13uJQpbX/lldjn8m7pLti
         BzbreY2OqcTgfGnimls2gFiFKt3z073mdam96nZMQS/xfB+cf0A3QtthRU0rxmnQcsWk
         uGFGzl6pHc7qBi3WUA0NXpg81ZIY/B1jpa7NljYYOEYCbVOeqU5diKJ9l/Z1syaI9HSH
         DoeBrDklNdLlg9QZ19/MBnvyT+IRMhwD0NoT1HT/2WBYzlIjdxseWbkR6SUGwmqsVDK+
         mmrb7X9XwrYGbsyAvS5Dhsarch5eePXShmsEoruRwmgGSvRbauGpF7L/JSl8v5yn+bbi
         +SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501562; x=1741106362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6i9ObfepNy3veehtbbhJfycXTaTrD3xqvTIpZCuucCM=;
        b=qxX4cjR7rNHDWqO8qD+9Q9KSeZEnh0PYz7XiI5w7daIZNlcvHsXY8VdZRw+iy3U0BP
         Rj/KW4YnEqyzC5AvFdLZsUmHDozLuJBeF5klZlNA4jnwnGu+Vk1vHbFW+PGtcQkYuDT9
         yb5iKnTrCK/oKt2MVA4pSWkf4i8hZ+iSnYHnRhBvq3gEfRIbA5Eqx9B33zFWqwYSri8P
         OGHjjLkzXPZDselGX/Qy4ZfHZP7Nm5zbUgzmNaCqp0M34tMWufvR89QMY8VK8F9xV/vq
         57iDERTFvrnaCIqr8x5WVvTHnJ/3T3PcTOjUh5KgxTbDbbAhyBoGJV07Rr3eva8DWDhh
         Pnxg==
X-Forwarded-Encrypted: i=1; AJvYcCW8W+7xd2CVcCzan0tUp+6VfIrP0Fm4MT0wt4bG+rHK40ceitgaubjdeQPOYMadWNc3g2jEaSHYNJHbLs/W@vger.kernel.org, AJvYcCWKYSIAgmHRTN9c+Rss+wgt8JeeyjG5mtqNeKa70WY4vd00ir+7T4dEpBHX5Hz1UVmC4Ge47PI5xqxh@vger.kernel.org, AJvYcCWQqj2xSbpaYAP96RRNEBjBhrU94J+FhrsI6+IH/DCzPXNd9KhhSVFWQya1hTHTrDvzzg2fnAL2c330++o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKpDUPY2qxz9EoWMGqn6owD5P0rOjZsfdVRrBg2AqHNzc97wO
	b+LBw6KZwK2Kv0zPhRxD48NFMnDkxtgDAYqRntzEvE/znluF1yMY
X-Gm-Gg: ASbGnctagb0hoXEkT4p0OoV7bpP/fAHe2sKHXFxjI7b0isXPZjGKOdLILDkeykw2cmO
	Izh33Wwam5SBg38IPyLqPooCccqwM8R65uw9bz5HUHkApsu3uvZW94x+s/7Yq2Qle1Pa0qfHLxY
	FH32DbO09gvDlPW2+HyZoXcrZx/oTR6QZkSk1ve8htZCh4BuZRsLEz4L6zEj7h72iJqJiyra9Ef
	2CqpCqrnMojPKLkWLYuE6tlr3LQcB8K+gGQ9T8lMxD43lyDfg1pRMn3T1XwJ4Mc9En+Ev/CmvFT
	xKn7KUlMUuHgJHN+23HczeLg
X-Google-Smtp-Source: AGHT+IGKVDAj+f5zzKFm+z1ubL4lv6/vT9YrWBfDvXr4DT/GklqAw8PEAeUKx0X7eMva7Kdi1x3NCg==
X-Received: by 2002:a17:906:31ca:b0:abb:eec3:394b with SMTP id a640c23a62f3a-abc0de15da8mr1439493966b.46.1740501561880;
        Tue, 25 Feb 2025 08:39:21 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:21 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:38:54 +0300
Subject: [PATCH v9 03/12] arm64: dts: qcom: sdm845-starqltechn: fix usb
 regulator mistake
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-3-a5d80375cb66@gmail.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=1421;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=s8D9yeNbQCv2g30M9eXbjNQIQnE1t0x8xMLNaeOtSjs=;
 b=K65ERSfMCckPtoCsHGDWRRQ6r1Y/CR+bz2qv4/4zofu0rDz6Rw9snW01FHAEklH/QpXKuStTz
 hnhsm4e5cJlAMUo+8LO1ovQMlb1z08K9YsSpKKFLYTJ5maL43WmXM8b
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


