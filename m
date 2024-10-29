Return-Path: <linux-arm-msm+bounces-36283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A09B484C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 12:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE8C1C20B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5B7205AB8;
	Tue, 29 Oct 2024 11:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxzM6PiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F75220403A;
	Tue, 29 Oct 2024 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201454; cv=none; b=KPhW/ZmqE2O3e1yAfJzbMj5Afg+nJdfPsQ116LJKsvr52On5wVcRAM48twlElwqeTOVq6wasgRwgLuHCKZglI0O+BFAWTH+v799RG+qf5jZmtXd4naYIGAZJVjrW3DPem8VIzg53lScWaj7d+7p8/AMCDBVYQfJUiOnoh55dnMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201454; c=relaxed/simple;
	bh=7M8AwtGQmLSriofdGg+zUEJJhb7Y0N1fZk8NtjciCN4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qeNC+HP4d8BPc/d8k09bSzo2bpGl+TwY6l1RigxV2BZrgeGiozraEG9/FanrgAQ4CYbUJfcd/ITxiEg22QM0rBopkav2/RbTSuWCuLsafMY43Qi1IH6qF/gLY57GrhCPYeThodDrlRe7XWUQFzPhWJVHzcwH3d0hGVYIaup4wDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxzM6PiK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49T9X77n019775;
	Tue, 29 Oct 2024 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0jiQduM0Wb/rPX0UJjz+6S
	K7bAydXtTFhFzpPd+6G80=; b=LxzM6PiKNy8s+mzGHgogquP8LhABM0o3AelPbf
	ce0596/zLjav3a0O9Ql9xhjlYVS1ndoPUgrGyrHv7ypbuSjJAgeuZaBP23D2AcAc
	ooHcXIcNycOWzLBnZFkKLjfSIIzDfAzY0/GvkU2KF//IPdIXMeoCaa1GQRfsPeUS
	W/GiOkhewWPv84GlYbdZst58j96aauqzPUhg04Hz1jtqSRL+u+aq8CCCpp12KWva
	4w7W2dsaaYHa0FiMALquv8z6m08heRZo/u79FW6EZEiwXLdjuwDIUIiW5w0To5dF
	q/xhvhu3W8t6NexuPF0sxzpu8HZrYvHM0wHbHmu7vDAQbIvg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqcqrbf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49TBUSuV022218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 11:30:28 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Oct 2024 04:30:23 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <alim.akhtar@samsung.com>,
        <avri.altman@wdc.com>, <bvanassche@acm.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 0/3] Add support for multiple ICE allocators
Date: Tue, 29 Oct 2024 17:00:00 +0530
Message-ID: <20241029113003.18820-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6FLoJP0q2rCowUzpde1TaZ24fbqWyPAd
X-Proofpoint-GUID: 6FLoJP0q2rCowUzpde1TaZ24fbqWyPAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410290089

Add support for ICE allocators for Qualcomm UFS V5.0 and above,
which uses a pool of crypto cores for TX stream (UFS Write – 
Encryption) and RX stream (UFS Read – Decryption).

Using these allocators, crypto cores can be dynamically allocated
to either RX stream or TX stream based on allocator selected.
Qualcomm UFS controller supports three ICE allocators:
Floor based allocator, Static allocator and Instantaneous allocator
to share crypto cores between TX and RX stream.

Floor Based allocation is selected by default after power On or Reset.

Changes from v1:
1. Addressed Rob's and Krzysztof's comment to fix dt binding compilation 
   issue.
2. Addressed Rob's comment to enable the nodes in example.
3. Addressed Eric's comment to rephrase patch commit description.
   Used terminology as ICE allocator instead of ICE algorithm.
4. Addressed Christophe's comment to align the comment as per kernel doc.

Ram Kumar Dwivedi (3):
  dt-bindings: ufs: qcom: Document ice configuration table
  arm64: dts: qcom: sm8650: Add ICE allocator entries
  scsi: ufs: qcom: Add support for multiple ICE allocators

 .../devicetree/bindings/ufs/qcom,ufs.yaml     |  24 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  19 ++
 drivers/ufs/host/ufs-qcom.c                   | 228 ++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h                   |  38 ++-
 4 files changed, 308 insertions(+), 1 deletion(-)

-- 
2.46.0


