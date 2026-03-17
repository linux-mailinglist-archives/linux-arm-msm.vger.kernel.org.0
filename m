Return-Path: <linux-arm-msm+bounces-98243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHxaCSiNuWnkJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:19:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7172AF526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 18:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9424730F5964
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 17:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD7B3F7864;
	Tue, 17 Mar 2026 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyKXgEM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kINpopc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D93F54CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767699; cv=none; b=OUs/DsAB3/iGPg+GF6gMWqpYZNq/nMR79kg2GysikTn5CkXJBq0/bSC5NPdij1idwfW2gYLMTr6Ev/PQf/YNgtfFrHze3GMmX2nqOW2NlLCb3jEEOhfIijh5vrdx5+90Z6W5L9umQPI+Z3rAsrl81SyHaw4KeJZbeZasWZIkX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767699; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWhSPaDR//2Ybwxl75u/A/OZy19UVR/YPrJKXeVnYMmZdUdp8zf43LE7BoYAwD4MvwKBMGNeoNeSeLwZVJzZPOjBWkp1oD4zmp/26qiwfnilr6TdCOMaccQk0pIdDt/l5CuEwNHg8ixhsTjwOZR4MwnuoKrTMdsmRCbEFEaBnCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyKXgEM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kINpopc5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HFORhs537045
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=eyKXgEM0zh7blzXR
	SHJm3B+Mn799uS8qpnMberp7gCI+VvfvCiEzMVhovFwnjIbYYqF6HX0ygmAQ8t7A
	rGedOd7x0B96e/LwdClJwthk0ybiLp82Ph0mK7Lk57WERIsqqMfylT0AORBuFq7s
	MdW+ZCQ1s2QI0P5KOI70te7hWZ/rdf1Xom0g0xspnYu7DluUnM5xK/P0qRQc0oe3
	rLOZOYoQpjKP59F6geaEq7rDxng9CIJleW8dJ+4RR0F1+8t7Z+4b0RPlXNFPlPB9
	QCjhN03fAHm8fuFuLqm0sKaaGU3/09q0ir8YKUre08eVwVa1XHNabo4yiQurZot6
	H/Q/yw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr0eqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 17:14:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359fe456655so5344810a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767695; x=1774372495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=kINpopc5o6Hjg1nytf0tPMcsUdmTnENkaShT3kiT6ssuNFJO0Z6/ULBTUWdlEutWsO
         Hcp+1hp0IWuBhAthORu6KWI/yZg9ESESUPpBmHzbe2XhUW09CzgpvB4ZoVMwk4TMm2ZG
         5YdnoXwgwNRa2OQx4o1zkVxCJvavfdO428TYfA8XtbXrw8El0UH1u5mVLnXYCjwRvM27
         X5yQz0DrRDW1qt7P6HKI88LcdLLEiQfL088Fu8L62aZ4GdiHpZFfy2I/CLsQIr6E2z0l
         CNHBWV9sDFzLvXBZRGviBVE8scVCnuELzb36W/xiiIds8gdhm/0pU1pKDJLgBLumEZ9I
         8bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767695; x=1774372495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=TA73F90WLQQHBLh64U1FWyXCWrvEP5UWQWqKa1Y9M4QSLoLsWNMuG6K2S6r2Ulk5zL
         Qgk8OeAAiYvVAt6Ml+fiL5HAQMcu9l/cnSqWaJnpQW9ZM3dX01N4fXMjD9j98gVJaKF2
         3xig7EbTcJhxyu8WTsW7EKsqfEnkiNqJqkmUKl8lmsfB87l5zRw5jzMBpwmRwyRDKm+Z
         d4EGfPXCCrUQEhN2XKJQPwfZsDjB/Em7AJB3VLQWDY12NevUi+ps473BduOrXcgpg13C
         Md+JsNgNbokg/J9cHxW2si9h/wyR06zXDtgFpchXxCVvJpxHZvc4YJST3RV8niiMm8ag
         qxew==
