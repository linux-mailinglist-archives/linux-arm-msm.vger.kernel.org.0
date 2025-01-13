Return-Path: <linux-arm-msm+bounces-44927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AEAA0C3FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 632421882C6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063231D54EF;
	Mon, 13 Jan 2025 21:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fsvW5+dR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFF01C68B6;
	Mon, 13 Jan 2025 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804816; cv=none; b=D8e2oz9pAVnTXst9fZzlxD5mbNJMp4svzmTgdJRr4cRWVt4eH5M9BZwlT9f/2O4LQp0DvDaDHF89GYstVV+Mf+GED0Z607jB4U6zbvabzBQcYON2OMFPa6qVw/4IqkoRCPwOZTKenyjr8/f2u+p/D63E54tzoSZnHU8UVmjvHxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804816; c=relaxed/simple;
	bh=hUnnOWugqb4RWlmCrJy6G05aZvBoiDwZ9bY8/w40AW8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ZnBW8bssBZqPA0yRfvawOBrFUfi3LkkrMvCaGDQaaS9WtdeUih7puRq+j9dktIsgmhl9g/v/R+ZhZVNLuJtWvT1uROz9AnkDIl1wjGNvOLt08eXiWu9oE5333oYztXhXYywUXOor5NVdWnljaGVBCjMQ3GewHQmFlLttPJRsLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fsvW5+dR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DDWYs8007213;
	Mon, 13 Jan 2025 21:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dhvWu87/0R3YAZvNh5uBEJ
	rXLjGOkhMumYnUwn/LIT4=; b=fsvW5+dROvMhkBl1kdUK5Tk0vKNf+jPD3uifRT
	QoSUMEkVcDgl9oUNhupZYJFm0Kxg36iQ2acTgc9zgNJ/QTF3BToZ8ZRCB5taD3Gd
	kOEJdjAbLY4sG8ufXcN3pbQ1LSSyeltDTixbiClwxbTc3KmalFFmvYko8bvpTYBr
	DWjXaaa1hRvXzIAujumVJOlVQxhKhO9yNgnTZ/A4HSNJqWN3GDIVmOGjHZUVbFfs
	iBZjqVXlvbGA5H4nt4klYWsv5RtrBv70yB/XLL32J5O8C11LJpsrAWKBZGZYcadK
	FpvnaeEPznBsQO9FEAZ5yz33+3FPzBJvYM0wR9QuvjI92hHw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4453tas4qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLkWnF011155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:46:33 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:46:32 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Subject: [PATCH 0/5] Add UFS support for SM8750
Date: Mon, 13 Jan 2025 13:46:23 -0800
Message-ID: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+JhWcC/y3MQQqDQAyF4atI1g4koo7tVaTIoFGz0LaJFkG8u
 0N1+T14/w7GKmzwTHZQ/onJe46gNIF2DPPATrpoyDArkNA7mypfYLP21kzBFlb3CDkRloR58BB
 /H+Vetn+zfl1W/q4xvdzjcZw84O4zeAAAAA==
X-Change-ID: 20250107-sm8750_ufs_master-9a41106104a7
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Melody Olvera <quic_molvera@quicinc.com>,
        "Nitin Rawat" <quic_nitirawa@quicinc.com>,
        Manish Pandey
	<quic_mapa@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736804792; l=1231;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=hUnnOWugqb4RWlmCrJy6G05aZvBoiDwZ9bY8/w40AW8=;
 b=PiuNkryuy/SikDb172DKfYRkwbTB45YbU/7XwdEw6YlkTGuqU79oiIsKRLwMQdYfVHOJ1fI6/
 7+DhBKbwKD6B6pZuMfi2CuzPUNkBptGrF6NlCveul7Qw4m7EFxWJ10Z
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V1SSnG1BkWwwSfi0iO7KsqE1-EmvSOIJ
X-Proofpoint-GUID: V1SSnG1BkWwwSfi0iO7KsqE1-EmvSOIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 mlxlogscore=698 mlxscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130171

Add UFS support for SM8750 SoCs.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Nitin Rawat (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the SM8750 QMP UFS PHY
      phy: qcom-qmp-ufs: Add PHY Configuration support for SM8750
      dt-bindings: ufs: qcom: Document the SM8750 UFS Controller
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD and MTP boards

 .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    |   2 +
 .../devicetree/bindings/ufs/qcom,ufs.yaml          |   2 +
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  18 +++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  18 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  81 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |  12 ++
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v7.h    |  68 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 174 ++++++++++++++++++++-
 8 files changed, 374 insertions(+), 1 deletion(-)
---
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250107-sm8750_ufs_master-9a41106104a7

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


