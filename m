Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03246111DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiJ1Msu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJ1Mst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:48:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EFB61D5862;
        Fri, 28 Oct 2022 05:48:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B4D26282D;
        Fri, 28 Oct 2022 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA151C433D6;
        Fri, 28 Oct 2022 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666961327;
        bh=LSwr3Q1J/pGFCWnuuN96Iwb8nLI745MpukwHAe01huk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BZZf13BfwEldKVyJNfqKMIqkWhYZjELSwbhUUScyaOYn/SHMZqRrvRo0aothu4efI
         qU9xkJCYBo7rbd/cxm8aNqbmtMZX/HeGp8lrCToIQQzS9+A8vyo6jaKg8nxWSEV9hh
         yEav3BQS7wb1NB5ceqhOenjClEwrBmQBDpou2VEseGkoOQSlizACxY1ds6a3zDzX7x
         IzamiEZMmRDqmFw0HSGBBN9YqHYDl+WzfAAThCdE+P9axR1yEsq7WHSFXvPoit8n2R
         yX36iYG3wbdQzNxXifRvo/x2J3C9lh/FivJYdi1/vlLGBHa92iUOy/ckjcmFLTuF+1
         XRlG7/rWivHXw==
Date:   Fri, 28 Oct 2022 18:18:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y1vPq/2Qjzh/fsWV@matsya>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
 <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
 <20220930005647.99FE7C433D6@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930005647.99FE7C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-09-22, 17:56, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-09-15 23:17:40)
> > Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> > ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> > provider to let other devices link these clocks through the DT.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> The previous two are on clk-fixed-rate branch if you want to pull it.

Okay, i dont think there is a compile time dependency, so these can go
independently..

-- 
~Vinod
