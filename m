Return-Path: <linux-arm-msm+bounces-111126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMhtDX4NIWrB+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A063CFC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:30:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dwvoqv4A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GvUqprfD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111126-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111126-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C48AB302E1C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C133C09EC;
	Thu,  4 Jun 2026 05:27:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0113BFAE1
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550843; cv=none; b=areoUcqxsdk+71sRiXjuv1HZVGz2m69g+rS8sCoaYrAL4v7m+0ggiFfvLibtTzpDrZu/iwmePXz1udCznB63qtCHi3Hc4tbTdaGw3uXR8axKBnmVS6iUfsCqLsoq2RH1HkslkzyaLQx82rPf0l+vEtAGpcYoQZ4Y1A1PWE0OduM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550843; c=relaxed/simple;
	bh=lVc4njKqOhZzn4+GH1LiG7VTyYhJso+ZprzY1j0MwKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RrW006lM4bqPq+zyrNoETXt1Tl7TYUKboqr0Wh9mLxqcNgb9ibVjeB4Z9asfogrsXSpjapKI3A6+E+9b5I09lT3V1J6AeMGZlBUrkMVq2UAhDQifCB1xva9KsyG+2oxBNqiYH9972LxyhbHvyzLG/862Fox6p8hNQzzI+XPjNjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwvoqv4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvUqprfD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653N0H0s1476852
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=; b=dwvoqv4AuC4unBMq
	nhYnJ67hAFTMG5T/o9K4KYGLXW1iNlIQoYESojVLtTwgVjeC39zEjGFCyx3iEmD+
	rEs3qBCD2F9r/HVEGAWr8/ST90LblqfJw6Rv5aVHioCqOWy/blYrkiUAt4nLvocv
	r3UYSuhozTD5X6Mvb7cvQSXYPjg5b+TpDZYT0u8HOjn4VD2PXIIYrlGq1A/jMM5s
	1Y34vvLOjG3/kiin6GRulvEupdt5GKPZ+GC86PuIGHMiByPE7A500/JSLoTowH31
	4Q9GEnh9++/a4y69CJIMjp+xFuYcpLNaT+Un5IOMKF0m7GwLCJuiEd/kY39Nq/Ak
	32lCAg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nu4nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84238e83851so225633b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550840; x=1781155640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=GvUqprfDNWn8DYI9gfHNJxz92j8x++IpubqRAsh78Vawu7h9GaBOM/DmbiirWixU/m
         3F7KjoHTSKPPVQgTQbEqFcOIB+SGLiWNPuT2wHwdDMM3Eg91kgOHWdq8qm5O7+vhWLz3
         lb09pG1+AfRpCUnOpmbX5kp6r9alVNang5rP29YuyrhhKpX6ZVVe62pddIwNHniukS/8
         inWBIlWlr4pBy08/xMKh6MzftI7fIvPtLaIcZWlrayZQJljNpvTU7KVxUD7cOzdbKDot
         YAozlXS1MsPmMTN2rPtceC/OgSZFIJBiC5os2H2zO51ndVBq/OSQKZT/xQI7Eae2/NlH
         DuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550840; x=1781155640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kr1A4/6DU9ckTKGgpWrd7fjQD2lYalZrep1+V/xnykI=;
        b=K2WYUn/4DZpgOy/2EnrDknyjxpWkAo8TqYvy6zCDuCQ4schW7aiuLtORGJxlInEnOY
         9pS6kATtAzRKwCDJbUK4vXaonmJVX1jVjkAIMb9ZhSQiIRuDyUxz3sJWlcGkBfBqvde8
         5SqAS5A3d+t3SZMjS8/zXdzg0B6kHDimEQL47gfqNXR0KfbRhMTTBDkIzfz0tdNlCeOC
         WFnM1Cl6p17xZ1Hv2X1yTM5YwQU0/4/NRoNQJTAxmrpKc0/xdtGMzo5S5S1/Z2dEuPPV
         sqtoHYXBAXjLb+Z6xNYgGleOYC4JJEZcTvzaTC03A3g1J68542jWdJlLqyUwd+BqcNKs
         bN8g==
