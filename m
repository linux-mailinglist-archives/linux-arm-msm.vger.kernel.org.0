Return-Path: <linux-arm-msm+bounces-74745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A618B9C951
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556981BC3D98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326C829CB3A;
	Wed, 24 Sep 2025 23:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7b0lg8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97257202960
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756705; cv=none; b=Nbmbd4gIh0Qi8mADjDBTbPRpcH3EoHDtVmdSjDSqz9B/z4TK8x5mixSy0jzc0+NAsCJM3QVf1GWOX+SniuUe7h0of/9Hp0vgZI6qLYIlio0x6Ep0oukYp8FRboWXq7sOHMM7ZQtG1/HE7oAzKEjiIlh0BlLP9yyQpKOckpcMngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756705; c=relaxed/simple;
	bh=wXNnd7mo5fJeF+EfIqe4rvJrO/zhXKq6+nkowY9OvnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fvj6HvoTYEUuMFpnTKnnX4kLlcEHbUYiHYqIpFzAO570kNyp5R4oLsGdsoUJouSM8r/iqCEdqgHoQAxicyfab4Q4bjFO8+tp82YqEjGSDn84gTS3DUKkrXP2ygj83dojHC0vhIGiRlsOoT2pUDmDkXW6r3wkFxiPdyk2Qxu36s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7b0lg8B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFGWJ030031
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bIBMNjflRa5jzwbyfLjwjF4RUv1x+p6yVbJhMuG67JM=; b=O7b0lg8B3ZUSAxf0
	TbazgpNlHKXtzHI3mL9OSp0v7uUXckU18PNJP/8GghBgD8nes5LWVDGYPpGqVhGv
	Cyvxf3FEypzm8Y6RInIIu6cybWkKxBA5Dm8Y6cvHKLnHSTzJ6F9sOS7W7xWFD+R0
	5TcbSD2EPo8wWhjMm+VXeo/HSLrz7SI+nqRts7a8d6PVfSktgF4y5RIBpNyPc+y9
	KjOO6LaWmScKvs/5BRoDnxOW01TXT1VYM6hDuMyyCCzp1MKSnXSbqwLdjw7J100+
	JgaEYWZybyu3PtrPjqwcPi+mQFZ1VVudFzx9FEY1yJsA/FwV5cZlGuq/MRzb2jIn
	lm21Mg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fnws8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:31:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32df881dce2so357984a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756702; x=1759361502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIBMNjflRa5jzwbyfLjwjF4RUv1x+p6yVbJhMuG67JM=;
        b=dYvmF3GUl+prOWkayx4qQInUVcoCxbc+UGMrWBVw/OIkb+VawDfvjz7fD7jp7lr2Nr
         CiE0Rlj2NLqKexL1ay/Z+BDZ2B0/arCMVL4bBYEclw9YxFQn/gdhDRQzfr1Ey/H8gdm7
         VJTCNp+tCIhd9IbkPuAAjE0eKs30fKxoGIoObkzxjJIp+wm0WBCCP3zzCQRiDueaZIjg
         l1haK7+2DQo1SxeospXjX3EVZwwfYooITV35WL0lf40NaY0xD779+dvsSqlAg8fSF5Su
         sARIe5VJwzxpNtI4iaQeMdlYN/FqFted3cpgD0AhsyGPK7paWaDuTLVyPsiJn5dZ/bpN
         5k+A==
X-Gm-Message-State: AOJu0YymwZdu4Vry+obR0nV61l068IiCgl24n7NSrHoL5Galv1mt91Xp
	9++MCaGsORjygMRrA1ZioIihwY/FNKr4hbHpCXEgOELbhCdOPr22TpDsUPgqkSViECWfzgEEx+t
	dhee/25cGisGtKNs35QzVJG9htQ09w7OYLNir+T5SeYDJK/fr+9H1Btk/jinMekDHvdx0
