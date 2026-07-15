Return-Path: <linux-arm-msm+bounces-119134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ayrgDnPzVmrBDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:41:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7075A190
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:41:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=f9yQTZ4t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bRls18Ef;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119134-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119134-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1273430EBAA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384D3A8757;
	Wed, 15 Jul 2026 02:40:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B03A8743
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083252; cv=none; b=prTDSh49C63OE6jlNmvpFYyhiG1hxyajCh40z1zeMtqo9HWcTl3PixSdr034+X17+maSqOfqFMbvQr5Vq7/peBC3rvQpfOGRj7YLzgDL8Se3ydK58gC20RfLB2Tt3fjE4MWvGS3/SXsGR4v7BqQYkf8B79sw/JEcx4vQdRbPrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083252; c=relaxed/simple;
	bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBNCTj+BA9aL49HNBLnDMklJXip+3M5Ds/UPcj16gkqc4fmXsik4OVO/FUQ3eyS4+2+0NX85yHxFGdN8vJlsCFhtU12p6e1HpUJQcekfQkh19YURrMmmhQWcj/VXwsIu31LxBfmnw90UyuTLMAmuc/FMAm1AhGms+UQIsCaCNkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9yQTZ4t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bRls18Ef; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0IXFC1953709
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=; b=f9yQTZ4t6j48F5jz
	Nn1aElD/LCUeCjq1lbYyOuAVv5Camasz1JXg5Ii6FWlsK8ORjhgBaT8qTHSm5o4M
	E9LRpqSSBorBezNDf1TdYOkA8nuSInIrcZS0Ajuw+H7ZyiW/L2Y2UWIAXYHbeTS1
	lkvf0V/IaM/n368xsptCEadx5ooQlG9miNkLiMmE100DMlwvYdvrOEbdAM7O/X7b
	139vSPe6+0A98u8UaECbMeU9WXYEJ74AYJdp1DologMXT1UaN5IXQUP8UwEObG8r
	zf/M4JYOEneXdsJxlG3Nf1qW748FH9Y9cdJjJrX14X/OcYdMaiWycGMO5i0CK6PL
	7tk3Hg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0jpv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccafc5e82cso20584635ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083247; x=1784688047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=bRls18Ef7Bkg3gZaf2BzhDI2cmy2gfkkZ21otUgNuxmz47rcQVqnTGL+86IciDa18C
         VEIhW/Qftg7IiZ1k1wvjjvs3UJ9ZPX4yxa/kAlpc4haa82bPmGWjpYOu7OTuS3YUXL8Z
         X5EUgjFsEwOBCDFA4ZPapnx4sJQEjvFPCMn7pRhjZTBntsmqyiFR8Pfoz3V3xaw7tPVE
         tRAsvvIam/xB8Y6c1za2tILhK6dPweMwKB6uoj90qCgb9L9PoKjNV4Tjk2tEPuSYPX2J
         GThGOc3WUENCHKD0SHN4POvbDOVUDUDTq24Q+PAuVejkoSb3MzoYVQ9QtFPZArsdEDjd
         f/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083247; x=1784688047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=FwEmwYsx3WxgOeeihBym7XWwTylSL/An08S0M9NXtVwZCbA+Hn/ZkbLFNZV6fUkh3E
         NayDdaUQhAUgicEAx2uVHb6pe4HdnmzXHL/14EtxiCuAzEyaRJiQs+O7gaqyzF8Hmbsu
         DAcg+k7lwYed05ehVpCDuZDVTrJ95jBrkPGpeMWdQns7252f4u5HgUGbMV0r7DvorZra
         g8qPA/NcwW0m7Y/v8aVu973zjS2Ic1vDn9QezcSc96187hiGxoRFE01znsSCGsPxo50d
         wTvl4eoI021XgEcMEFTJs37KJYkdSAb79Asf+Cd5w5BB1Z4nZb7Bt+TJYI1bpp3uu6fj
         cOIA==
