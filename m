Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 496F0702138
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 03:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbjEOBlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 May 2023 21:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjEOBlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 May 2023 21:41:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E38E170B;
        Sun, 14 May 2023 18:41:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20E5661B5C;
        Mon, 15 May 2023 01:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD91C433D2;
        Mon, 15 May 2023 01:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684114864;
        bh=79lWb3D7lA4dEhtUweaJXHJcOyYQuE3lhF99vOoPvus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KfOxkjKk//cAqrgPGIWIx4zmzZIhWIfhvE70oxhX8EWydVjSWjP3eg6drFuw8cyHp
         ZyTdyKgKNEtJFsJZG/ez6yVgH9xShT8vAxrQjqOs8UF2l5dmC4otBT2yi6VpZMbZh4
         oQGj2qMDasMW4teQ1uoViJGkRIld5ng1KArRJSR00aPNt+beUNFQOQGvydyTEzCNZx
         4wY3QptbNtrPVp05iSwm3F+5xofr0ohjyBE8trJ9QHXErQgpa0EhuPe3GGO+vbkUNl
         szLsneRyHURh100f6C9wr3FAYUt/vq7MAuRYMkcm9SwYgRl6BwXJhxFwKgOCopOoVA
         S4QS5H6Y4ST1A==
Date:   Sun, 14 May 2023 18:44:57 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: qcom: add device tree for DB845c working
 in dual DSI mode
Message-ID: <20230515014457.gqbvyyr75bnvi724@ripper>
References: <20230118082048.2198715-1-dmitry.baryshkov@linaro.org>
 <20230118173242.cjh5izohjros6wxd@builder.lan>
 <DFBA966D-3AAF-4E6D-880C-897CB901AEE1@linaro.org>
 <20230407164833.2ws22rr4lu6g25dj@ripper>
 <da2d90cf-1f36-7c59-7b29-ee98ab85f960@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da2d90cf-1f36-7c59-7b29-ee98ab85f960@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 07, 2023 at 08:09:23PM +0300, Dmitry Baryshkov wrote:
> On 07/04/2023 19:48, Bjorn Andersson wrote:
> > On Wed, Jan 18, 2023 at 08:47:53PM +0200, Dmitry Baryshkov wrote:
> > > 18 января 2023 г. 19:32:42 GMT+02:00, Bjorn Andersson <andersson@kernel.org> пишет:
> > > > On Wed, Jan 18, 2023 at 10:20:48AM +0200, Dmitry Baryshkov wrote:
> > > > > While we are testing the DB845c working in dual DSI mode (which is
> > > > > required for the 4k support), create a separate device tree using this
> > > > > configuration.
> > > > > 
> > > > 
> > > > I don't think it's right to change the DTB on your device depending on
> > > > your TV's ability to do 4k or not...
> > > > 
> > > > I ran into this problem when playing around with 4k-support on the RB3
> > > > as well a while back. I was not able to figure out a way to run the
> > > > lt9611 off two inputs for the lower resolutions and ended never posted
> > > > anything because I couldn't come up with any good solution.
> > > 
> > > 
> > > This is implemented with the latest lt9611 patchset, referenced in the patch annotation.
> > > 
> > > I posted this as an RFC with the separate dts to let people test dual DSI, DPU wide planes, etc. and to compare that with plain old single link DSI/lt9611.
> > > 
> > > > 
> > > > 
> > > > Would it be possible somehow to describe the two ports in DT, but have
> > > > the display driver use one or both depending on the number of inputs
> > > > needed by the lt9611?
> > > 
> > > This would be very problemsome. Even switching the number of lanes
> > > goes against the standard and is not supported by Linux kernel.
> > > Supporting switching the host off and on would be a real troublle.
> > > 
> > 
> > Does this imply that switching resolution in runtime is not possible for
> > any of these DSI->HDMI/DP/eDP bridges?
> > 
> > The immediate worry is that we need 4k and non-4k variants of every
> > mezzanine (unless we start doing overlays). But beyond that I still
> > don't like the fact that you need to change firmware depending on which
> > monitor/TV you're going to connect the board to. (And with the current
> > boot.img-based design, this is overly cumbersome)
> No. With the latest lt9611 driver and with the current msm/msm-next it
> should not be necessary to have a separate dtsi. I submitted this patch as
> an RFC to let people compare 2xDSI vs single-link cases. Currently I'm happy
> with the way it works, so I can probably send this as a patch to main
> sdm845-db845c.dtb.
> 
> As a background info:
> - lt9611 driver can utilize either one or two DSI links
> - drm/msm can output 4k over two DSI links in bonded mode.
> - drm/msm will still utilize two DSI links for smaller resolutions
> (switching between single and bonded DSI modes doesn't seem practical).
> - If just one DSI link is supplied, 1080p is the maximum resolution that can
> be supported.
> 

Sorry, I missed your reply earlier. If we can run the lower resolutions
off two bonded DSI I think we should make that the default
configuration - it's just that when I tried it a few years ago I had
problems getting a working output... But much has changed since then.

There is a dip switch to allow one of the DSI links to be passed onto
one of the HS-connectors, but for anyone to use that they would need a
mezzaine dts anyways, so they can unbond the DSIs there.

Regards,
Bjorn
