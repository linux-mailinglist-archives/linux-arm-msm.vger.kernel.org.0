Return-Path: <linux-arm-msm+bounces-43609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7399FE4CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 10:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B76463A1431
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 09:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493381A23BE;
	Mon, 30 Dec 2024 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kjEFD/UB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AE3146A69;
	Mon, 30 Dec 2024 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735550852; cv=none; b=KURJQu9gE50qP1O4z5ZwDyfH4X1LHkscN/43RNVm/J+VBfZevEQjEhbMGb4/ysCFfo7xbzEPX2K8sw9BnEPPXpEb4TRnJpCId//JssmeMJJjPTRUXoIwfgSglbCR1H4/10agwOMhwZsn1yvXjrTtMgnwPULgxWtpiI+yUjIHpNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735550852; c=relaxed/simple;
	bh=5uOKAKwjsM68Q6YtG/lozsQSGF9q0e/dWNDJv9sBDDY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sOrycvorys8xIxiCjlkgGZfMG5Io7L1lUcgbtz+UJeDeGskNV0msIgfodBlqh0OHPCXAf9zOMy5s30PmCnbtgvdZJcUYni7v8ChoqaXkcQrcJD4cqn2W6v0oTENh2pRw/tqbicA31GK+OW/jWsUY3B1Z696Cvyuce4S86rXsjYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kjEFD/UB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU0iwED012638;
	Mon, 30 Dec 2024 09:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hM59UUw8LIFr1ETWpR+lCw
	1iX4/bmm3lPQmDVrt8nCg=; b=kjEFD/UBePtIkCiucGjwbNbcKv5SvTM3edruzf
	V4lvj4gpP9jfS5Zsoap52Pqdi2gvqrEO/drZOBS63GZLL2cjDDc2EQTaNP8ZL5no
	Ye477ikd3OdZhPbvssNG1e8hjTmkATLyTmtEQXjgkxDzyAPcjuVAzznnNpMU9xsr
	yEvhiqtS6FtH5kOfttaZjePcEGw4qXXeFdJ0/vUAI8BPOOnHeEXfZ4NgtXR7AwAe
	NeXlpfh4CwZyucL5ng4dfIwfN+pJeLlzE2nBDsBlsl4dSh9I5E1sAHGwoa79HCY8
	xKSBVyChHRzMmE4TLgSNkL9SyGJVfJWUJ/wLEynr2qqM3a3Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uh8e8ux6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 09:27:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BU9RPqk007693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 09:27:26 GMT
Received: from hu-ckantibh-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 30 Dec 2024 01:27:22 -0800
From: Sanjay Chitroda <quic_ckantibh@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Sanjay Chitroda <quic_ckantibh@quicinc.com>
Subject: [PATCH] arm: dts: qcom: ipq4019: Fix indentation error
Date: Mon, 30 Dec 2024 14:57:14 +0530
Message-ID: <e4193859e99d87e2450b78f1d480b661d65fa5bd.1734945223.git.quic_ckantibh@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jQlwZ-wLIS17hYUjEZernxN78GStOx7I
X-Proofpoint-ORIG-GUID: jQlwZ-wLIS17hYUjEZernxN78GStOx7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=692 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300081

Corrected indentation issues in the qcom-ipq4019-ap.dk07.1.dtsi file as
identified by ./scripts/checkpatch.pl.

Signed-off-by: Sanjay Chitroda <quic_ckantibh@quicinc.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
index cc88cf5f0d9b..5a95a2d03c42 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
@@ -43,7 +43,7 @@ nand_pins: nand-state {
 				       "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68", "gpio69";
 				function = "qpic";
-                        };
+			};
 		};
 
 		serial@78af000 {
-- 
2.34.1


