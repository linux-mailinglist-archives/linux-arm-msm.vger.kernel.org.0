Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07E3073084F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 21:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbjFNTf1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 15:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234018AbjFNTf0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 15:35:26 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C329D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:35:25 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9823de726c3so173440166b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686771323; x=1689363323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU76vYQFaTOTVIoQqi0w79DumHDt6GCwn4u2KfUXZyQ=;
        b=Me2ok6lfcVh0rj5LFQ8vqApr6BFd49PzBKpOUzL6l9UNxn6X4w5ULEVQ5gCu8bZfWe
         1avJcF7hxTMcKr+9p673nOoOhheE4OdWg4vpl9x0w4zBHv9valS40RYqgxBiQcPSkOwb
         SesXF2ezvufoYfcdlcVnS+dee9+8+r9ezbbN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686771323; x=1689363323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU76vYQFaTOTVIoQqi0w79DumHDt6GCwn4u2KfUXZyQ=;
        b=OaXHlBI5vvH2SKq2Ra1vJbgy9xBuDfDe5jcDyafVW1LIk/RoxoC4zkSpvrsqH++V6B
         lQgfy7OxeTC4XPlDXRDZAmSUccFy6J7x14T4IGypfFkmqYTmxp2lt/4ls/3shNAHlvnS
         CHPa+EiGKBSBWyj7baj2/AbS3++j8ygj0ShfIqm7TI3w6fW0PKwcWCDIuCaAuez6cIi+
         k0gNjegRg0efcMXn8Az/4q9gSZBNra5f24Z7rH9ODufWSYtbce7X/CZCaMnSr+qb5TJy
         qMIXpYrTEmoVZnQVYxzzixGpyu8XOjv94obf6bbN3pcLXnonT5h3HBDI7UcgIPeWi4h5
         mZhw==
X-Gm-Message-State: AC+VfDx0Sz9neNZ+0LJKqMkpvkbHgg4hgMQ8+bwTuZoxwUyfihNhK8M0
        RQy0pQLLzdBjhzK7qlXmJYd5BmxgasgR1irQi9Iy2HWH
X-Google-Smtp-Source: ACHHUZ62qJrkAjrRsIHCRdn4nVe08ppTRm5BL7NHJ5LQaFwNzMF5kLd3L495jn2FDU9cmGQThPA8+A==
X-Received: by 2002:a17:907:9410:b0:982:30e3:ddcb with SMTP id dk16-20020a170907941000b0098230e3ddcbmr8543806ejc.65.1686771322831;
        Wed, 14 Jun 2023 12:35:22 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id lv16-20020a170906bc9000b00965a52d2bf6sm8360981ejb.88.2023.06.14.12.35.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 12:35:21 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-514ad92d1e3so1858a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 12:35:21 -0700 (PDT)
X-Received: by 2002:a50:9b57:0:b0:506:90c4:b63b with SMTP id
 a23-20020a509b57000000b0050690c4b63bmr15000edj.4.1686771321408; Wed, 14 Jun
 2023 12:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
 <CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com>
 <552345c5-b1e9-41f6-f275-b6eeeb51df25@linaro.org> <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
 <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com> <CAMi1Hd12S+bKyp=CHwoioYoojtFzaA1tey19BqAFi+4DeJR__w@mail.gmail.com>
In-Reply-To: <CAMi1Hd12S+bKyp=CHwoioYoojtFzaA1tey19BqAFi+4DeJR__w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Jun 2023 12:35:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxWWxWB2zZwUdnRQkiiMbuC=Bx=ibRWG92nFzbXgHWHw@mail.gmail.com>
Message-ID: <CAD=FV=XxWWxWB2zZwUdnRQkiiMbuC=Bx=ibRWG92nFzbXgHWHw@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 14, 2023 at 12:03=E2=80=AFPM Amit Pundir <amit.pundir@linaro.or=
g> wrote:
>
> On Wed, 7 Jun 2023 at 04:59, Doug Anderson <dianders@chromium.org> wrote:
> >
> > From a black box perspective, I guess the things I could think of
> > would be to keep poking around with things that you control. Best
> > ideas I have:
> >
> > 1. Use "bisect" style techniques to figure out how much you really
> > need to move the "lvs" regulators. Try moving it halfway up the list.
> > If that works, move it closer to the bottom. If that doesn't work,
> > move it closer to the top. Eventually you'd find out which regulator
> > it's important to be before.
>
> Hi, I tried this bisect style technique to move lvs regulators up in
> the list gradually and I found that they need to be enabled atleast
> before ldo12 and the ldo regulators which follow the ldo12 in the
> list.

Super weird. I was hoping that something would jump out, but nothing
does. :( I don't understand how lvs1 / lvs2 could have any impact on
ldo12. :(


> > 2. Try adding some delays to some of the regulators with
> > "regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
> > Without a scope, it'll be tricky to figure out exactly which
> > regulators might need delays, but you could at least confirm if the
> > "overkill" approach of having all the regulators have some delay
> > helps... I guess you could also try putting a big delay for "ldo26".
> > If that works, you could try moving it up (again using a bisect style
> > approach) to see where the delay matters?
>
> I tried this approach as well earlier today but I don't know how big
> "the big" delay can be. The device fails to boot if I add a settling
> time of as much as 2sec per each ldo and lvs regulator too. I didn't
> try increasing the delay further.

Yeah, 2 seconds is plenty big. If that doesn't fix it then it's not a
timing issue.

I guess with the above results, I'm still super confused about why the
async probe has any impact at all on this. It sounds like the
_ordering_ of the rpmh-regulators init matters but not the timing, and
I'd expect the ordering to be the same between normal probe and async
probe. Specifically, I think:

a) There is exactly one rpmh-regulator driver instance in your system, righ=
t?

b) Regulator initialization happens in rpmh_regulator_probe().

c) The rpmh_regulator_probe() function is itself synchronous. That is,
it sets up one regulator at a time and, I believe, nothing about the
behavior of rpmh_regulator_probe() changes for async vs. sync probe.

...so I'm left baffled...
