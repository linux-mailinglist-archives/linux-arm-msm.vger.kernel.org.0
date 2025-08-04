Return-Path: <linux-arm-msm+bounces-67637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE15B19B79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 08:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BD0C189206F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D642C22B8BD;
	Mon,  4 Aug 2025 06:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMhmlB2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B492264A1
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 06:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288243; cv=none; b=AolUbiTw8By/uyl7WGc0Qiine6AnCTenAiXO/dKv4mEIw1gLEWFopiIZ+eF8XqTTP1tDXrTSYS2F6m/QcA3HyrocJ+zFXMvqwVwiADkq0aCEYssPK5fj0k3BVTAzpRk3F2CQ7ZL4gCe8SJjxnWZh6Ko/7SsUk4bLwc0+N67t/nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288243; c=relaxed/simple;
	bh=Ul1dVZpeOTw7qaiph5ZpTsDcTs9gmOxaff1msl2kru0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNEsqX+Aoz6IsWm2iJ3mi1BBTjBMc71sjGlSU6ZrjSmqeZMCZlTOEkzj1FUslFiKnhCo9Z6CDi6svgnLoZ7bJvBVNJR2OFd5qsT5i8SejtG4H+hrj3WyU2ZX2SbkwhZ5raWc11+igK1m98N7908REJ7rVtPojVvO/no6IhZwCAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMhmlB2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573LuEYX007793
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 06:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rRAvA28iaBx
	d6Ygxlq1Y+dMf1EQJkDMl/h16ZgOVLds=; b=TMhmlB2d4RpZRRgxT6qcgLlR/jo
	XcnDWU8pBCeAPHCuZPZmm8Nmo0omDOLkkWsxKKD4ffauOpRG41AR8BdfHNCg4l1s
	LejBL8vCxw8gYarCR7mWjzkMjlNVdsnXEMORQFPTAkPFi9cCs5LHIyeTDkK+lxvb
	tftfuqd8GWEWYSPyXRhu04tdwZAPoja14hySckw+NrQh1HQvHt8/PQqIzCfaZVmu
	wozRckjGYGxVcT+bQRjhZvxutoGGR1nfTQRtJbAGAq4NB3iuinrlCRX6cHfRP4mE
	B6AvJCgkg9uiJtCArJozswQgNLPkHM6uNjVz7k1Hx6CNJ2kKx+m5c5Cr8ig==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqkktx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:17:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23ff063d087so26267955ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 23:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288240; x=1754893040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRAvA28iaBxd6Ygxlq1Y+dMf1EQJkDMl/h16ZgOVLds=;
        b=PGvMXTq0SMpJQ34Klg/u8A7VHuOFq4JxetvbbxE59Wdg63rGa14H23HFi3Tfubf5Cc
         8zCI0hOhBKIQhFcbHDqIs6b+bcRpFcqTMy7toDJVKU/iIUVuhFMkfjaoPbD8BN9SonLz
         0tcPFT/uQQqaAOMCrDf56iTOqTVYeDkpVZD6SF785zTCUhqbXmJjplDxrzukVHvNeWZ0
         1lBX9MaCAnzidRTXpH8I+VsWJBC+WYvvDUfrrqv54mh5K0AHuE3ygLOJga9W3N/ql59H
         Oz4SkpuAB3REU5h0BIgQBWT1EMXOmX3K57Y5po0nHQUg+RWR/Evh5Z0TMPrZfzVaBQMc
         2w8g==
X-Gm-Message-State: AOJu0YzS/fCj1ApKdperC8B45taz+dDntbh84hwTqg6yML7nklqimhvN
	nsU6tNHR48vh0pH+1Chhd49Enj1xp96C/+3t24sjSWYavl8n6X/Ybp4osooyJ7drtqFoklrRv3M
	TjXcl9hRXZdT3bs1PvN30dpQ0AzcLB009DZ8W0ZcVEvor7l2PKjQsZzMPM4bnesRHJRNf
