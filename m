Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FE65F6A73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 17:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiJFPVF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 11:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiJFPVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 11:21:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04507B514B;
        Thu,  6 Oct 2022 08:21:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5BAB9B820DC;
        Thu,  6 Oct 2022 15:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D33C433C1;
        Thu,  6 Oct 2022 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665069661;
        bh=JrwMOulB7DpxqmtMl/R0cg81f45+oDM6yL8tNK1QWvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E1E3C0DN634/26yISzeoPPZE/Niz3va9T8GQgHkjFBFW8XwLCXnvCss2DC9JNGVzG
         mi3+WFdGl2IT56r2jl9YSLjrlhrC5Ns7n66HXq9p9FLftZBIkamcGzCvirf1muLJvn
         bL70ZUDDqcpl62duDYzWowFwgVf5pR5qsxrDWPhoDiIosSSFmfTeGRGHK4M98UqZk7
         DdR704wl/XE+xUH40ihuOkRYfh5+6Qv411DNZe9ppyEHMIcUj1lIpHf4WOTeUPF/oN
         Rysa+USPxVpRx/cIst/hakSej8SVJppkhYHBwTkwERbSd7dj2e80SK9+N0/1GKMR0G
         t8MI+0b6UoDzQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ogSgD-0000DG-Te; Thu, 06 Oct 2022 17:20:58 +0200
Date:   Thu, 6 Oct 2022 17:20:57 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Alex Elder <elder@linaro.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Vinod Koul <vinod.koul@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Caleb Connolly <kc@postmarketos.org>
Subject: Re: Qualcomm DT bindings and DTS cleanups - tracking community wide
Message-ID: <Yz7yWRp3m8pU5eED@hovoldconsulting.com>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
 <CAA8EJpqY41KSPp9-X0_+x+SnoWqvKxfV_tzgnu7HiA80Lbd5HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqY41KSPp9-X0_+x+SnoWqvKxfV_tzgnu7HiA80Lbd5HQ@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 06, 2022 at 12:44:09PM +0300, Dmitry Baryshkov wrote:

> On Thu, 6 Oct 2022 at 11:21, Johan Hovold <johan@kernel.org> wrote:

> > Is this a real problem that needs fixing? I mean how often does it
> > happen that people submit the same YAML conversion for example? Since it
> > doesn't take that long to do a conversion, I'm not sure what tracking
> > this on some webpage buys us. It's better to just search lore before
> > starting a new conversion. Or search the linux-next tree to see what's
> > still pending.
> 
> As Krzysztof wrote, fixing a warning/adding a new platform is usually
> not a big deal. However converting old txt bindings usually results in
> a significant amount of work. Fixing YAML and dtsi at the same time
> can take a long time, especially for obscure cases like apq8084 or old
> ipq boards.

Yeah, if there are more than one person working on larger efforts like
that, then that may require some coordination. But you can't expect
drive-by developers to login to some web service before fixing dts
checker warnings that are bugging them.

Johan
