Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331F350309B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 01:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356207AbiDOVng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 17:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353698AbiDOVmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 17:42:24 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DA212633
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 14:39:54 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id mp16-20020a17090b191000b001cb5efbcab6so12645449pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pnnhVnGjhESFSvN5AIAUxQOTXkNGysYpxD5X0481Phs=;
        b=Mr7FDGOCaG90Xqb9CkSUPuMLdgZLTpRANkq0G9fniO9sl7RuxMhwa4pMV7r5aAPtzr
         WmI0puD3f3vvRKTbriacpoZCx07mwNv4Q8uGwKJ58b15UjhjHbYdIdBK34DjlTTZpRkX
         YqcK6dt1qkBadKHIxzvtlkwWFYo49k1qxyF2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pnnhVnGjhESFSvN5AIAUxQOTXkNGysYpxD5X0481Phs=;
        b=UOaJlRuAlDOHdYrK32DhTSrwa1slQS2t0EaFxPIShk9Yoge+0N8XY5XnM9Lm9wnyW9
         wkXi2zvzKveOuo2/t7FzH9m+WG3/d7R6phCFclGFgE6h/lwZRzAAQX9yL+79PlfsFQy2
         iawVKUKk5f5rIZlPtm1t7Zv6F2qO/I/cfEgAopGA+eTyjwpLJoSbxK0TCn7gExpP4SDJ
         s1iUxdHdQOsZacsbLXUP0sghYbN1Ozy6/BcICzv1U/n5Qbvb00NrUqhUSmXTWfryBTeu
         nq5d8AAPZgJqHYAT3BPAA4tfCaJIDuMoujVzVy9ZPnBNeDoZEiXXpJDwDsmJv1AAWr0I
         ixFA==
X-Gm-Message-State: AOAM533T+CRUEwF94h3YbqO3uY2RhLC3/Mz1URyrMIKNonZ0Ag+/iee4
        ft2HenaWOckHCRoLs/a5pa77uw==
X-Google-Smtp-Source: ABdhPJzezmjazjpZOJiGsT/T33Plq2/us4Na0I8/Us86rxlwMws1XdK7SKgVBfiOxbVNW1v+4cbJfw==
X-Received: by 2002:a17:90b:3b8f:b0:1c7:b62e:8e87 with SMTP id pc15-20020a17090b3b8f00b001c7b62e8e87mr6192674pjb.156.1650058794221;
        Fri, 15 Apr 2022 14:39:54 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
        by smtp.gmail.com with UTF8SMTPSA id w9-20020a056a0014c900b004fb2ca5f6d7sm3707308pfu.136.2022.04.15.14.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 14:39:53 -0700 (PDT)
Date:   Fri, 15 Apr 2022 14:39:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v12 5/7] pinctrl: qcom: Extract chip specific LPASS LPI
 code
Message-ID: <YlnmJz/wjxfkZFua@google.com>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-6-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1647447426-23425-6-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 16, 2022 at 09:47:04PM +0530, Srinivasa Rao Mandadapu wrote:
> Extract the chip specific SM8250 data from the LPASS LPI pinctrl driver
> to allow reusing the common code in the addition of subsequent
> platforms.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

>
> ...
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> new file mode 100644
> index 0000000..8c95d0f
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c

...

> +
> +/* sm8250 variant specific data */

nit: the comment seems a bit redundant since this is now the sm8250
pinctrl driver.

> +static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +};
>
> ...

The nit is just a nit and otherwise this looks good to me, so:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
