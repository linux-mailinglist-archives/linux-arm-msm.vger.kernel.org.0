Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE435B93CD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 07:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiIOFFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 01:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIOFE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 01:04:59 -0400
X-Greylist: delayed 445 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Sep 2022 22:04:56 PDT
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A9B1AD8A
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 22:04:55 -0700 (PDT)
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-10.nifty.com with ESMTP id 28F4pw7F017772
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 13:51:58 +0900
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 28F4pJsh012735;
        Thu, 15 Sep 2022 13:51:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 28F4pJsh012735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1663217480;
        bh=LokpXFM+jKjnxi3CKS4674Efn0BVYhL63eu/XEV6zfo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZRmdAKrFegaRJAVTjyJd+dXa6SuuzpxvPgtblIdRYwewtVbS8kflY7ZQWEMqd43Sw
         V59IapXq5RnGXiodLwuHTkY/D9/I+e02jd3RwIC8cJj86s1opWTH1W66GQBqTDDU4g
         PLsFB9jZVBJoLNd82pm1B0ZuwcFutUnKTHeZKpJ+Oas8BC39iqmXSVF238u8VPtFdJ
         GZzBwjcct/0aa3n4FnfNTKDh+GsBCa2/Cii0s0A/jKUHYaiwHlvIpa+VorK+Oa/uhj
         Ci50p+kT2E2HgJV5yh4YBSs1GtPiVGvprmZd0Hzb/qcjBKp74pwEsZziscRbiBvYfA
         CTV4yKdTHZR8g==
X-Nifty-SrcIP: [209.85.210.49]
Received: by mail-ot1-f49.google.com with SMTP id v14-20020a9d69ce000000b00658f339b0a3so411038oto.1;
        Wed, 14 Sep 2022 21:51:20 -0700 (PDT)
X-Gm-Message-State: ACgBeo3MYNTOLyWULnBbpKJE1KjY/kCDi7dRYtTXUuBXHv5gwo46qAxx
        EcLGQPy2cB8Xo9Bmqtk7Ch2TLS+dKF4Zjvp8TKY=
X-Google-Smtp-Source: AA6agR49F9OnVykDVvTYWEHonilGPnu1xqf+S3Mf77s9iGVXAiFgX06TR8u3Z8OijDUueGQprpmXtzz8+2/xr+C/yxA=
X-Received: by 2002:a05:6830:658b:b0:63b:3501:7167 with SMTP id
 cn11-20020a056830658b00b0063b35017167mr16204558otb.343.1663217479180; Wed, 14
 Sep 2022 21:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220727100615.638072-1-dmitry.baryshkov@linaro.org>
 <CAL_JsqJjLn8ypBo+bBoO+CE-si7gemP02fi8EWk97QRPPpNoVg@mail.gmail.com>
 <CAK7LNARXbXZFpxiHuLhzjJ4YahfV6z3dNPAdkkmeOXONBx8u3w@mail.gmail.com>
 <CAA8EJprM4WAgfVTJ15azFtSH6POL5uuseHO=zVxRd44RmqKZjw@mail.gmail.com>
 <CAK7LNAQU42fpqPqUipZYx+685B+Rc8JGdaKcP3TdfQWUept1nQ@mail.gmail.com>
 <CAA8EJprMsEE-fkpP=QGgpCga5rb9_mJF51cvRjeWsG7NBeijSA@mail.gmail.com>
 <CAL_JsqLptaL_Uv++dEzUx83n3c+AAu9rYUv6Zbb7sLbJE35wWA@mail.gmail.com> <CAA8EJprBAtdWAGG=a7BYc_Zwx9B5Dqsy4n3dhvP5cA40agR8ew@mail.gmail.com>
In-Reply-To: <CAA8EJprBAtdWAGG=a7BYc_Zwx9B5Dqsy4n3dhvP5cA40agR8ew@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Sep 2022 13:50:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARpPvBH0i55nD0v+8KDeqy2eK996TRhwE-KNAF+8mG3xQ@mail.gmail.com>
Message-ID: <CAK7LNARpPvBH0i55nD0v+8KDeqy2eK996TRhwE-KNAF+8mG3xQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: take into account DT_SCHEMA_FILES changes while
 checking dtbs
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 11, 2022 at 2:36 AM Dmitry Baryshkov

