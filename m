Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EBF5EF27F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235532AbiI2Jpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235389AbiI2Jo6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:44:58 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B43C3A16F
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:44:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B32F7CE1EAF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 09:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC76FC433D7;
        Thu, 29 Sep 2022 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664444670;
        bh=xbn9dftZ/gyraKhzcK3RKTlD6TEA2sJFAESzHYU82JA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fIyHytBDhyBAuoxlyZXXcMSvJhtFh3AJuComIttbuCCT+nuwwJ0CmZcBVKHm3iLH7
         lihhojL+IFZfc76O36c8a8Yh7w/TePsR59fmTcQHedb9VWSi1UkU3h1XLeIyP6DtWr
         e13wwc2ll809xAP35L7BzG/Y6KjjbN4h4zQ1g6cx13SKKfMvP+OupsWAZS1RRs21UB
         //rXYOfJViaerPMOqn/dINyqw7kdeAKWUQIA9BI/jFQ68nDq5IgOdntHYZipIblE1f
         NEcVex/2VyetBsp8+CfhrtLSuYVjmTwJVaR+24tgcZlx2PHUXplAnq4YywQWdl4A4R
         jqw+MnMydjE8w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1odq5r-0006Dt-Rx; Thu, 29 Sep 2022 11:44:36 +0200
Date:   Thu, 29 Sep 2022 11:44:35 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/18] phy: qcom-qmp: rework register layout tables
Message-ID: <YzVpA9zN9Fc45l7r@hovoldconsulting.com>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 29, 2022 at 02:09:56AM +0300, Dmitry Baryshkov wrote:
> This is an alternative implementation of the QMP PHY driver cleanup
> proposed by Johan at [1]. This patchset changes register layout tables
> to use symbolic names instead of bare values and attempts to tie the reg
> layout with the version of the QMP PHY.

I wouldn't call this an alternative, but rather a separate change on
top. Using separate per-IP version "register-layout" structs is in
principle a good idea. It does require a bit of extra work though, as
it's not always clear what version of the IP each platform is using (e.g.
IPQ).

I've respun the clean up series that triggered Dimitry to send this
series:

	https://lore.kernel.org/lkml/20220929092916.23068-1-johan+linaro@kernel.org/

and dropped the two patches merging the IPQ and SDM845 structs.

The register layout work can be rebased on top (trivially).

I'm not so fond of the whole splitting of header files into atoms as you
lose the overview. But I guess that's a separate discussion.

> [1] https://lore.kernel.org/linux-phy/20220928152822.30687-1-johan+linaro@kernel.org

> Dmitry Baryshkov (12):
>   phy: qcom-qmp-pcie: rework regs layout arrays
>   phy: qcom-qmp-pcie: rename regs layout arrays
>   phy: qcom-qmp-ufs: split UFS-specific v2 PCS registers to a separate
>     header
>   phy: qcom-qmp-ufs: rework regs layout arrays
>   phy: qcom-qmp-ufs: rename regs layout arrays
>   phy: qcom-qmp-usb: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
>   phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
>   phy: qcom-qmp-usb: rework regs layout arrays
>   phy: qcom-qmp-pcie-msm8996: rework regs layout arrays
>   phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
>   phy: qcom-qmp-usb: rework regs layout arrays
>   phy: qcom-qmp: move type-specific headers to particular driver
> 
> Johan Hovold (6):
>   phy: qcom-qmp-pcie: drop unused common-block registers
>   phy: qcom-qmp-pcie: clean up power-down handling
>   phy: qcom-qmp-pcie-msm8996: clean up power-down handling
>   phy: qcom-qmp-combo: clean up power-down handling
>   phy: qcom-qmp-ufs: clean up power-down handling
>   phy: qcom-qmp-usb: clean up power-down handling

Johan
