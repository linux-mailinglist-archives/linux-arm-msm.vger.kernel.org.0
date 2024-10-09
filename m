Return-Path: <linux-arm-msm+bounces-33729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D439975F8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A927D1C2232F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 19:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885BF1E0B7B;
	Wed,  9 Oct 2024 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A4FMgyUk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D617CD530;
	Wed,  9 Oct 2024 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728503661; cv=none; b=kfZhqRBLfXbkSyr0HQFUIrkkO8Gwzt42bc1iTgtVRNcXV8iWPTDdm+2FX995YSWlU2xeEbQ1m8sMkMhEWfegleh0HU+pfWwngYtayh9sFJGI+xV/2ez54DZIgBm7qSLd5PPaPh8Jdz2bhdQpFEYk7bXwvW11f/f6t6dR1euAqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728503661; c=relaxed/simple;
	bh=NOaYz3TlwelIGEnX2xdqfYe4BwQqmCGC+13epwzxjTI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QLJjbFOr/z0BwY25Z418rEyAfHHaALetOchxSiDqubcjYijAfNV9FPOOK4COZrIdGrKTkXPNQKaFsCDzYaStYtNRv1ZxV5Hie02G2/fFNAwT9CDMDLgUlcA+GJdhVH0lbLRl6M5enQ/zCfacoCX9A47H3dDx/ESDihUe17Umgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A4FMgyUk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499FDLjc022606;
	Wed, 9 Oct 2024 19:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h5NhgdrZThmxkhNJYKIxi+
	89HThSLGgv6QLTXuhjyEg=; b=A4FMgyUk8rm3OdDhIgFwvD//AfM4G1RCOrK6xc
	jtEPgwmM/J1YFPYXCBql92wuXQJjZI1Hlk0XFpwR6gmY5WRTt61oA8VSbJK/rhVM
	5udMfIAkhhkL/3KPH35/jmJxm6zISF96tJn49rzx+bwJyzoUOm3a42RkiDod+423
	62xPWQlS6Pu3jbTL/vk2nBX4LCr9Z0KkCtcJzpp3GvMC/uPLCay6AluWRo3MfCSB
	jFJFtZcmBrqsnbOmKsSzFAN74e8yQCJg7iA5klMbpVoR1FwLDEyasXu7VtBkr5NN
	kzLXREl6VbWK7i6/r7hW9K+Kg6nadXX+V8GXXF9xi3dA7y9g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaeyh4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 19:54:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499Js6cT024599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 19:54:06 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 12:54:00 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Mantas Pucka <mantas@8devices.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 0/4] Add USB Support for QCS8300
Date: Thu, 10 Oct 2024 01:23:44 +0530
Message-ID: <20241009195348.2649368-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: urM4tLSNWLGsC9297-gwI_kDVBLRYlsE
X-Proofpoint-GUID: urM4tLSNWLGsC9297-gwI_kDVBLRYlsE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=870 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090123

This series aims at enabling USB on QCS8300 which has 2 USB controllers.
The primary controller is SuperSpeed capable and secondary one is
High Speed only capable. Both the High Speed Phys are Femto phys and the
SuperSpeed Phy is a QMP Uni Phy.

Device tree patches will sent separately. DT Binding checks done on
the binding patches. Flashed and verified working of NCM over primary
usb controller.

Krishna Kurapati (4):
  dt-bindings: usb: qcom,dwc3: Add QCS8300 to USB DWC3 bindings
  dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for QCS8300
  dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add QCS8300 compatible
  phy: qcom: qmp: Add qmp configuration for QCS8300

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |  2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml  |  1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml    |  4 ++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       | 65 +++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.34.1


