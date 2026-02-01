Return-Path: <linux-arm-msm+bounces-91401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKL7JZe/f2l9xAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 22:03:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D95BC73E5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 22:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61653300823A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 21:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AD602DA763;
	Sun,  1 Feb 2026 21:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="lWMYbOZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF9F2D8362
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 21:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769979792; cv=none; b=AIxJQZVtzkNsWNb2uYlEln2DTBIPb3DjTV+8k4320TMXa7CSgPHMytlGv0TjJUQeqhjPkPJk+Ml7wsaOyBi0f1kcJsi3J75daapo87Jiz0fdCoAPXlVxU4jhuI79qVT8FimMVP4J5/hHfc7DaMRyYtHum0AIPMCKeDi6g5BesbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769979792; c=relaxed/simple;
	bh=/d123QJwlwnm+81xoIwnPCzxnUTOHsxAUnQBf6PxC30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+by9aZ4mAowxrH8Qn+c/hRW1Tn+nWvZZ0zAXXTXGRRMOG+HlWGFBonn/fl5YMzHTn3HY8b9i7BTirorc7eiNLO2SgGTGeZV8D+eUFhk7KG09UYaFRlNUsBMHE+h0xtr4UoT62phBudpb2sMywtIDnKNERdFZa3eYuRqvtusxRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=lWMYbOZ2; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1769979777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kuitCu4pSs+CUaV73VIVWZ/YAk7l6y/DW+2oeYI3V1Q=;
	b=lWMYbOZ2FVWYsOBICOLuNVJH0wLKgEtL0g4kJ6wjX+Sp9F5MfiiQf76HShUtSlMlh0Mg15
	/k7p3o7quDapCVHJdxAJ7tBS/JKX/R5WCpYU5ZMb51s8OJrQWNpXDR062l3CPMf64SuBKc
	MPxsyBc7QMvoAu1cu2iSfi1CggJFGv2MYj8Pzr85fvl3S/62LmEJt+usKZAg7LsEH0ehAP
	9kMEx5VWpFC/40n+cvs5Qbe8fa9SQLb3eG/DhLFEGfNAXLq2V9ObdcByiQi3gfmwODBCeU
	A8y3RV8OE+/CG5k8OrMlEZrPDCW3J+jmuHg44uf0jtGMoarZyVvEJWkQpZF2Xg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	"Luca Weiss" <luca@lucaweiss.eu>,
	"Vladimir Lypak" <vladimir.lypak@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	"Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD regulators in v3
Date: Sun,  1 Feb 2026 17:55:03 -0300
Message-ID: <20260201210230.911220-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91401-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,google.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[packett.cool,gmail.com,lucaweiss.eu,mainlining.org,oss.qualcomm.com,lists.sr.ht,vger.kernel.org,lists.linux.dev];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D95BC73E5
X-Rspamd-Action: no action

The changes introduced to handle single power domain platforms have
swapped the info pointer increment from num_pd_vregs to num_pds, which
would shift the info pointer past the end of the array for pronto-v3,
which does not list power domain regulators in vregs.

This showed up as a difference between GCC- and LLVM-compiled kernels
on SDM632 devices, where only with LLVM one would get the
"regulator request with no identifier" error, because the out-of-bounds
memory ended up being zeroed. Fix by skipping the increment when there
are more power domains than regulators.

Signed-off-by: Val Packett <val@packett.cool>
---
v2: changed to detect the >= condition suggested by Konrad
v1: https://lore.kernel.org/all/20260126235018.969140-1-val@packett.cool/

"possible_pds" is the best name I could come up with (as "num" is already
taken by the number of *successfully attached* PDs and "max" is the constant
for the array length) for the count we're checking against. Maybe the "num"
could be changed to "attached" but that feels like too much diff.

~val
---

 drivers/remoteproc/qcom_wcnss.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index ee18bf2e8054..60f629b5bbed 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -441,25 +441,31 @@ static void wcnss_release_pds(struct qcom_wcnss *wcnss)
 }
 
 static int wcnss_init_regulators(struct qcom_wcnss *wcnss,
-				 const struct wcnss_vreg_info *info,
-				 int num_vregs, int num_pd_vregs)
+				 const struct wcnss_data *data)
 {
+	const struct wcnss_vreg_info *info = data->vregs;
 	struct regulator_bulk_data *bulk;
+	size_t i, possible_pds = 0, num_vregs = data->num_vregs;
 	int ret;
-	int i;
+
+	for (i = 0; i < WCNSS_MAX_PDS; i++)
+		if (data->pd_names[i])
+			possible_pds++;
 
 	/*
 	 * If attaching the power domains suceeded we can skip requesting
 	 * the regulators for the power domains. For old device trees we need to
 	 * reserve extra space to manage them through the regulator interface.
 	 */
-	if (wcnss->num_pds) {
+	if (possible_pds >= num_vregs) {
+		/* Do nothing if vregs do not include PD regulators (pronto-v3) */
+	} else if (wcnss->num_pds) {
 		info += wcnss->num_pds;
 		/* Handle single power domain case */
-		if (wcnss->num_pds < num_pd_vregs)
-			num_vregs += num_pd_vregs - wcnss->num_pds;
+		if (wcnss->num_pds < data->num_pd_vregs)
+			num_vregs += data->num_pd_vregs - wcnss->num_pds;
 	} else {
-		num_vregs += num_pd_vregs;
+		num_vregs += data->num_pd_vregs;
 	}
 
 	bulk = devm_kcalloc(wcnss->dev,
@@ -607,8 +613,7 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (ret && (ret != -ENODATA || !data->num_pd_vregs))
 		return ret;
 
-	ret = wcnss_init_regulators(wcnss, data->vregs, data->num_vregs,
-				    data->num_pd_vregs);
+	ret = wcnss_init_regulators(wcnss, data);
 	if (ret)
 		goto detach_pds;
 
-- 
2.52.0


