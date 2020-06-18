Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7311FFA1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 19:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732162AbgFRRZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 13:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732159AbgFRRZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 13:25:16 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C03C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:25:16 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y123so3995152vsb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xgctw9MRFmgKOHFIvDI6Qn+gJt1nqZ70EmKCoP+6B2U=;
        b=UhuoNsgEpM6bl3gbq+ganUuoS0DODg218IK4kWqtQCvDD7vGvvsZr27pCvHpctOCYH
         PeRPV0Jz4sT1rhvl0T1n+aE66bHtJXh9VaFZ8PhSIAKa9jm23xsbiepbIoATOgrf5e7J
         11VUJzu5k4CDqPuOM4QknLOZ5Pn6VHASKMLIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xgctw9MRFmgKOHFIvDI6Qn+gJt1nqZ70EmKCoP+6B2U=;
        b=S4jtilKKT/nnI3da07oWCYi5y1vj/Hhm1buqOGQucoGhHZMlo6pjjL3eUEEhx/eD7e
         1cjYECeWUek6xIDLJxqUMuPzmg2rO4SZ/5t5N0CRyHuqWrl7VC0eotjKhsIqM/XYHQxE
         V559zue5mtla3OyJL8vJIW6sX4eUlwls/K+PnSzxgKkpTsdncjBiWfbEsH9t+v40s9EX
         XsIR+fzDJKr1qE3JUVJ4eU5ehLY1tsnFcsj1kcus+nyd52Dn+HKPlhy8O+Ulp4AZ1NLI
         jkqAxwajb6FMkhpietVlVlVrIWKPob1G+iZVUPJGx+Zwp4Uf2BSJWmVdEemU1sclVOXn
         chfQ==
X-Gm-Message-State: AOAM5314flgl1KhiVc/h/rCoq0/KTvs6j99+S7OdP/0VXVql7F9TJGa5
        F/Id6IbzdtKLwklDgrDkiAmKtP7vBeo=
X-Google-Smtp-Source: ABdhPJxR6SFzdt6AiuJ4gbK6wxZYdIQp1Ug+JJg2+LEHEW86KibpDD1buiRFIFiociUn+2fF25LMUg==
X-Received: by 2002:a67:ea85:: with SMTP id f5mr4379121vso.234.1592501115055;
        Thu, 18 Jun 2020 10:25:15 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id f23sm386576vkf.44.2020.06.18.10.25.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 10:25:13 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id e1so1631689vkd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:25:12 -0700 (PDT)
X-Received: by 2002:a1f:19cd:: with SMTP id 196mr4424105vkz.0.1592501112451;
 Thu, 18 Jun 2020 10:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
 <254998b9-c45e-bd6b-bc9a-b5934c0fea8e@linaro.org> <CAD=FV=Vec5FVrDVkmUQTfa6bP+1d3yOtj_FsgVAFdHLLbZ8VDA@mail.gmail.com>
 <db6cc914-0520-5286-f852-473fc63bd6c7@linaro.org> <CAD=FV=UZAtJY42jwSZy+Z+O3AdZqDxnjY1zzOswqQRDY91uPpA@mail.gmail.com>
 <0b0b52db-da8c-e958-d72e-797e319bbe9c@linaro.org> <CAD=FV=UShR-a8kEvpNEx5gGkUr=DhX-=kzcBQ1SegQTQMoCyKw@mail.gmail.com>
 <159249930746.62212.6196028697481604160@swboyd.mtv.corp.google.com>
In-Reply-To: <159249930746.62212.6196028697481604160@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 10:25:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Unm8RK9GDNyuRZjznT21ef=jqcqhMXUWDV6HPkhn3coQ@mail.gmail.com>
Message-ID: <CAD=FV=Unm8RK9GDNyuRZjznT21ef=jqcqhMXUWDV6HPkhn3coQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for
 blowing fuses
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, dhavalp@codeaurora.org,
        mturney@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
        <devicetree@vger.kernel.org>, LKML" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 18, 2020 at 9:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Doug Anderson (2020-06-18 08:32:20)
> > Hi,
> >
> > On Thu, Jun 18, 2020 at 7:01 AM Srinivas Kandagatla
> > >
> > > On the other note:
> > >
> > > clock-names are not mandatory according to
> > > Documentation/devicetree/bindings/clock/clock-bindings.txt
> > >
> > > For this particular case where clock-names = "sec" is totally used for
> > > indexing and nothing else!
> >
> > So I guess in the one-clock case it's more optional and if you feel
> > strongly I'll get rid of clk-names here.  ...but if we ever need
> > another clock we probably will want to add it back and (I could be
> > corrected) I believe it's convention to specify clk-names even with
> > one clock.
>
> TL;DR: I suggest you call this "core" if you want to keep the
> clock-name, or just drop it if there's only one clk and move on.

Ah, true.  "core" sounds good.


> It's not required to have clock-names with one clk, and indeed it's not
> required to have clock-names at all. The multi clk scenario is a little
> more difficult to handle because historically the clk_get() API has been
> name based and not index based like platform resources. When there is
> one clk the driver can pass NULL as the 'con_id' argument to clk_get()
> and it will do the right thing. And when you have more than one clk you
> can pass NULL still and get the first clk, that should be in the same
> index, and then other clks by name.
>
> So far nobody has added clk_get_by_index() but I suppose if it was
> important the API could be added. Working with only legacy clkdev
> lookups would fail of course, but clock-names could be fully deprecated
> and kernel images may be smaller because we're not storing piles of
> strings and doing string comparisons. Given that it's been this way for
> a long time and we have DT schema checking it doesn't seem very
> important to mandate anything one way or the other though. I certainly
> don't feel good when I see of_clk_*() APIs being used by platform
> drivers, but sometimes it is required.
>
> To really put this into perspective, consider the fact that most drivers
> have code that figures out what clk names to look for and then they pile
> them into arrays and just turn them all on and off together. Providing
> fine grained clk control here is a gigantic waste of time, and requiring
> clock-names is just more hoops that driver authors feel they have to
> jump through for $reasons. We have clk_bulk_get_all() for this, but that
> doesn't solve the one rate changing clk among the sea of clk gates
> problem. In general, driver authors don't care and we should probably be
> providing a richer while simpler API to them that manages power state of
> some handful of clks, regulators, and power domains for a device while
> also letting them control various knobs like clk rate when necessary.
>
> BTW, on qcom platforms they usually name clks "core" and "iface" for the
> core clk and the interface clk used to access the registers of a device.
> Sometimes there are esoteric ones like "axi". In theory this cuts down
> on the number of strings the kernel keeps around but I like that it
> helps provide continuity across drivers and DTs for their SoCs. If you
> ask the hardware engineer what the clk name is for the hardware block
> they'll tell you the globally unique clk name like
> "gcc_qupv3_uart9_core_clk", which is the worst name to use.

OK, sounds about what I expected.  I suppose the path of least
resistance would be to just drop clock-names.  I guess I'm just
worried that down the road someone will want to specify the "iface"
clock too.  If that ever happens, we're stuck with these options:

1. Be the first ones to require adding clk_get_by_index().

2. Use the frowned upon of_clk_get() API which allows getting by index.

3. Get the first clock with clk_get(NULL) and the second clock with
clk_get("iface") and figure out how to specify this happily in the
yaml.

If we just define clock-names now then we pretty much match the
pattern of everyone else.


Srinivas: reading all that if you still want me to drop clock-names
then I will.  I'll use clk_get(NULL) to get the clock and if/when we
ever need an "iface" clock (maybe we never will?) we can figure it out
then.


-Doug