X-Gm-Gg: ASbGncs4+E8mHdmfBB+Bd+Krqb/pGkosquqvHdupW4abVPM4b4nffPfuv3EOjGMTs2v
	k9B1TPGyz/8LaDBor60ak3WP8BzlVqObAEqwR3gCMRYToJHOi5smv/7kDMpDCm/2o1TDULOaw4K
	p0WlZhHDzlzMN1phjdN573Q4wRL67Lal84V9eVV0qdTvYP0IOATQc8BWTrKWiPCigm3KsydfU7f
	6nMnnPE2t0A+ZgcVv5tkLNEbNBoAOhq2mCEABp0KADbAxtrpbckvd5KdXWol5qSwMFvXsUXNevr
	gacuqGzx/panAomawp0Dh54PLYDbuFxtDxiBC02haynQIon71qxfDyR1jyjzqgQUd5ZJbIFkVss
	Ja8bKSGJvPJEu1HM=
X-Received: by 2002:a17:90b:4a4c:b0:330:84c8:92d7 with SMTP id 98e67ed59e1d1-3342a28b80cmr1757089a91.12.1758756702036;
        Wed, 24 Sep 2025 16:31:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbGHswp8+HdmDWy6LMMlKCl6gUqqzepmWEukpmqovXR2wNzS4aq1fg6hLyaHQizCT5NKll3A==
X-Received: by 2002:a17:90b:4a4c:b0:330:84c8:92d7 with SMTP id 98e67ed59e1d1-3342a28b80cmr1757069a91.12.1758756701617;
        Wed, 24 Sep 2025 16:31:41 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33474f14e4bsm194322a91.28.2025.09.24.16.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:31:41 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:31:36 -0700
Subject: [PATCH 1/3] dt-bindings: soc: qcom: add qcom,kaanapali-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-soc-binding-v1-1-93a072e174f9@oss.qualcomm.com>
References: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
In-Reply-To: <20250924-knp-soc-binding-v1-0-93a072e174f9@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756699; l=786;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=wXNnd7mo5fJeF+EfIqe4rvJrO/zhXKq6+nkowY9OvnI=;
 b=c5aPrZjdPN/hNG3ybepN8IMXT7vQqDz7rID1e8NYhAnvcF13FX+kLpHriPIgTY3U5ofqRxVHr
 S3C4btxFeumAQ4rpWwbz/HvfNf4oJIEvI0x+iGGgJIniUTLf7JKJadX
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 8iFZF8hHmEt8KmPUbZUmjGwWLdkj2sLs
X-Proofpoint-GUID: 8iFZF8hHmEt8KmPUbZUmjGwWLdkj2sLs
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d47f5f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Ety4sU5WZCxzx5fwigcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX3P2qHie+eXsM
 4lyJVkcfsUv592JRszZC5kVhR7HcA0XiU9vu4FakkZhE1pZXlaE4I6OcDJyN49p8LN5ULqyTIu5
 rf7s0/4cgg4Z0+Jvl1tHSQyPYzWXR2hXVNFLDbJoZSDC6YnQkIiOKsjdc0Pf1Ln22EBO92hm+QL
 6knGH5S7/kLkuSngJdbwkXqmaL/flILUKqoivLLulEdr9f0BrOU7GGqAwQs41SMZcqPExDwI1yY
 M6tQwAiSqA1F8AVgrujtP/AHYjP5LSnit1M9RnFCGbPJwhKZ9RPIaw958bSv+Fhut8VqfT35htQ
 VKwlKGa2ehSJrD8u9Xq3Kvr1mdGrMjVrYAE/YRsnTB/lzE59Zv5wLsh4P8jiE0ZzaL5MfRdDsYj
 TIYvetk6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Document qcom,kaanapali-imem compatible. It has child node for debug
purpose.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..1e29a8ff287f 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-imem
           - qcom,ipq5424-imem
+          - qcom,kaanapali-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.25.1


