Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9968A5AB8A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Sep 2022 21:00:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbiIBTAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Sep 2022 15:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbiIBTAu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Sep 2022 15:00:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A8326AE5
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Sep 2022 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662145174;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H80XyH2N7aCchJ9N825/YoSYVLsh+URbySgK/RUDEoA=;
        b=euTZUAvje9SvmCeEVFZhbKL1jty5BDj7CvvChNVPg7pmH5rINPqLRD0zvtiWBSOkk8I3wF
        lEKayjA1aDE0jnQTVTpCaCWAVGMUwftufHvJj0JAdKRM4Ld0jmdspapocVz62z0HYnLM8/
        q6Plfj1AY8IpOJ53s9dgtB+o4N/109I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-Kw5qiCwYMiuRmJpSQg0wAQ-1; Fri, 02 Sep 2022 14:59:32 -0400
X-MC-Unique: Kw5qiCwYMiuRmJpSQg0wAQ-1
Received: by mail-qk1-f199.google.com with SMTP id f1-20020a05620a280100b006bc4966f463so2642682qkp.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Sep 2022 11:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=H80XyH2N7aCchJ9N825/YoSYVLsh+URbySgK/RUDEoA=;
        b=4e3ortO4hPX3LIFOkHhgR5PuCBfQlqHJi9p40aVXPW7KC5KiWBKnqjI66tRcxyb8lS
         CPiNA8EsrXuSVujIbyaf/xcl7pigrnV75IGDgFje0JuEcWxkjPoUgn/uV8SOHFVCOVsR
         E8mPaTruSMllB0G+zQi60WZcrdtGUClSlwIVtV/7ukhYv35RLCP5EcSTaWSooCySQQkO
         rbIQSVtu5iORjJfI2c7uZ9S4KtGGJy+IGJfMFKxks0xO405shHiZs9Tgs1ZobHdfp6xj
         yvjLRGyqO3WIddS5j9acetLR0MDfv0pPeRNZtTWom/A6B5ta0SxEGzOIPB8PCP8Joyes
         iBlQ==
X-Gm-Message-State: ACgBeo0Al+Nf00kKFdKCpDfD5adPKKwgSKnidtDJHZdy/KDZmhY7FAgu
        +hxoqPZ3NZsAoUySovQ/hFXXpEEo+XQpVIMr3X4bEDE8k5X7d/alV4SdumIKqHgcsThmhV3NRom
        M9/airkEAntWXczh8WWNtR4Pi8g==
X-Received: by 2002:ac8:5f4e:0:b0:345:45d:3701 with SMTP id y14-20020ac85f4e000000b00345045d3701mr26282881qta.139.1662145172314;
        Fri, 02 Sep 2022 11:59:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR41hWF9IJZjwNXKlnh3T9+X9HUpRDCKbeZtCv0S7Oyvg6g28jlT1XsqH8jQWmRStgRETdOKLA==
X-Received: by 2002:ac8:5f4e:0:b0:345:45d:3701 with SMTP id y14-20020ac85f4e000000b00345045d3701mr26282859qta.139.1662145171991;
        Fri, 02 Sep 2022 11:59:31 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a166300b006b5c061844fsm1805812qko.49.2022.09.02.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 11:59:31 -0700 (PDT)
Date:   Fri, 2 Sep 2022 13:59:29 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: Fix broken regulator spec on
 RPMH boards
Message-ID: <20220902185929.neoizjcrmxuxgqaw@halaneylaptop>
References: <20220829164952.2672848-1-dianders@chromium.org>
 <Yw8EE/ESDUnIRf8P@hovoldconsulting.com>
 <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
 <20220831190018.3dexkam3efdcfysf@halaneylaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831190018.3dexkam3efdcfysf@halaneylaptop>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 31, 2022 at 02:00:18PM -0500, Andrew Halaney wrote:
> On Wed, Aug 31, 2022 at 07:52:52AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 30, 2022 at 11:47 PM Johan Hovold <johan@kernel.org> wrote:
> > >
> > > On Mon, Aug 29, 2022 at 09:49:46AM -0700, Douglas Anderson wrote:
> > > > Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> > > > get_optimum_mode(), not set_load()") several boards were able to
> > > > change their regulator mode even though they had nothing listed in
> > > > "regulator-allowed-modes". After that commit (and fixes [1]) we'll be
> > > > stuck at the initial mode. Discussion of this (again, see [1]) has
> > > > resulted in the decision that the old dts files were wrong and should
> > > > be fixed to fully restore old functionality.
> > > >
> > > > This series attempts to fix everyone. I've kept each board in a
> > > > separate patch to make stable / backports work easier.
> > >
> > > Should you also update the bindings so that this can be caught during
> > > devicetree validation? That is, to always require
> > > "regulator-allowed-modes" when "regulator-allow-set-load" is specified.
> >
> > Yeah, it's probably a good idea. I'm happy to review a patch that does
> > that. I'm already quite a few patches deep of submitting random
> > cleanups because someone mentioned it in a code review. ;-) That's
> > actually how I got in this mess to begin with. The RPMH change was in
> > response to a request in a different code review. ...and that came
> > about in a code review that was posted in response to a comment about
> > how awkward setting regulator loads was... Need to get back to my day
> > job.
> 
> I can take a stab at this during the week here I hope.. I owe Doug for
> the slew of patches and have wanted to peek at how all the dt-binding
> validation stuff works anyways.
> 

Here's my attempt after a couple hours of banging the head on the wall:

    https://lore.kernel.org/all/20220902185148.635292-1-ahalaney@redhat.com/

Thanks,
Andrew

