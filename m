Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E9354EE84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 02:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiFQAiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 20:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiFQAiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 20:38:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D296953C75
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 17:38:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70D0C6194A
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 00:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9492C34114;
        Fri, 17 Jun 2022 00:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655426293;
        bh=4zSipTb8ys2Cxh8WgYAx7pfSzuRK55TeyzQ58OmVuSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g2U6KnR3OYsG5SZVCg+0wvsuygu6ZTkrM/Hf8hon7dFgPACOYCHsmcjTRDljrn0L/
         CvX3vvtU4gE0DcPsOyaXT30nWi0MmsvakqSOEvHXKvPBBpV/Mmz/BdUEoPWeVhgkHp
         bhO6miAhuqMAZe65o1aYE8z41nLvawBjPnVzQeMG5GSsUNRnqO+pngcaWuO/5nQhs4
         IdrBOXBOHMcAOuLFZ4UJzo4Hx7/knJvDJXfIIuMHEQA949nLscyL3kagXx5bMltESI
         ruTrZTEtkT+yLg6ChAC16YjhUZbMZlAsTZgHT2dnwPdFp3X+s7HbbvSiWgYRrqId3g
         fRaCJoRX8Mf9g==
Date:   Thu, 16 Jun 2022 17:38:13 -0700
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 0/2] phy: qcom-qmp: fix QMP PCIe PHY init
Message-ID: <YqvM9e/CfJcrsC/E@matsya>
References: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-22, 21:55, Dmitry Baryshkov wrote:
> These two patches fix PCIe PHY init after the previous QMP PHY rework
> ([1]). They were generated on top of phy/next, but I'm fine with them
> being squashed to the corresponding patches.

Applied, thanks

-- 
~Vinod
