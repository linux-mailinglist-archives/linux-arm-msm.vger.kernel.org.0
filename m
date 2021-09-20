Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B54341127F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 12:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhITKD7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 06:03:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229724AbhITKD5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 06:03:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E778E60F21;
        Mon, 20 Sep 2021 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632132150;
        bh=j+65ykJsuA5Lerqbgf8aNZsPTj8hxTeq+qTIGibjbkY=;
        h=From:To:Cc:Subject:Date:From;
        b=bgQFmz34yrdI8TzeTudfzqusLhuG9oRl6keiRv3QB4jwHVeCp/Rx14Ic258DbvJw2
         /kelchclVckYFghy9CXx2GD5pjSyYj/dSgm2EUCrH6LYhgbnNPAob93QcOUexGICS2
         rXwIsvSYp06IzmiyrNGFfozPL4w3pBaCFmdhH+0R8FC4zQORfqVMhF6WxReZy/dORd
         cj4UXcwx9epzhcyiwIZISB/0DkaBJZk3bt/9xF9oNcYS28y4PqAwPwtmyMGDLbP3/u
         OmbzBqEAUr8/6McDewWRm3YcRXnfRI57YRDDN5NBqb6Vp9INI8As/LIB1Cfr6yt7Ad
         8u1uvVvoxk+fQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Niklas Cassel <nks@flawful.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        John Stultz <john.stultz@linaro.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] PM: AVS: qcom-cpr: select CONFIG_NVMEM
Date:   Mon, 20 Sep 2021 12:02:21 +0200
Message-Id: <20210920100226.1448267-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

nvmem_cell_read_variable_le_u32 is only defined when CONFIG_NVMEM
is set, otherwise we end up with this build failure:

drivers/soc/qcom/cpr.c: In function 'cpr_populate_ring_osc_idx':
drivers/soc/qcom/cpr.c:814:23: error: implicit declaration of function 'nvmem_cell_read_variable_le_u32' [-Werror=implicit-function-declaration]
  814 |                 ret = nvmem_cell_read_variable_le_u32(drv->dev, fuses->ring_osc, &data);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Select the framwork from Kconfig.

Fixes: 6feba6a62c57 ("PM: AVS: qcom-cpr: Use nvmem_cell_read_variable_le_u32()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 79b568f82a1c..faf372c0fc71 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -29,6 +29,7 @@ config QCOM_COMMAND_DB
 config QCOM_CPR
 	tristate "QCOM Core Power Reduction (CPR) support"
 	depends on ARCH_QCOM && HAS_IOMEM
+	select NVMEM
 	select PM_OPP
 	select REGMAP
 	help
-- 
2.29.2

