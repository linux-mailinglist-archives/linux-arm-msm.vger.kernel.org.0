Return-Path: <linux-arm-msm+bounces-11917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3029285C4FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 20:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BFBAB23F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 19:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0116114A4EE;
	Tue, 20 Feb 2024 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ulZyEFKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0614A0B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708458134; cv=none; b=bCZfg5sukAlxM3N29IBDHFf++kKWAdWz158o2H90+G8hYaDg3dmGjTqFPO9baP1g3liifZc/nWN0++fLBzol3swB46cjDLmSOYo5HXb1UgE8F6syg4N/Tn0NVrBQhDtpaRzQk/buuWmXHEXJEJ3nFI5hA0NxUKuIJwQkKIWXKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708458134; c=relaxed/simple;
	bh=yQBgEnrWranhXHywY9vHSFkYnjxSnFo7XQhXssWBUOQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCgRWQd5QohhQ2oIlN1nYpJfAYekS+UtNd/Cms+b639VE40bPaBProCKGQBDcHlZkUapqkilhLMChvyKosu1yiWPnK/29Idbmk13f7+lad1DXGe/JONnzzK4xCVo1I99bi9VU6gJSgBI+WM6A5VQ35Y+r7QpDIBmakALELSVyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ulZyEFKD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-564d9b0e96dso1105833a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708458131; x=1709062931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cefndWnWlnkZu0zNS4lBmKWOmQgRBYbwHHR9OgxN/iM=;
        b=ulZyEFKD6EPf27y05QZ3LdnwJ07SFgl1obyqPg/5878LsqSsHR99WSsTmWPIX+tCNH
         EyGlIpH5WBPO5sTzkBUX7+bDahtyKN5NfqpOZUwBZzBiT5ZuR2x5+/th/IhnTT0kGvpP
         AnVTFFv3FPOdwlLBQ4nTWdDQkNh7+gFH3tBftaKNmOupOM+YSumQcdcPgcaGrE4De6r7
         rI/QnyBPZ4voZd/trwgMD5fLoc5OgSBEvM0A5anVIqH9UsgAv5pTauc+tKHO+s20NsG0
         33QMW2xVMg6UGo/j0KQ6u+HTovQLzsk76phUtIQ84k3Bk3QVoM0ba4Y/V7v9LKRnjp/T
         asXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708458131; x=1709062931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cefndWnWlnkZu0zNS4lBmKWOmQgRBYbwHHR9OgxN/iM=;
        b=BSuyXDw9Dx1wY6CMyNfBfV3Np8brGt7fgpNAYXKsaHnEt095GMS0ZJHf/j+7dM/d9Y
         yF9+57e0NAktnYVc1JLcbUNSGLs9e6QB34hUMlwisSjsBe0Rzrbffvm6yL1HVTBd22w9
         86/+dTWrJARM4iFLGY3eXVMynEIStvrz3pjQQOrXJkEBuaup/L2pQRc8iubAM80lTvjN
         FMJS66rrYTxzW2up0ZmI2tOWmI/kx9WjONg06pHb1NF9ZZar+MSgfLOHYaeG6MbysX01
         N4B19w2kAwIQQXNtcFZiW9Mplb9E3dMsQQR7JAIMe1z1vhaX4A14nXXGkysb4Md/ofIr
         fODg==
X-Gm-Message-State: AOJu0YwllrrxmQPfE2GG0+aiVviLGpGEbelCg1kV1Jcnszk3FF6RrXYA
	iNXqyBCNZ5JPYiheRDNFviNd+NiebFCrHwiJcniy0mrOVmvDwap0BWNY19aB4Co=
X-Google-Smtp-Source: AGHT+IEtjwCmpovASOnB6ht4Cb9s8ZVZmZ23IvkA7IzyoWIKe2E8Gd17eQwWMGmW5yPmB3Ifhco4og==
X-Received: by 2002:a05:6402:1812:b0:564:aa72:78e1 with SMTP id g18-20020a056402181200b00564aa7278e1mr3009925edy.9.1708458131663;
        Tue, 20 Feb 2024 11:42:11 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id c1-20020a056402100100b0056486eaa669sm1906822edu.50.2024.02.20.11.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:42:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 21:42:00 +0200
Subject: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for SMB2360
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-phy-qualcomm-eusb2-repeater-smb2360-v2-2-213338ca1d5f@linaro.org>
References: <20240220-phy-qualcomm-eusb2-repeater-smb2360-v2-0-213338ca1d5f@linaro.org>
In-Reply-To: <20240220-phy-qualcomm-eusb2-repeater-smb2360-v2-0-213338ca1d5f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=yQBgEnrWranhXHywY9vHSFkYnjxSnFo7XQhXssWBUOQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1QCOsvpeA12TseJU8wVK6azL/7odjn1y+z4pT
 hELsVlbi/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUAjgAKCRAbX0TJAJUV
 VuTJD/40UpHjsGTXtRxxlIRAU8T5L1PPlX6WdB5ROP8vudqC5CxUzRmQYXquNv1WAYcjt4lepgB
 MNAsAvmyzZ568/HeFBxszkWIZfHvF/um6yHxJVlh5hqsGH5Tx7JxpevML/WRe3VV6+g1j5Ht61D
 LvR2D2AA/aCuvYWri8iYN8FZJTEyyb+/kyYHhyjZfntShlLL5lkspnlRTG12LYbvdJ7rG9WE8rp
 HSy3uWvpR/iLAhxdErvUKUv2aiSqHp2TFABI/mYgZ1lKoD6WY8NolxNEiqrWQezJ7g5aj+cRUoD
 RiluT8lbRHMgf+8rrLX16DhfmKgLRTd465f9LxSge0zog1Lapt8RULuDSDYbRKVPJEONcHxzeIE
 SSPd77bxXYxjzJcB1SwiIX6bZ9XOmLPJ33r3KhzTNvCrkiZ684uT2wLRNI70olqnBE1vNl70AI3
 0Bg4ENF0XyzKbtF4RhinoDaGh9ttP4tSgZByp3gZBotHVqJJRM8Ka8AHu8l434s0Uk7ggYJuF8C
 9QFl+6CMN3R8SmnrvDJefbfXnnHj8tySYDJMR3B3XjUut8dRHlZAsPP9kwH8G2cerbrz5HXh7lY
 7TeyQNCrHiBm+d62DUy39YDVkaxQm9auYx5/+5eM3nTMXTPCyvODgmrwbhlh2p9GbcxkavHseG+
 FcBCArxwb8ESl/Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The SMB2360 PMICs contain the same repeater as the PM8550B, but requiring
different settings, so add dedicated compatible for SMB2360.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index a43e20abb10d..68cc8e24f383 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -88,6 +88,12 @@ static const u32 pm8550b_init_tbl[NUM_TUNE_FIELDS] = {
 	[TUNE_USB2_PREEM] = 0x5,
 };
 
+static const u32 smb2360_init_tbl[NUM_TUNE_FIELDS] = {
+	[TUNE_IUSB2] = 0x5,
+	[TUNE_SQUELCH_U] = 0x3,
+	[TUNE_USB2_PREEM] = 0x2,
+};
+
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.init_tbl	= pm8550b_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
@@ -95,6 +101,13 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
+	.init_tbl	= smb2360_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(smb2360_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -271,6 +284,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,pm8550b-eusb2-repeater",
 		.data = &pm8550b_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,smb2360-eusb2-repeater",
+		.data = &smb2360_eusb2_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);

-- 
2.34.1


