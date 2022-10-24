Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE2A609921
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 06:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJXE1U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 00:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJXE1T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 00:27:19 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26C472B7C
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 21:27:15 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d6so14805480lfs.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Oct 2022 21:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsk5CrZNueDPtuaAH1T6ByrqedpifBu30NKTXE3DIrQ=;
        b=CpCMkhdenirRouvRGG0BILtVUvFEd5aDGL7VID6oPrth7aNOd91QDz1oy7B7OH0Obh
         B3RRzzs6FmVuEQIXqGIjEyyJBqDMNEvJf25QnS5VOLW3hF1Tbz45Lk+fW9SfeqTINsmC
         U9Inbfmg+fkFeXwDqi/G+2fYuvlSGw3qFokOoiKWjyTp1OJwwruOmBaryzDu7fBTgVQM
         bAEgsdi5lWIvTjdVCSoi5CVClE4aAPKwVtQHX6ROu8v4BpwTQSrzMAdd16e4lWJLohpD
         CxU6kj2Yy7Fp282otnASNrJvUbJRUZK3Ed4F1K3pLWWMZvcjOJMmHkEk4BDkmRArxA3x
         4eQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dsk5CrZNueDPtuaAH1T6ByrqedpifBu30NKTXE3DIrQ=;
        b=obX+Sdo2ehe94L7G0IpllsIGLxA/c3u4QQRYmJWU7hzQEhOJgGmEl6U29XXUgBpq2E
         bgJEVXyeMIvq5DPmEkHaYlKhRgZn8xUKUo/StT172/V5S8bGPyn/2ptkSS8QzeYdeaJk
         dzc8UVrRiWiQD3BrhR3Twqz8OKn8wsKhrrCfqb6oRS2u1loQAADdZWs65SwfsdBje/Nj
         OXn/Yy0f3E7a40aqsQXjgeW3O5bSgLOJTuZNowc+JLH6tkaM5O7c0PpTf8q5opAUEpD+
         3DCUaWjHhmYg2QTlgD+YbMWWHNJaJCPzScPvR4sBgD8EMs3HhWER26CIfbYxMhDD1sI/
         cvFQ==
X-Gm-Message-State: ACrzQf2UOod7JeQoIBf9zKqO39Ie4XRW69sVCEEwzvJJaekcJy2OkE5g
        HAXolXi+JHTCYSq44Hj6NN8K27t0nL2BpxSZ07+Mbw==
X-Google-Smtp-Source: AMsMyM4T3topThgg5ZuMoUHR0TVRDCF2V1F6PeP3YU93In1utVJUs/DA4F87zpq37OFYZ4BaDeiDJ+o98W2pyco+au4=
X-Received: by 2002:a05:6512:2207:b0:4a2:6b5d:8afc with SMTP id
 h7-20020a056512220700b004a26b5d8afcmr10071171lfu.261.1666585634285; Sun, 23
 Oct 2022 21:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220805074935.1158098-1-jun.nie@linaro.org> <20220805074935.1158098-3-jun.nie@linaro.org>
 <20220926162917.yte3kooilqenufrp@builder.lan>
In-Reply-To: <20220926162917.yte3kooilqenufrp@builder.lan>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Mon, 24 Oct 2022 12:27:03 +0800
Message-ID: <CABymUCP9XbKvq=_7Q1ToE7cp3zP1JF2KThK-SSTz=B6mS92eXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: qcom: rpmpd: Add corner power-domains states
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, agross@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn Andersson <andersson@kernel.org> =E4=BA=8E2022=E5=B9=B49=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=8C 00:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Aug 05, 2022 at 03:49:33PM +0800, Jun Nie wrote:
> > Some SoCs use corner instead of level in rpm regulator, such as
> > MSM8916 and MSM8939. Add these power-domains states value so that
> > devices can vote them.
> >
> > Note that there is a shift with 1 when converting the value from
> > regulator usage in Qualcomm Linux 3.18 to power domain usage here.
> > Because corner is not well hacked in regulator framework in 3.18.
> > For example, RPM_REGULATOR_CORNER_RETENTION is 2 in 3.18 while
> > RPM_SMD_CORNER_RETENTION is 1.
> >
>
> How about we just stick with the numbers in the rpmpd node in DT, as
> that would be the only place these constants are used and all the actual
> users can use the label associated there?
>
> Regards,
> Bjorn

The clock driver change in this patch set, the consumer of the
regulator, is dropped. So there
is no more consumers that need the name. So this whole patch set can
be abandoned now.

Regards,
Jun
>
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/dt-bindings/power/qcom-rpmpd.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindin=
gs/power/qcom-rpmpd.h
> > index 6cce5b7aa940..f778dbbf083d 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -297,4 +297,12 @@
> >  #define RPM_SMD_LEVEL_TURBO_HIGH      448
> >  #define RPM_SMD_LEVEL_BINNING         512
> >
> > +/* RPM SMD Power Domain performance levels in regulator corner method =
*/
> > +#define RPM_SMD_CORNER_RETENTION     1
> > +#define RPM_SMD_CORNER_SVS_KRAIT     2
> > +#define RPM_SMD_CORNER_SVS_SOC               3
> > +#define RPM_SMD_CORNER_NORMAL                4
> > +#define RPM_SMD_CORNER_TURBO         5
> > +#define RPM_SMD_CORNER_SUPER_TURBO   6
> > +
> >  #endif
> > --
> > 2.25.1
> >
