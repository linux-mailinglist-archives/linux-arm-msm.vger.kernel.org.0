Return-Path: <linux-arm-msm+bounces-45508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B10A16183
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 13:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6309164F96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49D41C68BE;
	Sun, 19 Jan 2025 12:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kqp1qgbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE79161310;
	Sun, 19 Jan 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737288054; cv=none; b=JVfVJIngGzEtpBXAp4RtEE03LCZW39UZziyWNDV+AM1pwTpkh8+K3elJP2tpJ68zLirAjAd7Ik0jEhA86x3fKHe7RBO9PtBgdyVIPW8aQnkd4nQob4YzZvjSb+TO+3OXU93uqeIAw+R+zTI5HoOhj/TRsOQ2ApQrzbOJI9p2kEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737288054; c=relaxed/simple;
	bh=JrFcLuikRihGTCNEUBT3LM/DX7puuuzu30kU8HajU4g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qeyn1IJ4+c/jjJ9ygtSdqCCnIIwGrrfEnqwwIOeIhFUvfms+cBhqBVUjQpfrG7BpDwbFdlchb01Q1DVHTxblrmUPW0g2+oc51RZTtQTxW492meKknUExomb120sQs0rTtKCjQrREByq3EoxhyjMzjQB3HUo96/fBPoC7NNG/7s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kqp1qgbx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J7kLUv014183;
	Sun, 19 Jan 2025 12:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kIVl4AF5oL/kXKm6Q92HdP
	FWYnWjo8oCihU2AC38ZlE=; b=kqp1qgbxo7xzM2icDMBJB8d6qta6/hDErdfu4P
	vHuwFVv5zWXW8Ru7s4cU6W3SQI13I3haCprXsihwrx3sv28vhk7K+GVM+gnaEbz6
	1yHmSXsoU1pUM0ZEJdd0TuOcUyp2MTjUtkFWVCjVurEC4ezYRH1OwyAh5QNeE1mC
	yyLJJ45rqlMGJ/DCb5hnLG36f/Q6gGXrXPlkgdf3afTIISsiuXp63Xw9OKJdeLh8
	SCM+A98K/Agsb6nFsDOV4uOwP9uRAaosLBo7CxVGqZCAqSzVT5qbpdfBnfO19ILE
	sVkCMZbqvdbZu7DKohovxV9AWMrGOcRsi3qjzdlWR+jQCN9A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 448dsr98mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 12:00:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JC0mVD026192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 12:00:48 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 04:00:44 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v2 0/2] Add support for clock controllers and CPU scaling
 for QCS615
Date: Sun, 19 Jan 2025 17:30:26 +0530
Message-ID: <20250119-qcs615-mm-v2-dt-nodes-v2-0-c46ab4080989@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrpjGcC/23NQW7DIBCF4atYrDsVYAbHVlX1HlEWMExaVAMNO
 FGlKHcvSbZd/k+ab66icY3cxDJcReVLbLHkHvplEPTl8idDDL2FlhqlUjOcqFmFkBJcNIQNcgn
 cIGCYtfHMiCz67U/lY/x9uPvDsyufzp3fnqNI3Jp78Mvw9p9ugNZC31TyVsu6cr1PEjAoHzw6Z
 SR9dJFiplcq6f3+1rvG0CPFbRnkLCeejn7ECa2xxrnR0IjBOu+lnuedUTtljReH2+0PH/XXtQg
 BAAA=
X-Change-ID: 20250119-qcs615-mm-v2-dt-nodes-d5d924bee55e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MA2HrRageRqW-Yxv3scsqQyTbJaWNMmg
X-Proofpoint-GUID: MA2HrRageRqW-Yxv3scsqQyTbJaWNMmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=559 phishscore=0
 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501190093

Add the video, camera, display and gpu clock controller nodes and the
cpufreq-hw node to support cpu scaling.

Clock Dependency:
https://lore.kernel.org/all/20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com/

Changes in v2:
- pad address field to 8 digits [Dmitry]
- Replace cpu/CPU in commit [Dmitry]
- Update the binding to use SC7180 compatible, as QCS615 uses the same
  hardware version.
- Link to v1: https://lore.kernel.org/r/20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      arm64: dts: qcom: qcs615: Add clock nodes for multimedia clock
      arm64: dts: qcom: qcs615: Add CPU scaling clock node

 arch/arm64/boot/dts/qcom/qcs615.dtsi | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250119-qcs615-mm-v2-dt-nodes-d5d924bee55e
prerequisite-message-id: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: 7fa9f2a44f98280ae6639924c8ce08a89457170d
prerequisite-patch-id: b9e3a2663e27dc60be0eff97baf3739db8516eeb
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: faf0d569634dad432f67acd073343e47add0ee68
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 1a1dbf7144745dfbc60c0f2efcad188d1fc26779
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: b12e39a6a0763b8ec23c99c82f3ac6acdca26f85
prerequisite-patch-id: 71f0eb0fb98c3177dcbe6736c120cba4efef0c33

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


