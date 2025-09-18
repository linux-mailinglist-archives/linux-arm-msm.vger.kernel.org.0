Return-Path: <linux-arm-msm+bounces-74090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCCB84F45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 16:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1CAF1C26A8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 14:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6BA22173F;
	Thu, 18 Sep 2025 14:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OR1qvIEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A0212FAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758204257; cv=none; b=d6aZIibYOHluiM698TqBP39G4iMMyfaTTSsj9gZ/C62hNe9JXOVgdC/xdbComWNeE92NSp9VZut6FSu1F7suPzFu9OgDCSJNTlNIoDvz/iYSM6Wndv2pp+3jZRfIDWEzzNVuP85tIOZR6QqIaQp9jU77TG3j60kpLKtepS9AHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758204257; c=relaxed/simple;
	bh=QJCrq9EVKnqtcGSGyMsia6+ZNN3uVWUCcTfFO8R7JlI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O3OSQLlwMdEjkwdVcaxPayfOIJnxyazZLEfiHVFAfpa1uK2tgfXR7Y5dB9mfH4Hsq9QtvfOi9WL8vrF70nCMiHmrVPY+eAaWGSC5hzHYLyWHQVQMubesXKbdAhlo4dvYlhrQWzpRkzVL8CvWr1LtAt2mL8xhibcxgx5dmidaCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OR1qvIEf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBL4UP018234
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hCe2ZbZE5TuBVNf+FdOD2ubfL6oSGqfUPA2
	MUMjFgRE=; b=OR1qvIEf+OaL8NOWmRXRZtGkuCd7/FL97sgR6ef1cfSgNTpYn4+
	Tnv05xS0cKWk1hbBmUxiRlCZxYU7MT2N3D7PT26tc9UVb8a6qwZWYh7sWItZiTJV
	knbFr6jwNXpAJ27D0lnRtYRya9R9y1g+5xXNzbLO9hc9qncyA6+FvtKAZvHSzWOV
	g6s+VaXf5eQkfVbUEU+6Hpe70GCnLHp4oJSzoc/jSVWOxJREPB4KN9r3bHi/kMJv
	8iV0W5nuHGWETC+rDHqBESKdgoZXmz16zSCxJIRRK2Vuu5aWOfOXevCs5pf0zLwU
	a2as9UnluFRMLNkw28z/JUiRIKNblcUMNyg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwek1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 14:04:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32edda89a37so1053504a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 07:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204254; x=1758809054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCe2ZbZE5TuBVNf+FdOD2ubfL6oSGqfUPA2MUMjFgRE=;
        b=EFqt7JI2HsGxOxZGP46H8ZfOnA017eBdQk6rmSoAqZObmuRtlxzk9IEKUliaFKbtmk
         WJVEuUoVCguU/0lGR6OC94AoXJterStWDSSv5qQ6hPZV/hxjCr5M2K9XE8j2rnoJsBhc
         lPcRuCu+//zC34L2eoDHGtYqekb2jQldnbksCTYwujXEapauOg0BMrnM3++N1zGFtX6i
         Eq0ZOoSappB95HNYBZHY8jmdF7JOJnzNSXB/vf+4xsihOOpCTbHlpqnurnD28GTwFUjE
         LyNFouq9OaUbgbUdkwP3F6jW0orsXmwhuvlMiWGSAkjNUs/fuRXxeCB/dPO4+cxCliro
         UpKQ==
X-Gm-Message-State: AOJu0Yy5Ya77ePeNd949HxNVqgdUEjx09YPR+RYqGxmMvF0Ab1RN/pcY
	LlPDWVlKZQhcR3WwF9jLvBM02BF0I+898+5ikQxIHYNkcnTJCp74B2ZzvAhB1cZCmA8V8C/xzIm
	NVOiiyJLkcozYsk19gd2p0WbHKGMxyYjqG+8AOIiA3fgUD7PxSKOCy2l0Yz2aWGJtd5Fw
X-Gm-Gg: ASbGnctTfYrf2uENGoPTyjEzee5/WxHiAqTR27NUGDpb0LHVeRQXn5hudwAFO0Uw1lg
	ELRS583MoHVJyPrdmTOKGrC73YK5quLfpTZy8SoIXnjhH2qhDvtGcBpzWpT5FrJvuAK1obqVhmS
	XMCUbBi2gr9meETPz3ZOORVqbvZJOiCBxdowr/LjWir9nruc/jrckY6njMbVZucCUSylpLjq5fp
	UfEtqQ3HPir8RL96ZInFyQZ8xW+W9HQbqWWTxbfuhjDuFUR+lx4XU48X/bd0Xgv+/Q/xUMn82Ue
	aexqmAH2aoXvgnoHsIl5StKqMRnZ5TT+r268zWIZ0jr3OtFcvGuymfxIwc7WzgM+FEV6CRoPAoh
	XQyjR5oj35d0FJaBGPrR+YY404/tmg5HqUSlfW5nfkr07O9orQ40JAC2Y7jnx
X-Received: by 2002:a17:90b:4b49:b0:32e:87fa:d96a with SMTP id 98e67ed59e1d1-32ee3f20aaamr6825862a91.26.1758204254159;
        Thu, 18 Sep 2025 07:04:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENvX6pNCbs5T3xIr2t/OTES0Nse0RZmu4cE4kFv/Rf1wD33TIz25khTZjTYD5A34y0lVUTA==
X-Received: by 2002:a17:90b:4b49:b0:32e:87fa:d96a with SMTP id 98e67ed59e1d1-32ee3f20aaamr6825805a91.26.1758204253549;
        Thu, 18 Sep 2025 07:04:13 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed27612b3sm5624894a91.22.2025.09.18.07.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 07:04:13 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Document Glymur PDC
Date: Thu, 18 Sep 2025 19:32:49 +0530
Message-Id: <20250918140249.2497794-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cc115f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9VwqXn3BcVUWGglbYxcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+C9XYc6kSmqe
 hqhxMRsSGlQ8zrYM/KM+MGkkq7oxTIjVrVM1c13pqioTKnVeGJHJWLz3LchfjJe/k6ANBxiSP+v
 tjHiF36+FD7KsfD6pruZbHzDXk6oL5b6sjC6IF2aKWXg+uw0Bwy1TolPGleGJwqv9VrDVeT/pWR
 6E2mfBFRUdoR0LgTn2GolbFx4mVs9D3yRqJQJYfWKft59CckP4MJ1eq1NumygM9jx8Fo9TNwhdX
 J+6+AFzkCfhKe6rLTF5/x1srev+GH+n2M/T1aFcEzvcI8NbaWpPoKMPN7IzpqCr5AcO2loNQV9z
 EhEJIm1ucbMhgJbV//bKALPTt1ctUo5GIvY8wgJ6uJaDViITLfAemVmgevE4oc/hHRA/5qxVBN3
 Gt6JHw7z
X-Proofpoint-GUID: kgbuTB0_intVseFUmG3I1lwJjJPLENRT
X-Proofpoint-ORIG-GUID: kgbuTB0_intVseFUmG3I1lwJjJPLENRT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Document compatible for the Power Domain Controller(PDC)
block on Glymur.PDC acts as interrupt controller in
SoC states where GIC is non-operational.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index f06b40f88778..38d0c2d57dd6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc
           - qcom,qdu1000-pdc
-- 
2.34.1


