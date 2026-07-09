Return-Path: <linux-arm-msm+bounces-117931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QP4xKo9nT2pZgAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:19:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2AE72ED36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:19:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=FdS3QyIS;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117931-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117931-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E43A7301831C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942A6402BA9;
	Thu,  9 Jul 2026 09:18:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A125402428;
	Thu,  9 Jul 2026 09:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588717; cv=none; b=V0+2Yd7H7HZIDT2AAr68K3eblhsAuyBiHcu7Xaufm3Ba1uR/mOoXZao6uTiQjc2Y3kZF1St1QNIyIBMqVsApR8R2hET6BDnabG30Z/JrhA8mW5C3my0zAOPEK198MG32k4gajtCnacH3TpeYyXDgQOSjOcaMx5WBYlOph7qRlG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588717; c=relaxed/simple;
	bh=UoFIcZbz1LUD4F5XO7XFPgbRLJ5n0BlyYnghXViYBkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FqkoIIGtl+g3S1jbvdtFfKDUzwjbbV2oYMNaq8c97Z0Ipnrn8/VdyDX68IX/xtENY98/hs59epfmH4p37NPkPauRCCGC2gYa8tn9cbGOwVRNB9ZPwEGcLKCzJF6GjTc6T/V5AFdRk0owg4bgup1qZ2tBttFjrdMvwnkhjMvmmRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdS3QyIS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73B77C2BCF6;
	Thu,  9 Jul 2026 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783588716;
	bh=UoFIcZbz1LUD4F5XO7XFPgbRLJ5n0BlyYnghXViYBkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FdS3QyIS3dLSwHkK5r5dZsiZzNP+dqTMRMdnQZYGV62uWdFuRfSAYzcQHzp6UwKro
	 NZj850h8bd8lKSbU3uUWfxEak+A5xTYJHGO4YffOSt/d+vuhxQuAqCai+ZyZSXlOMI
	 5426cO5ZSybDqH2TnfkY+4+qEhpuIRfc1zDGQoMosf7LjM6WzpNeECzw8JcfmaXuXI
	 iDsSljAzn0U3/bomMFQMGG0uSIrQtuc0oLErFN/lKcK/LrLz54DJ6GFiajCKfJjzUI
	 splS3cUgDxXE40o80lKRYrzlvd++OFTWB6TE7r/bHDnB/0UMFR4l6clz+ES7XimOGS
	 ziLO7c/e0P/FA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FDAC44507;
	Thu,  9 Jul 2026 09:18:36 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 09 Jul 2026 13:18:29 +0400
Subject: [PATCH v5 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ipq5018-bluetooth-v5-3-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
In-Reply-To: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783588713; l=3620;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=u0gOwnns2dy73DhacPBFtWDJn2o2hoZyiU32Aiq9TKY=;
 b=QSmixR6PelWGtteCHARWekHulHjLopZMK/Y9DdAws/h8+kj+B0qJvFI+JAuh+vd95v4s2Nigk
 8NPNEXqFqv1A+qJymHg6+KwQCYw1wyxgncP8HpaImsph50QjyHYhtcF
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117931-lists,linux-arm-msm=lfdr.de,george.moussalem.outlook.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:george.moussalem@outlook.com,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_REPLYTO(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,pengutronix.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,outlook.com:replyto,outlook.com:mid,outlook.com:email];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[george.moussalem@outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F2AE72ED36

From: George Moussalem <george.moussalem@outlook.com>

The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
modes which are required to be configured through a Secure Channel
Manager (SCM) call to TrustZone. However, not all Trusted Execution
Environment (QSEE) images support this call, so first check if the call
is available.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 44 ++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.h       |  1 +
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 46 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..d51e3f4339d8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1094,6 +1094,50 @@ bool qcom_scm_pas_supported(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_supported);
 
+/**
+ * qcom_scm_pas_set_bluetooth_power_mode() - Configure power mode for the
+ *					     Bluetooth subsystem (BTSS)
+ * @pas_id:	peripheral authentication service id
+ * @eco_mode:	true for ECO mode, false for normal operation
+ *
+ * Return: 0 on success, negative errno on failure.
+ * Returns -EOPNOTSUPP if the firmware configuration call is unavailable.
+ */
+int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, bool eco_mode)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_BT_PWR_MODE,
+		.arginfo = QCOM_SCM_ARGS(2),
+		.args[0] = pas_id,
+		.args[1] = eco_mode ? 0x4 : 0x0,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					  QCOM_SCM_PIL_PAS_BT_PWR_MODE))
+		return -EOPNOTSUPP;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret ? : res.result[0];
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_set_bluetooth_power_mode);
+
 static int __qcom_scm_pas_mss_reset(struct device *dev, bool reset)
 {
 	struct qcom_scm_desc desc = {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..5579df5a2aca 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..aca937ac8ddd 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -93,6 +93,7 @@ struct resource_table *qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *c
 						  size_t *output_rt_size);
 
 int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
+int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, bool eco_mode);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.53.0



