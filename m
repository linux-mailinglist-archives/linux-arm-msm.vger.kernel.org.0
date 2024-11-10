Return-Path: <linux-arm-msm+bounces-37433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BA9C3403
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 18:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40969B20E39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2024 17:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E04313A87C;
	Sun, 10 Nov 2024 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSd3Bk+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9D428E3F
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731259894; cv=none; b=hfc2e46FrnupaGeQuvhxKsVOuU4oR7wuV6DUh0L3gKoczibwK4It60hEAnlvKlHL/Rygw7sD4y6SLc5R7Vv+hAYjGYhX6U5v0vl7399uZPGfDPZsto+A+XknEBuqkMRUPKNDzm7+tcYF8+6TAywBEp0liDIuskThuKQvVRnDtmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731259894; c=relaxed/simple;
	bh=Ymx7b4ET5m2fXGDSh9PEJTqbvCXruvCcSdoP3K8SO1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdo8DHNpTtQMfEEGQgwq0cccdd7gepLWn1eF/tir0OLqJLeAaSgRiUcIqxJXEYO50b5sg7krN6lt7SxX241Jepg1wY0ulmgJKpbGBrwi4GRVGdPzkSbdtarvIPNbbSpKf6w0eYra2egaeFXb5wgr8/0MTjge2hqwJ3TLvWqCklo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSd3Bk+t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AACG3KG019073
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDVsgHpWJZrDPd7tzC/52xPrPEQni9rmQ2rmOcUChH0=; b=FSd3Bk+ts9eGLPfC
	DcgT6I4PwDXEbblMdiIS5mzDEwwvhHVidw904GD1Z1DP3CBNZIlarJsQIF0FS9zc
	YujYQo790YegeBherIV7c723N854nFuca/stOCnyyt7FL4Tnb2sM4xOxwaquxhpV
	3N5A81mhjZJDugq/4YP8yuUd0D5pty3Gex+pcUCc+ECNKSi9OaNc7p7FmV7PZDUg
	hOS+pJprkQWMGZBQwvOFggIRCosk2QHRabKVwDWc9mS0MCU3p/7t0666JOusA2TF
	avLL37UCpgMcRKLCHpc96aKU45SiAdU3GxrdKC/deMw5INouFOyd/qkuASKa0ZQP
	EgQEkQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sy2fte8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 17:31:30 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3e7a207b659so329057b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2024 09:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731259889; x=1731864689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDVsgHpWJZrDPd7tzC/52xPrPEQni9rmQ2rmOcUChH0=;
        b=Mg//lTwnGsyGAtr0eHVomhVfunMsrqiuVZ7CKlshRmyS4czunK5eo9V/HUfwfZwPW1
         dGdgJI7O3laCqUA3womahiP89T5Kyr41Y+xEy2rT4EaHv7n+UkGL0kPH/+Ba8EbV0X13
         OiODatGJ0Y92qp+QPbzpezE87085ojqIDJZh+pcTMzSR1XJAz0IakexMFeFX5NY7XS9R
         lOcMREXNffnu4YMsdldUV8TPNrzI3+9oLkjTISg+crtRmWK/p3AY9hgX8Lu0k+6VUJU8
         wKIvohPcZE/LgwN5sNXUDMf5EjD3KOiGVbwVUM59JIz5YT+EXYS8wxzz8A0gwJdQOWTS
         USkw==
X-Gm-Message-State: AOJu0YyUDXabWQVJl1YDpqThdDxlzPY5GOf1AMASudwbQp9crqgUa4Jv
	PPh2hbkAGLP+F5vfJber38Bvq8gZRKWOT4l8j6GMY+izbLDDbBwI4n48zjzAPhg/HtcCKXq3JF6
	ESOTHwXKKt4cx0XbGJrceFlKPbWdDgJ3Uv9Izwu0hxcdMC4u2GwhIeWCfp3i4CWOy
X-Received: by 2002:a05:6808:15a8:b0:3e5:f534:ddc4 with SMTP id 5614622812f47-3e79458571fmr7289414b6e.13.1731259889624;
        Sun, 10 Nov 2024 09:31:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9x/ontOKcts+Is/U+2t9TqMQGunWKkBFJEewMaYowQffhv7Cks2K44liEz44MkOXkRvvUdQ==
X-Received: by 2002:a05:6808:15a8:b0:3e5:f534:ddc4 with SMTP id 5614622812f47-3e79458571fmr7289394b6e.13.1731259889348;
        Sun, 10 Nov 2024 09:31:29 -0800 (PST)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cb53843sm1718506b6e.0.2024.11.10.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 09:31:28 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 10 Nov 2024 09:33:40 -0800
