Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDC965C350
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 16:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjACPvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 10:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238039AbjACPvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 10:51:01 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E5A10B47
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 07:50:57 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k26-20020a05600c1c9a00b003d972646a7dso20363502wms.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GXXZY3HiOPqHWHEumfC48xGI6ASMZFdp2zTpaG6aNNk=;
        b=ORhFKQtxmlddNzM+62mkWTfV5XbRIfKuGw8NDzsQMmUKCipeacJUHzzUfj6EvXS97y
         Teh++ZFI24gTetXe+bXRLTfSSoYK9JqbY4pdWM2caGcd52JS7pd5oUKZMuPNAOb5YuBg
         PzEjgJGzFuLt6ZbZ1uq71QvELIl7JBjFD6kqA9JI8lWnLzYekWFLRTq7Rqk984C2L5/X
         41WQrex9WSeCNih8h4sz3vjMNXBe+QNAXlKvQefIagU9tftJ0BswaUy81ngWr8P5Dv3r
         wZ8+It7mJWCdvA8wSKX6Aa3uSxZLQqcf1teWtehgv90VnxPzopUhpjerGiAJ0W384PWa
         ilog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXXZY3HiOPqHWHEumfC48xGI6ASMZFdp2zTpaG6aNNk=;
        b=sA/OWxzgbgQiGNWADkOYlXagB3TVIEq3iSxOijW45cSnQLQ9y27c5l+jGIxFizQiYh
         fq0T0uYe7Uv1SEXDGJffF84xm/DzCcvFRg7XM/54WWLS1Ast32TEFmP/JpNTHR71uit/
         0T24WPSlWcjunshvvVcJ74u9LwTf/EbzsW3UD/jViall9wNGk5zsHPQYIYj1yZMpkiWw
         SMJ0uT1/AlHplgadOyo/h4zY0kOWAvIkqs/Dln17zVomqD4Grfx5Cnp/7hdAeRuAd4vO
         kqpb+tpSU1G4KcMxkbfBpc+3qr+5zvv9zazCBR3MUmP8dv9qWju1O3+tbJjp+em3SLEH
         /1mQ==
X-Gm-Message-State: AFqh2kphZ3orzpbxAoEfnq2yLvZmfRY5K0yIpNTjEm9OZMaSewLEzcLn
        k0f0P5T6vLhkrgINLRH1xrRD3w==
X-Google-Smtp-Source: AMrXdXuKxgBopBOn5wDZcnN3taIktGBbhoifcXvhZmGfs4QknOhnEcJzJb3u0nfSmgTf7dlvwAZwBA==
X-Received: by 2002:a05:600c:12c6:b0:3cf:6926:2abb with SMTP id v6-20020a05600c12c600b003cf69262abbmr34095757wmd.7.1672761056137;
        Tue, 03 Jan 2023 07:50:56 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e8-20020a05600c13c800b003cfd58409desm45598077wmg.13.2023.01.03.07.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 07:50:55 -0800 (PST)
Date:   Tue, 3 Jan 2023 17:50:54 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: PM8550 ldo11 regulator is an nldo
Message-ID: <Y7RO3uf0Q64ptnOT@linaro.org>
References: <20230102-topic-sm8550-upstream-fixes-reg-l11b-nldo-v1-1-d97def246338@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230102-topic-sm8550-upstream-fixes-reg-l11b-nldo-v1-1-d97def246338@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-01-02 12:23:20, Neil Armstrong wrote:
> This fixes the definition of the PM8550 ldo11 regulator matching it's
> capabilities since this LDO is designed to work between 1,2V and 1,5V.
> 
> Fixes: e6e3776d682d ("regulator: qcom-rpmh: Add support for PM8550 regulators")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 43b5b9377714..ae6021390143 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1016,7 +1016,7 @@ static const struct rpmh_vreg_init_data pm8550_vreg_data[] = {
>  	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv, "vdd-l8-l9"),
>  	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,    "vdd-l8-l9"),
>  	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,    "vdd-l1-l4-l10"),
> -	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,    "vdd-l11"),
> +	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,    "vdd-l11"),
>  	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo,    "vdd-l12"),
>  	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,    "vdd-l2-l13-l14"),
>  	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,    "vdd-l2-l13-l14"),
> 
> ---
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> change-id: 20230102-topic-sm8550-upstream-fixes-reg-l11b-nldo-b4de2cb35d0b
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
