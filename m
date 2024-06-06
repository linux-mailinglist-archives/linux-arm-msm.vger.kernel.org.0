Return-Path: <linux-arm-msm+bounces-21995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0E8FF531
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 21:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00E131C22984
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 19:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8105B6CDBA;
	Thu,  6 Jun 2024 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="ufcDgmKq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768A64D13F;
	Thu,  6 Jun 2024 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717701529; cv=none; b=np28o2hagZ3fIhL6AT3pewUUgAUNcYw10zVwRziV1Q+dibw1KS4T0O57M9KYAksaIuI2m0IR3fUUec4wrDGhklKAM4NEeHk/YgvfgBd5hQy0DsasWw5CpzBSqvY/1UL61dbjD7vfVNwTFKU8CYWKdASHvZ0hNdleRka1MOqVBfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717701529; c=relaxed/simple;
	bh=YIfSYI9EIXoslwT+D0IciwYGUf4uGYA5uUUy4+mGv2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H38LrXdTyftRopW9VctMlAW+wu0HNOMGGHao89Fil/EUOW27yrpaKZ1blfRyRIy+qlBA/ZkWEBFpna7AwBBMdUSSsLKRqUM6iqAetv/6EIKvZHSiYJJyFA0F6zt9oV1zTFdBfu28ITI8cg9bmOTg8AERANE9IbjjrAZ15yuntiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=ufcDgmKq; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1717701525; bh=YIfSYI9EIXoslwT+D0IciwYGUf4uGYA5uUUy4+mGv2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ufcDgmKqxSMA4MJen+NboZ9xOFLtO2Ac5dpSg3rGNEzTxQqjgfyyMrT/c7MqOE7x1
	 c9u8kRQDPFlS0ke50LwazvT0MxsoUC7bUHhjCIiyIyGGvXnt67CwbeucnYhaqrVWi1
	 4MCFFp7a6WTstfXpDcHg8miMHALcTCnIv3TGhTBA=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Thu, 06 Jun 2024 21:18:33 +0200
Subject: [PATCH v2 2/2] soc: qcom: smsm: Support using mailbox interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-smsm-mbox-v2-2-8abe6b5f01da@z3ntu.xyz>
References: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
In-Reply-To: <20240606-smsm-mbox-v2-0-8abe6b5f01da@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4231; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=YIfSYI9EIXoslwT+D0IciwYGUf4uGYA5uUUy4+mGv2s=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBmYguUfB3hqtyvpAqEV2xW7ahsFiuT8cPSvzInV
 IhED0DP1RuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZmILlAAKCRBy2EO4nU3X
 VlUFEAC5t52j88cvSenHRfm9XfPfZE3xjUp2HMjOnbv3Odg2anEbAPuA2p2QrsGlM87h5r/Rm7G
 4AcuaJRMVyHpQP/l6DLC90gnEh4+GZcQw/M7/ubW+T6l6tFdCQa+T/bo15qJ56UgI+ZCHk1uXIp
 nR8AQoe0kcG6iEiBCAwOgQmTaP4tIG8FTrfJrA3/PC8hgUEZRVEAMA4MmSqulRV6UIKxc6vw6H+
 F27vG7cwRjCgFJilb2SjFj0oDSDcoHf+T5ynhDtjjbL8azakVp9GG5ANFHAjpYlHyI5LdP7GotB
 CHtXPBcu2L11RX1xEk8TTE9awglMk+w/rON8kX6gJ9eRLY/bkzSiRusRayWWjkM5hjf2hqytJaI
 gz5ZUAkV0d9QXnIuUZ597U9BHiNBPMEN03kxMfgW0Co8fnl/3G2gxOA5lkW0Xd+GRMSEh07Kt5W
 DQwnhsUNtP3ZN/bf1x7RE3DV//09G9X1nY/Eh14uHv2gfSRyjIxo/KYLo2z3CsGzOU/PD9E64Pj
 qf6PWXYwtVlAJDy6w6qke2RM0o0j/4W7dnKyccBKEvd4APxcUpOqxlkCGH1V/zKRPTK0HOt7ZGM
 N4Y+Nimu3CWUqY5Vx+OIxueJXZztRFZ3dgEPhO/4ZtG/XC5qwN85n4ItyPKxjC75v/yk93B0gtt
 3G/FQ5JWI0Jao0A==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add support for using the mbox interface instead of manually writing to
