Return-Path: <linux-arm-msm+bounces-74783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E2B9CB23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254143AA0CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974A62BE625;
	Wed, 24 Sep 2025 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WR+MTacN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2E296BDF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757484; cv=none; b=ChQpgn+uCgSnr0nfs8IkGk17GR8bfHCGl+dg/vVPSiRBa6NmG62Yk4agFgeAOcXoFOlk3Rwk2GaSpHVBDQQaBlWMaNTQn3MPMxv1udlTrEWpSX9dkXrTrt65SOCreTR74NdMVW+0RJMf/WxrKnoj29ax+xG+uC8QdDvboky3l3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757484; c=relaxed/simple;
	bh=+vfSzZt3jkmxZ01JyNHaIM5Mu98blH6EPZ4R49GXXak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BQCY+yTLnNhYuNRJV7m/y4PNkmZEwcp1cmLKlejse1J17+W3ORByRAu/j7ll3T31v7KmvBY56pLmnW8D9rv+s9+uimneBhxfCpbiRxtJ+KFVeN+4kK6NWanmeqtJ9GAi4TYuPpfwsNpfxH3/M/FHxNmtcpGiyV9RDKR5g98iSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WR+MTacN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD4AIU002118
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X2impUdlHgs08G5cM438Hc
	r93z30loujiAfWpv10igQ=; b=WR+MTacNCAwIG5u2ElFkkGcwFRIq9QzY83z2pw
	8R+bDxAbmqHH42uBnS2GufXahMaqwRincUrSi8aEgbsTDOs8vjkE9ysmuUuOOZzd
	1IatvjytQF4zTaFhI8XTajGOyal8N972wbyy3r1WUTsfFDMdWwdToALYB9ss/DB2
	t6AIqhFWY4nlKdc4pwRZIdTZfnWQPQjZC7YaTdxOnR4rMPHjmN3DFZVRw5IVlt10
	53DVP2jqScTfUTli6/ANyhJqL5J0MIbnbd23twjuEKk1KqupXwVu2g3OrZ2qehqf
	eJ+ufaHBvmSFfjvJVPh7TWp37VZuJ+aLakc/6jR9M8a8lpHw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p373-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:44:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b54a30515cfso1103782a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757481; x=1759362281;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2impUdlHgs08G5cM438Hcr93z30loujiAfWpv10igQ=;
        b=jHbkR1MQj8nlZx5+BSH4rq+r78702hE1AFpo7I5SPKtgvF+94NrwCRqycLejFKVQ2u
         syN6/958caDnj3ZOzM56izNPX2sh2XdRO8VEP2S37w5X3yB0NXt8CLZxdyCLlnZ/anJC
         Q9mWSeWhVECrxnP5T0CjF32IbxNeKuqC3H94XwzjtQivuZmp7WYxGsJm71iV3pD8vi7z
         3qfK4oLJ5R7ln/7d8FDD1C6/Z1lgPcqVnQe62t+CJNIDGUd20oMHS8uCR/RNU1zwmlf+
         EqSIZ4lPQUDhKG64m72wsgl68oE0iqwlyKFGb3aswNjbh4pdjC3RZRKxXblBrTT2aSUU
         r/Zg==
X-Gm-Message-State: AOJu0Yy9DUitqwZpia6QntA3mUERnjl37Fbp1CdTXu/e7RnQ7+FUyNpv
	ZIlx/0oZVKuL2phXQw9r/9i2tCKZyAT+jODuiIks5qD8goS0a1v3EFAjSSqDcTW8K/Rvn/JH3OI
	iXSVKaznM5ylbSblYQ5LkVyiuKd1EYBhAQAvRapxdnDBfPk+E84yOlenluRF4YLbILGhv
