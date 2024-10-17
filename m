Return-Path: <linux-arm-msm+bounces-34719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C47569A1F1B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA341F211A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B4A1DB52A;
	Thu, 17 Oct 2024 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ft2mVXL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EBD1D9327;
	Thu, 17 Oct 2024 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158839; cv=none; b=I4z3nSlzPE8d7CmPOMtmNspu3naw80DsAjAtWnXi+DjLiJsX27U2dlZisEHYAXQXiM23kOPCNVcYaiDyLvKG17lT3fPHGuoSG6A6Iypn02hsqsx2u5TKQNMbOsvB+5BTz4b43Hjz9U06lM7xLW0ldc/n7Dd4CVMms9N4I1hgosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158839; c=relaxed/simple;
	bh=xpLpgNh/Fcl1KHaTpUD2Ve3Qp0GVP7rZR2RA+cT5KXM=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=uRztYQQsYRC2K8XZHlpetrtmSlWURke5DtTyr+MJTti5vn3WGbXrfOPSk5JGVmrTCfcfRlYOtUmEnofFTLVM+DEka4qzwiB4aqTWP5yNHdanpG6rFXDJ9DMhV51GNC6RIJwcqXgw7Jz0DwpABAAOxN/UTb6VCBJOWQSmOUKmbtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ft2mVXL4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7klgU007441;
	Thu, 17 Oct 2024 09:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5sgKq7wBsg3T8XBzJ5p0rF
	hEUSJeZMZlKeAEGpmwYgw=; b=ft2mVXL4H3qapLd76cvJeYooK+hWkuvquX/R5d
	X7zzxpCSLYa7Y0Yg7560mNXd2AkbyVXyaxKruxrPFDlGKlb6xugCu77byVB8hzNj
	yqJg9R9p5YD04P0Xett3XMPADFe5ZeDaC5VMeIRD6gIQfTm7rwVd+J91v2w3zM6C
	+XSmQukZea1NdEmpfu3/sGAdNGdvGTv2C3JUIKlShjSTWsUvOrXk+xbsz/xyscXt
	z8Ulq8O/ysCOZhZ6oToFwiSJjkKBMGtkln1Mm6dy8hnjtiZFG+GoCYWHHDILq5jv
	sWypcTHpjHrWwkAXj1ftjw1e3YRVBYwArXOS1kesOAL2Mv7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy7q7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9rbmA017959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:53:37 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 02:53:31 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH v2 0/3] Add ethernet dts schema for qcs615/qcs8300
Date: Thu, 17 Oct 2024 17:52:36 +0800
Message-ID: <20241017-schema-v2-0-2320f68dc126@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXeEGcC/2WNQZKDIBBFr2KxHlIN4hCzmnuksoCmGXqhZsBYS
 aW8e1CXs/zd7//3FoUyUxGX5i0yLVx4GmvQX43A5MZfkhxqFhq0UaBAFkw0ONmBB2+tRX32osL
 3TJGf+9D1VrN3haTPbsS01WlOG5W4zFN+7bZFbey/4UVJkP3Z6wBOR+v0z9+DkUc84TSI23q4M
 tVr4fkQHrb6H3i+NAYIsA9GmdjZYDqg1gVoUWn73ZHtbcQ2UqA6tn4ACciw9AABAAA=
X-Change-ID: 20241010-schema-50b0b777c28b
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Kishon Vijay Abraham I
	<kishon@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Yijie Yang <quic_yijiyang@quicinc.com>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729158811; l=1441;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=xpLpgNh/Fcl1KHaTpUD2Ve3Qp0GVP7rZR2RA+cT5KXM=;
 b=qr4/PBeRt3CNFrPeHOvhH7hnImi56ebmoXuh3AePL4LXJFKaYEdryKotTdyAZLCmh3qMKbwFI
 Uy3uAEnyiA0AhynONUf4azKBMtb9mtDG7k1EwdPt280OWt9+hgNtUIh
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jRfys1Oyqrehh5-5bQKgqzWzNONvb5qM
X-Proofpoint-ORIG-GUID: jRfys1Oyqrehh5-5bQKgqzWzNONvb5qM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170067

Document the ethernet and SerDes compatible for qcs8300. This platform
shares the same EMAC and SerDes as sa8775p, so the compatible fallback to
it.
Document the ethernet compatible for qcs615. This platform shares the
same EMAC as sm8150, so the compatible fallback to it.
Document the compatible for revision 2 of the qcs8300-ride board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/

Changes in v2:
- Adjust the position of the EMAC compatible fallback for qcs8300 in the YAML file according to the order. 
- Link to v1: https://lore.kernel.org/r/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com

---
Yijie Yang (3):
      dt-bindings: net: qcom,ethqos: add description for qcs615
      dt-bindings: phy: describe the Qualcomm SGMII PHY
      dt-bindings: net: qcom,ethqos: add description for qcs8300

 .../devicetree/bindings/net/qcom,ethqos.yaml          | 19 ++++++++++++++-----
 .../bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml    |  7 ++++++-
 2 files changed, 20 insertions(+), 6 deletions(-)
---
base-commit: 40e0c9d414f57d450e3ad03c12765e797fc3fede
change-id: 20241010-schema-50b0b777c28b

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


