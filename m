Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFF66621C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234428AbjAIJjp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236710AbjAIJjn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:39:43 -0500
X-Greylist: delayed 3358 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 09 Jan 2023 01:39:41 PST
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DDE646A;
        Mon,  9 Jan 2023 01:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1673257176;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=7jr8OSyffh66PmNyWf9yrX6rwjkK6l6M3zwqEcxN3z8=;
    b=FLoOL8znO4ByNQHOGeEzqaJN+eqC5LocZry+sotHO6LOaJiXbwG52wGhiu195V6ml9
    s3vyM8jx3eYvgSvECGn6pHTfs9D/ASeU6aWQOeZ6DppDdavjNlEeHTCIJ/pdQ3n+Gzfr
    pblxDfzLXccxHm6HSTXmVE7PrCt0nULSrR+uIKP5/l7BkdGP3k2utOrxs+wNmrYVvhyu
    ckkSmPqY3EWvEUibPVpQfq+kkQ0i9e0Lr0iy82xADzVAOm0+wIdhC0kDou8BjrN/QRfi
    69C6YRi88gfdw46MspS+eS5vhczw1IfDkc/OA8c3rhDTvwS/qoBux/LSRK757huohiLX
    IA2g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWwvShtQ=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349z099dZx5y
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 9 Jan 2023 10:39:35 +0100 (CET)
Date:   Mon, 9 Jan 2023 10:39:34 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Message-ID: <Y7vg1gwhndnbtN/M@gerhold.net>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
 <a86973c7-db5e-ab2c-4b6b-d9c82f76a070@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a86973c7-db5e-ab2c-4b6b-d9c82f76a070@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 09, 2023 at 12:20:55AM +0200, Dmitry Baryshkov wrote:
> On 08/01/2023 23:40, Rob Herring wrote:
> > On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
> > > Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> > > bootloader [1] that is used for almost all older Qualcomm SoCs.
> > > 
> > > Several of these are already supported, e.g.:
> > >    - MSM8960 -> APQ8060, MSM8260, ...
> > >    - MSM8976 -> APQ8076
> > >    - MSM8956 -> APQ8056
> > > Others are currently being worked on, e.g.:
> > >    - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
> > >    - MSM8939 -> MSM8239, ...
> > > 
> > > And even all remaining ones added are close enough to what is already
> > > supported so that future support is realistic (if someone steps up to
> > > do the work).
> > > 
> > > Add all of them at once to avoid having to add them one by one in the
> > > future. This will also benefit other projects making use of the same
> > > dt-bindings, e.g. bootloaders where adding support for all these SoCs
> > > is a bit easier than on Linux.
> > 
> > The promise was in accepting the properties upstream is we'd only be
> > adding these for bootloaders with dtbs that we can't otherwise update or
> > change. Do all of those meet this criteria? Seems unlikely.
> 
> 
> Most of Qualcomm platforms come with the signed bootloader, so it is
> impossible to change it without vendor keys. This might sound bad for you,
> but I fear that this list would include most of the platforms until Qualcomm
> agrees to rework kernel-bootloader-dtb interaction.
> 

There is no need to replace the signed bootloader to avoid these quirks.
The bootloader does not care if it is booting Linux directly or another
OS, so you can just package a less broken bootloader into an Android
boot image and "chainload" it before booting Linux.

This is fairly simple to do for the older platforms that are still using
LK as bootloader, but more complicated for the UEFI platforms since a
fully open-source bootloader is not available there.

For the older platforms I'm working on (mainly MSM8916 and similar) this
approach has proven to be extremely beneficial. I have seen all sorts of
vendor-specific bootloader quirks that go way beyond just requiring a
non-standard property in the DT. Some of them require almost the entire
downstream DT because they use information from it to initialize the
display shortly before booting Linux. Others make random modifications
to the DT that would cause trouble for mainline Linux.

lk2nd [1] covers all relevant LK platforms. IMO investing the time to
get e.g. U-Boot running for newer platforms would be well worth the
effort, especially because it can cut many discussions short.

For example, lk2nd has working display panel selection (by setting the
correct panel compatible in the Linux DT). AFAIU this is still unsolved
for all newer platforms because Qualcomm still passes this in some weird
cmdline format to the kernel (mdss_mdp.panel=, msm_drm.dsi_display0=, ...)

Thanks,
Stephan

[1]: https://github.com/msm8916-mainline/lk2nd
