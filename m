Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434945F6279
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 10:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiJFIVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 04:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbiJFIVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 04:21:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757382B268;
        Thu,  6 Oct 2022 01:21:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD2D0B82035;
        Thu,  6 Oct 2022 08:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C19C433D6;
        Thu,  6 Oct 2022 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665044471;
        bh=44BmLy7CEd3jx1EOlVr8WQ8bwFyx1o6U9/3Eep9O8UY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qsqkt02BhrmNBeBMGmJYniAXyWhYpDPph10h0ApEJF9+7Sz3e7ExWsgGqslY7/570
         6LyO9KgmNec+KhdeH6vztGmxv0MYU4ez0I7zZMCWUQozeJTYIG0da8S3Dpn/YLdzeY
         5tsr5o04bOsFE3ZvkUBQnPF3ry7l3JYXVOF56JIye9ymEmwW0976jkeA1JlzA4PYao
         pg1Txl00srIOv+FkDJWrWEbDypoNXjnYdWeFrOW5mWxsbRySn7fsM1dZ6m9HXojVuZ
         mZbr0lhwa/W3FGzxMgAv6+vJhimeCKZCx/n9Eg/70XVMIKquxs0AS2Sw5HSVFt2lzm
         egDhzIlRVLhOg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ogM7v-0003hg-7j; Thu, 06 Oct 2022 10:21:07 +0200
Date:   Thu, 6 Oct 2022 10:21:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
Message-ID: <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 22, 2022 at 04:32:00PM +0200, Krzysztof Kozlowski wrote:
> Hi everyone,
> 
> Quite a lot of people are working on Qualcomm DT bindings conversion
> (TXT->YAML) and fixups to Qualcomm DTS. We track a bit of this effort
> internally in Linaro, but that has many shortcomings and we would like
> to track it rather community-wide with the support and contributions
> from the community.
> 
> What to track:
> 1. Which bindings to convert to YAML,
> 2. Missing compatibles (either entirely or because of missing conversion),
> 3. `dt_binding_check` warnings (usually connected with 1-2),
> 4. `dtbs_check` warnings.
> 
> Rob's bot gives us daily output for 1-4, but how can we track current
> efforts to avoid duplication of work? Also it would allow people to find
> tasks for them to get contributions to Linux kernel :). Is anyone in
> community interested in tracking it together, in a public way?

Is this a real problem that needs fixing? I mean how often does it
happen that people submit the same YAML conversion for example? Since it
doesn't take that long to do a conversion, I'm not sure what tracking
this on some webpage buys us. It's better to just search lore before
starting a new conversion. Or search the linux-next tree to see what's
still pending.

Similarly for the other points above, as it doesn't take very long to
add a missing compatible or fix a warning it seems a bit excessive to
try to track this manually.

Perhaps a list of pending conversions or missing compatibles could be
useful for someone who's short on work, but it's bound to get outdated
pretty quickly.

> If so, where?
> A. elinux.org (needs some formatting when pasting the output from tools)
> B. gitlab pages/wiki (maybe scripts could parse tools and create the page?)
> C. gitlab dedicated repo - some text file
> D. Linux kernel TODO file (might be difficult to keep updated)
> E. kernel.org wiki (requires LF accounts, AFAIK, a bit pain to edit; I
> have it for Exynos but I don't find it usable -
> https://exynos.wiki.kernel.org/todo_tasks)
> 
> I am leaning towards Gitlab pages because they could be quite automated
> - with CI or with scripts.
> 
> The point would be to list all of tasks (1-4 from the first list), keep
> it updated with new results, pick/assign tasks and mark as done.

I don't really see the need for more process here, sorry.

If I'm working on support for a new platform and the DT checker warnings
gets too noisy I may pick some of the low hanging fruit. In the odd
chance that someone beats me to it, it's not the end of the world.

Johan
