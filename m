Return-Path: <linux-arm-msm+bounces-35574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A83AE9AC66C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA2261C2113F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419C619C56D;
	Wed, 23 Oct 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8QQp834"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE415B971;
	Wed, 23 Oct 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675692; cv=none; b=clIx+OvliiAYKEZaZXZ4WlYdmUmL7qoWG9hldzrxm5Y/vhPQdRHh9khPMvtg2om3Y/nk5WbDPdL3X7vU/ui4v8j+W7VzJhsryDzKI1Ns9vE1apNta6Tliju3ab63K373jUYNH1Rvt6PcvlhEXNahlHIuHLbEe/vmdLP5iHu4sDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675692; c=relaxed/simple;
	bh=zU5JU6gLWTauEybew2U8TiaaQtYVDi/JlCeHGuSD3BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pN8cbL0S8tGCkQ1SbIR5QQInTdlMhK4an2dEl7RzgKOi7Nuqgcp+3odHl58Dmj13DiLgfxYEywZ/hUIEjRV8n2unYZfwjVj+P6gXM+UV1ZJEMHvBy6KsdnGLu135eNjKGYgc1xyagUyCv9hOy97p9QwBgCDouIIiNGIcdyuOVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8QQp834; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLfFxG005066;
	Wed, 23 Oct 2024 09:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5VDWiXOJYoI
	J0IwOF+NqtgyR4NXGo/C50y2/2CMqaTY=; b=h8QQp834preVyDumwN5RoKXrneu
	b1ytSmGOX2d6QNQvZpm2cpu3OcFvwtqjzjn9HVy5ps+xj8kDJ04jhB3WVA57EvKb
	zyzn8cz0ZHTLkIsECyd9QXsTPCltXxbnWb2cMVLPe3Yysa9612eYLE8oqSA3Pb0n
	FSW6uoFJa6g4Ap7AXfWRPTyeMYYytt247468iv/laPFGGIVMc+IZfIOgtDRNRxuG
	qNT4875DVF32wzyZzHq5On89lbuoO4wH7O2HgxHFH6r/uucbBuW1McEi45tmMh7i
	UYUJCJXTYXGvvQV06THCfuQKBCFh1MjNddzVoh+q2AALzooFHXBHw4q1a1g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em681m88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:06 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9S3gK016254;
	Wed, 23 Oct 2024 09:28:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 42cpckqq23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:03 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49N9S3BZ016238;
	Wed, 23 Oct 2024 09:28:03 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49N9S2kL016229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 09:28:03 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 7C66C137A; Wed, 23 Oct 2024 17:28:01 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, Yuanjie Yang <quic_yuanjiey@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: mmc: Add sdhci compatible for QCS615
Date: Wed, 23 Oct 2024 17:27:06 +0800
Message-Id: <20241023092708.604195-2-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
References: <20241023092708.604195-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Rc0C6OYwDrNaDhPnZ-RT8UiiEcU7pVPp
X-Proofpoint-GUID: Rc0C6OYwDrNaDhPnZ-RT8UiiEcU7pVPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=820 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230058

Document the sdhci compatible for Qualcomm QCS615 to support
function for emmc and sd card on the Soc.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index b32253c60919..164a45cdb972 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -43,6 +43,7 @@ properties:
               - qcom,ipq9574-sdhci
               - qcom,qcm2290-sdhci
               - qcom,qcs404-sdhci
+              - qcom,qcs615-sdhci
               - qcom,qdu1000-sdhci
               - qcom,sc7180-sdhci
               - qcom,sc7280-sdhci
-- 
2.34.1


