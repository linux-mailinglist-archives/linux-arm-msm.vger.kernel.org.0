Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306933A1DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 21:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhFITea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 15:34:30 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:36471 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFITe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 15:34:29 -0400
Received: by mail-ot1-f53.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so25093789otl.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=/5hRR3JhxA61/7kGbJ52XF4Id3fG9uBeIzCvCACHPQw=;
        b=MMFEzs5U6IDNKqGfwXrix6STIsbRevLZaidgF9ycrqSfLwnZd2nH5WPjEDTby0ZOMT
         8mSMBVUXuPyJIo4vUqhf5ZC9cfz4dg6jelk7kAgdMPS1kHmslrmOtoqpiLM/7/f0b9tk
         3nPQf+T5651vsSqqm8Tz1nlX7vFJ6ukPeraZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=/5hRR3JhxA61/7kGbJ52XF4Id3fG9uBeIzCvCACHPQw=;
        b=AsfW8SFTVd/CstqGyHwcPgnoXMhCCONmT9F+sxToOdYK1A46AjZTpphfrura5uP9No
         eokwqrvz7thCBx/xYSvzZinlZsK7KSL/choDGu1F1P0CfBQ1THd505DegYLPVKw08O5W
         MB/J/Q6XtJdWfmwy1+6qpH//9d94d3uLYTuajdZJ5fXYNNSCi4iUhtiQbtOlMCHN5d91
         hcM9ZNAQDCFaLsUfGMRk5D0PVUV93CPVNcmajA1quRqPAlj6hoD3IW96xHm42trmb6k5
         a/Mg90j0OzJF/2YcciV3HW41CydW/oxKgtJGqFiL6sFoXQWJEMsuRpvPa0IoCmvL13ZR
         Q2jQ==
X-Gm-Message-State: AOAM5335Xp1M0PID3ZYSbVflJ/Zu7Op3RlflkiU7+JVPZLq3qyoIldS/
        OQxpHBhVEaEn168ClqwBRhawYi+W/l2z9elHNwR0fA==
X-Google-Smtp-Source: ABdhPJwbGOmwALrdCY6bSX1H2qs6NY1fPr3SD/WDtOxCLEy4O9BT2CZIneFt6DfO7TE5QTj4TK4ORmu+XZn+RYoNM64=
X-Received: by 2002:a05:6830:190:: with SMTP id q16mr865886ota.34.1623267094752;
 Wed, 09 Jun 2021 12:31:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Jun 2021 12:31:33 -0700
MIME-Version: 1.0
In-Reply-To: <20210609133039.4648-1-srivasam@codeaurora.org>
References: <20210609133039.4648-1-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 9 Jun 2021 12:31:33 -0700
Message-ID: <CAE-0n53Jy_kRK-6L4bZMZ2EAv2n3b9PX2GZSaUodZtU8P7P=6Q@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: Add four speaker support on MI2S secondary
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-06-09 06:30:39)
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index c62d2612e8f5..aff39c9f6326 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -29,6 +29,15 @@
>  #define LPASS_CPU_I2S_SD0_1_2_MASK     GENMASK(2, 0)
>  #define LPASS_CPU_I2S_SD0_1_2_3_MASK   GENMASK(3, 0)
>
> +/*
> + * Channel maps for Quad channel playbacks on MI2S Secondary
> + */
> +static struct snd_pcm_chmap_elem lpass_quad_chmaps[] = {

Can this be const?

> +               { .channels = 4,
> +                 .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_RL,
> +                               SNDRV_CHMAP_FR, SNDRV_CHMAP_RR } },
> +               { }
> +};
>  static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
>                         struct lpaif_i2sctl *i2sctl, struct regmap *map)
>  {
