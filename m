Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84A1693225
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 16:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjBKPwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 10:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBKPwx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 10:52:53 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B49F29429
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 07:52:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qw12so22580132ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RD3LGvNcItKoh4Qy+WFoB4i2+xC3g4uw9rhyGD8W28c=;
        b=z2tMtZb9pdV3ozSIItY3sh4Hbj7i+1tcyEAoNrsfUIDB0c7Ss2rXGYYdn8Mq2KSTy3
         Xb5wMHvVEfaxwOsMDcGrk1mn3jjeSYQECICLGNRfBQS9JVKL5c543t92SQwRMKLcHTF+
         LAw8DM1HSHjjWO2D01w0SNu1iIj0Ff54yWMa+1N6BAAJczImOJasdDaMZ/2k7SGgLs2I
         Q1lrl5wbuV32GL5bdH2XAZ4IIys//H30iLPDENZ4Umjta3Zhv/T2Bi93Ht1TZnfeED7u
         H4orQzqJXcr+uCQ4IwmuKx3gdUgFTkSHPdyOtejPhmNz9I8BbmgDhsPBcvej+ia8/yOX
         m2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RD3LGvNcItKoh4Qy+WFoB4i2+xC3g4uw9rhyGD8W28c=;
        b=fiq5uudDDEfXVwul6oYGw1tg9Gn+rg0WdPK57NTZdaqaiuZNBob636PbfBX3Vq1LD2
         Gp2UdpWy8hepP2maxYqorJQLfWghhWJDcrIfKQfbzvw4co4SZxWH7yWb5QKroaJM2gqN
         EehfPbU3m8tYtgSmAVx90iGYUPf1QkfLlBg7/rsrs52f71W9hnQV9tQqAgfub8dLUY+X
         MB0qiU7bYVMkwlw62JJ3BeQWm1NqYqNqvWY33VeFz+6N2jBvdXUiumVz/1YORjhr0bZp
         GQ1AZbsQbKAqF5ISDElBePzYKGL5mGEQhLw61/4oX4cnDh7HxZ4Owdgx2m0pDk1E+CR+
         5ZEg==
X-Gm-Message-State: AO0yUKWqBZWeF0VWNpb/L8z7qgZ06XMMY7x0jJM9C46m1FR3ylMp65wL
        FUtZnatlHsJv2t3xPxZFz4wa8g==
X-Google-Smtp-Source: AK7set8TM3yDzTZOS10jMd62fzS8ZpnkBCiVfUnEU061UOhji5P2sNCeuSTzUL7yOIo7JdT80eoXIA==
X-Received: by 2002:a17:907:608b:b0:8aa:c105:f0bf with SMTP id ht11-20020a170907608b00b008aac105f0bfmr20636268ejc.17.1676130770757;
        Sat, 11 Feb 2023 07:52:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id uj9-20020a170907c98900b00884c611145fsm4021992ejc.62.2023.02.11.07.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 07:52:49 -0800 (PST)
Message-ID: <d8d13ded-9f37-e96a-e34f-4e885fd15c0d@linaro.org>
Date:   Sat, 11 Feb 2023 17:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config into
 SDM845
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-7-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-7-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/02/2023 13:51, Konrad Dybcio wrote:
> The configs are identical, other than the number of *maximum* DSI
> hosts allowed. This isn't an issue, unless somebody deliberately
> tries to access the inexistent host by adding a dt node for it.
> 
> Remove the SC7180 struct and point the hw revision match to the
> SDM845's one. On a note, this could have been done back when
> 7180 support was introduced.
> 
> Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")

Same comment regarding Fixes

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
>   1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 860681bfc084..142a0f1e2576 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>   	.bus_clk_names = dsi_v2_4_clk_names,
>   	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
> -		{ 0xae94000, 0xae96000, 0 },
> +		{ 0xae94000, 0xae96000, 0 }, /* SDM845 / SDM670 / SC7180 */
>   	},
>   };
>   
> @@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>   	},
>   };
>   
> -static const struct msm_dsi_config sc7180_dsi_cfg = {
> -	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = dsi_v2_4_regulators,
> -	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> -	.bus_clk_names = dsi_v2_4_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> -	.io_start = {
> -		{ 0xae94000, 0 },
> -	},
> -};
> -
>   static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>   };
> @@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> -		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
>   		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,

-- 
With best wishes
Dmitry

