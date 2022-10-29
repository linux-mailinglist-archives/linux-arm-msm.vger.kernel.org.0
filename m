Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8EDA6121C0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 11:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJ2JZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 05:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJ2JZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 05:25:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8425F9A5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 02:25:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CEAB960E17
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 09:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AD5C433D6;
        Sat, 29 Oct 2022 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667035512;
        bh=y4nkSx5YThbDh80eDDpmOltCRi12a/lA8Fbho3y4Jjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bofdyItd8S97ui5sbmLX5DAwZY8JSyCqBTRPy+Qbmw9Z5Uv1NSkvv04gYzqE+I6eJ
         TXW3CUxKEZ494tT+P0GAqlFJtOXNT3uFACd2ot57Ak5tykyXxFPDZ0ecdmfit05QA8
         6q3IxZBjHalrhvciSKdfuqbcA/jq6gZReIAkcRiis3T/8/U65/OwJcnNg71NrRzh6d
         HZ/cpFGIAZvog7sTp6hrIy5jCHr9XgM0lshyYIkVsaM2kTpLpd8J9S9AvEpq/cgoez
         4Q9j365CJRNklCYuRuq4rnxEGP1nXa/ueKH1ROmaNn4ut7S8X1Wf4eYfLNJGlPGdMs
         sKy08z1yiiJVg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ooi5K-0000go-V9; Sat, 29 Oct 2022 11:24:59 +0200
Date:   Sat, 29 Oct 2022 11:24:58 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v6] phy: qcom-qmp-ufs: provide symbol clocks
Message-ID: <Y1zxamwp7HP03SUx@hovoldconsulting.com>
References: <20221028164847.485874-1-dmitry.baryshkov@linaro.org>
 <Y1zsQN33joDlJRAP@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1zsQN33joDlJRAP@hovoldconsulting.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 29, 2022 at 11:02:56AM +0200, Johan Hovold wrote:
> On Fri, Oct 28, 2022 at 07:48:47PM +0300, Dmitry Baryshkov wrote:
> > Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
> > ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
> > provider to let other devices link these clocks through the DT.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> >  static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
> >  {
> >  	struct platform_device *pdev = to_platform_device(qmp->dev);
> > @@ -1135,6 +1195,13 @@ static int qmp_ufs_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto err_node_put;
> >  
> > +	ret = phy_symbols_clk_register(qmp, np);
> 
> Looks like this should go in probe() instead, or was there a reason for
> not registering these clocks when using the new bindings?

Oops, misread the diff. Please ignore this bit.

> And don't they need to be described in both the old and new bindings
> first either way?

This still applies though (i.e. you need to add #clock-cells to
the bindings).

> > +	if (ret) {
> > +		dev_err(dev, "failed to create symbol clocks, %d\n",
> > +			ret);
> 
> Please use the "...: %d\n" form for consistency.
> 
> But you can probably just drop this error message instead.
> 
> > +		goto err_node_put;
> > +	}
> > +
> >  	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
> >  	if (IS_ERR(qmp->phy)) {
> >  		ret = PTR_ERR(qmp->phy);
 
Johan
