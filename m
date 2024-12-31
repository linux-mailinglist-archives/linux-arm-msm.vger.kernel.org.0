Return-Path: <linux-arm-msm+bounces-43712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0279FEDA7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 09:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546BB188275F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B1918C004;
	Tue, 31 Dec 2024 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YXyTSWrA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9734E190497;
	Tue, 31 Dec 2024 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735632603; cv=none; b=Y6Pnb9dGI6kvKH6K5bjBmZgAffX2YslCxYUbocBZWYmSoDg5gjX3rhtWouW+zvY/Wz7AFz8c9WamsbJ4pMiLOczcfEuAfoWhDdRsxC6zi3kPHSllrPmTi40b6gtOORoOrIxg2GreJHHNjD6ms4LEAJc/oYkOSDDzMnRm90ZonRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735632603; c=relaxed/simple;
	bh=e84zlxbppE+nmtXojNfs/Zfi9dvHONH4/0x5EPquu9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TWlAd0IaESTAfx+n316xU4v4IktfVfbpUghuvR3ISrn8aEu3FyfZBjlY5YtlJyP/OHhawMD7I8HrsNkv2F2CCPVvzlPhmUqHWNqnvrcXzxp1a9HJO+LW7Au6VApRdmNBrppn6KyprcdFkikXCcP05VQt7ocr8eOyv6gXA79kUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YXyTSWrA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV32hCb024010;
	Tue, 31 Dec 2024 08:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	joyGl2YXsI5VbQNnYCYOVHCqcNsxinfEwCmjRBSiRYg=; b=YXyTSWrABLNZeFkj
	+X2SU8G8LK0AecE3T0HqGLy/ZYYWoJ6GG8pTWOYRorQIY9hflJMND1giCvDLgdpp
	BsYLNkH4FjdDIOHxk5IpKpIGJCNVUzP++0QQQsWaeLaDe5Qk3lzfZtoOyljsKQaD
	3v1SROKu0NrkNsN41+7tpCFlBdDyedm7HlFLJjg5es13Q/kiff0c4XLFIYM1cRPR
	OdYaGDxlh/FKZJUI2SiIAqZ9LNXGhBwfUJVPpaU6Pv1DyJzA65anXdER3ZPVfetS
	+ijwtP1JV30c8LwODApJbTQyGXpcoH66ViOQjdv+uFXhXIzcn99VvEV5b1OG6rgL
	vni8eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v8c3gkc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:09:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BV89vZu010256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Dec 2024 08:09:57 GMT
Received: from hu-prashk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 31 Dec 2024 00:09:53 -0800
From: Prashanth K <quic_prashk@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <cros-qcom-dts-watchers@chromium.org>,
        Prashanth K <quic_prashk@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] ARM: dts: qcom: sdx55: Disable USB U1/U2 entry
Date: Tue, 31 Dec 2024 13:39:32 +0530
Message-ID: <20241231080932.3149448-3-quic_prashk@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231080932.3149448-1-quic_prashk@quicinc.com>
References: <20241231080932.3149448-1-quic_prashk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tnFr3mocXIj6fTPcGHuk4vLTs7NNgCpl
X-Proofpoint-ORIG-GUID: tnFr3mocXIj6fTPcGHuk4vLTs7NNgCpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0
 mlxlogscore=512 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412310067

Disable U1 and U2 power-saving states to improve stability of USB.
These low-power link states, designed to reduce power consumption
during idle periods, can cause issues in latency-sensitive or high
throughput use cases. Over the years, some of the issues seen are
as follows:

1. In device mode of operation, when UVC is active, enabling U1/U2
is sometimes causing packets drops due to delay in entry/exit of
intermittent these low power states. These packet drops are often
reflected as missed isochronous transfers, as the controller wasn't
able to send packet in that microframe interval and hence glitches
are seen on the final transmitted video output.

2. On older targets like SM8150/SM8250/SM8350, there have been
throughput issues seen during tethering use cases.

3. On targets like SDX75, intermittent disconnects were observed
with certain cables due to impedence variations.

Disabling these intermittent power states enhances device stability
without affecting power usage.

Signed-off-by: Prashanth K <quic_prashk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
index d0f6120b665d..f431cdfbbc3d 100644
--- a/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-sdx55.dtsi
@@ -613,6 +613,8 @@ usb_dwc3: usb@a600000 {
 				iommus = <&apps_smmu 0x1a0 0x0>;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
 				phys = <&usb_hsphy>, <&usb_qmpphy>;
 				phy-names = "usb2-phy", "usb3-phy";
 			};
-- 
2.25.1


