Return-Path: <linux-arm-msm+bounces-107348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAFCIpKXBGqrLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:24:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC0F536060
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD07B3287F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AB341B346;
	Wed, 13 May 2026 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T7keGP9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YR+1j4N4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BCB421A0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682218; cv=none; b=SJ+aY0k9KuHgZ2HPfXqUfTDhrEB7q/lduFn7rD5aARJaVDsbic5bU3FFbeszyHiYpOqSM6CSoNPxBDJHo2wnnV1FfX3wJiQd4qKxdOA/13ie6g7qtdf9PtSbn7YWRc4PRR4L4tAArb8yzHgiKDCEotK65qjHBF8O7ZhM5vhLaVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682218; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tHQxcTJ1kNgdK4U76g3Ioy3+lVgYIZPMLa6zhzi61FiqugeEErNdyQCk6BfQhb75uTOy4Kt4okV/zomIF4xl2JwLxIgMqLpyshSTy72RaqdlDhkVtqildVjRAsfQzWd5jS6Nl7xk9Nsn+ECyYqlDobCw181d9bJSPc15FLNxu5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T7keGP9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YR+1j4N4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8wpnG4159672
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=T7keGP9PZUy06gHb
	PBF4WB/ZORJ69mjF3HZqt6D7ndoN4RMfXxuvK6ti2/qIf2ElSSt6bsepvRx8WaRD
	l0Qdtq6hhOjDoRAK2DPk5h4nsVJdDqPTPItZGp2ZfRk/N5wQFfiRGuFXAAcJLFIe
	CCqoW+zn5rt+T+Z2IAOTuBD0s8a9AlQGMxznCFrB1DZq5pEZlLDpQ9dYVPNG5Xuh
	sjZZud8RwRANjL+2GM+snCZE5j6YEBpI8TwtRYSwqom5BuMeGSFGG69VvZJd0Hi9
	4SugpZx14bK8ZWGpu3EFkLxxJ4EOZh8PxT23OGSfYOzCdzQykqHPgrEnXLSeZlFg
	Ve2xoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91s7qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:23:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba224c3ffdso102952965ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682214; x=1779287014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=YR+1j4N4wNACbA8UM9w/DlXyehTj/fmgCKvHXRKMGUEbPcVxk+arOJG5JvabmRFynn
         hwWkVQlVZFagqDberzEGTVdeWISMRXaK1qMzZBzIMj9mPq66Rs4imYA0fEr1H7STZYuQ
         sLRD7qaZ2L6rVF3z0puunrxaZ2+w6t5d8q/miQKQ0NnKBm1bMl7EZhVduEA1hTHlmUoG
         oR9GdZhpiNy+nAc9lFPQIIYWrnb/ydDXHr5Gwd1iHuQytckwZUCJpE0ZL+R5+0nYi0Q5
         SQtLZNt2YPBs9mKUoYUYAlTaW/vnsPQ9qOgARsjBrUl8RFBxjT61KufK8aRnBOOKg99D
         WUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682214; x=1779287014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=EiervWl1NW3OD47WP6kJLwj4ZUAwoT+kii8VL75WX7VJB0uJ0XM2xLnKqUEnn83fry
         pOX9jJgmwwO/LFnHnSpARWnfJMkjuqDqhcVsfezCmbzv1mFJctZRfG4uwEv6jpZQZJ0r
         oJECKrb6wVWh+tXpIGjue7TfUUHuRoQmgkpoj3aWHYULydZblvtXQ9BngfjUOY5cq64D
         fZlXOppiEVL8wotFz+6wh6oDYaQWgUDSZNvpbjAR4bvpWQYaPIKNGDw2OR+VQjUJbyEO
         wEbboq2eu+7cdDIqraoXKOZa8jdj2RMk7lKCdvU+jPw3KYpvo4T1xqU5qbTXjE4Pix0y
         r0fA==
X-Forwarded-Encrypted: i=1; AFNElJ8A9O4NHBMWcKy9O5cV/bR7p4A+S4l6Bv9s+Voxx9xmcLL62+PXuzWePXww9e/BAAVozj3M9g9sNFbbcNGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxifwqkFZIaGgtVh3g+2PtULGxTdJUWmfKogYVA60tzrXayWMDU
	VBu25xhinrRDx//9F54B0bazaL6BenOkQCxCiFhmktTD91PSp9mfzo3COHVBnu73hwzmkhex2Eq
	k7aFN9+uukceztAC07Sukszex+x8SysFb+YUuDtkD4G0gZxiXaC3eek9piXbX4eGho+DQ
X-Gm-Gg: Acq92OEr/JufW9xlDlRa689rh6TEe/aemAD17ad5uw5i7wIkzuJ2JHyjPr4mTyXyOXQ
	ywZNBGuxTraa3rFcJzkaPuFWbSoezhz0+FVSJKHYjizngQVNeNYMAHQIG34GQVFhQS3NDZZ/N7R
	E0P9TrqnIAXE08NXy1bixLHOseB3FeyW67pAhpXkxF/+OOGjFhv9OXJOI5B3+sdzMl9ASVN8LWo
	sRVAGALqoMHc2dcGoqA6Cpv8eUplq9BnL+vxG3olU3jUavbkM4JJETTRq/0Y6fv4P/aYT10bSyX
	y/YxtnU/w2xdPqUDB8iQPuB/57fJYYSI8zbsSLOI3kSPIqoA+QiIPkfQlAkMLimGUI2yz0CpZJ8
	TTXpgRzxBlXuOJB2B+PQc/VI/GRQRS7jnK+aFu3VJZdWm6g==
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22226075ad.7.1778682214380;
        Wed, 13 May 2026 07:23:34 -0700 (PDT)
X-Received: by 2002:a17:903:2910:b0:2bd:2439:25fc with SMTP id d9443c01a7336-2bd27147127mr22225835ad.7.1778682213847;
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:23:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:07 +0530
Subject: [PATCH v3 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-2-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: UclTMTS7017YpiukXH2oqFr0WZgoOWXe
X-Proofpoint-GUID: UclTMTS7017YpiukXH2oqFr0WZgoOWXe
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a048967 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX+WeyUhm96PZY
 9znkp4+dw+E3vwUP5yabR1tkvAAI+lQn+A8coEX/CT9SwhU9nzElFnlhlM+iDuRZU9NqlhYRNRh
 a9ewKNRYjH4VpYEugKtDuL4RU1NVE27gMmp9CjpXLf+ReCodDjIgdVyLg2M3NY/wBTBaKsY/chs
 GymNJXBqSJfTlisQ2WRPNSyQ31HTTTQuT37cr7f14cviduEhL3QdauWgeD+E6n9DuHWSDoAW6/8
 jGuwtimjrqT2xYEkcQxVO6u5HaaSc/uuR7XAzsW1hdhV3ycs1hvq6BoGkMcU1B4qXDMf09oYkE2
 9JMi9EOPtSJ+YGTPtth0Q37Js62/iggKEoaPeOeXCQfWjQYvpgE8vcXu+bH351xzQd2mB/tjfbe
 AZOXRmWQ9tsHPz2EQgWha+SXlSoueQkoE7hRnNHPaIF0z9j++LPfFvGL29+ffOxW0wtoik8I4kE
 oTKH93IuPO4ThnbMXSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130147
X-Rspamd-Queue-Id: DBC0F536060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107348-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


