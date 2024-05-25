Return-Path: <linux-arm-msm+bounces-20436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4878CED5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 03:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE3241C20F89
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858444A1B;
	Sat, 25 May 2024 01:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h5YAdNSj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53A94688;
	Sat, 25 May 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600450; cv=none; b=kX2G69EFS39KyeQIDENu7hXs3uVZ8cCxBK5+skPHs9dOhvvFZjpAaKjhfFiFkWltv0avR9MtzC/pxudir3vYWGr/vvzD6WT3pQHahYx0AJqsjGtmqLyisgU/IMJJ1DsH9vzxBTLiExaO+XgDxs8wZT8Z7gC1FhAk9v+uqzgjHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600450; c=relaxed/simple;
	bh=oGr4uY2GTmJNOi8NND3J+BEHA78ow4LocYOritNm9aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DgKcpZUbqL7bI7IOdzbRFQohokpT9RKooR1Hl/cPOF3EGcfCdmBudC6PCs/ilvtaz97KNlVpVGdrtnFBWSQMQlsloazn+msnEha6BDexGnKUvn9U/8LYfx21pa2EKI5M2O25MK06y3CF50a3RamYH6EeLNXs9z8rO6BOlldcS9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h5YAdNSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44P1NaTs003963;
	Sat, 25 May 2024 01:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LWRT2GlQG6QgFfsSVZSnyPvn8cETLtzqRJr26bLr4fU=; b=h5YAdNSjGpdy6hzs
	FFQwdVPRrKTFZHaKV+/lp0PocxChCxUNQEcgyQYJEmhiS3U8yvb3tThSaJ8W7KRh
	mZJrmVlcwVqDDk4foGc/Yc1YvuUbUGkThnsdj1eGP3KVEOJKahm4TdlTyCncsR+0
	8g/Af6NcFD8FxjQk7riXgAKIrKqMEr+nb/Lnl/YXOSCfipIf+bfb8dhLJi6mMNV9
	bAC0O9pswuRfEYrfG0MdXE6OHPKKNY6fCV3dZnSt3Og6j+1085Y4qDDyqegestJ1
	Sc9HduLMMf9vaN8ODm96F7iS0QY3KwBaHvvJX5wbSlCM9pJ6UVvreAfnMtYw1ilx
	jiA7Zw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8k3pvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44P1QxuR026319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:26:59 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 18:26:58 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Fri, 24 May 2024 18:26:40 -0700
Subject: [PATCH v2 1/4] hwspinlock: Introduce hwspin_lock_bust()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240524-hwspinlock-bust-v2-1-fb88fd17ca0b@quicinc.com>
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
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716600418; l=5095;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=q4xVZjavTkorT8lY9Lzg3Rsu0INrOCVJpnlNKtqizbM=;
 b=Rj4eRQ1tnfKR4Jm30fFi0Wa5MN6iR5G5OLNTu61biNA2Ih+bWuQG16l7/Q6prBns3z0AcnLQi
 KTjBlWunSx5ArkORS/F1NzN448IKCjDHQ03Y5pTV1wbE8/NGqdRuMEP
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OEKY9ZIK4tf_2O9UgEsID1brhYtfDAIk
X-Proofpoint-GUID: OEKY9ZIK4tf_2O9UgEsID1brhYtfDAIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250009

From: Richard Maina <quic_rmaina@quicinc.com>

When a remoteproc crashes or goes down unexpectedly this can result in
a state where locks held by the remoteproc will remain locked possibly
resulting in deadlock. This new API hwspin_lock_bust() allows
hwspinlock implementers to define a bust operation for freeing previously
acquired hwspinlocks after verifying ownership of the acquired lock.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 Documentation/locking/hwspinlock.rst     | 11 +++++++++++
 drivers/hwspinlock/hwspinlock_core.c     | 28 ++++++++++++++++++++++++++++
 drivers/hwspinlock/hwspinlock_internal.h |  3 +++
 include/linux/hwspinlock.h               |  6 ++++++
 4 files changed, 48 insertions(+)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index 6f03713b7003..2ffaa3cbd63f 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -85,6 +85,17 @@ is already free).
 
 Should be called from a process context (might sleep).
 
+::
+
+  int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
+
+After verifying the owner of the hwspinlock, release a previously acquired
+hwspinlock; returns 0 on success, or an appropriate error code on failure
+(e.g. -EOPNOTSUPP if the bust operation is not defined for the specific
+hwspinlock).
+
+Should be called from a process context (might sleep).
+
 ::
 
   int hwspin_lock_timeout(struct hwspinlock *hwlock, unsigned int timeout);
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 0c0a932c00f3..6505261e6068 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -305,6 +305,34 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 }
 EXPORT_SYMBOL_GPL(__hwspin_unlock);
 
+/**
+ * hwspin_lock_bust() - bust a specific hwspinlock
+ * @hwlock: a previously-acquired hwspinlock which we want to bust
+ * @id: identifier of the remote lock holder, if applicable
+ *
+ * This function will bust a hwspinlock that was previously acquired as
+ * long as the current owner of the lock matches the id given by the caller.
+ *
+ * Context: Process context.
+ *
+ * Returns: 0 on success, or -EINVAL if the hwspinlock does not exist, or
+ * the bust operation fails, and -EOPNOTSUPP if the bust operation is not
+ * defined for the hwspinlock.
+ */
+int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id)
+{
+	if (WARN_ON(!hwlock))
+		return -EINVAL;
+
+	if (!hwlock->bank->ops->bust) {
+		pr_err("bust operation not defined\n");
+		return -EOPNOTSUPP;
+	}
+
+	return hwlock->bank->ops->bust(hwlock, id);
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_bust);
+
 /**
  * of_hwspin_lock_simple_xlate - translate hwlock_spec to return a lock id
  * @hwlock_spec: hwlock specifier as found in the device tree
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 29892767bb7a..f298fc0ee5ad 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -21,6 +21,8 @@ struct hwspinlock_device;
  * @trylock: make a single attempt to take the lock. returns 0 on
  *	     failure and true on success. may _not_ sleep.
  * @unlock:  release the lock. always succeed. may _not_ sleep.
+ * @bust:    optional, platform-specific bust handler, called by hwspinlock
+ *	     core to bust a specific lock.
  * @relax:   optional, platform-specific relax handler, called by hwspinlock
  *	     core while spinning on a lock, between two successive
  *	     invocations of @trylock. may _not_ sleep.
@@ -28,6 +30,7 @@ struct hwspinlock_device;
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
 };
 
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index bfe7c1f1ac6d..f0231dbc4777 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -68,6 +68,7 @@ int __hwspin_lock_timeout(struct hwspinlock *, unsigned int, int,
 int __hwspin_trylock(struct hwspinlock *, int, unsigned long *);
 void __hwspin_unlock(struct hwspinlock *, int, unsigned long *);
 int of_hwspin_lock_get_id_byname(struct device_node *np, const char *name);
+int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request(struct device *dev);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
@@ -127,6 +128,11 @@ void __hwspin_unlock(struct hwspinlock *hwlock, int mode, unsigned long *flags)
 {
 }
 
+static inline int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id)
+{
+	return 0;
+}
+
 static inline int of_hwspin_lock_get_id(struct device_node *np, int index)
 {
 	return 0;

-- 
2.25.1


