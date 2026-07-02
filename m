Return-Path: <linux-arm-msm+bounces-115855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Np67CnoZRmr8JwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:55:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CF86F4789
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bBqa049A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=f01748Bx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115855-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115855-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3E36318ED45
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551B83A2E08;
	Thu,  2 Jul 2026 07:36:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992739E6E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:36:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977785; cv=none; b=DINno7N47YS+H+B/XJp8zKWwT+d2NHmYHcok5lHGS37cF3tAesy9EM2iPQWSv7dhFcyiNUkZQPxH/nDVm+7ZS7Baq0CPtAx9QKDp1aSDXoeqWBDlz9lbXCyzossFpFGvniu8ZfTmLiCE+mFblItnbUExzF/gDaoJkhcIkBpWTlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977785; c=relaxed/simple;
	bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ogE8dMeTIgo59LMOwhfmO7q3TL+HoddW/JzQP0rKnJGeIUO7dTeeHBudW1RGqI43E6U7szik9qlGcr4t5Vh/fKL2CjYO8MNsYKtqDx7nuIZa0kYyAXxdHB2dy01ZV92j0KArQW3O+3xLJowTLfEOl72+KS8IFVE19V5mD6sTUe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBqa049A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f01748Bx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KHeZ3067566
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=; b=bBqa049AL/UkZImF
	pGNSd1LOB81ExtbaAIgr8rsFgR3b/uZ3JOeicrZ8TwQ5ioIRuSWASPHP61PyOM8b
	skc84qJ0WCFyzGjUliaUeYyPtr/SzxNvUqHDxM1IzcKpVzKiJbdIZT71CnL+JaJu
	robYRVXnWl3Nojl26Px7ZaQGhLkGqdT2wBZXZWsrxEChuRB73+O+z7PSKbv00Zxz
	teuZJBHa38Rcie3Vlo3ui3VeaFqM9Rq/WkWh/viepONMqUlmH1tuI4t0lJzhPMDt
	rUVE8FgveW8AnzpvHgRh/d+FU+Ws9qqGE0bV8DnIXs65tgklsWWTjF80WWCSLTzk
	KuV1Qw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510amdsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:36:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c82843005eso22012275ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977782; x=1783582582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=f01748Bx8BMNjyD2UbLNZA2ha/CfKDEyXklh/eKV3HWqY+V8TZ8dTzm4NZHay+eqOk
         ZKupgMQQx3M313ZdE7KdbqHC6bRwzsnTxksotQuC7+OpAFdVVoO1u6YrEEZCsGX64fLe
         ++F3q0B9Ja2DtY+lb7sPhZiRGWFXezDmdsaK1IkdUksclz3A3KCjDMIZre7FOOmc+ZsB
         TfSrHtX4KOQLZO4cnlRjK3dFuKN4bOSNX0NLcW9CLa1Hvsmp4mQplsfmB3mT2ZR0IIjc
         7QwQ/MG5yzD9PSX9b1ULaVrXI6nw44Om3kdXLSdy9umPzw67watTyAWYkaoi2Bezwql6
         mCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977782; x=1783582582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rlTz3y0olZ2/56kd7rMDMSpU9o+y3wZn51o+/HWpOk=;
        b=AzZOlgX1fkne0NaUt1fLS3plDK3i1feLNpc4QH29gfAYEa/ikxtCfPwzf+ndyTlURS
         ZkbdXwHI5Jdnd6UaLkcTX3iz97g3LzMLhPUGix18gWaRpHWEu6MFaLYKKEdv0cSNzlSQ
         J2KICDwxTozWs5CYWhq9aEADev69/+H8kWezAy7rB0klsHSwnelukPb6uUL1jT5Oop7U
         LuKOpUBGX4rrd7XmSoZEGwfDF5WPusi7DppsGx/94Gf+oIgL+MhAOcLSvNGsX2GTyulh
         F/qReeNEkOyJTblT3HGYCdk22otR+S3HjDAC3py7ocP2QYRfwfrHXRsPvvajJ1YRH/3U
         7ggg==
