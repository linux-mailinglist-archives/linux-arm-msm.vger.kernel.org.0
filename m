Return-Path: <linux-arm-msm+bounces-113950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7K/gDxT0OGonkgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:36:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C11876ADC97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:36:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IaBDF+vW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QIILLJ3p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ABFE302B082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA95391E55;
	Mon, 22 Jun 2026 08:35:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEB7391501
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117343; cv=none; b=WIQ4VeUYiFTy1Kr+O4Kt/1sz+vs4dx/zOD5Xh3KYuCOancSwggCU3Vyq55jakvkO4c/OavXOv9HYz3dJRhxP9g0poQ9j7JHrAxSjnIvJS8aLeVwQg/VawfGYkoYgmNsdlX6PQB5UGAHAygrOtcLOhuzX/eS9l4wA9T3ry0w6nCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117343; c=relaxed/simple;
	bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=La++8VTrDauri+XyC0AJ6LPxPF2tI4/S5AsWpfU17h+GmLLGKKt5bqWdJ3+6zj2WFWK3T3yN+5mxgdlnYJ8Uvpa7Bmw5coAOtyJTiawNh6NAyEjvQ3M02l3qNaUCdL3RbNV+u0LGkeFUzs7JeqNozkZMPrDsMcdtrLPqIHvuRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaBDF+vW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIILLJ3p; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BIoS255301
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=; b=IaBDF+vWkRgTxJrC
	blf7P+NYzJCuuU/Ubij0ToAPpbgsFGRnZR6mFxw+INqAdfJH3pnetrmRLKwwj6lN
	k4IsULXrKw5X6O9FMi5M1SACMeCXbZ7wSbn/rlMuxzmVL+umlEcu7JWL02DlZMTd
	tgyzibr205Z5gYTvIrzUp/JsMuhdWi14cMS3OWjy8SCDZac/pJO/Q7Qp3mbhzL5U
	B+yegaL9iyg+La2NiAVOgPKaLeB3IJ7QZa47cMz+LXsMd0byqM0e5S7BAcRTbSiB
	nCmLK1exESHN384IHKx4/GFeztmqMXAWPnS4n2VV9d/GeiBZH2mwyvbiTXmej8xJ
	tb+gpw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5nrap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:35:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so3921772c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 01:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117340; x=1782722140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=QIILLJ3pqqRu+ZQ6Pyhq+pnyUwSxtwGGSlVUy220HLXBQk78/R/iqhJK5hyIrGklpn
         fFnPTY1qxcwnv+wDZCjgro4KuLitkP+E9qt4c1gxmcDsmDVO48VzadBaXKZ22h5v1Lq4
         deqHMFiIeHkyS+sg5Pq6I9t/yEMdasA+lcfxiCGHQdOk32EeuPEnsDAU6uaablOejKoQ
         hy288rQZcGQEVKl0zddVmh1bmaAvsUD48+b7FfElFITlFl0X3MEV82O+X6dSXYaol/Ze
         aTR6b3ehkMxswHbxMf+GYbTygpl5laKx1FKvaw3ZGRCOMXhxcuELsJe5WBzx9MJmuYU5
         yAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117340; x=1782722140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=U4Mw2DK869An7FAgfsig61QzRjpQUAZz2YlXQoV743ApLztIFGEe+LCWfIV/pfUDiZ
         6bZ0ewJaNiNdhp6iFBbzTl0+XsHDXjQbBSjczRDeYUhrcgCbIugJhoJIFxOag+TSkg7R
         Z7mps3h8EkLa9jNKCY5Oftlodx0+keWj7IzbBpLxcjmHhvozUl7Jvd0aJLW1D1nKSPAj
         LK0yx0dO7+5w2p02VIulEWTRbFdq5mrGv+T7YyrCqKs2fLfMt9c0de1/K6GwKA5fl03c
         4Z/gYErMYTkW+WUekW7iWiGBzqCAQiwsd1RKYdi7Mfxx17rvzbgg4ZqbVspGzsIkkR76
         vQrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ctGC7Ba4Yy3zrQf2ihYsvvtbzqtZPlhtcFUT8ghKkvz7e4HLG5zk5OZEZtkeKlKJQNUfp8urgDZeKiCLc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCalf+w1y6CkoKE2NzfbkiLBNK1fapkg2ePHa74evjKBTOUC8T
	17fLhf2p9YnS1DoxZF9OkygNxD8uELSRWwHqNUd+5tMoXIZnoVghCCD8G33oWc4wAqD8T0GroDn
	MBoXQSjmu8hMGNpxXK/7KE9dJBrU/MMaaHpJF1X+gfJJEbFz+FJvnTjg1ndnILWMN13Kh
