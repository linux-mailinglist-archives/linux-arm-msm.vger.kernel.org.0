Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60976724CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 18:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229965AbjARRZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 12:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjARRZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 12:25:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747A9B741
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 09:25:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1F0F7B81E0D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 17:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99BFC433D2;
        Wed, 18 Jan 2023 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674062746;
        bh=nbhFEkTRawXa27CXBBIvDMnrHC17HIfBOrRgIXMDf70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyhfcvNuwuxE3OsCwtJoWAp/DYCB/IJPegelC3qX6RhEyWFhr2nNip15QRf/WPZUS
         G6/4due6FUXQBzp2fWMLPmZtymf6qDM9MYEbDhs6ejRKzFiUDd9Lqr5J3fZFkEZyeZ
         W0Y6wHwR8dZvPfBwbq9Wti8rBu54CjX5TIzYTg3Wr00q4X0aswonO1XYCLDZlXswQk
         ZSXcBayBPFBR/G8RxwWEECguelA2f+b6k37AbBt3AiKuVE6JHMkhGg97MwvPMr8zWb
         8fJFNCuYZOAk7TGkFsreU/woCva4Z40Youbot2LuqsKfN3+D8g0gFB7pYOgDv2H1nJ
         /LgddBC2sIpaQ==
Date:   Wed, 18 Jan 2023 22:55:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/2] phy: qcom-qmp-pcie: fix the regs layout table for
 sm8450 gen3x1 PHY
Message-ID: <Y8grl2UjkGTOo/Y5@matsya>
References: <20230113212138.421583-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113212138.421583-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13-01-23, 23:21, Dmitry Baryshkov wrote:
> The sm8450 gen3x1 PHY references the pciephy_v4_regs_layout while the
> PHY itself uses v5 regs. While there are only minor differences between
> v4 and v5 regs and none of them concerns registers mentions in
> regs_layout, switch the PHY to use pciephy_v5_regs_layout to remove
> possible confusion.

Applied both, thanks

-- 
~Vinod
