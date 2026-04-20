Return-Path: <linux-arm-msm+bounces-103803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILPfGolh5mmavgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:25:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CC43129E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9CCF363CBF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82663382E1;
	Mon, 20 Apr 2026 15:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKWLJx3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MrOqQYkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872A1337110
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776699837; cv=none; b=nvaPWuwys57SKmmXep8c9bUwxHajcP+MyZUNckkI2DMEfTdbvQsYwbe0Yu2drgMT1mZfjC1c3VYqrH9C/DJCXeBA5TsW+akLKCsgbJ++B2t9kYiE/YpI3NtDUPumvF6TtRIHnS9ZwixAxQPIM7kHBNLN9Gi3RF5e+6yvLRqZc04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776699837; c=relaxed/simple;
	bh=fP/3X5CDFCf374rNZnQoyBTi3/cS+io0nAmAc+HyNT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j/NrtzXKdaeT1LptSPJGxvyREG8cowgD0Xjwoe2QP1P6PaYCKV4bYjksdsUBcZl6taoVuBwW7wZrqL+q8eQmZhfHDi30jANS+fJluc0y+Si0MKKPcPUm0txma9AFfsq69k2LIFu9nHk712qLIAwb0R9/Kb474R6TuPM+Uge6Vuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKWLJx3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MrOqQYkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBVdjF3212116
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndPwvrWPsmLFsE6MRGoewd+OlexaiD9Dkxdx8vNMAmo=; b=nKWLJx3nbaBjrwYZ
	YAzwkkKtKkZ87jeU+t53LfN1jcC87VgftGoE6A7chPgSXwiJF2bQLZP/WpzQBpYn
	uW0bhp7OC2QAUjxYwAvtVWBQnWr4GKe55LdrcHbaIWt9Ksu8V6fhagAwKzqoBcSd
	ezcD2priXQtimF7c8wCZj2htnpmhuuwHDllexMmWYylsCHRyOXFo1YK0BwvyOti4
	+07EP9ovh6Bp99e2u0Xga64YxPg4ohXOXBoF2pIClc6Y79K3khHex+WaPh4+b5TB
	mRzaHPKcYWVbo4lbUG/9GXnigHczpWF//nSjk23ECnRvrjf9xCRdESi5omnC/MpY
	TXAp+A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfcfj5ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:43:55 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso4514329a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776699834; x=1777304634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndPwvrWPsmLFsE6MRGoewd+OlexaiD9Dkxdx8vNMAmo=;
        b=MrOqQYkV3PSSje5IAA3stYpPEipG303+gSZlnI0oehA8o6muYr7DSmpT/qe2isN+us
         Wz4UAVFAGxdZXxlKtSoylcnVBc/rSazqa1Ao70H1+R1/qh18myaRAY3FfwoIskdKbosB
         PdgdMRZIOSzninlBIYstrkdHBD6khlEV8Zmom8nUXVsRs585/GC32bFNpYhYJe+SZ4N1
         WwPXj1jHrAmPyexghMnONSEe8ttj/m1E/e4B+M3r/bibEvVPnnxH9Gb7RVZLFllkX/5N
         BsyNb5Of+4Vc8doeGqeNHdCfFXJNq89Y0w7l3Swi5IXQn8gmvpQCHfRD2iPvqDrW4T3V
         er5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776699834; x=1777304634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ndPwvrWPsmLFsE6MRGoewd+OlexaiD9Dkxdx8vNMAmo=;
        b=mpGDyRy1bqEWeIvxee/WXG/iIXGsjv79gU2coGuwgyK+6pgz2r+ACDJPqZjlX5+CaW
         dMH0HsMIaPuuzhIl1QiVtEgKlghlmDSAtv8cFcP5HH1yH4gOSQ1ZxFh3zvPumgUkZSgu
         UNzhxoNZMxqsQgrz09Db4bsgeMFRzcGCowb1zKT53i/0SIaEviQ+Er2Lj31ppFR97E1u
         UhLjFbGvQpyalfw8gBJ9A3ZsiQGJViLWP5bT1TT+pAw/P/a0YsGnamjCnBDX9PhyPlkZ
         20z3zaPoOisOLwOfyPOfj65FVe9Lm1SulwsneJUxLmkB9llRFHOlqgK+WYyfLmRUUs8p
         6+mA==
