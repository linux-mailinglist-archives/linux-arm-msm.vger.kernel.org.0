Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCFC4D1F55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 18:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348614AbiCHRpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 12:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240785AbiCHRpZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 12:45:25 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EAE43EED
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 09:44:28 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id q189so3980010oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 09:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LWBHo8zyRbtdgwtvZ69Wg4Ge808fFLN2tC6X5Zn9ZkA=;
        b=aDCxkrA6yFPydxBcxmDwIW0PjIDqrTBzHkAdiRd9zZtESMHM6/XNtBZ2HVZV1HjtZr
         iu/5YMOzeJBcov436XH1FbQ6ShbJGMgIeiTEI8Hg6WPEAII6pCfcLL695yjiR2WoZSBe
         PmK5cwoG3mPRN/vBYNW7DTw8YI/Xc0AGHfHA7wpaqcVQzeUNMxbkYViIjoyH8cliUXz0
         IpIpyGWV6eN0YYbxtq2bmhmlbfsgterUKbHbYPPWCK9Ryl8+5/2Ss9JTibdIxOcT1hQy
         jXZ3Om/LFm+g95bwfVQ8DhdPDr/3VwR/NY35q/FymjdgvjUtSWp11xARAQHlwrjP113c
         OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LWBHo8zyRbtdgwtvZ69Wg4Ge808fFLN2tC6X5Zn9ZkA=;
        b=rvKb/jaSX3YI8juoZ3qVpd6EH6qIqlgeEIEWTGgHBs+7JvJK/e1uI0hpuVXp3ChFzZ
         ig5o4aMynBIZYxuzIxLYoTEQ1EpFvRjuxT6ca/ndq/tdQxrZrl4Xb+Ikak17TupSgrqc
         +rT4kGlX/6m4Mo7GvYpo+DWkiOsuOI+lgkz35oUyG+mHr0jS96qOgJ/+73B/np0dvjXs
         9c5BERn6pxdH/aSh5NbxYnA9h1R1gPfjjLdSuv7l5uwNeoAUiJ0kak6xGhKfpQ7jXZgz
         Am8+O0rhPVcHlQkcF1iJXYIgUFOE4UU0piZd+ZQ3raMJiT7YRweQWvlYgZUpCCQ0qmiH
         Cehw==
X-Gm-Message-State: AOAM532i+PHxcRfH3fp+5lUR9u7TpP5+kyDd1i3tzALroLeTtD0IJKak
        t/ACeM6OkGx9LhcEK5aY0rnW2A==
X-Google-Smtp-Source: ABdhPJwAg6e9dMfVsqqM7of4Q4JH4WF/O8PgvyZH6AwlM7Xy7iK9Wv14Io5Dt/gTtcDvPi7FPeA2Hg==
X-Received: by 2002:a05:6808:10c8:b0:2d4:a070:d20b with SMTP id s8-20020a05680810c800b002d4a070d20bmr3370323ois.88.1646761467535;
        Tue, 08 Mar 2022 09:44:27 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id r4-20020a9d5cc4000000b005af6f4ff5e2sm7982132oti.61.2022.03.08.09.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 09:44:27 -0800 (PST)
Date:   Tue, 8 Mar 2022 09:46:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc:     agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Venkata Prasad Potturu <quic_potturu@quicinc.com>
Subject: Re: [PATCH v10 3/7] pinctrl: qcom: Update macro name to LPI specific
Message-ID: <YieWYtK5gCCIaPA+@ripper>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
 <1646737394-4740-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646737394-4740-4-git-send-email-quic_srivasam@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Mar 03:03 PST 2022, Srinivasa Rao Mandadapu wrote:

> Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 2f19ab4..3c15f80 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -40,7 +40,7 @@
>  #define LPI_GPIO_KEEPER			0x2
>  #define LPI_GPIO_PULL_UP		0x3
>  #define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
> -#define NO_SLEW				-1
> +#define LPI_NO_SLEW				-1
>  
>  #define LPI_FUNCTION(fname)			                \
>  	[LPI_MUX_##fname] = {		                \
> @@ -193,14 +193,14 @@ static const struct lpi_pingroup sm8250_groups[] = {
>  	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>  	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>  	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
> -	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> -	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
> -	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
> -	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
>  	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>  	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> -	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
> -	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
>  };
>  
>  static const struct lpi_function sm8250_functions[] = {
> @@ -435,7 +435,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>  			}
>  
>  			slew_offset = g->slew_offset;
> -			if (slew_offset == NO_SLEW)
> +			if (slew_offset == LPI_NO_SLEW)
>  				break;
>  
>  			mutex_lock(&pctrl->slew_access_lock);
> -- 
> 2.7.4
> 
