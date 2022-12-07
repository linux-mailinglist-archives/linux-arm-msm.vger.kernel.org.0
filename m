Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24C04645194
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiLGBzI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLGBzH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:55:07 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10C8DB6
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:55:05 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s8so26494696lfc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9gPf1c0smtvvJKefQzCjT4En/iaFZ6itMFzysD6Z4OM=;
        b=F5XdJ8P+8uBnBb+dUBfic7nm5SikL1KNbn7ae+J0KeUhJ7YubLk0eOko+SSKw4JMIL
         RMowVv0fhZjZxvuuC5XCrjHqcsOTFUOkFuxnVS4R0yoybdhUosKxPSJWgXlG8BRCR4Bl
         qByb0+sg9hXnmrQuwKfm+1pfSWG6rpvT2eFiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:user-agent:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gPf1c0smtvvJKefQzCjT4En/iaFZ6itMFzysD6Z4OM=;
        b=d9P3bmjnveWkSB4rR7fGinya1L81oYV/SVJvViGlImOYMW8E14wj7og2pFoEKEVusk
         oX+iZGBXFg4Xma7oXVAVzu5cDXOhAOulCsYsSbOtQOE+XzgBNLW81LgPDglfeWJod4nZ
         iWmcE409ynfpC9pccvjs/MTuh0GP7ddsAe12eaamQG8gZQR5kymIJ1mKfDFsYE1Ju3AJ
         8K9vlgztJwZRRIzsfWlHfL9SAeBTnLxbXnSAl2D32FsGPXkQJ6FvyvVuo4Y6rJ6uwR5F
         ZaawkjB8Q4vQeTAEfIE71REWbQgiIfZWfdA5KX63+C2fM5VqqsEknUvAiQ31Fwe27d9C
         TcfQ==
X-Gm-Message-State: ANoB5pnYYbx7cdquydDp42nO3hM79HXy1ab+H/lXENeBHZZ3Phe/u91y
        GjPJ972dFWuMFRYZCKlkDQ+GKamsym1mM2rlvvz3ww==
X-Google-Smtp-Source: AA0mqf7wtJbEWs3XklSLGf4TQG/d7BmGx6U75OCnWt3zypvQNfxMpgMOwZeyvletG+StOnG/ChUnbuE8/zaGl5Fx4vs=
X-Received: by 2002:a05:6512:33d1:b0:4b5:1c86:9267 with SMTP id
 d17-20020a05651233d100b004b51c869267mr15140973lfg.297.1670378104033; Tue, 06
 Dec 2022 17:55:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Dec 2022 01:55:03 +0000
MIME-Version: 1.0
In-Reply-To: <1669897248-23052-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669897248-23052-1-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Dec 2022 01:55:03 +0000
Message-ID: <CAE-0n520=mjdc4H1m8au0iBo2qEeaL8OrF1HCP0bXORe2Wa_7w@mail.gmail.com>
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

Quoting Srinivasa Rao Mandadapu (2022-12-01 04:20:48)
> Update resource table name check with sub string search instead of
> complete string search.
> In general Qualcomm binary contains, section header name
> (e.g. .resource_table), amended with extra string to differentiate
> with other sections.
> So far Android adsp binaries are being authenticated using TZ,
> hence this mismatch hasn't created any problem.
> In recent developments, ADSP binary is being used in Chrome based
> platforms, which doesn't have TZ path, hence resource table is
> required for memory sandboxing.
>

Does this need a Fixes tag?

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 5a412d7..0feb120 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -272,7 +272,7 @@ find_table(struct device *dev, const struct firmware *fw)
>                 u64 offset = elf_shdr_get_sh_offset(class, shdr);
>                 u32 name = elf_shdr_get_sh_name(class, shdr);
>
> -               if (strcmp(name_table + name, ".resource_table"))
> +               if (!strstr(name_table + name, ".resource_table"))

Was the strcmp not working before because the 'name_table' has something
else in it? It really looks like your elf file is malformed.
