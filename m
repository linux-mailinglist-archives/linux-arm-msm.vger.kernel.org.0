Return-Path: <linux-arm-msm+bounces-102528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK7fCA/s12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:12:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0353CE85C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 042FE3037EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DCD3E2774;
	Thu,  9 Apr 2026 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvHubt0t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFn42TtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C31363C75
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758276; cv=none; b=pBRKdRqG3D4rp4GFam0Z6W7RXS3jKpYTKI39AI9Vz+7H0iLo/L+IY0+i7LTuTZ+xIND+Mutn52Tq9IOHGcuUyQRCiknagamjPasStEhfsuZUuFTMr7Xb+nOFcJ8QiWPJBAh17Iy6YRwCKVf1xVWemQTOYCM8rmxZ3ykI3rbtA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758276; c=relaxed/simple;
	bh=4pHAiCPa/I4+70l4WTTxBfo7ZLYJXjIsYdQ2M+8BWJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pk1ohTmyk0PKw7h+SNH3gSl7ojv/EoaRinW5Ip8IHntAIWGGSjyK5/IXyCJZOWKBTrfWCKTAimEmwEcYTirGmo1Pb1lebNVy6TjNLgXZKtpCR4wSzU+u5CXILsZqTqT+fdx5sCOyR0zwdx2f8uT+Rez0tLWy5uXATNLHPLRzwmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvHubt0t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFn42TtI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CZQMP779768
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=; b=TvHubt0tW0XzlyR7
	K19vQQmaLhl3x0Rfj29OrappZuOJLxu21wfvKrHtMMo/cOwdPkFu6LzANAlH6ENo
	R1qF9UQ7SRuVCZUxumHiXYMPfaa5NS2piG0Z6nXs5ORpSF/gkk+eI/AWEssNfj4H
	DufDtAMb+oUkXTGEOslMV6nin5rbf2oyxhEbbUehwwVm79SsEIauKOZ0v1JUB5KU
	wfX+kcHOv41wFjZTmL/wqt5hIpbQz2Jm3rpMWBKld11uJZTzyrd0E0j/L4gfEPr9
	z2/0w21aZEnbX2dhJolsQuyqaLsy/2MB9ewBLSGyF5AJLIs5tYEq0w+/3TdniEza
	FLVf6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8hsd5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so690483a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758274; x=1776363074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=TFn42TtI+4OY43sXZUsWFNkzPFILK1h1ofBCSrcaAmkbFRqanfDXnPMtHYULN6pSRJ
         uClIJagccFVltGB63LOo5zS/Z3dAIYP3ElDjsO29rV4gZJRfj5zktOwDda/vEPQMXLEl
         z0pEcJgCRWp8ckw9JvRgYEYYAZnESxNuYuWFdeWM8oud9Uw7vTUuTu/ddEEqHUZet8mu
         ySjD1d2m9jVfGdjzx7ekgp+ULWu5k9t2QQlFbqgKE4h0W9nEs7/WJX74BYBpy79ikspD
         XSr969EEO8Z2w7Gd40y1VlJbHbhQsax1+MsvmdwtLgnLh6kUQx2ZrtaiXOkdd87h/cD6
         6anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758274; x=1776363074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yB6RmntczqRFUMYtWGGfsH29TNbbMgoNZLAW4MMdSzo=;
        b=skl3kEuSU6JoeQMj3Ph+LWOzq20TWTEH926ozvz8DaTqyokn3fSYR8toc4ZbnDTLZV
         ju3vyPrHsi/YYGs71+76zHN8BeWpFcKondGHP7ov9GoW2eBkbsrBadXl+if35r0bpusq
         +evDE1WcXRGZ7dx65f9Rat88Jqb4sP8YLssaZ6enImCSrvnIKCkShFkB00tqiSDSPOdS
         6zKHM8A/F9pFyaeYNRI5hLLXVQWordmnuX6rHK52Dj2b0Giv+9RcoN+PshOysqllT5Ob
         /wO32oHXNYqbb3E+v1s+uXO0q3FzD65pNx3lnDbQ2a5XtdHAGGAvQgDcMJUZUJcSeXtu
         kkjw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Y5VnEZrT87uK81KUbRLYXfYWR0aYuRd8T3caPx4ka61SnjrlJW8eCazfw99OP+4ovvUcFZijjJQaXFBn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywivn/kklvZQGs0qNTe38eJeWraA3v0+Ad9OuM0QV+nSVIHfpJ9
	xGVvmDTPKd2LUH/qXZh8tOkr9wsqQjosiHNXlxvKojfWZPw5GvuaoGdh7laZpYmCOqtDq0rHjcm
	45toccm7azZJcVdfj1VBaA4+jsJ/qO/478JO/rFpRZHbxHCppiLDQJyJ/CbUxpwnlLkeW
