Return-Path: <linux-arm-msm+bounces-62692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BAFAEA951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC6BD4E1979
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 22:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7C2609CC;
	Thu, 26 Jun 2025 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4mwL66U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519123B634
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975456; cv=none; b=TjGmmhkgrkPinkHw0dFJ9se1QE5CZhpPaRECgFfrKwfpThj3b60J7Vrp+ZX7R2TKj5as9VWp1fEARCsXVTtkB4jVvju9DGjWC3QYlwkB09nraenLABBaszw3mUcSHPn+/Sje6UKe8xsDEPojp4yez3onzakBbPK72oXrqmEuIxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975456; c=relaxed/simple;
	bh=F5IYy4cmMBguKcSDW0BM36DAl0X+/fc88lPmg5dCLPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MB8K4pH5zeRsB9EWRLxUpB2tU8+1QqMrQI/H2SwxOhBcxZVKDMHcGn/YjfMYDGBtugk/4kthMo/XzB7XRRyi5+XHVKxxaunxF6BYFFLez3oJ3odiPwgp13qQTqus2siAJywFQr6iQw/5DH8paxMjVnue8mO4NVTp/GjJXL9WYmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4mwL66U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QAD8QO013231
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9dmaw90E4pEEbiq12Lrd4X
	abTCOJ01ZXU6bGtKCQq3M=; b=R4mwL66US1gtMj1/DFSRhjrZL6/AUsKMnbIXFX
	gZAnSunv+O09S9AlfAKpEMZSt7E5sXeViBtJnXGwzVbaYXJbj8yECLOM2daFdzfu
	cIvIpkbsg7upjlX83d+qXZvtfgm38uAfhsqjFkrkZdHVHLm6EmGFPL3hNLt4P5Fv
	XXfNhbs23JP8oDv+d8hb04t5mR8M/b3x8ejgW2MY9seiTdzj9cZ5aQatz2D0QB7Q
	5hhxq46BmgK0f0tDBOSRnqSV/4WOUr4m3E0DduuDrByJZF8zo9Q9Xd40B8LTg8n0
	CM+1+gxczXpdfejfsh9TcuVo0i2vlG9RNsNzhf3YorLgiHvg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmpfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:04:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e4637739so980241b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750975452; x=1751580252;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dmaw90E4pEEbiq12Lrd4XabTCOJ01ZXU6bGtKCQq3M=;
        b=ld9W165aMyOs6CeiUjhgL2f39PdlcKxtVkz/z0Kra6ujK5UVf9oQj5Z16XEa8UZ5Wd
         2IXhBqNnUwpogKVDf+SES+64MEDnHktj5fK8mNmi6dtLApu4VE2R7CEzINjgyFLYc1MJ
         ZKHMFDq/dkoJMh5Tbs4uaz7v9itzWdLEu64Mo9R5WEN8udpWiic/DgmyrsHFHk5uNepT
         cCjeLSdCvXBGnkRMvjzrpCbUeiowUKCPAyEGWNj8UQ/SqJ5f7yEBt73Hi2RS5QgQCgad
         USpGhjs4vTTmpM2w50ofDiQMD/zTJZjP8127BCzNLSJ8HlOoJzUPLR+h+uFcBvpV4W+7
         3Irg==
X-Forwarded-Encrypted: i=1; AJvYcCXen5bCbNZonxR0J5e3fCZZQurIipVa9uvXLFdgLJz/vjzRGSVtqdzncev5Ke2kMocFkrK5E/+Yo13tOi07@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3+dQ1nU6ajwvVgBG9Sk2xtpRWP0A6EmqP7Uc3wvAUizqSi7C
	lqrlvFgAI9LRv2TefOui/Zzj0QSvnCraj22lQ7tyR/mRWB2DO+2h1eVcPG8UV0E9NHg2/H9rZAg
	HQHyhZW6GI+tcof+PfsgnXAb9u0lYhy+WNN/Md40UOU32/2dW5Bwk5XiRAAZIwqK/4qsl
