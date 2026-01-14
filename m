Return-Path: <linux-arm-msm+bounces-88990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F15ECD1DC97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 11:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1CC2304869B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAABC38A2B4;
	Wed, 14 Jan 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cL7NMaB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C5F38A298
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768384867; cv=none; b=dlrtTk3v2tSIp8GokgOVZEla7sQksYwYmcW+fvDqkJfwcTlQywVOtZY6hvV6GtJtn/wyke4VACu3UnyTZjrmxklUUR2unFx7s/5deNj3Bt9W4qmip3zL4CIQQhBeDiXrLSPwBEjJF3lzICoxYBMs5EvX1MADuudPJOlHvPYopeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768384867; c=relaxed/simple;
	bh=RQLnPkVxpfBC8YhtW+fdxh6hSyY4AvRuI89iOEYCL9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oUjAZ9Eml/f1+QHeNetQMuGO/5Uwun/LcX5NCvjWk5AnBFjXCgJc4SSvJ/vyENMA+6p3bSSa5QTCdLRbhBphPDjnYn2CfbygGNOHiB7FC2qfunMJh/Bv+nM6JFjUs4uiud6WI91xlj44eObSjlLOI/sSxz3mz0El7p3E18rzEzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cL7NMaB/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c0bccb8037eso3621895a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 02:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768384864; x=1768989664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDxrVoNnGJMRmN+HZCVd3oASR4RQUtdYi/trzibhYB0=;
        b=cL7NMaB/mBxze+802mYX2Zf0xePmeLJgzbijopqtS07OoVDEkv5nK7FetJf7gGhjQx
         2MPnZ8QCmwAHTKObNcNWGaYkRTiLnt0/DwmyeNt6NtzHWQMjwMvbCXv2OeXOs70k6rDH
         Bir8Paj/bZJvi0cUDoSFWAZ/4wcZI8TCxGVzsIUv+n+Wr6cz1sPCPpd2safGd0cKyXkd
         pWMvKUUhsLG5WX8Ygw4yUBtXKRtWDJMGk/YtQ4QuG/M8saWxsZF/SY2rZPagYMtbnC72
         9VPNTIWcKLNKFaRsv1xfs/Osd/KeJbCy6C/sFEM+cm9q2MHgU0X/VMoM97ItLcJVrH3s
         0MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768384864; x=1768989664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDxrVoNnGJMRmN+HZCVd3oASR4RQUtdYi/trzibhYB0=;
        b=oTGiT7aMzjiYdZVybq7P4Shez53bESCHPl29GOYW5GOsjmbUmZcdEPAxc58spTmkkO
         Uodz1nicF4QnMdOA035yvyntV/yp7PiucrKPxD6BnL8hodc/P31q8UT6AWjRGIv1255T
         LMOj+MnXtgz0btv8fuyS5SRTj6uBIpj9dk+I6Yzp0tVkOxeF51pHbaNbecWZzbu19Rll
         Cnxy8gY93wKl9E1ED6UY0B9QVIF/G1aAFvzr0FMszaKOUxz8viHKY5G2GZoVtDc/YmBL
         CTAmAr5kXjQFNUqQPDWJqLNO2y+PxatU/sZv6Ca3TQsynorVH7T44vG38g7GVuTcU8gH
         Knpg==
X-Forwarded-Encrypted: i=1; AJvYcCXuVncDVO9kMrjpd7rRLOMd4pJN786mfKL2z46q7Gw9c+9Wh7SMpzdTubCpPkSvraqwyyN3MmQRle4diTea@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9bxIaATU065xHYBohplSfn2JiXdv/imeDZUwGTlbmO+gzrR0/
	/y3hf7+agmgoKcvkqqhyLYOrm/zIEA3fIyT92gM1WV5AeeMstMoYjYwC
X-Gm-Gg: AY/fxX7x7FZpTKFfQY991ncaRhlkXgxO9M33U1nDUPpWOSgAt/VK1ml5jUvW8B2r4fO
	ur23v84QuajYjt6hcPtWKIBWPpOcdBK8Ff4D5rBBKET/yEOQYoYfjOuabBKLVuCR8iCiZUDOl/N
	oETztTEmbwoqQa9ynXv335zglacL7/EBEczYmOQrVUUtYW46dr5ZNLrH8+1drTJ4lT8exzFQTX7
	GwIbb7kImaoOfsPUxZxhK77WnkI4SfVwk0meCzNKrqqmUWbs9aU4z+Y5ypgxTs4CkrbLDTdjbNl
	mDqA86+TfRHtctdocePS+KhiKPzTMQF+LAYFpTvIMFvP3aqHPKmrowL8BdyIk3frvxPw3NUCPqu
	eMJnOmMjTE9vURPZECv7QmiF5WonwwhwdMUnepTszcj4oeV2ZDDOzmZlA9ZkPhgpzdPZe8cZ4XA
	IUkAdzdptaZE23Ql2EmJ2d3ucMiMpwrd+wGti9
X-Received: by 2002:a17:90b:5808:b0:340:29a1:1b0c with SMTP id 98e67ed59e1d1-351090922c0mr2365401a91.7.1768384863605;
        Wed, 14 Jan 2026 02:01:03 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109c78f20sm1522043a91.13.2026.01.14.02.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:01:03 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v12 2/3] arm64: dts: qcom: talos/qcs615-ride: Fix inconsistent USB PHY node naming
Date: Wed, 14 Jan 2026 15:30:42 +0530
Message-Id: <20260114100043.1310164-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114100043.1310164-1-tessolveupstream@gmail.com>
References: <20260114100043.1310164-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB PHY nodes has inconsistent labels as 'usb_1_hspy'
and 'usb_hsphy_2' across talos.dtsi and qcs615-ride.dts.
This patch renames them to follow a consistent naming
scheme.

No functional changes, only label renaming.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 2 +-
 arch/arm64/boot/dts/qcom/talos.dtsi      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index be67eb173046..0ca6b50a6de1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -609,7 +609,7 @@ bluetooth {
 	};
 };
 
-&usb_1_hsphy {
+&usb_hsphy_1 {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
 	vdda-phy-dpdm-supply = <&vreg_l13a>;
diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..c7dc507a50b5 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -4304,7 +4304,7 @@ osm_l3: interconnect@18321000 {
 			#interconnect-cells = <1>;
 		};
 
-		usb_1_hsphy: phy@88e2000 {
+		usb_hsphy_1: phy@88e2000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x88e2000 0x0 0x180>;
 
@@ -4412,7 +4412,7 @@ usb_1_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x140 0x0>;
 				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
 
-				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+				phys = <&usb_hsphy_1>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 
 				snps,dis-u1-entry-quirk;
-- 
2.34.1


