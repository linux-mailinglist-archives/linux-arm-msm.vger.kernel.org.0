Return-Path: <linux-arm-msm+bounces-74093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4BB853B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 589A5541613
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3246930C115;
	Thu, 18 Sep 2025 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oC3361X0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D527D27AC4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758205086; cv=none; b=qOWaduq4g2t1fa2f7FcD3I99RnCSdcX0UQ4D4Ew8xtME7R+iONHBYjMwSgY3C/Nv1esSPxmX8B6lZaOu8QKCkxsxHyjwhVIlwFs/H9CdqjTBfXCCRaVXhBySzN4A16f9g2OObEeT3EfQWWQg0egavBt7OO+PFrzEpmqo2KO4ZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758205086; c=relaxed/simple;
	bh=FeBX+HSSs9IEe71buzXePciBnj1ZprF+m2AhT79/71c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eyXgzgCXDFo5MclfwzYwzCssQyQ8WCYXMd0xU9aJW4aSwv1gRXdSxKu97vsPnOGdtZFhSiurotGVHzS26aEH8+JVY6jykc5eKjpxGF3UuzkBeFFLDhuFNhR3qFTTlXirYg8e5WTzCBAVUzZbFdAxVuUOzkWn7/CqQwM02bUJ5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oC3361X0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I89GG4004305
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:18:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gbUpwgl2gVJtGvPZLoqAOrcxVHhW3Mn4hcy
	2C7dvYMc=; b=oC3361X02xe8pa/PrFejyspvCbv/WSukDoQ9yoYrMYfTw6N05ps
	gnTJoWedS/pok+mX97DZBaGKu9kMEmDwWcI3sDOkON6/ibd95rLmbkdNuB81hJpS
	QxHhAP9PEdhY4cinIGGZcI29g3MM9zzvrsAJ4aWPidtRUEYYu2F3M8UV3IVP74Y7
	LiLi9u6EKQ9bZmg+uZWhvua2bX5PfJWjEpHloU8TIeiY3bhZ/sYr9ySA7ZhjVG55
	DWf3oxjD6emZWdZSnpi5VY233YixoTYZDToNLwhyMr4o9lUhaNCR+1o0ziPkhvn7
	wf784iAyyavdbhtXVb7R8UOBSsiOxAXeRhA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgv7y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:18:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-25177b75e38so13754455ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205081; x=1758809881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbUpwgl2gVJtGvPZLoqAOrcxVHhW3Mn4hcy2C7dvYMc=;
        b=o7eeJdw4fD5ecKq6jIVEZBK4b/YLJdll5E/YBV303sl2AfvorAoTCMuPjkLy35n0+6
         arre/3/TPY8U5lzl3YNzUF6H1W9EjEBVfu60pou8VuMmtrS294XpIf6RiUnyQ/QktaIc
         SbXUXcIruxAXJnaa+Axs9C1NdoOivoSBUfLfKw2GYceKXk2tUtlu+POrjp67yT2CR9dZ
         BfwiCtlAWD/6NzS8rdoPczC7tvFO30WjxuPpyEugpqTSqAgYLxnHlrPqC82v9jtFFzUT
         HYDKrq91WJDBecgoqGwjC07xRiHSTY5YsGBfQMvVCpwwFD7dYzyU4Z2DUiPZzhE18ezG
         AnMw==
X-Gm-Message-State: AOJu0YzxE/hmMM3OqJUAdNg8KMweV5lLRE9i3JJvBerWoP1Euw9VFm8j
	/v9JkgwUzM+PProQbnOfpz82f1rorr9x4pKY8Jc03sf5PdeAcyWZF0JMwjQrfbmHb/iqB9RO7gT
	1GQEWOAJgGDNMDen6cLDSug6dbXCwy3M/hgHbBrFfWyhiFXd2Tn7qDPWC0IDwoEVdXQ4f
X-Gm-Gg: ASbGncvAOgxEFU1cktSPmLk21ICN7sk6ovjP2+gaLkA2JneT0/v+o6hr4RmSFJpPrWH
	bGelMAio/99zPj3+SNcFFq9+VD5q84YkowtNqfhsXvuTfj6g37PLvLWRVo3r3xXchPNHx/c6v32
	TjAIoNk5d2RC8yGXR05jEod1w28vNacw/7NNeVM9hT2IXo4ys8k+FNmvPS7sE72EKDawS5LATHz
	FdtQlJNC68zCGf48j5i/RltCmn1xdgl9jRBnZgOGnxmU3j3WujDo0waKKYiqMqf5JiW52bSgBdb
	8we6VTwPVZ+kLeQfngfdkr1zsuGlysyWCr4yiMJX+PVBXlSVSvE2RLqfGKFSWJfUGe1hk/ftcB1
	Gz64nUDl59TXVk95wjQYAMPqS5KNAmegvlJcmnFo/wEI8UpSMA6d1UVvYB9jE
X-Received: by 2002:a17:902:cccc:b0:24c:6125:390a with SMTP id d9443c01a7336-268118b95cdmr67967875ad.10.1758205081257;
        Thu, 18 Sep 2025 07:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMTr+Hviu5xVz64sb+cRHSIYzwwRe51hCX57g4JuYl5QlZXywoi9MT8CptGQ2hO9UuNMtKlg==
X-Received: by 2002:a17:902:cccc:b0:24c:6125:390a with SMTP id d9443c01a7336-268118b95cdmr67967445ad.10.1758205080726;
        Thu, 18 Sep 2025 07:18:00 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053da4sm27692365ad.20.2025.09.18.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:18:00 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com,
        quic_gurus@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: qcom,scm: Document Glymur scm
Date: Thu, 18 Sep 2025 19:47:38 +0530
Message-Id: <20250918141738.2524269-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: l6ZSaLPunSysKOz6xAPLU1E9kdkNMHVi
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cc149a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DJLe3x1ex_q8U2ZOUMYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l6ZSaLPunSysKOz6xAPLU1E9kdkNMHVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXwtLFYgtVFnG5
 1h29zw7C4mj49qwIM8Vg8rwhOlhR/Oz9adaHFCvjTVDdE+TxmMX4uoF19Z5KPYX6z9NOpPVHVG4
 YzLn83OwLeEJQF9qKuiOynU2G5vVpeLJe5wKD/yAP3HA+nhhjyVBB8ohaxo1LJ9WuwVUDyBi5ZX
 1S2WWluNl5MVYeEatz3KGaSIaQo/1cvrSLWaAZbnrJGFqM9/Iobiogki5rO1y5py8N3yLn4GsWS
 dtIs2FArctuYO82DCgCE7TpM0SEu5FCBqPvYXpo2POMmG4HnXn2ilfO4rbNEDrmGkKt1B0OxgcA
 7G2FqDgVYHFoKwDrQwYTNZkSerFPm1T1Ter7pzA12n/wk7YbSo4SWBpKyHElIkNLvbntmdhViCU
 feivIDBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

Document the SCM compatible for Qualcomm Glymur SoC.
Secure Channel Manager(SCM) is used to communicate
with secure firmware.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index ef97faac7e47..38c64c3783f8 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - qcom,scm-apq8064
           - qcom,scm-apq8084
+          - qcom,scm-glymur
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
           - qcom,scm-ipq5332
-- 
2.34.1


