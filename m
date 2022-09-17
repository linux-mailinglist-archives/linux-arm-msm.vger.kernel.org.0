Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6832B5BB88E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 15:45:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiIQNpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 09:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiIQNpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 09:45:40 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521AA2B613
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 06:45:39 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-333a4a5d495so290837777b3.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2VOqydgYRC5eaj8WgdTpQExGI/aDqr2CC/HH18bzDLw=;
        b=S/nsbUgh86JWr9yY1QEAkc7rxwLoJQt3qY3k4mWx44ib6nxA+mjP30Ag7i8lcOWOyM
         +aanCRBq6ea6x6bpYpxEpK9/UlJgSgGcdkOAp+BabzXD1usOYlbWeVpC+CMUyfUKoKVE
         tTVrpUkWac5qUP7jGz+6L8Fpp8zSlqZz+CEWDvpPqFk7ppTVGJQX+zjI20FWYYDmOoQD
         p0VmUdWo4UJyOoR0OMLj7ah6FbLdrV/jaeuaR1xmM9UloQw4XLd/IxG9hrIfcHzbtUp2
         9mzr+3jip/WG693yWuP9AZhZ9piCGNROZyKTSmNLeden380wNQayrc7gxyOqtfXXl50i
         B2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2VOqydgYRC5eaj8WgdTpQExGI/aDqr2CC/HH18bzDLw=;
        b=Nyl+nVrIyJWE5yiFIOCZAh8xTRDbHSwLmXXAtaKrENbPWB+U952z4lNRXubo0ROT+o
         D4QspXu9UADAeBZtXFU89JtP7f0hcjkvQl0HQecUqZWOJrLcr3/SdAE3go5kQgoblMkE
         no8/CiFHn7ETisL53mPiLujIh3Zcf5+ko3zznvm+0KxurJGD3A8QeHxRddJHbmimc3w3
         ZYe4GjMu9D3vKCEikZ7UyaqkVYQbVc7Yo4hd7nwL3xa3HfyDgzyUKjOGWvc2Q3THztqW
         QsQGav1GiYcgDnCWY/SYQSTIQ+7roNGfB0cb58gUu60hnc6xy1lQaOxnQhaDxt3SPfgT
         OXkQ==
X-Gm-Message-State: ACrzQf2jk2ezU2cxzSpNbg0uQuI2H7F1xYbFYLv0I6jBkGPH2euR0gSO
        Fc28umH+Q29HYy/qCPZyUhaX5v/EP9vKi4S/sc1wqw==
X-Google-Smtp-Source: AMsMyM75fdk+RhC6nzYi3fbxlktbP6QoMv9zyjM625EL72sm6ZuMy15HLHrP0qMkSYXUzoGwdBcL/b1m+fqTRK1TDHk=
X-Received: by 2002:a81:1988:0:b0:345:11a6:fa56 with SMTP id
 130-20020a811988000000b0034511a6fa56mr8608811ywz.138.1663422338492; Sat, 17
 Sep 2022 06:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220914142256.28775-1-ansuelsmth@gmail.com> <20220914142256.28775-3-ansuelsmth@gmail.com>
 <20220916191715.GA1079300-robh@kernel.org> <6324d1be.050a0220.9d842.7b47@mx.google.com>
 <CAA8EJprEQOsm4TxGWJYZo04D1PagT3QmhDdYQkEid-KSP-tpTw@mail.gmail.com>
 <6324d8e1.170a0220.aba35.ba4f@mx.google.com> <CAA8EJpowLvkuiYupqS0WEhnMR8q=R1YUUFgdFVCAx1PXyoo1xw@mail.gmail.com>
 <6324dc1b.df0a0220.97787.083c@mx.google.com> <CAA8EJpo08WoQ_LYOtg5C2BB=Q6GR_cftLjaWHWjYD6BjfDZcsg@mail.gmail.com>
 <6324f087.1c0a0220.7123d.8665@mx.google.com>
