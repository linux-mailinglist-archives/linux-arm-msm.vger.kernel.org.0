Return-Path: <linux-arm-msm+bounces-20997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A198D3E1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 340191F21464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364971C2323;
	Wed, 29 May 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="p0tWw72F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19551C0DCC;
	Wed, 29 May 2024 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006222; cv=none; b=hj010PddS3lcQBCtllsMDwJ4e7DXgF50ALihFr13yGA43+QEMuqGBBerH8HGuqVjYdFAkLX8cBtHAon/jau/z0CEAPw0+ys8Zg4NCP39dsJFgYb3Fwt9tFAAFoYIVet4uE407r0cW/x9o04m3osp3rqql/p4ceN3zmWOcyJGfoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006222; c=relaxed/simple;
	bh=U8zNeyBZ2/k85kcSrtkTjJBXpZlYLrDaA+wZkSc1Tk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UjhyKBzFZOJwqzABirCXJGSYezQXMRAwkQDmgMrN/p2h2fxiqIza5qc5wrJ0vbFrAM1D4dVz17X0Ox3dqJDu+9pFuCipVGjBwkWs3hzsU6RoYB/7ziz5FQljLwqV4aS8l1eVuGAJ4fyvj7qhJ/NcT9saRdRevbXm6zQqKdoKiSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=p0tWw72F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9qucW012513;
	Wed, 29 May 2024 18:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o++/LFsFJU7qKLCW6Zw9bAt7A393Bq5rYwa053ro+tc=; b=p0tWw72Fl32uUNhq
	s6Eq79YBe73M7lbenOzWVcCZYrPRuGTI1CnlUtCnB9Yc7x+XKPsWeErjBs5iqNo/
	UC4O3/xTPAh3I53+4ysBpK+kiKv8uCmO+6e2ZfajGNjMr9EtGDj5YL9wt7nPEHB2
	UMb7FvvEoRPRUeG77RwldynRsdnJ6RG00xBp/Tri0qQTY0hRAqpPUEuwt9CtzeQ+
	zLBusNSq91zfdMqpVPOc6Bd107unfDdfEhq2Jm6f9HotNrdPiaqsBZ0o3GMnOXni
	COJPCmWJFNdGu25WRMgIr4+ecpNCjhGv2uc0048bKV25uCSpYRHRt/j7iU60RZxc
	tvXvEw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qhurq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIA0Zw003974
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:00 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 11:10:00 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Wed, 29 May 2024 11:09:56 -0700
Subject: [PATCH v3 2/4] hwspinlock: qcom: implement bust operation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-hwspinlock-bust-v3-2-c8b924ffa5a2@quicinc.com>
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
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006199; l=1530;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=mmkPN43S9HCXd6+6jOFUT/6hMs9iDUCiyyz1fShSCPc=;
 b=ltIJvzIIjKUAYZzm1HLMnw4x+GwkDr0kod2QiaGQp8Tlh2KV0QNtAklJkGaP9yelpOx+JX4Tw
 qwLZaDHNz43DmZYmwhDIrij+pWqq+Nodr1glbSesLR0lwb+Wv2p5pGz
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bgVoQ_XHxHuMiFm8ZUnjoiYulu5l_YMu
X-Proofpoint-ORIG-GUID: bgVoQ_XHxHuMiFm8ZUnjoiYulu5l_YMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290127

From: Richard Maina <quic_rmaina@quicinc.com>

Implement a new operation qcom_hwspinlock_bust() which can be invoked
to bust any locks that are in use when a remoteproc is stopped or
crashed.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
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


