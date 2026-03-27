Return-Path: <linux-arm-msm+bounces-100452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2A6ENb/lxmnrPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:17:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DD34AC5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3F643127490
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292AC39099C;
	Fri, 27 Mar 2026 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="YNKGVol3";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="MAbjuk9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9473739183F;
	Fri, 27 Mar 2026 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642320; cv=none; b=kHGPqCivLI4KVNRfjGLcCYSxDzaKSr0OeJX+QkAVidoVUMqqVR5PGYobDutVIJbqXrxCRllH7pcdlS57LBZwUdpclkJRCZBXm0FDuw6WSUuvyklDmmkYH3Q08/X7tlXpTV3R5aan47xTKKOOUvMZvlST/2NdgQltZsBZVqtr/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642320; c=relaxed/simple;
	bh=leWueILz2D9bvmlLtxcGgMya2lBrvbtuQxNQCFT+mtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WfmvTuLZLo8xu0AmIUET1s6QD+/G6i1GLEF/FBDq8C4uXToE9el8ZZB9Ur3IV0WNw1Qb87FkajhgMWcXhUg1INcg+myRPOViiY8H3+V9IlG9wYixP9FzuFgXRydr07QJMU6HV4vnLI82BqMLaRzfGpNkugqNfvtPcLQBNaLjMNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=YNKGVol3; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=MAbjuk9+; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642309; bh=32f60bOucWIIJ3GZoRCSsjs
	Hg+gha0XcooZHoLc7cks=; b=YNKGVol31hKnF1s6kEvFMkh5rYX5mArCb6MZYTFN59qa142j1j
	CK11Wu3Vjfx0UPbX5EisobR9s+6m/tztpLo7jCm3iQgDVjhjShcUUmQY9tS0DzpuaT6PE2TmPOo
	nHJsWCEkjppMOtNx049sTCcyLe3MdRTIfNtSS6RINuJb9VpE4bx+870lBJBqcWyYHj4lIU1oVwh
	175iMAONOR44LffRVDrSfs3pQzkZg/2ECXPnCgZe1OoWqOC3AvLBTfy5XvgPW3BjQzhOV0okmpz
	qVlRAbZ4F2gerrmluy208vZl1X8Qpl/Mt49wt+CO+e+VlBw94XIj9kd21ZatvR6r7Ew==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642309; bh=32f60bOucWIIJ3GZoRCSsjs
	Hg+gha0XcooZHoLc7cks=; b=MAbjuk9+5lHGuZNGKuCFQ7Gx4kt/epDHHsUJ1iLFOqsWBeQHNH
	5wLN7CE4FClgyRDbmJ4rGkwFpvYj0PS7D4Aw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 27 Mar 2026 21:11:45 +0100
Subject: [PATCH 3/7] remoteproc: qcom_q6v5_mss: Use mss as regulator for
 MSM8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-sdm632-rpmpd-v1-3-6098dc997d66@mainlining.org>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774642307; l=952;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=leWueILz2D9bvmlLtxcGgMya2lBrvbtuQxNQCFT+mtI=;
 b=uzA7dPCGT+h8nFN/wmw3OglRlxMqidSdER1v9CUGiJkV1NIYyRZ/u5Jwi4dm1Nf+B05IIG3vM
 ZA+NQPOUqiHC71FXEKziSxZ7jrQEoiM3zcPOsIszL7M8DahLcxJd/H4
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.07)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100452-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B4DD34AC5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MSM8953 MSS is using mss-supply as regulator what is usually pm8953_s1.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 4e9eb5bd11fa..86edd826ede8 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2705,6 +2705,14 @@ static const struct rproc_hexagon_res msm8953_mss = {
 		},
 		{}
 	},
+	.active_supply = (struct qcom_mss_reg_res[]) {
+		{
+			.supply = "mss",
+			.uV = 1050000,
+			.uA = 100000,
+		},
+		{}
+	},
 	.proxy_clk_names = (char*[]){
 		"xo",
 		NULL
@@ -2718,7 +2726,6 @@ static const struct rproc_hexagon_res msm8953_mss = {
 	.proxy_pd_names = (char*[]) {
 		"cx",
 		"mx",
-		"mss",
 		NULL
 	},
 	.need_mem_protection = false,

-- 
2.53.0


