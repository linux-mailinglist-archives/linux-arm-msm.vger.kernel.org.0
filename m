Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6A81584C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jul 2022 08:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbiG2GxJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Jul 2022 02:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234751AbiG2Gw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Jul 2022 02:52:58 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6088050C
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 23:52:56 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id e5so2740880qts.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 23:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B9NJPMCqsZZzif8NOi6LqBERuaw3Qi0GLNSjXaKH72E=;
        b=ouhZLlcvdbHtvTf8YiOPEo07AwaL3uSKyKjAL/0/JobC+hqJYFj2hPitySQnXMVmXr
         jX6Vj8FadMnkc9GRr+1qhzOjhORahTchrfixJIj93dV669SrEQNR/NYkeBnpX9XCDKrD
         EjuCOGzLj3ynVi0ctabQWqVkPDbPd2Ig6ob8oT4bMqPeiiV0pQaRf8KZSEl9n6KNLinf
         3GuoC/3SaicfSNEPRZpHzpFr/uSBf4MFNIdKJWjH3Wa3b6Ln/wBd32CagEzMmi8daPFs
         xu4o2NbjuLbjWvnAuwsi4guqdXJXAAkf1Ot94cP4ACDhDg5aBIDVeqPoEMatRMlmFHI1
         qiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B9NJPMCqsZZzif8NOi6LqBERuaw3Qi0GLNSjXaKH72E=;
        b=LwVI3pQMQ0pw6hpN1g6ruTbeDhKY78bqgs4Ey3lhAjKIeMhDWLmU0gz67IF2uzEeG/
         ZTDlBTFGygMI1cqlDY/GjHeIFEflF2fnPHLea3RSLBxplq8sTWe/bpkatQUp5/Kih4uX
         XFNNU3gxMs48rb+igJ/P6utlzBGJe3CzSGKbS4Tm3IXg62KhbMpOusOQVlPwv/ZqBXHs
         g4LWF4GWix7HaflAbXK9TkkG4i4C1p9wBrzSKzcZ0MFewPjruVUXAEZXuN+9w1t6F+Mg
         8gO3lmLG8BvdSWOr9KKaUKurM9daelHj24lRNcimbMAG+KEL0CfE60g0HmnDvXBHwOY7
         Qg3g==
X-Gm-Message-State: AJIora8SsxqTiGSvg6/wP5dzFaLdVGlfOFl6G5api2yzLNWSU9nSHor6
        A8tdL3aJHENKuFFhmOlvApeHfq6G3ylyflaQdBHdNw==
X-Google-Smtp-Source: AGRyM1ulXYs5LWVIFJXKUv4+yuTHZrksYcFCAawy5yUnHHithMuDKkcC43SQczJ+AibEVdQ6zRlR2WiS6vf9kyrleIc=
X-Received: by 2002:ac8:5942:0:b0:31f:39f6:aba7 with SMTP id
 2-20020ac85942000000b0031f39f6aba7mr2122937qtz.295.1659077575797; Thu, 28 Jul
 2022 23:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220727100615.638072-1-dmitry.baryshkov@linaro.org>
 <CAL_JsqJjLn8ypBo+bBoO+CE-si7gemP02fi8EWk97QRPPpNoVg@mail.gmail.com> <CAK7LNARXbXZFpxiHuLhzjJ4YahfV6z3dNPAdkkmeOXONBx8u3w@mail.gmail.com>
In-Reply-To: <CAK7LNARXbXZFpxiHuLhzjJ4YahfV6z3dNPAdkkmeOXONBx8u3w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Jul 2022 09:52:44 +0300
Message-ID: <CAA8EJprM4WAgfVTJ15azFtSH6POL5uuseHO=zVxRd44RmqKZjw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: take into account DT_SCHEMA_FILES changes while
 checking dtbs
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

On Fri, 29 Jul 2022 at 08:55, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Jul 28, 2022 at 2:36 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Wed, Jul 27, 2022 at 4:06 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > It is useful to be able to recheck dtbs files against a limited set of
> > > DT schema files. This can be accomplished by using differnt
> > > DT_SCHEMA_FILES argument values while rerunning make dtbs_check. However
> > > for some reason if_changed_rule doesn't pick up the rule_dtc changes
> > > (and doesn't retrigger the build).
> > >
> > > Fix this by changing if_changed_rule to if_changed_dep and squashing DTC
> > > and dt-validate into a single new command. Then if_changed_dep triggers
> > > on DT_SCHEMA_FILES changes and reruns the build/check.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  scripts/Makefile.lib | 14 ++++++--------
> > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index c88b98b5dc44..3df470289382 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -383,17 +383,15 @@ DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
> > >  DT_BINDING_DIR := Documentation/devicetree/bindings
> > >  DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
> > >
> > > -quiet_cmd_dtb_check =  CHECK   $@
> > > -      cmd_dtb_check =  $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
> > > +quiet_cmd_dtb =        DTC/CHECK   $@
> >
> > This is supposed to be 7 chars or less. DTCCHK or DTC_CHK perhaps. Or
> > always do just 'DTC'. I can fixup when applying.
> >
> > I'll give it a few days for other comments.
>
>
>
> When you change DT_SCHEMA_FILES, re-running dt-validate should be enough.
> You do not need to re-run dtc.
>
> I guess the strangeness comes from the fact that you are trying to do the
>  two different things in a single rule.

The issue is that with the current rules the dt-validate isn't
re-executed on DT_SCHEMA_FILES changes. Thus comes my proposal.

-- 
With best wishes
Dmitry
