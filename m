Return-Path: <linux-arm-msm+bounces-117573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzZYGnggTmrmDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:03:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F84A724003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:03:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T58TokjS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ddiFzPUG;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117573-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117573-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 514AC3026718
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1AA39936D;
	Wed,  8 Jul 2026 10:02:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CE38BF6C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504976; cv=none; b=ppzBAvMv0n1dBi9+BmgK0mKT/Wckotrg2FNsAU3g4Qh9XzHonHBuOgiclJ6+c9v7kbrocsu+JlKmWPB74h5bvlouf8marUBNeRWRV04u81J8FsQ+iP3aeKEJqyPg4k9lmx4ly0b5bUDcDl21JODMFJiK+ZrQA64Z2zIvBNVGSaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504976; c=relaxed/simple;
	bh=kecrf/J4Qo5II/j0+5WWc0znhT2v/XE87nyzX+oOmSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYpIENEVXzzAm+j/qBi4JtBxukqECbPw5skua76740LjphQgJrmSlfLpTHUZqHV3bFLrCgqSOQfWFa9EnqSLFGStmBt9WxdsWStkZT3s78hRo/4Ox32sMXyi+Jh3QlqyOTpERJSMIV3CLn0yk7oZdO22AUE5epfB3V6EcWAHnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T58TokjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddiFzPUG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889ShP2197572
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=; b=T58TokjS4CPTx64U
	tft2MFCT7+6AVSA5jb/dW2S9FLI+Ihp3CTfbqsIXKZqZeWhZJS2V6roYJWezyTLO
	eXM8VZiQnQe7ReKbs5BQ/yWxnx2tYc3dNJ1/pb3HUxoXh89pzvCpdi66Gk3gvs1B
	Gz2OFGFKFh8KeRLw86nETHSt2bzdDZPsab9dL8egVi84Sr5PCAhf5rA51vpS89tT
	16q8Y4IkWxsRMk2xfklUUCcBGI96Gr1y773Sg9ucmxZ3lhahAgMsmYh1vn8yyLA4
	GvbWqg2Jxyw06W5mKt23aYY9ECICavBLBiQwSwhIPkROSAXQhiWa+KXK3Qr3QZ5Y
	FyvyEg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6aa1j9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:02:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so759083a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504971; x=1784109771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=;
        b=ddiFzPUGl+NBiPakeZF5qm22wvzlvwNj2WsuaxHfZoJ9MSiXzi+x276Dd8fAuDiKwW
         zlZATTIFKGOA0iJHw2FghTwJhUTITmdrv4xVuo6iq10P30dBYXce2HwXgcpZA9Zd+0OI
         LRBzfjCmIfZ8AJQxTdAi9jEEjQO4O5WXgzjPZbdjK93aDMusabnQ0iEtxAnKxrgoAx7O
         A69wifuW3VtFAjq+r8iCgpe+R6qeK3XimAHi48+MxXJjnkbKvcPLr9OaNdw0H9QfglzZ
         jLaku+fIsI9KohFRTpbCreMCrMRbwcfthDcNgQTXMWV9ONfxS11QPUmrxmuWudnBj5Ks
         e8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504971; x=1784109771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCJ+1fcFocpGj+MQzElP67EnytE57g5BlCXYCBgbSqs=;
        b=VYGOfkOwKfKpJjQI9T7JqmjwLouxhUlXAyovDAADJlmReozCZl0YAxV1im3eQA3f7G
         MwzOM+a/djYpWdN30aQPFfZOrKEgOv9QoIxCedLSNu0+FAiyJ90DVhaT/jEdkxFI1UiL
         TrKUH2+rtJBj7y5ijbI/LyNVRKmn9eWMSdpjO5Yvb0CWMXQ0i+87y8TYuMoIIG0zSan6
         b7sel5TGTMduK2IcPO6tJX/Pwer0nfcIM8oZGYimfTjgQbIA7jTePbvWl/v+VuDFpuHo
         7NaW/DaiiiLHZTNBqtyzdkUGQEq+vJHIxuJFvy/BBQrUTwvYmh3+wxycbHsCSl3o91dv
         Gwow==
X-Gm-Message-State: AOJu0YxOkTTanZA99hmx2EIdPL0+mFUaCmq0oimgjjQPax0dJaDVdqPn
	SSE/dH/IfYY6dn2Q0zDWtU0NhzSJ1k6b8CgiJjg6DqXQHNrOVGvM/PQSr5MLPvwfh2tg8x2UPyu
	flYFYx4KCGOOduNpP0gCmDX1rpF7rIdYQVJ/N6B97uQRBnVcFPUUX5Hgfp8nftHCSiyIeM/CVoD
	XY3k0=
