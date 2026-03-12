Return-Path: <linux-arm-msm+bounces-97185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELHtKCSnsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:44:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F257A271364
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E5532337F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FD3BE645;
	Thu, 12 Mar 2026 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QNxjmAaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD083BE638
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773314683; cv=none; b=Pa1AF1E5vu21Xqpal03v8gJN1OZvxOcET1w5E6zo2ow1YAGO7yBGW4dzbTtKDQFTvdUzyG6baSOM/z7PjQrViXN1JRIl5jskjU5F2fRYnWxMgALa0Ve5/9whBWP+2JFgWMjIG3uieL1N/7OC3G59eVjLS43gB7UmIllZAkgbUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773314683; c=relaxed/simple;
	bh=h5l7xTESRGG/9LA6K44BUKx7xT5XlvcESjqI4YstRtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deeUmaN08GimTMOXVWU/RrUwbzOQlIN4WVYCzSAF+zgdd+CYsIQbJoeNcmO49pVorAXVJe1zr+lTnVQJR96336c9zC+/9CoZFyCPtquNJq71Hs48AuPQ3uWA4c+P46codPGak1frcrLnLVd5IqWm3BErxm2Rv0Ln9SuFGkZzdZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QNxjmAaW; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773314680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEYw1hMn+rPN4lG8dtzxXDk53oCQisDbgFmhbdO9lCM=;
	b=QNxjmAaWGLM/ajhmOBbHnVGrHTO4RpU46uCQwUSyHAU2YTTcUkozDtHhJSvtuKqmI+rwmQ
	I5S4XPa5KXqw8q1Y0/wbdsSeGaO6p8MaEYWBchEjR93WsSQBLimJEs6o70iQA6ZhA3Gs2J
	77u6ePlYLGY7kOWBFfokkSR1IIaw37ucAVkwcBSq4Cymswy6rBB5sgHDLTEXv5aA78w9+S
	9VJRWfOzA10NKMjUqFvhav3WC8bq6nHGowq/1c5ddPfiUxjPln7I01qjq9L27y7y629oVe
	428ODD02imj9SLVkz0nbsO80HLQShi1hJSjPPQ7saVrn1bOApKwlMxA2ElJnKw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/11] clk: qcom: camcc-sc8180x: Remove wait_val for Titan GDSC
Date: Thu, 12 Mar 2026 08:12:14 -0300
Message-ID: <20260312112321.370983-10-val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[packett.cool,kernel.org,gmail.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-97185-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:dkim,packett.cool:email,packett.cool:mid]
X-Rspamd-Queue-Id: F257A271364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These values seem to have been copied from newer SoCs, but e.g. SC7180
and SDM845 do not use them. They seem to play a role in causing the
"titan_top_gdsc stuck at off" errors on boot on the Surface Pro X.

Remove to fix.

Fixes: 691f3413baa4 ("clk: qcom: camcc-sc8180x: Add SC8180X camera clock controller driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/qcom/camcc-sc8180x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8180x.c b/drivers/clk/qcom/camcc-sc8180x.c
index 388fedf1dc81..cd4c40a81c28 100644
--- a/drivers/clk/qcom/camcc-sc8180x.c
+++ b/drivers/clk/qcom/camcc-sc8180x.c
@@ -2538,9 +2538,6 @@ static struct clk_branch cam_cc_mclk7_clk = {
 
 static struct gdsc titan_top_gdsc = {
 	.gdscr = 0xc1bc,
-	.en_rest_wait_val = 0x2,
-	.en_few_wait_val = 0x2,
-	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-- 
2.52.0


