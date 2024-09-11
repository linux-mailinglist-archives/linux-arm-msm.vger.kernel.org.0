Return-Path: <linux-arm-msm+bounces-31458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2834974C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E9E1C21381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 08:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E41914A0AB;
	Wed, 11 Sep 2024 08:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gW76T+9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2131487CD;
	Wed, 11 Sep 2024 08:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726041838; cv=none; b=ZCjKkoPBDOrBa5Atow00Js3PCa+svrkMrwHG4+r64cenvM2819QYZR+Gx8z+T2tu7qblhvf2Rhr3PHDqJ+3XXqJeXdNrfsQFlMjezKKeYn7g4TfE2hMr7rU9eEO5f0aSiNsvj6K1nPgCKQzG0SPWbBtTxrAr8vuZdzDDAM7eZB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726041838; c=relaxed/simple;
	bh=27QEKs5tPzXccli7HOf6dsWoHA0AhD7/BNNehmZNjDU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=owYZBDDakzhlRuxYA2RPP7FTnIY7nq9mvRnLPr3BA0Iz6dL/yoR+GqMFhqRXQx8mVd46ozbLiJDkXN/6UL/jIKv8wke2K+Bh6iNQtclWyS71VMQzn9JmwwXW+hhb3b/HrOolAs/Kb2W0uWgS7Uu89Xitlhlo8WdPAQDpesfVZRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gW76T+9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B2j25R007700;
	Wed, 11 Sep 2024 08:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0NnjA1fyXk2/aR4HarA6lA
	CkfCuL/Q7kTXfHFgf1cA0=; b=gW76T+9tdZyVza4S9g9Xe81b3jvSAYQox7Alcr
	CVj6NyJgQ4f1ZMOgB15+sor7QxYUXcdMYHMSUv1HLRhOZ3tH3fHB3V61ALj996ab
	ivpuhTGdvQX6DDrKaoHRxsrzeGb/7Cxbuc3jaEEtaPHFvkhB17TCl4S3Y/UIoojK
	kieI12mJX33XOmgv2dm2uZo4vBDF4YViBbwLmCWTeupsUnQj5jierHqZQmuIGhAD
	T+KVnmPv6FzdQP7UFPYBgT5x3dkkjypEuHSGECoMuPswhrVDNVx4VwW2LFPC+5Yp
	6YRFaYzuIKrZg3tZzb6T6eZh38tGIXD9hP9+sfn+2L7z15IQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5nrtdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48B83f9P012839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 08:03:41 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 01:03:37 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Subject: [PATCH v2 0/4] dt-bindings: arm: qcom: Add compatible for QCS8300
 SoC
Date: Wed, 11 Sep 2024 16:03:14 +0800
Message-ID: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMJO4WYC/z2N0QqCQBBFf0XmuY1ZE82e+o8QWXdGHahVd00K8
 d/bJHo8B+65KwT2wgEuyQqeFwkyuAjpIQHbG9exEooMKaYZllqryYbzCbFuxJG4TuVcNI0mTXm
 BEFej51Zee/FWRe4lzIN/7weL/tpfC7N/S5zMYu41zUHUohUqQjalackiFtfpKVacPdrhAdW2b
 R8EIJ5ptQAAAA==
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        "Kyle
 Deng" <quic_chunkaid@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726041816; l=1162;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=27QEKs5tPzXccli7HOf6dsWoHA0AhD7/BNNehmZNjDU=;
 b=9pL7wcero4O8w8w0XgiK0/aI9FSCeXilIPO0WsYS3q1I1SDXs30U0WgDeCGGA5g/hZGxTev60
 Hj4YPb/nxL1ADeVYTqKDwCxwpA9FaYfJM2dJfc0v8sMsQza+xjK4lkX
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cM3nDmpG3zW6rw6xGOoauVl_X3dwSA47
X-Proofpoint-ORIG-GUID: cM3nDmpG3zW6rw6xGOoauVl_X3dwSA47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=786 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409110060

Add compitible for Qualcomm QCS8300 Platform including pdc, scm, imem and
aoss-qmp.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
Changes in v2:
- decoupled from the original series.
- Link to v1: https://lore.kernel.org/r/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com

---
Jingyi Wang (2):
      dt-bindings: qcom,pdc: document QCS8300 Power Domain Controller
      dt-bindings: soc: qcom: add qcom,qcs8300-imem compatible

Kyle Deng (1):
      dt-bindings: soc: qcom,aoss-qmp: Document the QCS8300 AOSS channel

Zhenhua Huang (1):
      dt-bindings: firmware: qcom,scm: document SCM on QCS8300 SoCs

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml             | 1 +
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml        | 1 +
 Documentation/devicetree/bindings/sram/qcom,imem.yaml                | 1 +
 4 files changed, 4 insertions(+)
---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-qcs8300_binding-6e7bb1d1d670

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


