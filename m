Return-Path: <linux-arm-msm+bounces-55652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4D7A9CB0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ED1F461024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3003256C9B;
	Fri, 25 Apr 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTO4HLnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4CF23F296
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589850; cv=none; b=HJpmWp80n6qfvfcvR+e0ZLGT2JfmWTMdbHg17214UffSZ+alv4fxdMQflu16ghGozv8uGG3vrYa7E4kyVO+thYrkD7RVJoe39FjpQzzViD+cZnHt/buOEzU0JOsfRnMgvQ24UZiG+DaQgL32+whZaBXLNPFz4vOYkeOmy3RFY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589850; c=relaxed/simple;
	bh=jOWcnqRbtDDv5Zy44Vn8KCOZ6bpsZZlhkcXNS4OzuwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j5dpr5g2lhTdpmlkI23a3+TyJKZSPz1qm09UkJDNiH9UyGBbubT53rBvazJ+G3WprCiB24jistEM/ESLQhc3/RijcPB5+l9lWG96OmT+WyWHYXct5Z91MIdCCQYPiNbak168wWGXejFyukmUciPKmHvpAXEGeml4a+1TBpmUl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTO4HLnT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TO36019271
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d+RRvapxVfl
	VlK0w1oRaT6pBilQocJNCPlf8xNZWb34=; b=QTO4HLnTpoDC7GIS8P/vsJGlrpe
	HTLXgbUE6t8AY8jQgrzUW4bEtNxZYCxssy4EQkVqnkaTb5vBana4wZOfYW4Zq+/J
	YjffuJN8Eui3FSuVBRdSWxbotpDiyah8bAATCCgDX+75X87bQhgbNYF8xg7ufA5f
	siailzcd6JpAMNe17k+7sHKNtTCMBlhkNCV1dgrAgJk2ATD8SD2zP3UMHXnMql7D
	6jAXNWKsSxpWHAW/G5NfA5qL6lwqvDZrOk8xk5WMqCrqi/hY0vNsFVk+uXx/xjGZ
	mJRnh+dYZsY74Ygek31yt/J3h05lrUrZwgtb/WWJyy4B45xDj5Wj5sLFJsA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh299f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-309f0d465bdso2390995a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589848; x=1746194648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+RRvapxVflVlK0w1oRaT6pBilQocJNCPlf8xNZWb34=;
        b=n8reCektviXonyEaCVHa5QvMtRU3g9NQ2CWZbj6JaXAj7F4N+Xz/W2o58N2hja3d7N
         F6vFTspewwo7p2qGa63OuRknCnyjOZ3IXreHWhDRR2q+oO6Dw2Td3vMhUQDU3eJbk0G2
         z3JTgFyHrGYkoWYJ9FSCPeiAPdSqlPb6/xPgnb+tNfthq5kj2Rd+CSTugh6YoNVIg8Kd
         YrIBtx/zGZwjkAQSeNKDAss//DxR55KYs/+eY/VP+GePRJfuIf2CySbPW0VnwPcOe+9R
         +GVJqildzX0YScX8sppyZwx7jalntsoSqGybF511GvTPIv/icLu3wUctU7Hwu3dT8p5R
         B69g==
X-Gm-Message-State: AOJu0Yz+wquAEWKGxLXBSvhk1w0n/bdo52R5fk0PtXFG+yVuZu54zBYd
	2Z2UbHq4V3blhOECZLRMjTlTFq68wcNKoZGxyoJvzsGSJABNZt92UhztneM6/anFa2CHAj69XO8
	t2IcOm5Lb5jdD44ntf0ciHDKwK9v+aCOEhkFJmAT2bGye7udcJKub/M+dqne99xU7
X-Gm-Gg: ASbGncvrjNahDsBHpCJgzlp/cG8W3HopFRtLr8uKBlJOAy+6RcFQvOqj4O58292Jzv1
	1Occzf7f2QRjS5n8fDpSRAC+9g/CJUqu+o4htqC64WKj4v9j7PFGF5E9dNgnZSAsKynotyrfHg0
	3UuYOfpHLrMSPyeZRaI2ypZ9CTGs81paRZoedK6ZwR2WuIURDudPxzpXBhh6ThAW4oXKyjvOQHy
	R12hfH7HP8Wmapr2X2QU67R1DCaNY+nTYvmArtdkMJPQOrOTuLfCtaVO85S6kqSabg2iVpuk2EH
	WZxWVnQJIU3U8y0TBIA8NZD41Zji/eIRG1BcZsU=
X-Received: by 2002:a17:90a:b391:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-309f7df2fdamr2554342a91.19.1745589847820;
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX98i4SeNY1skrO7AIkeCTN7IMzgQCtRBV/tXFR4LeFTDxbSib55nvLowGQ9F0VUkCMg6Oww==
X-Received: by 2002:a17:90a:b391:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-309f7df2fdamr2554328a91.19.1745589847495;
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061c43sm3468697a91.19.2025.04.25.07.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
Date: Fri, 25 Apr 2025 19:33:46 +0530
Message-Id: <20250425140346.1087527-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
References: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680b9658 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jdBGG2SsLo4Iwi_asnEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: EIPq6-pqI_EKKiw3OwVzLtqCGa3OUsm_
X-Proofpoint-ORIG-GUID: EIPq6-pqI_EKKiw3OwVzLtqCGa3OUsm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfXwhGIOV2tXEOj 57+WuD/oXFci+WhbdzE+joiz9S+hywY/eK11zmRAACulbf0Kr8IdfXt9JWW75imsNhmshY/k0HG h25E4wtImhvz7bWuw0YccRK1hhDaYX3e217yg3uT7tvl1rUulsgZzc1xR98FKWKXKvC3aeK9N+k
 NiKEyhQZ175sOsuOCFrbKiyahqzp6zZ+bQPdNiJ/mtdoaeCiMMGNKGnSh8JLgQgiDutpop3LfpY lYu4TPlYPEpxTmlJcU+ivcAmZCsa0JxO4lrpKneYRE1s4mqNX+aWohaCSigk48r0KAQgBjmqtWK i2isbOJk8Bn5Dnui3r4Xzx4Z9CiYbfEUYhKTz6BXiyl70HSJmW7tPFrZ3psFLzcRYka0sHlQhKu
 CJB9EOijV1MuUzlF7q4AfX5YAE2Q1RfETAr6WWLbzLO1SFPJZKcNOgJ6wJwD8GzAswPNXneM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=942
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100

Add the unique ID for Qualcomm SM8750 SoC.
This value is used to differentiate the SoC across qcom targets.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1b3e0176dcb7..11db67b2e08b 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -277,6 +277,7 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_QCS8550			603
 #define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM8750 			618
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
-- 
2.34.1


