Return-Path: <linux-arm-msm+bounces-113615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sFE6C8qDMmpC1QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:23:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2DB69906B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:23:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GBqGCP3X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BH+IQvI6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E3A4C322AF43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589B339D6E7;
	Wed, 17 Jun 2026 11:08:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFA391E57
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694494; cv=none; b=ODy6Yf8suOyk4+Fk6QKi9nBk3CXriXvEe3Z5w5DjtpTX7jkexkAPqM8qfBg9O8fqffOfqyytdFhzpxXHOM4MO9FqoA0RH2R58FqgfWNxAKYf8hWgbSey1kiDFtcngA+eFH03J+FQ2XNxVxyuvdo/V5Av2AH5+Iu2M9+l33UtOL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694494; c=relaxed/simple;
	bh=ABvMKBubmq7+vT2mslDLycyynxFAYMClsx2j2iUyLrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXFjj12wTNLlHfiD3Qafz1O/Ibr7CJwM7KwmUxi0WQ3+c+UpGc02dsxhud2hCY2GcKqNbvdZ6a6Sm9bHTzgnfzw3Gqvym5finmGESPVUQlRklMkPioUMAnQ0AgPuj0Wss/64IEbpbBELDjhf/04uLZz0H8/qVb2db1z7RJGBF5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBqGCP3X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BH+IQvI6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Uhww1654706
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=; b=GBqGCP3X8m2rL99C
	ydcvh/iFR205lX0SQ9F7ezEWcLVpFQ2jorIlmEBdt1rmLiqnJkLXZIEibwbGk89F
	zM40vF2S9TC1QLLRwEU4JNowhtClQuQSh9bXcEUt3zTesW+ai40dAVdVwZ5kRDmE
	DYQufX1O4IrR5uTLvb44SPeEsiL0uTPFszoaJHs9w3wG/WRqfP6lw0E8aoZ2n734
	yPnOq5++ca6Pp8JSwEFhQ2SdH0miVbt+B1FDMePJsQaLQhn84MTWHorEwmTgY5Ix
	GAV5+PPswdqG0h9XtQ4to2YACq39w8ac9MgEzPXXewJ3/PJwhKUm+InSJX/FdxK+
	2zjxQA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2r94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:08:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84534f17866so15272b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694492; x=1782299292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=;
        b=BH+IQvI6ninZJmTP4eBeXan+t5C3FctwiCuw7lgwV31LQo/mARZcNkJcHa8cjn0iVo
         fqU4YJu1sDCV/zGzjvRpbHv+8XdNIBjp7vyJSQW8xG1mv8U+/Eg+zYIxO/CFEcXFvESr
         6TsZYKNKVKrf7txtYqsvqEDNcu5pEVysv0Pyypl4ji7ATjvSq+OqwbqfbHM7+pWI7cFb
         NiudQp1zlgoBzjRYkqKyhP/91Z1IkVt5kr+5Cg1Xr+N4kZ57HuD23UYXLCxOKZwl1pLl
         z9lRRiaxWVGIMuc6Nq5KPhSlcJIGYbM/TIvMqtRGyquJ1S+r24IT3az3cSpovAaI9PXw
         5lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694492; x=1782299292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZihRVb+s6uPehQzrp2IIPsHydM/cBCcZgzv0SNsTUpM=;
        b=eL9xACsXlTRK8TAkzRgMvvYwISij/rRH/7Bh/6frwVzo1lRuVIlXfmeAyjfEtvGUB5
         Rj/tKN7t/10xBWh6K0cq7DMdf9qSApJStMf5dHu82v2tAZBxIhihT/9g7ANfZs/s8jss
         Qjg6vjoeavGj5Wk9HetEsRqlj6fz411Zt9LWITggew60VqLzeQs0pbccuHKsbwgWMyjE
         Lf0EXP+/yLzXxY5FoTnkyIHuegv/DfTNCwMAeGoJuddN2nMJeVaTbwpMZoptp1grV8Hf
         zvx1KgLO3mcf08kFkUGV0eDyOcEI+aNsxy/OxKqyBAsdCeZzZS+DDVUsYed0wu0uckim
         dOhA==
X-Forwarded-Encrypted: i=1; AFNElJ9cqTG4IRhA+eQy5WMPWtgDfyH30o2tKd1b5rcbkAX4XU7pZ7a7fLsfdYS038GblYj/9uEa6Obxdd8JJi50@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzsq4gN96E9HG3ETc6K5UGw8fcLSfIXK/2yaCowqNHMbuGil7S
	Me9XjrBllXfwYqoz5jIBn3Pu7flFXI9izNSu7KosrjAbuUJlCE/Y8p7NPR4DPJijl8GpYKJYU4p
	JJheCAWw5htuhqEVFzSKKqW+COiXZpwFZVnH5uScHRVMqnv0x7trTvaeoJHgG6yq4ziUa
X-Gm-Gg: AfdE7cmYCcQmFO+5RFpwDxwtbYZh8N5UW2pobpS/zY09vqJWm05H/UyYS/5/asG03x5
	1wnQmh7Y4tPvL/zEKzzLcvf90WA5jJdoMJt6BghnTmpuJSGU5Wve5DLczvo3Nzum32gSXY6mJzm
	xeDxPb71rD2cyNa6Cqe2H0rvelpyFpLaDSH6j3L1hDnvLJLPcs0pgbQr4yuOiv2iL7hwXCBYpwk
	Sh3CairCCfpr9ec5gUAdo/hhfnSeZE0o89OEsFLKR8XNRQFqav28Xm8RZ/kUWiH7rI9bBI5Wdhl
	FVDzQBqdQfrJTo573NNS3h1Q5tgYSF9cpNhuiNpYbD9EQNqO/kIaovwmN7btmCA1Dle3erdmrxH
	dPSEuwGvPwH99INo60MwdprXi5da/O5Wp9LY=
