Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62871602A83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 13:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbiJRLrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 07:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiJRLrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 07:47:31 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E457BBE0A
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 04:47:30 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-35711e5a5ceso134149047b3.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 04:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5SYJElMcni83QoXO3JfkKIM38CI++pdR3umfQffXROs=;
        b=QRcjH5NWoUmotKpQ67Lk+5IDIykXm1h/xS/x8UePyHPCN06lGtAf8BjiatfpB6UjOH
         flElgdFVk4U2ZSY9/Wvq5hlWAu8u09VszSJqNJVb6qMzplgS7jACoDJyQxrectkHBuqb
         1aC7k/uw+YpPMEIDSqngqoNGnLHv7ob4nsRvJWLgiv/fJmxWAvot0n7RVqJLIZqAvBzj
         l2x3ALuoDOK5JdleUg6zok1JvqqoGAW2dXoDs+DBi/lbgSAVrfGxjxTjhI+v4fsk3b0u
         ZRzew5XhZSFdB2vfgCpCJKtUBOcBuAdNJBJtDySghjHo9A27F4v9zvlalVqU0V+ln/rP
         8dqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SYJElMcni83QoXO3JfkKIM38CI++pdR3umfQffXROs=;
        b=FIOyyqX8sTtcRNC9EFnEEh3fMq3HYd2GLRd+TLG4I1S2/HBoHVmbces2JYZi1eY0vC
         5pocFtyEOh1GS2Ga/5I/AQxFFqfhTyaGsi86y5t5GdagPaaYJHKAKx/+43DOwQEZcA3y
         WhQYyCddLd+4ZM+nZJL5UhoR3c0NPha57hNwGq1cYFcLuUDi9Bvb4aglOCGz3CILiMd4
         72LmjlQ3yBWwuAJuasiparYCgUtO7F41M+o4jICpRUFelS96S4NxpmRd1f9IWdajGWDn
         qEcgV2LBF5VeDzD//vayhwuWi9uN76M/T21lDN1YbUtgFszA2yek1k0Q5t8wH9fY/X3b
         M1jg==
X-Gm-Message-State: ACrzQf0cQn4tl+C8kv0uOd1H4K90PGKDvAt+seXn6B2BoeJk8M3zmXho
        AFa5QHfSyYItnTZmARaHKcBz4eo/StUqhqK3nrkEhfaOJ/KvIx3m
X-Google-Smtp-Source: AMsMyM7mU0Rp5oJUI5oyBw1mcig1QYLPCMbbDInRaNwPyn2zxdyaaC2ZPG7CWt9mvejqgqmCG9dmca6wSouxOAp1GXw=
X-Received: by 2002:a81:6ccf:0:b0:35b:c5a5:1df3 with SMTP id
 h198-20020a816ccf000000b0035bc5a51df3mr2081524ywc.132.1666093066203; Tue, 18
 Oct 2022 04:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221017145328.22090-1-johan+linaro@kernel.org>
 <20221017145328.22090-10-johan+linaro@kernel.org> <CAA8EJpqSWmy5Z4cmJnsdjMjkmACW7HSi-k5JxZ0gLCeUAWEnxQ@mail.gmail.com>
 <Y05+E90tmlq2tNFa@hovoldconsulting.com>
In-Reply-To: <Y05+E90tmlq2tNFa@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 18 Oct 2022 14:37:35 +0300
Message-ID: <CAA8EJprwhEvUfUr-zDir4zFh_NAyr0qPbrHi6Hf8=2HC1dAhaw@mail.gmail.com>
Subject: Re: [PATCH 09/15] dt-bindings: phy: qcom,qmp-pcie: mark current
 bindings as legacy
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 18 Oct 2022 at 13:21, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Oct 18, 2022 at 12:52:03PM +0300, Dmitry Baryshkov wrote:
> > Hi,
> >
> > On Mon, 17 Oct 2022 at 17:54, Johan Hovold <johan+linaro@kernel.org> wrote:
> > >
> > > The current QMP PCIe PHY bindings are based on the original MSM8996
> > > binding which provided multiple PHYs per IP block and these in turn were
> > > described by child nodes.
> > >
> > > Later QMP PCIe PHY blocks only provide a single PHY and the remnant
> > > child node does not really reflect the hardware.
> > >
> > > The original MSM8996 binding also ended up describing the individual
> > > register blocks as belonging to either the wrapper node or the PHY child
> > > nodes.
> > >
> > > This is an unnecessary level of detail which has lead to problems when
> > > later IP blocks using different register layouts have been forced to fit
> > > the original mould rather than updating the binding. The bindings are
> > > arguable also incomplete as they only the describe register blocks used
> > > by the current Linux drivers (e.g. does not include the per lane PCS
> > > registers).
> >
> > I'd like to point out that it's not only a problem peculiar to the
> > PCIe PHYs. Other QMP PHY families also follow the same approach of
> > separating the serdes into the common part and rx/tx/PCS/whatever into
> > the PHY subnodes.
>
> Yeah, I already mentioned that in the cover letter.
>
> > For the USB+DP combo PHYs we have to have subnodes, however it would
> > also be logical to move serdes register to the subnode devices,
> > leaving only DP_COM in the base node.
>
> No, not at all. First, we may not even need the subnodes (the individual
> PHYs can be indexed), but even if we do keep them for the combo case,
> the register block should go in the wrapper node as the registers can be
> and are shared (e.g. for sc8280xp for which the current binding is
> completely broken).

Hmm, which register blocks are shared on the sc8280xp combo PHY? Could
you please lightly describe it, if possible?

> > That said, I think we should rethink and agree on QMP PHY bindings,
> > before renaming the bindings.
>
> Isn't that what we are doing just now?

Yeah, thanks for starting the discussion!

> > And yes, I think we should also upgrade
> > older DTs, keeping drivers backwards compatible (for some time?).
>
> Possibly, but I'm not sure it's worth the dts churn. As I mentioned
> elsewhere, supporting both the old and new binding in the driver is
> mostly trivial, while encoding the deprecated bindings in DT schema
> sounds like it would be painful.

This is probably the time where Krzysztof can advise us. I'm still not
sure when it is expected to encode both old and new bindings in the
schema and when we can update both the schema and the DT.

> On the other hand, adding support for new features to (or fixing bugs
> in) old platforms using the current bindings may potentially become
> easier if they are also converted.

Yes!

> > > In preparation for adding new bindings for SC8280XP which further
> > > bindings can be based on, mark the current bindings as "legacy".
> > >
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  .../{qcom,qmp-pcie-phy.yaml => qcom,qmp-pcie-phy-legacy.yaml} | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename Documentation/devicetree/bindings/phy/{qcom,qmp-pcie-phy.yaml => qcom,qmp-pcie-phy-legacy.yaml} (98%)
>
> Johan

-- 
With best wishes
Dmitry
