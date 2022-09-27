Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F5D5EBAFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 08:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiI0GxA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 02:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiI0Gw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 02:52:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC919C220
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 23:52:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B33F5B819CC
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 06:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCEBC433C1;
        Tue, 27 Sep 2022 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664261576;
        bh=mU9f9LoidskksX7PDIWPHuh8+QezhzFTM0/tR8Icdkk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qxBglPoVVeXt1IoW1KKQdwz0b0EcST7l27JJVnYPVGz4mhbyb2e4Zzeb8H69IlDxc
         rKS4ekkNMmrCwKCCs0caRmeWyP+Ym46KPtpjZhVyVPKbXPK1+FzxChJw1nkLeiQDfz
         gka7guPUPKRXGKalPYjlqmqXidA/LWimXSa7pu7bOCb1phWjOsEpoPMyarQirGAuMk
         RIXBDZ9ShVTVDmII1GL8hJk7B0Z6RwtsbhPNc6bz0lj4xT1Vg6Y1PclkM2WkBTWPlN
         YO40uefqy5NjE2yiJescyK+oZLmZG6AQA2gZgZ95zOQxoXVZae9r3ogBA3fkCyv5jD
         LECr4eO+pdGxQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1od4Sj-0006aV-Gu; Tue, 27 Sep 2022 08:53:02 +0200
Date:   Tue, 27 Sep 2022 08:53:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp-pcie: fix resource mapping for SDM845 QHP
 PHY
Message-ID: <YzKdzTfZXYz2mF4p@hovoldconsulting.com>
References: <20220926172514.880776-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926172514.880776-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 26, 2022 at 08:25:14PM +0300, Dmitry Baryshkov wrote:
> On SDM845 one of PCIe PHYs (the QHP one) has the same region for TX and
> RX registers. Since the commit 4be26f695ffa ("phy: qcom-qmp-pcie: fix
> memleak on probe deferral") added checking that resources are not
> allocated beforehand, this PHY can not be probed anymore. Fix this by
> skipping the map of ->rx resource on the QHP PHY and assign it manually.

Bah. Yet another QMP hack (the QHP support, not just this fix).

The binding should be fixed as this device does indeed not have separate
TX and RX register blocks. Note that the rx table for this device is
empty too so that repeated "TX" region is just a place holder.

> Fixes: 4be26f695ffa ("phy: qcom-qmp-pcie: fix memleak on probe deferral")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 7aff3f9940a5..5be5348fbb26 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2210,7 +2210,10 @@ static int qmp_pcie_create(struct device *dev, struct device_node *np, int id,
>  	if (IS_ERR(qphy->tx))
>  		return PTR_ERR(qphy->tx);
>  
> -	qphy->rx = devm_of_iomap(dev, np, 1, NULL);
> +	if (of_device_is_compatible(dev->of_node, "qcom,sdm845-qhp-pcie-phy"))
> +		qphy->rx = qphy->tx;
> +	else
> +		qphy->rx = devm_of_iomap(dev, np, 1, NULL);
>  	if (IS_ERR(qphy->rx))
>  		return PTR_ERR(qphy->rx);

But I guess this will do for now:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan
