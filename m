Return-Path: <linux-arm-msm+bounces-115263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R0McGDZcQ2oJXQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD56E0900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:03:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eAIDybuO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="fGbrmv/M";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115263-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115263-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE03A3006D61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7527725B0B6;
	Tue, 30 Jun 2026 06:03:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C4291C10
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782799397; cv=none; b=bYfQsPzln+zR7/zHhOuNvSiuSa9PbdTmnmp3JpjpADfACrgBYooiuPd5moN2dqiYTyAzjCzI2IoaToD0kvSWflBiIyL3e7SCa1PzwwQ9K7WXiTFoRbMtNWVkKe+iXIQ3S7AzRkt+d0yFulORrCut1CNSghBi/XCMmS2pZ7YeVxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782799397; c=relaxed/simple;
	bh=IBRzc0iiDr752RyZmlrhOmlck4XRVCM5D9K2KWosX6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPIpcl3mdk2Ni+UjzJ8JWnuXg76l4urKCtbz7yArsHE5UAw1MGj0mFm1AP7Tj4QW/NzDQRDJxFmn8MTs/J+tZ/JGiZSAmdrplk1azkNQvYehotq0ZLW17fENO08zZpnLOyqiU35bNBMc9DT8JDELyWyCB142P4IdDOXM6+dG3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eAIDybuO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGbrmv/M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U5cl3G924125
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mwhlEvrUiE8Lwaf2hml9/SLLvTSWaySYB0Hb8e3qF0A=; b=eAIDybuO0PlFE4OQ
	+bURNWG5cxgvKNIeEka15ZEQEOvOvSfqh3y+uo1Ps+saXwmCcMIb797E3ONEmX/z
	Sgvcm2UMYg7G2C2jB+nNPuogTwBzmBLk1Z7fKsMmmWKbbJEBRwZLvqM+ALSnqeXX
	6g0ejkSB3LrHT+NOW1kScBtkMydkrgGbjmoFzddH5hsTn6+ukycR3+wyob6VBuyf
	qdh4bpY+VsjwMibuEM0jXcQS0+TCFE3//j+XwfXp7G+JUh/8vocBfYVjVxnAh3W2
	GQahPOrbNZ7kGDGhTM4ydu//v55Ml848D3UkZtwLg3ULCu9SujXVcLJ9LTohpdh5
	2adiPg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j1rug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:03:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8479586724eso1042795b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782799394; x=1783404194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwhlEvrUiE8Lwaf2hml9/SLLvTSWaySYB0Hb8e3qF0A=;
        b=fGbrmv/MRQQYe/y/BoTA3kzXAyNMJ7b+Cx86lSH7psSaVrgyAa+VWWHT06G4TLTw6z
         ugAoPXSqQoPQX8xQiC2hTDgROZl0TY4mBfTXNQ2XZWZt+dTLQbagojcbvesGUXNEY7BF
         sltILnda8h9UKyOyoXRNZw4NQPGfBJfhGeorpW5kYlwlrpZBNzQtyX0075pSK2mCtxiJ
         oz2QHYuUJ9lnftjWElu3CNVnBpWWXUwq18DITvQabnQw/VfhOAzcheTt0gBLkUmqEcGd
         SSDRxQYQ/D5KhVnztA8dPSNKSFGQYkfrWZ6rmjZWSdKHO/N2sOg3+mBLF2ZaGZ9Z/93D
         9nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799394; x=1783404194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwhlEvrUiE8Lwaf2hml9/SLLvTSWaySYB0Hb8e3qF0A=;
        b=HExrj4syZXahEp5+Z9gTPJlKGVd0ubB/K69rn2+4/dNrM25j1P9/zrWD0xY7IqldKc
         Wj2/85Xjr580Z/e/pPoaatQ5NdI5xK9Nst0fD9QpNis1171ERIhtwobkO8nmrhI/XZsl
         LPx8FK8nmL2py159k85n3ej4avv33w+zOcsabNqVAgKAGlwgqf0MbXWUVwby7yumBgtn
         Wdr4gNs+6GTC/R+dVIIGjvslLD8mRzQNrFzuBda74hExMz1UpPACpkaLulwuBnZvOUzs
         PiEYw2LZxrsGzYDzkuCAbWU22qAN2in2Pfif9nKylAbsQxko87mKaIrNrQulxmRVpNL1
         IFIw==
