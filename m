Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7EF699DF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 21:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjBPUjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 15:39:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjBPUi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 15:38:59 -0500
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2235F1ADE1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 12:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=TAf5FaFWgaAobTsHmNZifXXinFg3H6wFJmu2/SVU+mQ=;
        b=Sz7ZXf/2yyIOMtbTwbV1PlKgYf1m2Mw40QVOZwPQw6Aul7ZSJf/jowshvB3FazFGsXLn9h5ji+PKD
         2m9xsB0IUx+a0oTypLroix0E3iQfSeFc48cnchHAhCgcZ115JBDQMUrSEGfKtttCx+oEJ7dOM9PtCF
         KXXRpSSqxNZuue5ZgXsu3d8f4r1MH+O0zio4xfYnyP5P5O7b5eBCdwyqKoLqBmkH9rRe/hUF3UYREZ
         2cZrKJRRxeIUw4+XGPfc52Z7kMP9wmHERxh1QursGQWQqvaIZLZ3WcKkb3M+gQAD7cjDqWlrzX+RFW
         mA8iz9Hefb4v3dtqqEwL6A2T8mWrSEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed2;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=TAf5FaFWgaAobTsHmNZifXXinFg3H6wFJmu2/SVU+mQ=;
        b=CP3RWAZPoCyuX/quz9OsUdpj7pLihvKW+ldH3BK5kwNVKC/AZWMwa9wjmgpe4dzC28dwRDHNa6+ui
         qoN7mfODA==
X-HalOne-ID: c772af14-ae39-11ed-8e96-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay4 (Halon) with ESMTPSA
        id c772af14-ae39-11ed-8e96-87783a957ad9;
        Thu, 16 Feb 2023 20:37:53 +0000 (UTC)
Date:   Thu, 16 Feb 2023 21:37:51 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     neil.armstrong@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] gpu/drm/panel: Add Sony TD4353 JDI panel driver
Message-ID: <Y+6UHxHaiF6Aw4du@ravnborg.org>
References: <20230119163201.580858-1-konrad.dybcio@linaro.org>
 <20230119163201.580858-2-konrad.dybcio@linaro.org>
 <725a5727-fdde-e3ae-a448-2679c5c4c7f4@linaro.org>
 <CAKMK7uFpc3Kg=Ym6ee_JTZo-0h2ig7Twtf2uwE7oV-1c6YRP=Q@mail.gmail.com>
 <8ab061aa-a2fa-3070-a756-5682eb40a425@linaro.org>
 <CAKMK7uHd7Lefc+ZjvuHtrttkQFYDF8XSsKUV2gfGs9=cw1GTKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHd7Lefc+ZjvuHtrttkQFYDF8XSsKUV2gfGs9=cw1GTKw@mail.gmail.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 16, 2023 at 01:49:23PM +0100, Daniel Vetter wrote:
> On Thu, 16 Feb 2023 at 13:47, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >
> > On 16/02/2023 13:32, Daniel Vetter wrote:
> > > On Thu, 16 Feb 2023 at 12:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >>
> > >>
> > >>
> > >> On 19.01.2023 17:32, Konrad Dybcio wrote:
> > >>> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> > >>>
> > >>> Add support for the Sony TD4353 JDI 2160x1080 display panel used in
> > >>> some Sony Xperia XZ2 and XZ2 Compact smartphones. Due to the specifics
> > >>> of smartphone manufacturing, it is impossible to retrieve a better name
> > >>> for this panel.
> > >>>
> > >>> This revision adds support for the default 60 Hz configuration, however
> > >>> there could possibly be some room for expansion, as the display panels
> > >>> used on Sony devices have historically been capable of >2x refresh rate
> > >>> overclocking.
> > >>>
> > >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > >>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > >>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >>> ---
> > >> Are there any outstanding issues with this driver, or perhaps I did
> > >> not CC some important list? It has gotten very little activity ever
> > >> since its initial submission around Sept'22..
> > >
> > > Sam is usually picking up panel drivers these days, but maybe we need
> > > a bit more help in this area? If anyone from linaro has a handful of
> > > drm patches landed in upstream they could apply for drm-misc commit
> > > rights and help push these. I think linaro has lost a few of the
> > > drm-misc committers so things tend to be stuck a bit more :-/
> >
> > I usually wait for Sam to comment before applying my panel patches drivers to drm-misc-next,
> > but yeah panels would need some more help...
> >
> > If needed I can add myself to the panel drivers maintainance aswell.
> 
> I think that would be great, maybe just send out the MAINTAINERS patch
> and ask Sam to ack?

That would be great, and I am more than happy to ack it.
According to MAINTAINERS Thierry is the panel maintainer and I am reviewer.
So you should ask Thierry to ack it too.

	Sam
