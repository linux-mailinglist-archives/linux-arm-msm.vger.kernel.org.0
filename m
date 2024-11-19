Return-Path: <linux-arm-msm+bounces-38274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1939D2002
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 07:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D152823FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF8155C83;
	Tue, 19 Nov 2024 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="onPf9kgB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F8154BE2;
	Tue, 19 Nov 2024 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731996503; cv=none; b=LZEVTI6JNpNGG2K8s9nwLW0lUPk5k+u6My/vAWezNHe+ekB3AJ8YUnHryJaYYgqcFqlMcqDev+/c8tjrHQlzW/lboM8AXOBB8zYfv1tM5TSfolZ58sZGTcWCJA7fNb6JcIwYHAKiurmn84HXUmrk+lXKPMJ5OiDdTZ1hIBq7x5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731996503; c=relaxed/simple;
	bh=TY9NixeYENtxbjzs7/819AWlaEo6jp/Hsm5Zy29oTXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jwk5GfAPiLRRnerqv53x8cky6MFTRe7D4mPANNLXbnhkh1zPoVWasF402bmhvrP6ElLrkloGDX6/d4vpi3aYJM+U2PhEFQWRhLT/tWSkq8PJFPEEjhZogMWzXZ8e3ucq1J7zDKqAfzvLc1e/i005qxnmeY0yiuXHzBtJ7PhGikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=onPf9kgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGHGRB031510;
	Tue, 19 Nov 2024 06:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OGduCjV0BHdPK6uF0ve+QE
	PJPR5NXvDPYBj1UWxQXNE=; b=onPf9kgB/PHTctqLMOGo0MCSrLYtcu2I/rtNaM
	efsYi5/MoGr2I8Z4toYST8f21TMuM0wVB3oWvE+hluDAnSjrW54ctI8hWo8/OVKd
	pGJAZk/SKbEU38OWmpM8kg07Wa3SNyqEWJMzxADwIK0GtpHDMkOM+3r1ghiv5QKa
	yEMgnqyQDkF04dftQY4aLAU3gh9pYOuOvJ5+4Rc3WYVM3UgkynEKYxXuqBn+oK9L
	mmabEE0ny02U3XmahAjF1sLlsuw3WSCA7svECKPUcClgFUfwhjcYZ5qU9KVnvdRd
	yh6vnYYPo9fBQy6AqvY9jKbD1ZwlPqIw3TOTBVxVXOzve8Kw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y91kfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ68Hhm030798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:08:17 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 22:08:14 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 0/3] qcom: ipq5424: Add LLCC/system-cache-controller
Date: Tue, 19 Nov 2024 11:37:51 +0530
Message-ID: <20241119060754.3350320-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UL4OUgJARymZ0OGr4B6KgWxdDnjaw_zj
X-Proofpoint-ORIG-GUID: UL4OUgJARymZ0OGr4B6KgWxdDnjaw_zj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=910 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044

Unlike other Qcom SoCs, IPQ5424 doesn't have multiple instances
of LLCC IP and hence doesn't have a LLCC_BROADCAST register
space, and the LLCC & LLCC_BROADCAST point to the same register
space.

Alter the driver accordingly and add the relevant entries for
enabling LLCC/system-cache-controller on the Qcom IPQ5424 SoC.

Depends On:
https://lore.kernel.org/linux-arm-msm/20241028060506.246606-1-quic_srichara@quicinc.com/

---
v3:	Rebase to ToT
	Remove 'need_llcc_config = true'

v2:	Add reviewed-by for dt-bindings and dts patches
	Add 'no_broadcast_register' to identify SoC without LLCC_BROADCAST register space

v1:	https://lore.kernel.org/linux-arm-msm/20241104073840.3686674-1-quic_varada@quicinc.com/

Varadarajan Narayanan (3):
  dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
  soc: qcom: llcc: Update configuration data for IPQ5424
  arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller

 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 ++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi         |  7 +++
 drivers/soc/qcom/llcc-qcom.c                  | 57 ++++++++++++++++++-
 3 files changed, 80 insertions(+), 4 deletions(-)


base-commit: ae58226b89ac0cffa05ba7357733776542e40216
-- 
2.34.1


