Return-Path: <linux-arm-msm+bounces-100454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLESF9HmxmnrPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:21:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1DF34ADCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B6993091FEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C02D39A7F9;
	Fri, 27 Mar 2026 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nAMifzaV";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="qgphT+tM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBA539150E;
	Fri, 27 Mar 2026 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642324; cv=none; b=nobd9GptXcSCu7wBhWXD+BEz9fNMEv3xe62hICstYqVMPDMVVE58tJQeEmNkIc6nnLIUUBKfa3+19Fw56MHhDXVFP95mLSOt98Xjf3G9GAKq2Hyk5SGA9bbVlkF/mLRsduuOFXO4OrVtzG86+AsV55CSUca0JxtkFjZX5VRUmrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642324; c=relaxed/simple;
	bh=oR9symPnOB8Q+3pHHyPrqBXlOh4cpvn5OEpbjN8X4bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyvmbLcQll/tTvV5DEQiP2gqM9/ThKIfNeY2PBD++Ro5TqjTZx53oslc7h90P2h9HoRxzc77Ug8vtfj/8yjFf/a69TUeyHbXzpC1D4QqWhCWR2y5P8MFcdRvm39PGr9LJHi2/J7js4qVZYC8jjVbHto0XU/Y+ktBdCLBDX/cg4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nAMifzaV; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=qgphT+tM; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642309; bh=lJQPF0zKhlsnPHjT6LRY7sK
	uEOHW+y4c6JYmckLLYqc=; b=nAMifzaVqxZb+ieaMgoM0bT+GWwn9TEcFUx/scrGoI9BGRk1oI
	E0MEU+d3IcDaTM+zh8APd4reODd4dATGVCAzqHIhVF5pf8ldsBnJKTYzK2RaEf/Fijs6SFif3T0
	Tfq+Lneb0a79FtRwCiv66+Ej6IgLasUn8G3rmz8inIX3YY35MiBsMh6v3yRSRYkFamx8SV8J+M1
	xbKYxLnCqAPmOrgoKBRVYkFhcwLKXnzr0ujDZPmYOn24dA7zDYtX2pIArtj+OTkbusznbwEcT9+
	fBGDYjuN6W+TF0LHJOTlL7A3tq/TZOz+oHwWRriwzhY0bxRrJLfeR3iz5nt96Fim2og==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642309; bh=lJQPF0zKhlsnPHjT6LRY7sK
	uEOHW+y4c6JYmckLLYqc=; b=qgphT+tMPZA1dHFQL3esmvHzkZ76R4jwmNRN7+cKn63rOfA0Hp
	tHZfKNoiBsJf8JUe6EVjfdMvw5WFcRQB2HBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 27 Mar 2026 21:11:44 +0100
Subject: [PATCH 2/7] pmdomain: qcom: rpmpd: Split SDM632 pm domains from
 MSM8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-sdm632-rpmpd-v1-2-6098dc997d66@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774642307; l=2887;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=oR9symPnOB8Q+3pHHyPrqBXlOh4cpvn5OEpbjN8X4bI=;
 b=/noeQJZnJ73g0ZbOPXWX9vLQIDdyxMzdqcKdYYRsiTqK5k2F/82P1F6eczClCRRPTWUIvl1rr
 wY1pq3awlRlAsQAeR1yof/tJBb1Z7A5vNCAG5GvyomL3i8gy7lsgELk
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(1.00)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100454-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A1DF34ADCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove modem related pm domains from MSM8953 rpmpd because MSM8953 MSS
is using mss-supply as regulator.
Split SDM632 rpmpd from MSM8953 because SDM632 MSS is using mss-supply
as pm domain.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/pmdomain/qcom/rpmpd.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/drivers/pmdomain/qcom/rpmpd.c b/drivers/pmdomain/qcom/rpmpd.c
index 15a11ff282c3..cff755306759 100644
--- a/drivers/pmdomain/qcom/rpmpd.c
+++ b/drivers/pmdomain/qcom/rpmpd.c
@@ -503,19 +503,8 @@ static struct rpmpd md_s1a_corner_ao = {
 	.key = KEY_CORNER,
 };
 