In-Reply-To: <6324f087.1c0a0220.7123d.8665@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 17 Sep 2022 16:45:21 +0300
Message-ID: <CAA8EJprhLUybqmPhFmit6LGaNOxz=-9+8xADXowJuzU5BtjjtA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: arm: msm: Convert kpss-acc driver
 Documentation to yaml
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Takashi Iwai <tiwai@suse.de>,
        Christian Brauner <brauner@kernel.org>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Marc Herbert <marc.herbert@intel.com>,
        James Smart <jsmart2021@gmail.com>,
        Justin Tee <justin.tee@broadcom.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 17 Sept 2022 at 00:54, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Fri, Sep 16, 2022 at 11:31:49PM +0300, Dmitry Baryshkov wrote:
> > On Fri, 16 Sept 2022 at 23:27, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > >
> > > On Fri, Sep 16, 2022 at 11:22:17PM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, 16 Sept 2022 at 23:13, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > > > >
> > > > > On Fri, Sep 16, 2022 at 11:06:35PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Fri, 16 Sept 2022 at 22:43, Christian Marangi <ansuelsmth@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Sep 16, 2022 at 02:17:15PM -0500, Rob Herring wrote:
> > > > > > > > On Wed, Sep 14, 2022 at 04:22:53PM +0200, Christian Marangi wrote:
> > > > > > > > > Convert kpss-acc driver Documentation to yaml.
> > > > > > > > > The original Documentation was wrong all along. Fix it while we are
> > > > > > > > > converting it.
> > > > > > > > > The example was wrong as kpss-acc-v2 should only expose the regs but we
> > > > > > > > > don't have any driver that expose additional clocks. The kpss-acc driver
> > > > > > > > > is only specific to v1. For this exact reason, limit all the additional
> > > > > > > > > bindings (clocks, clock-names, clock-output-names and #clock-cells) to
> > > > > > > > > v1 and also flag that these bindings should NOT be used for v2.
> > > > > > > >
> > > > > > > > Odd that a clock controller has no clocks, but okay.
> > > > > > > >
> > > > > > >
> > > > > > > As said in the commit v2 is only used for regs. v2 it's only used in
> > > > > > > arch/arm/mach-qcom/platsmp.c to setup stuff cpu hotplug and bringup.
> > > > > > >
> > > > > > > Should we split the 2 driver? To me the acc naming seems to be just
> > > > > > > recycled for v2 and it's not really a clk controller.
> > > > > > >
> > > > > > > So keeping v2 in arm/msm/qcom,kpss-acc-v2.yaml and v1 moved to clock?
> > > > > >
> > > > > > I suspect that qcom,kpss-acc-v2 is misnamed as the "clock-controller".
> > > > > > According to msm-3.10, these regions are used by the Krait core
> > > > > > regulators.
> > > > > >
> > > > >
> > > > > Well we need to understand how to handle this... change the compatible
> > > > > it's a nono for sure. In platsmp.c they are used for cpu power control
> > > > > so could be that they are actually used to regulators. I would honestly
> > > > > move v1 to clock and leave v2 to arm/msm but I'm not cetain on what name
> > > > > to assign to the 2 yaml.
> > > > >
> > > > > What do you think?
> > > >
> > > > This is fine for me. If somebody gets better understanding of
> > > > underlying hardware and works on actually using these blocks, he will
> > > > update the bindings.
> > > >
> > > > My only suggestion would be to rename kpss-acc-v2 nodes to
> > > > 'power-controller@address' and document them so.
> > > >
> > >
> > > Ok so something like this?
> > >
> > >     power-controller@f9088000 {
> > >       compatible = "qcom,kpss-acc-v2";
> > >       reg = <0xf9088000 0x1000>,
> > >             <0xf9008000 0x1000>;
> > >     };
> > >
> > > (and I will have to fix dtbs warning as they will be unmatched I think.)
> > > Yaml naming:
> > > qcom,kpss-acc-v1.yaml
> > > qcom,kpss-acc-v2.yaml
> > > Right?
> >
> > Sounds good to me.
> >
> > I'd even say clock/qcom,kpss-acc-v1.yaml and
> > arm/msm/qcom,kpss-acc-v2.yaml or maybe power/qcom,kpss-acc-v2.yaml
> >
>
> Wonder if the gcc driver should have the same tretement? It's also a
> clock-controller driver that doesn't use clock at all... Do you have
> some info about it?

As far as I understand, the kpss-gcc is a normal clock controller,
isn't it? It provides clocks to other devices.

-- 
With best wishes
Dmitry