X-Received: by 2002:a05:6a00:14cc:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8452456addbmr3391007b3a.31.1781694491728;
        Wed, 17 Jun 2026 04:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:14cc:b0:83f:2568:d466 with SMTP id d2e1a72fcca58-8452456addbmr3390963b3a.31.1781694491269;
        Wed, 17 Jun 2026 04:08:11 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9cf01sm15873609b3a.11.2026.06.17.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:08:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:37:53 +0530
Subject: [PATCH v2 2/4] dt-bindings: clock: qcom: Add EVA clock and reset
 controller for Glymur SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-evacc_glymur-v2-2-905108dacaaa@oss.qualcomm.com>
References: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
In-Reply-To: <20260617-evacc_glymur-v2-0-905108dacaaa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: co3NfPsEGvfbRvB4MmF4HXhuTSFZN6nq
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a32801c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QUVFY6MdtzYYwQCb-hMA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: co3NfPsEGvfbRvB4MmF4HXhuTSFZN6nq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX/Bq6vciav5JI
 Q2I8o2FV7sHB5wTXiSmEOgh8RaFyQBP1bB0V5CcLCc+p6ooGe74IAZong4Il8IHOLZspm37GZDF
 5rIWWSsbLf9HaGWqnEFeC0575Aa1lFE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNSBTYWx0ZWRfX+2X8qIH8Q/qn
 ZJxTAc3+EaSYKh2tJuKyDbbWP1UPaQcpbVTFJ0HXUb9no0dm9vZ2Gw9/rfSBPis+PXfc7dmJkq+
 EoLq3uQByo4zW6hBZzYemJJIHq/F7CvogsyvsLx5dULwuW6OB3YuNjwiEuHJo9quq+eZsGTsfSd
 GW21fXdDFeekhNPcj+u6YRuKoeOLyElu3euuYyL4zF/IA+vY50auvl4UMK0u19tfnEXRSRMFwoT
 DMO4Jdoq8HzwxVaAsE4yK1Uq5VXVebggpJumTyzJdt8sBysf634wH26/2pDkUk7UPvWmjBbT5FJ
 HWmZlkCAwU4JnyQwmaIA2FILNMqPsEDbr17P7b0H6+eHW2pXZjyMRnWxKDEeiBtI9aq91tfeXi2
 KoYVEYSrEc9srOPaKdH7RoNZgc6R03a7cAKIFm9J5WfJxeo/j8YkxKQpl0tqtgzH9w931DkunvE
 89RYyB1139ddKhxO0HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB2DB69906B

Add the device tree bindings for the enhanced video analytics(EVA) clock
controller which is required on Qualcomm Glymur SoC. The controller
provides clocks, resets and power domains for the EVA subsystem.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-evacc.yaml          | 72 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-evacc.h      | 38 ++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fb0bc1acc920e906033e04fe38bf500c24247e5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-evacc.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-evacc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm EVA Clock & Reset Controller on Glymur SoC
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm EVA clock control module which supports the clocks, resets and
+  power domains for the EVA instances on Glymur SoC.
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-evacc.h
+
+properties:
+  compatible:
+    const: qcom,glymur-evacc
+
+  clocks:
+    items:
+      - description: Interface clock from GCC
+      - description: Board XO source
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: MMCX power domain
+      - description: MXC power domain
+
+  required-opps:
+    description:
+      Required OPP nodes for the MMCX and MXC power domains.
+    items:
+      - description: MMCX performance point
+      - description: MXC performance point
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ab00000 {
+        compatible = "qcom,glymur-evacc";
+        reg = <0x0ab00000 0x10000>;
+        clocks = <&gcc GCC_EVA_AHB_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK>,
+                 <&sleep_clk>;
+        power-domains = <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MXC>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-evacc.h b/include/dt-bindings/clock/qcom,glymur-evacc.h
new file mode 100644
index 0000000000000000000000000000000000000000..35a7b4550351661bdb1f7bdfbeec625fafdfcef7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-evacc.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H
+
+/* EVA_CC clocks */
+#define EVA_CC_AHB_CLK					0
+#define EVA_CC_AHB_CLK_SRC				1
+#define EVA_CC_MVS0_CLK					2
+#define EVA_CC_MVS0_CLK_SRC				3
+#define EVA_CC_MVS0_DIV_CLK_SRC				4
+#define EVA_CC_MVS0_FREERUN_CLK				5
+#define EVA_CC_MVS0_SHIFT_CLK				6
+#define EVA_CC_MVS0C_CLK				7
+#define EVA_CC_MVS0C_DIV2_DIV_CLK_SRC			8
+#define EVA_CC_MVS0C_FREERUN_CLK			9
+#define EVA_CC_MVS0C_SHIFT_CLK				10
+#define EVA_CC_PLL0					11
+#define EVA_CC_SLEEP_CLK				12
+#define EVA_CC_SLEEP_CLK_SRC				13
+#define EVA_CC_XO_CLK					14
+#define EVA_CC_XO_CLK_SRC				15
+
+/* EVA_CC power domains */
+#define EVA_CC_MVS0_GDSC				0
+#define EVA_CC_MVS0C_GDSC				1
+
+/* EVA_CC resets */
+#define EVA_CC_INTERFACE_BCR				0
+#define EVA_CC_MVS0_BCR					1
+#define EVA_CC_MVS0C_CLK_ARES				2
+#define EVA_CC_MVS0C_BCR				3
+#define EVA_CC_MVS0C_FREERUN_CLK_ARES			4
+
+#endif /* _DT_BINDINGS_CLK_QCOM_EVACC_GLYMUR_H */

-- 
2.34.1


