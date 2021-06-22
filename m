Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C352C3AFB69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 05:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFVDhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 23:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhFVDhF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 23:37:05 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81B85C061574;
        Mon, 21 Jun 2021 20:34:49 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id p66so18275889iod.8;
        Mon, 21 Jun 2021 20:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2NaquTKuiz0EtWzypNaQWZLSls8Yk6MZXai61lQt+Y=;
        b=tVs4bSO38oyllXMEsSD4z//Kvx65zApEFUUuE4gaZglS2+FmvD2LeAeNP+Z4xtuyVx
         WHe1lxMJxjRkmG4TV4T2Db5PROvx5L00a214fTJsOKdRZQl5J4qvPbhCEqySCj/wrwks
         Tm9MFY6PHtCpvisKgjaRp49leBoI20s1pfHc4aAb7SZz5H2Izk+j5GCLm3xyAEwTJoKf
         lRje1is95bqB1wr/avUu1zYnwIJ2TJzONDhh/iapJcxOMOF8j/aGKvtcjbGgxJOhCyMk
         VXJ+X+flZa6Rp9QxuTCo/VC6X1Lakpo2X0eGEFDiaS9s0AGr79YXYn8+ZfwUEQ9Sxsbu
         S4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2NaquTKuiz0EtWzypNaQWZLSls8Yk6MZXai61lQt+Y=;
        b=cX36VIaGTg9PkGwZXk42W7RLG0/C3qtNZbOWYUEOCUe2cSWxTjEpDLAQo5IxdeLsoE
         UU+qGwnqqajC7Yr216SncI0zt17OeN5pv4Eqjq8hHn4SAoe6vbsNFN8pSHQePtfqCjAa
         tTQM7D3JsbGtF5izLVIIkwnExbl7qEDWBU9E4NicdkVsP6LVnx0DEm7wxJwBnTcKM37u
         QOn5gmbqJz1EZYN7TKMmfaKe/CiJroQfL0TAfNm2Ptj1eG1ZKYOVqVpBGrpvD9myV1r2
         rwk9QRqcmz4ho7KqEOKwPd/txPW27jI1hBWig0xDV/1kV6HrhPqs+88X2diOBMZAVQ+g
         ecPA==
X-Gm-Message-State: AOAM530JHMeNcJd3xiSOGZrtQnUA54BMOWQ+1mSdxP97lEFHHNJQPCFK
        QVLlHkOznzdw+eHaJVfv+ohVnQqj4nH+4nMNiGY=
X-Google-Smtp-Source: ABdhPJwK1JnYPVa04262EkEXiWjBJ62p+pdNYhvd2eNBJAeN6n5OAE8nuYsjtVAO/UMPx0bNFhsDxmTVFvDH8l7RAec=
X-Received: by 2002:a02:7348:: with SMTP id a8mr1742382jae.116.1624332888844;
 Mon, 21 Jun 2021 20:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga> <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga>
In-Reply-To: <YNFKpvhXyZbs8RE1@yoga>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 21 Jun 2021 22:34:37 -0500
Message-ID: <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 9:27 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 21 Jun 20:00 CDT 2021, Jassi Brar wrote:
>
> > On Mon, Jun 21, 2021 at 6:35 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:
> > >
> > > > On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > >
> > > > > On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > > > >
> > > > > > On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > > > > > > <martin.botka@somainline.org> wrote:
> > > > > > > >
> > > > > > > > This commit adds compatible for the SM6125 SoC
> > > > > > > >
> > > > > > > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > > > > > > ---
> > > > > > > > Changes in V2:
> > > > > > > > None
> > > > > > > > Changes in V3:
> > > > > > > > Change compatible to apcs-hmss-global
> > > > > > > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > index f25324d03842..f24c5ad8d658 100644
> > > > > > > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > > > > > > >         .offset = 8, .clk_name = NULL
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > > > > > > +       .offset = 8, .clk_name = NULL
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > > > > > > >         .offset = 12, .clk_name = NULL
> > > > > > > >  };
> > > > > > > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > > > > > > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > > > > > > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > > > > > > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > > > > > > >         {}
> > > > > > > >
> > > > > > > These all are basically different names for the same controller.
> > > > > > > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > > > > > > is basically some "always-on" clock.
> > > > > > > I am sure we wouldn't be doing it, if the controller was third-party.
> > > > > >
> > > > > > If newer implementations are 'the same', then they should have a
> > > > > > fallback compatible to the existing one that is the same and no driver
> > > > > > change is needed. If the differences are board or instance (within an
> > > > > > SoC) specific, then a DT property would be appropriate.
> > > > > >
> > > > > The controllers (13 now) only differ by the 'offset' where the
> > > > > registers are mapped. Clock-name is a pure s/w artifact.
> > > > > So, maybe we could push all these in DT.
> > > >
> > > > Why is 'reg' not used for the offset?
> > > >
> > >
> > > The DT node and its "reg" describes the whole IP block.
> > >
> > > The particular register that we care of has, as you can see, moved
> > > around during the various platforms and some incarnations of this IP
> > > block provides controls for CPU-related clocks as well.
> > >
> > > We can certainly have the multiple compatible points to the same
> > > apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
> > > given that I don't see any natural groupings.
> > >
> > Any platform that comes later may reuse the already available compatible.
> > For example drop this patch and reuse "qcom,sdm660-apcs-hmss-global" ?
> >
>
> The problem is that this would change the meaning of
> "qcom,sdm660-apcs-hmss-global" from meaning "The apcs hmss global block
> _in_ sdm660" to "any random apcs block with the mailbox register at
> offset 8".
>
To me, the deeper problem seems to be naming a controller "The apcs
hmss global block _in_ sdm660" just because the h/w manual hasn't
given a name to it.  But that is okay too, if we name the subsequent
controllers as "the same as one in sdm660" and provide the h/w
configuration 'offset' via a DT property.

> > > > In any case, we can't really get rid of the first 13 instances though...
> > > >
> > >
> > > Right, we have the problem that we have DTBs out there that relies on
> > > these compatibles, but as Jassi requests we'd have to start describing
> > > the internal register layout in DT - which this binding purposefully
> > > avoids.
> > >
> > Not these strings, but 'offset' and 'clock-name' as optional
> > properties that new platforms can use.
> >
>
> Relying on completely generic compatibles to match the driver and then
> distinguish each platform using additional properties is exactly what
> Qualcomm does downstream.  The community has clarified countless times
> that this is not the way to write DT bindings.
>
Yes, and I don't suggest it otherwise. For h/w quirks and
extra/missing features, it does make sense to have different
compatibles.

However, for _trivial_ variations let us get that value from DT.
'offset' is anyway a h/w property.
That way we won't be distinguishing platforms using dt properties, but
only support different platforms seamlessly.

On second thought, we have grown from 2 to 13 aliases in 4 yrs. I only
have to ignore 3 times/annum to lead a peaceful life ;)

thnx.
