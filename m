Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA80A5F6A43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 17:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbiJFPHl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Oct 2022 11:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiJFPHc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Oct 2022 11:07:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D43C8FD7A;
        Thu,  6 Oct 2022 08:07:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3C15619EE;
        Thu,  6 Oct 2022 15:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7C9C433B5;
        Thu,  6 Oct 2022 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665068849;
        bh=aA7z4WmE7WeKFIA62daxrPvgcAETGLOKt+bLT9KeHbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cjyb6JWFFZgyc1ok4lHC+QS2Kp03BNka/7FnseRZcMQYbSpjvUd6tvJyOEDiCeDVm
         Aeaq8WkItdHpC9j39AohRxlhUmKUGEtP/Z0nUQ2+RZRwkc1RK4iba1Ya9OUUSezp8e
         rBoQ9ww/m5jQKLluh7kBmw1a603UGsSx6ffEj0V0XZkr9TAiHePpsn2fun7L6AqcH9
         n7/MiwfZKMnu4WPO3jW5wGKtO5qqn/R1SrNV2xLqHT+4OIpfTymRuM0fg9bByf9/Fe
         ZF5UbwVGQYudEZSj1vun/6z0HHoStCFK/d6C9boDfCZ0h/0yagcPkmjuLYAHAJf8jL
         59gHXiZiwxg8Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ogST1-00083i-9i; Thu, 06 Oct 2022 17:07:20 +0200
Date:   Thu, 6 Oct 2022 17:07:19 +0200
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
Message-ID: <Yz7vJ9LMm16eaXaR@hovoldconsulting.com>
References: <62e95ea6-6b72-a159-56ab-8bb11a5800c8@linaro.org>
 <Yz6P8wOPdRd9sjX2@hovoldconsulting.com>
 <a7e57332-f0c8-ceb0-e279-4e9a114d0cc8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7e57332-f0c8-ceb0-e279-4e9a114d0cc8@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 06, 2022 at 10:39:22AM +0200, Krzysztof Kozlowski wrote:
> On 06/10/2022 10:21, Johan Hovold wrote:
> >> What to track:
> >> 1. Which bindings to convert to YAML,
> >> 2. Missing compatibles (either entirely or because of missing conversion),
> >> 3. `dt_binding_check` warnings (usually connected with 1-2),
> >> 4. `dtbs_check` warnings.
> >>
> >> Rob's bot gives us daily output for 1-4, but how can we track current
> >> efforts to avoid duplication of work? Also it would allow people to find
> >> tasks for them to get contributions to Linux kernel :). Is anyone in
> >> community interested in tracking it together, in a public way?
> > 
> > Is this a real problem that needs fixing? I mean how often does it
> > happen that people submit the same YAML conversion for example? Since it
> > doesn't take that long to do a conversion, I'm not sure what tracking
> > this on some webpage buys us. It's better to just search lore before
> > starting a new conversion. Or search the linux-next tree to see what's
> > still pending.
> 
> In terms of DT bindings conversion to DT schema:
> If I were not checking for ongoing work, I would duplicate effort like
> ~10 times. Few other folks hit it few times, at least. Several bindings
> are being converted for ~1 year!

Ok, but the conversion itself doesn't take that long even if getting it
merged and fixing up new warnings may take some time.

And after the initial posting, a quick lore search allows you to find
any on-going conversion efforts.

Perhaps that can just be mentioned in a wiki-page of sorts that lists
remaining conversions with some suggestions for how best to go about
things.

> In terms of DTS warnings - it's difficult even to check/search. For what
> do you search? Warnings? Pretty often they are not part of commit msg.
> By file? Then you might have many, many unrelated search results.

I wasn't suggesting to use lore for warnings, but searching the lists
for changes to a particular dts before embarking on a clean up doesn't
seem unreasonable.

> > Similarly for the other points above, as it doesn't take very long to
> > add a missing compatible or fix a warning it seems a bit excessive to
> > try to track this manually.
> 
> True, some are trivial. Some however need fixing the binding which takes
> time.

Right.

> > Perhaps a list of pending conversions or missing compatibles could be
> > useful for someone who's short on work, but it's bound to get outdated
> > pretty quickly.
> 
> Another point is to have the visibility on the amount of work to be
> done. But I understand that's maybe topic just for few, e.g. me, so I
> can just track stuff for myself.

Yeah, I don't think that any such extra process should be needed outside
a small group that may potentially be working on cleaning up bindings
and dts in bulk.

If you were to maintain such a list of pending and on-going conversions
for yourself, perhaps making that public is all that's needed here?

Johan
