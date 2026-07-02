Return-Path: <linux-arm-msm+bounces-116105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YqFcJv2vRmqObgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACA56FC281
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mype9uga;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ECCekEgp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116105-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116105-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A0A630FD540
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFB5367B8E;
	Thu,  2 Jul 2026 18:34:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367AA369D5D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017240; cv=none; b=qqi2qfPO6hIhAB059M5D8gPCy35PsdBm+Z9FxqO/WXPbbGNdJtMY0E6xavMT5Lljk2wbbQADX42GglmcFWHovbNHQ/pB80YEZkcvEZyRiA/T4I5YPXXkAO2oHt+oxcMh0w28CaF0bos+tzXodJE80l6bRFTuz4SWD/P5m8QEu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017240; c=relaxed/simple;
	bh=EOgfoYeY4WTgFl4ClE1+FDjJyJ6SR4YpCFjo5v99KmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPT8nurmlcCM55WrawqdwK1tEv8By+xE1hEaU3vGYfxtTGMe48mxeLHVFyFD7VQeAydNSSM/84HMnPt69S4J7FtHFo8uT9qwVYDBYQ/rJ4zdfvaMf7TeU5y4PHNB/jzJxocRf+2AjKlfvcG7STjt5F0975jS8hojhS7bj6vb0GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mype9uga; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ECCekEgp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662FUWXq865957
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=; b=Mype9ugarMKcCsB4
	+SyTQaIyCZqdnvchScpItWTZ4uMgeqW6DtvD0aD54VVJ0cVsU/E3aumfyk7Ra24D
	MWvuvQ7Ao1Ny/pk5HF7dFxbdckWkcOaSeqhUhEJey9iD774FjyCxWiBXRcyuXMTz
	poK4lphmGtZZM01+H4tc0zytX8i1lVAZ69voLMpjqxrxlaIsAaNDKIyIIC8+na9O
	6zif2BZtKnjXLEQrfE5pAFGnW6T+DC2RVc3rbo7a6FLWvxhMia1ezMzu0FFJeTRq
	IdfxQP27VUdFIucpSvfcziBXjAMDiLQht0/RkZnmhJQ8o06vGVaBzGE9nW3J8ZZ5
	9lI9cQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpngrfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso2846572a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017237; x=1783622037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=ECCekEgpoXczpSf9lNtIWL0RZ7L4fM1t94toFD20M6fS/71yycsV5pdi4gYjXsp2Ch
         O9ZfbOfG6z+iLnH9OG1Nwc8yiJmH8B5hpY9Z7dW29GGf0eojiupU/9u921smIPjZHW8P
         ivl9c/M4tNyOE/70L5RzQDOPz2nVW4XBucjHhSQFr3Wn5lsufmuZK+BIo2CZKnPzyPzW
         kdg8q+37QM6+5dxEZSgYvq1bnEWmVS4XR0Nm1mW0OtwqQnql03cekMLI7Arpas9MCpuA
         hyjeIYSokU6INwfLZMfMfD492wuE+yjuT65GMmPjxGC9hKROMCICrEUDg9Wj81LtDAPf
         IMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017237; x=1783622037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nSuHIjqE4alnqE8ya7F56zil6/hfgju/bRA9V4w8e/Q=;
        b=Dt+YAWReG6dtMnov7DkY9hRtJjpVUZwdh+cvvKPLgIX40EZUpryRca5heCV7n9B3OF
         hYeUK1CzQyGJeDl5rf9GSbVg6lcxAWcp7gO82DWMP+VeFG+LLZi2hiHpkZslZEc3zCsR
         MgtvCbCpa10EUbaYxwcL0JCR6x2mGfu76M4Rwp1TyD66QPbC3XDNwj7UU5fL43dPwQTq
         k3anPqGaED2yfW/VddxcsgxhvYR+upVI4imdNmtC0RzJGrcZVYBtMySBd8aniUPDFfPz
         1S19brTKBPLAFNnN+SWjYrxZ+jnm3kzywOWU7XPYobQrRlT2fISTx3HQ7ouuevAIGXJp
         H3vQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v3rR+eKSpRyhawnzzgIsp3go0NIcq80RwaJ9hUtKHKurvWKpJoEfl16vccAWdXbKpMwu1VhOZ6RxeNqXr@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ1cnLTni8XYjttT+un/vN9SYVZi0NGZmmieb9X7MdOdWMapww
	kp8oLcGUjSJmeqVeH/HC8FS+viYUD5Zh+bc/1fGnkimQWnKp1i1mRQgts7Gb584nZ9w9p9M6jKO
	tTQwwvBD2kpoqat5CU+dzsj4IYwQwVfWl9g+0S0SGtcNKBaad0WnWZz2RZxGuC32/n+pe
