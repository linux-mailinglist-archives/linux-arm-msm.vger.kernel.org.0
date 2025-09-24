Return-Path: <linux-arm-msm+bounces-74702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DFB9C6EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588D73A7DAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36973286D55;
	Wed, 24 Sep 2025 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs46tpna"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE639296BB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754984; cv=none; b=ETjqZYZXRynkbk5Qu6A2D4hVI2OSDVrg+6EWAZiWpplEa2O7mB6Rd8JLvYN3PeYcCQ7PkVCWmG3+Ss6JWr1l0KBOoRk+VC1ZTYEo3xGhxgHrM2upT8jngAyKIxzzJjoSlr/T7HYo7dnVrucHvMQDlIv2USF99g1BMQSHCgnlJb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754984; c=relaxed/simple;
	bh=nRwt3nntfCFNmkA6WdE1w/AtgfXKpttU/xX/NO2gXrE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BvuoifHj7K7rKymuLjwZREoaOnobI30Q0gEF7F8yHclVhgBBo9kQX2lanaCsTtU4q0JMPvfpgazIOuWQ3/1bvYESC/oX314wxFiLTzwAJcpyBqzrqnuGNnkZQCsdcwSFootma6mfI5eghi3RdcbhXGUpbDJbCt2aiui5z302AjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs46tpna; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCQIWn027774
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EEovNlQ5bCPkreL3sup3qN
	aWRrg/nYl3xLCiUK/1dNU=; b=Hs46tpna14/OGE0V9YcY97RUaYeJLUyDn72uTr
	K7Sz99NcAV3n9R7PTw8T1PcD0CeXeMP5mAFaX+fYdOqVHFDGEbOwg3n48IKK/6+P
	MAokNF9EwG4Bg5lE/r6nYxyl+KXNR9I7BcJChFtWGufjRqGYniw505cO/t7Y4HIb
	1bRuiFyvIV7dgesLaI30y2BdKUEwbptk7QVR1qrPm5gRVLNVjq0YIOHBn1Z5TptV
	AoamAudkg8IoiHUgXQd1XnPc4RIJbc1rwXA17kdcE+yhWGiWzM6ikPw9sNniEVfj
	+HqFCZO3Ma8PnEJg3Z9Bwvjk/m/jnn/ZNsDRHamPqyYKFirg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxaqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:02:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-272b7bdf41fso3366125ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754978; x=1759359778;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEovNlQ5bCPkreL3sup3qNaWRrg/nYl3xLCiUK/1dNU=;
        b=LLyHD15Nkj24yYuGS8e6RDWbN70lZTduBPXiH2EYXE8baIn7hOrvYTJRNCqxJxR+ge
         37fkfkyZQZ5zvMh0+t18/LUR8XCKd6Vmi10FbM2MgtvhK/QuV2VPOmI9iFASo7n8+0CO
         //Gfg5bBLZy6TzLKCNXCzhMrDP08xNM1zcxmQrDuKar4hj6DQmAsFHPrKuy9XBA3alsv
         tOcz7qC++UsjaMVuMUudwz8mcC1kc0i9ug4sB32VdY0mQ8yfeUhOQlCbByoPsGC3KzAI
         uaHbyZuJCzVzs8ziLoSMPR5gcjDqfLGnvHRZKFPbD6S9oIQMEmAjv1EBiN+9MXT5pUsR
         bvvA==
X-Gm-Message-State: AOJu0Yx5zADkcBcdXazPwJskX7vtT59Ebpp4Wp6O864WeKMAHC5sYj5G
	LCnS9qggimCfi3cKSCs8y2VVra7BhEEP96+rQ6FarB9KWmwRsplXdR5f7IzUx75adgjSGhC/ebD
	sFWqB8wFeJAhgPWEl+d2ZvQpWrhsMOaFyMnVnt8IciypAUFzEfJ+rbHEEYlW7reWBMDuL