X-Gm-Gg: AeBDieu3gUgpFaxdA7pp/pPdgnaF/HMP2bQk/dsGS2h64NvgKoEDAXteOV8Apr13qyb
	HV/TjB7G/slcelC/KqS1iW2YaSGa5FQ04++jfNnNT3m1wZ0CaSCtFtUY3rpdDwWOdObdcyCI2qE
	OueSxP49vRW+YYCVCXEK/1Nz/JZh6NbNUipOa8oasLSBXFLfzxAZZkGQySZa0GlvHSoCKEXBIsy
	/jTMwnnC2IGJw4JNE8/QD1Z3iD1UkFx9J4ienhi1guctm3LsbxkHtasZ/2D0GXbJWv2Agopf2qL
	JLpYwuo73CI2A8DTwJCEshSDnqU4rl6Xl3QT30JA1PifEMSPFU+p2yv0ihBcIXgxDKByD7W9B2q
	owKC10RWMT0MyipO4l1c2kQ/40tBzBYwzdj/RKU7log0vHA==
X-Received: by 2002:a05:6a20:3412:b0:39f:43c3:b8b9 with SMTP id adf61e73a8af0-39f43c3c07amr19981170637.57.1775758274150;
        Thu, 09 Apr 2026 11:11:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:3412:b0:39f:43c3:b8b9 with SMTP id adf61e73a8af0-39f43c3c07amr19981134637.57.1775758273489;
        Thu, 09 Apr 2026 11:11:13 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:13 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:43 +0530
Subject: [PATCH v2 2/8] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-2-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d7ebc2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wPszrU187IsAMdKZvZclcBGZumFdO3RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXyf6iojNsjo3x
 4VVcm6Js7LCt6c8cZfe/gULV/WvQnL/pWn5FMb1jaeKFvGsJX2PEOtOLd3tndF/vFvvz4wWfLLa
 mSnkLnk/zW7DxsScB9AKcCCu/OTzqleJtFppbpLdyS8khwQOK3NNAOY9UVQAf5HgFz9KgNHXew1
 qbt3fYC4KymHQrnd0SgoUza9s8HoKvAj+u1mn0H2Fmq9b/y7QcQYGD2ccAqKjwhA+MriQEkFgnA
 tVTZI24oWbSEgsGArbH/4KWFkktQYJ+fksYojEsjeArKlKKGiFx7nw3YOdjK0ggsBtS/wVlnUHR
 aZ4LQYwN04Fimq5L+hL+wqqK4Nv3UjRUTCrB/2gSzGo3mTzh4sq4RP0PNElgTlz6H9mlInRSgMI
 +WWJkZmrP9Qcgu08Ss8OK2hQMvmMGNwJ29JTZjsTJwibsafJuH5opXsBDA9w5VLIYit+UsrVecq
 aiWQXQIfekYGlixoNEw==
X-Proofpoint-GUID: wPszrU187IsAMdKZvZclcBGZumFdO3RU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102528-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F0353CE85C
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


