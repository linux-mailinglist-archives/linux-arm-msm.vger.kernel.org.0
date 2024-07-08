Return-Path: <linux-arm-msm+bounces-25497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515E92A375
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 15:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D360DB20F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 13:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17E3137747;
	Mon,  8 Jul 2024 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UOF3ZHiU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55303FB94;
	Mon,  8 Jul 2024 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720444157; cv=none; b=TD9NNlb/plka3PB7TYKHww8j+dRERHQx30w4Cw3ztCGziac2g1j/iUoCi3V6AO2Eg2utmFO3eYd/g2KST/zLGexU7ONdDsICd+NrHLDsIxvcQtdgFvSivS34XZVowtzQ0mx+TfXB1aZMhY3i0QvHGhvMrKPGenoKMtHpT9xmZX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720444157; c=relaxed/simple;
	bh=GjTNB3zDH3ATctlfn80t9lLpsiUIMmj7UmmLBpVk6zA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gRg0+VrXPZqCFetDCeF3LItN6DprFqM25TjQ+LOQrqn4PeerM36ptGtIJDVruAAwemWYolfIBVKBqOxqV+K9JkKkQ+OKd5SLgQqMcXbRhj+D9jaVAkMJTg67wG1iZGJ3A8WEwiZfcg9cjNGUb4L7N0VQLXuPpL6lwJa3qPP9J7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UOF3ZHiU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BQ4He014159;
	Mon, 8 Jul 2024 13:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XWo/XQvrUf0LV8xbB8hFSX
	+Q16NhhXZ/22In+apYhvY=; b=UOF3ZHiUcLJVa5e3Ad0cB8l8LvgiNNCVg+kNlP
	NYgghCme9C3ZRYnoPp5Zu+Nk7k2zLlNuMva15TZbPqn0nfESj70s0vXMgkvBusnj
	SVLa+Tr9i7Ufv/mr+ElwrfuozZbRf2nGIVDCuHE++kZwefXvEnoQyfugFh3gKadW
	9hGLtz1KdJAldfx3nXh7dYelYMPbhCclCc7pjILh+WmlFGzB39rme8vSwEYNJPQp
	57+rGcG1zMkC0VtNDNKaqroq7vunjL+2m0OE8jjUEGaFXTY/yYknVD5N2YTMgvxq
	1CCQ/XluG9sXxlHEjLgVdxqj/QDtVdyMtv99qmIGLP5JFCwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa63nff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 13:09:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468D93fn007063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 13:09:03 GMT
Received: from hu-jkona-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 06:08:57 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh Kona" <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: clock: qcom: Remove required-opps from required list on SM8650
Date: Mon, 8 Jul 2024 18:38:36 +0530
Message-ID: <20240708130836.19273-1-quic_jkona@quicinc.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: QJ_bi7Mqcm1-nqXMUzK5x39az0_TnSc_
X-Proofpoint-ORIG-GUID: QJ_bi7Mqcm1-nqXMUzK5x39az0_TnSc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_08,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=672
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1011 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080098

On SM8650, the minimum voltage corner supported on MMCX from cmd-db is
sufficient for clock controllers to operate and there is no need to specify
the required-opps. Hence remove the required-opps property from the list of
required properties for SM8650 camcc and videocc bindings.

This fixes:
arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000:
'required-opps' is a required property

arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000:
'required-opps' is a required property

Fixes: a6a61b9701d1 ("dt-bindings: clock: qcom: Add SM8650 video clock controller")
Fixes: 1ae3f0578e0e ("dt-bindings: clock: qcom: Add SM8650 camera clock controller")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml   | 1 -
 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index f58edfc10f4c..bd9612d9d7f7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -57,7 +57,6 @@ required:
   - compatible
   - clocks
   - power-domains
-  - required-opps
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index b2792b4bb554..8a42e2a1a158 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -44,7 +44,6 @@ required:
   - compatible
   - clocks
   - power-domains
-  - required-opps
   - '#power-domain-cells'
 
 allOf:
-- 
2.43.0


