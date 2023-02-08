Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4581268FAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 00:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjBHXEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 18:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBHXET (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 18:04:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3723B36FC3
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 15:04:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6524617FB
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 23:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DC5C433D2;
        Wed,  8 Feb 2023 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675897457;
        bh=Jv5JzXB0DVOdfaVRpRExdYQ1+Oje58ssrqyS3enD5zo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XmDHTV2MhKchhJY0TMpJ531ACtjlHKCEd9tzbO++opETU/wMFjTA/cDvd/lE+SuLT
         hQJwzmpEH670VUw9oSuGJTq5g2b85yX3yxmvyaboEVNcvX9yAvZJJks0JhOV9iwFd3
         utH9Z9bTH+Zgrdsc1unr8bv2USnAOUzcEi1O8zXdKbQwOxDavxLGsfVE5UTJ1u1ZwI
         +c80KuKclH7udQi0Js+7b/LVAPSXA4ZVEIg1wOdET+mZiQfXprtcsnApyxPSKY2dv0
         9V8D4whuinH/RLhIQv2HUS6p7O36R2treIAe8ylg1gfZgjFUk0yl9OO9mKj7I/eNur
         hW49htyxK8pNA==
Date:   Wed, 8 Feb 2023 15:06:28 -0800
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>
Cc:     linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>
Subject: Re: [PATCH 1/1] arm64: defconfig: Enable qcom msm8994 clk drivers
Message-ID: <20230208230628.xoaqt4hby5ec4s6t@ripper>
References: <20230130111014.27980-1-pvorel@suse.cz>
 <20230130152758.f5hh7zydyca22ipu@builder.lan>
 <Y9gWsWuDt10fUL5i@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9gWsWuDt10fUL5i@pevik>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 30, 2023 at 08:12:49PM +0100, Petr Vorel wrote:
> > On Mon, Jan 30, 2023 at 12:10:14PM +0100, Petr Vorel wrote:
> > > Enabling the clk drivers on msm8994 allows to boot and test most device
> > > drivers on this SoC.
> 
> > > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> 
> > Now that we can handle probe defer on the power-domains, can this be
> > made =m instead?
> 
> Out of curiosity may I know what commit implemented handling probe defer on
> power-domains?
> 

Probe defer support has been there for a long time, but it was not
reliable after late_initcall.

I believe 2b28a1a84a0e ("driver core: Extend deferred probe timeout on
driver registration") is the change that altered the behavior, so we can
now use it for kernel modules as well.

Regards,
Bjorn

> Kind regards,
> Petr
> 
> > Regards,
> > Bjorn
> 
> > > ---
> > > NOTE: Working as part of SUSE hackweek, that's why I use my work mail
> > > instead of usual private gmail.
> 
> > > Kind regards,
> > > Petr
> 
> > >  arch/arm64/configs/defconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> 
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index bfafb4313436..c6b08a9d8944 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -1105,6 +1105,7 @@ CONFIG_IPQ_GCC_6018=y
> > >  CONFIG_IPQ_GCC_8074=y
> > >  CONFIG_MSM_GCC_8916=y
> > >  CONFIG_MSM_GCC_8994=y
> > > +CONFIG_MSM_MMCC_8994=y
> > >  CONFIG_MSM_MMCC_8996=y
> > >  CONFIG_MSM_GCC_8998=y
> > >  CONFIG_QCS_GCC_404=y
> > > -- 
> > > 2.39.1
> 
