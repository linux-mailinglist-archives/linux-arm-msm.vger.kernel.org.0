Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE595573A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 17:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbiGMP0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 11:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiGMP0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 11:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3470045050
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657725979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kJkaLG9WJPX2u3dxR5FbaiE55jud0LnanxlOTAFcW1A=;
        b=FAEf1mNzrZB9i5dSmcNbadUs0Nn8/UcUDWon7hp+V85zHf/GXZiMT+7wXHY6KKr0Mo3JkS
        glsE7o1Y5OVfGm4IW20vRqbr0XLNn2uaGpCcL3lj0n2n6QCW8dbFuZVr6uLTTmvJdxRoTp
        s586MkOd+bx21DaP37iIabtmXlYOHUc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-8w3pt6_5MGaFOb3sxyofqA-1; Wed, 13 Jul 2022 11:26:16 -0400
X-MC-Unique: 8w3pt6_5MGaFOb3sxyofqA-1
Received: by mail-qt1-f199.google.com with SMTP id x10-20020ac8120a000000b0031ea260a047so9331481qti.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kJkaLG9WJPX2u3dxR5FbaiE55jud0LnanxlOTAFcW1A=;
        b=vD3Yxl9nZWVJbxNvRsf5BWdQlsD6QVvPxyxMYnDIxLFdCRzFX52z0+iY2XTm+2cbMp
         3efr2g4IQ2e/v5YvQw01l1IORJiyIbaiOoM0qDWGoXi+8XEgey8bqdBq61+E9aLXk6Hm
         +6ezJLw04KzGZICzj3q+bL0YXDmOb7+lNGDx4ysl4BVb88VbLpbEguiHkCDyq8qlLUwC
         y8xIT3vsQIQkyXH/lFGTnnXWwZoZeYrRHfm1qo9RNHuqnJFU3b+8K1Nm0CyqT9KXjZof
         WBBbbddSR85Yb55m/PI8XiMqS5BOmltXdnAgS8gyEHxOFO9F2FWEsR4MIfzjjM5mGawe
         hD/g==
X-Gm-Message-State: AJIora9FiqryJv6GhH5wxyBpOSh60xFMYwfryquEFTAjn1dUn58gGN2q
        T9zlmhR7lE1iJ6TX2o4uE1lWXvQX+x7zoeq90pKz1HPGEikp0+sYOIxWGrXCph884dnBTkgal+U
        iMcYbkFQPsS5vc8aOnjdeMNxqCg==
X-Received: by 2002:a05:622a:181:b0:31d:476f:58a3 with SMTP id s1-20020a05622a018100b0031d476f58a3mr3649842qtw.389.1657725975632;
        Wed, 13 Jul 2022 08:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uzqnK0jx1FbXH/slmZUIowJUVoVFeBmckvJKf1obuBX6QrR/01EHH5oxL61vgfFSoL3RdjWQ==
X-Received: by 2002:a05:622a:181:b0:31d:476f:58a3 with SMTP id s1-20020a05622a018100b0031d476f58a3mr3649816qtw.389.1657725975426;
        Wed, 13 Jul 2022 08:26:15 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id dt8-20020a05620a478800b006a91da2fc8dsm9032814qkb.0.2022.07.13.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:26:15 -0700 (PDT)
Date:   Wed, 13 Jul 2022 10:26:13 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Steve Capper <Steve.Capper@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix PMU interrupt
Message-ID: <20220713152613.yofokevcwzm2lc4x@halaneylaptop>
References: <20220713143429.22624-1-manivannan.sadhasivam@linaro.org>
 <Ys7c0JGAV7AAEjaO@hovoldconsulting.com>
 <20220713151305.GA4591@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713151305.GA4591@workstation>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 13, 2022 at 08:43:05PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jul 13, 2022 at 04:55:12PM +0200, Johan Hovold wrote:
> > On Wed, Jul 13, 2022 at 08:04:29PM +0530, Manivannan Sadhasivam wrote:
> > > PPI interrupt should be 7 for the PMU.
> > > 
> > > Cc: Johan Hovold <johan+linaro@kernel.org>
> > > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > > Reported-by: Steve Capper <Steve.Capper@arm.com>
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > index 268ab423577a..2d7823cb783c 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > @@ -477,7 +477,7 @@ memory@80000000 {
> > >  
> > >  	pmu {
> > >  		compatible = "arm,armv8-pmuv3";
> > > -		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> > > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > >  	};
> > >  
> > >  	psci {
> > 
> > The interrupt number matches the vendor devicetree I have access to, but
> > the vendor source also has IRQ_TYPE_LEVEL_LOW instead of
> > IRQ_TYPE_LEVEL_HIGH here.

+1 to what I see as well, fwiw. Totally missed that when reviewing
earlier.

> > 
> > Is that another copy-paste error, perhaps?
> > 
> 
> I don't have access to the documentation of this SoC now but since Steve
> tried with IRQ_TYPE_LEVEL_HIGH and it worked for him, I think it is best
> to leave it as it is.
> 
> Thanks,
> Mani
> 
> > Johan
> 

