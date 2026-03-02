Return-Path: <linux-arm-msm+bounces-95010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCxiONK+pWn8FQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:46:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D11DD28D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9E9530A2963
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4CA421A0E;
	Mon,  2 Mar 2026 16:29:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4983E0C71;
	Mon,  2 Mar 2026 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468969; cv=none; b=ClKA7Bg95dyee/0QH9bd1WWFZ+DNBSbC9X1TxBIX7E+fqnIqAmwwkB8TIzWiDN0zIDuwVa/rb3BquioJqUUZH0ECmYKHpTdvLlssLMVhOHleqym9boTJriUzHG1hUcDuB49bB/Lo1JW1QJfJ8q+9cdD1MlzSKoaeRALGv35AjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468969; c=relaxed/simple;
	bh=NnNVhciZ+OeoyJYyEx22r9S20DC6u7nMNN6WCTZJ8xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsSxnBOmdCN0KLRwkC1hF/ixpPlIvRDRgpBm8vMrVj2nMs/yG6oGalb0zGDD599dH3Y++9/k9YN1mfumH5j2Fc5z3IohK1md0XoeasXWNYN43nBj5gccbuD5Gn6y50n0DCnB22WOyrX8IZtwqK/jl2HcFQMStvPz+cUAGBv9m6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BF7C2BC86;
	Mon,  2 Mar 2026 16:29:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ilia Lin <ilia.lin@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/7] cpufreq: airoha: Convert to of_machine_get_match()
Date: Mon,  2 Mar 2026 17:29:07 +0100
Message-ID: <cc76137755d93af982bf255095adafc7d523692c.1772468323.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772468323.git.geert+renesas@glider.be>
References: <cover.1772468323.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 313D11DD28D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-95010-lists,linux-arm-msm=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,vger.kernel.org,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Use the of_machine_get_match() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/cpufreq/airoha-cpufreq.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/cpufreq/airoha-cpufreq.c b/drivers/cpufreq/airoha-cpufreq.c
index b6b1cdc4d11d6962..3e7770860d13c8f4 100644
--- a/drivers/cpufreq/airoha-cpufreq.c
+++ b/drivers/cpufreq/airoha-cpufreq.c
@@ -115,15 +115,10 @@ MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
 
 static int __init airoha_cpufreq_init(void)
 {
-	struct device_node *np = of_find_node_by_path("/");
 	const struct of_device_id *match;
 	int ret;
 
-	if (!np)
-		return -ENODEV;
-
-	match = of_match_node(airoha_cpufreq_match_list, np);
-	of_node_put(np);
+	match = of_machine_get_match(airoha_cpufreq_match_list);
 	if (!match)
 		return -ENODEV;
 
-- 
2.43.0


