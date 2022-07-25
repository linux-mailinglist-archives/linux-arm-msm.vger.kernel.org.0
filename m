Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95784580386
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbiGYRfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbiGYRfY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:35:24 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138B626DC
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:35:23 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l23so21918732ejr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcfOh8Denmd0INMFIRrRqdVhDnIFcHuSf6pHOX9fToY=;
        b=WH/hAjPah1uBmw3psKddZer+8vy7FW/UOnixKrB+/kjw+ykmpEkrhNO+b5uvOM8oW/
         3e+kT8UmZTjU8ipPdcWMrk8WrpAupe1NrWwhhGxtxdfNpzCAQ71Bm0J8L/TVbU/ujyq4
         rG2+lG4xhEnvWdTGsQUPYuN3ru1x8iENLFCM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcfOh8Denmd0INMFIRrRqdVhDnIFcHuSf6pHOX9fToY=;
        b=CI3FyQ+WHx05FSQmeYh8gwSACxyGk/6Hl7eYDALgcQ/wLd3QvHzQIQUKBQArRFWuPk
         oqerydqrzYSb/q0wUmET+tdOsfBj/2DhYlKwG64/WFXymal/a50SQB0KZC92pe0bd656
         6savhOp5nDRb0Ce3xJz6pJnEM1PBdIphrVMNOd9yPVi5Q2pEl29duTq/TRrKXLUIy1/H
         dGMO1FfOvzLIGTVVkshw66VGpH2JW1xr50LJ6o40Jemw2E/R13WuSbcYleF6gaBjC4PO
         mrydsFobBbOyB57X7LCjZcRRxojd4YjQwbzm6DHWFN0I4X40fZgXfySB+JGGV0G+vyB9
         mh5A==
X-Gm-Message-State: AJIora+45OFzJf5PMniST5ViySMYPhDIyHnUF775r4JxpHL/zN1DSeqD
        3t8iPy/ao5O1+lPm+/A5/peic2ZWpKddTjdz
X-Google-Smtp-Source: AGRyM1uCwFmX8KEsl+SZrr83n4lMZSLLlmVyP6lyhqa366+nk8W2UYa1t6bdK12a6nu03+pAGIuBLQ==
X-Received: by 2002:a17:907:86a6:b0:72e:e524:17f5 with SMTP id qa38-20020a17090786a600b0072ee52417f5mr11241025ejc.444.1658770521165;
        Mon, 25 Jul 2022 10:35:21 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id t6-20020a170906608600b0072ecef772acsm5500634ejj.2.2022.07.25.10.35.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:35:18 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id h9so17050550wrm.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:35:18 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr8063195wrf.659.1658770517714; Mon, 25
 Jul 2022 10:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org> <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
 <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org> <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
 <e3eb02f4-daf7-ed69-001f-72a275819af5@linaro.org> <CAD=FV=WYshw8tcDb7dRS-CRdH1q2BOp0g74_qKtvKa1Lzo+mcg@mail.gmail.com>
 <9e012a76-aaab-9525-f3d4-8d84e26325a9@linaro.org> <CAD=FV=XiJd6G0-QExB=SPDNx3TNFyFjyPvUGdkkBGPEe4XYiEw@mail.gmail.com>
 <e3878d93-7c66-1018-ddfc-ab7fd9be1936@linaro.org>
In-Reply-To: <e3878d93-7c66-1018-ddfc-ab7fd9be1936@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Jul 2022 10:35:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXhmmB4uSm=W_Phx9Pp8=WJ7zCKRZoO7zcOFkiLf+8cQ@mail.gmail.com>
Message-ID: <CAD=FV=WXhmmB4uSm=W_Phx9Pp8=WJ7zCKRZoO7zcOFkiLf+8cQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 25, 2022 at 10:29 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/07/2022 19:22, Doug Anderson wrote:
> >>>> You cannot do that...
> >>>
> >>> The bootloader never falls back to just the SoC name.
> >>
> >> There is no "SoC" part of compatible list. Only by convenience we put it
> >> that way, but DT spec does not define first compatible to be for
> >> platform because they all are[1], therefore following your earlier
> >> description - bootloader should load BAR DTS on FOO device just because
> >> qcom,sdm845 matches.
> >
> > As documented in "Documentation/arm/google/chromebook-boot-flow.rst",
> > the bootloader creates a match list to pick a device tree file. It
> > never creates a match list that has just the SoC. It always picks
> > based on the board name and never falls back to just the SoC name.
>
> So this means you embedded some custom-interpretation of board
> compatibles in bootloader. What stops you to customize it even more,
> that the bootloader must always pick the most specific compatible? IOW,
> it cannot load DTB from more generic compatible (just like it should not
> load qcom,sdm845 DTS)?
>
> I understand the limitation of board compatibles for your case, but I
> still believe it is wrong usage of it.
> If the usage - by principle - was correct, then you would not need to
> add the restriction you mentioned above ("never creates a match list
> that has just the SoC").
>
> Because when Linux drivers match, they do not have such restriction...

I think we're essentially re-hashing a previous discussion that led me
writing the documentation of how depthcharge boots. It's probably not
worth rehashing. Depthcharge isn't going to change unless we find a
compelling way to solve all the use cases we described last time we
talked about this. I honestly think the "backwardness" stems from the
fact that in the normal case we start with a dts and pick a driver and
in the FIT image / bootloader case we are picking a dts. Those are
fundamentally different needs.

-Doug
