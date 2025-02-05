Return-Path: <linux-arm-msm+bounces-46922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B8A2850F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 08:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AA1A1886D93
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 07:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6020B22838A;
	Wed,  5 Feb 2025 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OMa5s6pM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE321421D;
	Wed,  5 Feb 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741677; cv=none; b=pWMd4d/M97D/lyjQxbVoniRsuoH83VCS9LgKlGCiFg4vB0lV5NeDyqx4gAG2zlSV10v0BpNesNHpboPaHUXVW9381T5KLt4VzUcWl3rpd3n/qbatyfJ/8HL2GvAf6xlo0UkKvJp3d8vcjaW+pgNjwXojuEfFILfzWjvG09nTbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741677; c=relaxed/simple;
	bh=OrzzeBFxkSp0q1fwFEwDri5iIfVmtNn/HmydGlWwR1I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CIpuk58U2dCOzKGfyj3W/4RF9rK2+YE9BHbcJCd/LOcMHvIXxsqKZcFboaaf0aQYM65nfJEZnW0nwcXgsFT9BIqKsgU22f30yQwYSfOexPELYcBFyLTDiwocjPkOfrGWKjAVyjYg6n4WxcDFz9lXJaR+Sv2lFctZBoeP2XH82NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OMa5s6pM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5154XX8L007746;
	Wed, 5 Feb 2025 07:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jfrF8Yx5vq/d3PSJXlQq3h
	YtzZ05AIDRWZvm8yPFQBA=; b=OMa5s6pMtynO/Ti0t8UwgtXqho7rsfUhst8Pbm
	8dVryWz/GgzRkMVJ0aUbVIHVyNJfjJQLbtTOCspxXsu2qUYmlGcqkY7xXIkN/x8V
	tdYRmzsGIhqh/Bb0Izoxg/RiJvSwX9osaCZTl6FHYeHGYO43mMnOb+SXQQwnjifa
	yypp6HyQU5gxTKMQhD0RVq5sFvX2B4huiS/3x/eHiHvBjqWonDg+3wem1BmnhHBg
	DgGq/oZp3QorXJT5PAtHWZFeZcUKF84rOsMxr4ak//h8jLo3vgYEZkMIZQFvbrAg
	f9KVv6cjMoHrwnpmSBM/AnRhyp0a8LtyTCDl00Rye/DlRtTg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m12p8c2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 07:47:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5157lncA028589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 07:47:49 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Feb 2025 23:47:46 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <quic_varada@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH v1 0/2] Fix USB vdd info for IPQ9574
Date: Wed, 5 Feb 2025 13:16:55 +0530
Message-ID: <20250205074657.4142365-1-quic_varada@quicinc.com>
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
X-Proofpoint-GUID: 3D8_y6nV0PffLL3VQDwKTsK5HnU0IWpz
X-Proofpoint-ORIG-GUID: 3D8_y6nV0PffLL3VQDwKTsK5HnU0IWpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_03,2025-02-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=522 adultscore=0 malwarescore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050061

Use correct regulator for USB phy.

For some reason, the dt-bindings [1] patch posted and Acked long
time back seems to have slipped through the cracks and hasn't
been merged. Including it along with this patch as both are
related. dt_binding_check & dtbs_check passed.

1 - https://lore.kernel.org/linux-arm-msm/170266996013.286103.17303148912355511017.robh@kernel.org/

Varadarajan Narayanan (2):
  regulator: qcom_smd: Add l2, l5 sub-node to mp5496 regulator
  arm64: dts: qcom: ipq9574: Fix USB vdd info

 .../bindings/regulator/qcom,smd-rpm-regulator.yaml    |  2 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi      | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)


base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
-- 
2.34.1


