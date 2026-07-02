Return-Path: <linux-arm-msm+bounces-116101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ge76BR2xRmrtbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:42:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1546FC39F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:42:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IUJ32g4s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L3iaOSyM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E915831AA848
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1866F368293;
	Thu,  2 Jul 2026 18:33:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE09342CB2
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017217; cv=none; b=D9VLgsOWT/PpKYxu2rEOu/6NHGt9oS1VnySQCA0Wh9P+faE2rrAeUaIO4E34ZQKJ9D1upkXdrGJoBy6xH6zY0G2vH2relmzUHkztM1ph2XN4hPxjuTtx8K0/6zyK/q2qj1gyfLDieqOpTJnHevrIMxVFSkmZSqescJlRSZ4z2Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017217; c=relaxed/simple;
	bh=f04v58ZZNTOahJAo8xzjMKBEVvR48rP96vy1EEi2h68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iueoW5HfbkrTO2cGWyhdwcP/H14n+YHSPRc1cu4wVSxGPxACV7Hk0ThAl6elXq15HgrByg8ek7gC2mS9/c2h3Qw606VmJ2F2QFC2ylv7GsK4zW5BmPt+JvKyDbmn0YbRHXKRet0tol96DerIBvGSmsAhP0qe1Xg+M+vXHcUiLe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUJ32g4s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3iaOSyM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3HO4645266
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=; b=IUJ32g4sTx2gTEXl
	2jI4xEpO5wUxhu0K+lkDC7Fm+ZtAczYIbv6++SSbu5+9Q7gClHn1czqo/5wSkJtc
	bes8tVYeKgSd1s5UL8KB182bCoAH3MPegs6fAQyiRryQxbfUbHwH+Hxy5tElqd1d
	xf6wmHvZXGbBlgu+F/IvrBDzkBJertsZP99koJ9FcGAOOosvQcBrFTTKpNHKS4A7
	shAUiL4N2onuHD5zkNcSb/pvSeomn5wlkUVDkRyfiV89sLcZlNDJB+T3AUdcTVm0
	jDyitpf4jNvdgrdDZNDTkMVEz4WiMlytE6JUJkN7zn+eKkN8fQC0cjTRxKW1QS8V
	ZWhd8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb3dr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c825562f8bso31707815ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017214; x=1783622014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=;
        b=L3iaOSyMRm3pYazRDxbDZqhO0Qb5u40+gr0gt1xrGKUIIINK3k9sPSU9Fq6AEfIi+R
         iKKWEB/kwCYGALuO8HG7ewS1LfncaE/5wB7C6ErxVQVE77fZy6ljxK+j1oavRu0gjnYn
         FVSKqe2t2+ZOnJr/d3k0REdaOy6zOBFaquwz8fLDMv25WVnOokx/KrdGQoXAH1UO816J
         hzjpZXdcLt6Ps+TYJ7J2praKqUUc4esJ9dV3QLmy3uJ7krr9NZ5Cqc90MymHPLyB3JYl
         O0edRfxGL23VpUVjSzytBxKcARbcZsts4/OLwM1Tkbk5aOqbcIKirbmOCw+orJdMbCLG
         d64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017214; x=1783622014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c7G8WuOpWOXdO6mPUOkBtKO0klhvM2s+Q8xGsy890q4=;
        b=hVzejohCdb4AwxrFBd18++d8qu5p2XmEuncV4ovRAqU2QreRB5aBz96ivYP4g0xHmq
         s8f3GEQupolyu0qmwhNQof8fnx0dSB8T7BFjUO0FOTiuoZg1yNs0oQTz8vWiaEs4tDMk
         2T69KhKgJTVUi6Vpkwy9XUnmL83BxDxDknIjeMZKbI3wjqAMSMaL5qXlzn7ON+noet4R
         220GxaQYh+/FJw2NmaecxBGDTNbRl4zU1nzkvSG+b4fL5IR7+YTvmo6n+tvgInekkm+N
         OJYsepS+e9cKJP1XWkHaDK4+xTt3zah4fk/ScIZ1V2Zu9eL8arMcTxJLj0wF73LUps7O
         pBSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Fl6D2kS78d2/ogYrdMl5KEkwByKdZFBPDnnqh3oZFWGVF7p810m+QTanIm1pTndukiZ2GrUX1hW88+wNP@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5H52nW9nM7mkg7yQr+AodxxYkzani5pOcqvIJ0EfjXWQvO/X
	ZokIpK32SQWBAffekkr7HF+ozpNPc3oVS6jNm+7avPFKSn+CvMCA3BBIrRxQ1scbn09VoTwZH/x
	4J883TjY2d/EullJENQh+XvGFfvpYpTrERc9hFETHyTdm552kU67ELjFlPnRYuwSXy1Qq
