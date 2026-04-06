Return-Path: <linux-arm-msm+bounces-102017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB0mOL0w1GmUsAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661173A7CC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A026030668B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1A239DBE5;
	Mon,  6 Apr 2026 22:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CGn2JVw1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YvqI1eO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43C275B15
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513728; cv=none; b=RXo2CxpZ8qvkCvyVmb/OPxJ/42cOG6Z/oZpNqHdpdRPjv6C5p83ObpuQVFKdl9Rc0GZJCUSk3qAvsFnkAyb7MRRKOyMCHC1AdqJ959gTtU9gvp33/oeHHtT9swEv+LMqWnK4V9jmIbU4Xvhhgilnkii8As0HnbpIPCjODyWHvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513728; c=relaxed/simple;
	bh=sL0AAcPy7viWgfA/9FLqMUV4KTxuU7dUv5w4fRLlIiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eW/SfwafqaqfVTZqX8uPU7Rprs3UsJcQTMi09FfmHdKdLcP2K+p/EGNGTUFx1nVYyA5RgDlEej7HOkH4oIOaAMxhVGBWia5Y6luVEoEjf7mG4O5JhEE2wbgFQ3bKZl9M1au735OuX3xwFcn8ehF5iUW3qluR4E6Cix//Nr+oDME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CGn2JVw1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YvqI1eO5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQwAd494121
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 22:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=; b=CGn2JVw1brhZ88zr
	0Wx/t4sMdx02H3w7TN7IN+qxMO6YkAbfiKUgqXz805aBvi82p8RtaUx/4ZOEz8KV
	SlCsIAH3XLuxJBCGdmhkciLGVNsqY9PEZ703B59Dkkvsut7I22kf6hbkamwux65e
	Twf0SK5ZRmmZ5xTLB0ciNIgpJ+r5gNaHFh11h89qHYoys+DMDqTkO5/ehxupehCy
	toAMYh55BQ/jDsVeDotkYDmZx6AyHckkFIpEQlNMqN+ktr+lS5e5vvy6pglRkB8N
	9lVzfKhgz8YedWxHoSc4PzDW1a9ewlLaY/k9JtstOidqBscWnAvkB7CbkUd0E5jP
	wG7hgQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8r3dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 22:15:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so4282379a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775513726; x=1776118526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=;
        b=YvqI1eO5AztZ6mpw8Rn6ULR4Vlc4ItylHvubWxtAfDpSKlAg5bLgrq+beC++/P3kAR
         NV337Ge7wrQXv+KOl08Z+BT//qBVbYTpjuW14uE31flCD4JgPkUlIB3TeV8lFsPI5f6W
         JWrOKVx2yfWWtIS5PsRladNKG5sf88xCEj2w6aefyrL/ZRkz92vfKb6RVeiwhsP6PXkJ
         sWxA1hhU7PlNMrqzAnB3khcUaB8GZfu57/Vrx4b7qRoU6I8OVZYMz7rvwX/gbEHRW44u
         p4OPBAPqh2fAuK1ETputr7uwYMo0ghMtLdFo4b8qelyY5TU94CxAVF677LZCqY2b9CGQ
         RrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513726; x=1776118526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3fRITYQAHKvF88MQ+Ws0Zlfylc75OFlgS1WmTi0q9E=;
        b=iF+yG6Ywuo8EVYYhsySM9i+ZezjJuJpcpuuoHtPgI84HUIvRWCBedTSslKFGShMuuE
         0YxpPPPcTgjy/ibeNcNlVQW1WSjbMdyYXaYxcCtc0xqd6biOYKrOipiNA/khNg+VcfVb
         S/IrPqjfqzJ6dkolnLEKRjklMsmtaxRwvUswrJyTX6L5zxB735rGulE5zZ0zJGrVrUiK
         s6qxnjH/d3/+E4M8nV9BFTgwOHRrBNgkmhv8OtCugvXo5n/HHaqOxXNp92yoVY562Aqk
         liOQVWMksc017uRVSRr+la+XJI3rnQDUp6jHHoqlVtufOn2OyVetk2CCCPezC/dEf93j
         Rp/g==
X-Gm-Message-State: AOJu0Yz7PHZxZUJ3A5OHzuY48cLd7+28ezvN71QXCyxGHJ/TJfQnivso
	GrNfvnWs76htLQpdIo4NwknOPJmFd3p4zbgcrmj3c1HW9TDiPKDKTRuUMIQBJN68oWTrN8Mx2aA
	cFm/hfUsUTYx6tzayqLMvtGm4CnzmJgyMyjajebkqii/qCgHQs43cFaKFG89DmmyO3fj/
X-Gm-Gg: AeBDievT1qJxuVVHpNykB3eaY+9e92E2CP3U/s8onjZ9T9eP/D4uyeBxCrLr0Fsm2vn
	x58GjiSAjydO/w9Upzv2PAkDVsG/h0TUYczV+vArATlQCvd6hM46iCZYhl+Y/ClpOLtfiLVT635
	GFSar1by5dOATCDtngeDDeNfgr0axVnhr0FUqT9I/5VHyZ9kBltJuTImJPZRYB/GAMmEAhoAHqg
	QmLgFt5KckXmzbdbhfFY3oOjAuBRQlDjnRU6iua3hcXBKIMzw8EGA05KrwwOIt1VoPAcN+cTLl4
	Rd6Ve+VCy7+v4SS9Ps6WDYi5O3RgcD4zCP0L7WQHLAs79dBHcjhf1EINK0zOfpDYZm+b/ou3fQQ
	Jqlbf3roBEwXHPZf2DSgGmhn0MnZyDF24U4C4VUEJA2b/ZNhV9Q4=
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr12896022a91.14.1775513725820;
        Mon, 06 Apr 2026 15:15:25 -0700 (PDT)
