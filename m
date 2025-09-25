Return-Path: <linux-arm-msm+bounces-74833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31485B9CE21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33AF61BC55EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DDE1A3172;
	Thu, 25 Sep 2025 00:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ScMDx0NO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886B61891AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758759643; cv=none; b=su09x6IwPTn+YhRnSISJQKyuoYzaYeKsinwgxXJN8FJWX9t8Pj1rt02AajYERx1pSI28+py+IbD/9eawUVCMgs3C5N8s4FdyGtWPH3/lgKB/s5uReP2KxloZu7SUK+fmyFFypRXR9e6632NcO6OdAbZPrn1OX+1k/ZHhWtVy99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758759643; c=relaxed/simple;
	bh=Vzfs1LFFHiEdWORr77vIh2SKYYdoMh/m5AROS8rGlOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YRVs3T/ZHZcpqQWMZFXzw+YImd9GnDq2dWyoNRpFgrrC7rl57cs1CS/VYkw19lx5nCDaZxTfpumnBD3GdjKr5qN8YFaIdUFkA24g3smEcICPjtgLLKAH5/Ttr9kmDdlUHoWUDSmmzEdjtc4lwsiTm2cH0qj02+rCEBBqL1+ultg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ScMDx0NO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCwogt025572
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SRwI25fTueoRl7qygb8baE/cMAE47EtTbSA
	vuT0E+/g=; b=ScMDx0NOAQFKWHw2nHLMv3URVQ/y8V03PU1enZD+vdz1oIAdot9
	Qf41y+YQWug4hnJgyF4NuyRlNCl5JwQvRiZMvqVRHAfRzaLWCSauMamVXMayd/do
	1n3vfKDU6SaYOdBGOeKudzQ6Ubcc6NKhXQnqFCGE/lH79YEnmFguAYPlz9DVjQAD
	cdNYYiBu4+/G3kxX6fW3whgFiJxWZsgxQ5N2b2kF2mesQwbi8k7oc9Bu2D+VfH25
	2azjRWQO8koO85WJBmTHLXrl4myTrdg6K/3QsZkr4n2hhqAQibq+S/4PK7Wy2Mlr
	QDm230Rgfny3tBDV1hWajJsFlV8Zp8iPgdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexfht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 00:20:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27c36902f42so2467565ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 17:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758759641; x=1759364441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRwI25fTueoRl7qygb8baE/cMAE47EtTbSAvuT0E+/g=;
        b=Tdn3TKbt89YXyNLcG/sU6u7k6OKV2TxV7kIcj8WtJOHIiuRLpO5cBA1UTqa1rp7LgK
         EzHIs/I02RLzw67jZb2Zb3Dy1BBgoB1A/pn+H+2wvnv2n6sv/aEuR92SiCzJot76ogKp
         q24Jj7S9LwBPGwhu5frmbExl6ydjKTxD/lzG5qlUSxTMHb/qvl4txanMIQHIU4MBU7Ga
         H6WhEHZxZ+xsYKTODBgXEG+qUbGDd2vF/lULJ7/xc28Ro/bPuArFp7qFKKzgTy7KJ78e
         4+OAYm3epz6jIypJzhoh438TEqrrz+WChitTP6voH7lZC2KJzWsDaitZKPdEDTmZjvhW
         Hi1w==
X-Forwarded-Encrypted: i=1; AJvYcCVYJwJx4Fg4twMVHBYIVhnf8Icu/Rc4PQv0wxodTUd8UhBSNUwSLG8F3a4oTWiEyN0ZpFzs1B9h6y2BSVCa@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj74YcCVKNj8/6QKmLMHvTq9qTuCuYgMi+R7roGTKFpSh9a9dA
	GiVkBw9c1I4A3wM+YQ8xNG+geuVEAPR+ugcjQ3ms1IkqUe5od780qszcDbe/czIrlBSmm5qYGKF
	R2IPAQVOANUtSqjc0fJWOHq6nFrxOY51l21wi9kV+Yo+QUPwLRQPoSWlmOxi3wiJIsLQu7aQGN5
	2i
