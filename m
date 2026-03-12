Return-Path: <linux-arm-msm+bounces-97186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L/uBriismnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E048270DE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C022D301AFD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799873C13EB;
	Thu, 12 Mar 2026 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="DBqgUKhJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1EA3BED05
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314689; cv=none; b=XryPKwVOFqPAZlammoS8YFKk9KAjfOmXQuI/P7DNZweyCYmVkhTl1ZiFq9FVFw7YqdCQmMKAd1bBiVD8Ov9T81vSgAnxD0CInDd7QAXpPxriSNemUgzth+RoeqeZ4ITC4KAXINAZ31qBQe65NPTMr7eOZ5eIfdNTtmbeA4xqPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314689; c=relaxed/simple;
	bh=vi3l57rFdQN9o6dYFz4oHBnQnb11V1l9VfNmYa5ReRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2DZ7mYfAG/saVNNV0h9Kla04im1g7CEiBHUcw5ECND8FG4DT7taukalS9r93syQonVHeg6ISqwPmNTyLEZE+DaZhuinHj8Cgm4SfpRN141A/r/JUvXTXo3ZiV+jrveQzCvOqv+a2wGD2zm9W64lwfPgRPtZssBuELcKkJDQedU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=DBqgUKhJ; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRgEFaLoplAf78NDUsUX00O6rpYN8XYlndl7+r59PiQ=;
	b=DBqgUKhJ52pMAze8FlM7/cDnMrTp+FpePn+nCkzju7pyr+mXRai7VumOaDtWeqk4Ly5uo9
	satgmvbcAvFhlapkQwEIQG8Y3323STpFXTPJItlRdF06crDpE1jYe658OExlH4Q5+3P0r0
	2SbaiXajgBYPzCPiIMS6zZP2DPgMhwpWW6OTaia99eyRBZWl/jqtJoCxz+nzgcCu5Ct6YH
	0cB2eY0yMzVio9iCrn2EY7a93KxzTHOhVrOg7LSVE3XxeMzknHCOEzI47ALsG+xv4Z1c8j
	wcI6511iDviAU2MOP8IEjoO3OCAvHWlgolshOnG/bXkOCPSjY5uNyGH/85OBqw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] clk: qcom: camcc-sc8180x: Add missing HW_CTRL GDSC flag
Date: Thu, 12 Mar 2026 08:12:15 -0300
Message-ID: <20260312112321.370983-11-val@packett.cool>
In-Reply-To: <20260312112321.370983-1-val@packett.cool>
References: <20260312112321.370983-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-97186-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: 1E048270DE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In all other Qualcomm SoC camcc drivers, the BPS and IPE GDSCs use the
HW_CTRL flag, but it was missing on SC8180X.

Fix by setting it on all applicable GDSC entries.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index cd4c40a81c28..67b2055bd212 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2555,7 +2555,7 @@ static struct gdsc bps_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ife_0_gdsc = {
@@ -2620,7 +2620,7 @@ static struct gdsc ipe_0_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct gdsc ipe_1_gdsc = {
@@ -2633,7 +2633,7 @@ static struct gdsc ipe_1_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &titan_top_gdsc.pd,
-	.flags = POLL_CFG_GDSCR,
+	.flags = HW_CTRL | POLL_CFG_GDSCR,
 };
 
 static struct clk_regmap *cam_cc_sc8180x_clocks[] = {
-- 
2.52.0