X-Forwarded-Encrypted: i=1; AJvYcCWnyZ1simf/vskPxxaF0Zo05WJR1nZkjGFlXF+jbAEoBJD+c9fR9Mx4s+8b+2+GdCj2rqWXMl8CJAiwbDNo@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVcAO+x46KJKCbr/lIyEJggzA2Ylg1ya6RDpxwfr5tp2vrgFa
	Zrp1ZeZLw64xBJywGXTJKHy9/LTtmcGGXxSa7uTObfwbfFf4fuCx3PxLXdYDR8im9qG5yOqUI/w
	ST19OqfUyg+GC/7YzSTD1BUaeCDeIGf9coWqdwK+owXpW82IUwAQFwAnxGhhEN5uBnS2g
X-Gm-Gg: ATEYQzzMQ7ZYT0P5lFmGaUCXwv6vNmwjqlPnTSdu6gw0DxDNyor9efPBo/PF4NopEmq
	uKvxpNO5L/gsGIUjhr+b/eapJGrmdD9nmLMrvZ08AqreODUblZKtmyr+jLYW73h3LxC1ol1xiIo
	7mQt4iApsp+8TGOPkP4f+hvC8pbEWvUefgmI5fHlfmibNTvJQaCLoH/rD+win9wsQwYCX461i5Q
	iCb4oRzNSHmBPvwTg14HGZfWc9xJWIfLMvnrij5qyLAE27PS1OoJ4ectp3/RkbgAKKpzrLUr+Ow
	1nKIGGarhHW5UcZiTEsh8o6bV+VUlJBxxLcbp5M0eHqLQ5TJeSoCV7RWSLj+MvSHU8t0oXha+vW
	f3t54qgVinjnBon6dkBTEE0n5CSmSQg2hR2vtrwFrVIid9g==
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191415a91.22.1773767695187;
        Tue, 17 Mar 2026 10:14:55 -0700 (PDT)
X-Received: by 2002:a17:90b:2f84:b0:359:8c01:674 with SMTP id 98e67ed59e1d1-35bb9ef5f24mr191376a91.22.1773767694568;
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:23 +0530
Subject: [PATCH 2/7] dt-bindings: clock: qcom: document the Eliza GPU Clock
 Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-2-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: r09Rkp1PUcwNSCCaCIQjoVTKYsinytIX
X-Proofpoint-ORIG-GUID: r09Rkp1PUcwNSCCaCIQjoVTKYsinytIX
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69b98c10 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX6mU5gT6P6w8e
 QAwTnswZKC33NFZBUbavuguiR9hK3O9+ZhsBWLTy0RJMnAh3rK8fpJ9MovKTUTQAOanc1082UlS
 zLBa3BFAccN6aqKJKC3hm745XyRqlSkhc2VFh2Dyui8QAiwIGqRjFP/6vqzWOHx9jNlPl8Bjpij
 dX+KO8ReA5SFeUth1h7DANw4aj4P0EWsa5gyvkydxz3OPaeiwhZwcnx9AvhvavHa0kfpojOQD/i
 q2zCwgS9iXJl0xdU5T0AbnARhzQWs5ReGXeAM0Ja4HneU7XmcGD3sUVA/IlW3ixMxRzVml2B17V
 nbN19ucj9t6Y4LI5Z5uZbwfCeYixypda1jHyn64dH1M3iinDkZTMS7J8//lEnPM86ReLLQ5udEj
 w4Is+F/eytQx3E8YDX6oMT7rnpCXHXy2k6l4tuiz+pWyO0ryAnDZdVRGRPuGp++nobFVReGKmxY
 k2y87dB1MKw8gNaQraw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98243-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BC7172AF526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings documentation for the Eliza Graphics Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 52 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..706e1c93240a8234dd8017ee181d19e58091fd6d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GPU_SMMU_VOTE_CLK				12
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				13
+#define GPU_CC_HUB_AON_CLK					14
+#define GPU_CC_HUB_CLK_SRC					15
+#define GPU_CC_HUB_CX_INT_CLK					16
+#define GPU_CC_MEMNOC_GFX_CLK					17
+#define GPU_CC_MND1X_0_GFX3D_CLK				18
+#define GPU_CC_MND1X_1_GFX3D_CLK				19
+#define GPU_CC_PLL0						20
+#define GPU_CC_PLL1						21
+#define GPU_CC_SLEEP_CLK					22
+#define GPU_CC_XO_CLK_SRC					23
+#define GPU_CC_XO_DIV_CLK_SRC					24
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1


