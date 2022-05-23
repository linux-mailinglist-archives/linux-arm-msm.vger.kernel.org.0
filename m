Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E005319D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 22:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241504AbiEWSrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 14:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242287AbiEWSrj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 14:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8177F35DE0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653330622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+GHDu8bX018Pj56HhIIQXnjcT5ZvQ3bky+5co5y7CGo=;
        b=GxdkuVQwAKotC5mXQEw2wmn84Dyt4pwmCpvHYswabV4SVjmATsenFyPekfR+Xt5kIn0FL2
        TZozsXW79oAsSsvT+8oz7H1iaybe/3TPGw/i7w1tY3MxVp9Eqin24sGNYc7uNIWgmSsJUv
        ax/2AwFojxR+lbnmRkUgVFYdj2NmqqE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-JxosqX3bMjuXOqw74srEzA-1; Mon, 23 May 2022 14:30:21 -0400
X-MC-Unique: JxosqX3bMjuXOqw74srEzA-1
Received: by mail-qt1-f198.google.com with SMTP id d13-20020ac85acd000000b002f3be21793dso12137154qtd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 11:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+GHDu8bX018Pj56HhIIQXnjcT5ZvQ3bky+5co5y7CGo=;
        b=6LFgPukBS10qLiFb+3WIVBChdqCn37gJIFewGoc3D2ee18NP1BpjexR1T+on09Zv6o
         brXi4MEUpG2amNZ530qNsoDKHEKU8JkNv8DhDNkRuEuRt2PMk9k06VDjR3BaoPC95Fu5
         FXkDrYuqSOSOIex6EzqbF2lcfLl3prm/B9tktoE49fIA5zxWOQg0fR/XHw+8IptXxMIC
         6oAofbjQkU1fJ/Y50gBMqadv/QAItNdFMvDWf2vUk5kqQCDJbEYrBF9BE51sYHOFFw2z
         OiYUmHgaxEfLLir8kt4ubuxFIl+sjTSaevLbv7O4H8XusPGikM30s7H+7AXBxkGqD2o4
         qiXw==
X-Gm-Message-State: AOAM531GO3ExQDCCcs/HoA5D4UgBG1O+M1jP2OaETW9F/tX3P9JNbX6G
        kB3Q+9HnF4rq3Lj8PdJ4LDeOysVCBZfwUD86FvgZrFIzbZ7gpV68b67ezHfNR2rcCoCzNSGhG9q
        QokBGVzvTbtOJoSjd26uvpLoFWw==
X-Received: by 2002:a05:620a:29ce:b0:6a0:e9a:f7a2 with SMTP id s14-20020a05620a29ce00b006a00e9af7a2mr14909664qkp.479.1653330620340;
        Mon, 23 May 2022 11:30:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiHkoWHUvw+vM4ygrqlFJMksFa2jJVr/bYTmHbbZwPGQtQuPfxdNSMdEAKmnGv/bC5IUBo3Q==
X-Received: by 2002:a05:620a:29ce:b0:6a0:e9a:f7a2 with SMTP id s14-20020a05620a29ce00b006a00e9af7a2mr14909649qkp.479.1653330620095;
        Mon, 23 May 2022 11:30:20 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id m201-20020a37a3d2000000b006a34f6a7840sm4630388qke.57.2022.05.23.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 11:30:19 -0700 (PDT)
Date:   Mon, 23 May 2022 14:30:18 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
Subject: Re: [RFC PATCH 00/14] CAMSS support for MSM8974
Message-ID: <YovSurcGlyPW7v9s@xps13>
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <638d6986-616f-4a1c-f1d0-82835b000b2a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <638d6986-616f-4a1c-f1d0-82835b000b2a@linaro.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 23, 2022 at 03:39:53PM +0300, Dmitry Baryshkov wrote:
> On 22/05/2022 19:27, Luca Weiss wrote:
> > This RFC series adds support for CAMSS and CCI that are found on
> > msm8974, including the OV8865 found on the FP2.
> > 
> > The only reason it's marked RFC is that CAMSS doesn't behave properly on
> > this SoC without the last commit which is obviously not upstreamable.
> > Not sure if this should be a blocker for including most of the other
> > patches because other than that it seems to work fine and I can get a
> > picture from the camera sensor. When/if msm8974 gets IOMMU support I
> > hope this should be resolved and it works without this hack.
> > 
> > I think at least the CCI patches could get applied as they're not
> > dependent on the CAMSS hack?
> 
> I'd also vote for the camcc patches to be applied.
> 
> As for the camss, I'd suggest to get them verified to work properly with a
> hacked/non-upstreamable/etc. IOMMU driver if one exists. Otherwise we can
> easily get into a situation where we merge up code that contains bugs
> itself.

Last I checked, there's no IOMMU driver for msm8974 that works with an
upstream kernel at the moment. About 2 years ago, I took a stab at
attempting to enable IOMMU for the display and ran into some issues that
I documented at:

https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/

I'm not familiar with this part of the hardware and haven't had time
since then to look into this further.

Brian

