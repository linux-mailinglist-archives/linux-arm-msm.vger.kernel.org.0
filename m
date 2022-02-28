Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF24C7B3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 22:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiB1VEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 16:04:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbiB1VEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 16:04:04 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E07649254
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 13:03:25 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so4758850ooa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 13:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0HiWeztvfh0h27wjXWLu9/rtbvB3IfTa5II77KnloE0=;
        b=oXVu11AAULQzkaq+3cCSvydEpAbot/2KU8wOdsDqsCpJhjwuZl7gyU4Cak54GOyP4X
         4mPVqZ310vLC8Pm9Bo6nKbEqAb1+xCvBmkAZK1/s1hKE8rp3ecLXqDH3tmRp0OIqs9mq
         EJTvZwogXoK1JwaqyzLBwNwnUy1NOLptsU6ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0HiWeztvfh0h27wjXWLu9/rtbvB3IfTa5II77KnloE0=;
        b=ZUT8fjrN81bP8AFjj+k7ZBWwBv4iQCl07bDoNf/voIZKPjzhocAlthl5XxA8pcjxtN
         Ija1ka6ad2KaK1v2ZfGR05TeLb7nNJoVncBvJ/o2fMEXFEjFT9POBTjxRb9EYWWooMId
         c5l5slrdh+86CYSWhP4MOIQngfp9PB5aKpLEqT8cPxfAj3++NGspSpLafu/N4D6FG4je
         Q+rvN5nNYC25b/FtWiPPsZXn8wShmpgsfYlPhj1Npn/vL0asAapWXpQ0KWd58UmATYyU
         zDjUWDDvHihU574aqPnKV9QOarCEYYtA/NwbPGxQcJEiG31W4/t1GuJ0r0okDAGcRz40
         EQ1w==
X-Gm-Message-State: AOAM530ZPiR0ujzNI94Ic3wo9TVV073uwCZRV/5CFd9QsY8rLH1kkspp
        t/6D8IHZk5K78Qys4I7Da6NR8SVOi7MOjprU0eFRBw==
X-Google-Smtp-Source: ABdhPJx/F5AysCGRbvBL+PcRbui1fg8nR8qDReQX1sfrQqcmdoiIdqA1u5koeZEHjmONB8ZniRzCMz8FAKzSIXPGkX4=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr3854453oab.32.1646082204474; Mon, 28
 Feb 2022 13:03:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 13:03:24 -0800
MIME-Version: 1.0
In-Reply-To: <1646030377-12092-3-git-send-email-quic_srivasam@quicinc.com>
References: <1646030377-12092-1-git-send-email-quic_srivasam@quicinc.com> <1646030377-12092-3-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 13:03:24 -0800
Message-ID: <CAE-0n51Toe+R+GzWZ5=QGz8oQ-g2W0=AL=RvYMZviwzR8cMfwQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] dt-bindings: soundwire: qcom: Add bindings for
 audio CSR reset control property
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, pierre-louis.bossart@linux.intel.com,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        sanyog.r.kale@intel.com, srinivas.kandagatla@linaro.org,
        tiwai@suse.com, yung-chuan.liao@linux.intel.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-27 22:39:37)
> Update description for audio CSR reset control property, which is
> required for latest chipsets to allow software enabling in CGCR HCLK register.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 12 ++++++++++++

Any reason this can't be yamlified?

>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3..84c8f54 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -150,6 +150,18 @@ board specific bus parameters.
>                     or applicable for the respective data port.
>                     More info in MIPI Alliance SoundWire 1.0 Specifications.
>
> +- reset:
> +       Usage: optional
> +       Value type: <prop-encoded-array>
> +       Definition: Should specify the SoundWire audio CSR reset controller interface,
> +                   which is required for SoundWire version 1.6.0 and above.
> +
> +- reset-names:
> +       Usage: optional
> +       Value type: <stringlist>
> +       Definition: should be "swr_audio_cgcr" for SoundWire audio CSR reset
> +                   controller interface.
> +
>  Note:
>         More Information on detail of encoding of these fields can be
>  found in MIPI Alliance SoundWire 1.0 Specifications.
> --
> 2.7.4
>