X-Forwarded-Encrypted: i=1; AHgh+RqErdemEABkmaUvFYh4oGizj86mnie3r42J1mnppbJftUvGKK30liB4INnOxy2n/JNNGw7ty7jZJl+ueCfi@vger.kernel.org
X-Gm-Message-State: AOJu0YxjkZ10gR2Z2900DTCCkyjkSr5aROggqTPMZioOLQoSTEneukKz
	yty9D8T2mZ53g2BJWsqqRHHospVB3pcSY/oKi32XlH4XiLI9xp1nXUrdBM4ULCXR8CR4iK63yq7
	VQ1G6X53vgd5XPCctUlJpe8+YRaFJ7JTGTtdHfY3w8BFIhEG9JX4YcH9YbypZ8t9WJAgRaE/qWB
	3A
X-Gm-Gg: AfdE7clVXvexTvj1IpDUdkFjP4C4zOzj4hE20Qe/JG2Jn8Ed6tfXR9+aBvtr+Hp80cY
	TO7heWsaG8Hfo6a4v3o4P/WPuWmMmQ2iF0CjwL2I1fTc1/ugyOCJw/lUFmSjXIjrhB4S3u0/9io
	dmygOOMAaERUGfHkqpm7XNIMCmV08WJsgrUEhImIryrT1WwpGwnadXbiUmPcSB4oLxuwYuJKlsF
	17iJtiD/cmYeDgXOPhGYo3sFlXF3BEPmOQ6zUlfIy1DvzExTijfU3ZJ3wdTegu5/PcQdg/n5xB2
	OABRZAMWmM2zl+DkmJ0FC4U8p6FHXr6+ktjTbYXp3N1fq9dER0wzvJRnPRN1y0fD/UP/sF8FUSv
	zkeV5tcU58dsXnftUgzHrGmBA6y1z2rhtwSCbmx+wJmWq
X-Received: by 2002:a05:6a00:23c2:b0:847:7128:ecf1 with SMTP id d2e1a72fcca58-8479f2714cdmr1949404b3a.42.1782799393720;
        Mon, 29 Jun 2026 23:03:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c2:b0:847:7128:ecf1 with SMTP id d2e1a72fcca58-8479f2714cdmr1949364b3a.42.1782799393145;
        Mon, 29 Jun 2026 23:03:13 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a00029d3sm1112600b3a.20.2026.06.29.23.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:03:12 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 11:32:46 +0530
