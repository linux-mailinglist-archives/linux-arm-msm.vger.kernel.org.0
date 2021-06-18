Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDAB03ACD60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 16:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbhFROVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 10:21:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232052AbhFROU7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 10:20:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC299611B0;
        Fri, 18 Jun 2021 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624025930;
        bh=9NWfv8SOUC1sTwGhgAi0WHOSRqQ3iXjIBLnpzw0VwZU=;
        h=From:To:Cc:Subject:Date:From;
        b=XA+zDEs0VtHzmx23V2+tC57dn+LnJUeFmIFAILIbXrBBZrBiW5OLvIVLwrWbK/Puy
         GAL0yLrzcjDIDn3Rh1NpwnZuGYxIvkX8fJeFWRdqiCN2wNtsTaKTIlFAhFc0qw2wuN
         Sq4Y+/2qQ4nE6rXxnjXpk9EPEJkP1SSTF9Bg60OYWMOuqKXi4SoI/iaWUMHLHrNXnx
         ZFjBLJx6FFVVdsyQj/2FeitFRPUiI49XP27dMAPB+4B0LDyAPWbwdYStI94JxZ88ty
         ohEbxvn9u/u8QdXUK0YsMmJXuWA6Sgi4ZLb4bdXR8Zcz5A/ulu3y/SXNzV8jK2tJld
         LdF9k1fdOPVtQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] soc: qcom: geni: add support for gpi dma
Date:   Fri, 18 Jun 2021 19:48:36 +0530
Message-Id: <20210618141839.3777270-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is version 2 of the GPI dma series [1]

This series add the GPI DMA in qcom geni drivers. For this we
first need to move GENI_IF_DISABLE_RO and struct geni_wrapper to common
headers and then add support in the gpi dma in geni driver.

The SPI and I2C driver changes shall follow shortly

[1]: http://lore.kernel.org/r/20210111151651.1616813-1-vkoul@kernel.org

Changes in v2:
 - add r-b from Bjorn on patch 1
 - add more details in log for patch 2
 - Fix the comments from Doug and Bjorn for patch3, notable use read, modify
   update for irq registers, use geni_se_irq_clear() for irq, dont update
   single bit registers, add a bit more description for gpi dma etc

Vinod Koul (3):
  soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
  soc: qcom: geni: move struct geni_wrapper to header
  soc: qcom: geni: Add support for gpi dma

 drivers/soc/qcom/qcom-geni-se.c | 47 ++++++++++++++++++++++-----------
 include/linux/qcom-geni-se.h    | 23 ++++++++++++++--
 2 files changed, 52 insertions(+), 18 deletions(-)

-- 
2.31.1

