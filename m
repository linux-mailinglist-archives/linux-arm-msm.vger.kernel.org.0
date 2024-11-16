Return-Path: <linux-arm-msm+bounces-38116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 176FE9CFF2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 14:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8545E1F23F19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2024 13:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6A3B666;
	Sat, 16 Nov 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXWv3KwF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BEE944F;
	Sat, 16 Nov 2024 13:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731764684; cv=none; b=p5Ye8usdhYV8nPFt3ICb8b3AaQZTbLMhh22yWBRTkLi+NldbnqTS1X5m9lm3khzwPOIOVZvZ5Hrulofa58wX/ckRKN3CfDwDAekPiDKLKQDJJ8bzG5vnejBwNyWGKGRpNsWCjigIpBhQ16hxW9Alrp2ugpv26JH0el8bSeuyiXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731764684; c=relaxed/simple;
	bh=HhtLUsb654ZQOuW2FDVmg3FavvWRw+N0GDscUTOwVBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dcVHENsHi/ImucGdHVVeI94N9SrNNfqlz4uG3WoQ1tN2uVKW9qLFmrNK0U/FtUb8jE9qRubIuJK1zKMLCyTdWOUuZeLhzJoMeaPSh+3zN8u15jgRKRlphcaBE00XLllDSivAv5nBeBA8an6syBifGleybswsw4hCz4z2bQ/sac4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXWv3KwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6084FC4CEC3;
	Sat, 16 Nov 2024 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731764683;
	bh=HhtLUsb654ZQOuW2FDVmg3FavvWRw+N0GDscUTOwVBc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UXWv3KwFtbuT+28qYI0joi01k+l/Dk+ektKpUlHaVY/bxxA9XfFbFoiWwxtKaU8nN
	 MrdF4LGeHI7qZCYqxDJgnYK21nn2fslDMUPxDIc+e1GO3GCE0FW1SJglStH+ZvzOzx
	 IQBn+oC799CwfIbxl9ZtqIUEjoOg3WIlUXWgeCjYGInyPnn3K0S8RVcx4//X6iJ3TF
	 jvMejy5KM/KuKqcr2pj9ocw+zDxsNb45DTmqHGUhYJqSVsjLMOhF4zCi662tGUovaK
	 7Hc0UQSHq5pgvN3HX/s7ArFY7daJU656oiMamKjcsZqUkyx4bLkgNMtmu7KomEH20A
	 qb815EN4/Vu0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5700DD68BED;
	Sat, 16 Nov 2024 13:44:43 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maud_spierings.hotmail.com@kernel.org>
Date: Sat, 16 Nov 2024 14:44:39 +0100
Subject: [PATCH] firmware: qcom: scm: Allow QSEECOM on the asus vivobook
 s15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241116-add_asus_qcom_scm-v1-1-5aa2b0fb52bd@hotmail.com>
X-B4-Tracking: v=1; b=H4sIAMahOGcC/x3MSwqAMAwA0atI1hZM1QpeRaTUNmoW/hoUQby7x
 eVbzDwgFJkE2uyBSBcLb2sC5hn42a0TKQ7JoAtdIaJRLgTr5BR7+G2x4heFZWO8HmpjkCB1e6S
 R7//Z9e/7AcLp1DFjAAAA
X-Change-ID: 20241116-add_asus_qcom_scm-1376c2b5661e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731764682; l=1061;
 i=maud_spierings@hotmail.com; s=20241110; h=from:subject:message-id;
 bh=LGt2vVLNhgxRFLVYlxRxtn5kjW0oNXk/G6bF1cNREYc=;
 b=Xi/cjvg8PRVTuBhZbAHv+dX7ue1iv3nEv5wUfqWK5n1IHHZCz2+aEiz5Q3N8FgYO+XMG+dnPO
 tvK5hXdJNeIDgfZs1hqIDn15/4uV0jYifYgQSHP85IPFug76cJcnVNU
X-Developer-Key: i=maud_spierings@hotmail.com; a=ed25519;
 pk=CeFKVnZvRfX2QjB1DpdiAe2N+MEjwLEB9Yhx/OAcxRc=
X-Endpoint-Received: by B4 Relay for maud_spierings@hotmail.com/20241110
 with auth_id=273
X-Original-From: Maud Spierings <maud_spierings@hotmail.com>
Reply-To: maud_spierings@hotmail.com

From: Maud Spierings <maud_spierings@hotmail.com>

Add the asus vivobook s15 to the compatible list to allow access to
efivars

Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969834609cda2aa915b67505e93943..0bdfe64a0ff009c38720692fe60d9f13342181a9 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1768,6 +1768,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },

---
base-commit: 744cf71b8bdfcdd77aaf58395e068b7457634b2c
change-id: 20241116-add_asus_qcom_scm-1376c2b5661e

Best regards,
-- 
Maud Spierings <maud_spierings@hotmail.com>