X-Gm-Message-State: AOJu0YwG2ggFfFVnxMCqYhiuaKzK0xIUeKV/KdtjBaD76IbdarMbkKH3
	IliVID8zjsPX9eBRkEKEJMESnaNE4kZ5OgmLLDl2QEGjEqyOIwYM2EmYz641qWomLemXj7psh6u
	ud0j+mnJzZHOqXva0K+sUZvx9XM9LfG0oSHhfNt0/8uVqW6IQC2lOwmlqXVklmXnoTzUd0lNB18
	Za
X-Gm-Gg: AfdE7ckg9NIWQiMyQE0yks2dtanIIGtcZxdbAJ60QESD2YybiaQ9z6BmCK4lR8IclrZ
	GcAD+FXawDfs5UkOUC4Cz2ePUiAu6MaVr2k/wgmXz2NE53Sc07tj1tgOc3zEJDB0cAjhba4y1Ng
	bE4ui9iik3MmYQoTvqypq4gl8R6Wk+4ozFh+D+gcXzDQgdPnWv7g1tJc0Z3/Flb4fbuDUtRRA7U
	lbSjaS9ZLSFt1D936LAZVtRSxcvxZlyc2hN6RLF5Bwqo2JPj6ZcTbvZd9o2m7uaDV4E+PXRP9iD
	i4N5GMJH15HyE+rb/V+G9cjowD8PFOY3OPI8yVM1kes6BICN1ZgMGknrZFWoJXUeP0X7rNpcxQ2
	enaHsv4UuGzdhSAbr+0RrJa8q1/pljkxFv8JQD+S4WMN1WKIia/hjpb7dgQ==
