Return-Path: <linux-arm-msm+bounces-37327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097779C166E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 07:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 372901C2277C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50CE14B07E;
	Fri,  8 Nov 2024 06:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YiHDmwku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F061171C;
	Fri,  8 Nov 2024 06:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731047074; cv=none; b=ejDosxYmN/0gdGAlqmjiQqPXSnPRsugxGConoNczykGTO0D+046IPr5INnyVgBIuy8n0OWyl2/0R6nzLy/5WlHLnxuru4K43bgMCdnE9BsZyv5Yvb7EEqaRfToTN9SrHJulexl+8INfxd7Cd+iOPAx6JrsJ6fOFQUVqDLycSAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731047074; c=relaxed/simple;
	bh=UqrBStGtlVVS2epuEOwLaPCB2zm3pAyQeyx7QtJvgO4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QLbhbu2+vo/DUYVe2bgp0gjpxBmWCIb9mWFvaj6tsgEDyEs0N0Et7rB49sjkLQohrCUdi0uC0ht7sz+cnifnC3Piyv7whh27Wzyy46VdmUDtQ0DY7ECPAQ8J3c5T5aJtaCcZbGAX2Zgxy0YojVFGfck3HgWb+1eCd1wiF//0vJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YiHDmwku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbZqe018513;
	Fri, 8 Nov 2024 06:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C9NWio5wIlKD2nEBqHjRvN
	7VSWAhCsIEQ95DTmtPHqI=; b=YiHDmwkuWZiSimkFrFjdfDOpnBs5Ne8Q26YrqZ
	RNtxWii+3p0SfOtVOxdY0w1l1uqEjfBXvvys86Ulh6C9vzoSxfNl8BCynlJyD2VZ
	/TP2MddFmHfHQI3HUTbKg++4EIi5hani9MjruTsBzQNbJfxRNCX37WKNvl1bEbMJ
	A/HbBh1t5O9Ye+hd6QOXU84eplmHO2HevVb8DiRKB+2vjeLLZX5ur/b2+X0P2bmc
	67ERpn/MGFT5D+TBWAlj99NUIEmvyS9A4rfFS6bL6txXrVpIZ6bBMzmV+NHboBOd
	2UxtUoOG9R9KJ3Oi5OZHXrdV3PzPEMx7kiEXGOaBN7pqqjCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gmrttv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 06:24:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A86OQo8010029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 06:24:26 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 22:24:23 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 0/2] Add support for clock controllers and CPU scaling for
 QCS615
Date: Fri, 8 Nov 2024 11:54:03 +0530
Message-ID: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOuLWcC/23N22rDMAyA4VcJvp6GD0mchDH2HqME21I2s8ROb
 bcMSt99Xru7VXe/QJ8uLFPylNnUXFiis88+hhriqWHu04QPAo+1meSyFYIPcHS5Fx1sG2CBEJE
 yaEFmHIwatTSsHu6JFv99Q98P9050PFW73Jdso5zNzZ6alwe0W6P7cjGUFNeVEpwVcNCorESpu
 gWXt8o5H9yzi9vr789HYgsGcfbBF2/WOZ/2PaYyLzHNf5/OXWVHRBpQ24Fb/o+1JhPU2HyZGt3
 qVhjecatHVAIHlFRHSKe1Vn039shNbyU7XK8/aRWc/1kBAAA=
X-Change-ID: 20241108-qcs615-mm-dt-nodes-71ea98a3972a
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
X-Proofpoint-ORIG-GUID: wFpn_R0lANf395kT5n3n1jZDznj8MKfI
X-Proofpoint-GUID: wFpn_R0lANf395kT5n3n1jZDznj8MKfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=485 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411080052

Add the video, camera, display and gpu clock controller nodes and the
cpufreq-hw node to support cpu scaling.

Clock Dependency:
https://lore.kernel.org/all/20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com/

Device Tree Dependency:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
Taniya Das (2):
      arm64: dts: qcom: Add clock nodes for multimedia clock
      arm64: dts: qcom: Add cpu scaling clock node

 arch/arm64/boot/dts/qcom/qcs615.dtsi | 80 ++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
---
base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
change-id: 20241108-qcs615-mm-dt-nodes-71ea98a3972a
prerequisite-message-id: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
prerequisite-patch-id: 748a4e51bbedae9c6ebdbd642b2fd1badf958788
prerequisite-patch-id: 72a894a3b19fdbd431e1cec9397365bc5b27abfe
prerequisite-patch-id: da2b7a74f1afd58833c6a9a4544a0e271720641f
prerequisite-patch-id: 40b79fe0b9101f5db3bddad23551c1123572aee5
prerequisite-patch-id: cb93e5798f6bfe8cc3044c4ce973e3ae5f20dc6b
prerequisite-patch-id: 13b0dbf97ac1865d241791afb4b46a28ca499523
prerequisite-patch-id: 807019bedabd47c04f7ac78e9461d0b5a6e9131b
prerequisite-patch-id: 8e2e841401fefbd96d78dd4a7c47514058c83bf2
prerequisite-patch-id: 125bb8cb367109ba22cededf6e78754579e1ed03
prerequisite-patch-id: b3cc42570d5826a4704f7702e7b26af9a0fe57b0
prerequisite-patch-id: df8e2fdd997cbf6c0a107f1871ed9e2caaa97582
prerequisite-message-id: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: 82481c82a20345548e2cb292d3098ed51843b809
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