X-Forwarded-Encrypted: i=1; AFNElJ93vmEj6v+jrnWlrv0X9PWBlvynr0TGyTfeRgIj1KK0rLHfl7Z0kkfkOZ7QtoGJ5kvn0dJ+aFdbLJ1cFo9e@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhjhh4OnttR7nh/w64vWUwyy1ZoLYbmYgwqzbNFoBCxuK+aOxA
	hZc+JKuRdzBAxWD7PtKzOUrtNbgrUldNaLgZBY5TKqy2KrrfiedaYSfR4a8go5h3qxd8ji5Y7nX
	+4m6MnBcQ5cVOevZdmDkkfd3CWUe3SkVpV5lZlANtpRGW9vBQXLmFTgA0yCAm4+iUL+C3
X-Gm-Gg: Acq92OFrPQNwCGFfRrW7N5RhcWG5ubo6Ep1qaPoM9t8UD3cfFWZftJPcp90BR/wybiS
	iedwtZDN6SRYQ6ZeuSzjLaglVsNpZGkVKyqyNUMGUZoEHiAd/aT2R8snbwm/n/iSzsj5xK3cKiJ
	QsFN8/s1wTf8QOfeCNtYZwVX5MICqVZMsrsNlH9oqPiOANQ1eNOoKw8uUShLE18cjtn3iVEPctJ
	MH3ZmiMsUPYsIu6ixlFi1K29Jkn1EVH0qidF1JA8V7PovgQPQVU86OSPhWCtjr/UjrFWV9NRJzF
	khIFCWRAdQtyVOrv3cv1CKe3mllrgmlnSkGgRCaecYZPrYEDjMOPb2s39jFmqbeN232DOnMYq4G
	0Mq3NvyoR6zxV5GJhcCPbUs8MRFNd9setP6hn7sF1P39FDhjzd2Fio2aSBm+dMUc=
X-Received: by 2002:a05:6a00:288c:b0:842:569d:b10a with SMTP id d2e1a72fcca58-84284fae3admr6234620b3a.49.1780550840265;
        Wed, 03 Jun 2026 22:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:288c:b0:842:569d:b10a with SMTP id d2e1a72fcca58-84284fae3admr6234602b3a.49.1780550839858;
        Wed, 03 Jun 2026 22:27:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:19 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:16 +0530
Subject: [PATCH v4 10/13] clk: qcom: gpucc-qcm2290: Update GDSC *wait_val
 values and flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-10-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: qn6JVeF3OzHYzkuPXOzO9S0qtsS5qIse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfXywMCMUnqCPOn
 WFru9yGArxz+H+pE+Zo3zD3tmtN0m1dKNzfRCNUoyCzGT57+aczF1YpPBJb228ETcXiUv02wya/
 leUJ2EMCBzJ1ZbKGvmE87T/3bA41WsChqxhvzZ6piVLEeL2cEZvxk9a1z4kQ+zmUUgc8jdLBrkZ
 jTc+ZPA6tograezmCfwtHobi4vIRIkAqXFkPbw5+GDHsmrYuhLo+k54fYBPMQdnRLyQB7v2e84R
 gDJnt/4UPwES5m/d4qH7DaELzkh9T0L+xHnSrALJ6DTy2HctMbMhQXNJeBVr5Y0E7cmjKE6E05+
 Jmuq2NwsN79U9d8FmqcAzYSEDTTUZ+7C1lCPs4aPz2TgcYAzDNkYdqVenpXPNgm2o/sLXDG/Qiq
 O73gRnD5T9sNIq1uikfcu2j5MWh39aj/ihbZ1d7wAGC7Y2u3B5iQzC17VVApubDlbFW4chp0Ld0
 bFg08UUCWuAaKZ6Ap2w==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a210cb9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0JU4rCqLU3avs8DDqI0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qn6JVeF3OzHYzkuPXOzO9S0qtsS5qIse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111126-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 592A063CFC0

Update the QCM2290 GPUCC GDSC wait_val fields to match the hardware default
values. Incorrect settings can cause the GDSC FSM to stuck, leading to
power on/off failures. And update the GPUCC GDSC flags to retain the
registers, and poll for the CFG GDSCR as applicable.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 2150b94ad0ce5146c47ae21fae4deccdaba20673..6e696cf672923495c789055dcd2ff905d1761e16 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -270,11 +270,14 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -282,12 +285,15 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | SW_RESET | CLAMP_IO | AON_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1


