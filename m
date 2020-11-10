Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9262AE1A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 22:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbgKJVX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 16:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731807AbgKJVX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 16:23:57 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E789C0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 13:23:57 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id i18so159240ots.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dr4/3qS1+z62awA2yeRAPJfTGcaaGNWy1JcZr/XX9ak=;
        b=qJB5Zpgh2DcQJip8oRxmUAIY3KCoHWN+gGyc1cjRJrqFsrRT7IZEUXIS2eTD1qiqDm
         V4l6KPbE5UizU6/e1NKrT568+zDu1rUaeRBumZ9RvaQIcoea4qZ3Tz5U492nFn+Ox5l2
         yVyjinHo4CG79Xi8r3Hi0PzCWQqlYV/3DamEfz1wcA80kc16BdTnBWDoMczqW5ylNG1C
         G0TiI9VPDRPDTHpGlXgZz6tfawo/us1B9eWEXyTUrSZI8gCnROFg+xoQQym84nqx/oeq
         Q8/G/AsgIItcP/UY7J6chaaAOMxQaaTTfbqRbahXHYt11Uxs9KO/9/ilwSUdZjrywhRi
         DvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dr4/3qS1+z62awA2yeRAPJfTGcaaGNWy1JcZr/XX9ak=;
        b=QN6me1HL1Bvh4oeE9vw/M7mIMmvS8+HTyWm0eM7jNbA+Fr7jnQ7Ip+R2vuiiE2ZO1U
         W3Hl0q2j136ORdQqwbLLygA9LSV810GK04vY6f0vyKIZNzWBu9EjQQ21iMH3G6JOnC8j
         p/Kk+bsm+lFbGFLlcWv4zGvEBSN4CYEFF/XaHwLd6aJABJg8X35qkD47D41XHiNc3e/I
         GBM/Uz1/8MLZtyvFl/d+OXSn9jOqA3f0b0FGL8BFvAsJ5Hf3m2nveKdDDUK9K/v1elQp
         u/qBpr0vGZWIXK9OoH9/ldsxFsTphgn473iBmUU1auVzecFFOghFjLOpCxWn0rVmYID3
         iOdQ==
X-Gm-Message-State: AOAM532U2YERPfQGvkI3CSIYKjtMk7fWFWZZ6+Z0z3UbvJLgExpWQgsC
        gINEQcGyG7q4UP1O1BnYd9jwFA==
X-Google-Smtp-Source: ABdhPJzJKZ16lT+yRBdEqTcDBQJwsR0BhG8D1cx/opTemZEoXfw4V6Tf/LBN/7cbuzaHSu45NrnbnQ==
X-Received: by 2002:a9d:192d:: with SMTP id j45mr14979829ota.207.1605043436560;
        Tue, 10 Nov 2020 13:23:56 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s4sm34800oov.46.2020.11.10.13.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 13:23:55 -0800 (PST)
Date:   Tue, 10 Nov 2020 15:23:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add sc7280 pinctrl driver
Message-ID: <20201110212353.GD807@yoga>
References: <1604570192-15057-1-git-send-email-rnayak@codeaurora.org>
 <1604570192-15057-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604570192-15057-2-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Nov 03:56 CST 2020, Rajendra Nayak wrote:
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
[..]
> +static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
> +	.pins = sc7280_pins,
> +	.npins = ARRAY_SIZE(sc7280_pins),
> +	.functions = sc7280_functions,
> +	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.groups = sc7280_groups,
> +	.ngroups = ARRAY_SIZE(sc7280_groups),
> +	.ngpios = 176,

I presume the wakeirq_map will come later. Nothing to hold up this patch
for, but please help me remember to not merge the tlmm node with a
wakeup-parent specified before that.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
