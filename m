Return-Path: <linux-arm-msm+bounces-93447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLCdHzL3l2ks+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:54:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA32164D63
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:54:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE9430329A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 05:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B398D2E6CCB;
	Fri, 20 Feb 2026 05:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0KRFdu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsUUrn4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C6F311C36
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566876; cv=none; b=YKAxJy4EhAIwfCmsuktw/gTqN3EczohHX1sWUEg8Zu0vWs16BIbScYHMgtBkhPe84vKCF5+hfWPxPbCytBYRZS86BThB9/u0zByJh43pSrOKb76mE87CVe0h+S31fPdqgbzUIkA4ovNYLQgny0hY3T+Xk2dnnne6r+bigslXDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566876; c=relaxed/simple;
	bh=yTnXF7Ft6VvbHmgcahe1v/ziOK4hNnjrl83gdkHvKLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sD5h7I+P2xw2fRSRGXcynR5uBZmdbAW3CmW2rueicdsU7ssPJ97M076fFDkDydSKOhJVlxxJJJW69mBQocLxcoIE9fn7yqj+R3zvb7Qgsi9S+hBZmWEzeTB5YYUvGQO/b2351AgPpYRpar7xTjI/tdmbX09P3rtJRMK0GmYI72c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0KRFdu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsUUrn4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Rpnw3034327
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbywBh+Fp37quyHpJxEH+Oxm1N60Sf17rtYjYQDeu7k=; b=W0KRFdu3S8xLEbPM
	+vVB6SAytJ0OvrgXsDrAgKIIemrwCj/JYtsJ1inT288St8k6ABVmX2jN4uRx8Wv/
	dQ9gDOUDgEavy6SwpG+mneE4eAObdsqM9kGdJJ75cc2QmlzsGHDlm1U1qfrkCNZw
	4IM7XkHi4zpER9Hpx0lWOBo+GD6Mum1XLnmnEetY63PI4prT7S4eQjH+ramjRP31
	7aa7uUzhgij0yTE1Gs5uibt+3Fzo49KprgQMbZStxhBoxyT61Bh2TkJqDtQ7u5zT
	2oGLz208A3dQHuGNf/hWE9I9SSna13UPMQvsAeKw3B47+sBn8VQUVuNvoVuxFhoJ
	+ItRVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k01vqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a946c0e441so16330135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771566874; x=1772171674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbywBh+Fp37quyHpJxEH+Oxm1N60Sf17rtYjYQDeu7k=;
        b=QsUUrn4Q74vLrU3u53vgdbfwiGowRbd2MJDygXllMuBsL/nlWePydXDnTcLANbAtyK
         pO+ImJZKQZwV5XfhCoJ2DhjoC491rPT/JPQ686lz6zNNwRufm9WeewcVWFenEjPSDNBB
         yH4KKZm3BZN9LkEbJsjfDwulm3AxHx3XxSdzHOR9chVdSZlhHZ0YGOlIhDdqf88RnwyL
         tjMBvffOBz+OblSEG2gffO5Qv2BOnmZNExD0wi5e9kozIWtp+LfF2pkPbDuUhCI8FMGr
         AKFh66XEqMGHPvPrjjIqPK22LTt0dpPdJr9BYzIuyiJMfbhyBd9X71jSv3DNNSg2oBtd
         lygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566874; x=1772171674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jbywBh+Fp37quyHpJxEH+Oxm1N60Sf17rtYjYQDeu7k=;
        b=BSASMwvLhnh8whzaRe+7Jq2JAz2SH5e817HlcL2JZ7vIpDJ/AX+z6sIBlHGlGg80OI
         8I9Gv3grliI+JUyaUAlb9/rKig/GrtX83z185JbhkfCRkhhEUI4Iojb23hldRNC81jAf
         9HGPjC1TkxbbCbAcioGykravwsYfE2K0oRmuuy7G6+6YNDp98C7FD44cxhhRa3TQtO5z
         eoR2nozsVBzQHreJtCJmwOXdrq07zfS816Rfo7f/2wOpsoy6AfLFU7UeWhR2maYRAqiY
         Yw1fFBLh58L0Mq6SB5XLqzywtfkSweFkNmFkDb9ohC2sqOjv0hHcsr7yL97O923Cf77o
         HKIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXoIBKLuub8ggI3xrz5oeUjzpXW/6T1+JF2yPoZsv7BuOPQBpATJab3xaEVaK6Mf/vSP/XzFxyf8J7dyO1@vger.kernel.org
X-Gm-Message-State: AOJu0YyanmFd+PF3FbUH8BxI57cepP5K+LbmFGRbZY2yZYZgMaUHqlJh
	03i3HFac3uLHr+G4lrK5tm1ytZO4vxfTclYSa68lpuRIi2JM2CjyqlaNa+kWI2c+qdb5Oguv8AO
	3/24lW4FnVtdjky01xK/aK+4UjVlhHzWXlMlJI6/YOY4f1O6U1W6o7rcaYURNfEnSJRem
X-Gm-Gg: AZuq6aLL8VixAdSiICGcsTc70yiPcU91umsxHS7k9Z0RRlU+q0a3gwBWkShnXGI0OrC
	6mtJj2oXCQj0JqE9kDS9cinN29fK07dTmRjV/nFs7tO4+oqhzE9tVZ01vcQbBUz1Vyn/oY5S1j7
	y2XTwkSP2zBDZ2b+pRrKa43UcQ9uDUpJSfE6bqrgqBl0tMgTCH24M3olKqV/lSqNcbDsAVxDa91
	GzNFauOKmqymGjXPvOX5IeJpgwbGy/YWx/rI467Tecb90HAtF9g8jv+HZX9hzVsojafsuNDVvn1
	dohNDqo37P1d6K1pLLgeMUUq74g71osGbxDmcK8TkAtzDtPcSqpnoZBBZ5XnmPa42kky5rS/Aub
	7G+vFXO81jYKVotp1vhlxuQoY+XLT3V3U5JqA8dZmohQppw==
