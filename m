Return-Path: <linux-arm-msm+bounces-116104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KNm/Kk2vRmo+bgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:34:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66D6FC1A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:34:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WQvHSKSe;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ARb7IjCX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116104-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116104-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0905C3030D26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB2D369D5C;
	Thu,  2 Jul 2026 18:33:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A78369D4A
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017233; cv=none; b=ZE1qIkiANCb9+0DgrmJ8ACbANtydmlaqPINYf2U50ykcCHtaU4HGTgbQPHfjfd/yCrMOkKrDGfTCaYiodyvu7saxxImjKsucfZ7nEh14LC+cf2mxaoQ4asb1pksD5h7waqvtQ+OoCEzGNNjKYZb97hSL7Cpirt6uYvM1bye84as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017233; c=relaxed/simple;
	bh=M8JKAilImHWFwyVYesHC4CdcBEqjWGwTi9Aqczlvy7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N5HNDTzPMVUx7PqrXrkcIlKkBnRnoUHNNSP72tClpNrip7KzUHUSjB3Ba8IW8dRlTf9Y3kQyklNHNcYqNj2GdprUUV1D7JA0DlHSpehMaKrGFoMaFHHeAwmNT1r5QaH74wEVGZIfORRDMTRLUGqhlzkcsC5ZTlk3LfwKvLCzmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQvHSKSe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARb7IjCX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3HGG557822
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=; b=WQvHSKSeyzEWNwzu
	+09dxQP5b2vSYKA9c9UEoaHgDUXGUzAx78vFvTn3uMmP3M80P7+noc3p4MnjcIa1
	aV8L590mIODUSFK2EoAFgV4UUPiQqxaVp54wmp8qt4F++eIxACYgg7wEDOiIcBXa
	uicaDA1eNU7AuXKxosAH0PtkwoLpRem7/LlGBIvrHLiovaS701sxC84j707fhnNY
	2gnDaiJQP/+81pFnj721bnHx/xuAUGZOfhAqPC1bAS6FjT83pz6gwi4INIPSGFN3
	QREXxDhmQOVmp8aktH+yptE0VTQN+YyLGjue8rpoXi3vX3neCRl0AMif/rRiqtF+
	YtaLyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n942cc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c80f89b64bso34639515ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017231; x=1783622031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=;
        b=ARb7IjCXi6IicjZlwvPEPhRvPi5yx0ViqiSKNzcZGnVZzDCZXwAo50P1chsH03MM7B
         AdDo8FWH2cx8koBH6jnGrA7/8V4G17s+AkDo6vlZWoa+EOzJmY+VeoQEidqsL7tdWuZf
         zXm/vaCwYSzmkns3WoX0Bht7wxuX2E8U2GG9YBYL75aHDxFjqh8Hr9S7rYcg0RJ1gLo/
         kvG62QWV62VMF4YN0kMWHwr0iRNS0LK6cg6gFlDk0I8/iRAqk4CKN0cWJF9THq43oAIg
         fjN04f8Xe7Hmz5Xi8iMc51vlFCh8hW20MbkyngOKEZ7iO/JNIKnJPnqM8sy8noegRo1/
         79dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017231; x=1783622031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/I05FlTslO+Rv/QvjZgNXnkcUU43INdsKcKJfZS3/0=;
        b=cOwF3TocjjMV6RiiF8HiLju2qT9d7LtVs2qqBwBACu31mekrk6QCWF4kM2ifVHYx3e
         9QH3aNhHtjPQgQZJadB6T/Vs9jBq0RWSNy3DosSy0BOMAEBtla8ZXN3WVtxranG9Aoqv
         VqFzQuKsxyIfhgqIJ51APuS7MJHTDK48qWg5NN74ROPuQFlL5U/lZ+iTquCY2ea1urR2
         nXzrHfl0jXdQRjv88hC7P6nJ578QIxUN13e+y3dbqTVEjFiRoXo8y18YJxvSabOS/1Gf
         ypsBAW+R8cItQYNU6mXUEqPRmAfKeAYXDFgpEcW5puJhb4ZqAvRj0IUFIsmrpPYu4rs6
         wi7w==
X-Forwarded-Encrypted: i=1; AFNElJ8l7aQ3P1BcsRRqxhmgrj6r951wkHP2gM2FxtdmcYnx8f/rPLGCMuHmYvPL19zAl/iaPHd7+3+Y6lVTTPoK@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0wSL+qotZIfNIYd1YdH8UDtFX9YP3On5yyRS6I6Nti2T8miL
	PlTMPbHVG0cIRLtyAgWNHjniETdIKOySfVFkuvfwVc8xD52Vu3nX4HVEG1Q32J70qeOK7NQqBwZ
	xJkooFKvlQkHIlfilv02gcHD23IOvAM3Yobllz42VqjUhe86Pvrn3jSbDJEumE1h6xdvK
