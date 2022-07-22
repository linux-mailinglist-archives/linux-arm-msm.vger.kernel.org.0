Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9BB57D808
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 03:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbiGVBe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 21:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGVBe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 21:34:57 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7E22CDDC
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 18:34:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id e15so4231708edj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 18:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
        b=MFIlp/LiIilyP6VUEC691FGgrKDYwLe0ZTn31yUfuKe208ESUqpgsUsgzvHrgZXuho
         CpRTNoUgxieKQSsv3drg4QbWVAb4S1/EUdYV3IRzwlqztu3dG35B1B1M3F/imiT3P5Am
         7L80f1thRVsnKNVab/YwGzlYyexpswU1yBHkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SVPqfwH/07HlNOv2TRkPmLswn/QUPlQGAJ5mgKuBLO4=;
        b=VExm+YxKL4fznHm9udtDmgn6zMUi7PgB/vg0/2RhqHh/0Oi6wRy7rlh9YoQd6QtPqf
         9tTD1LVvrAwPO3gVGa3mY78U48/vh6hDsu0NBUxoFRJ4c7aMwixTFCUAn06ptN/M4RYJ
         awJYuQp+63/l3loOmdFPAUjX4uBMn1zIy78ImytdFGtgwWXPuqZhtfiw8sTpmTPR1PjA
         Ll2JqJCNOoYebt7QLaUi+MAjwpSokjxH8QQFAEZh3bnZSVLviVbMrxUGHSMeSXqDExSe
         d3uz0JK+0MedPObSXyd/0F/jHEut4VYQdRo7jxjykufgP+iZ13oO5mGOzX/F2qx64wFm
         /2Zw==
X-Gm-Message-State: AJIora9NDXqW732kzjmDrTUtfq6+UHi6NhI1A2CAey7wPHLiSFnvWajK
        SoOfsyC6kWyEUFT93tbZPle9zaEPbLw/4M3oPf8=
X-Google-Smtp-Source: AGRyM1tvb6umQXwzraPQcN8jZwRKGzOBU7ZCz0Ae9WA6o/D2c6h/6MyxHSIcXKK3vkPx81k/zD1E4w==
X-Received: by 2002:a05:6402:5008:b0:437:7f01:82a with SMTP id p8-20020a056402500800b004377f01082amr1147733eda.220.1658453694830;
        Thu, 21 Jul 2022 18:34:54 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id e11-20020a056402148b00b0043a43fcde13sm1815576edv.13.2022.07.21.18.34.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 18:34:54 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso1694508wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 18:34:54 -0700 (PDT)
X-Received: by 2002:a05:600c:4e86:b0:3a3:2edc:bcb4 with SMTP id
 f6-20020a05600c4e8600b003a32edcbcb4mr5596548wmq.85.1658453335156; Thu, 21 Jul
 2022 18:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com> <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
In-Reply-To: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 18:28:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
Message-ID: <CAD=FV=XVxhZwJFmOAg2v1UmfOt9_HWz0LG8M3wac+RkMPGOwYg@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To:     Mark Brown <broonie@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 21, 2022 at 7:52 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > > You could add a way to specify constant base loads in DT on either a per
> > > regulator or per consumer basis.
> >
> > Yes, this please! ...on a per consumer basis. :-) It's been on my
> > wishlist for a while and would eliminate a massive amount of code /
> > tables in the drivers.
> >
> > We could debate syntax, but I guess you'd either do it w/ two cells
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;
> >
> > ...or with matching properties:
> >
> > vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
> > vdda-phy-supply-base-load = <21800>;
>
> Ah, sorry to respond to my own thread so quickly, but I just thought
> of a reason for the "matching properties" solution instead of the two
> cells. It would allow the SoC "dtsi" file to specify a base load while
> the board "dts" file can then specify the supply. That feels like it
> could be a nice solution.

This seemed easy, so I whipped up a quick prototype. Forewarned that I
did very little detailed testing. I didn't CC everyone on this thread,
but hopefully folks can find it if they are interested...

https://lore.kernel.org/r/20220721182622.RFC.1.I8a64b707169cfd73d9309c5eaf5d43b8bc4db988@changeid

-Doug
