Return-Path: <linux-arm-msm+bounces-20998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAF58D3E1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9A51C237F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79661C6881;
	Wed, 29 May 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWuseCyp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7701C0DFB;
	Wed, 29 May 2024 18:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006222; cv=none; b=ru15gCmbUe/f1lzYRhhbXK43NafSmnYo74X3Pde7QuNYDgsNUlaamzz5xiIKL38vBTzDsgj81bAcMbJFhoCVBA26yHW3AlAUISCPoBlzxT1MKn0WrftKxl8KbbS6BSwIIZw5oY0dS7SsqGE1CG22oRgOSn0eis5gbh418voZSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006222; c=relaxed/simple;
	bh=vGabm37tC269RBMvbuwrjb2bM7+ngBO/85FI8CiwzQY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BeM1f3JVYf7gGbp/BXOyTVAPFhMtkzygQsYN2OnqS8SFaq0fvoJDBXkWbapXyVCIs3iuYvRaeUjUkHtfvSz2Ur8zhVDbA6YRKLA/He1u6zMSH7w13VSO4QIND8AHpQjRtIsOl787jU9PoDP5SAe568LKZ55hTm94Lf5xL6ZXoWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kWuseCyp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAm8km023423;
	Wed, 29 May 2024 18:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iG3MTIFwvWdFAw8PEShyLw
	jKjHSMW7X/BW138vB+qfI=; b=kWuseCypNhVn0/ZyhrJAMXCjQGZdrDBhbpVkTb
	8VkZOdQaA7eWNqUAkx05OfMgv+e9hJYAGyqhkoyNVAiMRg0eFDdZH16YpV5KvzPz
	6PSe6mrm6wwWK2T985P2ff6fmMIc4udI3ClB1qoos+dJ7swhJe5dlGyH44j+T8Wf
	bfqtu44NjfQuePIdiQ1+aSmQAxsQEFcg6Jr9WRSIbXN8pVzv8/tkL2Nj9TkDudUf
	wgKEwOOLkikQt+1DkGJiCEycJkUtQ6tXFPBIilhK4RNgL+V3yR9Jp+0tSL520yJD
	Ha2FYYklDAz3N/jlUgiU4amGubmuGeqOUpCqMzR/Ugy5eeGA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yj9xbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TI9xCG003967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:09:59 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 11:09:59 -0700
From: Chris Lew <quic_clew@quicinc.com>
Subject: [PATCH v3 0/4] Add support for hwspinlock bust
Date: Wed, 29 May 2024 11:09:54 -0700
Message-ID: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNvV2YC/22OQQ6CMBBFr0K6tmZairSuvIdxUUqRiVqQAmoId
 7egCwku3yTv/RmItw1aT/bRQBrbo8fKBYg3ETGldmdLMQ9MOHABCShaPnyN7lqZC80639JcqFS
 nYJiONQlW3dgCn3PxeApcom+r5jUP9Hy6flsMVq2eU6BJpqUREpjM1eHeoUFntqa6TfGPycV/s
 8ikLHKWGg3Zwpz+6Nnv9m5dYKEgUq1Ay0TxWC4L4zi+ASLEnPQsAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006199; l=2680;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=vGabm37tC269RBMvbuwrjb2bM7+ngBO/85FI8CiwzQY=;
 b=L44KNjGru1XSqCRGaXQsV0aSR7QuWYj0hVBs5xma6PClnv6uww54NOfsT2+2gLpR/FxT/Ea03
 a7LRYMPphxVD45NkriJA9bhm2EOS9EHTTC4gqxGjXNSC0drnjuObvgC
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9Y-tH7HSJOzxgARNPd5dRV2MqWjkSk19
X-Proofpoint-ORIG-GUID: 9Y-tH7HSJOzxgARNPd5dRV2MqWjkSk19
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=913 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290127

hwspinlocks can be acquired by many devices on the SoC. If any of these
devices go into a bad state before the device releases the hwspinlock,
then that hwspinlock may end up in an unusable state.

In the case of smem, each remoteproc takes a hwspinlock before trying to
allocate an smem item. If the remoteproc were to suddenly crash without
releasing this, it would be impossible for other remoteprocs to allocate
any smem items.

We propose a new api to bust a hwspinlock. A driver can use the
the bust api if it detects the device has gone into an error state, thus
allowing other entities in the system to use the hwspinlock.

These patches were tested on an sm8650 mtp using engineering cdsp
firmware that triggers a watchdog with the smem hwspinlock acquired.

Checked for error in dt-bindings with below.
 - make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=remoteproc/qcom,pas-common.yaml dt_binding_check
 - make qcom/sm8650-mtp.dtb CHECK_DTBS=1

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
Changes in v3:
- Fixed 80 char comment formatting and missing space suggested by Bjorn
- Changed unsigned to unsigned int in smem apis from checkpatch warning
- Removed null pointer check in smem bust api
- Picked up reviewed-by trailers from Bjorn
- Link to v2: https://lore.kernel.org/r/20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com

Changes in v2:
- Remove extra print in qcom_q6v5_pas as suggested by Bryan
- Expose SMEM API that remotproc can call to bust the smem hwlock as suggested by Krzysztof
- Drop patches related to multiple references on a hwlock
- Link to v1: https://lore.kernel.org/r/20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com

---
Chris Lew (1):
      soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()

Richard Maina (3):
      hwspinlock: Introduce hwspin_lock_bust()
      hwspinlock: qcom: implement bust operation
      remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop

 Documentation/locking/hwspinlock.rst     | 11 +++++++++++
 drivers/hwspinlock/hwspinlock_core.c     | 28 ++++++++++++++++++++++++++++
 drivers/hwspinlock/hwspinlock_internal.h |  3 +++
 drivers/hwspinlock/qcom_hwspinlock.c     | 25 +++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c       | 11 +++++++++++
 drivers/soc/qcom/smem.c                  | 26 ++++++++++++++++++++++++++
 include/linux/hwspinlock.h               |  6 ++++++
 include/linux/soc/qcom/smem.h            |  2 ++
 8 files changed, 112 insertions(+)
---
base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
change-id: 20240509-hwspinlock-bust-d497a70c1a3a

Best regards,
-- 
Chris Lew <quic_clew@quicinc.com>