X-Gm-Gg: ASbGncupAMB4jr/5uHPdLSSgrNy9Y+uBjjLhSfLnBEC857NFSLbQVquDUmi6odnqm8E
	3zm7Hpuv8nqa9PtXH9bNYGi9N6hdS3HuzlQdnAB4UCJAqV9XX65vbos3UBf/Eu9yGrrrRFzUbtw
	f21mOUPe5Nmtnt/q0JXK+ejemcCv7ZRfUV22Ff3wUCY0pYukDV3RGTJ2LvLDOMBvS/atYivBt36
	c1faWkMm4BHFIE3y/87hxolvIII10iGshMUb123RhumlHX9FwWnZjiV1Y4XW438srQyRrieXmo0
	+WWWjdhbwJ1dDYcBFCcqm8PNYKpFzXTnrfqIfcQ1AkQkexUOwjfnPQRKzatN8BkU+5+MaYgDE69
	VEILWhEpHE1RoGAI=
X-Received: by 2002:a17:903:138c:b0:24c:af27:b71 with SMTP id d9443c01a7336-27ed724ab01mr3625215ad.20.1758757480732;
        Wed, 24 Sep 2025 16:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe3osHo06ryw9DSt8Ew/7EWK+5zKQOxMidrxm+DGQQ0iuOMv1YJGJtPULrq73FkfXh0KaDjA==
X-Received: by 2002:a17:903:138c:b0:24c:af27:b71 with SMTP id d9443c01a7336-27ed724ab01mr3625005ad.20.1758757480276;
        Wed, 24 Sep 2025 16:44:40 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad21e9sm4257705ad.144.2025.09.24.16.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:44:39 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:44:36 -0700
Subject: [PATCH] dt-bindings: dma: qcom,gpi: Document the Kaanapali GPI DMA
 engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-bus-v1-1-f2f2c6e6a797@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOC1GgC/x3MUQqDMBCE4avIPnchCtraq0gfEjPWpZjKri2Ce
 Hejjx/8MxsZVGD0LDZS/MXkmzLKW0H96NMbLDGbKlfVri3v/Ekzh58xakQ0TXzAgXI9KwZZr6f
 ulR28gYP61I/nfvK2QGnfD2qdSg5yAAAA
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757479; l=995;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/TajRCKXELmb0GbPNJOnw3zeHwTzpoeuNk1uSE9IkJY=;
 b=3d+GD3HxBx6rRCdZvn2GG3Tne/gAiuEKRNcopvHMA+d0sf54VDRHBlQ2loOOCTHddgGDOcjBZ
 iIS+XxM5+HGCYhgWBofrA3+48ejMlTl9ax7LYssn4yJBd8RPub1s5SS
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: Y4NMqGzg8CzRRGxftF608mcbbNnOGHzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX4cdSYp9FtQV3
 29DqqarrmepSkXfYEI0GGUgIizHGiYAwWO3F+yiMJ/79r6cTLKiOtU9jow0/oxtgJFw8Lu95+ub
 GGC+spLwdY4tAJHYwln5VzYQGKoTl2nvoHrEbFNpB8tKIp+wAgS8iGjTcMh1UH73l2qdtr00YXd
 i8p+e9+3L1wZ1x5MHnba3uNd309l/9y5v+PYIpMTveMsViF00NrNSek3mbnWHTcFihG3Eau/wm+
 gLdH97N1I/rSK/jtsRJfymDbrxzrq7ibVUrNfaxwcCD2al0/EbcMb6O2oa+izToS14hf9pZmTAx
 xiecvqDkrPMFk1fmnlmz44kW72IuJnK9nlyNtUNvJMLAHEzxXSfz+TuYEbfznAYE9q/GOiOWmR1
 sz1oTBCo
X-Proofpoint-ORIG-GUID: Y4NMqGzg8CzRRGxftF608mcbbNnOGHzf
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4826a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jIbp_Hnnr6_5fXc8a4MA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>

Document the GPI DMA engine on the Kaanapali platform.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index bbe4da2a1105..e7b8f59a5264 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -24,6 +24,7 @@ properties:
           - qcom,sm6350-gpi-dma
       - items:
           - enum:
+              - qcom,kaanapali-gpi-dma
               - qcom,milos-gpi-dma
               - qcom,qcm2290-gpi-dma
               - qcom,qcs8300-gpi-dma

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-bus-e5ede66d8e0e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


