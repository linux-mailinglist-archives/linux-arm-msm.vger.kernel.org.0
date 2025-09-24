Return-Path: <linux-arm-msm+bounces-74595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA9AB9A556
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B021899291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 14:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8B23081B8;
	Wed, 24 Sep 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqGiO3+R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C003002A6
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758725331; cv=none; b=Tq6hRW4tgYv+8JrA7lpZk0VWqchLaTGREriMahGO0ToTnroMLmMA0/P43lqKgGQXkxOcl+a6j6Rmgo85UTC8QRraPP9VKcZmw6pXVGfpbLxCuVLH2mK2NbdQn3nHmMxV8zCWdbj3gRFshrdykaYaFrSMzIcdpz9ok/yZHoh/KEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758725331; c=relaxed/simple;
	bh=h/srBE3WtprL7mFhf76UFwoR5LDPsTSkmWauWPUtJrM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IImRWnCSp20jW029LOKVsarH0c+LXtBM4R/kMtV8eQlSkW+eaZvtwyiLhNXsyM3Vf/hgT+i716rVeH7W+ZudyhqjcNnvfpwD08iID8jCl6rEOsgCVed2cs6TVtEF6Krv1oeimHEzp/Bhv7ApnA2MDZx/ni7d36r42QsUZeUywjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqGiO3+R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODM0qP001948
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XPG+9O8dDPmoroQEsDtHD7YgbTrYDM8HGg+
	bzuFokcU=; b=dqGiO3+RhQc0b6FLZI3QlciPHNr20AN/9ydO4sgK6X425s981wN
	SMTqdp3eqToi1AJWbqBw90PAQpRZf4e3vX1xy1v/RpRYhsSIpGeJDejU56YFis0e
	I3WKRlz3KyjGL53f1Lc/nRg4rhriw9kY4na7EjsqNUrZZF7+qg2IBq67WFtRNN0D
	6KJFKgyPypuQEnlJ1xLv8HAbXZdKuCyQmmsvJAbWo9o3itWjAejqxH4LESjVZ49O
	RgFR7xyUn+V58l0FKpxH5wlJDQ7UWOh8qjnoEDVnYDVvgnl22QlUuDIprk6MIJl1
	ipn10HEZaooWgQ3WAL+nkqS5pGP5PowmCxw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98mpg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 14:48:42 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54df707c1cso4474571a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725321; x=1759330121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPG+9O8dDPmoroQEsDtHD7YgbTrYDM8HGg+bzuFokcU=;
        b=dcm4xdEIPQOdXgvuxPS0MVoRHYfNL0hsz24TkPPXeLfeL3mzU67w2f21XnyP+If7ns
         999cEXPRy7MBSt4EYSdYQwIO9YCScN5A3WxnkoEtElgUPi5hzXBPaLC6JrucPK/9TjYW
         YfGiXHxspEdYUDoEieQMHBVWJyUmUWhwMIt1osMm7Pb1WiobNeDw+7WtKNDgp/efNubo
         IpBHCCq517ZhykxNWKw27OKxOeZscLOfBkv0QQ8dXq01ZouOxaVk/MM+np3XONzJjsMf
         36FroblIn67tAvXBS78woR51O4+mAHwSlhzN6EOsc1+ZvCbkui0YYnCOvpsxP51obK9o
         RqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXld6qiaJqYoifmEcpAJ8TY3OE+gSaICOmbDD7YuGvhyjeO2nYKZKxv+Rm4nttCvQu7yFviU0cb8PahbSVW@vger.kernel.org
X-Gm-Message-State: AOJu0YxP/5XatnftTjNjzzx1FIHX93sNGblWq6BcD/d9D9+DtFoC81hF
	H6vbARnGXW2Qvk88Y1JiDX9taufQPu1sb2goDXAzH7kLXgTBMSp9l2LB8NpWDkVIn6IlE0Ap0Vl
	y+R63qqt/Y1vKf0EbE0ivX2sDs5AYUb1ZE6Phcz8vgUP305P/hsYf1b7m4lOTBnJZi8OG
