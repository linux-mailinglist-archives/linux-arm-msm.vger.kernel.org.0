Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7450240F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 21:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729520AbgHJTWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 15:22:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728615AbgHJTND (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 15:13:03 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD6E8207FF;
        Mon, 10 Aug 2020 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597086782;
        bh=zU3gqLY6kXCnvnQO33yxmEPVxLImmHnlbLEUlpmEZko=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bxQjQvEImmUWKX5MXcvIP3DMT/dXh5+URzZKcO/JVXk/1fZo+iebzbYwoHS3f68ye
         mCE2ft73xPeHE69tSpvqN49/U7pVYZDorEj14F5H2nEZWKIYIpyaBfJAH+5ztxvMe/
         H5xo4Kt0SPMisJ58uawxT54sok1lOA6KiOmkJfpo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/31] soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
Date:   Mon, 10 Aug 2020 15:12:30 -0400
Message-Id: <20200810191259.3794858-2-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810191259.3794858-1-sashal@kernel.org>
References: <20200810191259.3794858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

[ Upstream commit 1a53ce9ab4faeb841b33d62d23283dc76c0e7c5a ]

rpmh-rsc driver is fairly core to system and should not be removable
once its probed. However it allows to unbind driver from sysfs using
below command which results into a crash on sc7180.

echo 18200000.rsc > /sys/bus/platform/drivers/rpmh/unbind

Lets prevent unbind at runtime by setting suppress_bind_attrs flag.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Link: https://lore.kernel.org/r/1592808805-2437-1-git-send-email-mkshah@codeaurora.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 3c6f920535eae..519d19f57eee2 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -715,6 +715,7 @@ static struct platform_driver rpmh_driver = {
 	.driver = {
 		  .name = "rpmh",
 		  .of_match_table = rpmh_drv_match,
+		  .suppress_bind_attrs = true,
 	},
 };
 
-- 
2.25.1

