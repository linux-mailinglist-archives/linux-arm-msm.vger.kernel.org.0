Return-Path: <linux-arm-msm+bounces-92622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIvzCrDojGnquwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C21D12772A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 21:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C6C473013DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046E3353EDC;
	Wed, 11 Feb 2026 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c81J7d/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF637286D63;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770842284; cv=none; b=Jbxn79gCfJLL9II1zMWbbW3X32DQQBBakTvtA3meBnJu5dYBVATZ1s/2fijVkvdnnpJ8UNPaverQkam3gM2KqEa3SRqD8j1yv5Q/qJKnWr3no+c3XrImxljWMtmTeKR2VcwxKEcmRmmVfsKLaeEZ6CXrQXPvu114kC6UagPnh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770842284; c=relaxed/simple;
	bh=1dLjLTIEpbDqXWRfa+qVC802fJio3tAYmVyuiH+viEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9LPB2K+oTp+BfrTQAYnpmST2uU7/yJliGYoL00yfB4fIXwPqFcJUBHXYSu/P5h4snY+0Y6FiV9pVT4FB/lFqJGHDwrLBhlxdG79f21tSpebP8y8eqj92/YpbCJEoRhGkJv0y2XbG1p3jAcl9axr0Jc02winCuVrb92KcFHImN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c81J7d/j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 958CAC2BC87;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770842284;
	bh=1dLjLTIEpbDqXWRfa+qVC802fJio3tAYmVyuiH+viEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c81J7d/jSRzwEqJtpQL9MYygE2MhIZ5ozkfDYsa4O5B3xkWBfhVM1ixRg0ifjRJ4P
	 zJ5697AawpqvAuj4kMSUOLMRS6Eeo9Huz+sJ4f75j5dVorXfyh7pHrsUDGNWILC/sH
	 j79dMOCw/UGzpbli1h7dhIH98f99+rg0y97AVue05sooJ9UgXX13HbUAS++JDKxRso
	 6FT1A7iTchIUeVJ8rsm1jdiS4pfVj3EK8bAiLzC7Yz+8CRCRYRF3lvqcW0AOYy1tDi
	 +H+IUZ8sxGjTrx8oi8mhgBdGBOttY+ohUaCQdIUO1WHlVoMDsFJq7EymAczITMuCcQ
	 B4ACE3DTZh3Bg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738C3ECD6D6;
	Wed, 11 Feb 2026 20:38:04 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 11 Feb 2026 21:37:51 +0100
Subject: [PATCH v2 2/4] firmware: qcom: scm: allow QSEECOM on ASUS Vivobook
 X1P42100 variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-b4-vivobook-v2-2-9f500415d2ed@oldschoolsolutions.biz>
References: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
In-Reply-To: <20260211-b4-vivobook-v2-0-9f500415d2ed@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 "Colin K. Williams" <colin@li-nk.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770842282; l=985;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tF0yL9g/LpNrXUgoxuX8liwiZOuYk95seFYSRj/YEiI=;
 b=VwwTjjLzM/5MN1rf4SCQXl5HvG2e020MumPyEF4TUkcMUCZAKMxKBt3h5iGlGWOAzVPLLlkkT
 oWS3vnfbgNYCrOxv8+V0dbZh8cX46/i8K7weXpgFBjieY4m6Zs5zz1L
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92622-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,hotmail.com,li-nk.org,oldschoolsolutions.biz,oss.qualcomm.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,oldschoolsolutions.biz:mid,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto,li-nk.org:email]
X-Rspamd-Queue-Id: 8C21D12772A
X-Rspamd-Action: no action

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Enables access to EFI variables on this machine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Colin K. Williams <colin@li-nk.org>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 8fbc96693a55f53c508d1ddb2d7a9e62281d1544..2fe1632f06e908683ba2841d68f9d382f407a425 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2290,6 +2290,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
+	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
 	{ .compatible = "dell,inspiron-14-plus-7441" },

-- 
2.51.0



