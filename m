Return-Path: <linux-arm-msm+bounces-19957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C48C7EB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 01:00:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7DD21C214E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 23:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71C03BBD6;
	Thu, 16 May 2024 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AOQtd1TE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB702CCC2;
	Thu, 16 May 2024 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900387; cv=none; b=H4ZIWSZxdlMhjI+moQ1cDyHfZ4GT/57qb+cU0G8gcSnTbaQUFISIp5BmXNzNdR+VipqQ5MnHLPw2gUdRPiJwg2wZy7DW9utzoA/9/KyV2yqaxmv/q+/SKSAlQ+7/ItrtXtqot2n8vi7qlQg73ebusi/RDfOj7c8cc23Hg28ZOtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900387; c=relaxed/simple;
	bh=ZPDmk7U3xa9ciGMMpt439g4ATxp4CcHH9SRjaxdv558=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MGQSuUNnhwolx/1NppVqRR14M5q9qDRMfatzdq8Iu1fA2YptYxJfCECeHNeD7M7BAVZQuQQhkRI0RxI70rJ1McDkU3VV8ewHQ3UbiHJCFH9OA+V4WEIK9qhFHnNc753cAhAWvCR4VaQBLKF3D/eeoM8rpo5TYA4bzbpw9/MTSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AOQtd1TE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKN4lX017831;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=xXHsiv91PwjlPs1MvcU7cM3/qVstxKwE0iOAL5DZUek
	=; b=AOQtd1TEoccPpx3pzv3CNzvdR0U4M5myJRc3hLbi2J5bdkXwmoZiXGMqQOP
	SqiDXHdpljQYmrcaCrC3WFqidrNnGLBnpaCwiQa6/UiCjTKrguKG0t0eI2FbN0Yn
	4zC8XFr+cQuyveGG4dbfyL1LCDMWPXDIFCgkTDC/xYmKDKpAyGYwTu2uJWxDzyJu
	5G4O77CRvc2hBG9j4ATkxPWpGsgxBd4swEgTTzsEhg7IqBFbM3zcfWhkqYQX7igu
	JMGCVk4XULdTU0/DZbdHReZSkHSu4aSVaE/6pvUp34lgFnzlXDYv8ztp1cpwzD8u
	imxle0LPmXFFcU8fw5TEZywlmKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y5c05t5dj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6K0012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:06 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:05 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:19 -0700
Subject: [PATCH 1/7] hwspinlock: Introduce refcount
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-1-47a90a859238@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=2718;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=hLiGXwK6/eMJFtwZ/h8OJhnWXPSq0ajjAK8+KrHxcRc=;
 b=XUGEroFrF2iuYIvReZr/iR+0SeLZ7IJdNaNVHw3QAwF6yauJa3LcNrBP+WETJgxZQTOm4UhxO
 4SuRikBC0ZlDOWqM1zW7mA2HtY038BudSe5ERhOTdvfgbCnfbRr2/Xy
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6WbZUnFuNARMRCh1Ki0bUX_R5fX01YI6
X-Proofpoint-ORIG-GUID: 6WbZUnFuNARMRCh1Ki0bUX_R5fX01YI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

From: Richard Maina <quic_rmaina@quicinc.com>

Currently each device receives a dedicated hwspinlock that is not
accesible to other device drivers. In order to allow multiple consumers
access to the same hwspinlock, introduce a refcount to hwspinlock struct
and implement refcounting infrastructure.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/hwspinlock/hwspinlock_core.c     | 14 +++++++++-----
 drivers/hwspinlock/hwspinlock_internal.h |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 0c0a932c00f3..29b33072ff57 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -428,6 +428,7 @@ static int hwspin_lock_register_single(struct hwspinlock *hwlock, int id)
 	int ret;
 
 	mutex_lock(&hwspinlock_tree_lock);
+	hwlock->refcnt = 0;
 
 	ret = radix_tree_insert(&hwspinlock_tree, id, hwlock);
 	if (ret) {
@@ -671,6 +672,8 @@ static int __hwspin_lock_request(struct hwspinlock *hwlock)
 
 	ret = 0;
 
+	hwlock->refcnt++;
+
 	/* mark hwspinlock as used, should not fail */
 	tmp = radix_tree_tag_clear(&hwspinlock_tree, hwlock_to_id(hwlock),
 							HWSPINLOCK_UNUSED);
@@ -829,12 +832,13 @@ int hwspin_lock_free(struct hwspinlock *hwlock)
 	/* notify the underlying device that power is not needed */
 	pm_runtime_put(dev);
 
-	/* mark this hwspinlock as available */
-	tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock),
-							HWSPINLOCK_UNUSED);
+	if (--hwlock->refcnt == 0) {
+		/* mark this hwspinlock as available */
+		tmp = radix_tree_tag_set(&hwspinlock_tree, hwlock_to_id(hwlock), HWSPINLOCK_UNUSED);
 
-	/* sanity check (this shouldn't happen) */
-	WARN_ON(tmp != hwlock);
+		/* sanity check (this shouldn't happen) */
+		WARN_ON(tmp != hwlock);
+	}
 
 	module_put(dev->driver->owner);
 
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 29892767bb7a..12f230b40693 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -35,11 +35,13 @@ struct hwspinlock_ops {
  * struct hwspinlock - this struct represents a single hwspinlock instance
  * @bank: the hwspinlock_device structure which owns this lock
  * @lock: initialized and used by hwspinlock core
+ * @refcnt: counter for the number of existing references to the hwspinlock
  * @priv: private data, owned by the underlying platform-specific hwspinlock drv
  */
 struct hwspinlock {
 	struct hwspinlock_device *bank;
 	spinlock_t lock;
+	unsigned int refcnt;
 	void *priv;
 };
 

-- 
2.25.1