X-Gm-Gg: AfdE7clzihg9TkvaaPOvs5RlPKvSyzwpyv6J6crPYf+uW1qqo/JglePjHX3q88y/e0u
	dox2yJIA8ZW+/5jTr5D/U10tmG3AlRhvCwSUHhP0g/z8kS2bE0fS9zzcURUrJX9bUssnXi1RbLU
	qONhBswzwRCyCzPOwKzeqjD/w5NcT1GAZ7uOJEmlYcu/65BzFn5Axyv1cYFVH9MPGSacc63o3Ws
	7BwvrEmeSbk+Rk/4PCp3laMZ48CFZ1wGUbW+AjdYh631ym9r/+MsFKOUIWBNY5V1BHyDvVkfbob
	oIFZt7+z3q74uQnoRIj0ezMfZNUm9o7IPfZ0HA94z6xQvDbnQT9WYF4epJ0JWFAwAU7cW64MJig
	Wdxvcw1BrM6moIHloK291tfKv7mTiS4b2xsbxrPKk/vov2viI2Ypc5sqUAA==
X-Received: by 2002:a17:90b:560b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38940058217mr1801792a91.6.1783504970717;
        Wed, 08 Jul 2026 03:02:50 -0700 (PDT)
X-Received: by 2002:a17:90b:560b:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-38940058217mr1801733a91.6.1783504970010;
        Wed, 08 Jul 2026 03:02:50 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-389098609c9sm875741a91.13.2026.07.08.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:02:49 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 03:02:42 -0700
Subject: [PATCH v8 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-tcsr_qref_0708-v8-5-62c42b5fa269@oss.qualcomm.com>
References: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
In-Reply-To: <20260708-tcsr_qref_0708-v8-0-62c42b5fa269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783504962; l=6423;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=kecrf/J4Qo5II/j0+5WWc0znhT2v/XE87nyzX+oOmSY=;
 b=Gb+gGH0/J8OtPDPT/+WeZmXDkotwJ45sogA3rETyLFBxZpOLn8QhF19Q8WEpkLwvwalC9Bn/f
 XP1339loLBgDKlpls99GDLIGOEfNE0gxSvQvTJSoaQjkJhZtuklp60/
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX/o1Hyw9x3ZXT
 8V/vfLsiqUh5xkbAh95R74PnR584nr8WBmGabgp3oK/hit+3WHoFHjl+lHXy56q3eMwaIWYK6OX
 U7qftjYvd+CJ+qrThnbMSR7yC3CkuCbRrmjQo71H2tDjOooAh9DPTki5q53xMoAbwTZppNY9UfT
 H85xMcIkzIaqpDBzMkvvOx+Mct4vVW1TTOGL/8l3heECXgr51VUDOU5ynS51yQYBEptSOq+95kF
 pnXSLexueTDC6IedgAPknpSX0aCm1W0DoweERoC+aXXC8w8d6qKd7EQ0/UC3E/FSrZCypwpGhz2
 ndDjt68Zdz8brtynESPJl23lZ9Jzf2VgKcbwXo72FHYej2ffJK8TuaABX2/3hm8JEWAA1p3ASNf
 Pr8TdNv0P+aUSK/7Y4aOxGonldPqjiXY1ePVoxMK9ffRoOHidDUqw9dsQ6Zeb1h7JR270lk0bA9
 Jo2IULc2HyFBPMd/t2Q==
X-Proofpoint-ORIG-GUID: v1hI2ZMj8stUDNTlp-58RmkN8KtH70Uw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX700Cumwg83LH
 +usBz2sbKihkWzx7Mn0EfSja2OXqEvWFaWyi/55xlgGXxiHc+fSgQb9fArAa6XLjLZhCkkbv7hz
 9/foOmTl9vsP/PWgPlfCqx9GP5RgcBY=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e204b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: v1hI2ZMj8stUDNTlp-58RmkN8KtH70Uw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F84A724003

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 136 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 133 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e0b545258ba4..1791e23739ed 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -12,6 +12,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc * const *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -56,6 +61,43 @@ static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
 	"vdda-qrefrx4-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt345_rx3_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrpt5-0p9",
+	"vdda-qrefrx3-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -145,17 +187,105 @@ static const struct qcom_clk_ref_desc * const tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
+	if (!data)
+		return -ENODEV;
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1


