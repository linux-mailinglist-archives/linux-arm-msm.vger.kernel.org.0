Return-Path: <linux-arm-msm+bounces-34948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A7C9A3D03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8118D1F22580
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9291E202649;
	Fri, 18 Oct 2024 11:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ijVpr+k9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF592038CC;
	Fri, 18 Oct 2024 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250000; cv=none; b=ADsNpYNMUnRxf7zeAs5ZYafLELWZVyrfRCEPRRyOMc2qwBpYZDDpSA1eV5asg5bXWT9FSSEujW7dUWnYWhOnu2ihFzYUt/MEln0cjS0M8IMBQm8REMLy98bZ6rxcPccdj3Jm8vplXRnDNJeA6IhLT81YmK0dd9M+D4fNyj3VxPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250000; c=relaxed/simple;
	bh=N1wYFuwrQR04TqhhKJb6bi6Ifwdu2UNAQc7SXMTQNF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iiZ0J8X2TNT36dAU8lkc/ymPaMPTdBs4C1x6v48IqC9c/fSbUC/zVsxaBKqnUE4z4NBxW4W1rgT6V5AtBkYtlm+VYYk2IFhGJeY1h0qdRZeHwIpz7TdJvqNKNhTo7a8tfyPw2eTMGgJysl1k3zFOo0JuhnPKTLAy2HRo4GjtvLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ijVpr+k9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I1gNAl022062;
	Fri, 18 Oct 2024 11:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TfJe2aE8LH09hf7hfii7kDsn354d88+5UnkT3V0mIlE=; b=ijVpr+k9Fxb5PS4a
	z0ns4sgL9KzY2Oeq06s01ujsdTWPuNo086k7WjWXEeVGqdHV7Z6JAi0A+vIl70go
	ICiYP9peBE/20LGxLDq41ETF6QFe9C5cxtjv+VmXbB/ykpvQSbkIjevc5r1utDmO
	ef8BoePGwcxiR0MGrhOSpbwZsFjalb3CLttDO0pMEV6VqgEh551q7QI+Undd72Dz
	F+NOscMyXrUkphhYrr0tnPYsGLH3Hdgvo2viDj9onNPK9gSHWSVBVORFy/Zs/aiw
	y3UZbchpXLhpG+Tww/e11cIx7uNQ4qDReWdRprY5i7JON0iT+xy21/68DY/Cy5a3
	5Lc6lg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42be8c9gke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IBDCUj011793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:12 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 04:13:08 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 18 Oct 2024 16:42:33 +0530
Subject: [PATCH 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-qcs8300-mm-patches-v1-5-859095e0776c@quicinc.com>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
In-Reply-To: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Jv1pALoS3DsSYsZ3R7OSnyOUSvNoZtGh
X-Proofpoint-ORIG-GUID: Jv1pALoS3DsSYsZ3R7OSnyOUSvNoZtGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=806 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180071

Add device tree bindings for the video clock controller on Qualcomm
QCS8300 platform.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
index 928131bff4c1..07e5d811d816 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-videocc
       - qcom,sa8775p-videocc
 
   clocks:

-- 
2.25.1


