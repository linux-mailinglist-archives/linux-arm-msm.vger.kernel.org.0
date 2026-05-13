Return-Path: <linux-arm-msm+bounces-107376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLr7MpOYBGpiLwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:28:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507A536180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C9EF30054ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 15:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC7A38E8DA;
	Wed, 13 May 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWAJH0gG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+BeBlz+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1305D43E9CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686078; cv=none; b=tpq8XpzQsObWCa7jzBgkgj2zuaYObeVUs4bhFsC7u4DTyH09nDwjWHo9nsIp2hhmmqntspKgrDEs0CdtfitP6FFEfbwPykfiLo9BvROQh0j+4YcKA7B22RXMTHVoVaV1AZPB3HME6qa7d3DaOZ55Rhltf20HT7aSY03BpUndRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686078; c=relaxed/simple;
	bh=YehWLP7vzVkdqKiWVDK5gDg00nTbj62VF3TyWakSVho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odCoXNpM9ICPa1kjIMk9d0IY7GqYCJwcD3MgeCFAeCYbF2VjBD02slTsU/nYowYSTqazYBvS0fvL6nTMhMjpaSlgR5WLT048OaMgIGN+8OOk+ifAyzfXpvbUbKA9lyBMVrNd6QtnbdqNYxyS2lCgRhvUZIdnDVB+glPZKE1uUUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWAJH0gG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+BeBlz+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAvgOw1393173
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=; b=oWAJH0gGoeGqe/Py
	fAD/C3e8SbEle4ssf6zo+mvxdSdzpNfH7oHhbgyZY7wyk4N8fyALr9ziwv74uCVQ
	iPSCl2vxel3ZrKhW2MODSopZ5GWcUB9cKMb4UGKohtThZmPpoYbXOan8M/mPWSlE
	jhJzdU5aaaEFaYDUZk0qphJWHZEPW67VXeowqw3pqOa0VN9Xbxzfga6YtjHZBBof
	WO95rbqud1VtfkBXHcw4YOX5MlKtTnK/5qETGfRcHNCGe/D9doV0b+0m9q69t/73
	UXo5XNqazeGD8/aqTW2/zeDJXl8MGzDYAWi3L4Odf9P7P/q2So62g9kVqsS8Lvig
	NMnjIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262c0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 15:27:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso104517285ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686076; x=1779290876; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=S+BeBlz+dJzBKMyCdj7NoO/YcJ4Jn2JmqaQY8tQ7MpbfI8zZNunPh5OHqVfNQ3PZX+
         GoW3/g7b1KINCActKzFdKoQpYWYtI778DAxDo7Q9EkAf0u+gZHd3qm/AvusSHG8CVCdI
         CbgghUv9GWP4rBWGaBsZnUQ4IxLVPdsWD8S775ewl/u9bF2THvm3UZyEKsJyw75cDgRo
         74dxPuWk5gyGza4IKovouK7OQbTxmNswCEZ1NTXicCBreZ0N3363YVL4lhwzwiT/C57X
         hnDCcMIIKVvjlsd+VW5G4+DOnZxvLmEbZ54PZPMoePofJ9TKWEmpdVtDoZg2oUF8NwEY
         kRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686076; x=1779290876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v0DMstAAzIVUNxAkb64PoVNpFX/uqMB+3Ui+l/OkLYE=;
        b=HXY1xWYDp+QfydKXOk+TbVs8aUXNdSVRADWgDaH3gIUqclpfxf6cbzrElmdHa+maqk
         Brp19Orr7sGOb9oEmr75vEdLaTz0lBKsRi6zD5zMefc9oXq906pwz23CdP8BtmPujP0/
         wRHLtb7tLINZwMGmTD7pF67OVD7wyTbAbYQBM7hAJA19hI23onieYQmUQT9x0Yfk8NVM
         mxuIpdhA7lbkXErcWWthJRSMNK/i/HZAn4tpYf8bqB7UBhhC39qfxps9nz06XEi8zfZI
         iKNXZyfr1jPHEhUFxS5M4wU0MO1LUvHpeWDVr5mdPaMiHLDGlrKsGcZHqPoBhkE8UT5p
         YdbA==
