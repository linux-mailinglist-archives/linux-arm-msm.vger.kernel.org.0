Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DD2730427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 17:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244553AbjFNPuf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 11:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244551AbjFNPuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 11:50:35 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4E5184
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 08:50:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so10197547a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686757831; x=1689349831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBxZ/WkHsxnx/bLYGuhyu1gVFSm0iBsy0Y9Dj3gZZw4=;
        b=OlD2MohORoOGOB2VvSwrBNVC7LLeJ/oy8qv2D9htWE5WZzLMAevCf+BCcc3FX/g9nI
         Bqh+ehCjS05kjjFOGeilyiFm0MSZMjl3vxLaJQxqRN/YBLmwmr1QMvHPCnSAd6RyMp7p
         wGHpZRWhAxpakvi25j+i8IPiWfwLW6LXSTaqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686757831; x=1689349831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBxZ/WkHsxnx/bLYGuhyu1gVFSm0iBsy0Y9Dj3gZZw4=;
        b=BIjbY2LlMYCMokpKNhvIhcJHtDYuBBiTfY0Vs8fQBCswJEadr5qovEZMR78B4y+uOU
         MN+Z0VaAT8DfO7ayIHDjH6jdDhbGX2zn474hR0r422/wxcq0ejjxcaMTrILWo3N/+EVn
         yYNBSHAYP5uYlUFbR4chlBZKVGud1KK7XSsBs519x7qgnp/48VcqynVxWuhAxrmjxN92
         ujKyKHk9btZiYEWnEUDD8gMvPCHPueyDTOSrDP4Khg4KREWvE+tjQNPu98KZfa6JY7B7
         RoPf6DNixwfdgeoa6BimKGVDBX90ATDgTVK+57/H/dpCJd+gfCw1KkmDNijLi5yz0286
         DN6A==
X-Gm-Message-State: AC+VfDw+ns+GuZW4tzwl/gPYmKbj54nfWpQz30ikeXuPuDJuMS8jyHm1
        BDsVaeHkerGvOf39w822wG29YV0NDWF8gOhk6401Ve3J
X-Google-Smtp-Source: ACHHUZ5BGlZpx0kvRCUF4ThT+cI8kqBb5RWsrQC3++BCEfygP08afdqJoHtqS/7XGcPmvCR401NZRA==
X-Received: by 2002:a17:907:972a:b0:982:781e:ba13 with SMTP id jg42-20020a170907972a00b00982781eba13mr2233722ejc.39.1686757831743;
        Wed, 14 Jun 2023 08:50:31 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id g22-20020a17090613d600b009545230e682sm8222541ejc.91.2023.06.14.08.50.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 08:50:29 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f7e4953107so106335e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 08:50:28 -0700 (PDT)
X-Received: by 2002:a05:600c:5207:b0:3f1:9a3d:4f7f with SMTP id
 fb7-20020a05600c520700b003f19a3d4f7fmr153672wmb.1.1686757828661; Wed, 14 Jun
 2023 08:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMi1Hd05z8uBotO4vs7Ropmt7W2gSA__tTu_=X1t0mze7bXrhg@mail.gmail.com>
 <CAD=FV=VSFDe445WEVTHXxU1WS_HGUV5jR5E8_Vgd4eyhn3rHyA@mail.gmail.com>
 <CAMi1Hd28FJUjB8A-9YF7xpKOzSyNWXX3qung4aDjpLBhOvw_eA@mail.gmail.com>
 <CAD=FV=W13L0H88G1gt8qRnXfpV-_7E9QfHufN_a23_B1bb=aww@mail.gmail.com>
 <CAMi1Hd1WCtNvNaY_kVMx5F8T0nMVHvsjk9LsSETCMWWQyaq_Vw@mail.gmail.com>
 <CAD=FV=W5Y_SHp0y2MEs8d1k255bm_PXdRYEmYei+g79pjnzYuA@mail.gmail.com>
 <CAMi1Hd2OeL940r7jq0=Z_oxE8MYVioy0YnJXQC_5e0vJONd2sQ@mail.gmail.com>
 <1bc79c48-7cba-476d-9a7e-5754a88fcdae@sirena.org.uk> <CAMi1Hd2BLB6H3QRLB5svRTkGoXaUeEsakNsmfCOjbDBcCEeqkA@mail.gmail.com>
 <CAD=FV=UKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCkaJbjTg@mail.gmail.com>
 <bb5c828a-b8c5-40a0-9b67-44e73abcbef0@sirena.org.uk> <CAD=FV=UXOse+yRUmZBUOkfpWXPRKBw2R-+BVzPGcuwwFV_VqQw@mail.gmail.com>
 <84110995-a99b-8b5a-cd34-8430866eb9b1@leemhuis.info>
In-Reply-To: <84110995-a99b-8b5a-cd34-8430866eb9b1@leemhuis.info>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Jun 2023 08:50:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com>
Message-ID: <CAD=FV=V-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com>
Subject: Re: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Mark Brown <broonie@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jun 14, 2023 at 8:37=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 07.06.23 15:47, Doug Anderson wrote:
> >
> > On Wed, Jun 7, 2023 at 6:18=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:
> >>
> >> On Tue, Jun 06, 2023 at 04:29:29PM -0700, Doug Anderson wrote:
> >>
> >>> 2. Try adding some delays to some of the regulators with
> >>> "regulator-enable-ramp-delay" and/or "regulator-settling-time-us".
> >>> Without a scope, it'll be tricky to figure out exactly which
> >>> regulators might need delays, but you could at least confirm if the
> >>> "overkill" approach of having all the regulators have some delay
> >>> helps... I guess you could also try putting a big delay for "ldo26".
> >>> If that works, you could try moving it up (again using a bisect style
> >>> approach) to see where the delay matters?
> >>
> >> This is information which should be in the datasheets for the part.
> >
> > I was thinking more of something board-specific, not part specific. In
> > theory with RPMH this is also all supposed to be abstracted out into
> > the firmware code that sets up RPMH which magically takes care of
> > things like this, but it certainly could be wrong.
>
> /me waves friendly
>
> That afaics was the last mail in this thread about a regression caused
> by ad44ac082fd ("regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use
> PROBE_FORCE_SYNCHRONOUS"") from Doug; Amit's attempt to patch it (
> https://lore.kernel.org/lkml/20230602161246.1855448-1-amit.pundir@linaro.=
org/
> ) also wasn't welcomed. Just like his earlier revert attempt
> (https://lore.kernel.org/lkml/20230515145323.1693044-1-amit.pundir@linaro=
.org/
> ).
>
> Does this mean this regression won't be addressed before 6.4 is
> released? Or was there some progress and I just missed it? What should I
> tell Linus in my next report?

Of the two proposals made (the revert vs. the reordering of the dts),
the reordering of the dts seems better. It only affects the one buggy
board (rather than preventing us to move to async probe for everyone)
and it also has a chance of actually fixing something (changing the
order that regulators probe in rpmh-regulator might legitimately work
around the problem). That being said, just like the revert the dts
reordering is still just papering over the problem and is fragile /
not guaranteed to work forever.

-Doug
