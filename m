Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE35161125A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 15:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiJ1NIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 09:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiJ1NH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 09:07:58 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B03E18B769
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 06:07:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AEFDDCE2B25
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 13:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441A0C433D6;
        Fri, 28 Oct 2022 13:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666962472;
        bh=EMSF72jMfi+VBIYUxvP5jSW6Mps48VRoA54UWMBEQfo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EaYJIDJOMqNlY5NRc6xQ5p8lVniHraFz1U6qqpeDzEQRCU5HNWg7DQi5vVoAs6jxP
         vk0NWRPMjhDsKk9r1/xavMpq+ytxv7ogGmBZCdR1BPGYeB7/ZDo7w6w1rLTp+wNkyG
         omLZzrRlmMIkKdwJh0X1yuJi34xeYJpaQIWDB1MB2V30/NMYfgPvHmXMnsnyDkbUhS
         cqZoRWchF25kMOvosAHh7C+sQA5sRZ0MJ9XAWWX4O1in1G2Zs+xkX+BoqYMfxbWahT
         z2K8onO+C4uObv16MNWV9Pnn+50MbeYCBX4w4Y1zQ7FqdnzitcgH5GKq5iqtW0yp/j
         xK2cskF3ljF+g==
Date:   Fri, 28 Oct 2022 18:37:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v5] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y1vUJNZ9d5jb8dl2@matsya>
References: <20221028125148.264833-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028125148.264833-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28-10-22, 15:51, Dmitry Baryshkov wrote:
> Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> provider to let other devices link these clocks through the DT.

Sorry doesnt apply, please rebase once updated next is availble later
tonight

-- 
~Vinod
