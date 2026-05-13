Return-Path: <linux-arm-msm+bounces-107377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFT0KAqdBGr3LwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:47:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 265185366F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1AC730B27D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B985138AC9E;
	Wed, 13 May 2026 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6vaBLC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTKweZBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1B047CC8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686084; cv=none; b=t7PURH/hx4VLZTNMNaVA6Bq8v4gQidomyxyK7diD8S5FtGHgcaPItVS/rvShSCFzmMdZ9if1PrChlX+E/WY+f5EuSpoB1cGBM+Vh1z014eenLx/u50fkI9zPnBbaFz37d+HYlLDKuYstoKCMRS+22IaXoEFGHBWW0MbsRmvr1HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686084; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5oZ79+UFQM1JtgIBEd/AGNTNNxVhY0dMNJc/2gMQ3Cal1RBLFA5QHbGRpx1B3sv7p6BYJlfth07czbWtYLeKOsR6v399VUUfF1dvWQnkLi764FysfIUTAkvCxAyEyAAi3KY73QrT1gIbIFezhWGxd2pCQKhI1YCJ4jPClcL/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6vaBLC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTKweZBB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEgDPq2888326
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=Q6vaBLC9Q5RyNtb6
	EcVgfERi3pa3bddoaQvnjIRvFdK80K7jrtX8Fau+FiMlDGCstKUV0Suz8lSYTv1f
	CIQfuOtVdwXdPKh+4G8QF5imNQ1hJe1I6ayDDjAAWaOhcnt3SgBI9/hNAtkVoQ4I
	RDDhV6HZ7C0GF7LgTSldz+6J28/1Z3n3/A42WrdQL3kpIHyGnmw9yE7m0/0A8Y+5
	9KBujGKvtbXAYLDdQjmD+53dhWXG7b0HXzCclOIEAueQN6z9dODF94bZ5yavGu4U
	eYCnyRCgtgW5K+eZt33Y6n+7cHEJ5fivsRVQluuH1WSIiqe4NwqF/fL5d547uCC9
	klBZgA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4ghk3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:28:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd15c00a1fso19988375ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686082; x=1779290882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=FTKweZBBF/PXBhfv11RSGjOyxM8TvLMPYOjRddWKUN3XELK3Cozy/qg4vA4b2bb6A1
         ovTl/pMX/KpjKrsRtJHA4em6XSnhz/+TqYguRsgALWJMRMa+HbVJRZs/G/AoJRy6ayJ2
         K6psfF/9XZ+a78DrGqatdeiL8ZErFGhuYLtGiON2+bRWW1UUHubsvWzeAWvfc9e26pny
         eijuyae0u7YsdU/7qQtPkfPbXEjbgn0O0kyJ/rldVfONB4JGDGu6oEDGmkCq45b+HvFI
         WczgV/NzqLzdh4WU6LZ5pUL3LYntndvHnb5keeBC6h+e9wMbRtcuSkF9coymDQfKVm4N
         BUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686082; x=1779290882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=q5HONDaDyDrg0yUHJ3CP9u6fMvy67v12KUvtUJIc9nmdWyvbjpw/EsDgmZpGwNjzPy
         VuT4VtRzn6YCKjOXTRaRaNbOf07DnhQbWe4+Ka7CNovgnIRSn9yYrKKY1qlExvLgC0Is
         BXp0bA0KzlJTNk3ZOzwxBo1db64yoyyLzLvBQMIM0b2gq2xUCzgVqvaejPunuXG6uSTk
         AlGEeCuBq0I7nFPqQO0uADnSsn+uhBWYAevasjuXzi0G+/KLAwaBrwOKGbgBDb5HYKhK
         c1IGZuznWvovKTmNKUD+HSSPnJlApLwVd3jm/f/IxKyctIlLvXgemw4JjYIQvETXGEJ7
         Yc4w==
X-Forwarded-Encrypted: i=1; AFNElJ9QCHyD7ONmyUEUXc4IcEzpEMJX0K8fJjVm/K8oahJIOvKYU4jJ4PWp/X8wKb/zaZhF0shKZPnVRtXQ5vTO@vger.kernel.org
X-Gm-Message-State: AOJu0YwxR2mxTG0ZvevdkHrsSwURvebz4Z2RM643XWmbRdkCDHAjJscz
	gQ5xpCgqoSZALsH+CtVL26MubatLzN3DssknlCLZh1zKuWkY4UpB1irIKgWr+b+7mw3BNyf+nHQ
	xWx98jXPckLlHh7WoFMVkSHcnQqigrBnRP7vmbcditlIdnVZs+3aHajndjPSDDpGmnKK8
X-Gm-Gg: Acq92OHwPObsUIkpo9c6/F3yM9SYaxUihnxt1QMDuD+WF4UcpCyeGNgaokIyjhy8Gtq
	dUV4xGWdr/oBqwdvFgWy7wmwoRGI7x1ZJouF9QJhcIWJMm+hW+yM32gOOfjdcQOBh94QpCnRjlK
	EZNnNJRdg9H+ACe9p1crsB6s6Mh7W+vghhj+QVW0pjFGIwuTWtFhkdtqVAs+wndXEGqiK98yYiB
	EM1hEEXFt7PibmBV3U+bQuf6VaJLy2+rHSpciSPOPm2Ijw/Ci5+LVMPuQ0k/rT98Fzqhok8+22f
	J73sp0Io8sFX3biSl3/rWeP79Rs6m975F/dTscOiv79d2UuJKMBGCh3c3ZLpWut1yc+ffH02uos
	w7HGk89vEcmiLoMdMc3oDHD9tzLncNaH3YUW6NKp3tYsKhQ==
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr48355ad.5.1778686082019;
        Wed, 13 May 2026 08:28:02 -0700 (PDT)
X-Received: by 2002:a17:903:1786:b0:2b0:506b:e6f8 with SMTP id d9443c01a7336-2bd526ce854mr47645ad.5.1778686081455;
        Wed, 13 May 2026 08:28:01 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:37 +0530
Subject: [PATCH v4 2/7] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-2-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-GUID: vhuiNT7Y67ZBq6_Gx5vDDE6FcpObrwnv
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a049882 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vhuiNT7Y67ZBq6_Gx5vDDE6FcpObrwnv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfXxNQbAAUTZfj8
 bGuCfL1X5ZgjpLJSacHG/cXt4SpxeWNlSBzHAstqlmfxfHo43vSsVavlTzHtL4MlXEo9ex+T69n
 9isNxly5athLusW+jyzCBMOi11McINbOTQ7G6/uzAcEcOyjW4usRqkGM6m29qoy2Gh/6xVw7y0k
 PQDCW0QDiCcX8SMIIjfyMpVcKkbB0a46h+DE8CUN+uaUDy7Jk6ZY6zWKl8LcRG7xvLX2N7hZv78
 6/MwtSdZZFdlN79d0Yl7MRMhDlHN476Jwru7iZRC7NR/2gTMiGwCr1wnJJxLCUVH+vdtDb2sB+8
 DjS9VX4p5uSvrA4urL/dwu9hdK9p/kdH/IK3HWMtIdmfKGKElCv+29t/3M4m0DB0Jvu+DMJIK4H
 2lwp6sVpJnmeQN+lasIXE7X2ZmpjOz8kYZsRJmBu518yvhn6Ml7TvlYPm6ESOgiqJ7EQB/uaEY6
 20bxzhhZ3+W2LjX6mjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 265185366F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107377-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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