X-Forwarded-Encrypted: i=1; AFNElJ+Wcq3vEwkj1BX6HsesxmdG6eXmOJIA7cJc0Tt5K5GEicdQyz86M631KxHKJ5BCnbfOgOI5/XcgEvTC5d+4@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiLwwl2S6JlqKxJI9RTng0QVSwnTMoaBpFYXwDuZ1yXXMIHQi
	pXmn6T4yW0ct9Ht9sA2AWzvclRrzsjBk+jHiYEZgTQwc6HkrWssQbfoIrFVGX1US85P9A+SW5M6
	p6/rzfAFVE1WjlnrsWhNoe9x0aEC0OpiIqwXqzfL8m91YBPD2M+Vxk8lBSzYWk9gs4KH9
X-Gm-Gg: Acq92OHEumjPXnB0B3bm9sloQCNbfNhIHm0JzaXJD2POp+b6Q9u641dRCK3YPOTFop1
	c4xB2/PCu3DcwW6OWK061Z5E2X1/09c8xcjQ+LA9v4adj5NkqmnZiuTHDLBK6WCtjCET42Rxwpd
	s0hMRsgRNIjewquvMqwNg1adLpFyQvFgYTKIUv1TZTZFJx7aR6Rkm74rSKRzG1atcopFlZs5vyR
	D6/5GUTuv/GlS6+NjU2tLg5skMina0OF2UOkiwajlqLjvxJqUYRMTRpBa5CNW0YTIFGn0crGaE3
	c4N17Ja+i7slurqH3+SrBEmRB1x9HkTwhJiHBqk5TDzwF3pC2RHZO/TnWevIlOpdkL8kgjKn/7i
	sm/Rh6PnZIKlgOXpBkJjVHCGhqPTqdLLMw+p4VlpKevXpXg==
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46132155ad.29.1778686075594;
        Wed, 13 May 2026 08:27:55 -0700 (PDT)
X-Received: by 2002:a17:902:e545:b0:2bc:7c62:187 with SMTP id d9443c01a7336-2bd276e6e53mr46131805ad.29.1778686074996;
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:27:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:36 +0530
Subject: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04987c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=YkJq1ijSw-fIvXJVljYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX/bMrG/2orL+g
 v6oZRHVc7NmKGfOV0LopfSmtR3neOJjhp2ozQzw8MjksDmc0CSG0Ypd0BAAnEsZEpMzW7COQhjS
 dMFaSrpV3vf7PiFimtfzDtBpPwxfSTyIQy7r5X5q53AwxppYVMlM+XFwJgicCxNCxEbKpZzqTpg
 W/qVV9YOcLBsXvut9yn6YCGbdooZIBTVDREOsmwBzUqxBr/iyk6vm7dWISsXhB4TZ85ySumHi2k
 eNew8oKwNtIkdk9CDmMtdQ64+tw9fEPzQAAStZ0e1Mt6RxEdmVbELpOspPBU/Xav/RODQ4rnEPc
 c71/51NXwwxuwQH5P1LREccgV6n+FuKonPCNTohF3kszjjRpSXtv5kj7G1//kqgh0klykuDBnrN
 zM2dW6iqBkBLiL9Ejm0Bafjj/isPsFDsjppk9r/0fX+9yJjLXvVmecE32bIDGnvyaVMTllHD5ug
 Y3KRRrXRzzJPqslEBpA==
X-Proofpoint-ORIG-GUID: C-EMcQNMYttZBO2LcNMmVP3MFXkVooIu
X-Proofpoint-GUID: C-EMcQNMYttZBO2LcNMmVP3MFXkVooIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-Rspamd-Queue-Id: 6507A536180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107376-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..6e3e4424af78a93f6366378a66f2944a3bfdccee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
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


