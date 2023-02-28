Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9EBD6A5E07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 18:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjB1RQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 12:16:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjB1RQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 12:16:20 -0500
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924031A48D
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 09:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=EmgaTU0CUh+MeGrwsO/jjEPOoHwKnfyY2BLslKlFVoE=;
        b=KpNpwny5/MkPDesK/oobFoE061ynXemgk/1DtxZapX6TGt/9wUijPcW89UBUP92p/UJa4xpXYMAL9
         SKJePV33FsWOt5Ii/jUgkmyT9giznthKYMNLD2ALA7qmrOt++m8enmzy2AS9tGckJQRgaIHNwkt+on
         skZ/HFdSk40NNiSIiQzi9uVGhpk+1NSK9DKc2Zlbw5JI+HC5a/3lFXvoln90bnWuaJmN9lPs5I0wpC
         1ge/yLa7O4z+7z81bDMCzxECiCOx+hSu13YIanJbZzAmYI6uEH7tCvWB34vnzrxbG6A+hXrZttggoL
         mTwxE3kR6YG1AOmA+LotlOXx1Qwxttg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=EmgaTU0CUh+MeGrwsO/jjEPOoHwKnfyY2BLslKlFVoE=;
        b=vHOx7rdN9nnzPnAk26CDVYrvNVyE7DniWyscA2R3jJU263cdWLXGw1ZhpmBvASLijat1nYHa+lCuX
         UCwmoTdCQ==
X-HalOne-ID: 9a29ac5f-b78b-11ed-87f3-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id 9a29ac5f-b78b-11ed-87f3-11abd97b9443;
        Tue, 28 Feb 2023 17:16:16 +0000 (UTC)
Date:   Tue, 28 Feb 2023 18:16:14 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
Message-ID: <Y/423tQ2aek/w5h/@ravnborg.org>
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
 <Y+9awrqcQIOQNeaX@ravnborg.org>
 <45387999-a930-c03f-1acd-a02b9b4b3b3b@linaro.org>
 <Y/zOU8cu29hOi9hk@orome>
 <b650c02b-85ba-89d0-4ca4-d37d5017839b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b650c02b-85ba-89d0-4ca4-d37d5017839b@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Neil,

On Mon, Feb 27, 2023 at 05:42:01PM +0100, Neil Armstrong wrote:
> Hi Thierry,
> 
> On 27/02/2023 16:37, Thierry Reding wrote:
> > On Mon, Feb 27, 2023 at 09:22:02AM +0100, Neil Armstrong wrote:
> > > Hi Sam !
> > > 
> > > On 17/02/2023 11:45, Sam Ravnborg wrote:
> > > > On Fri, Feb 17, 2023 at 10:58:15AM +0100, Neil Armstrong wrote:
> > > > > Add myself as co-maintainer for DRM Panel Drivers in order to help
> > > > > reviewing and getting new panels drivers merged.
> > > > > 
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > 
> > > > Thanks for stepping up!
> > > > 
> > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > 
> > > Thanks for you trust!
> > > 
> > > Is there anybody else willing to ack ? Thierry ?
> > 
> > While at it, perhaps you want to remove me from the entry? I haven't
> > had much time to look at these drivers for a while now and Sam has been
> > doing a much better job than I ever have, so looks all in good hands.
> 
> Thanks for your feedback, I can send a v2 with your entry removed,
> is it ok for you Sam ?
It is fine with me, as this reflect the reality.
Keep me, as I expect to occasionally review a few things.

	Sam
