Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5403D3ACD62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 16:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234400AbhFROVE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 10:21:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234385AbhFROVD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 10:21:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29DA061222;
        Fri, 18 Jun 2021 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624025933;
        bh=6a9wcBqh2xCp1n07Nk+C27uAXtGZHswKD0RQYiHlEpk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UAjF/7OMb9oUg2UVHy3HEXnU3+GaAxIeW3wMuhSE5ZP0RK57jTJkaoAmlRR7kqTLl
         kCTgXHpFxU6zraMaQxp86IPWrQYLSxu+09CTdp3t7hDu4t+70gXp5Ammn09xEVzyBT
         tMsKj2ujBz3unjCx+5dSjBhIgVyJkh1yQ6yOA9xqcNEwotLkJXyLswfsHjEkAf/SjD
         hcn1fJ+XGQkDlT6hCUVM2Cw4uXSq2cEVFrB38vRifRpv6Vfd3ukqBO1PuP68Iecf+l
         YUSXsuoaPJsHZ0BLyHCYBryONt4QFQyHyyeUvUS2qOZkRgZPc8DFXj0NeWSAg2HHtC
         SAiZ6FkLhAWgw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] soc: qcom: geni: move GENI_IF_DISABLE_RO to common header
Date:   Fri, 18 Jun 2021 19:48:37 +0530
Message-Id: <20210618141839.3777270-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210618141839.3777270-1-vkoul@kernel.org>
References: <20210618141839.3777270-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GENI_IF_DISABLE_RO is used by geni spi driver as well to check the
status if GENI, so move this to common header qcom-geni-se.h

Also, add FIFO_IF_DISABLE define.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 1 -
 include/linux/qcom-geni-se.h    | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 5bdfb1565c14..fe666ea0c487 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -104,7 +104,6 @@ static const char * const icc_path_names[] = {"qup-core", "qup-config",
 #define GENI_OUTPUT_CTRL		0x24
 #define GENI_CGC_CTRL			0x28
 #define GENI_CLK_CTRL_RO		0x60
-#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_S_REVISION_RO		0x6c
 #define SE_GENI_BYTE_GRAN		0x254
 #define SE_GENI_TX_PACKING_CFG0		0x260
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 7c811eebcaab..5114e2144b17 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -63,6 +63,7 @@ struct geni_se {
 #define SE_GENI_STATUS			0x40
 #define GENI_SER_M_CLK_CFG		0x48
 #define GENI_SER_S_CLK_CFG		0x4c
+#define GENI_IF_DISABLE_RO		0x64
 #define GENI_FW_REVISION_RO		0x68
 #define SE_GENI_CLK_SEL			0x7c
 #define SE_GENI_DMA_MODE_EN		0x258
@@ -105,6 +106,9 @@ struct geni_se {
 #define CLK_DIV_MSK			GENMASK(15, 4)
 #define CLK_DIV_SHFT			4
 
+/* GENI_IF_DISABLE_RO fields */
+#define FIFO_IF_DISABLE			(BIT(0))
+
 /* GENI_FW_REVISION_RO fields */
 #define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
 #define FW_REV_PROTOCOL_SHFT		8
-- 
2.31.1

