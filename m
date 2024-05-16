Return-Path: <linux-arm-msm+bounces-19956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1938C7EB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 01:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0ABDBB21D67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 23:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6860B3A8D0;
	Thu, 16 May 2024 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hslqRhYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87C82C6BB;
	Thu, 16 May 2024 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900387; cv=none; b=ui2D0keQIan/ygMUAygbLO76v5WupelnIaCqxA6PhL/bVmlqEU84pf/bIai9KYh3psLmWeVKyRYbR63/KRtfKURYtO6WKHM4upFcW0n9OkE3kRq5vDghcVdj0iJsRqCj1ezwdXRP37F4yCyDFHcrycWAunwyIZFP4wVU3BcrL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900387; c=relaxed/simple;
	bh=/FqNeVmzdV0RIu2YWl5Icsrpu4maCXiy8NsaAx0YDuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ICUjFtfGjYVqz2mu6k4B6BDdc7SInA2ti6qsmY9dQ2n7sxgBo2VTNedIZRVDZ+LK/mOPzRUNonW3G0AM4Ep0ALAAv8mzZNeCQnI/mAsSNTXkllXSVQOWod6SaILlw8qR78QW1vg6POsC3oxw+fSktfJVlsTcT1ZXAPmSRjKB4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hslqRhYD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKMaMC007077;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=kHfQ6NXQ5kwelITGbExYSt4Ut+ZkVK98Wx3xRk/XbuA
	=; b=hslqRhYDHHAfjPFa8iKmqEroZfRdMH+Ltt+PE3n6i44jdmqyQYvhpZ8Q4K0
	pVCc9X5p1G1eiTvv3diW74Djf6Ddwe1gLa2dRZ3hjJOywnSslxdG1mFLA9ZGv7SW
	S7jOGV534rOVce428uIbQtP84JLZBCF3F3YjgVePHHlY0v2kCl+o+MgjP+nxR/K/
	Pu6ThdSe/Qv8r59JsQlkSpTlZ4tDFNukRSxEl/BkA3KkGL93Ubr/vK3hJ1FfiXZ0
	+7Wgo5H/7/KrWQonLnMb/zaXLZSoGNoI518Cs0PI5w4IHfjy9W7LSqIJo8PmMp6i
	Z953IPo2NKvV3sSSWSnurpIE9UQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egeu3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6K1012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:06 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:05 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:20 -0700
Subject: [PATCH 2/7] hwspinlock: Enable hwspinlock sharing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-2-47a90a859238@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=2641;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=bu2SwH1DNJyE9kUDSJOo/24lvfmmTJw6ZHzvOBd1Lqo=;
 b=obfsrT9HjbMTTIjfz55/lIHFyplEwmVhpEtvrrkIsUTc6OR02xAgbXUgiDg6yQZLmC5/0oQhR
 VHx+YYimGFoDel7o6IvQQKIfFp53cSpJ5gUkRAOATJapQO5F2eUpzSn
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZKfnza1QGKD6n4QfrXFlNS36Gfuq60Q6
X-Proofpoint-ORIG-GUID: ZKfnza1QGKD6n4QfrXFlNS36Gfuq60Q6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

From: Richard Maina <quic_rmaina@quicinc.com>

The hwspinlock used by qcom,smem is used to synchronize smem access
between the cpu and other remoteprocs in the soc. If one of these
remoteprocs crashes while holding the hwspinlock, then the remoteproc
driver should try to  release the lock on behalf of the rproc. This
would require rproc and smem drivers to share access to a hwspinlock
handle.

With the introduction of reference counting this is now achievable,
therefore, remove the code in hwspin_lock_request_specific() preventing
this.

The single owner condition is retained in the hwspin_lock_request()
function, as this is specifically intended for requesting an unused
hwspinlock and should not have any shared references.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 Documentation/locking/hwspinlock.rst | 8 ++++----
 drivers/hwspinlock/hwspinlock_core.c | 8 --------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index 6f03713b7003..c1c2c827b575 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -53,10 +53,10 @@ Should be called from a process context (might sleep).
 
   struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 
-Assign a specific hwspinlock id and return its address, or NULL
-if that hwspinlock is already in use. Usually board code will
-be calling this function in order to reserve specific hwspinlock
-ids for predefined purposes.
+Assign a specific hwspinlock id or increment the reference count if the
+hwspinlock is already in use. Return NULL if unable to request the
+hwspinlock. Usually board code will be calling this function in order
+to reserve specific hwspinlock ids for predefined purposes.
 
 Should be called from a process context (might sleep).
 
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 29b33072ff57..73a6dff5cbac 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -774,14 +774,6 @@ struct hwspinlock *hwspin_lock_request_specific(unsigned int id)
 	/* sanity check (this shouldn't happen) */
 	WARN_ON(hwlock_to_id(hwlock) != id);
 
-	/* make sure this hwspinlock is unused */
-	ret = radix_tree_tag_get(&hwspinlock_tree, id, HWSPINLOCK_UNUSED);
-	if (ret == 0) {
-		pr_warn("hwspinlock %u is already in use\n", id);
-		hwlock = NULL;
-		goto out;
-	}
-
 	/* mark as used and power up */
 	ret = __hwspin_lock_request(hwlock);
 	if (ret < 0)

-- 
2.25.1


