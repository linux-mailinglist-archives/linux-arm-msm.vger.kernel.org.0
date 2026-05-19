Return-Path: <linux-arm-msm+bounces-108413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAa+OpklDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:55:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C0B57A9C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD0E1306AD24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CCB3EDAB1;
	Tue, 19 May 2026 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3GOZC6T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="blPDBNOm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF63EDAD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180445; cv=none; b=QEoDb90SyQaajeSuRdz9AbvwNUfGudofmDklFTU6izuDqHVpPVVPvAoNG2erBDtxGNJh/C03glwiYJwR8ED9IheWrCxwjEoZJpsG9gA+ZxTSXg43ueuQ6PQMTV1EYoJ2WJf2Tl00sTlvyipbzM+nRuTYvU4HSWGkNN7tsI0oQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180445; c=relaxed/simple;
	bh=FYChXh6LOMkPsRPbvBAEquFZdOdEOw6j4DsMHrafNQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itGoPolGPVBRmycDhxvLsfss8E8QmOscQi8vUesWl4MRWBeDI1otFSKIbNtWlss9Kw5hx1/A7gC+/311AgIb6E800/c+rra1ZlBnGV3P8jwLuX2Rw7hRUZ+pxIN9NfVQBrF5XbvOD+5Tx+J4HBGaRkL+p1LPXd4lUBKwgRpzVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3GOZC6T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=blPDBNOm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J89Z1U1146343
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXi/JvyH9ROZcM7qSRa6T63Uyudeqbzg5wLfF57DkTM=; b=l3GOZC6TJo+pnBhE
	iRr6OrptlrrVK1gJMgv9L4pSm40BGnpBAHT3lPRVcXkc8MROvgJ46hV40ueCCsIZ
	CmMq5bsjpFXDoJxWAddj0kft8sNQJN5KuL/jh9StbhSUdR4ecdYyx8Dw1/nbFEoV
	0YQi+EbB7jwtnIdRTqhHFSMEVb+aWJjcKdi1cjMouoKD8JlOYMs9gvIygusfbkbF
	pkuDKMa+Y4inAQFsBnGzkogg2icrz1opu+zSp8I53v+Yu0aaPZdahtdgeThDMzyf
	dk9UM3v2ykHz/9W912WZkMMYYWg1iw1AbnVOn6LDbPOjguXDQLdMQ7K+y9BOK03a
	MKAU0A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ehjgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:47:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8279604464so4986553a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180442; x=1779785242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXi/JvyH9ROZcM7qSRa6T63Uyudeqbzg5wLfF57DkTM=;
        b=blPDBNOm0HDaUl2os4qjioPQR8KLGj6/5sgN+5eoOs2CmfzVJHm93ss3zBCng+Il9a
         3sVvF0N0fJaDGoZoE744G1vQBxzsdPzs3Mjsv3ByD2i6tDJFPh4Vtv/CN1mhrXEirY+V
         UaPqSaIN4OJY0U3J6mxNb1ZrUnJ0wiljLk2NPdEpYJvJ5cBpmai7PhOpPOafPbC3tUIt
         RXT7Mpq6ULKcRio0gmo8PFq+GE13VzxF28CLMgS9GeEUdTQ83yAlvtoSXLado23/QrAM
         oq3EIDdNeHzGDA7v4xnWxv4KCh3IOpuC6ibJE1LcGV+c2TO0VKsCiR7sHgTqckDKkuRz
         GvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180442; x=1779785242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wXi/JvyH9ROZcM7qSRa6T63Uyudeqbzg5wLfF57DkTM=;
        b=qYLueKUv9mxxUaqom/VGqXRPAZZTZMIjR8dvhSijP2AEsPkfJ6yc88na0W/szfh/2k
         V+4hkNGRPpATURzoIKlrC7y28xoCznxCtVwlUmJKEA6hB9CKoNEbtdnqUmH6/KUI8v9I
         yAr2Fjiqku+jG9MyvCwAAIreoQZqGWAtGWOSLkwmQQ1P+H5m3q2IVu99Z0MsdHeuljTF
         AhdY1LiHUQ++ABR0mqoe2SeTPuYytybfdkUp4TpK6VaTHpTlCm9tLsWfKV/c88xm2G8C
         Bh5VHGXWFxddwjRskri+ZYPFhpi7lv6Z9w4ip9/3j7DhR6/l5097CKFHtIO7/G0mD1LR
         WgEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/9eUUIF51PVt8I4w6Mtr9C3MFINEczlWjzBO1F7REPHRVp2FOEDm9Ytr8rF9Nb5dyssGzmQqvvEOpYDwVh@vger.kernel.org
X-Gm-Message-State: AOJu0YywVLor72eVGCqCVOx+xynEKcsUjLJoUjEVscH9dWLHHsMTSZ//
	RyvkWF4yMY+v4fBW55XJMk7bnEHmxONST5sYpuAvZqu0Lp5/Q/SZ77+4CUwErCsR1d5/KUumH7C
	2uSFgFTMRErM4q2t4L7eDROEUbSUhXhgSXOQ9XyI9kPfOtAR6Z+yDXVdoynb5NZaTMX0S