Subject: [PATCH v2 1/2] firmware: qcom: scm: Introduce CP_SMMU_APERTURE_ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241110-adreno-smmu-aparture-v2-1-9b1fb2ee41d4@oss.qualcomm.com>
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
In-Reply-To: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ymx7b4ET5m2fXGDSh9PEJTqbvCXruvCcSdoP3K8SO1c=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnMO55btX8IAy4a8Ps8jm1mcyAIijZJlXl0rxEM
 G5SZ8nZj2yJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZzDueRUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXl+Q//SrsN92I1RJso7hHjGCArHy7CLVvdiOLTlraGIsu
 YhGsCJ0+MnFC3X9kHio5IERohIM75fFWymNYCK4xjd8b+fna/pDbAmGVfZa5RDuhyCSknZeUR/w
 OKIxpVjMUDGvcvEsfwrUGZMAdXdawWf2KH+MS8Tdd2/JkG36oZVokhc3uWZIsgFzBP9qFO0jRxo
 gfDElGSMhXU/LtpmGUfrDcdBVCvH7DK5ByP3FmzqXkOE6QdodtA4dN9UdBZBTcaTV8sz94E37gZ
 FVVH0WSOh5y376PzEsuSZDMmiNhS15fPvNMRsR8AlzueXtk4SEXb/SrwC4wIPYU69JsdjCFySIX
 nv7rt1VhiP1mJ84d2wEgsFbG4IRyl1oT6qWkRMwOwQkwEdU2rCsgq7Zf3Mlu9BhLSgc5sFOf/dp
 1YIhGZMGafKR6dg+xwo0tGbbuWJfFjAQjdfujX0RN7oG0CZyKCIrz+LwBxdH/lV++IEMFC8qu8A
 WMFvXIrMHWirQ5I3QInw/bS8ZAwWT7y4HPtryTvgq+DGOyNs27XfSl78hOYCwIRKhnuel1noeY7
 iqmewbF2tYqX2GyQeT/EeVN1gr0s7DzbqSkolB3oTADqlK4LDKbLg9AyLW5kyBETiBGi6IiP3Ti
 E5p+3iToZG1poyNlh+0s4RPnGh2Ql1AS14vXLfwEnsk4=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: 5msTYIR5hAnKeMzFjMbK8k2wEXDcb_f4
X-Proofpoint-GUID: 5msTYIR5hAnKeMzFjMbK8k2wEXDcb_f4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411100155

The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
which is used to trigger the mapping of register banks into the SMMU
context for per-processes page tables to function (in case this isn't
statically setup by firmware).

This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
bus error"-errors from the GPU.

Introduce a function to allow the msm driver to invoke this call.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 95815e64e1e6..72bf87ddcd96 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -904,6 +904,32 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
 
+#define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
+
+bool qcom_scm_set_gpu_smmu_aperture_is_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
+					    QCOM_SCM_MP_CP_SMMU_APERTURE_ID);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture_is_available);
+
+int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
+		.arginfo = QCOM_SCM_ARGS(4),
+		.args[0] = 0xffff0000 | FIELD_PREP(QCOM_SCM_CP_APERTURE_CONTEXT_MASK, context_bank),
+		.args[1] = 0xffffffff,
+		.args[2] = 0xffffffff,
+		.args[3] = 0xffffffff,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
+
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 685b8f59e7a6..e36b2f67607f 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -116,6 +116,7 @@ struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
 #define QCOM_SCM_MP_IOMMU_SET_CP_POOL_SIZE	0x05
 #define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
+#define QCOM_SCM_MP_CP_SMMU_APERTURE_ID		0x1b
 #define QCOM_SCM_MP_SHM_BRIDGE_ENABLE		0x1c
 #define QCOM_SCM_MP_SHM_BRIDGE_DELETE		0x1d
 #define QCOM_SCM_MP_SHM_BRIDGE_CREATE		0x1e
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9f14976399ab..4621aec0328c 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -85,6 +85,8 @@ int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
 
 bool qcom_scm_restore_sec_cfg_available(void);
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
+int qcom_scm_set_gpu_smmu_aperture(unsigned int context_bank);
+bool qcom_scm_set_gpu_smmu_aperture_is_available(void);
 int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
 int qcom_scm_iommu_set_cp_pool_size(u32 spare, u32 size);

-- 
2.45.2


