Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F154557DC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 16:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiFWO3D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 10:29:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231803AbiFWO3C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 10:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03FFD45537
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655994539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WD6aAT4eAfkhBAGxc5usx5w9FCyTvm/RJ0Dv5y8ZHUg=;
        b=LUL52ma29PfNPz6sWUK35UC0yOwUdBPgllsZVCkvIXiz4+EEFvREGt/akXpqELNQLnVRCa
        ahidn44ArhC3PRjPtaQ+6fPIHAMIirwpR4B2nERsZYW4MPNYFRk+YHavOkgM1zjF7V+or1
        HDMbRZUlEbF+KX1G35Tvhr/ibgfLYT0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-rLNyJdJSMdaspMsupiNaeA-1; Thu, 23 Jun 2022 10:28:57 -0400
X-MC-Unique: rLNyJdJSMdaspMsupiNaeA-1
Received: by mail-qk1-f198.google.com with SMTP id bs17-20020a05620a471100b006a734d3910dso23584305qkb.22
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 07:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WD6aAT4eAfkhBAGxc5usx5w9FCyTvm/RJ0Dv5y8ZHUg=;
        b=7b6gJy4xyG/1EUu1IsBye6Hw0AFIvsyxxN/18Y5stEYyUxZgnMIzYnM+GMeoUh59f5
         SLSntLupXYBHWzCm8qViffZfMU9pdVtCINXem6Db3oyIg2iUx3el9Q5WjX8QwAWTDn6X
         sOgFprJ98UyFSbJTGOneLNtCvbKDglC/iemBcsi5C9QXasFRSgS/BTKb9fqt6dTHIcQy
         M4hgixiGg1LgXpjEJsXF8vkqEZvTgL0Y2JdTQZ/ndf+TRjJkk9Vyi4VweDUPs9g1zBva
         69tpEOMGH13U5Wh539v/YcbfsDB1T35bQ1MthzxrX2WU4rHnGSdRSLvX1vYvjcpddZvx
         KFqQ==
X-Gm-Message-State: AJIora9sK1Pew1p/aUzvoCzSeKdA23HxJ+Lozlf0veArG3UBvV+dhfio
        vwIUJ9pZ/kwoaMoBBWLNoYApl7MqtA6my/GLO0EJghfmU68zNMNOwRob/C9gO7v+j02VY9L0LCH
        DGEwh9y+YiQ5SUz5urPnGfqvG0Q==
X-Received: by 2002:a05:6214:b69:b0:470:4d46:a399 with SMTP id ey9-20020a0562140b6900b004704d46a399mr14931482qvb.68.1655994537268;
        Thu, 23 Jun 2022 07:28:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s3HQBpI082cjSWrflbTXyicJSxjqvis1d5yO6iArcXxXYDi5XlJzjhdU6+uUThw6LfTCvY2Q==
X-Received: by 2002:a05:6214:b69:b0:470:4d46:a399 with SMTP id ey9-20020a0562140b6900b004704d46a399mr14931452qvb.68.1655994536929;
        Thu, 23 Jun 2022 07:28:56 -0700 (PDT)
Received: from xps13.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id d124-20020a379b82000000b006a6ae9150fesm18412531qke.41.2022.06.23.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 07:28:56 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk for sa8540p
Date:   Thu, 23 Jun 2022 10:28:37 -0400
Message-Id: <20220623142837.3140680-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sa8540p automotive board has the same SOC as the sc8280xp. In order
to get the first UFS controller working on the sa8540p,
GCC_UFS_REF_CLKREF_CLK needs to be setup as a parent to
GCC_UFS_PHY_AXI_CLK.

This clock name came from the DTS for the downstream MSM 5.4 kernel
sources for the sa8540p. It also references GCC_UFS_CARD_CLKREF_CLK,
however that wasn't needed to get the first UFS controller working.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
I originally added this under GCC_UFS_PHY_PHY_AUX_CLK since that's
what's in the downstream DTS. I was getting errors about
GCC_UFS_PHY_AXI_CLK being stuck at off so I moved it there.

Also I don't have access to any documentation for this board so I'm
hoping that someone with docs access can verify that this is the
appropriate place to put this.

 drivers/clk/qcom/gcc-sc8280xp.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 4b894442fdf5..4639b50da418 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -5685,6 +5685,19 @@ static struct clk_branch gcc_ufs_phy_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_ufs_ref_clkref_clk = {
+	.halt_reg = 0x8c058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x8c058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_ref_clkref_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_ufs_phy_axi_clk = {
 	.halt_reg = 0x77010,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_axi_clk",
 			.parent_hws = (const struct clk_hw*[]){
+				&gcc_ufs_ref_clkref_clk.clkr.hw,
 				&gcc_ufs_phy_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
@@ -5899,19 +5913,6 @@ static struct clk_branch gcc_ufs_phy_unipro_core_hw_ctl_clk = {
 	},
 };
 
-static struct clk_branch gcc_ufs_ref_clkref_clk = {
-	.halt_reg = 0x8c058,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x8c058,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_ufs_ref_clkref_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_usb2_hs0_clkref_clk = {
 	.halt_reg = 0x8c044,
 	.halt_check = BRANCH_HALT,
-- 
2.36.1

