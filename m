Return-Path: <linux-arm-msm+bounces-27445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9399422DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4C92861AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A3319FA68;
	Tue, 30 Jul 2024 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GtCtvSRJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426041917C1;
	Tue, 30 Jul 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378292; cv=none; b=G7Zs3LlZj62A1wezaJwD6PFpPWjL7BP5afH6s3XVsylvGeNBS/N8UA8ASdNXheHxirIH3lXdCF4zALQN+KXolBrCEGmRha9YvXu+thPYyEDT2RMk7ILpBfX7nKAVCrPa+of1OQb2bXpyo+KW/RqxUalagL2lPQ6FrXLVibPLK8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378292; c=relaxed/simple;
	bh=Y1YUWTu9p9TtMmqaAUmxjqmhhFsd+wclbBmjz8m2ndc=;
	h=From:To:Cc:Subject:Date:Message-Id; b=m6YNfhVqQ4UGQgwSmmroIcfxc0VZSxCDqSD7FWk0jeIkYOlbESdUW37Qv3GZyyvY+FPN3+HBhoGcQQSFy4NqrI/dKcGHWw7SI+DRDxDyc9DPfxYUGU+BMssQEnX91Fbn+QJD0uBaoex9xPb3tV58hMG3guFnzIsnwOWBjA3+27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GtCtvSRJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UHefKo028667;
	Tue, 30 Jul 2024 22:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=y18rRoiX/nrp
	dfsMJ1ZjbT1khAyK+E8nAD8l0ekOAD4=; b=GtCtvSRJEo2ac+5Jhabs5fK0Jqic
	1qEkwlNebzVqLYpE4kJNy1SeqSXM7LExsHQ/IJyLqKIlK2fN262VEBapB11OliKk
	Ozr8SAGfdPoNzAdEdp1BcFO47g4PpgBehqFxW3+WkMDOlbeNxZ9xqJieRpIx3CHV
	AN2ArGoNv1q3jLSOqxXZe5BvfHLv+9WPFqNxEa1kCXk2xklOnwEw0rTQVP7X8teg
	yCxPtnCaWf1ne23AUplvRHf35fopBiwJ3U4ibr3ycO6v4I7Y56UT6V4lnNoiHim9
	2KD0ps2QQmbr6iwzA18vlZQTdWwzrQfy3fIdmEtotqFzsR/Ckrtu6FZl+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqw79429-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMOgOq024870;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 40pfs7cjpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMOg0i024855;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTP id 46UMOfK5024850;
	Tue, 30 Jul 2024 22:24:42 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id A820A5000A8; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 0/8] Enable EUD on Qualcomm sm8450 SoC
Date: Tue, 30 Jul 2024 15:24:31 -0700
Message-Id: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QxQ1gt92dzC7_pcbrfDmtqqQE9za5FpO
X-Proofpoint-GUID: QxQ1gt92dzC7_pcbrfDmtqqQE9za5FpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=524 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300155
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The Embedded USB Debugger (EUD) is a mini High-Speed USB on-chip hub to
support the USB-based debug and trace capabilities on Qualcomm devices.
The current implementation lacks in below aspects that are needed for
proper EUD functionality.

1.) HS-Phy control: EUD being a HS hub needs HS-Phy support for it's
    operation. Hence EUD module should enable/disable HS-phy
    accordingly.
	
2.) Proper routing of USB role switch notifications: EUD hub is physically
    present in between the USB connector and the USB controller. So the
    usb role switch notifications originating from the connector should
    route through EUD. EUD also relies on role switch notifications to
    communicate with the USB, regarding EUD attach/detach events.

This series aims at implementing the above aspects to enable EUD on
Qualcomm sm8450 SoC.

Elson Roy Serrao (8):
  dt-bindings: soc: qcom: eud: Add phy related bindings
  dt-bindings: soc: qcom: eud: Add usb role switch property
  dt-bindings: soc: qcom: eud: Add compatible for sm8450
  arm64: dts: qcom: sm8450: Add EUD node
  arm64: dts: qcom: Enable EUD on sm8450 hdk
  usb: misc: eud: Add High-Speed Phy control for EUD operations
  usb: misc: eud: Handle usb role switch notifications
  usb: misc: eud: Add compatible for sm8450

 .../bindings/soc/qcom/qcom,eud.yaml           |  17 +++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts       |  15 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  29 ++++
 drivers/usb/misc/qcom_eud.c                   | 125 +++++++++++++++---
 4 files changed, 164 insertions(+), 22 deletions(-)

-- 
2.17.1


