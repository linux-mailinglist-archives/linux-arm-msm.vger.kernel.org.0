Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5980D5A8649
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 21:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbiHaTAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 15:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbiHaTAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 15:00:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C757BC94
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661972423;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rUjqtYUIKxPVVYBFMkLE+l8nb11gl1oPqWCY/ZAXF6g=;
        b=ETCA53LRr45mqMghPdoH/+y92nsQeqIoW2BapBlWfqozAl5tGtCxY27CuoJpruoQI7xSy6
        Z3EcTRPEjqtos/3+Wa1QI5lWzRirZgylqwlf3hos65RR6KFUAYfEAZR8Adc5IV8y2P9ZyR
        R99Tt/BwBElRamJga5nrXIEazpOglSw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-jWJLdQv8PjyRW_S4TXB0fw-1; Wed, 31 Aug 2022 15:00:22 -0400
X-MC-Unique: jWJLdQv8PjyRW_S4TXB0fw-1
Received: by mail-qk1-f198.google.com with SMTP id l15-20020a05620a28cf00b006b46997c070so12608347qkp.20
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 12:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=rUjqtYUIKxPVVYBFMkLE+l8nb11gl1oPqWCY/ZAXF6g=;
        b=jfznx2YavvWvXw1QR1MAeJDf3LqhsXts3WnkNktW4vLLPsVa9/3Ld25Ij5+XOnT1Tj
         gUmmFMzheUrxQYbCzSD9UltR3bMcvwHObGIFdhu4hmpXVok7HbGvfLvpTDS6FaJaqpP5
         aAFwapT9hcXeemNlqIPciHuRevIvaQ+zxj97AN+Amfmgd/yFN//Pz7rXu073Mbq2Xrka
         NwyxUnVnFfhIKixai+8Nt2HkUCUBxfq1rlqOx+cwkLE+G4YaB/Qvo2d8zuBM92SlwLHq
         a1QOZOpiZxO+Pq7Fe6y1xaSWXHcDpbmgp4ReO35P5c4XuRBdpyba6g7tVvm8m7yGPRC1
         mQqQ==
X-Gm-Message-State: ACgBeo1UhR8Y0UXbdSvjw/vqar2xVhz8JRO24qvyIGABOiMIbFt5Sjk1
        UO69kbHaY1UwOkmYAK7umtNDpH2fxXApFon6IcecLPFr88omUUZVBAsuilejVGFzdwyR10MhTKV
        LX0g5w3LcZa8Mamg8+L3qz4yTpg==
X-Received: by 2002:a05:620a:4627:b0:6bb:b3af:f5f7 with SMTP id br39-20020a05620a462700b006bbb3aff5f7mr17071675qkb.71.1661972421173;
        Wed, 31 Aug 2022 12:00:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7zQF5gysCuQ9o1Jwi4N5e6+DIpOgT7moa77V5ta8D39VzNAd+5uJptd77sjX36fmyC42DCpA==
X-Received: by 2002:a05:620a:4627:b0:6bb:b3af:f5f7 with SMTP id br39-20020a05620a462700b006bbb3aff5f7mr17071648qkb.71.1661972420924;
        Wed, 31 Aug 2022 12:00:20 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::48])
        by smtp.gmail.com with ESMTPSA id t8-20020ac865c8000000b0033c36ef019esm8474410qto.63.2022.08.31.12.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 12:00:20 -0700 (PDT)
Date:   Wed, 31 Aug 2022 14:00:18 -0500
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
Message-ID: <20220831190018.3dexkam3efdcfysf@halaneylaptop>
References: <20220829164952.2672848-1-dianders@chromium.org>
 <Yw8EE/ESDUnIRf8P@hovoldconsulting.com>
 <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VJz2hjvsUhsjBPt9nmm3X62oTdAqMeSFABYJietPPzWw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 31, 2022 at 07:52:52AM -0700, Doug Anderson wrote:
> Hi,
>
> On Tue, Aug 30, 2022 at 11:47 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Aug 29, 2022 at 09:49:46AM -0700, Douglas Anderson wrote:
> > > Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> > > get_optimum_mode(), not set_load()") several boards were able to
> > > change their regulator mode even though they had nothing listed in
> > > "regulator-allowed-modes". After that commit (and fixes [1]) we'll be
> > > stuck at the initial mode. Discussion of this (again, see [1]) has
> > > resulted in the decision that the old dts files were wrong and should
> > > be fixed to fully restore old functionality.
> > >
> > > This series attempts to fix everyone. I've kept each board in a
> > > separate patch to make stable / backports work easier.
> >
> > Should you also update the bindings so that this can be caught during
> > devicetree validation? That is, to always require
> > "regulator-allowed-modes" when "regulator-allow-set-load" is specified.
>
> Yeah, it's probably a good idea. I'm happy to review a patch that does
> that. I'm already quite a few patches deep of submitting random
> cleanups because someone mentioned it in a code review. ;-) That's
> actually how I got in this mess to begin with. The RPMH change was in
> response to a request in a different code review. ...and that came
> about in a code review that was posted in response to a comment about
> how awkward setting regulator loads was... Need to get back to my day
> job.

I can take a stab at this during the week here I hope.. I owe Doug for
the slew of patches and have wanted to peek at how all the dt-binding
validation stuff works anyways.

Thanks,
Andrew

>
> In any case, I think these dts patches are ready to land now.
>
>
> > Perhaps at least for RPMh as it seemed you found some cases were this
> > wasn't currently needed (even if that sounded like an Linux-specific
> > implementation detail).
>
> I think you're talking about the RPM vs. RPMH difference? It's
> actually not Linux specific. In RPM the API to the "hardware"
> (actually a remote processor) is to pass the load. In RPMH the API to
> the hardware is to pass a mode. This is why RPMH has
> "regulator-allowed-modes" and "regulator-initial-mode". Both RPM and
> RPMH have "regulator-allow-set-load" though...
>
> -Doug
>

