Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAFF6489B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 21:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbiLIUwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 15:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiLIUwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 15:52:45 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9656BBC31
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 12:52:44 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id g7so8846898lfv.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj9hWgWY6DzifYBIvFgTsPapdUtki3fp8cPuRUAv5cU=;
        b=X31HflyuE5ExTUYKMZ1LI6Zs0Si1rbwcCV0qulY4VPQABapKV1wmpSmX/nGbkzAnmw
         TjBWIsDUbIp5E5tcwg8VNeaaOXjFuSy0izUKNbCG0L7ODuVA+52P9IjqO7baKVkHEyva
         bLyvN2Dc5Jh+lO5z/Eib+he9nr+J4Jtu6tr8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj9hWgWY6DzifYBIvFgTsPapdUtki3fp8cPuRUAv5cU=;
        b=45+ovIczIZiqctYf29OrvnaOR8ACulyK7jYI5PyU+3G+QoxmCVJ2kl6XmamVVf5iyG
         2BPhj8RNPqnamIUZ0EDfeWUz/S5VLFvDsRC8vmEdFHx3/PybUByoXLc8OV6yROvQjU8T
         7slm7m4KSA7wfS8orQLRgU6WV6VpxXpG2nOJhaqc5XX/BL/gf4W5hmrKf5dg4CBFruzp
         quOTxsP4aBt7TcOY6ADHcQAI8IFxuygRJPW2PDPxPHaGgCSZMcY+sxvomZltFZ2/keSr
         iFDC3He1vbgNbH2wEaO0aHyAs952Q5fb9aJ1P90nk5vXpyKc38dhYE8yItzPAPqPRmpx
         Ngqw==
X-Gm-Message-State: ANoB5pkLXUc6y88VrZqgDgaHor+7+CbzQGyWc97H8MgXQzgqYELV0XmD
        91DIuOiJnSz7vgrBmuwD9yi1GdLC70b/bRHnIc35Mw9Z6zB73Q==
X-Google-Smtp-Source: AA0mqf7MC4Uryvkm5Y9sHf/fsm/ghqu2q3sYTfxfmTOOaObG5TKXiLAgEubGJE1ayHAEA+rzNVvKX/hqSBAVlhtWzK8=
X-Received: by 2002:ac2:5e37:0:b0:4a2:4d72:6cc2 with SMTP id
 o23-20020ac25e37000000b004a24d726cc2mr35867808lfg.511.1670619162961; Fri, 09
 Dec 2022 12:52:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Dec 2022 15:52:42 -0500
MIME-Version: 1.0
In-Reply-To: <ec403926-24ef-947d-2a1c-6cbf0e31ab89@quicinc.com>
References: <1669897248-23052-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n520=mjdc4H1m8au0iBo2qEeaL8OrF1HCP0bXORe2Wa_7w@mail.gmail.com> <ec403926-24ef-947d-2a1c-6cbf0e31ab89@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 9 Dec 2022 15:52:42 -0500
Message-ID: <CAE-0n50VYGNF_rGzyb_2Jd8dY8cFx3BeOw0s-ywELkRqEEig4g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: elf_loader: Update resource table name check
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, bgoswami@quicinc.com,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, krzysztof.kozlowski@linaro.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mathieu.poirier@linaro.org, perex@perex.cz, quic_plai@quicinc.com,
        quic_rohkumar@quicinc.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-12-08 05:40:54)
>
> On 12/7/2022 7:25 AM, Stephen Boyd wrote:
> Thanks for Your Time Stephen!!!
> > Quoting Srinivasa Rao Mandadapu (2022-12-01 04:20:48)
> >> Update resource table name check with sub string search instead of
> >> complete string search.
> >> In general Qualcomm binary contains, section header name
> >> (e.g. .resource_table), amended with extra string to differentiate
> >> with other sections.
> >> So far Android adsp binaries are being authenticated using TZ,
> >> hence this mismatch hasn't created any problem.
> >> In recent developments, ADSP binary is being used in Chrome based
> >> platforms, which doesn't have TZ path, hence resource table is
> >> required for memory sandboxing.
> >>
> > Does this need a Fixes tag?
> I don't think so. I feel It's kind of enhancement.
> >
> >> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> >> ---
> >>   drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> >> index 5a412d7..0feb120 100644
> >> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> >> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> >> @@ -272,7 +272,7 @@ find_table(struct device *dev, const struct firmware *fw)
> >>                  u64 offset = elf_shdr_get_sh_offset(class, shdr);
> >>                  u32 name = elf_shdr_get_sh_name(class, shdr);
> >>
> >> -               if (strcmp(name_table + name, ".resource_table"))
> >> +               if (!strstr(name_table + name, ".resource_table"))
> > Was the strcmp not working before because the 'name_table' has something
> > else in it? It really looks like your elf file is malformed.
>
> Actually, DSP binary is prepared by combining different elfs. So Section
> header names are appended with
>
> something else to distinguish same section name of different elfs, by
> using some Qualcomm specific QURT scripts.
> Hence final binary contains resource_table name appended with module
> specific name.
>
> So this patch is required to handle such modified name.
>

Can you clarify how the section header name looks? Probably you can
objdump the section here and provide that information to help us
understand.

I think remoteproc_elf_loader.c assumes the ELF file is properly formed.
There should be a section named '.resource_table', so the strcmp will
find it by looking at the section header names.
