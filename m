Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A02FD4C39A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 00:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbiBXXZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 18:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiBXXZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 18:25:28 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D10527579D
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 15:24:57 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id p206-20020a4a2fd7000000b0031bfec11983so4045712oop.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 15:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ykl5+gmxA4yVeV9VmJK6ewapdNVNECzVgJJevXCRQuc=;
        b=TqnUO6z4Q6nA3vvMK4mvsAFxAm2dn/5v+tTeKoc+l5Bx/GpmNS+0w9whrVtnIekxTU
         Y8I0pVxPqJRS9yvOk8U+qh/lJUlnOu2zJ/2ALFyxMTPDBuazPTdITNufwlzT5F7g4qRB
         PHeHFonNG6dDZgQ1E9it56/ppFnxJ2JeZDODU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ykl5+gmxA4yVeV9VmJK6ewapdNVNECzVgJJevXCRQuc=;
        b=Y8OgEvOuI9c0MKLADjT4oOXQeveHVBsoNblSualg7lNBm7/dbbL7KMFso/2P1Jth5+
         lr2LMbdcZVN9PdLpwyJG4VAU79oP6e79N5Qam7ZgpQQMYlV4JjOR9tJ84T6cMyiFR0xX
         9tOuQZcugw9oj0fM/w7K8qIu9GPsTl5evcYtON234iokx0rXSMl44aacK9W/6LH8zYn3
         6FwyI2dS+yGs+3WnjPCntgBrbjmbVryrX+WZCNDdtefsQtVJ3E0XO5Zzt3jcK0W2P5J0
         QESqanAuHA0E7yHMZivKsGl6z/89a8Bdq04f77p+JUDiQgcVmDQ/bCHUBbNWFSiUixFF
         MBiw==
X-Gm-Message-State: AOAM533XJVGesKBCuGATCPm8Lb/jWlrA9sQ868rFYFRKiTKrTbG8Bgef
        mmVWYFb3Mov74Qd1NrfIOEGYrncJiQrLGQ/RAuZUkA==
X-Google-Smtp-Source: ABdhPJxPu46LL0CWhZZy8QN5RXliJtD35auxrUHD4Ow5T5vwfCuYokKQpnP4+gcm1fxEoLSBSOT66tZKar/j9/lM6lM=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr233403oap.54.1645745096848; Thu, 24 Feb
 2022 15:24:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 15:24:56 -0800
MIME-Version: 1.0
In-Reply-To: <1645716828-15305-10-git-send-email-quic_srivasam@quicinc.com>
References: <1645716828-15305-1-git-send-email-quic_srivasam@quicinc.com> <1645716828-15305-10-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Feb 2022 15:24:56 -0800
Message-ID: <CAE-0n51Lc8N=yfx0N=sSGYQLDSpUK_q3HEUkb6d4s1sdQ6W_3A@mail.gmail.com>
Subject: Re: [PATCH v16 9/9] ASoC: qcom: lpass-sc7280: Add platform driver for
 lpass audio
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, quic_plai@quicinc.com, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-24 07:33:48)
> diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
> new file mode 100644
> index 0000000..70c4df8
> --- /dev/null
> +++ b/sound/soc/qcom/lpass-sc7280.c
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + *
> + * lpass-sc7180.c -- ALSA SoC platform-machine driver for QTi LPASS

Should be sc7280, but really the filename should be removed entirely.

> + */
> +
> +#include <linux/module.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <linux/pm_runtime.h>
> +
> +#include <dt-bindings/sound/sc7180-lpass.h>

Is that right? Or is it supposed to be dt-bindings/sound/sc7280-lpass.h?
