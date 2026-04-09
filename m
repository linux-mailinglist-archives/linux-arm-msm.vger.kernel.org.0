Return-Path: <linux-arm-msm+bounces-102527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNh0Ncbr12nnUggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E13CE780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 20:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 273BB30065FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 18:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE783D1CC0;
	Thu,  9 Apr 2026 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKvrJSQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WeaynBQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A52D7DCF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 18:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775758276; cv=none; b=DIw2RP0mBpCkqwQ/McOIVyBTP8pyQQChUZOeqGj6J27PcCnp4p+eGt90DCTy7uVZo5ExrmLHJ/MOw9i1j3SNJLob9+9Z3i4KJosUDwOvkpN5FC1UCavONku2XwVhirdhZlaa76Nwk3nm4Wku5bqp2qaYZCPO4ebXbJY01wfV170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775758276; c=relaxed/simple;
	bh=1yjzO1sLMiJzWkzUgEx7Z3qRZZ14NfNa5E01DO1kMUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RqBTj0dl3kycrA6p1IOQUOP1jC/nKQNe+Zu8Wh97vbeu6Bfq233oMnII6b+7a6AjwtZIvaOdYuapWVUcW73P8awOvzIasNcmrHMwOzkKJ4tdlxooe7jpRudFpfWtG+OhVWVuYTtMWJVhL7qo2UOZA6kBghsdPPMxZ7aEFDVB50g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKvrJSQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WeaynBQV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639G3tUW2247244
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 18:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=XKvrJSQDAgXU8sK3
	xbOjc8eraxv+LNeSD8Eq9ob7R9xjRHIl6mnk/g5ngqdG4Sw4eTrnsf6lYhK8nXbV
	ZJnswpX7BKqcdN7CrMQzv91IJhIE2exj/5WnzYMrMqdVEBfECnIdmsGp4nR6iQZY
	IHITAuUgU0HDbIywHv6QQg1E7nd2/0VDlL7va2iN4++fTRAULc+plre7OWbCPhV5
	Zl7bNSYS2iFNujDhIYuLDgh/TEsTkL3HCgdyl1rSif8LHaMuz7sBtHSX3ZXkqXcs
	awVH1bllaa9171wbpCMBBuPtD/BMjEOGP3VUSaQmsH2RBgsZ5P756+tsgQP3BaPA
	bGJRBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6ucmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 18:11:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76c60c74f3so875363a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758268; x=1776363068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=WeaynBQVFyudviqQgMJ4eF8tOfnYafZNJ1PRusE1yFrn36rnJSO+uxtmEa+FAAyo4M
         VRbdUPEXAUFzCot8TxfeNKalNERCAAM4bpBBPhbIRpPX6vrSJLRoS6NreQDPe/VDArzY
         KFhXp4wX0ZPc1Bqe9ODfy2ElKNhuLc3fGs/hGUCnC/KppEXhPUnmcwU2yZlstRL9+9U5
         7ZDqFGm9x9MtfFW4EiZzX/L43e0BweYqgXQst/TCJgDmoW4QQlRUxLAxGGfEH3bIbxBt
         /tVEcAZzkeymrP5U4o1vojvl/tMlQHUxc4JJkFFrbBtuhg71hraBdu9KrdRvUgGlp7et
         EHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758268; x=1776363068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=nYFhCTkJK1Akd+2qv3WLaCw7gGwU5pQMfKG1H1Iw5uec2FikOLJXWSAoY1azoBaQS8
         J5RaKXWcmYK5RsisI8hFL/6NNzvGpwP890hxyNkrQ+8zbbo0kZ245bmWrZHWJgAymEu7
         ORL8f+vq3tWY0KGiJc77J+uBfv3b1FdQE8/8L9Z4Lhgt55v5UoedNVoskEUyeq3GbuJj
         yXRMHS17R3Qlw0kp+pDpYaYNVlyHV+MLhUSaRIiooZRzU+wlcAPqQaIkW0e5Stx2eXhJ
         QX/tbpnGn2nh9tKYd0MB5q0b2BbCJT0EyOMitVV2I1hWvVfYw5aCpi5aAhC5bNoBzwm9
         UhqA==
