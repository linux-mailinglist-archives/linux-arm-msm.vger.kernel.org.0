Return-Path: <linux-arm-msm+bounces-72555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC27B48A6E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 160983C58B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410432FF641;
	Mon,  8 Sep 2025 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b3SL2IlO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF14C2FF156;
	Mon,  8 Sep 2025 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328100; cv=none; b=cA6X4v2viBSwNUMim8iz8Qz9eWBbG6zfs9ayD5z+HrOP4fLNkfGuGXB/O6/RX3c2Jfh9aeEmrN7/IBHxA6tL6xS6aA+3i2KO0KWuwxmYBiMzaBN7vojtYF4ZY0/qGMYa1uGStKsa1rJuAHqRTVgmNLRKwF6u7F0vFjRi/SblBtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328100; c=relaxed/simple;
	bh=uHbqBMASMEUeoLXv6a+wtLom/UknT3Is6tYXBjdurDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=olcBv1GCHCHKLQ+/0fr8tAwzd06kyISLYL8qpkGpPXoQdHQLX+yzQgHCpIuPjXyLCOgqNO8fYhAmYP5bMtYIoX3jX0kgPRMG/Z1bxEa/nBv/3tbVzm6B01xeKVX18bvzt20dymn7ux0e9fo2I8NbiuF2Wd9yZSFBh2iKtlRi68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b3SL2IlO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588AXAYR013496;
	Mon, 8 Sep 2025 10:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zshuamdq2d2
	s4GWDk/VefMB5jHdHIlBqew5eHum2enI=; b=b3SL2IlO+iBeFM6KfR3qMUmLLtS
	AbTHZEw4qshjcV9zsoIxX0gnn0LjxUFKjYYEqemyRUNANcwv4u59y+Df6WBKw7bl
	M8Eb6fit3vW7Be+Yx1F8sbOTP4MN4Z/awvjm2Nqoh6O3rOs5bfHR0wBz3X+cmH13
	GrOxb+ArkKTCa3PfHkhiZ3ODfkwSAlfL4rzIUYwuBDoYpbtHhABPBB+2n97gAJBI
	E9ZQa4Wa081JGgTnIY1f5TXxTWYShmIV9I0JP2h6oQXrusgYwReWrFMJPqeXUWWT
	kDOdyM2npxgrlqXya0pj0MtSHGEvq1jjUJXHIXprg6e8O6ckgXh2JelNowQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhds434-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 588AadZB005906;
	Mon, 8 Sep 2025 10:41:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 490e1kh0pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:26 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 588AfQkj011949;
	Mon, 8 Sep 2025 10:41:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 588AfPP3011942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 10:41:26 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id ED2F75CB; Mon,  8 Sep 2025 16:11:24 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V6 2/4] dt-bindings: mmc: controller: Add max-sd-hs-hz property
Date: Mon,  8 Sep 2025 16:11:20 +0530
Message-Id: <20250908104122.2062653-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
References: <20250908104122.2062653-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OITx_P8SCXaxzcIoZJUllc6jMtcFQYx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX251i4Wye5WVJ
 kUtHNx/3hChrrC2lHJ7bHfi2WJ3e3IolZ6UQoIsBmVpHm6Z5CkMel138p35GZtPufZiCNjrskAh
 gE5ALbL37sXlUDIkMmL/jH1k0WqTum9adpa8k94NZGYzPxx9K78SMAg65hUmF/mp8M71m06yjpL
 1SKyCHyAQxQlx5ZgnujonMw6HtNN3ioBXCSNOrtP4ixcgRLylf+JMK72pP0Ho1DPywYQKvJuLm3
 vQscAEfR9lZhS0q3lHh/68Eldjc3Zlh/+nl6RTevHyhZ8txQBq0cnV01YvH7qLsnnogra1wKo7V
 fn6sXaQqkbzlkCmrySa6rI/23WoF9TC0SqOt+C2lztU3GXV/Nc61LxGo7JamN7tVRyNbrihfNps
 n3CNgzo7
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68beb2d9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=mO_P381atgLiKTSE1XwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OITx_P8SCXaxzcIoZJUllc6jMtcFQYx1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

Introduce a new optional device tree property max-sd-hs-hz to
limit the maximum frequency (in Hz) used for SD cards operating in
High-Speed (HS) mode due to any board electrical limitations.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 9a7235439759..7414d5522dfe 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -93,6 +93,14 @@ properties:
     minimum: 400000
     maximum: 384000000
 
+  max-sd-hs-hz:
+    description: |
+      Maximum frequency (in Hz) to be used for SD cards operating in
+      High-Speed (HS) mode.
+    minimum: 400000
+    maximum: 50000000
+    default: 50000000
+
   disable-wp:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-- 
2.34.1