X-Gm-Gg: Acq92OFIO2bpOw8DqtEH6DcUfeZLdSukDqkmzIXHik29aSUGB5ZZeMXX4XNN4T1+KsV
	1G1JuMqSkePwodPbCu8QOTOB2c1s16g8nnYouDcQEgpJiAn37ntEPP+nGtPtQYX6oM8bRuE+lOa
	GSerF0VKBLUNgXoib8evACgvQi341LltEfBac42lRigurH+0Pbn2M6NHsYsOM+MKOtlGyWtJhdD
	qGsFgI8dsknZtbnIIyG8B6wriK0vGRPabMLmpriBgxV6nXQudYQAkmjjeFCKq5KRfvaoAXOrnnN
	Am74bBFThkD0HPxyFy/od6XyWBklHBwASecU9l5LxOPIG/uXEPI99emscumhkpcGKAAqpgNU800
	tfAFJuR3kZnuvAI/r4mJk+tprZviXu7ICr/1qv6T9ub+r+iJmE6CnojrRJTK90ifPWSPAPTnltn
	gCaoWs8hAJh2CRYrMepyfx/mcFEvywEbT9mq6vB5x4w1BKW6RUYUahv7AI
X-Received: by 2002:a05:6a00:4193:b0:82c:9126:31e3 with SMTP id d2e1a72fcca58-83f33d9dc33mr19144466b3a.26.1779180442064;
        Tue, 19 May 2026 01:47:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:4193:b0:82c:9126:31e3 with SMTP id d2e1a72fcca58-83f33d9dc33mr19144431b3a.26.1779180441586;
        Tue, 19 May 2026 01:47:21 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b1f5sm17434104b3a.31.2026.05.19.01.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:47:21 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:17:05 +0530
Subject: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm IPQ9650
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-ipq9650_icc-v1-1-4d3554c94257@oss.qualcomm.com>
References: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
In-Reply-To: <20260519-ipq9650_icc-v1-0-4d3554c94257@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779180431; l=1517;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=FYChXh6LOMkPsRPbvBAEquFZdOdEOw6j4DsMHrafNQM=;
 b=USJ7wLerKKsxs68uilX0BYM7aEederB8lie723jStmaXiDWVS+aZuKfycd745LDd7a8ccscau
 dP0h0BTjkHzATgNHrPwlRec5fC55BPawW7FUwHpODwadw5VqNuz1NO7
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c239a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pVUAii-imZVRLcxyQZoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: uIu2Ay8FLR10F-gZEedXca2kv2ibRsOG
X-Proofpoint-GUID: uIu2Ay8FLR10F-gZEedXca2kv2ibRsOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX5SpQg/wGzqEF
 pxtENgj37kuPoMAOIQw8I4DyUL/55x+VNo8pttS+RcMHDeBaoBan8yR5nvSsm3l2Yvj/TOS+D9e
 yJIoL5Rh8dLx0oSGPtiY6Y1w7NhFR2wLdzVrn305bJmBVdHPkOhIX7g8Tqca22LISsbAhRK/9Jh
 TtDj9VEwet5hTAjw2MeUZCr84clMWzksgK7Ryr0V2mZk3qxWVyOe8PuZca5VIoIUt8N6LgL5cib
 tLuu20g+FqNIporWqdHASU9MC6M7hG0jnKBAEVWuERu1d8WlFLFsWGljrE9j5vWTYgkOJd08zIU
 RKC0SIDzs91USupkmlZKT1HXJ36TmGiLEp0RSLSffPI+2KhHA2eICpgv1AkhnpvN0O33K9u5CC8
 m4C7oM7bhGtAoylEsF0FnFjTE/1L6BHrkxBtwUCgM5UEj7MUt1EK8b+doHEkBQtowkj2iSSXi8C
 nrEDi6CoLlmXYbpVtsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108413-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65C0B57A9C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add master/slave IDs for Qualcomm IPQ9650 Network-on-Chip interfaces to
support the gcc-ipq9650 driver in providing interconnect services via
the icc-clk framework.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq9650.h | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq9650.h b/include/dt-bindings/interconnect/qcom,ipq9650.h
new file mode 100644
index 000000000000..023a3878cc08
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq9650.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ9650_H
+#define INTERCONNECT_QCOM_IPQ9650_H
+
+#define MASTER_ANOC_PCIE0		0
+#define SLAVE_ANOC_PCIE0		1
+#define MASTER_CNOC_PCIE0		2
+#define SLAVE_CNOC_PCIE0		3
+#define MASTER_ANOC_PCIE1		4
+#define SLAVE_ANOC_PCIE1		5
+#define MASTER_CNOC_PCIE1		6
+#define SLAVE_CNOC_PCIE1		7
+#define MASTER_ANOC_PCIE2		8
+#define SLAVE_ANOC_PCIE2		9
+#define MASTER_CNOC_PCIE2		10
+#define SLAVE_CNOC_PCIE2		11
+#define MASTER_ANOC_PCIE3		12
+#define SLAVE_ANOC_PCIE3		13
+#define MASTER_CNOC_PCIE3		14
+#define SLAVE_CNOC_PCIE3		15
+#define MASTER_ANOC_PCIE4		16
+#define SLAVE_ANOC_PCIE4		17
+#define MASTER_CNOC_PCIE4		18
+#define SLAVE_CNOC_PCIE4		19
+#define MASTER_SNOC_USB			20
+#define SLAVE_SNOC_USB			21
+
+#endif /* INTERCONNECT_QCOM_IPQ9650_H */

-- 
2.34.1


