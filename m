Return-Path: <linux-arm-msm+bounces-34893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B769A373E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268461F20FE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FB618A6B9;
	Fri, 18 Oct 2024 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lZzLMneo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD6D18858C;
	Fri, 18 Oct 2024 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236869; cv=none; b=H1MWw9vfZFs6WBzb+EelkmtGGeHFSwpwoCk8HSd9QYy/w5ecTHHnHMpZvNTlON7ZcPLWPEyAAO7wBOMPebRbY5QD72QEZ1bdSFbbfL5x3p45qOHl+dIjACMftHFWMfPYJAoyDT0K9dNjixv8V0XNoGM39QQynXKZXO8syKcUCCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236869; c=relaxed/simple;
	bh=AnLIugQj/7QaFvKbV6Ooub9oCgGaxNze0/2tCLQ1A+4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XVMeISIX/iz8//E5aFemTFnTIFkd07i+mluxPo6KV2/lffGr5qlyQ/1IhsRbP6VZRCdE171q8Hz9klzPGSQmZ33qWO+ilXSOSHfvwC56NMUaTcMlE05oQNGBNHkjQ0jbL95K67g+y/LoIH0Kb/QqaO71e8uKlQ7wzok15SedEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lZzLMneo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HHZZm0001759;
	Fri, 18 Oct 2024 07:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6G12s0iokKS
	9A6JKdn0VB5jZ+BbiblWqw1R2exL2bsU=; b=lZzLMneooo6+XwHYBXn0nQ0N3jV
	KNGzJgwnEZi49Hw7mSnU+vouX8AbWPj1cblsIoZsTyXUd0VcEccx9gSnOWsLY4iT
	EwQdmjlKAiIe17yFhRegoHxhXC/6InM7Incfor+49rtwcBh9SeZxPNbKm6mz8g+9
	ZICUxlzxIN8B2em6vGYjGvo9L3ybWMNjtoqbcxpU7GcVcyRZJKaGeOJBgDW5coIb
	cHlEyoUwYbHX/GAmuWMk63Uv/GZEF4klXbu9fc0Dq6Sbk1qP6TRhbs+wK9i4YZU6
	Y+3XcHCzPPDvfgaW20mNjI3qFks8EcThi/gASyLPVD5L0E1UD+xv35WzyqQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5d9j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:23 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I7YLCw001446;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 427j6m3yja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I7YLVn001437;
	Fri, 18 Oct 2024 07:34:21 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49I7YKbw001435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 07:34:21 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 4CCDB21C51; Fri, 18 Oct 2024 15:34:19 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, Kyle Deng <quic_chunkaid@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
Date: Fri, 18 Oct 2024 15:34:16 +0800
Message-Id: <20241018073417.2338864-3-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-GUID: y5VeEXjel6U-H9stu2Kt1lcL9lF19KWC
X-Proofpoint-ORIG-GUID: y5VeEXjel6U-H9stu2Kt1lcL9lF19KWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=934
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180046

Document the Always-On Subsystem Qualcomm Message Protocol(AOSS_QMP)
on the Qualcomm qcs615 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..ee3414a77e38 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs615-aoss-qmp
           - qcom,qdu1000-aoss-qmp
           - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp
-- 
2.34.1