X-Gm-Gg: ASbGnctXs9xLc6rFxDh51cjDOJu6XUCu1nZH8D95fJyuChl37Ko1dFuoq0Z9uf6pcAo
	yIvXexlk4XzpnxNR0r4wEvnyWda1dGB9Zqt9XhregAfqzgYh4vqeYTv55WfByT2o5lBh2eVvi2Q
	d3U4HUPJ4qyl6D07MVhQUiQnHULwj8dUW45B73ukOsFaI6p39d5URCxLxtC7CjFzcJvuPUJF1oU
	FFNaEdoyD9OSDK8EzxEP+LzT8ouVs4+v2OCL8zCyzXCTfKbCbG2dFIwQtIdEqdF9VV6YGVA/k1p
	lD+qlOChYFt0YI2rMGR1tZrBGYknfw6cNqvUZp86jE+C3IF5CHtU1PzUiNRV+EmQPL3szQVAyOO
	rZXYebJaOpQLc/g==
X-Received: by 2002:a05:6a00:1805:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-74af7ac66f3mr773375b3a.9.1750975451742;
        Thu, 26 Jun 2025 15:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXxm0cezmtqfsc2fx5y4kmADgyiNhteaBe9NWccndIndzoU+fGn8WVXOn17o7QceBr2P27vw==
X-Received: by 2002:a05:6a00:1805:b0:748:a0b9:f873 with SMTP id d2e1a72fcca58-74af7ac66f3mr773309b3a.9.1750975451009;
        Thu, 26 Jun 2025 15:04:11 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31c39fbsm67442a12.42.2025.06.26.15.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:04:10 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 15:03:38 -0700
Subject: [PATCH v2] soc: qcom: llcc: Add per slice counter and common llcc
 slice descriptor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-llcc_refcount-v2-1-d05ec8169734@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALnDXWgC/13O0Q6CIBTG8VdxXIc7gJJ21Xu01tgR8mwqCepqz
 XcPXd10+R/jd743izaQjeyUvVmwC0XyQwp5yBi2ZrhbTk1qJkGWoEHxrkO8BevQz8PEjTg2rnJ
 1ISWw9OeRXui5e5drahd8z6c2WPNTCgFQibrQSucKjiXUigs+zoS3OV3sCNvzVjRgjr7f0Jbi5
 MNr37jIjf7OEdXfnEUmq9LQaHRSWbBnH2M+zqZLVL9713VdP+/KeL/2AAAA
X-Change-ID: 20250603-llcc_refcount-a17df8f94220
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: quic_satyap@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750975449; l=7453;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=F5IYy4cmMBguKcSDW0BM36DAl0X+/fc88lPmg5dCLPg=;
 b=BAp41naQ/5goDp3xupieXX5yiG8lwyZMBVESPlH9NaAHlYkqG0nAXFg06Llm/BwsG8P/+6PBd
 tvHsN8J9UtRDNZiFYIMOaE02oZBuXszbttVOCzFMWAVzM7H6HDsShC+
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-ORIG-GUID: xok9X_oW5HA1Qr4c6wrCgMJ5zJwstJwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE4OSBTYWx0ZWRfX4H4nqD3AnfuR
 hBmu5C544H5+2V6IhNmkVEGLtGNVFH4lMzFSjaVGQlM35uRUOncScX6OwC3ldRWe1Bkmfr2bJfk
 nNmwoZM2YLZo4iM3Bc6gg4V/m0ujdBqyxLRlO+TodEpt5kQqIg342O/YGQn9dDiB/9Yo69gFxei
 7OqSJHXx8IxkmQcPo/xIOcjvdL2nYRzcqIO9wwLrC+0XuO1oQM3hDNAagHqQg0cW0EDSTjg7XeP
 sD2VOvXOxer/ed3/qzXAXOYeagvw7UeDSPs+AhYkhGB4AxHOrfjJkNL7Y/l08eofb5d7VpWHgpz
 acb0WDV0XNxpiII3Pxxm3uJlQxfv0llMaJ2lW6X+ZJzqc+Pb7di5DsG5F9zozRaZA1J0xL2KNeF
 rcOqn2fIwDZrNJ3WHjrK6KaCi+6tBy2BoBjnGS+8u05Zct9kq0nPe6/rk9atZjLNExDZWFXc
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dc3dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=fYkwATjXo-BcwxWzYOsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xok9X_oW5HA1Qr4c6wrCgMJ5zJwstJwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260189

When a client driver calls llcc_slice_getd() multiple times or when
multiple client drivers vote for the same slice, there can be mismatch
in activate/deactivate count.