X-Gm-Gg: AfdE7cl8P4792YW79BtLw3wKA/XqZOQ+iV/2DFfau7na5v3rKOJmYF35zjhXXWIhl2f
	+MjiOm9bYIrnLqzU4UjEJYuvKhdtdwrhKSuFjxBOpMKGl9eKQp1jbhgABj3H5eKJBP3Ppj/wILr
	lrhy5fTSzzpPsi30/x13zK8q3GyYy9NGqirT+qLx1UWBrLeurDytPSiTl6PfuXgAQ1JJbfOuNyq
	/1Z6ghTKUsf5GWHXzU20yKThlC2hda4ajXJdgyj2cnZBujzs8z/BaEjaXwJO/psky9mfupPHQqr
	p/mYiD5gYnl9fO7Jc+MqMexEblgB6E8kbQONF82ZAzhMSVmvdnUANCUPTlwKh3kg4DsQEyf3kLr
	MQtgzIWKqHqnQXqPu+3g7rZxuI2mC4twoYMZaI2PkVQ==
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386827637.48.1783017237056;
        Thu, 02 Jul 2026 11:33:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:4ccb:b0:3bf:6c08:4ebb with SMTP id adf61e73a8af0-3bfed592afamr8386786637.48.1783017236588;
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:56 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:33 +0530
Subject: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
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
X-Proofpoint-GUID: -lz8xBCSBWUBw7dnia0Qh6cG2lq8uVTh
X-Proofpoint-ORIG-GUID: -lz8xBCSBWUBw7dnia0Qh6cG2lq8uVTh
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a46af16 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=w9HkOJeuip43wi8LW4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX6r6UhUFeHYtr
 jvQBqJuTgUgNfFSdVzj3360zwy30nscMqi+0z1ytXpVtegPf+DcPCUu7l6xWhdePdt4nv6UCgJq
 /xqHzhgfYac/HUsbBr6m5NWnUT05oEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX+pf/l35Bb/UZ
 WN5kyEYyi20LAjr7Z00L3n0ZPu1B7T682Ttm0H4CJkm0ZWHcMHGqFf4qMsIRe1Ojw2gyS1/wgAX
 2x/oVikIx2npGJLxxjGgATVg1M2Y2lTjN5CKLBWn1cvcxwxvyaX8pGqj49rOLWs0qJR5tzxtkml
 2cVOg/22mr/vcHdzJIH22HNTbwHX38jmgWTIFPjYJyGYcu/BkWWB61HTV2rC9t8v2WuGAlB7SWj
 krxyRQw1iR1zaP79TZDCOmawOYcHlfFuS8QZ/+ko1yyQ72yS5ADahYe/EuOXusXxC29wQcyxBXh
 i+WMWdPCWnlLiSqfM8d0gS90Z0m4hkEmK7L1UAga1Dg/W8tsXGBiUeCJgbPEXp6k19+PnPxqA+5
 ojznLGxEavF+zu/m23cyjdAaKFtyT/Y56FurqJztP82psE6rduAfjYHUMkFK1n8xYNA2r7nKXbm
 25KcGu4g+jfGCgADlqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195
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
	TAGGED_FROM(0.00)[bounces-116105-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 2ACA56FC281

Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
hardware default values. Incorrect settings can cause the GDSC FSM to
stuck, leading to power on/off failures.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 3 +++
 drivers/clk/qcom/gpucc-qcm2290.c  | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index af5527f6a6aed94d372f5c54fa353ad4160549fe..39960cb5c26a9f7372ebafd14033bda697575416 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -463,6 +463,9 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 8d397cadc86aaa1666e27c8c4185b9b3de13cf94..4e97a02d942ad23af561ec6ce1ba0a6f61bf5a69 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -296,6 +296,9 @@ static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
 static struct gdsc gpu_cx_gdsc = {
 	.gdscr = 0x106c,
 	.gds_hw_ctrl = 0x1540,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_cx_gdsc",
 	},
@@ -308,6 +311,9 @@ static struct gdsc gpu_gx_gdsc = {
 	.clamp_io_ctrl = 0x1508,
 	.resets = (unsigned int []){ GPU_GX_BCR },
 	.reset_count = 1,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "gpu_gx_gdsc",
 	},

-- 
2.34.1