X-Gm-Gg: ASbGnctzUw2VkFWVonEW3QrfX+Icd+lKvttV80qj9Nq0/jrq3d4KV3p2OAB7MyCAAaH
	U818F/Lkdn/AbXWWCi9T0jDwFEe6Dupa9jEEQ0DgAQw8BHx1gskOyDg0ypMIfaKXDqLmp9McYMM
	AWOscGbIMVgcng2a1L832EXmi10+Hmu1Rv7/sqW2v3RTpx9nGcdQ0JEQ9EsH4/tiSpgSHgLcNyy
	LeCYrMJlvY+9/40Ger0vax33HRfB/voheZpwLPIzaTrwtY0FkLAAzpGlKQWYDymsVbFIjFjI0Po
	XOK5EojsEkMsFWwtgDezABq5wcoWeXvDioO+QkwMVBxx5cS3WBCrImgnfOqo+WrPmLaXCU1J2sT
	WAIHTPErDqidRq4k=
X-Received: by 2002:a17:903:2f86:b0:269:aba0:f095 with SMTP id d9443c01a7336-27ed4a3164cmr13375595ad.35.1758754978350;
        Wed, 24 Sep 2025 16:02:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWqE9Wz0InuUFJtaOLtEVLSMSYQX4VVL8nUER9WUlygGTuSzRC5iSu6J+VMjwX8Wrz59nCxg==
X-Received: by 2002:a17:903:2f86:b0:269:aba0:f095 with SMTP id d9443c01a7336-27ed4a3164cmr13375285ad.35.1758754977922;
        Wed, 24 Sep 2025 16:02:57 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3347472e49esm153255a91.21.2025.09.24.16.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:02:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add interconnect support for Kaanapali SoC
Date: Wed, 24 Sep 2025 16:02:43 -0700
Message-Id: <20250924-knp-interconnect-v1-0-4c822a72141c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN41GgC/x3MQQqDQAxA0atI1g04Q6Xaq5QuZtJMDaVRMiIF8
 e7GLt/i/w0qm3CFe7OB8SpVJnWESwM0Jn0zyssNsY1dO4QbfnRG0YWNJlWmBa89RRpCLqXrwbP
 ZuMjvv3w83TlVxmxJaTxH31Q9hn0/AAGLlWt7AAAA
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754976; l=1027;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=nRwt3nntfCFNmkA6WdE1w/AtgfXKpttU/xX/NO2gXrE=;
 b=EKTtxLaFS4Vb7zFVZ6YgHLsegqHVof070b+u26o6+YUPBWf6OZaQ5doirxHO8+yJ1pnli1Wtn
 sfLmYF8ecc2Cib0kjFMyxMCNLhVG3LN80QJDYYxRNgeTVTtEBRRBqNd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d478a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_cDidGYXCDOhaqYtY5wA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Lf3BTki2i3uDlyOr1CggRys3M1U_EPAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXwbmYsM8igB2v
 2r5sIScEA2uD+FPhY1zI4Fl8yxZJvGE3EacwSMtQn0z0jFqKEa5Uux19KII3NxJr/d2C4IMw87P
 tDkjpiD83Bwz3DT43JwQR4sBPcXyakeKSBbqXmiNa+PlqAaAFencOdmLGIc5aEni38xvvatUjVe
 ZnlbQRxvnAZd77thli35c8WPiBOrzVQcxE45THzoDJvgwNLlbPS79T8nUd/6rdC1LvSb8Bo9kxo
 KsmfpjpfOZv/nTjNOReCOD8Jv/2aigIuQj09SkAmCFtaCyIIcs5SLQjI6IH8YCy6agblzrBrKZx
 Rx7a4LgTPzlXJm7Cp5zeqGpjZvvp0VNuNWQ6rjCJS1lZ/eEh09HKZGjauKk9ZjT+i4BhRfVUbjB
 jng/Jf/T
X-Proofpoint-GUID: Lf3BTki2i3uDlyOr1CggRys3M1U_EPAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Add interconnect dt-bindings and driver support for Qualcomm Kaanapali SoC.
This yaml file depend on Kaanapali gcc patch header file:
https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Raviteja Laggyshetty (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Kaanapali SoC
      interconnect: qcom: add Kaanapali interconnect provider driver

 .../bindings/interconnect/qcom,kaanapali-rpmh.yaml |  126 ++
 drivers/interconnect/qcom/Kconfig                  |    9 +
 drivers/interconnect/qcom/Makefile                 |    2 +
 drivers/interconnect/qcom/kaanapali.c              | 1868 ++++++++++++++++++++
 .../dt-bindings/interconnect/qcom,kaanapali-rpmh.h |  149 ++
 5 files changed, 2154 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-interconnect-48c2c91bff58

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


