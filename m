Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53BE16C7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfEGUll (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:41 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52914 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbfEGUky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:40:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E144461154; Tue,  7 May 2019 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261653;
        bh=/5F8HTO9iokGlCSR/1R6LYbndmC6HaerDlTRHeo0W9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fzF5U/ukwM5O2da73I+4UGIzWqC4gckWJHSxIkmdV6f8YM2PSNA2nPC4pNjPMJBfn
         R2XOHEIl8IAWAEf2eOfEQgxhMEm2cholA1/lYXD0A4US9bTzDSvBaUaTiyPv/iviaN
         I3Zs26VLBNdAXF6kh8+GTw3mT0DeBB2NWRqTQWb0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6189260E3E;
        Tue,  7 May 2019 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261653;
        bh=/5F8HTO9iokGlCSR/1R6LYbndmC6HaerDlTRHeo0W9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fzF5U/ukwM5O2da73I+4UGIzWqC4gckWJHSxIkmdV6f8YM2PSNA2nPC4pNjPMJBfn
         R2XOHEIl8IAWAEf2eOfEQgxhMEm2cholA1/lYXD0A4US9bTzDSvBaUaTiyPv/iviaN
         I3Zs26VLBNdAXF6kh8+GTw3mT0DeBB2NWRqTQWb0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6189260E3E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 03/11] irqdomain: add bus token DOMAIN_BUS_WAKEUP
Date:   Tue,  7 May 2019 14:37:41 -0600
Message-Id: <20190507203749.3384-4-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A single controller can handle normal interrupts and wake-up interrupts
independently, with a different numbering space. It is thus crucial to
allow the driver for such a controller discriminate between the two.

A simple way to do so is to tag the wake-up irqdomain with a "bus token"
that indicates the wake-up domain. This slightly abuses the notion of
bus, but also radically simplifies the design of such a driver. Between
two evils, we choose the least damaging.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v4:
	- Update commit text
---
 include/linux/irqdomain.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 61706b430907..4eaf17dfd2f8 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -82,6 +82,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_NEXUS,
 	DOMAIN_BUS_IPI,
 	DOMAIN_BUS_FSL_MC_MSI,
+	DOMAIN_BUS_WAKEUP,
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

