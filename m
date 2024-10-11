Return-Path: <linux-arm-msm+bounces-34051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D09999E30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77F381F24500
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA22A1CF7A0;
	Fri, 11 Oct 2024 07:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TlDn1iyx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AA194C8B;
	Fri, 11 Oct 2024 07:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632799; cv=none; b=cT52fsiMLihkMnApE55QvO3ugl9SCpj08TDzkSEjYFYFtYPudyHW85OzjW1bY5JpHZwaStUFZs8vFEwk5JEaBUEIf8kzLvjCv9r7OaYj99y8Uh5ZQjikj7RG1E0HZQVknaSMJBjW3S/fN9s3d28TA/CR0B5I7KGJf+MZwk0yqDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632799; c=relaxed/simple;
	bh=oEvNMObnOxB3BSg5OPjc2u0aMQvjMAfzKGSehj37Wtk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W7rVjI3vupiB38VSEz+JsFaQKJzNFQsvXI6Y3MqV8GtD9GBADO1txtrzXIF0Oa2wfjZGxSdnUzSaG/IXX1+EXXf1MRTZ8q7PakAro5QnJCnaztchE6cymcFs7b5G95B0eyT3FEdVoLM9LyQVOx4x5g16k30+fCLBLbuZurybs84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TlDn1iyx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B081Wc020040;
	Fri, 11 Oct 2024 07:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hNUEp+Z3ymR/MXjorkxkKh
	zc+6an/TYFG3p4jDszQdE=; b=TlDn1iyx2j+amLqRwiS/d+yZDbk4wROGtKkJlo
	g3DkNdIIPy6WxKVl7WDSWREpC3G7dHvNG04gNO12FBwoZ/qetVUz054WNV3IsOgr
	LYSOltIx0j5/w5Q/fJ3XMD1rGP1f6Cwc4HFKpCdVgNXRTJYTrrNZ4bMPj+iSLTLE
	t+z9gOweoQpfqtn7w+I7kwNcsq/F6cNOuz383utoSdRzK63hDRvKiN5Y2YM6g3ED
	NX+SDtAfTwLigKlLWMH3CDkD8qspBe812lTEosMtD8Zj0mSsZSvgHCxPPJUMny21
	Sbf1jqqEKtBO64aaC1eEcf37C8ZYS1plHez3hnRFZ0ic3kgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7jvrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 07:46:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B7kWtd020028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 07:46:32 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 00:46:28 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v2 0/2] Add Devicetree support for USB controllers on QCS8300
Date: Fri, 11 Oct 2024 13:16:17 +0530
Message-ID: <20241011074619.796580-1-quic_kriskura@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QPmfIa0H88aqMMofqnEAyoQLQEetX0nu
X-Proofpoint-GUID: QPmfIa0H88aqMMofqnEAyoQLQEetX0nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110051

This series aims at enabling USB on QCS8300 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. Both the High Speed Phys are Femto phys and the
SuperSpeed Phy is a QMP Uni Phy.

Base DT Support has been added for both controllers while only one has
been enabled on Ride Platform. The primary controller has been configured
in device mode. The secondary controller will be enabled in host mode post
addition of SPMI Node which allows control over PMIC Gpios for providing
vbus to connected peripherals.

This series depends on the following series ACKed by upstream maintainers:
Base DT: https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/

Bindings patches posted at:
https://lore.kernel.org/all/20241009195348.2649368-1-quic_kriskura@quicinc.com/

DTBS Check has been done on the patches.

Link to v1:
https://lore.kernel.org/all/20241009195636.2649952-1-quic_kriskura@quicinc.com/

Changes in v2:
Added quirk to use pipe clk as utmi clk for second controller.
Added wakeup source for second controller.
Modified commit text for DTS change.

Krishna Kurapati (2):
  arm64: dts: qcom: Add support for usb nodes on QCS8300
  arm64: dts: qcom: Enable USB controllers for QCS8300

 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  23 +++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 168 ++++++++++++++++++++++
 2 files changed, 191 insertions(+)

-- 
2.34.1


