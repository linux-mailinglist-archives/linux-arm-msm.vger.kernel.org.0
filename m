Return-Path: <linux-arm-msm+bounces-33764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FD997B03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 05:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC0D283B08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 03:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D14188A3B;
	Thu, 10 Oct 2024 03:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HUcXzspJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0867D18593B;
	Thu, 10 Oct 2024 03:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529562; cv=none; b=QxLd4+bycFE6f8NK1T0GR3/0PWe2xap0B6AOR92wNl/0jUOSvQ8kEn6Gb4puo5KI9GIylXTiTQCJkuAtBnk2rSBzGpnvaIEjNb8GVNfn3zmG1/92lHr3ww9kKhJmJqi8bP0xlKaSwoQOzbfkSX14A64/SrTMCONK7FBdnsRjET0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529562; c=relaxed/simple;
	bh=H9/1rm682kIpqEYlTv9RjUv/KtXDeN/GSlWZNo2+UDY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=ihg9ex2ADr1/DWaq9Nq70VQl6lDbLWNK/NNFLi8FVHCsssSZUwIoQnzGS6r6qzkrewP3QjGVnWbf15ICfb14HgjhcH0y3yO1TKxAmICxMptQhNvqwHae9jFDagC20qINnhnx5cS7QYJVNbaRNhyUtwznZ9v0pcSd9cU4ktnedes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HUcXzspJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1cqeh029507;
	Thu, 10 Oct 2024 03:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tOPtG7a4aMHdOzTcxr1162
	f3diaXGmVyoleiBfe862Q=; b=HUcXzspJ/PLANQcQMbeDzCvBKe0zAxlQlad51z
	lVh47yhgD5fC4iRjx6xLGtrjEECVrqUs4rHYdFJYatMz4ayigJTvr1+aAJnnl+pD
	wxIJ6c6jK1dQxsaAKvtcsE7Idgzy4pTrm7gVwhGqIOUwKh28Ocf6/oC+K7nwCWnO
	WfwzalW8Dm0cJWP49p3b2WzTXpLxjd1zwebdA1H8T0B+90siiu9uOanhVAS0jY3S
	q2BsxtfBSW/B82g3yFl9tBEDVJ0AI/mm0OFzNjKaYL9/JQAnqJi0AaGgQcQ/mT7d
	A7Sv2M2ttXfL/Wgt+EX2F85vTUyekxSFrxYB/vFu9ZDwhrTA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425c8qvecv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:05:57 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A35t2f027693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 03:05:55 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 20:05:51 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Subject: [PATCH 0/2] Enable ethernet on qcs615
Date: Thu, 10 Oct 2024 11:05:35 +0800
Message-ID: <20241010-dts_qcs615-v1-0-05f27f6ac4d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBEB2cC/x3MSQqAMAxA0atI1hZacaBeRUQ6RJtN1UZEEO9ud
 fkW/9/AmAgZ+uKGhCcxrTFDlQW4YOKCgnw2VLKqlVRS+IOn3XGrGuG72dTWNVqjhhxsCWe6/tk
 wZlvDKGwy0YVvgUeA53kBWIdf/XIAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529551; l=960;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=H9/1rm682kIpqEYlTv9RjUv/KtXDeN/GSlWZNo2+UDY=;
 b=xNeJRtmdBQkq3WS1HUWSTZJxI99btsl3X/UGyWNeKM+v27idQNuq892E6v0aT2HP4Iu7xj+fD
 74Qz7vkes/PBzPxInzAhaOSVI3ZTvZVq0Q09JogIbRNseMRyf6NNlRX
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gcWb3X4aOL6V--wFRn8Y4mR_3ca43Nm6
X-Proofpoint-ORIG-GUID: gcWb3X4aOL6V--wFRn8Y4mR_3ca43Nm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=445 malwarescore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100019

Add dts nodes to enable ethernet interface on qcs615-ride platforms.
This platform operates with RGMII interface and lacks SerDes. The EMAC and
EPHY version are the same as those in sm8150.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/all/20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com/

---
Yijie Yang (2):
      arm64: dts: qcom: qcs615: add ethernet node
      arm64: dts: qcom: qcs615-ride: Enable ethernet node

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 105 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |  27 ++++++++
 2 files changed, 132 insertions(+)
---
base-commit: 70c6ab36f8b7756260369952a3c13b3362034bd1
change-id: 20241010-dts_qcs615-d7fa4bc599e9

Best regards,
-- 
Yijie Yang <quic_yijiyang@quicinc.com>


