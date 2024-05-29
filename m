Return-Path: <linux-arm-msm+bounces-20995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A258D3E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289691C2376B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A355C1C0DD2;
	Wed, 29 May 2024 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ub72SK2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D37C15B57F;
	Wed, 29 May 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006220; cv=none; b=gR4Bk8pnziz+EYbGy+7rmlc4dUSSePlLACSr2dOVkDHzyHAAtmPpezHVo5yzMXpnwq4xu3WDeQU1yAOunxyttd2zjxVPT9H0HEWJkgxgcmaWR8sgdYDVakck1ynJ17hRvd0js6hR6Rn3z96EOF2HhlR+HAYMyc3WJrg/utZ4nTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006220; c=relaxed/simple;
	bh=mOSE2ntqu4Rot7ryHq21ynAVLd53KCm+8J+0kl8CtRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OKQIuK035r2K+FKedlFaqmIZ/VaINL+SYU9j1nj8hgtER1iQDPoV/9WPgP5l/VN68KbsFkfKxbTjaK9S1wVBEKI3rezIYuN6STJIFGUnNaqQxxovizjjxfJ2awN/WJOCsqvLS2tOVQBxiIpqtPsz4y77scBaN4cytipzLqtgoqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ub72SK2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TEoGDg021695;
	Wed, 29 May 2024 18:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B1bFvicHobFbigotDFpVBAah8hOJ3e+zH7AfuuLx4GE=; b=Ub72SK2OLkSM4mb8
	+cpuicCTh5VeMzK5T5KVBU8f+20xbPJVmYJ3Wk9Fu4o87h6YJBnhlUWaEhXnC+K5
	NvOB5jBL6aod4lOjEtFwwUYgc5zwe1izrQoRJNb1ModnfiyUBMfzPSH4AwXVhv/Y
	XPmmo8tyxL3zlIatK4oiNQS9inXMFaa+Zsri3he9ic0WvrLtiAJhsWovWLIaPxGI
	DCgXnyehPo1lb9XOsmdP7E34SsuRI3jfAcQMycuJ95Td9U+CX+vfgs0Ov8mdDrik
	1w3vsv0Mks4jhWHDYCUMblZVpCRuw6LINhMq8ibS3sOirfYkRq04fTn7wA1NDdJ0
	A4kCxQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2n1sw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIA0V4023051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:00 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 11:10:00 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Wed, 29 May 2024 11:09:57 -0700
Subject: [PATCH v3 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-hwspinlock-bust-v3-3-c8b924ffa5a2@quicinc.com>
References: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
In-Reply-To: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006199; l=2281;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=mOSE2ntqu4Rot7ryHq21ynAVLd53KCm+8J+0kl8CtRg=;
 b=J5VmdTHtRwClyZU6R0zZg0eoETdLuXbAjOGrMLgKrap88rP1pHlEGdeovFeMqEJrq6N+CZGMU
 HKCFy7uVx+eBmqM7ESQV2zcRa3v8ATJOk4WgmWJ/FyDarrtZ+EY8bD7
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OBXwHtGWxJS7lzLEBCf3flCeqnFuNAXD
X-Proofpoint-ORIG-GUID: OBXwHtGWxJS7lzLEBCf3flCeqnFuNAXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290127

Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
hwspin_lock owned by smem. In the event the remoteproc crashes
unexpectedly, the remoteproc driver can invoke this API to try and bust
the hwspin_lock and release the lock if still held by the remoteproc
device.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/soc/qcom/smem.c       | 26 ++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f..50039e983eba 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -359,6 +359,32 @@ static struct qcom_smem *__smem;
 /* Timeout (ms) for the trylock of remote spinlocks */
 #define HWSPINLOCK_TIMEOUT	1000
 
+/* The qcom hwspinlock id is always plus one from the smem host id */
+#define SMEM_HOST_ID_TO_HWSPINLOCK_ID(__x) ((__x) + 1)
+
+/**
+ * qcom_smem_bust_hwspin_lock_by_host() - bust the smem hwspinlock for a host
+ * @host:	remote processor id
+ *
+ * Busts the hwspin_lock for the given smem host id. This helper is intended
+ * for remoteproc drivers that manage remoteprocs with an equivalent smem
+ * driver instance in the remote firmware. Drivers can force a release of the
+ * smem hwspin_lock if the rproc unexpectedly goes into a bad state.
+ *
+ * Context: Process context.
+ *
+ * Returns: 0 on success, otherwise negative errno.
+ */
+int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
+{
+	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
+	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
+		return -EINVAL;
+
+	return hwspin_lock_bust(__smem->hwlock, SMEM_HOST_ID_TO_HWSPINLOCK_ID(host));
+}
+EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
+
 /**
  * qcom_smem_is_available() - Check if SMEM is available
  *
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index a36a3b9d4929..03187bc95851 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 
+int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
+
 #endif

-- 
2.25.1