X-Forwarded-Encrypted: i=1; AJvYcCXz4VZ9/Vhc9bpaYxFeFXM/giJJrhi+mXvn++nxNFySn5IcVZj5auyictVB0li55qYcai9gHTHwr4aG6nL4@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdiV+DYA6YRRgIStUQ6FTS868nSau5xDl4600Olhp3sGXN/+X
	uuEJXnosbbW+/WY1qt7fMnbMN/FNZkWWoTZdWOOz0B1rgezmcJ2v0ZXChOpoMzvBI+P9yQV2QWa
	/F/SGecH2mU8SWhBtl3+g5+Sle3RFLj7ublkSzEH/GNsGiKY2/8XnIuLKT2/YXrD+huei
X-Gm-Gg: AeBDieuDLsOOKKSPQvp1LVdt6kroElzJxkEhL+Mfxg38L7qi9zcZBbH3dkUorQL6Txl
	tygn3krDJ0demlG9WSbSkKd4tbX31/6HanvoZYkvRRofPSmgPuaeROklCBiG5StVRbr37j97QrG
	SU++be9yunS2tfzYI6F4cADCOx8/4cz0hrfO+Xkm02rkhfy/vl4lxFo+SJYJPT7I0JFz98t+JNn
	bjZ5ILlFYm+//wAO6yDlG6cAxGxOd9/4Fb3HcknNSX+de3qyYedQxu6JPUQF9xodS5JHBdqSFfJ
	zCpmfeZW96t7jdW4J+Zc9PkFo2L4E9fWxxBph+59+48jE1deacKNh6dsDPafGRrHfbWM6f9yJV/
	knFy/PrdHhK8bqeYMuWbxfdOmx/9NUMvQkpiF/b/GLMwYoQ==
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752546637.60.1775758268196;
        Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752500637.60.1775758267599;
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:42 +0530
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add video clock
 controller on Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-1-bc0c6dd77bc5@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xNjYiWqtMAovdVPB5T67dsCoi8TeWzOA
X-Proofpoint-GUID: xNjYiWqtMAovdVPB5T67dsCoi8TeWzOA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfXybS4KnYd24uh
 72/0hCcYrONN52HeA3J2Gw8e11PxuAnseZWXW83bX1M459gHP7TxG903eP8C3ZiUYt7SmzEHCfC
 zG9xXiy+/tLlcladKTBhSOPsYC1jqZDlqsUDsMD/lceNLXvs7l1sEs+rYP2cNUHoytviFCPpKn9
 CllK3OXZeaOmj6gPr9gR3K1f8AYTxUDhz3c7u2iZCdevugNqQ+Mc24TFfGiQ1d6vSWSJtBdk0KB
 SREYdAm2SosnVNkqFcKhKfbRd29jxtWnc1fUyNijKtHi+UwQanhu6rVeBivwAVMQl31tuVVKPLd
 IXcVlmLkCaalvvlApvIklMlx8hkwo1seSMTcE0FbqX7E+sWotGUGVfSAT8FB9F21Y8kHXmT92rw
 r9qT3TlpBrmZ5LMuZgX7u8TUEPaYb7RmYotSWtuDS4gC0+R2/o6pCDqHJ+KAX1bk567ogAVOxLA
 EbHlPdR0K89nTnY0Ehw==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d7ebc2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102527-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: B52E13CE780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-videocc.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26a0c85f26b13ca8e7a4f5f418e8c98235f10558
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Eliza
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Eliza.
+
+  See also: include/dt-bindings/clock/qcom,eliza-videocc.h
+
+properties:
+  compatible:
+    const: qcom,eliza-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,eliza-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