X-Gm-Gg: ASbGncukkBbNrt8d1j2rFuVH1/wG4OB1gEIMRFytHquiJH7deBr+kuktanx6pMWEyHC
	gM8NbNQIXi4SQBCQ+iPVEMU3guBcvNoxklLPBH8uMBZDyGHpzb3doEFgiFnIDPvLTdI3EUoQpLU
	MCLNu3DEOZfw3vEhBM9q70084/02xjMGkDkkiPk0FIvYDG5NPEkAYg86HvklHfBFuUinTq4wXbz
	9ePvSt5arBIjrc8jAa9KUzUyoWk0ZFvoXZBW7TPYKSQNWmS/BCPGH5BfkKHA5p+R2GOhXrxzwQ6
	9VytbgHw5lPSZXaRZ4wBDPw5lltXoazB8PjAD5hHc5usoAXtVF3yPiNBZrZxJGzC0doXMJhQEam
	cZDvP3SdbLhRWbMsr80qD/TiPkhopBYHSZyJnaM7xfDBXEhzvRyAj0pA=
X-Received: by 2002:a17:902:da89:b0:267:f7bc:673c with SMTP id d9443c01a7336-27ed4ab0972mr14591615ad.44.1758759640796;
        Wed, 24 Sep 2025 17:20:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEogoEQohZMX5Lzntajc5fLs0ei/8RmKQ+VYDghSleW2B2SrVgQJCo7h3MdCRBt+jNzWkvEIQ==
X-Received: by 2002:a17:902:da89:b0:267:f7bc:673c with SMTP id d9443c01a7336-27ed4ab0972mr14591355ad.44.1758759640309;
        Wed, 24 Sep 2025 17:20:40 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a9668sm4740155ad.112.2025.09.24.17.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:20:39 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        jingyi.wang@oss.qualcomm.com, andersson@kernel.org,
        mathieu.poirier@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: remoteproc: qcom,pas: Document SoCCP PAS for Glymur
Date: Thu, 25 Sep 2025 05:50:34 +0530
Message-Id: <20250925002034.856692-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5-a0tM9IVxRn20xgRgPBp4u3CGMNrBjH
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d48ad9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y6Zk4y2S2ODVn_eFbNIA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX3rTNByQ7X06P
 ISN8jtIS6SL9Y/VWJRM35uddJJJKw1af+i9K/8ALNaazPI0iUn3YVZCqotyp3z9zJBuqsq582vH
 C8ZFtzUST8Stn9H6S+uZqk4VGWdMO485VpQAH+VTrwvXaDU1nHgs5sL2DoUup9D9VKkCVzHAGLM
 STFCwVUJUQ9y5iUlFPXCLlDEWBF1J/l6ju+1hVE3IvyX9PiIVBCMq5FdbeKCljr3P48xfOTxkJb
 Gz9/iJdtb679vPB5uN8Ux4dzcgA3/bV/eLfcJFAKSVJdVkUMlsg2TDK+VkqWS7SnHB9f4nSLqVJ
 MLBdQUP5FcqKFq8fkOkJNK0IXC+CTNBbKMYkjjIAPOP2/ibAK23e3ME2BjiDBArMNe4QEo+5LHu
 Xe6XCyWR
X-Proofpoint-ORIG-GUID: 5-a0tM9IVxRn20xgRgPBp4u3CGMNrBjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Document compatible for Qualcomm Glymur SoC SoCCP (SoC Control Processor)
PAS which is fully compatible with Kaanapali.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Dependencies:
[1] Add initial remoteproc support for Kaanapali SoC
https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t

This patch depends on patch 4/5 of ^^ series

[2] Add support for remoteproc early attach
https://lore.kernel.org/linux-arm-msm/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com/T/#t

 .../bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index 79f678f5f7d9..8089e0869ed2 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -17,8 +17,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,kaanapali-soccp-pas
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-soccp-pas
+          - const: qcom,kaanapali-soccp-pas
+      - enum:
+          - qcom,kaanapali-soccp-pas
 
   reg:
     maxItems: 1
-- 
2.34.1