X-Gm-Gg: AfdE7clsJkbNhvSibJj0T9HmI8s8KKVbeU1E/y5DCg48HBIay9PvjJ/89K5lFwCCU3z
	jhyaz8fRUTGs+gsX7y817N8VddtB8beJp2ZpvPfFW2ptcceQV5nhMDLI7IJnmwVQSnnu3Po+nOJ
	uQiL25D+GsNZUmR/YJHFK9w3xXwMbtIDbQS+XncvlQVajdjleSqx54PDp6wy+4/vhn1eLQPK8IA
	y0y/lAtoy+IyDjH5bDaDG/0dVoxjtBBuO9ubGANoCHkKf/zcxoEx8DICidP2wW6cnmG1y8oVq5r
	lZnEW3Ja/Dw7K4/j1aJ+PPLO+Gp8ZMy6cRI6PCb1WutIRi594B/l1iwV011j95mhwASOQXyjE9m
	tWM+pD8F2WLDhFli0CdA3beRReqnVq/lc2/zrOuUCAQ==
X-Received: by 2002:a05:6a21:493:b0:3bf:6c08:fba2 with SMTP id adf61e73a8af0-3bfed5df76fmr8664562637.54.1783017231204;
        Thu, 02 Jul 2026 11:33:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:493:b0:3bf:6c08:fba2 with SMTP id adf61e73a8af0-3bfed5df76fmr8664524637.54.1783017230784;
        Thu, 02 Jul 2026 11:33:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:50 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:32 +0530
Subject: [PATCH v5 10/19] clk: qcom: qcm2290: Add RETAIN_FF_ENABLE flag for
 DISPCC and GPUCC GDSCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-10-cc13826d4d5a@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX4GYQq/jzvwQO
 mo+hWf/TdserhSsZPMEE2OFuoSQqO8x5b7P3wx6xsPdJ3LVUkjEgCJToVyyy1I12EosogJbXQM6
 2SZyr1gBDRlYGCW0P14durQa0G2gIsC0B3hFH4nmBblBlZ+mvsghWV9qRPx2o1HzasYeMunrB6X
 aCZQ+ihQtD/FEuViaDybd6Apy7eiksnOeFvhcv3viCyX0Oh1uO9c9H5tx67s1OyFHeQtnPrF2hd
 bC3NoMAs3yv3leMUTLYyovPSwCIxsC9WAc9WlW1XMg9fAUXMxvrkrvrKNtQCbsvLIpa2wWgf5Av
 hCsSv1bpxCsH7ieWGjgWEX35kllB87lM8zf2OHX1grvaYT7PzlnG4SaKMtXgRDZsGHCcALX7TN5
 U8ot1iUZ1ugp3VSFPUtTf8g11BcLCw+pmfgBemxulIz2z46idnXYPRkOOBX9hAEA0BaUwTwIR31
 tLjVWnPuW2eVQ4nGyWA==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a46af0f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GcpOkd73Y67OKsgM6LgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EGyfUb9v3KwYNwcNgu-5Ixi5mHCoiN9c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX1veUBoeCJ5DW
 Qs70obsvfAl6VlMJcaAyolOsxBEVYvAyorbjvk2GGdqH5NNUlDjqvbZxnVP0k1rRJsoqJGakukT
 pA+9crbUFtLkmi+Q/Q5L88QkebnJ6sM=
X-Proofpoint-GUID: EGyfUb9v3KwYNwcNgu-5Ixi5mHCoiN9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
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
	TAGGED_FROM(0.00)[bounces-116104-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 4B66D6FC1A7

Add RETAIN_FF_ENABLE flag for DISPCC and GPUCC GDSCs on QCM2290 to retain
the register context across GDSC power collapse.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
 drivers/clk/qcom/gpucc-qcm2290.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6ee074555099ab72106cfae7c21adbd1b4a0fdac..af5527f6a6aed94d372f5c54fa353ad4160549fe 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 3b130f69bb93898ce49654f2366851a7c1c94524..8d397cadc86aaa1666e27c8c4185b9b3de13cf94 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -300,7 +300,7 @@ static struct gdsc gpu_cx_gdsc = {
 		.name = "gpu_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct gdsc gpu_gx_gdsc = {
@@ -313,7 +313,7 @@ static struct gdsc gpu_gx_gdsc = {
 	},
 	.parent = &gpu_cx_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
+	.flags = RETAIN_FF_ENABLE | POLL_CFG_GDSCR | CLAMP_IO | AON_RESET | SW_RESET,
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {

-- 
2.34.1