Subject: [PATCH 2/2] i2c: qcom-geni: Add trace events for Qualcomm GENI I2C
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-2-474cd6cdbe27@oss.qualcomm.com>
References: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
In-Reply-To: <20260630-add-tracepoints-for-qcom-geni-i2c-v1-0-474cd6cdbe27@oss.qualcomm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782799380; l=2683;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=IBRzc0iiDr752RyZmlrhOmlck4XRVCM5D9K2KWosX6k=;
 b=GRguIRps1Bi3/M9o4D0IBX2JCV68BDEGYAw2wtgV0LraRIlf9wFlQpXsBIPhHDiRfhFk9qBdE
 KSTkwrXjSn6BmKlkDtE9UeZzmRb7e5wTKZ/O7Gb1BrdbzXqWbcmg4d7
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: 7wQAY4TCLe20tMoF5svuI1e8gaA3wRCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfX8qb7ODem6rTq
 rA0MXhZ/3OennudnoSNa7Pm7fNY8fy7Mgys1bfX3fCbNWdvfqoorBa+tfr6KvsaT72dnJomnkGF
 1+9hnKANFwv24ZHmqSYq2OBJO5MMuYwde7EYbusvPbywhbXn0mYYcrGJqgKobX9bj2LYpG8nYt3
 +okXbYQs5V0arTKviGS24eWMRS/kEWDqI+ukaW/CW/1HOMIMCXtddfR1k2Vt6msJ6EjnOcTgvpM
 BEWyo89BEQ4HW2jOWVubH539dkAww3grRpvkahlfoNDZH73A5oksZeUsgwPZKB+QDzue/vHyw2b
 R4Jc1r22sLhW8lQIbr9Ej/EeHu7wF2+yfGkNM//5zPnmORwW8d4ZzwdvcEfaUhNXO1/XP5bWuk2
 VW8PIx89VSlPnhwzI4NaNOq9mQ5XOpYlV5S1kk3UNLPlWGTZwe+6fOQuw1AKxDf+7R+JCGLSylc
 kDQ9FzLg0H/U439r7QQ==
X-Proofpoint-GUID: 7wQAY4TCLe20tMoF5svuI1e8gaA3wRCi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA0OSBTYWx0ZWRfXw5OP1nn0zzht
 jix1xo4ODT8mmclVS0i7ZX2a+qZBRBtNb5ZuBQoCd5ztq1GC1dqJ6V5/jv3seJf6k6H9jd+A9gy
 NAwnkTSpyMnCFYNBfy1+hJwHNedta+Y=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a435c22 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0MkepCNd34v6RWspawgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300049
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115263-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:mukesh.savaliya@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DFD56E0900

Add trace event definitions for the Qualcomm GENI (Generic Interface)
I2C driver. These trace events enable runtime debugging and performance
analysis of I2C operations.

The trace events capture I2C clock configuration, interrupt status and
error code and message.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 96dbf04138be..3227fab6d76e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/qcom_geni_i2c.h>
+
 #include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
@@ -219,6 +222,9 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
 	val |= itr->t_cycle_cnt;
 	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
+	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
+				 itr->clk_div, itr->t_high_cnt,
+				 itr->t_low_cnt, itr->t_cycle_cnt);
 	return 0;
 }
 
@@ -252,6 +258,8 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
 		dev_dbg(gi2c->se.dev, "len:%d, slv-addr:0x%x, RD/WR:%d\n",
 			gi2c->cur->len, gi2c->cur->addr, gi2c->cur->flags);
 
+	trace_geni_i2c_err(gi2c->se.dev, gi2c_log[err].err, gi2c_log[err].msg);
+
 	switch (err) {
 	case GENI_ABORT_DONE:
 		gi2c->abort_done = true;
@@ -288,6 +296,8 @@ static irqreturn_t geni_i2c_irq(int irq, void *dev)
 	dma = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
 	cur = gi2c->cur;
 
+	trace_geni_i2c_irq(gi2c->se.dev, m_stat, rx_st, dm_tx_st, dm_rx_st);
+
 	if (!cur ||
 	    m_stat & (M_CMD_FAILURE_EN | M_CMD_ABORT_EN) ||
 	    dm_rx_st & (DM_I2C_CB_ERR)) {
@@ -788,6 +798,10 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 	peripheral.set_config = 1;
 	peripheral.multi_msg = false;
 
+	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
+				 itr->clk_div, itr->t_high_cnt,
+				 itr->t_low_cnt, itr->t_cycle_cnt);
+
 	gi2c->num_msgs = num;
 	gi2c->is_tx_multi_desc_xfer = false;
 
@@ -895,6 +909,7 @@ static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
 		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
 
 		gi2c->cur = &msgs[i];
+
 		if (msgs[i].flags & I2C_M_RD)
 			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
 		else

-- 
2.34.1


