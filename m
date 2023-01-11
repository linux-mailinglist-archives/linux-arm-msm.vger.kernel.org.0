Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5568F6663E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbjAKTpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:45:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjAKToM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:44:12 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9B53F450;
        Wed, 11 Jan 2023 11:42:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 46576B81CC7;
        Wed, 11 Jan 2023 19:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A087C433EF;
        Wed, 11 Jan 2023 19:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673466138;
        bh=CGtIp75QkZOm9daNCxrZn31MoEyt/e14zeOWzGLBgyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MlNmGo85z+RCRIYBJGLs5A+r59DG6j12Em/e09tDKP+126V/nbQ9wfQ1JygRd85Sx
         RNy9dzgRrK32nrriXDmSXFl2BDQlSlpgqwGTdAfnlBsDsYEkAAy4wRIALR61O6e+po
         epytBSFbLfzVQMhhFQcoCbqKxODcsv1V3sqvwyr2B9ulH5xPn7iK0329yeJwrg6KVq
         PLQ4RmSW09Ghbkz5e8huiPwemxfrSoiG6Wp2V9GHqELgPXevmwYrBdT8VN6tZhvban
         1ogEUnWNmcHqnLxdt6JRW24X8RrmDq8453D6ezv3UmrLHBQBKwa4Zb5UfM8AnlHL0w
         Kkdl+4GITdFpw==
Date:   Wed, 11 Jan 2023 13:42:15 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom,ids: Add a bunch of older SoCs
Message-ID: <20230111194215.kpxjlv3pgniyoglr@builder.lan>
References: <20230104115348.25046-1-stephan@gerhold.net>
 <20230104115348.25046-4-stephan@gerhold.net>
 <20230108214052.GA313089-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108214052.GA313089-robh@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 08, 2023 at 03:40:52PM -0600, Rob Herring wrote:
> On Wed, Jan 04, 2023 at 12:53:47PM +0100, Stephan Gerhold wrote:
> > Sync the SoC IDs in qcom,ids.h with relevant entries from Qualcomm's LK
> > bootloader [1] that is used for almost all older Qualcomm SoCs.
> > 
> > Several of these are already supported, e.g.:
> >   - MSM8960 -> APQ8060, MSM8260, ...
> >   - MSM8976 -> APQ8076
> >   - MSM8956 -> APQ8056
> > Others are currently being worked on, e.g.:
> >   - MSM8909(W) -> APQ8009(W), MSM8905, MSM8209, ...
> >   - MSM8939 -> MSM8239, ...
> > 
> > And even all remaining ones added are close enough to what is already
> > supported so that future support is realistic (if someone steps up to
> > do the work).
> > 
> > Add all of them at once to avoid having to add them one by one in the
> > future. This will also benefit other projects making use of the same
> > dt-bindings, e.g. bootloaders where adding support for all these SoCs
> > is a bit easier than on Linux.
> 
> The promise was in accepting the properties upstream is we'd only be 
> adding these for bootloaders with dtbs that we can't otherwise update or 
> change. Do all of those meet this criteria? Seems unlikely.
> 

Independent of the question about qcom,msm-id and qcom,board-id, I would
like these constants for the socinfo driver (as shown in patch 4).

Would you prefer that we keep a separate list in Linux?

Thanks,
Bjorn