X-Received: by 2002:a17:903:2449:b0:2a9:42ba:b093 with SMTP id d9443c01a7336-2ad50eee65amr75156785ad.25.1771566874009;
        Thu, 19 Feb 2026 21:54:34 -0800 (PST)
X-Received: by 2002:a17:903:2449:b0:2a9:42ba:b093 with SMTP id d9443c01a7336-2ad50eee65amr75156575ad.25.1771566873462;
        Thu, 19 Feb 2026 21:54:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa326sm197949665ad.1.2026.02.19.21.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:54:33 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:24:20 +0530
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-gpucc_sm8750_v2-v3-1-6c5408564c3c@oss.qualcomm.com>
References: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
In-Reply-To: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0OCBTYWx0ZWRfX6mICUquCXuYH
 BseWQPQWa4QDTAS2P4ZezJ46cB6KRfrg6u9++EY+Vx2XOaMxYt/9m0asIZyu6gFZ23kBUeBOcuG
 R5wAnGutu45MXnHpeoh/3WooTcEGRiGA6wPQSz51nZHG6Pbe2DiiFV9famm8LRT9cgT7zZkB5w1
 +PMdQ5nSFJHDK82/0erj/u5mUyIJDmd+AmLmCYqeotAcfVXikve0h91UaV9T+7COTetV9D5v69O
 ayuHlFBvk/xdOJstzrkBYJwj3isUHUxDwzMMhvmBbJHquQDZqBsaVrwomWF/zAtx6Qw15WmksMG
 0HJoBW8mSj7HtS0HEXx//TGpKSBWd4mBFsIAWt3lUMGBPAInBTd3MSMa6nY8jK7QLHduzviXGeS
 6irofxhtmh+PBYz5HqvHfHbOoP+RpYfWvKP13J1qvuk/8SB1f+DOjSqTXl0vZiPfgWjj5dDUASR
 IWJ14GwXztD8ohCDBTA==
X-Proofpoint-ORIG-GUID: rijO0u5yYAbA0_Q5gW38RM0O7yxykvci
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=6997f71a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=DuI_pPAKbSgazMGYJwsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: rijO0u5yYAbA0_Q5gW38RM0O7yxykvci
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-93447-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCA32164D63
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The SM8750 features a "traditional" GPU_CC block, much of which is
controlled through the GMU microcontroller. Additionally, there's
an separate GX_CC block, where the GX GDSC is moved.

Update the bindings to accommodate for SM8750 SoC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |  1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  2 +
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      | 50 ++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 5490a975f3db7d253a17cc13a67f6c44e0d47ef3..1876f23c174e4ede590847d80222e49b4200d8ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,kaanapali-gxclkctl
+      - qcom,sm8750-gxclkctl
 
   power-domains:
     description:
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 6feaa32569f9a852c2049fee00ee7a2e2aefb558..3504db982cfa71fc03e187c3dac148d5f1cfb6ec 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -22,6 +22,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8550-gpucc.h
     include/dt-bindings/reset/qcom,sm8450-gpucc.h
     include/dt-bindings/reset/qcom,sm8650-gpucc.h
+    include/dt-bindings/reset/qcom,sm8750-gpucc.h
     include/dt-bindings/reset/qcom,x1e80100-gpucc.h
 
 properties:
@@ -35,6 +36,7 @@ properties:
       - qcom,sm8475-gpucc
       - qcom,sm8550-gpucc
       - qcom,sm8650-gpucc
+      - qcom,sm8750-gpucc
       - qcom,x1e80100-gpucc
       - qcom,x1p42100-gpucc
 
diff --git a/include/dt-bindings/clock/qcom,sm8750-gpucc.h b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..e2143d905fece19f4ef5cf413724f1597daa85ba
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-gpucc.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SM8750_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DPM_CLK						8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_ACCU_SHIFT_CLK				12
+#define GPU_CC_GX_ACD_AHB_FF_CLK				13
+#define GPU_CC_GX_AHB_FF_CLK					14
+#define GPU_CC_GX_GMU_CLK					15
+#define GPU_CC_GX_RCG_AHB_FF_CLK				16
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				17
+#define GPU_CC_HUB_AON_CLK					18
+#define GPU_CC_HUB_CLK_SRC					19
+#define GPU_CC_HUB_CX_INT_CLK					20
+#define GPU_CC_HUB_DIV_CLK_SRC					21
+#define GPU_CC_MEMNOC_GFX_CLK					22
+#define GPU_CC_PLL0						23
+#define GPU_CC_PLL0_OUT_EVEN					24
+#define GPU_CC_RSCC_HUB_AON_CLK					25
+#define GPU_CC_RSCC_XO_AON_CLK					26
+#define GPU_CC_SLEEP_CLK					27
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+
+/* GPU_CC resets */
+#define GPU_CC_GPU_CC_CB_BCR					0
+#define GPU_CC_GPU_CC_CX_BCR					1
+#define GPU_CC_GPU_CC_FAST_HUB_BCR				2
+#define GPU_CC_GPU_CC_FF_BCR					3
+#define GPU_CC_GPU_CC_GMU_BCR					4
+#define GPU_CC_GPU_CC_GX_BCR					5
+#define GPU_CC_GPU_CC_XO_BCR					6
+
+#endif

-- 
2.34.1