X-Gm-Gg: ASbGncuFmHq1e/q+pZeoqkdeUmvLDAlkpSBQB8OuVAKlJN1WI8iDfz4nzST6T/8i11Y
	2KClB99ELPkkCreGJ9oEKw55b+0jWxOROtAnbw3FiqZ/QdzcKVaKwF6zG0CPk5Wc45Eo4Q/f6ka
	tGYAfbMyJ4FrlrnJ0cgqpIkmPn7LmU9g0SXARN/dFn0YcxKUq2EScsjOJ5AxDTSjxdbD4QXRncz
	FAdiEYWaPfIQF4pzBn0QhALvEBcKd1e5bNpQvJFu7OEkENKRT9vBobCCgtit+Lgp+qe14oeZ9Fi
	SMYO1G9sYn0IvpiBsHEA09a0tuGkwof/cgFnbKzbew9ovbF/xF+GrdGpnUZ9iqEr/0BXeUzu4xb
	5f5Pg8a4g0d99vKF9D5XVd8IUq6moguufrbf3/f9fA20r0UJhwGWnOQM=
X-Received: by 2002:a17:903:2450:b0:24c:d0b3:3b20 with SMTP id d9443c01a7336-27cc7bb3d6cmr81106585ad.37.1758725321482;
        Wed, 24 Sep 2025 07:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuRoilg2iyqRWH5zKfaKKeY1QWhKYWC2phGHEAbOmFsU4CdT2HU6aysnxHeuV/PIGhylHnbQ==
X-Received: by 2002:a17:903:2450:b0:24c:d0b3:3b20 with SMTP id d9443c01a7336-27cc7bb3d6cmr81106245ad.37.1758725320890;
        Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800530c2sm195106345ad.3.2025.09.24.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:48:40 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: qcom: Document Glymur CPUCP mailbox controller binding
Date: Wed, 24 Sep 2025 20:18:31 +0530
Message-Id: <20250924144831.336367-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hN4pYYoF3P_sMrMB_RNmgjqIyZMzY_up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXzBrlTjmkaDYE
 /hvlKiwsdpfHr+Exvs8KZCOEYRDhGDFnHnX2pKzFZHzxWr6uJjogFW6iU4AV9cOd2946fm5ym8z
 XFqlp65naRF/39OxRb9JfgnPVtcBA1OQUvJWWUx4hhgE8Plcrd4L/L5J92SDi5G4EJitY7/nimp
 i3ta8FXAp/1BAcOllm/8ptrKCDZJibKFUmjV6MB8Qz7fUido7gveUEFxEMSu5q4jCd4TVE6KWYa
 06ghRVoh1XPajUFKpr0vnVfeb8BOa1uqMdir0GkXG18SB0lRXcKj7jHhaVw2oHjeSfRFj6MzuF7
 9ajKpDhWawkeEZnxfKgGArX5fKo4XN6l31TfCp6PiCyejUomq3TdJyTIKw0QpR2Kevl6ly+E2g6
 BxO5Ktvz
X-Proofpoint-ORIG-GUID: hN4pYYoF3P_sMrMB_RNmgjqIyZMzY_up
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d404ca cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FaBG7U5ITfglTqoGHWwA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
Glymur SoCs. It is software compatible with X1E80100 CPUCP mailbox
controller hence fallback to it.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index f7342d04beec..9122c3d2dc30 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -15,8 +15,13 @@ description:
 
 properties:
   compatible:
-    items:
-      - const: qcom,x1e80100-cpucp-mbox
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-cpucp-mbox
+          - const: qcom,x1e80100-cpucp-mbox
+      - enum:
+          - qcom,x1e80100-cpucp-mbox
 
   reg:
     items:
-- 
2.34.1