the syscon. With this change the driver will attempt to get the mailbox
first, and if that fails it will fall back to the existing way of using
qcom,ipc-* properties and converting to syscon.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/soc/qcom/smsm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index e7c7e9a640a6..ffe78ae34386 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/interrupt.h>
+#include <linux/mailbox_client.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
@@ -71,6 +72,7 @@ struct smsm_host;
  * @lock:	spinlock for read-modify-write of the outgoing state
  * @entries:	context for each of the entries
  * @hosts:	context for each of the hosts
+ * @mbox_client: mailbox client handle
  */
 struct qcom_smsm {
 	struct device *dev;
@@ -88,6 +90,8 @@ struct qcom_smsm {
 
 	struct smsm_entry *entries;
 	struct smsm_host *hosts;
+
+	struct mbox_client mbox_client;
 };
 
 /**
@@ -120,11 +124,14 @@ struct smsm_entry {
  * @ipc_regmap:	regmap for outgoing interrupt
  * @ipc_offset:	offset in @ipc_regmap for outgoing interrupt
  * @ipc_bit:	bit in @ipc_regmap + @ipc_offset for outgoing interrupt
+ * @mbox_chan:	apcs ipc mailbox channel handle
  */
 struct smsm_host {
 	struct regmap *ipc_regmap;
 	int ipc_offset;
 	int ipc_bit;
+
+	struct mbox_chan *mbox_chan;
 };
 
 /**
@@ -172,7 +179,13 @@ static int smsm_update_bits(void *data, u32 mask, u32 value)
 		hostp = &smsm->hosts[host];
 
 		val = readl(smsm->subscription + host);
-		if (val & changes && hostp->ipc_regmap) {
+		if (!(val & changes))
+			continue;
+
+		if (hostp->mbox_chan) {
+			mbox_send_message(hostp->mbox_chan, NULL);
+			mbox_client_txdone(hostp->mbox_chan, 0);
+		} else if (hostp->ipc_regmap) {
 			regmap_write(hostp->ipc_regmap,
 				     hostp->ipc_offset,
 				     BIT(hostp->ipc_bit));
@@ -352,6 +365,28 @@ static const struct irq_domain_ops smsm_irq_ops = {
 	.xlate = irq_domain_xlate_twocell,
 };
 
+/**
+ * smsm_parse_mbox() - requests an mbox channel
+ * @smsm:	smsm driver context
+ * @host_id:	index of the remote host to be resolved
+ *
+ * Requests the desired channel using the mbox interface which is needed for
+ * sending the outgoing interrupts to a remove hosts - identified by @host_id.
+ */
+static int smsm_parse_mbox(struct qcom_smsm *smsm, unsigned int host_id)
+{
+	struct smsm_host *host = &smsm->hosts[host_id];
+	int ret = 0;
+
+	host->mbox_chan = mbox_request_channel(&smsm->mbox_client, host_id);
+	if (IS_ERR(host->mbox_chan)) {
+		ret = PTR_ERR(host->mbox_chan);
+		host->mbox_chan = NULL;
+	}
+
+	return ret;
+}
+
 /**
  * smsm_parse_ipc() - parses a qcom,ipc-%d device tree property
  * @smsm:	smsm driver context
@@ -521,8 +556,16 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 			     "qcom,local-host",
 			     &smsm->local_host);
 
+	smsm->mbox_client.dev = &pdev->dev;
+	smsm->mbox_client.knows_txdone = true;
+
 	/* Parse the host properties */
 	for (id = 0; id < smsm->num_hosts; id++) {
+		/* Try using mbox interface first, otherwise fall back to syscon */
+		ret = smsm_parse_mbox(smsm, id);
+		if (!ret)
+			continue;
+
 		ret = smsm_parse_ipc(smsm, id);
 		if (ret < 0)
 			goto out_put;
@@ -609,6 +652,9 @@ static int qcom_smsm_probe(struct platform_device *pdev)
 
 	qcom_smem_state_unregister(smsm->state);
 out_put:
+	for (id = 0; id < smsm->num_hosts; id++)
+		mbox_free_channel(smsm->hosts[id].mbox_chan);
+
 	of_node_put(local_node);
 	return ret;
 }
@@ -622,6 +668,9 @@ static void qcom_smsm_remove(struct platform_device *pdev)
 		if (smsm->entries[id].domain)
 			irq_domain_remove(smsm->entries[id].domain);
 
+	for (id = 0; id < smsm->num_hosts; id++)
+		mbox_free_channel(smsm->hosts[id].mbox_chan);
+
 	qcom_smem_state_unregister(smsm->state);
 }
 

-- 
2.45.2


