Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9DD7A8A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 19:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjITRZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Sep 2023 13:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjITRZ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Sep 2023 13:25:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB9DAF;
        Wed, 20 Sep 2023 10:25:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCDE6C433C8;
        Wed, 20 Sep 2023 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695230751;
        bh=VpRWSb03mWUXop7HUZgoUaUDO2VTaHNelfCTFII07Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MJyl9iDmi8aOXaG01pUifTMB5M6DtD7cLntc+MmVa5fB8Mp8Ic78LDK4/xNXv+Qa7
         0GtxtV3XwFkic/snw1ISBO5dmr2BOZSw7w0Sn5JA03uylFTXRyDKQabbu8z2WRXFoS
         dEJJjbTwIJrKTFgehBF7/hRXD/7KU+fGfN6iR28Fq8Old2tOYqt+2lVP3rGTJdd/Su
         vAzx90w+cy4Tx0Yl34iQU53/8ojgh7pcsSY2DaYxOJEe7OFwZBb54gVjUDY81lcZln
         MudS4NkUCeElwN9D3IW9MYA/1LWO8w4eUIxhtIa8GqHcSLMwcA1fFGAysQeXHQfK6u
         yQoza2XXSMj8Q==
Date:   Wed, 20 Sep 2023 10:29:58 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] clk: qcom: cbf-msm8996: Convert to platform remove
 callback returning void
Message-ID: <cghreaj25elndy3wfdqhetlpk3hswyu5hnvvzdhcoqbpj2kin7@lzfeshjoyxti>
References: <20230911151548.672485-1-u.kleine-koenig@pengutronix.de>
 <8ec473b5b80d5fad8d76df6d88d2c1d0.sboyd@kernel.org>
 <20230912065343.neorcr5mksodbaod@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912065343.neorcr5mksodbaod@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 12, 2023 at 08:53:43AM +0200, Uwe Kleine-König wrote:
> Hello Stephen,
> 
> On Mon, Sep 11, 2023 at 01:02:53PM -0700, Stephen Boyd wrote:
> > Quoting Uwe Kleine-König (2023-09-11 08:15:48)
> > > The .remove() callback for a platform driver returns an int which makes
> > > many driver authors wrongly assume it's possible to do error handling by
> > > returning an error code. However the value returned is ignored (apart
> > > from emitting a warning) and this typically results in resource leaks.
> > > To improve here there is a quest to make the remove callback return
> > > void. In the first step of this quest all drivers are converted to
> > > .remove_new() which already returns void. Eventually after all drivers
> > > are converted, .remove_new() is renamed to .remove().
> > > 
> > > qcom_msm8996_cbf_icc_remove() returned zero unconditionally. After
> > > changing this function to return void instead, the driver can be
> > > converted trivially to use .remove_new().
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > 
> > Do you want to take this? Otherwise, I can apply it to fixes.
> 
> if "you" == "Uwe Kleine-König": Please take it via your tree. There is
> still much to do before the next synchronous step, so there is no urge.
> If the patch goes in during the next merge window that's fine, too.
> 

@Stephen, should I just pick this in the Qcom tree for 6.7 then?

Regards,
Bjorn