X-Gm-Message-State: AOJu0YxfHDCnG7ssMKbC6WTljnfzE1puI4XrVb2mYmku1gMablZurXiR
	/dF639eZx9+xmTNVJWelXg0OmmJmbVkju1ujeTYVPhBlqz8rzj27R8o5jIxKyorZBebaKlXVltN
	zZXup9X0P7cpsvWCZNwcgw6p0vqBNtgMPL+4eMUcCVTfgJLBXHbIxiHMrdcwEhmvDGbKe
X-Gm-Gg: AeBDiesA99m//kGWGdq133prGhivRCRJgyNLGmWHBtRfTunHObrmwn5gRyIZESE1Sh3
	FYwx2aqfisbiH5JAnXAYGZQ7Js9CcHbXoTYoMXRkif74Rxul3iq+YfT2Lk+yRKt1MxVUSHHV3w2
	s783BuANdWugthw6bwEmzfWKPg4O8meSbaTCvW9YViVRYCXX261atfvcxKplCvcZhLRON3ZiRAz
	GfbhAHvLyILz2wQXqcYskw8lWx0alKH7MPfQpUG6kYxlZZPMfEFZEJL9+qygLPin3VMwYgIYbKo
	vxkbo+nzhPt4anrYGS92iu69YY4DdBv684FdVboWbOB/rPugi+P7sq6scooQKOP0ZqSFVt2Yzz7
	Nxgxs4JNi9895KRNXtRe5dPDim0GEL2czYIOCB9nQeMr/KoTlkBCWaaw9de5luA==
X-Received: by 2002:a05:6a20:431c:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3a2dc5106d7mr1715247637.36.1776699834229;
        Mon, 20 Apr 2026 08:43:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:431c:b0:3a2:dc51:445 with SMTP id adf61e73a8af0-3a2dc5106d7mr1715224637.36.1776699833732;
        Mon, 20 Apr 2026 08:43:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb28sm10533230b3a.13.2026.04.20.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:43:53 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:13:39 +0530
Subject: [PATCH v4 2/4] regulator: qcom-rpmh: Fix PMIC5 BOB bypass mode
 handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-read-rpmh-v3-v4-2-70c152e6c958@oss.qualcomm.com>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
In-Reply-To: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776699822; l=2619;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=fP/3X5CDFCf374rNZnQoyBTi3/cS+io0nAmAc+HyNT4=;
 b=GeYjH4O3ZlKAD8rjvFalQvjy8VEUaObhUtnwH/hoICpO1SIX90OZvyavPIfSXz3H5MNEF8eB8
 wFkxZEXqaUwCEXHEbJQndq/7VuA764VsktIeZ4IJchSBzK3xIk1HB+p
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1MiBTYWx0ZWRfXwgTprTNrSWS2
 ZjNSxW3YqW8RU5ARPiRsIApI4pE3yMVlKVYrSYMa0CW9f/PjASGuefnbcW3ftWTsOjHIU9VacDT
 3ZmWLDprpIs5Ia0ZpZPLuiCE2JLIHY2FaV0gIBDxQyv8L0PBq821WR/ZrEJtiVq4ZlQTq5G44qO
 WsBbyab92QABLEm88ie97O+FeoZXMmA4zl7YUTCjFXQdkEwXwA/SG0ydknt9rR0dPSmZp2E8yJ8
 TS0rV17mTMffuyc9NlkbQmCOs8PVZb2tTE6nW+XBp1Z4kFerS+irxFnHRVnjTe//t9xKgjFei2Q
 ALhmyTxi7NuwRz6m/HkNpqAnK9iuDytKYvA0T2NCu42mDGTldAeWdGA8xlZtvDoKrmyUC7AXyVY
 iHqbjJfiGGWn+CHKopyRnoVUGs8bVq6pmxU4wc/yH8k7Nt5+XmL8y5qlOx7ccIBfC56tg6o7Opp
 0tQ9u9WxDnkMYzDdhRg==
X-Proofpoint-ORIG-GUID: omAk6vb4a_5koNkrP-2_GqtHx676OXia
X-Proofpoint-GUID: omAk6vb4a_5koNkrP-2_GqtHx676OXia
X-Authority-Analysis: v=2.4 cv=L+ItheT8 c=1 sm=1 tr=0 ts=69e649bb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=W0IsM1cLceJ2lu2XXEMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200152
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103803-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,cmd.data:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C9CC43129E
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


