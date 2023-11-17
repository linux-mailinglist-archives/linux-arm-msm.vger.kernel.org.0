Return-Path: <linux-arm-msm+bounces-858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A81267EED86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BEBC1F22936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 08:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D501E56B;
	Fri, 17 Nov 2023 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nJ3J8n+a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202A6B3;
	Fri, 17 Nov 2023 00:28:51 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH7auqO019415;
	Fri, 17 Nov 2023 08:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=km0xHQOEYSbU7+jwvtfV4jBETkktVgWD47hMaDXCG/M=;
 b=nJ3J8n+aXOP4KX1pqlCVPe+8zJUm1rVkjWo34tQbnG/Z5riHP0bB+z5u6Tl+5KlQMARl
 wMDfiJccBx8HQDcTM+PIhImxbe33nHWfRK3ujgaLMizRrll3Hj2urdWgli/jzf5ncq3P
 wiC4V7OXDi5B7XtwRS1gtwjvmh/O0a6kG2S29dL5jIv3DfOnhDr8bgoL32U+bFuIwQUI
 ocHN0otcZgtFGW3QnDBhZmowmJUGkfCjuEXW0JHRz2thvUEfb6i8FYD1dWrN0iR4eij+
 fBVvBxH+TUmJst0Ewa5/f8uzIk3dOs4ahXSrMLzjAOQuWNvGXRNDytYPNx7tD0/Q9d7g mQ== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udmw424vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:28:35 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AH8SV68020822;
	Fri, 17 Nov 2023 08:28:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ua2pmpsw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:28:31 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AH8SVel020816;
	Fri, 17 Nov 2023 08:28:31 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3AH8SVsC020810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:28:31 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id 1787E2204F; Fri, 17 Nov 2023 13:58:30 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        tglx@linutronix.de, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5] dt-bindings: interrupt-controller: Add SDX75 PDC compatible
Date: Fri, 17 Nov 2023 13:58:29 +0530
Message-Id: <20231117082829.609882-1-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: sZC3GK9LM07SO2CBOBZSEkBCBRuQeYqH
X-Proofpoint-ORIG-GUID: sZC3GK9LM07SO2CBOBZSEkBCBRuQeYqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_05,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=511
 clxscore=1011 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170061

Add device tree bindings for PDC on SDX75 SOC.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

Hi,

Changes in v5:
 - Rebased on 6.7-rc1
 - Removed all the applied patches from this series.
 - Link to v4: https://lore.kernel.org/all/1686311438-24177-1-git-send-email-quic_rohiagar@quicinc.com/

Changes in v4:
 - Addressed some of the dt bindings check mentioned by Krzysztof.

Changes in v3:
 - Clubbed all the dt node into a single patch as suggested by Krzysztof.
 - Removed the applied patch.
 - Addressed some comments from Konrad and Dmitry.

Changes in v2:
 - Added the CPUFreq support patch.
 - Collected the Acked by tags.
 - Addressed some minor comments from Konrad.

Thanks,
Rohit.

 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 86d61896f591..9342fe510598 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -35,6 +35,7 @@ properties:
           - qcom,sdm845-pdc
           - qcom,sdx55-pdc
           - qcom,sdx65-pdc
+          - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
           - qcom,sm8150-pdc
-- 
2.25.1


