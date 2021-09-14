Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B8340AE47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 14:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232888AbhINMyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 08:54:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232676AbhINMyw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 08:54:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E94AE610CE;
        Tue, 14 Sep 2021 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631624014;
        bh=oMnYDodGXLIKJPF+npz+/WoTRhIUvTosOvojYmQNO0M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZKzkENFynYHThDOyRShpNlBBGBgEkWgHX+99FF1kUFeJKvzlcdJHT/0WHbex42jly
         KT0ZtnW2y6mN1VSnRO8EWlcUplhE5NgX3I9prcCUdMCTAGfdHUHzscq5b8VoK95DVb
         Jjc+GDgsFYDC/5YbC93jC95Zgb3+egtN+ab5xB5fM/bbF22VkUoM4Ms50g+a6vAW4J
         OP5T9cvWEiEmJ5GZVFbTIj7Rq66BzOuKNdbkEjODaihu91jukqBFVeiAcrBhWQlGDt
         jshgSpxHiHp9dDl9Jq0jIYpWBKClsPLyLHPiLen+NPzvsFOjSI0moj93X03+TS1ZOL
         M/W5uSeP/iZTw==
Received: by mail-ed1-f46.google.com with SMTP id v24so13517034eda.3;
        Tue, 14 Sep 2021 05:53:34 -0700 (PDT)
X-Gm-Message-State: AOAM533ow07awj/rsw19W54uOIBwpcPJefhEO6mJhvw550XTq3FtTaa6
        QuLE9QRQ7EMyp+mT9HivYz9TTThKqcwkMAkgJA==
X-Google-Smtp-Source: ABdhPJxjU7AwljGmpMkruTh5XZY/mSxaoaXtgEIb6u5sLpW0CLUDd0BSFGJn4Jew8gbbKOhsB0aflcoTS8nhYKAaAco=
X-Received: by 2002:a05:6402:150a:: with SMTP id f10mr19146056edw.318.1631624013507;
 Tue, 14 Sep 2021 05:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
 <1631190773.288819.200339.nullmailer@robh.at.kernel.org> <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
In-Reply-To: <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 14 Sep 2021 07:53:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Message-ID: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Gross, Andy" <agross@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        judyhsiao@chromium.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Stephen Boyd <swboyd@chromium.org>,
        Patrick Lai <plai@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 13, 2021 at 3:20 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> Thanks for info Rob!!!.

Don't top-post on maillists.

>
> This error is due to missing dependency
> patch.(https://patchwork.kernel.org/project/alsa-devel/list/?series=543829)
>
> Could You Please check with the above patch applied?

No. How is a script supposed to handle that?

Where have you noted the dependency in the patch? Without that, I
assume you just didn't run 'make dt_binding_check' and the maintainer
doesn't know to check that the dependency is applied.

Rob

>
>
> On 9/9/2021 6:02 PM, Rob Herring wrote:
> > On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
> >> Add devicetree bindings documentation file for sc7280 sound card
> >> registration.
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> >>   .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
> >>   1 file changed, 169 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1438: dt_binding_check] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/1525980
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
> >
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>