X-Gm-Message-State: AOJu0YzbU/9N+fPwqe/ePWjgxLGBCLTr4kTTJH0DzXTlaHQ4V9W1ZH08
	1eLrlV5Y2JD+txpwEz2WHrHtUJ6qDv0cJagHZvNTyyVx4N+wUb2SyORVVx7/9cfXsLZytXPsKpi
	HFeaqQoJH1e2jeq8gwQcMNpgcD9lizGsM4lrfd/b5LjAhwBblCSVCq/6EYnnQ12w3/hUs
X-Gm-Gg: AfdE7ckhx1D4GlIB2mdbO8/6+AQAMp4hZoNRupdaJFPb4NI/uMYVq5o1ubFsvjrONuv
	VvduZzaf1N2qJunQ0GdZ6hPi8WRNXPGtsAk/glj9fRpmV0rp4+KeEEsS37us5kputm4XzmtWJev
	ewzyELEhyy6z0RtVX9ByPtoqdYhyHwKnnzw99/KiaIier9orXiFsvvB+25Y3aJ1IXdoNka72658
	U/yBGEMQq0EX1G9GmjIVid18znU4JAY63jEZnHaAnlnj5OOzzxj8UahpvqFGrA3UWp1LE2LoDq7
	J1KGLdXBvSVVTmZo5uFxPKIpS2uSZCdcqjt1GxelT9a8zz73iJoLafiTVDtmNWvpIJpml8vfqhB
	r6lnsGsPUiwFYm7byFLiz7LdxJ6zy21c65HvFOb5XjJDYB1Y6E0DtX0vBrw==
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848705ad.31.1782977781627;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2c9:e5ff:995d with SMTP id d9443c01a7336-2ca911dc967mr41848465ad.31.1782977781018;
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:20 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:15 -0700
Subject: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=6421;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=x4JqYfx5XKMV2QrzDKhoYgOB3jw+qmSVfnwf+7pslQk=;
 b=KL+aWixh1oLXXQtrcaWbixLx8ZISIBgqjw0qkgYb5wupcfIhOkkW/2GEmc9A06TUlpksDwjjp
 Ml+giJiV+e7D2gWxUYkkiWxFKerBepz7+6G+wKkkEp1z59RrBOCjJ5I
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: Uy5G_rM9IpjBZWX0oMhRiUGSqX5N35v8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX4azh4wjpB10C
 tPv0V1oEFn+HmlscfaZQHEGp+uQ2TxgNtEXp4BTbxpWD0GKRz78Nj6tQHNsZTgxyn64hH16dtTF
 bHX/Zy4Lrlsdt8LG4r6hif2NoZBeI3jg6NGbkf2Yl44tkPl5UJfyq6gXF3ENntgrsL9SXgfl/4K
 GnpaPVrVczitqvhbNoOybMgl0HNigLJXKf/7RuTN5MKALfOkYvi3eA2OsfniQELFSozrZFfp7TO
 yLeDzohrLnOlBtiijV4+MLd/eeNhWg3NhsZKVRGUO76rOETi3W9emzfIBjrltsQcidGcz6QXxtn
 ZREYKUeq+bykgfUXu0/ELyDjb+HyOAxo6ygxo6kAJHemUaVN2K4jwpnXgRC3xL+vywgFCDCutgf
 u+VU1vNoh6Nmc4lG+cgFFXB3BiEOgxAVQkHiA1kAQDNJPcs9SB7ike6fQV325V96xhSHMEJxHPl
 qYh9XzZfBcpnEMkX9mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NiBTYWx0ZWRfX9PZah0XcMuym
 abpaa61dr6VL7giJArLuz4d9s3J10HrqK8PhZnj3s4R7PZy1k9bFeEDHhs6jzObqY4/6piVc6Jg
 gpi0uAkrmaqN2LRN8nQGwneW1Lej9tk=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a4614f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9Ojz-Py7MuQnRvcrkDsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Uy5G_rM9IpjBZWX0oMhRiUGSqX5N35v8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115855-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 82CF86F4789

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
index e0b545258ba4..37ad53b0d93d 100644
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
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
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


