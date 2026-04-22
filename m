Return-Path: <linux-arm-msm+bounces-104090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEFYDkmw6GldOwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:26:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C544546D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 210E2301DEC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE663CF687;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8gGNfkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB550376496;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857112; cv=none; b=NQ1W0D3B/6uPoYAsrSjbTWV1SCO28UpnM5cT3qjXSvt8oX7eT1zXvsoyVhN7z5tLKbTAsDxe5pgBlF8XNc18EhKl1CsXud0KBsoi6PHqEgi2riPLVN43cbCj+P7I5JPoYPrVCmraDVfs1Mppd4lE0/GUeG1OCyf6Ir1SNF9vPvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857112; c=relaxed/simple;
	bh=eBmp37Fh5ZTlSrodz8LYA7+9XM/VHH8EMneGh3WJBVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Up3lFu3Kuw5slrnankvHwNXtdPjG9anUct2SmosKbLlmRMfFWsWc52n1UUokTy29PzmMiLxMTQUjl3HF+Au5zUZV++LOzK/zQR8fTXOBY/YUNtNKZctM7YXAF1I8rT1rVbOFQnrDIdp4FwfoCMwpIlgN0gZ+ZNFXCl+/QA3jIas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8gGNfkD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 971F7C2BCB8;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776857112;
	bh=eBmp37Fh5ZTlSrodz8LYA7+9XM/VHH8EMneGh3WJBVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c8gGNfkDPhwuVFHuYlh7ySuag3bN2J3tGptEhSsinFDqvr3XJvL1IyhHtV8/rOdTo
	 QnLE7IzRCG7CjZkARPE1/EflVemx1Mo0qGrnWBPsEl86vet8nUmQrlUN98wywV+4eM
	 PShHqQuDvCUg21g5AkkTAcCEGUKh79iB0RpwUEP2uOM5uRFW0sSw+JfxzCMoDG8iVQ
	 GF0y8nlr8dMmSIyOKn078vni/xIVw/UwZVUt+lj9a3+ORaBDPhsS+HmutFsE8BBg/r
	 ujsJADzdFHtl8XiAnYekJhzxrziCZ6qN/u9qtRIV7jsKj0+boLzzi43FpDjMY6q38S
	 /mm0h/Wq7yKdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8596FF8FA87;
	Wed, 22 Apr 2026 11:25:12 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Wed, 22 Apr 2026 16:54:44 +0530
Subject: [PATCH 03/12] power: sequencing: qcom-wcn: Add support for
 'is_fixed()' callback to 'bluetooth' target
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-pwrseq-m2-bt-v1-3-720d02545a64@oss.qualcomm.com>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
In-Reply-To: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Shuai Zhang <quic_shuaz@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=OSA0rk78WdDSmkcO/t8XlaqhuYDC5RIPI2ByJSjXDI8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBp6LAVY4ZUMxgx8tEOqbhjBW009KzxqC7sLg0vT
 YkPI3/4rnmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaeiwFQAKCRBVnxHm/pHO
 9XLTCACmBOZ/6vCM4GiNJ4EAGBbpjMZp+nMbfjxiLoBS84VUGeB8Hj8Xoy1cIX1iWY4oEe2c2/D
 YkmNGMDuV4gDCUu4QClzMHbBZeBfAkOLRttaC2X+uY24y0qyyiBqW7zuZD+KyCY+/dtNooVG/8V
 t/nqfqoVvJAW1FXZ6yXL0G6rxs3RCZZv61pGlJf4jr7OOoc4RvTMTLXfiBqSaKvXFiuKNN60/bJ
 2/ERYv1EOw0+oo3S8KroevAAVwhTmM6JePXZpuqJZEizu+GBsRnA3CZOLAwoKl3x6MFjSTxv6nT
 NcYo1MoZvG8k7207e3Byz4wsXLkXTgGq68ShZY0sUYUDpVSb
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104090-lists,linux-arm-msm=lfdr.de,manivannan.sadhasivam.oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[manivannan.sadhasivam@oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:mid]
X-Rspamd-Queue-Id: C73C544546D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Add support for 'is_fixed()' callback to indicate the consumers whether
this power sequencer target 'bluetooth' is fixed or controllable. This is
decided based on the availability of the 'bt-enable' GPIO in DT.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b..50ac5973b8e7 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -254,10 +254,18 @@ static int pwrseq_qcom_wcn6855_xo_clk_deassert(struct pwrseq_device *pwrseq)
 	return pwrseq_qcom_wcn_pwup_delay(pwrseq);
 }
 
+static bool pwrseq_qcom_wcn_bt_is_fixed(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return !ctx->bt_gpio;
+}
+
 static const struct pwrseq_target_data pwrseq_qcom_wcn_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_fixed = pwrseq_qcom_wcn_bt_is_fixed,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
@@ -281,6 +289,7 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn6855_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn6855_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_fixed = pwrseq_qcom_wcn_bt_is_fixed,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn6855_wlan_target_data = {

-- 
2.51.0