X-Received: by 2002:a17:90a:d407:b0:35d:a557:e41 with SMTP id 98e67ed59e1d1-35de68f8988mr12895994a91.14.1775513725296;
        Mon, 06 Apr 2026 15:15:25 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34f9sm14447519a91.1.2026.04.06.15.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:15:24 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 03:44:59 +0530
Subject: [PATCH 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-read-rpmh-v3-v1-2-27db2a56b13e@oss.qualcomm.com>
References: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v1-0-27db2a56b13e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775513714; l=2552;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=sL0AAcPy7viWgfA/9FLqMUV4KTxuU7dUv5w4fRLlIiw=;
 b=cDx1GdH/bVVhoe9C2BkHC4GiCGK6oVXTvbSqqEvrl938xAA9N+oiVaU4EWRxNFskLZzc1LdGK
 HZyDepoDiOqD295TWw6vVAOeKqZt8+Smcp6lQx16l/qCCQQzDVwfKhL
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-GUID: AGWCEUaKr0dCgbrhlfy_FYjuMy25yDVn
X-Proofpoint-ORIG-GUID: AGWCEUaKr0dCgbrhlfy_FYjuMy25yDVn
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4307e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=W0IsM1cLceJ2lu2XXEMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDIxOSBTYWx0ZWRfX3ee7nhKP30xq
 vSqHzPm6UibqwEFDQFxEYETLOlxo3pl9dxfYrImN86iuCDdn5GLc5L/lC5IoKKmJb5E5/WKpz6V
 2nUVTZ2ZAvQ4yoG53DK+zEWpGjoI6FVu6Ni4+WWh3niU1rnl7kk7ZHgLgFSpXHI8kUViqR7fuT6
 8rzOsFOcZwIkLCTbenEOPPz95mlWG4seT/8YYsmXznBqqdaNSOvwbCXmUQnVa1NJGr0UsSuAlWU
 Wut3SCf1dwOJ6y4hH8nU6CojOoI3mfiwD1/LFD3nEOTYR5IC/N/1HttRPglPEhNm1BKePFF7Y+g
 oiGrq5uJdW0cogKlkhkVk8esITs7tPM0UxTPmi8CLX+k1ZsG/ehtLqQfuZRfQXmTgTPDMowJgAi
 VH5e4o4HkOgP4RMP2juCsPKb5jn9WXrkK3FQ0wDjDDmNAgcogRMuUKs9oeKdEmq6gc0YUqSfPb6
 lbMtBr6DvCO9xXjIetg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604060219
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 661173A7CC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, when `rpmh_regulator_set_mode_bypass()` helper function
is called to set bypass mode, it sends PMIC4's BOB bypass mode
value for even if its a PMIC5 BOB.

To fix this, introduce new hw_data parameter`pmic_bypass_mode`
to store bypass mode value. Use it to send correct PMIC bypass
mode value that corresponds to PMIC4/5 BOB regulators from the
helper function.

Fixes: 610f29e5cc0e8d58 ("regulator: qcom-rpmh: Update PMIC modes for PMIC5")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6e4cb2871fca8d7f371660ceb0c73a092507a5ce..85fbf10f74bb3393071bc65681356312f27b7527 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -111,6 +111,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
  * @hpm_min_load_uA:		Minimum load current in microamps that requires
  *				high power mode (HPM) operation.  This is used
  *				for LDO hardware type regulators only.
+ * @pmic_bypass_mode:		The PMIC bypass mode value.
  * @pmic_mode_map:		Array indexed by regulator framework mode
  *				containing PMIC hardware modes.  Must be large
  *				enough to index all framework modes supported
@@ -125,6 +126,7 @@ struct rpmh_vreg_hw_data {
 	int					n_linear_ranges;
 	int					n_voltages;
 	int					hpm_min_load_uA;
+	int					pmic_bypass_mode;
 	const int				*pmic_mode_map;
 	unsigned int			      (*of_map_mode)(unsigned int mode);
 };
@@ -311,7 +313,7 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 		return pmic_mode;
 
 	if (bypassed)
-		cmd.data = PMIC4_BOB_MODE_PASS;
+		cmd.data = vreg->hw_data->pmic_bypass_mode;
 	else
 		cmd.data = pmic_mode;
 
@@ -767,6 +769,7 @@ static const struct rpmh_vreg_hw_data pmic4_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 84,
+	.pmic_bypass_mode = PMIC4_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic4_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
@@ -975,6 +978,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	},
 	.n_linear_ranges = 1,
 	.n_voltages = 32,
+	.pmic_bypass_mode = PMIC5_BOB_MODE_PASS,
 	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };

-- 
2.25.1


