Return-Path: <linux-arm-msm+bounces-77657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CCBE5E3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 02:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946D9544187
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE94217659;
	Fri, 17 Oct 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gx+j0mSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A2A47F77
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661040; cv=none; b=BZdfxsMH263KmASum5FmOpBBvtKGTbshrj0fpj+pAOUHKfpn0/Lnqnegx7VecLH0dyLhb6A0qVPbCI8jiNXZZKfPrG2SQb7ab1qok636k9sF5qwg6VnQOfuvgRp6URaCC5gbEpwWcgNwjxQqgwjzoYK3qFgnIZRnl3jgv/grtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661040; c=relaxed/simple;
	bh=5hM3y6cna0ixKs77V59yacjoC4eomSveY+2fA2Kl2TY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lGGirMmEbjZU7ScrxEbP0EvwrhVnsE2w0doCfhUUr60N8764LKg1kxQbcTBscSDtVpGAAU0tZdUFgOsHxfZH67SsnZbqqdSw9i5/2AbMvf0DEn4aNpMRGDgeqVhsF3QGtLdkS4AHkn6yCbiJNLWcMf44Nlx7acCek2BRT58X/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gx+j0mSd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLTov020344
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oKGF+83l4Kq
	SVQrFOlbLJspJHtMRAO6JREgm1hfKmrs=; b=Gx+j0mSdqlKXPuREooZ8U037p+x
	zhGevibx2xisununmxuU7zte0a2wfq3W1/RQQjXZtO6egoWvjXY/Qdef3IB6t622
	Xs1fhOsyIEk7i1xdS9gYQhUa44dZO/Zl4xZgBInjUVVX0DK4Wd22jLPvXBwvqBgx
	G94G0azbBgDhJSMrw9yL4myoOCEACjlcDHzfh6yS4y1ES0YgO6vads49donOFuXx
	K6nLBotw5zSQwlN+zHfme07rbb/PwQzSCHalovjVYHCKQhjpS/kVrP1Kmv6jMePg
	xHT3Dbbbd5mSGfI2A3xudYBSaddSepJ7+F9qbFa2A5K/5foOhIChBBhPl8g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8rygw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-79e43c51e6fso1024241b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 17:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661037; x=1761265837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKGF+83l4KqSVQrFOlbLJspJHtMRAO6JREgm1hfKmrs=;
        b=CWc9D6WJpj/oBrKphJGXqMd7ZZw7EqLCJYaovjaL+MTJhze+A2wGXJJfc32c1Bz7tD
         Q9c0tgcI/jA6x/RxfQPuRAqT2TbnkjOMXXOq5iwJe0Ge5oJfMxyzq1xDCEMR6lEk7vGw
         2Uw/eI7vw/GZ9C1YV/wSJjHmw++e7A8AU9CdA6neEW9+MH204+JGzyS2PnbXiDraci/O
         ArEWFvHHnHQKDlG+Y2jTv0+4sB7HsEU37VGlKtDPu6GVjmkXZryrAmG2eU0Jbf1MSSAc
         3d7wboqKI3hkenStBSgD2XpYVvAPeiL/UgcuPaiHfcN6ZvUYWUPaBlukNTO4sYmhZ6wJ
         shTg==
X-Gm-Message-State: AOJu0YwtOg5ObDhYV1s7H2en2Ex72dDQswXaZRgI+EpzUhFi+iU5s5EL
	tWIMKQJTJBDHpFrug6LWZ0/GsXetsBeQxdUEW2xNgF4LAjMhkWq9VJCLeGJ5KKUVXhaCISjeaY9
	6g3HJ1y5jtG3czNJFiWoi73ak5NxqO00j4HCC8wSLZv5iV0BhT8PQlZH5XQpMlrbIOxtR
X-Gm-Gg: ASbGncsJTOscuyp3gcPV8YiWTgYA/bemrm4NQKauEFUJ39r++EKthzh+Wgs+8GtGtCv
	1gaPWIqaBaRs/NAmdhpeKeQn2RQcUKKdjsJdjB13gAeSzeH4BckKevbW37f1/7bhZs7L4bjLOrQ
	7COOcLSnZumQLLNesJUJqcvf9jXXnScnvBB0n08d9evLEw19xADT1EUv9mc/54O1QQLvDTLHJW9
	rcKzSnZVuXMxIAzs+5uon9KtNL2o0m++EhFPvSLIAi4Xkp0td6jsRZjzniyukEWFuMNKylWxdPZ
	fDlbqNk9QH6SR9m83ggt1rAt6q9UAOxbms62fvEbZRTDBi0DNsY3X7W8tsKL3zLpRMvXyax07jI
	agdWzT44JGYd/CVZUfUBjRZDBqHfaXG9R1nAfm0MGYUmt+KslsUyJnGwGTd1rfw==
X-Received: by 2002:a05:6a00:2191:b0:776:19f6:5d2f with SMTP id d2e1a72fcca58-7a21fa132abmr2200182b3a.11.1760661036911;
        Thu, 16 Oct 2025 17:30:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn6IsRhGZ4xlP3bS88lEKXjX8HQPq/koua6rjTeilXyVx3cCXfQkxF8B5J04SOKq0JCLYU9g==
X-Received: by 2002:a05:6a00:2191:b0:776:19f6:5d2f with SMTP id d2e1a72fcca58-7a21fa132abmr2200147b3a.11.1760661036405;
        Thu, 16 Oct 2025 17:30:36 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm23613050b3a.40.2025.10.16.17.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 17:30:35 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur compatibles
Date: Thu, 16 Oct 2025 17:30:31 -0700
Message-Id: <20251017003033.268567-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
References: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bdeW_AiYyRhKtQyPhnezGk8Fssnwgwv7
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f18e2e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ygjGbgp8loThTX2QW0cA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX3afT/PrYRjBq
 lWvGpFDwWQneo9CzAUGKK3UACYcRTBW12x9+dPDOHWjkEJ5kicA0dqTacDggwpgEqsdSOBgI+rq
 8e6bPRv5Pl10kcism/11TjXVJoftTSbFXGElxB3hzddRePstp2Nv9AHGyhjgxA7OmeUq5NiyzXm
 0pTF2KD0wVJ3MpD9NrWU+OeJpFDRdQudA0CsgjCq+GEt0hFX+XcPlDummkkEGU2tICXZjSW7zGg
 x60hCwwBoxYqMWJZKVJD/IELS8+BdmUMvYoKvGR4NBDYJvFIe+gTEYUZjRuNrS6cB+bwa2LaMXA
 5CbtUgaX5vaNk/FQfVdMIgrB5ihXAaQ6/M/MRBZRCv7ub1Rplejs15bWKhbhNVx6O4sUY46CRQe
 ZuGjaf+Qey0eRowN/3f7jaAj+B/sfA==
X-Proofpoint-ORIG-GUID: bdeW_AiYyRhKtQyPhnezGk8Fssnwgwv7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

Document the Kaanapali and Glymur compatibles used to describe the PMIC
glink on each platform. The Glymur compatible uses Kaanapali as
fallback.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 7085bf88afab..42b5a5d811d0 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -37,12 +37,19 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,kaanapali-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,kaanapali-pmic-glink
+          - const: qcom,sm8550-pmic-glink
+          - const: qcom,pmic-glink
 
   '#address-cells':
     const: 1
-- 
2.34.1