X-Gm-Gg: AfdE7ckwtpZ9QzsyM7oRdBQ65HVMg3/l2sJdH0KLfZIGZGbdSwX7oBSPRM1zvTVKDEr
	oiaeCmIZCzhmV4aqoOCUSYjCacntPDnHR0kMEWa88tqokb4o2fT2223p+hEG4j5FPxbuoqvRXCz
	RtCj8uSYvPpcEIXHepR6HbIhE3CIX7numRGk/IfBPXzDqButgUyhKNd6EIPld1/abj3JZ2wSWz3
	h1e/UQIWsrN5H/P+n1EYRLB1eKEdBWH9eOJ4ZIBKwYuQ5xXswywmjXHVtYwAkl/n6uSzRHzuLTJ
	u48h0sAB76z7qKV2f/CiRNPiINrGF7iosRVxlasluCFo0JdaUMBNmyheiHZ5+qh9xyqon3B+4Fg
	PsNBbXByUilpNfEOnvc3NUrd6bsQ+lNwkIyBfcSQLSg==
X-Received: by 2002:a05:6a20:914b:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3bfed18b282mr8517605637.17.1783017213620;
        Thu, 02 Jul 2026 11:33:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:914b:b0:3bf:e291:496c with SMTP id adf61e73a8af0-3bfed18b282mr8517556637.17.1783017213063;
        Thu, 02 Jul 2026 11:33:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:29 +0530
Subject: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: UKvUTV8GFBBu3W7zta8pHpxswRTVBptZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX+4oQC0Rj6BPK
 G0l1OfbAVElWh+T4CiWpS0bEn5ASD7Obq2OR+3sbPr0hHxrcBfSiLjpJsS9YN1T/1QYLsshj4Bk
 M29Ck58Z/WiPF1X3Z9jl5uh0jCBdZLg=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a46aefe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX/8qFZv/C2lDP
 oL0mJ5GXDvD6w8G6r9oSb/AQJG3dbTa9vVxXEo8ntsNxRPUefmTEFdtBT8YVwfEh6LPPr9HVM9x
 0kNW/Sc66AYhXgJhZDFejIX8JKmuZq6gmryoDsud8ogaDY9EfTLo5zx2NpzGsFNd4h9oVy/ZU4c
 5iObgflkrzYIsgazzPg4nfCjUbzgxIUO3TySNcvZGFpAfApJsqYdp8m/f/KzrMITg1gh7cC6LV8
 3gLm17fafzhrywu1a8kU74ypDuVoZcKroqNrXmJXVnxe+jtQMprA3XGumG/PikxoUyFZPzz7Bx6
 eDTVIQltnniTnPKPYyLggDqTgvqfwiTPJCq3cp4Qa7oxWEl5RzutUvoeq81UFh6mzushXSHyfd2
 Sm9vt4zp5dxX4U07y/ydqRjZXmIU5cPr3VUeTq9Gu8zeuvWgkAULU3Hbf0qshw+5fvvyFiAF+Bd
 Q/iAIUNT8gfCoGLzDrw==
X-Proofpoint-ORIG-GUID: UKvUTV8GFBBu3W7zta8pHpxswRTVBptZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116101-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E1546FC39F

Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While updating the parent data,
fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
frequency tables, but should be corrected to match the hardware clock plan.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 50a0705128a37073a077b560d0c9e57544d54348..6f8c21f05ba4536d45c2a609d152f871cb875bbb 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -23,6 +23,18 @@
 #include "gdsc.h"
 #include "reset.h"
 
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GPLL0,
+	DT_GPLL0_OUT_DIV,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_SLEEP_CLK,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -57,7 +69,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.index = DT_BI_TCXO,
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -71,8 +83,8 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -80,7 +92,7 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -89,20 +101,20 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo_ao" },
-	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .index = DT_BI_TCXO_AO },
+	{ .index = DT_GPLL0_OUT_DIV },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
-	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_GPLL0_OUT_DIV, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .index = DT_GPLL0_OUT_DIV },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -111,8 +123,8 @@ static const struct parent_map disp_cc_parent_map_4[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -120,7 +132,7 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "sleep_clk" },
+	{ .index = DT_SLEEP_CLK },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {

-- 
2.34.1