-static struct rpmpd md_s1a_lvl_ao;
 static struct rpmpd md_s1a_lvl = {
 	.pd = { .name = "md", },
-	.peer = &md_s1a_lvl_ao,
-	.res_type = RPMPD_SMPA,
-	.res_id = 1,
-	.key = KEY_LEVEL,
-};
-
-static struct rpmpd md_s1a_lvl_ao = {
-	.pd = { .name = "md_ao", },
-	.peer = &md_s1a_lvl,
-	.active_only = true,
 	.res_type = RPMPD_SMPA,
 	.res_id = 1,
 	.key = KEY_LEVEL,
@@ -703,13 +692,11 @@ static const struct rpmpd_desc msm8917_desc = {
 };
 
 static struct rpmpd *msm8953_rpmpds[] = {
-	[MSM8953_VDDMD] =	&md_s1a_lvl,
-	[MSM8953_VDDMD_AO] =	&md_s1a_lvl_ao,
-	[MSM8953_VDDCX] =	&cx_s2a_lvl,
-	[MSM8953_VDDCX_AO] =	&cx_s2a_lvl_ao,
-	[MSM8953_VDDCX_VFL] =	&cx_s2a_vfl,
-	[MSM8953_VDDMX] =	&mx_s7a_lvl,
-	[MSM8953_VDDMX_AO] =	&mx_s7a_lvl_ao,
+	[RPMPD_VDDCX] =		&cx_s2a_lvl,
+	[RPMPD_VDDCX_AO] =	&cx_s2a_lvl_ao,
+	[RPMPD_VDDCX_VFL] =	&cx_s2a_vfl,
+	[RPMPD_VDDMX] =		&mx_s7a_lvl,
+	[RPMPD_VDDMX_AO] =	&mx_s7a_lvl_ao,
 };
 
 static const struct rpmpd_desc msm8953_desc = {
@@ -844,6 +831,21 @@ static const struct rpmpd_desc qm215_desc = {
 	.max_state = RPM_SMD_LEVEL_TURBO,
 };
 
+static struct rpmpd *sdm632_rpmpds[] = {
+	[SDM632_VDDMD] =	&md_s1a_lvl,
+	[SDM632_VDDCX] =	&cx_s2a_lvl,
+	[SDM632_VDDCX_AO] =	&cx_s2a_lvl_ao,
+	[SDM632_VDDCX_VFL] =	&cx_s2a_vfl,
+	[SDM632_VDDMX] =	&mx_s7a_lvl,
+	[SDM632_VDDMX_AO] =	&mx_s7a_lvl_ao,
+};
+
+static const struct rpmpd_desc sdm632_desc = {
+	.rpmpds = sdm632_rpmpds,
+	.num_pds = ARRAY_SIZE(sdm632_rpmpds),
+	.max_state = RPM_SMD_LEVEL_TURBO,
+};
+
 static struct rpmpd *sdm660_rpmpds[] = {
 	[RPMPD_VDDCX] =		&cx_rwcx0_lvl,
 	[RPMPD_VDDCX_AO] =	&cx_rwcx0_lvl_ao,
@@ -948,6 +950,7 @@ static const struct of_device_id rpmpd_match_table[] = {
 	{ .compatible = "qcom,qcm2290-rpmpd", .data = &qcm2290_desc },
 	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
 	{ .compatible = "qcom,qm215-rpmpd", .data = &qm215_desc },
+	{ .compatible = "qcom,sdm632-rpmpd", .data = &sdm632_desc },
 	{ .compatible = "qcom,sdm660-rpmpd", .data = &sdm660_desc },
 	{ .compatible = "qcom,sm6115-rpmpd", .data = &sm6115_desc },
 	{ .compatible = "qcom,sm6125-rpmpd", .data = &sm6125_desc },

-- 
2.53.0