X-Gm-Gg: ASbGncuPIe2cRac83LeWot/nZy3I86kTN41RAKHaUBGrqXBqx3D0l6yGTC30X1XeJ7w
	3NmLsIovds4USMZlhSmGcF3shHJrYtRsIYc4BvFA+naCWgw6sfgViL9VSP3MYGS7UyyuNNaaK7y
	e4IzWfW6/e3r51VuFZhLpTvdwSGQxg39k6UtTbRVOEVLrhH2xIAjNBN8D8VI/6zKxRkTy9OV9F9
	gDAL5IfStrRNi/Re2r49Z82UkxX2fAsiR3xikPBeYklLPcjf4vzcy23Z1AYki9Hhbl8lKnr930y
	ev4sKyRt9OWNsHzNF0rXAECKvM+sLPbOtfbeDQpuz0QLRajNWfNTkDZlX11Ab0TbmxRqJJ6tAa4
	KSC8=
X-Received: by 2002:a17:902:c9cd:b0:240:11cd:8502 with SMTP id d9443c01a7336-24246f6d417mr66434475ad.13.1754288239975;
        Sun, 03 Aug 2025 23:17:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYPsjILhMmkQQ5MzhT7odrk4V2L30VI99GVEotMyVKKWKnUCGcF2rjuDKjD5PhVgLM20IrGw==
X-Received: by 2002:a17:902:c9cd:b0:240:11cd:8502 with SMTP id d9443c01a7336-24246f6d417mr66434175ad.13.1754288239532;
        Sun, 03 Aug 2025 23:17:19 -0700 (PDT)
Received: from a3fd830d25f9.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976f08sm99786785ad.103.2025.08.03.23.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:17:19 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 1/2] dt-bindings: interconnect: Add OSM L3 compatible for QCS615 SoC
Date: Mon,  4 Aug 2025 06:15:35 +0000
Message-ID: <20250804061536.110-2-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: tMLzvNRgr-vQ_z9axXBWoVQdkStXaVmK
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68905070 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=bpSexm00WYn9fMQEYZEA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzMSBTYWx0ZWRfX3ZE9OgS8Jp6T
 pt8rRzTNj1K3MBrqilKUu74RZUy1GTFerJTUy9kqfQcDn6RMiWPxPEJwRXlsMSrxlvFxVtI9I0L
 eszuveYVPf58iDVegyM8Opiu+FWbdMP5VDMWYFyM8+yDvTvW67eS5Sy6qrbKrfXNrYoSbwC2RwG
 JSFEIQgwizRgz2cp+y0+Ly7SmkNqErQ2u4YkhBzEWNK2vVFAEvIxaoBLM41bTJU7niACErN94Pa
 46K1MMRtmpDzl3EJhjTmSptphB8nxKZLKLRFUUQh24XKoSNw8NHajjJkCqvmg9+TJSgDI/r8Nx6
 FIfTgx7s+OHNClpH8uUBjLt+0AiKNQf2y68nnMmlzsAO9g5XKUmTvZG40yRx+pUQRnZDXqLQP4G
 8A98EFhvNV5UqCydnL2Afs0qCHgiIPz6k/7qJtbLZtCY04PUaOLXX23+dojReWIYZB3RhSNc
X-Proofpoint-ORIG-GUID: tMLzvNRgr-vQ_z9axXBWoVQdkStXaVmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040031

Add Operation State Manager (OSM) L3 interconnect provider binding for
QCS615 SoC. As the OSM hardware in QCS615 and SM8150 are same,
added a family-level compatible for SM8150 SoC. This shared fallback
compatible allows grouping of SoCs with similar hardware, reducing
the need to explicitly list each variant in the driver match table.

Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
---
 .../devicetree/bindings/interconnect/qcom,osm-l3.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index ab5a921c3495..4b9b98fbe8f2 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -41,6 +41,11 @@ properties:
               - qcom,qcs8300-epss-l3
           - const: qcom,sa8775p-epss-l3
           - const: qcom,epss-l3
+      - items:
+          - enum:
+              - qcom,qcs615-osm-l3
+          - const: qcom,sm8150-osm-l3
+          - const: qcom,osm-l3
 
   reg:
     maxItems: 1
-- 
2.43.0


