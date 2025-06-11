Return-Path: <linux-arm-msm+bounces-60919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 525ABAD4BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 08:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B394417AC3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 06:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C6822DF87;
	Wed, 11 Jun 2025 06:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IN6in0Pa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B822D4F1;
	Wed, 11 Jun 2025 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623896; cv=none; b=LpQN+Fs+gAMdRIRGV8/sfO9TyQgFKqU+3us+y8vPtMRoY0G1m3vng/RYawA1KXKnpvtlo5riBAwJp3PXjXD1X+Wv/dzxo2oGi1nwpnYdVhVp+rCiXCUIZHWUQBejBYRiUZXtH7Din46s2q1PWMjzRxkTknNy7maVwaN6kCtIWdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623896; c=relaxed/simple;
	bh=khWMDJprDx37PU5uXbpU1bwIkURj4ePwzh4m9aSAUc0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIlcDsvjRkTRIcILZoCnj+xYeccXolWmgz6g6igigPxslqSHKWjugBKJS0+sENRFmVNYHDNTX8laITf9EoEyR4Q5EjazGFPseir3bh9VOOUZ4vVeXEBnCmu5tQ9OHbu0uNa9yD9L8Asz4GBJOCTmHrkEi/gxo19UeGfeoonMftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IN6in0Pa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqgl023665;
	Wed, 11 Jun 2025 06:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7z1AdV26dRKNSLLD9ojaztR5K5WBMo0d73u6vyMdlkI=; b=IN6in0PaISwJOMis
	SysQolTPzFaKdJLhl854/2M/LTmd/K3DGFw0Mju+F/FzGMfmO/7jZ0ofYy2Cyl+E
	lyUhGCVVNH13gvFl/H09uyUbEM8qYtgt+ZilHVy8g2m0JSgW3+F2IXSkgL4PniNe
	ld6oYWR0Iu1lM8HN+cCUCyXrhMx/ndikT59uJidMgeaURfNHacPDnTiRG8j3672O
	jW5HHua74rXT3Fy8td5cmIVPl8yzfE4nnOTAJc2Mz4n7YDw6/WZ59J11Ej+H2ymT
	OVYaQnC3pY3hFTvnQrA3AkJGy9GLxbcPcGXCHLf0UyUsu6vSCfu/bM5igsEXPMte
	k3QzZg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqckwve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 06:38:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B6cBOB018846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 06:38:11 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 23:38:08 -0700
From: Gaurav Kohli <quic_gkohli@quicinc.com>
To: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_manafm@quicinc.com>,
        Gaurav Kohli
	<quic_gkohli@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: thermal: tsens: Add QCS615 compatible
Date: Wed, 11 Jun 2025 12:07:42 +0530
Message-ID: <f380fddb476fcef13409176abeeb93737f900b07.1744955863.git.gkohli@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744955863.git.gkohli@qti.qualcomm.com>
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1NyBTYWx0ZWRfX3lDkSy6SXvmQ
 VFvuJM3pFFM3S8z1FVZ5HV0EtwJAcjy7qA/dSVPKlYpPGRNPHxDE6MG+khsUeAd2Nuejvp2yJiJ
 BHUz2NyDKQmJRvvde6W+zFSDRVtwf4CvbdhyLJXYGjtz8EfI2XzRks0WaD6XF/qS3q9YFMuOlVw
 +mENDWqxdZcDamu+3qDmbu69PxQgRVeL8MyiZPTlJmlLHkL4wxk9Gfyu3GdrYFP2dsEhhr7lHnW
 qYRlE9DeLJJ2sgeiXJNy3kJmNKSRQZaAA4qm+CClEksBpulWzxjibzoGpkXpJtkPVuS4bYyxXri
 OzYlDUbr22zE4p8O+FZLqOttc4/VPiW9jt9GMJ3eyrbJyYqkf2+DSOW6EacU9t4rrVCdEOXouI4
 m1q8GVGgWEYHUlELu/J4Fdg64FzhMilzY23/kI7ndESXuKmeGBkloVSBtBvwqqi99QQwGvOW
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68492454 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=Pr_X6dJPkNF1GrwpdJQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yPO4Ggdu4Yziffx56CSBMWaXCOn3mpDZ
X-Proofpoint-ORIG-GUID: yPO4Ggdu4Yziffx56CSBMWaXCOn3mpDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110057

Add compatibility string for the thermal sensors on QCS615 platform.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f9d8012c8cf5..de9b667a79d3 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -52,6 +52,7 @@ properties:
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
               - qcom,qcm2290-tsens
+              - qcom,qcs615-tsens
               - qcom,sa8255p-tsens
               - qcom,sa8775p-tsens
               - qcom,sar2130p-tsens
-- 
2.34.1