Add an atomic per-slice counter to track the number of
llcc_slice_activate() and llcc_slice_deactivate() calls per slice.
Also introduce a common LLCC slice descriptor to ensure consistent
tracking of slice usage.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
Changes in v2:
- Dropped bitmap as refcount is replacing it.
- Modified commit message to explain problem first.
- Moved NULL pointer checks to the beginning in llcc_slice_getd().
- Replace incorrect usage of atomic_inc_return() with atomic_inc().
- Use devm_kcalloc() to allocate memory for common slice descriptor.
- Link to v1: https://lore.kernel.org/all/20241008194636.3075093-1-quic_uchalich@quicinc.com/
---
 drivers/soc/qcom/llcc-qcom.c       | 60 +++++++++++++++++++++-----------------
 include/linux/soc/qcom/llcc-qcom.h |  6 ++--
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 192edc3f64dc3eee12ab5ebdb9034cd0e2010891..b0cfdd30967a1a3390a9c0ef6bc01b333244884c 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -3853,30 +3853,25 @@ static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
 struct llcc_slice_desc *llcc_slice_getd(u32 uid)
 {
 	const struct llcc_slice_config *cfg;
-	struct llcc_slice_desc *desc;
 	u32 sz, count;
 
-	if (IS_ERR(drv_data))
+	if (IS_ERR(drv_data) || !drv_data)
 		return ERR_CAST(drv_data);
 
+	if (IS_ERR_OR_NULL(drv_data->desc) || !drv_data->cfg)
+		return ERR_PTR(-ENODEV);
+
 	cfg = drv_data->cfg;
 	sz = drv_data->cfg_size;
 
-	for (count = 0; cfg && count < sz; count++, cfg++)
+	for (count = 0; count < sz; count++, cfg++)
 		if (cfg->usecase_id == uid)
 			break;
 
-	if (count == sz || !cfg)
+	if (count == sz)
 		return ERR_PTR(-ENODEV);
 
-	desc = kzalloc(sizeof(*desc), GFP_KERNEL);
-	if (!desc)
-		return ERR_PTR(-ENOMEM);
-
-	desc->slice_id = cfg->slice_id;
-	desc->slice_size = cfg->max_cap;
-
-	return desc;
+	return &drv_data->desc[count];
 }
 EXPORT_SYMBOL_GPL(llcc_slice_getd);
 
@@ -3887,7 +3882,7 @@ EXPORT_SYMBOL_GPL(llcc_slice_getd);
 void llcc_slice_putd(struct llcc_slice_desc *desc)
 {
 	if (!IS_ERR_OR_NULL(desc))
-		kfree(desc);
+		WARN(atomic_read(&desc->refcount), " Slice %d is still active\n", desc->slice_id);
 }
 EXPORT_SYMBOL_GPL(llcc_slice_putd);
 
