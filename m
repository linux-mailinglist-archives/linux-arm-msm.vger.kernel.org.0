Return-Path: <linux-arm-msm+bounces-56024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DEDAA027C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 08:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 669D37B183A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 06:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D33275874;
	Tue, 29 Apr 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEX7SZIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F61275844
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906829; cv=none; b=eiBHHmvUPoHyEHwDG8QdySMh+j07oqO1QbwZJX+VIAN0jbLr0UIhrtFOYOt2Hy61cFirp4Oz1Jy5hDa2OvqdHjdnuIn187uw0G9bafk3MwsMn2fjH0dKehvavaIzOzhriQ9APRM7iLJLIGWQUEdp0MoptKe44Deok+DN57JymFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906829; c=relaxed/simple;
	bh=W5kC8N4id0jgjxPJzXuRXDTRcStSEatZUDiitY0n/q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLKLVvbJzh9u1GAfv9bLbV+PWEwVkk/7vyeIGtgadfVjPMzsoOoZrC+pzBgiJ6PSE7odRSsm0M3NWHwCa3aBBwRiiaLtk7kWIRyfbw09YxC7qYUdUSD03QGYuPypuhFYYfS34du2ezPamfidM5hnl7LWzAZFUu0bjI0aMzPzDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEX7SZIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4VM006066
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=; b=JEX7SZIHI969GEMr
	JsOaxoBPsOlCLrnFs9nGvRYTDD/3Ov7nOylb7CX3dcX84YCpEBgCyWFf6eTtpLyy
	D5dkvH++tyM3lRlqaCAo6qgsoaB/XoSH6PR/P0bOuDOTQgCz/YvZIOTSXIdjbCye
	KytCGXY89XS/icWX1DvXuNEeBW/0PtE5z/uV19NCbECqllaELKWkGkTcAIBx9ena
	c8+98nusZlRV9SnEV+Na/fQ83EkjAxrwYSDVHrSDS2C/I7doaH+2OvBABtnLsi5E
	bYagRXcYW40cgeOW3nprEM27gk1JykKr8XU5xhzVnbui+gyu7sRpb3HaDet/LBop
	gOmTyw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmkduh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:07:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b048d1abbbfso5536845a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906825; x=1746511625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=;
        b=j5IMkHVpAppsnnvyoulRM1UN2ePfoBX0fkddFNhi4ne7DtMnAFINUzLDDW7fDbFL0j
         pRBb4F+sJ8UF76ECWP9nmvLLM6u501Zw48CiUEEuP/AT2bJyAHosMdHUabypWxwADnvs
         wJS5zjjsZ9JXCMVhwdzA3M3rObsgXI89Z7IwvWqIdH55NCVwG9fP0pBvVwn8R1hlpisd
         P8ij5TgjlrVPok8NkP9/V/O0+Osol/cqQqsWPG+kSUZAkD5S/w/R7FdzV2Ufdum5sWao
         xtP8mZGnCPxa6yXNQhFqcN0h+uc4p+CENSFpex/5KjZIySmumihSvOy25wmHJqVhqdwk
         Ht2w==
X-Gm-Message-State: AOJu0YytDBLu0S4gc0zwOhv8z7tK0N5dvC15nOTf4QZbyssie3iM8bLU
	/uV4J3LL6kIsXibus3F9Ym5qcbHc0/uBwZXH0jahCvMc4k9seYj7NT5dXFlMhAtIpAnmQAfxQFq
	2zuJkl0nPlc/e14VBFWgYZvQhZmft58I95pJJisJiOFIX/quWuPns92S9bTp9jmc=
X-Gm-Gg: ASbGncuECOgC5WhrKGYiLyH6eneONeFULBoLbeTSbLYQaD5+OZd0dG+VT/H5xh0ekuw
	1GmrxDhxJJPwuUW0AnqKcEGpRYL3ALBs2IT1gaacel3cVO/s8jv2adZniMmLHER7wdR0OuwbQjy
	UVvZeDigT1uydbacKvDPfECZ4V2MFEwOBfX5V4uO872ej9KtPS9j1bchq1t3N1tUySDq1l07OpR
	s1gXM7OB4leOYMiwZXfjI1Ay0hBcdhW4gu9Loqfh+IVPnLgOAkovJOk4DRRHhf886xRVjng/lKo
	EWgNuL2ejr/EQXEqqyNEaxRDNYkG2/h2+uWKGOfoV5ppqsoZFScFUvid7F6BTCzgYz/1/+k=
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2046a4660f7mr17453246637.13.1745906824829;
        Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGglvLAHgrOV7iGI0hyH1ZbjgDlYIBAPRGE9nqhg3e33A4GqQ2E/mk1KOyhJNYbdwEI3f1mQ==
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2046a4660f7mr17453225637.13.1745906824454;
        Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:27 -0700
Subject: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: 4Al_cq5OjOiwLfAuLWYUCMCKTo8uWXs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX/jEpBq4W5TWr cFFcKTq/IPHV2nIhYR7AAf4JfSJO5oxkFYMcXDkr/vV0GqkvaHA6hCa3YstQzhipAgweK7SwLrt zBWP3PcYdwvCsppggu++32xGLZr2mS2lh7tXj7s+pshFzywEa65oCHzy4OvkeL56TCBAz1iQEL4
 zvrUsnc3E1rjUdbjloAUi8k7rTy234NXhZvG4Z8+4IgbPyPjVHrcaQxaEzKvbIvPGSouUo2gbwR hGVB1WLXAbg+wbkTWTCQpxm1o8VK+dBeZEvaAWQiZLQXY8Q5UAIb81w/jpWZ01zdkGg4n1Rn95Y FkROs2Zg8pMZe9ycH0SLnE/quFf/Pv/HqZapbW7uemAYYV77WHxbDr57pOVTPxVii8XtSqe3Hjt
 SsbntFqd4APYe7E09QyiQfgvi9xyBliXhyfTG/Oza1BY4TIZjN/55XAM+qjCU6IVsKNvJB0F
X-Proofpoint-GUID: 4Al_cq5OjOiwLfAuLWYUCMCKTo8uWXs8
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68106c8a cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bff1b0d3306e..9fd5f900d327 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1631,7 +1631,7 @@ int qcom_scm_shm_bridge_enable(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle)
 {
@@ -1659,7 +1659,7 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+int qcom_scm_shm_bridge_delete(u64 handle)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..548dbd346b1b 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -123,9 +123,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
-					 ipfn_and_s_perm, size_and_flags,
-					 QCOM_SCM_VMID_HLOS, handle);
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
 	if (ret)
 		return ret;
 
@@ -141,7 +141,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index bf5e64f6deba..33fde08dce70 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -149,10 +149,10 @@ bool qcom_scm_lmh_dcvsh_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_enable(void);
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #ifdef CONFIG_QCOM_QSEECOM
 

-- 
2.34.1


