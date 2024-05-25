Return-Path: <linux-arm-msm+bounces-20438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B58CED65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 03:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAFECB2257C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2F0F9F8;
	Sat, 25 May 2024 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TgN4MHIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C63B65C;
	Sat, 25 May 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600453; cv=none; b=ib7jMLhFqz0DAsffBYjyZgpFhiOc+BW97knbc0/aKJgMCajCVBUigf4+j+YIlTKgKKEmpBCcIRTsDelJ2JE8EH2IOlyhEg4VpPejPDMX0pXVB+fy5/UbnIuouEKLBi3SFu45gayNzjwch+vsLAHTQKwQi4InXANAotrGEbyrcl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600453; c=relaxed/simple;
	bh=KGyKqek9N12SFyAX1ClGwRar2tcSuWzMU69rdDStL7A=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=g4ZpdRQQw0xtYOrua7t4NdTwRrsu9b4VwkzLOqeyfr1yApeFffcx3j+S7Pnj3QG9U1O4npYmskEAQoE0acJ9deICAyp2OLn3N3nMfRi9v0UxuVxNvUlmbp9H+ifu9ieUxMwoiHYY8xjHL1P36P3mbxWUqWC0atK0zC1gRmACCDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TgN4MHIj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44OK176w016646;
	Sat, 25 May 2024 01:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PX7zMvEfH3seIdTrZ8rcPL
	xppd8lRunt+myMT5Q/3M0=; b=TgN4MHIjDpuQmPgK6ODJRXQCbbu0Xx7BhbuHIv
	x9OA9lKkgm3XoFvA4Pd0io+roJPi0uFDwO0GY8sCUr8i5wOi6/KCAjixqd4oWjYb
	KnI/sEjspbvJIR7fzYTgtXsMBqdRwR3b2qzNSjfspSk3WL9ubjPMGd08D/LF1By6
	Ufv9+6DR6DI6H4DNmSxnkimlBqHRwYCpUBwcwr+540+C0JKaAbCVNz/J9MdYUcoW
	B+2pn+PrTxZVsC46gAOv2SnAY/NrQJ8Wos+JNRKGQCAh5aOUsDLgU2pVpQQj98VU
	lJqYjFmh/1CxWzrnrZiwfsl4qzQlGfBuDfV6klKkCyELTJLQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb1j58btw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44P1QxuQ026319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:26:59 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 18:26:58 -0700
From: Chris Lew <quic_clew@quicinc.com>
Subject: [PATCH v2 0/4] Add support for hwspinlock bust
Date: Fri, 24 May 2024 18:26:39 -0700
Message-ID: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8+UWYC/2XNQQ6CMBCF4auQrq2ZFpDWlfcwLkqpMlFbbKFqC
 He3EBcalv9L5puRBOPRBLLPRuJNxIDOpuCbjOhW2Yuh2KQmHHgBJUjaPkOH9ub0ldZD6GlTyEp
 VoJnKFUlXnTdnfC3i8ZS6xdA7/14eRD6vX4vByoqcAi1rJXQhgIlGHh4DarR6q92dzFpkv8JuL
 bAkFJWSoEQpeS7+hWmaPsnsNLvyAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716600418; l=2331;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=KGyKqek9N12SFyAX1ClGwRar2tcSuWzMU69rdDStL7A=;
 b=sMmHwVtTEUrF7LQmlvEGSJ8Zw88PMA7VhggF9WQjFYI/HBFejEsZ/dlDTGRnLz4oyjlz1apfH
 xcR1mu0wTnWAMXDHQt8aIttEIcEusH/dtGXFC7hoDUX1sSUq7myZaWB
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oM7M8pf_Qv5y29i6s2RI9rLr3FPDa-Mp
X-Proofpoint-ORIG-GUID: oM7M8pf_Qv5y29i6s2RI9rLr3FPDa-Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 mlxlogscore=905 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250010

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
Changes in v2:
- Remove extra print in qcom_q6v5_pas as suggested by Konrad
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
 drivers/soc/qcom/smem.c                  | 28 ++++++++++++++++++++++++++++
 include/linux/hwspinlock.h               |  6 ++++++
 include/linux/soc/qcom/smem.h            |  2 ++
 8 files changed, 114 insertions(+)
---
base-commit: e7b4ef8fffaca247809337bb78daceb406659f2d
change-id: 20240509-hwspinlock-bust-d497a70c1a3a

Best regards,
-- 
Chris Lew <quic_clew@quicinc.com>


