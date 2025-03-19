Return-Path: <linux-arm-msm+bounces-51916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E071BA68830
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE1844233D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD4225486E;
	Wed, 19 Mar 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfXLsQ3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884BA25486D;
	Wed, 19 Mar 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376717; cv=none; b=Ji6fmtOUEw8duLzH2s8eVwGCj0FxH0i5cTROTso2dtB1b2rM59TfE/bKhQaDbDQTjo2s1MU/K0YuwriVi12lxXTxuiLwu1iRShILnydZQKvTgFvlgcxeJgtc2vEEHZlwCSrxSR91jvdsYMLVah57H0mfQBgaNBbFSl0M4RUhk/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376717; c=relaxed/simple;
	bh=P6sjrUHXsoaSHeq3CPkjoBE3d6J1juF5K3BefowhNh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FuFJLOw5qgESGIu4Rcz1tlLj5N8CoYouneIueDjZ+Si7mnKTyn7x+xA9FQTrJmeH8AU06SMYIle3sum73kGMRNsKCze3fMYCfe10A659OE1N2HOEQbtxs5nCLWBznX6S4LHkmFWVz7vzB0MZpTSpoNO4AeWKHX6Gk5KXc1LHI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfXLsQ3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3C3C4CEF2;
	Wed, 19 Mar 2025 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376717;
	bh=P6sjrUHXsoaSHeq3CPkjoBE3d6J1juF5K3BefowhNh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfXLsQ3ZnczG0sKBKJ+DvST6vAjMbjKz8guv23LSY6x6jwTzi5wjMZYwSAQvDdT6p
	 oxQ39/hBr84fSvuzqc08/LV44EgDOD9ir1nQCIoK3sHqwqoHSfAKh9K3CAwgBPlcUk
	 fIQjCoD0E3QLa3yyketenltkK/TRjJ1kfizyNUsMG7TM5k/gbhZy2SG+LAV9Yct/ao
	 oH7mX2uKZ5H6GUDCIgFbMlAUJjFO3+wV6e1fEdPmWPdPR5fvI7Hr3QZ33eQnidNNha
	 Zunf+dgnfKa3u7ZHazwkkocGVa6Eg7TIjMovXfqDPNvbKLIcCvJVnYNBHnd11Xs2cr
	 GBtT4E2YmfGfA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 22/57] irqdomain: mailbox: Switch to irq_domain_create_tree()
Date: Wed, 19 Mar 2025 10:29:15 +0100
Message-ID: <20250319092951.37667-23-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_tree() is going away as being obsolete now. Switch to
the preferred irq_domain_create_tree(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/mailbox/qcom-ipcc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 0b17a38ea6bf..ea44ffb5ce1a 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -312,8 +312,8 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ipcc->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
-					       &qcom_ipcc_irq_ops, ipcc);
+	ipcc->irq_domain = irq_domain_create_tree(of_fwnode_handle(pdev->dev.of_node),
+						  &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
 
-- 
2.49.0


