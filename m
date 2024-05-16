Return-Path: <linux-arm-msm+bounces-19958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C3E8C7EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 01:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A2191F22887
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 23:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB72345014;
	Thu, 16 May 2024 22:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FSlGAyhS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5A339851;
	Thu, 16 May 2024 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900388; cv=none; b=dQy2P2Zym/O+kn6+0N+V/DZvZK4couuJK6Y0Txj3ltg1DzE+MGBRN1HsE5UDUe2qZyYLxBk8LpMh/b6+Jw8rz3QUcD2xX7/PV76FCLYO78ec0+9wcEIPeQffYxWKh0sBhxEMrVdCcqtPNoArluPiIj8nW2if2cYAAgl+fWW+QN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900388; c=relaxed/simple;
	bh=J6E0L17paEd5vpzM19w830w8zTXJU6s5lgFNGXm//VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qmjp+ARVNeUpdwTQS6a+Hk5eeIxeKQWwFIh/qJvrPgYzSaMr0nJ7bnjZb0OTBgHoi8WFiypbwlzlpPjsJ78txiBY6RVw+4K3suA8qAowUVYCu2tW7NuNCV+xxNlbXTiA/7wiu/hgBPwrM/DnqkgEmuWZooF9u22siyy4232EUi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FSlGAyhS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMZdU032375;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=/zdoZNB4RTlTnGJPFMGMflVxQ51a9uAVHfE7re70Zco
	=; b=FSlGAyhS2m6GVr8I333HUNiFfSC9Tm3SktSqdPvW9kbwj7wXsy0BgL2/IM+
	+GRLvFZTWLCSeCLBvdWvhgc5n/1K8HWpsJxLx2CI7cL/q2JyFLZi7p9ZCG4XD0dx
	CNr4hw6jKlzwF+Y6pTsIe5tz4fcKAeUxnmaZ1B3xwrFCWFuIQXUmVDW+GnVUEx1t
	961oX2RlGZ3zZsbvphtjQiInyOvLBHDl9H6L7+ULWuZkhW4eiRl4oFvZhLMNusq7
	a5Yk/a62Z1dyrTVxN0ZeCPw2tU3FcsHC6q9jd9OAwh2vjzCA3dGUy9H7eZJBX4Y5
	bXRGVGWNtxTIOPe6oRU/tNTB46g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51qwp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6K3012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:06 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:05 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:22 -0700
Subject: [PATCH 4/7] hwspinlock: qcom: implement bust operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-4-47a90a859238@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
In-Reply-To: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
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
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=1477;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=wAIBLz79oU+HMe0nEvSY06pTxUYumh72NBIpfI/lgYU=;
 b=83cIDkF8UXNnS3E2bHOU4diNvXnLNe70xrXuI/bUnQZDxF4Kcfwnqp6l0vit6FpcwjwtBaV6c
 M/70kCm74UkAl35VQK49CgKdomcgxdc6ldo0zf1xbjSSKH/GirwW6+e
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GCWT5pLJhjQEC5gxfU-6FehkVa4Er55I
X-Proofpoint-ORIG-GUID: GCWT5pLJhjQEC5gxfU-6FehkVa4Er55I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

From: Richard Maina <quic_rmaina@quicinc.com>

Implement a new operation qcom_hwspinlock_bust() which can be invoked
to free any locks that are in use when a remoteproc is stopped or
crashed.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 814dfe8697bf..0390979fd765 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -64,9 +64,34 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 		pr_err("%s: failed to unlock spinlock\n", __func__);
 }
 
+static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
+{
+	struct regmap_field *field = lock->priv;
+	u32 owner;
+	int ret;
+
+	ret = regmap_field_read(field, &owner);
+	if (ret) {
+		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		return ret;
+	}
+
+	if (owner != id)
+		return 0;
+
+	ret = regmap_field_write(field, 0);
+	if (ret) {
+		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct hwspinlock_ops qcom_hwspinlock_ops = {
 	.trylock	= qcom_hwspinlock_trylock,
 	.unlock		= qcom_hwspinlock_unlock,
+	.bust		= qcom_hwspinlock_bust,
 };
 
 static const struct regmap_config sfpb_mutex_config = {

-- 
2.25.1


