Return-Path: <linux-arm-msm+bounces-52700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4BA7428A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 03:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6094617AEFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 02:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263C42116EE;
	Fri, 28 Mar 2025 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KS0qkpGe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EB521129B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130111; cv=none; b=HeO+OO4vQsp6/0D6PNdGcy/y3ng74DItw9yKahOtE7U4OFdt7AVRD2V6jD/m02r/dp+gkMSjoXEz5llFf1+tp303ut0xuodOaFmguOmIxnho0qqiHk3pBInPepHWGLg3eYcEa5XIjMfMA1YHo1krkHRTeqMJWOZiIYY9gUEEFmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130111; c=relaxed/simple;
	bh=W5kC8N4id0jgjxPJzXuRXDTRcStSEatZUDiitY0n/q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rq9TZ34iatcb/l4THRlE54z+Se1wFs0sOEvftKc3xb7aunbMdD0jg18alewP2N5JpZkc1TStbZF2Ett+1s4TK2ovlfeq+q/ZKNrBthyIVezPztPndXNliZBj89j/s7oHHs/EUs93Ql7e7c5WjdpqfKWBsrrKVOb+FDzYCwFZozc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KS0qkpGe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S1UOJM016998
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=; b=KS0qkpGedDkfnD9q
	iHhjTBtFeLbu+FUieXhj31uqFKPJ7vkXBDmjq4JDe7T+hFCGZ/+FKhvmCOO7oQh4
	v0CNWhfScup9nlXiQhiO5wwebZGPbWPE7eH8Q5/fMx4tRn+YSz17Yocl6slscUnN
	xgXAl7pIg84GImek1Yo+VDpkUkljF0e5IxjkLgdkwjek8lXNwGs2wVVBF81A+Y8J
	/Nr/exn4FOXWKcRcRAHuXgI07nf3PQsf6k2DE+7L2II8qIB4o/lH2Ceo3eG7KEGv
	bCqAGQj7xWdbHWGRp0I488sbvgXDK7+/7+yg4z4KHxX1Wn3ukI13eGOCulTTC+6T
	77APkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nj5q84xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 02:48:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2254bdd4982so40378965ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130106; x=1743734906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=;
        b=k7/hKHnnroTJvEf3Fb8TcBW1I5iVOV44W+D7hFC/lCAuWm3Xjm4Bjz5Yo2tGJMUomr
         C7Kj5MLEr5OcsiW1iUQAGfMuTKsoIjxcZOYmbz2Lmm3ZCfecYeORgoR3DZbyHim3BMRA
         AjXycb06SYyj8GvCkzq8h7Y0GmaqWepn9ZpUEyfsJ1gLyiL6H8CDj7NMpWHBg9IDoFTw
         IuxewnRZVkPDs58HQFFtq/UJPaceF2H8zLIRew2tU559K0IWlkyW5QMLlWMCwxxgKDPL
         saRsRJYPBsWpSSIrvqK1Bg1gyFUmiof9nQnf9q9nPCQqR70DXBHAyPCzF88r8kKTxtcH
         ay0w==
X-Gm-Message-State: AOJu0YyNN9wAGemztkTz7WY37N41PC/bZJ5/juWo9Sf1B85guJCPydoD
	14cZxfMDc032zYq4Fg53Ca/AAz8mtWhF2TdbZWMWzQdT7RRbTdtTfYnMdq5h13+7cYp+2vqdWuv
	9JRZBV4h/dau3n9k3gP6OZJYbxXER5hq7/9+YRqn7CAkp78B8s/0JfDscX7tGWB8=
X-Gm-Gg: ASbGncuP9jdVIVjcxcNA4PZJPd4R4mLh0iHjebK8F98q4eXL7+tz6igDYwfmUlPRMA5
	dLLdTYgGzqmrbKguorWPOulKdfhcdTqscV2b2DMB80AKQqq4Yl3Mq2JcW75+RhcshwZL+VvDF9x
	YFdIxOq/o/wS/451xFeWDix1SnH8zHLTpeJejIckaBk7o+W0LkZNleHQVU39xOQ/G4f0BXVR6uW
	1TmaL1bq7fIyVpdjFpD6RrmhY1pTO2wpsFzq789ALqw6/zGAZhr/bYrJkZvQnsKDM7vJjrO+Xyn
	md0HHzyYTMqAOO7DIhZteQcF2GXhmWKXdD9Q3YEzgItIBFGyqcWGCCtzava9c7sTMYEVgScrefA
	=
X-Received: by 2002:a17:902:e550:b0:223:6180:1bea with SMTP id d9443c01a7336-2280495ab8amr85453155ad.37.1743130106357;
        Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFShwsFTfsJxmTJGL4N8BJKEZBwXtBMU0nJp4MUGaWH7L96V2az8sO9lR6b8vk3uaylU1opKQ==
X-Received: by 2002:a17:902:e550:b0:223:6180:1bea with SMTP id d9443c01a7336-2280495ab8amr85452815ad.37.1743130105801;
        Thu, 27 Mar 2025 19:48:25 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:25 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:28 -0700
Subject: [PATCH v3 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-6-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
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
X-Proofpoint-GUID: Nyz8T3Uz2FEI34UzTCrHZFc6UVZCJ6vG
X-Proofpoint-ORIG-GUID: Nyz8T3Uz2FEI34UzTCrHZFc6UVZCJ6vG
X-Authority-Analysis: v=2.4 cv=Gr9C+l1C c=1 sm=1 tr=0 ts=67e60dfb cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

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