<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 4 Aug 2022 at 18:27, Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Fri, Jul 29, 2022 at 1:46 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Fri, 29 Jul 2022 at 10:05, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > On Fri, Jul 29, 2022 at 3:53 PM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > >
> > > > > On Fri, 29 Jul 2022 at 08:55, Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, Jul 28, 2022 at 2:36 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > > > > >
> > > > > > > On Wed, Jul 27, 2022 at 4:06 AM Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > > >
> > > > > > > > It is useful to be able to recheck dtbs files against a limited set of
> > > > > > > > DT schema files. This can be accomplished by using differnt
> > > > > > > > DT_SCHEMA_FILES argument values while rerunning make dtbs_check. However
> > > > > > > > for some reason if_changed_rule doesn't pick up the rule_dtc changes
> > > > > > > > (and doesn't retrigger the build).
> > > > > > > >
> > > > > > > > Fix this by changing if_changed_rule to if_changed_dep and squashing DTC
> > > > > > > > and dt-validate into a single new command. Then if_changed_dep triggers
> > > > > > > > on DT_SCHEMA_FILES changes and reruns the build/check.
> > > > > > > >
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > > > ---
> > > > > > > >  scripts/Makefile.lib | 14 ++++++--------
> > > > > > > >  1 file changed, 6 insertions(+), 8 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > > > > > > index c88b98b5dc44..3df470289382 100644
> > > > > > > > --- a/scripts/Makefile.lib
> > > > > > > > +++ b/scripts/Makefile.lib
> > > > > > > > @@ -383,17 +383,15 @@ DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
> > > > > > > >  DT_BINDING_DIR := Documentation/devicetree/bindings
> > > > > > > >  DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
> > > > > > > >
> > > > > > > > -quiet_cmd_dtb_check =  CHECK   $@
> > > > > > > > -      cmd_dtb_check =  $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true
> > > > > > > > +quiet_cmd_dtb =        DTC/CHECK   $@
> > > > > > >
> > > > > > > This is supposed to be 7 chars or less. DTCCHK or DTC_CHK perhaps. Or
> > > > > > > always do just 'DTC'. I can fixup when applying.
> > > > > > >
> > > > > > > I'll give it a few days for other comments.
> > > > > >
> > > > > >
> > > > > >
> > > > > > When you change DT_SCHEMA_FILES, re-running dt-validate should be enough.
> > > > > > You do not need to re-run dtc.
> > > > > >
> > > > > > I guess the strangeness comes from the fact that you are trying to do the
> > > > > >  two different things in a single rule.
> > > > >
> > > > > The issue is that with the current rules the dt-validate isn't
> > > > > re-executed on DT_SCHEMA_FILES changes. Thus comes my proposal.
> > > >
> > > > Correct.
> > > >
> > > > What I said is like this.
> > > >
> > > > # touch the timestamp file, %.dtb.checked
> > > > $(obj)/%.dtb.checked: $(obj)/%.dtb $(DT_TMP_SCHEMA) FORCE
> >
> > Not really a fan of the thousands of files that creates. Maybe if it
> > was turned into something useful like a list of schemas that apply to
> > the dtb. IOW, a dependency list. That would speed up re-running after
> > a schema change. Though if a schema change created new dependencies,
> > that wouldn't work.
> >
> > > >         $(call if_changed_rule,dtb_check)
> > > >
> > > > $(obj)/%.dtb: $(src)/%.dts $(DTC) $FORCE
> > > >         $(call if_changed_rule,dtc)
> > > >
> > > > $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
> > > >         $(call if_changed_dep,dtc)
> > > >
> > > >
> > > > With the dtc/check split, we can avoid unneeded regeneration of
> > > > %.dtb when DT_TMP_SCHEMA or DT_SCHEMA_FILES is
> > > > changed.
> > > >
> > > >
> > > > One drawback is we track %.dtb.checked and and %.dtb separately,
> > > > so something like 53182e81f47d4ea0c727c49ad23cb782173ab849
> > > > may come back.
> > >
> > > It's up to you and Rob, but I'd really prefer a simpler solution here.
> > > Regenerating dtbs sounds like a minor pain compared to hacking the
> > > top-level Makefile again. What I really like is that if one has
> > > CHECK_DTBS=y (for whatever reason), he can not generate dtb without
> > > validation.
> >
> > I lean towards just rebuilding the dtbs. That's pretty quick and
> > ensures we get dtc warnings with schema warnings. In the long run, I
> > would like to make the schema checks not optional to run. The
> > impediment to doing that is lots of warnings (but not not some
> > platforms), adding a tool dependency, and validation time.
>
> Rob, Masahiro, do we have any conclusion here? I can change my patch,
> but I'd like to understand in which way I should change it.
> Fixing/testing yaml changes is a bit painful w/o this change.
>
> --
> With best wishes
> Dmitry




I am fine with the patch as long as you fix DTC/CHECK to DTC.





Another idea is to re-check the schema every time,
like this:



diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3fb6a99e78c4..9fc9f39fb12e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -375,13 +375,9 @@ quiet_cmd_dtb_check =      CHECK   $@
       cmd_dtb_check =  $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u
$(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA
) $@ || true
 endif

-define rule_dtc
-       $(call cmd_and_fixdep,dtc)
-       $(call cmd,dtb_check)
-endef
-
 $(obj)/%.dtb: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-       $(call if_changed_rule,dtc)
+       $(call if_changed_dep,dtc)
+       $(call cmd,dtb_check)

 $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
        $(call if_changed_dep,dtc)





Whatever.





--
Best Regards
Masahiro Yamada