X-Received: by 2002:a05:6a20:9404:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3c1108c003cmr16160492637.21.1784083247327;
        Tue, 14 Jul 2026 19:40:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:9404:b0:3aa:f9cb:d438 with SMTP id adf61e73a8af0-3c1108c003cmr16160448637.21.1784083246863;
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:42 -0700
Subject: [PATCH 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-2-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=12460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
 b=mzxoJOQuO/97NegUI3o5gp2Q92oy/M/bv9XB91B7ly2ciFJcLDaOCHyYLKLeNp7ZbM8OTEUK5
 q+1zEsEkPdXDPDMHXZ0ev91ku9MHVyeKnUKuZ/U3QP4a7o+J/byGl0l
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX/g+7akLafgmb
 sGFEl5FXbIdjGgHX3LmiPlfXKA8lg+yj6/gAaSdYzyQhuGwOCWemQ2kOyyRCtYGtR0LJQQ0lq54
 XAXvzbQC2pXvHyawi2Go78/l2Q5DqJE=
X-Proofpoint-GUID: 3yH44aVMjswh9WHlw0HcsmyjQZCQItfC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX2F/HSbaWDrfo
 Z2hiG4bFL4FPZjJielh1Wo0Y5TqdMcj9gvjt7nInr01c4DA+tctIkikBudm4vVOpmBiR1BFo/kW
 MaqvXbzcY4lJuoqM30S5bQJy/GNxO+/dDnXByZXURgNb7CaW0BFwARkqJh4lLrnP2lsxh7UYsAc
 QcTDtToXX0E1pHS/j21fcJ4DZr3au5eNsT3IocGPNwfsQsOq1rUhcyO3u/bXz4JLKVAIOCF8rZ3
 cYzWNxVXjQNG1WVRb5J09GAAqC6Xx6k1DQc0/xxaucpmvSWsfc12Oi83jiuL0+lgwjRN8RlhA+d
 IOHLMHCc+SDyWJoguwxIjQEMMsFz9M4K0qj4b+V8gWSdv62sxSBG3Xx87vTlnYHMFGnbpCLfqER
 a+8RvNWjzJrb6OD9MbbJUm3Q/yWGtTsnOO2t6W7M89nvn6+RxAyzkDxo02u/W3fV2YO8Y0JKRdd
 tr1dfo8GC6LUsRI8cmg==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a56f330 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=48_MYvKuBCZC4ZtyZX0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3yH44aVMjswh9WHlw0HcsmyjQZCQItfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023
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
	TAGGED_FROM(0.00)[bounces-119134-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: CEE7075A190

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the x1e80100 driver focused on clock metadata and reuses
common runtime logic for regulator handling, enable/disable sequencing,
and OF provider wiring.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-x1e80100.c | 335 +++++++++++++------------------------
 1 file changed, 113 insertions(+), 222 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index 0b05c27b619b..ad1f6be83a53 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -5,252 +5,141 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 
-#include "clk-branch.h"
-#include "clk-regmap.h"
-#include "common.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
+static const char * const x1e80100_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
 };
 
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x15130,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15130,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_edp_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx1_rpt1_rx1_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_4_clkref_en = {
-	.halt_reg = 0x15100,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15100,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx1_rpt12_rx2_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_5_clkref_en = {
-	.halt_reg = 0x15104,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15104,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_5_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt3_rx3_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrx3-0p9",
 };
 
-static struct clk_branch tcsr_pcie_8l_clkref_en = {
-	.halt_reg = 0x15108,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15108,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_8l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt4_rx4_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrx4-0p9",
 };
 
-static struct clk_branch tcsr_usb3_mp0_clkref_en = {
-	.halt_reg = 0x1510c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1510c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
 };
 
-static struct clk_branch tcsr_usb3_mp1_clkref_en = {
-	.halt_reg = 0x15110,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15110,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const struct qcom_clk_ref_desc * const tcsr_cc_x1e80100_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x15130,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x15114,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15114,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_4_clkref_en",
+		.offset = 0x15100,
+		.regulator_names = x1e80100_tcsr_tx1_rpt1_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt1_rx1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_ufs_phy_clkref_en = {
-	.halt_reg = 0x15118,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15118,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_ufs_phy_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_5_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_5_clkref_en",
+		.offset = 0x15104,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x15120,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15120,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_8L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_8l_clkref_en",
+		.offset = 0x15108,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x15124,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15124,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp0_clkref_en",
+		.offset = 0x1510c,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x15128,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15128,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp1_clkref_en",
+		.offset = 0x15110,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_4l_clkref_en = {
-	.halt_reg = 0x1512c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1512c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_4l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x15114,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_UFS_PHY_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ufs_phy_clkref_en",
+		.offset = 0x15118,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x15120,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x15124,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x15128,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_PCIE_4L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4l_clkref_en",
+		.offset = 0x1512c,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
 	},
-};
-
-static struct clk_regmap *tcsr_cc_x1e80100_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_2L_4_CLKREF_EN] = &tcsr_pcie_2l_4_clkref_en.clkr,
-	[TCSR_PCIE_2L_5_CLKREF_EN] = &tcsr_pcie_2l_5_clkref_en.clkr,
-	[TCSR_PCIE_8L_CLKREF_EN] = &tcsr_pcie_8l_clkref_en.clkr,
-	[TCSR_USB3_MP0_CLKREF_EN] = &tcsr_usb3_mp0_clkref_en.clkr,
-	[TCSR_USB3_MP1_CLKREF_EN] = &tcsr_usb3_mp1_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_UFS_PHY_CLKREF_EN] = &tcsr_ufs_phy_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_PCIE_4L_CLKREF_EN] = &tcsr_pcie_4l_clkref_en.clkr,
-};
-
-static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x2f000,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_x1e80100_desc = {
-	.config = &tcsr_cc_x1e80100_regmap_config,
-	.clks = tcsr_cc_x1e80100_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_x1e80100_clocks),
 };
 
 static const struct of_device_id tcsr_cc_x1e80100_match_table[] = {
@@ -261,7 +150,9 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_x1e80100_match_table);
 
 static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &tcsr_cc_x1e80100_desc);
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_x1e80100_regmap_config,
+				  tcsr_cc_x1e80100_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_x1e80100_clk_descs));
 }
 
 static struct platform_driver tcsr_cc_x1e80100_driver = {

-- 
2.34.1


