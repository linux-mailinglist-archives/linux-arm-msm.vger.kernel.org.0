Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E98C44FA0A3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbiDIA1j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbiDIA1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:27:39 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A166F59
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:25:34 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e1dcc0a327so11442965fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CvlOdjB3+vMb6WfMdUSPA5S26ij9hqMmlmfhzTzVzxI=;
        b=wZhHDtzhnnFaf/Z3RS31qNESt7qcuJ96Rnd3jTFaDL1H9hwO4HauDN+NBCDXbKvxbY
         PBMrtdLGVWur2kZ+wwhZhuU9mrOOTBI68t5QJcUenc+v6UUeKfIg/UWDsfLAA4Ux+Jy4
         r8Zwk85YlaNSVA0LAcJfTI4ITooqyL0Rg7F2/He1XjFHlEDTlNMmg+m1olhpWeg9HWJ+
         oQy9pweBwsXh/H3G9qfcS+I5gEj6ik2W1AoXsW5SbhZPhfVmPoLu7W6+GVT/Vg+14/NA
         6HmlJ2Fk5EweDNg50moxn0BC6RSmKiTBBToM7DH3uG1Mq/b3yErXPR+gDGZp0pN3z2ii
         rQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CvlOdjB3+vMb6WfMdUSPA5S26ij9hqMmlmfhzTzVzxI=;
        b=EVERg3ivqz22mLyVTzKfvl8gdfGT3bSr+NP6hRizZo8dSs9AvD0LSNhDTEoaraIglH
         f2yPLBFZ3DIuina+qwXkimHiBdsXa/KCJ0xw2QwEvm7frccxXwabxt3YeIyctw4FIJqO
         urAIWuTZ3rpyrdin6HSiIvJotF6FwlRzmlprzps8GQ0nhjHm5b72oSvfTnwINVG//3uB
         6f/Vpbx6dpmWZB/mXOYUX8iO1oTF49nSwoxUFPbBaG5w49G2d4rjLc75Ta1AS0Xiraku
         CdjYIhKlec3VB134yI8e6GBmTrV4GfUg4FrhearJJ4Aanp7XU70Xq5pkJYfIkXG2sHSf
         +Z7A==
X-Gm-Message-State: AOAM530Zcw6Gr8OX6TW4CJOGgGGsqUpNPy3BwTO3MgNm9cziYGSjXh/K
        Ya1371SjvdDC0L7IoBtZoumAjw==
X-Google-Smtp-Source: ABdhPJzbsFxjcWZN1TMqg+51RtfqLPl+jfoL9LAzWFSbkcgl9I40vmhI7hD5QVaapMbQwBJuKnO8Ew==
X-Received: by 2002:a05:6870:51cd:b0:e2:6cd2:f21a with SMTP id b13-20020a05687051cd00b000e26cd2f21amr4621573oaj.7.1649463933469;
        Fri, 08 Apr 2022 17:25:33 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568301e7100b005b256697d7csm9587232otr.72.2022.04.08.17.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 17:25:32 -0700 (PDT)
Date:   Fri, 8 Apr 2022 19:25:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250: move sound node out of soc
Message-ID: <YlDSelofsuI0LfyT@builder.lan>
References: <20220328143035.519909-1-vkoul@kernel.org>
 <20220328143035.519909-5-vkoul@kernel.org>
 <3cc9c1a0-45f3-cb1b-1991-f51da4789afd@linaro.org>
 <YkHs5TuYBKmOLrHO@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkHs5TuYBKmOLrHO@matsya>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Mar 12:14 CDT 2022, Vinod Koul wrote:

> On 28-03-22, 17:14, Krzysztof Kozlowski wrote:
> > On 28/03/2022 16:30, Vinod Koul wrote:
> > > The soc node expects all the nodes to have unit addresses. The sound
> > > node does not have that which causes warnings:
> > > 
> > > arch/arm64/boot/dts/qcom/sm8250.dtsi:2806.16-2807.5:
> > > Warning (simple_bus_reg): /soc@0/sound: missing or empty reg/ranges property
> > > 
> > > Move sound node out of soc to fix this
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > 
> > I don't know the SM8250, but usually the sound node (e.g. containing
> > audio-codec) is not part of SoC. I propose to remove it entirely from
> > DTSI and define in same place in each DTS. It makes more sense logically
> > in such case - one clearly see which board defines the sounds, which
> > does not.
> 
> Most of our boards have sound, should we duplicate it in all the
> boards..? Bjorn..?
> 

But is the sndcard platform or device specific? E.g. all the SDM845
boards seems to use either qcom,sdm845-sndcard or qcom,db845c-sndcard.

Are there room for some common properties in this node?


Otherwise it seems reasonable to skip it in the platform dtsi.

Regards,
Bjorn
