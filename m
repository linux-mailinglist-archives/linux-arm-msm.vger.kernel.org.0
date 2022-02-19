Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8BCE4BC505
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241156AbiBSCn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:43:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:33876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236548AbiBSCn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:43:27 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D8C6D1AB
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:43:09 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id d134-20020a4a528c000000b00319244f4b04so5825991oob.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UtmLegRwkVr3wWezyzKfAFB4JnMC10QKAFNciSgGel8=;
        b=gp+cIOnxmQg7Dp1LrEiyItHTBnFsiBoTH+TFr7BWN7cP6hlyyWou26Z7+8zcEGyJ2A
         AjBu6Wq3JamEwfL92rRMKTo7LVZhOsOElFEBmt4PUeKVsbYyub6dYvBg4Kh1nFqHigM4
         deFs0k/av9MBoIE02OhAuN4jGzs4Q8njkTe60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UtmLegRwkVr3wWezyzKfAFB4JnMC10QKAFNciSgGel8=;
        b=CUyH2T2FRyOYHVOgtjUaaRi4RPzrHfgQiHofaeinohz/nYYphIYHyc+s+XrvNmzdad
         0XXgrlJ1vMYxeApnOxm7GwN5F5bB8xCSbyxU2zhzoT3OIDT2nN7JXI/57YE8iTMVJHV3
         d3vK5w4woPZIWT3r+8D96LCnOcRtSq9n5XXSvi0HPAefAecROZeONvj3MCmxjKEHKUHv
         pTmAVm3wC84Cg8sDCvVI9rFsz6enVmOrRub7g6igyn0r6Ca3+wdpVBD/8E7Bb5mfMtR+
         5C9R8Neu8BwlP/kLQOrpEBhcde1U9lKrmlMHAFJVfhynnJ962WILFm5RzBq7hJPsx65X
         wZ8g==
X-Gm-Message-State: AOAM530RDr3djyqTrsFTszxKotwkFCwwWkTA2HOKqtbINBbs40lY8BAB
        qsgnl9jrkh9CWabu/yF2VLd+Oz8B3v4gzzzRiEOPwQ==
X-Google-Smtp-Source: ABdhPJyJRpYWmNIAyLH41NYmoT3dSHWPGOzyrIKyiiCwW0H31OICFyU7NDyFeQSP1l2LdJpQqD2GSgVtwJOSExvYoaQ=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4191267oap.54.1645238589326; Fri, 18
 Feb 2022 18:43:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:43:08 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:43:08 -0800
Message-ID: <CAE-0n53-GRneymVoac=AT6M17aYseS88vM-o1xZxmk8sFQOYhw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:52)
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> new file mode 100644
> index 0000000..27e358e
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"

Please include ../core.h here as well for the pin_group definition.