@@ -3963,7 +3958,8 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
-	if (test_bit(desc->slice_id, drv_data->bitmap)) {
+	if ((atomic_read(&desc->refcount)) >= 1) {
+		atomic_inc(&desc->refcount);
 		mutex_unlock(&drv_data->lock);
 		return 0;
 	}
@@ -3977,7 +3973,7 @@ int llcc_slice_activate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
-	__set_bit(desc->slice_id, drv_data->bitmap);
+	atomic_inc(&desc->refcount);
 	mutex_unlock(&drv_data->lock);
 
 	return ret;
@@ -4003,10 +3999,12 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return -EINVAL;
 
 	mutex_lock(&drv_data->lock);
-	if (!test_bit(desc->slice_id, drv_data->bitmap)) {
+	if ((atomic_read(&desc->refcount)) > 1) {
+		atomic_dec(&desc->refcount);
 		mutex_unlock(&drv_data->lock);
 		return 0;
 	}
+
 	act_ctrl_val = ACT_CTRL_OPCODE_DEACTIVATE << ACT_CTRL_OPCODE_SHIFT;
 
 	ret = llcc_update_act_ctrl(desc->slice_id, act_ctrl_val,
@@ -4016,7 +4014,7 @@ int llcc_slice_deactivate(struct llcc_slice_desc *desc)
 		return ret;
 	}
 
-	__clear_bit(desc->slice_id, drv_data->bitmap);
+	atomic_set(&desc->refcount, 0);
 	mutex_unlock(&drv_data->lock);
 
 	return ret;
@@ -4060,7 +4058,7 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	u32 attr1_val;
 	u32 attr0_val;
 	u32 max_cap_cacheline;
-	struct llcc_slice_desc desc;
+	struct llcc_slice_desc *desc;
 
 	attr1_val = config->cache_mode;
 	attr1_val |= config->probe_target_ways << ATTR1_PROBE_TARGET_WAYS_SHIFT;
@@ -4209,8 +4207,11 @@ static int _qcom_llcc_cfg_program(const struct llcc_slice_config *config,
 	}
 
 	if (config->activate_on_init) {
-		desc.slice_id = config->slice_id;
-		ret = llcc_slice_activate(&desc);
+		desc = llcc_slice_getd(config->usecase_id);
+		if (PTR_ERR_OR_ZERO(desc))
+			return -EINVAL;
+
+		ret = llcc_slice_activate(desc);
 	}
 
 	return ret;
@@ -4360,6 +4361,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev,
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
+	for (i = 0; i < sz; i++) {
+		drv_data->desc[i].slice_id = llcc_table[i].slice_id;
+		drv_data->desc[i].slice_size = llcc_table[i].max_cap;
+		atomic_set(&drv_data->desc[i].refcount, 0);
+	}
+
 	if (drv_data->version >= LLCC_VERSION_6_0_0_0) {
 		for (i = 0; i < sz; i++) {
 			ret = _qcom_llcc_cfg_program_v6(&llcc_table[i], cfg);
@@ -4525,17 +4532,16 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 	llcc_cfg = cfg->sct_data;
 	sz = cfg->size;
 
-	for (i = 0; i < sz; i++)
-		if (llcc_cfg[i].slice_id > drv_data->max_slices)
-			drv_data->max_slices = llcc_cfg[i].slice_id;
-
-	drv_data->bitmap = devm_bitmap_zalloc(dev, drv_data->max_slices,
-					      GFP_KERNEL);
-	if (!drv_data->bitmap) {
+	drv_data->desc = devm_kcalloc(dev, sz, sizeof(struct llcc_slice_desc), GFP_KERNEL);
+	if (IS_ERR_OR_NULL(drv_data->desc)) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	for (i = 0; i < sz; i++)
+		if (llcc_cfg[i].slice_id > drv_data->max_slices)
+			drv_data->max_slices = llcc_cfg[i].slice_id;
+
 	drv_data->cfg = llcc_cfg;
 	drv_data->cfg_size = sz;
 	drv_data->edac_reg_offset = cfg->edac_reg_offset;
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 7a69210a250c4646b7fd6cf400995e35d3f00493..6badd8343619dd65183beb57a0195e3258829a2e 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -80,10 +80,12 @@
  * struct llcc_slice_desc - Cache slice descriptor
  * @slice_id: llcc slice id
  * @slice_size: Size allocated for the llcc slice
+ * @refcount: Counter to track activate/deactivate slice count
  */
 struct llcc_slice_desc {
 	u32 slice_id;
 	size_t slice_size;
+	atomic_t refcount;
 };
 
 /**
@@ -143,10 +145,10 @@ struct llcc_edac_reg_offset {
  * @cfg_size: size of the config data table
  * @max_slices: max slices as read from device tree
  * @num_banks: Number of llcc banks
- * @bitmap: Bit map to track the active slice ids
  * @ecc_irq: interrupt for llcc cache error detection and reporting
  * @ecc_irq_configured: 'True' if firmware has already configured the irq propagation
  * @version: Indicates the LLCC version
+ * @desc: Array pointer of llcc_slice_desc
  */
 struct llcc_drv_data {
 	struct regmap **regmaps;
@@ -158,10 +160,10 @@ struct llcc_drv_data {
 	u32 cfg_size;
 	u32 max_slices;
 	u32 num_banks;
-	unsigned long *bitmap;
 	int ecc_irq;
 	bool ecc_irq_configured;
 	u32 version;
+	struct llcc_slice_desc *desc;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)

---
base-commit: f02769e7f272d6f42b9767f066c5a99afd2338f3
change-id: 20250603-llcc_refcount-a17df8f94220

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