X-Gm-Gg: AfdE7ckS5bu1x2LfAhZbsffaOChp+QUOtDgCvLi1wyBXLotuL8RwqWv9f/BwbSafEyq
	MYEDFlo88nXaV8uMVQmNyWyQvR9kHvB2AlHIlrlBtuszha7YJNk2pnH8oRcIb0ZF/K65R0aOJEi
	9l/CKs8LqOFjsDE0sZlA8UYEcbsoU5KCoO+akExPY6r0EXLBpS6wMtmQzLGn7DmLYjuMGLBt2gj
	GStryNpSH3SR8NPkYid0O+H3igGPfRcueyQIOc0Lc2VMfyd686zgZtQFGRkhb+8r0+I0q7vp2l7
	QblArOY0AG7+6JOvfuEtiSuPEbavzC56U2+4eAEh5DpHi+BkYTimUwD0XZBgUtDAzEUdvjkwPtC
	fPty/sfvjR8QyEBbPM8mWzX1lLHElCSPTC5ZpIv6Tgpm94jjQHqY2t3t+W5Yiqg==
X-Received: by 2002:a05:7022:2602:b0:138:3432:4f4 with SMTP id a92af1059eb24-139a2150677mr8324242c88.31.1782117340065;
        Mon, 22 Jun 2026 01:35:40 -0700 (PDT)
X-Received: by 2002:a05:7022:2602:b0:138:3432:4f4 with SMTP id a92af1059eb24-139a2150677mr8324223c88.31.1782117339486;
        Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b18sm6801967c88.3.2026.06.22.01.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:35:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 01:35:32 -0700
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-maili-pinctrl-v3-1-9724e1000471@oss.qualcomm.com>
References: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
In-Reply-To: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782117337; l=4956;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
 b=wzm9E66zeWJGaPQLOHOyzz5oKMI22n8eGX8L2O0Fi2TACmgm2nivOI1zdsIEjGnUKq1oKEu2+
 G2zDtSCdE9fAGk/DU5rcvdex3QmXN8hFbj2w/LcEFxISQZt5Ja6+DWg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX+mJW5LsiNdKK
 OBxi6naeyS2siDVB7A7rRdI6PPsCWXZlQtDeoqssnQDhXP+KlQHey7FJ2zYOSRT68qsNN76Lcbn
 zPHXikloBuxbWdvgQ3fVUQvTMBcmbFvvvfGMY1uipt2KC9hbWB0HM0tqXHVMgCwSZFPC2MFAPVw
 q46BaOxz/rLgsG1J8dwUMAgtkg08MQaAsW5uhS8QYw6qX66HVKUM7ltlW2U89x9dPlGhQAYo0Wg
 vER4sRjrPXOvjNaLNg3M7qqntaHxVqEoWijXnKCMoXYL3QH4bfSHZ6fgEODN3L517jHG7CEW3Um
 MGDUjwzyHwIj4wunqxO9sta82aeAy7iHEaVCBu9rXnvtYYxMBydvGm9eMdonr0ZeH3kTkm4ycJq
 +i8pCHB2EbnLUv7ZRwPuGeRn4Bu0WUUpmk7BAjAc3d6RFUeR68QNpXj6GD0pUGVrgJO8vExrEL9
 mH2KY8cmQJ+mi8XB/EQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX/jHKN+RIBncd
 9Iz7cHGWr8GArBkrYENlUenYWE4kQNneeTruICgJOY3O/BW1y9X+/X4qhfgV/F/21nRiXKtb2Pp
 USZ1HvC+B/JgpGPtPtKIwjeyEPBHZEo=
X-Proofpoint-ORIG-GUID: 9McfewHiQLmtINUngHVLtDXfuEmnEeg8
X-Proofpoint-GUID: 9McfewHiQLmtINUngHVLtDXfuEmnEeg8
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38f3dd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113950-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C11876ADC97

The Top Level Mode Multiplexer (TLMM) in the Qualcomm Maili SoC provides
GPIO and pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the TLMM block on Qualcomm's Maili
SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
new file mode 100644
index 000000000000..64fe90b2391b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,maili-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Maili TLMM block
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Maili SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,maili-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-maili-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-maili-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-maili-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c0, cci_i2c1,
+                cci_i2c2, cci_i2c3, cci_timer, coex_espmi, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot, egpio,
+                gcc_gp, gnss_adc, host2wlan_sol, host_rst, i2chub0_se0,
+                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0, i2s1,
+                ibi_i3c, ibi_i3c_qup5_se0, jitter_bist, mdp_esync0, mdp_esync1,
+                mdp_esync2, mdp_vsync, mdp_vsync_e, mdp_vsync_p, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                modem_pps_in, modem_pps_out, nav_gpio, nav_gpio0, nav_gpio3,
+                nav_rffe, pcie0_clk_req_n, pcie1_clk_req_n, pcie1_rst_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink, qspi,
+                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4_01, qup2_se4_23, qup3_se0,
+                qup3_se1, qup3_se2, qup3_se3, qup3_se4, qup3_se5, qup4_se0,
+                qup4_se1, qup4_se2, qup4_se3_01, qup4_se3_23, qup4_se3_l3,
+                qup4_se4_01, qup4_se4_23, qup4_se4_l3, qup5_se0, rng_rosc,
+                sd_write_protect, sdc2_clk, sdc2_cmd, sdc2_data, sdc2_rclk,
+                sdc4_clk, sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc,
+                tmess_rng, tsense_clm, tsense_pwm, uim0, uim1, usb0_hs, usb_phy,
+                vfr, vsense_trigger_mirnat, wcn_sw ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,maili-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.34.1


