Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5685333B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 00:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242489AbiEXWzY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 18:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234819AbiEXWzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 18:55:23 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C89A6AA4A
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 15:55:22 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id f9so38324423ejc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mRekGLDNoP5rx+B/vd1upb7Kog4EGMQSA7iBIC0Yezs=;
        b=Gv/w8RNRdDD3hMud5SnXZlnk9lZvZKr0+Er5LfMrhCX40eBKdAxYrF6Y3WtLOnsME5
         GDhztOnfzyoaXqkUhjNFShhdy4rmAyuPrTA9VkHja5PF/eBdJgO+LH5Gt8i/31ELd305
         CMup3uVMJAR4BVAAVXA1WXI9ctzjuWjapyJJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRekGLDNoP5rx+B/vd1upb7Kog4EGMQSA7iBIC0Yezs=;
        b=RX2Y336SV1y3ufDklJdTRtOHrMCmO9UHeCSIEMZE5qC19SR4Ch5EBQtKDNUgepq6YU
         /zDAas0eH6rP+VYLj8byrFkza3cl2TPhJNf5pQgI5hGBivrxy3XcWSY33ILRzP0OQ0dT
         sRijNvGvVT4ypSe0QKvLEbKjtxf2J1II2nBmq7GWSVuqAaQkTEQmL8eGZQiDRtMU9xg5
         1pkMe4Jh+7KVgbB9fRn4EvXAzkFouNHsAYyietSmwXGzOsMc7O5L0pW7PLC8B++JTWJg
         U97vKKAWht45qfO4M0RpM0z6XGP9SAV/QEx8hWftaLTHX+c6lIwwUTkovrPgxbJ/ng+V
         FtVQ==
X-Gm-Message-State: AOAM531YBzX5DIcmsFjBE561jFGdVKZoesJ5raqsGPUNJN7cHru6Wcog
        3t1t+gk0/QF6SQRQQngf8dxv5du3GRm+/EM3nfQ=
X-Google-Smtp-Source: ABdhPJwrEtkIGSwkezEQKRF3JAimi4D0WHxXx9fTACL9NcPX88ovP0gScUf1E7O7ztp02s8LILbrqg==
X-Received: by 2002:a17:907:9712:b0:6ff:c09:33a2 with SMTP id jg18-20020a170907971200b006ff0c0933a2mr2074986ejc.50.1653432920386;
        Tue, 24 May 2022 15:55:20 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id am5-20020a170906568500b006fee16142b9sm2661115ejc.110.2022.05.24.15.55.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 15:55:19 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id z15so3888761wrg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 15:55:19 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr25189228wrt.301.1653432918580; Tue, 24
 May 2022 15:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220524134840.1.I80072b8815ac08c12af8f379a33cc2d83693dc51@changeid>
 <311a23c9-e31d-e20d-8ba9-80d3197e8d1d@somainline.org> <CAD=FV=WKgPWxEL+mhb9cCGOLObJEPtX_sHLQ1z3rz3usDG1m+Q@mail.gmail.com>
 <1d602bb6-d3a4-2ec0-e3e7-d9395edec416@somainline.org>
