Return-Path: <linux-arm-msm+bounces-60947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C053DAD5276
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 12:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D87AD1783FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1531527CCF2;
	Wed, 11 Jun 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP7fKOdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320C274669;
	Wed, 11 Jun 2025 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638660; cv=none; b=H+LHhsrtk/2LcypFRCOffSnAoy0+q34YiWajzLdPLP7Fl+wfhVqdTO7jXLAZqCOZXDOfhWiuIhozOjxAFAZokstouv3qR4Hq0t1CfncKqQZWOv3IPW/CPC52kCd0ag/4AEWDNQVqXlUCQlFo5Mmu7DCYlPxlXnLaZ0Sndg3l2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638660; c=relaxed/simple;
	bh=pnc3d+gMXnpW4TZwMhStpkdcTGyFdZYjVGxIXZRQG88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6eQODh1ATgheWpSdoFIhzNqDdIpdEaNYFl1krtdTEpWdSf3YwC7xm5i+5KzX/MmM911gqW5lA/nnQasK+eUVXfwnx/xAq199SRdX0M1zou7R8pkTTvI2YOf6dOPEcfZFhjbtvUrJMxayUPGPNGUnd2AtqvYBwEYh5yHbp2QqiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP7fKOdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E4EC4CEF2;
	Wed, 11 Jun 2025 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638658;
	bh=pnc3d+gMXnpW4TZwMhStpkdcTGyFdZYjVGxIXZRQG88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mP7fKOdDzKtdsEQSL2k3Jqa/XiJsQcS1d3ZdzlES71aGVn8VMeELEqJn61B5FrmL7
	 wiBzLrk2MdEkkKNF0/EsBXDJsOzzhgY65jSYu2ja5XFRq97XLxH0x+W3D0H89mHmbr
	 AMnOZy9SZESV0CUq5DymFYA5NWFos053MWM2EHffQJ1tJfrMNaghxUfjf08T5Q0C/G
	 bH9O/43yWK19cJ1Lta1oxFjiOZ8ztSqMK2+sLGGkxCkWfjFYIWB5m0Pv5/6k6lR3xN
	 b+IhnrE3E/49hZYPLI0MSX5My45kMjPg/UWACJ6B8lU27sxy8nGVGIp9V4WRCd1U/6
	 +RCWYTMXucFDA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] mailbox: Use dev_fwnode()
Date: Wed, 11 Jun 2025 12:43:39 +0200
Message-ID: <20250611104348.192092-11-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611104348.192092-1-jirislaby@kernel.org>
References: <20250611104348.192092-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_create_simple() takes fwnode as the first argument. It can be
extracted from the struct device using dev_fwnode() helper instead of
using of_node with of_fwnode_handle().

So use the dev_fwnode() helper.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>

---
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/mailbox/qcom-ipcc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index ea44ffb5ce1a..d957d989c0ce 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -312,8 +312,7 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (!name)
 		return -ENOMEM;
 
-	ipcc->irq_domain = irq_domain_create_tree(of_fwnode_handle(pdev->dev.of_node),
-						  &qcom_ipcc_irq_ops, ipcc);
+	ipcc->irq_domain = irq_domain_create_tree(dev_fwnode(&pdev->dev), &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
 		return -ENOMEM;
 
-- 
2.49.0


