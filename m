Return-Path: <linux-arm-msm+bounces-20435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B478CED54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 03:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752521C20BFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C5615C9;
	Sat, 25 May 2024 01:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="REz7ibVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C614691;
	Sat, 25 May 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600449; cv=none; b=lPZAlWEDXEM7fh7CAfmmOhxy2ytmMyL36n7lHuL2Ps6mpdtfpHYWHv9ICi8MHW3GgM0jjVb+vh+mH6/S9963j5wsyzMWPcqlboQv0VxBPnyM/ZQutIefG0wibJyrtBEeKgwivFR9RyNmPDRzH2nMMHy5xMjJuarMauUK3EdcKnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600449; c=relaxed/simple;
	bh=FkwkASqB3cRXCEhQMG6vEeh/3/uMYorqiOd/Zn6CrbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hEQYfPz4mK6cW5RY4fMLHQmzGDKEu4az6HkexWvvbkFhIPYTeB22Cl5MABsah39Zjv1vP+OpsKtObD7l3UtP3UxmqhJUbOhxcqpLo3oEity8ZAHhXsAu7fjhnpq8VvAEAzXdWzK5XUcBNiduvbK3DfSURWim8tHDqSIbgy3kEAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=REz7ibVW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ONrcUu032220;
	Sat, 25 May 2024 01:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yTW8DHaNxhYF1Xw0z/Qzt/6oIOzzX3XqPz4X1I5PqWE=; b=REz7ibVW7tW/GhrF
	y61QqXmOPJy1KVcQINL41tWj9Ll03Pfq+ah8EU6YCsTm64XCE0xn7imiyeIBT2Jl
	bUL5VQ05p3pmrQcDTPgLGOt+9Q4zO47k1ipSiHeAkadd/xkWQznoHczeqTpiilzO
	bRMyImCNy/RMGv3lyBEj6UzjBBAvirVxjr4Xb/1uTEGHdWhxxJ5P/zAsHTSeiVMU
	ieq+vY5njarpHEm4V5eY2wwCgDcKkwitep0uCHjZMtDwccwleWgqzGA2vUXZNs0l
	es8kCLGfW/A7QG9XRD6yeDKfqNrTUCfQBqbMkb0YcbsOSawE+0+z1aVd3n1sA8i+
	3Av0eQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa96ks3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44P1Qxc6032128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:26:59 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 18:26:59 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Fri, 24 May 2024 18:26:42 -0700
Subject: [PATCH v2 3/4] soc: qcom: smem: Add
 qcom_smem_bust_hwspin_lock_by_host()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240524-hwspinlock-bust-v2-3-fb88fd17ca0b@quicinc.com>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
In-Reply-To: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716600418; l=2323;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=FkwkASqB3cRXCEhQMG6vEeh/3/uMYorqiOd/Zn6CrbI=;
 b=9xM3ISGsuLP+9KZaUJo5PUZ7pe/V7CaSv5tB+c+qDY70w/Ah80i26W4t9UNbFAWsSBR3Qt0Ep
 hpO3W8aa+KICpLwE7alb826Zdf4O0wJRzu6kByVhyF8T/E4iz2GhoUw
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hDZLuump4_X2MHPI4FTc__WJADaG6o_X
X-Proofpoint-ORIG-GUID: hDZLuump4_X2MHPI4FTc__WJADaG6o_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405250010

Add qcom_smem_bust_hwspin_lock_by_host to enable remoteproc to bust the
hwspin_lock owned by smem. In the event the remoteproc crashes
unexpectedly, the remoteproc driver can invoke this API to try and bust
the hwspin_lock and release the lock if still held by the remoteproc
device.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/soc/qcom/smem.c       | 28 ++++++++++++++++++++++++++++
 include/linux/soc/qcom/smem.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 7191fa0c087f..683599990387 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -359,6 +359,34 @@ static struct qcom_smem *__smem;
 /* Timeout (ms) for the trylock of remote spinlocks */
 #define HWSPINLOCK_TIMEOUT	1000
 
+/* The qcom hwspinlock id is always plus one from the smem host id */
+#define SMEM_HOST_ID_TO_HWSPINLOCK_ID(__x) ((__x) + 1)
+
+/**
+ * qcom_smem_bust_hwspin_lock_by_host() - bust the smem hwspinlock for an smem host id
+ * @host:	remote processor id
+ *
+ * Busts the hwspin_lock for the given smem host id. This helper is intended for remoteproc drivers
+ * that manage remoteprocs with an equivalent smem driver instance in the remote firmware. Drivers
+ * can force a release of the smem hwspin_lock if the rproc unexpectedly goes into a bad state.
+ *
+ * Context: Process context.
+ *
+ * Returns: 0 on success, otherwise negative errno.
+ */
+int qcom_smem_bust_hwspin_lock_by_host(unsigned host)
+{
+	if (!__smem)
+		return -EPROBE_DEFER;
+
+	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
+	if (host == SMEM_HOST_APPS ||host >= SMEM_HOST_COUNT)
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
index a36a3b9d4929..959eea0812bb 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -14,4 +14,6 @@ phys_addr_t qcom_smem_virt_to_phys(void *p);
 
 int qcom_smem_get_soc_id(u32 *id);
 
+int qcom_smem_bust_hwspin_lock_by_host(unsigned host);
+
 #endif

-- 
2.25.1