In-Reply-To: <1d602bb6-d3a4-2ec0-e3e7-d9395edec416@somainline.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 May 2022 15:55:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2C1W+JHWyGRfyRB=WiPKLYvtjO90UDoJ9p+Xwe09+ow@mail.gmail.com>
Message-ID: <CAD=FV=U2C1W+JHWyGRfyRB=WiPKLYvtjO90UDoJ9p+Xwe09+ow@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add touchscreen to villager
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 3:41 PM Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 25/05/2022 00:14, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, May 24, 2022 at 2:13 PM Konrad Dybcio
> > <konrad.dybcio@somainline.org> wrote:
> >>
> >> On 24/05/2022 22:48, Douglas Anderson wrote:
> >>> This adds the touchscreen to the sc7280-herobrine-villager device
> >>> tree. Note that the touchscreen on villager actually uses the reset
> >>> line and thus we use the more specific "elan,ekth6915" compatible
> >>> which allows us to specify the reset.
> >>>
> >>> The fact that villager's touchscreen uses the reset line can be
> >>> contrasted against the touchscreen for CRD/herobrine-r1. On those
> >>> boards, even though the touchscreen goes to the display, it's not
> >>> hooked up to anything there.
> >>>
> >>> In order to keep the line parked on herobrine/CRD, we'll move the
> >>> pullup from the qcard.dtsi file to the specific boards. This allows us
> >>> to disable the pullup in the villager device tree since the pin is an
> >>> output.
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>> This uses bindings introduced in the patch ("dt-bindings: HID:
> >>> i2c-hid: elan: Introduce bindings for Elan eKTH6915") [1].
> >>>
> >>> [1] https://lore.kernel.org/r/20220523142257.v2.1.Iedc61f9ef220a89af6a031200a7850a27a440134@changeid
> >>>
> >>>    .../boot/dts/qcom/sc7280-herobrine-crd.dts    | 11 ++++++++
> >>>    .../qcom/sc7280-herobrine-herobrine-r1.dts    | 11 ++++++++
> >>>    .../dts/qcom/sc7280-herobrine-villager-r0.dts | 25 +++++++++++++++++++
> >>>    arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi    |  1 -
> >>>    4 files changed, 47 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> >>> index a4ac33c4fd59..b79d84d7870a 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dts
> >>> @@ -134,6 +134,17 @@ &sdhc_2 {
> >>>        status = "okay";
> >>>    };
> >>>
> >>> +/* PINCTRL - ADDITIONS TO NODES IN PARENT DEVICE TREE FILES */
> >> Please drop this line, this isn't msm-3.4. It's immediately obvious that
> >> if a pin is referenced by a label and it is not defined in this file
> >> (because otherwise it wouldn't be both defined and referenced here..),
> >> it comes from a previously included device tree.
> > In general these headings specify a change in sort ordering. Without
> > them then either we intersperse pinctrl overrides with other stuff,
> > which IMO is overall worse or people have no idea why the sort
> > ordering changes.
>
> I get what you mean, but at the end of the day, the entire machine DT
> specifies all machine-specific changes and only machine-specific
> changes. They all are a part of a bigger picture, sometimes being
> downstream from the SoC, sometimes downstream from a common board. I
> don't think it brings much benefit if at all to separate them into
> sections like these, if in the end they all correspond to modifications
> present in the hardware. In its current form, the sorting is all over
> the place, and ideally we could have labels sorted alphabetically.

I think overall DT just made it hard. In my mind the root of the
problem is actually that we're trying to avoid replicating hierarchy
from the dtsi files that we include. In other words, we try very hard
to do:

&qup_i2c2_data_clk {
  bias-disable;
};

Instead of replicating the hierarchy in the board dts files, like this:

/ {
  soc@0 {
    pinctrl@f100000 {
      qup-i2c2-data-clk {
        bias-disable;;
      };
    };
  };
};

(and, of course, you could replicate parts of the hierarchy too).

When you avoid replicating things then it really causes everything to
become scattered / disorganized and I think there's a benefit to
trying to enforce some type of ordering.


> The present solution, in my opinion, causes more disarray as you first
> have to think about what is the change against and then find it in the
> corresponding subsection instead of thinking of it as a complete
> quote-on-quote diff against the parent DTSIs.

It's a fair opinion. I'd be interested to know if others feel the same
way. In general it feels like a style decision for the people working
on these boards, subject to the approval of the Qualcomm tree
maintainer(s).


> Plus, most DTs don't split
> it like that.

I will say that it's hard to compare the trogdor (and now herobrine)
situation with most other ARM boards out there. There are _a lot_ of
different variants and revisions and it's, IMO, more art than science
in trying to balance all of the tradeoffs between duplicating code and
ending up with unreadable spaghetti. I won't claim that we made the
right tradeoff in every case, but so far experience on trogdor has
been that things ended up being fairly understandable I think?

-Doug
