Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B29E7667A0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 16:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbjALP5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 10:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjALP4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 10:56:42 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB5226274
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:47:07 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bt23so28980650lfb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSe4rwJMMQI1kUHAExXYE+JZJ5iRnEjEjbkFdzskpMM=;
        b=y+JWkaYF6bXt13vZqAwxLp+Kiw4ckMF8f8I41sStoE9I2KRmFFP8Tc16VzZ3kEC/CK
         hCJ/KHuOx/qlmuTse8YtdkW3bPjK3OD87hPpvnLhuDug2IJQ9niPoXc0GnE65VA6OjB+
         OGXziXGqwl3ngyTtweT3LomGtU3fld320W4+LbvKMeVUUTun/jYAT8Qd4OKAS1vC9OHO
         8SYroybQQKIp8tOMVL8gnrV+FVdDKWM6tEOkIIP56ntdBqbm502jPGUc1lZkUoJgtHVR
         tLwCg25WInKenRaRURs0Gcy57T7ThtwEp/Uhu8SIKdtij85KKvskmxCymt3b00ISHJwB
         yk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSe4rwJMMQI1kUHAExXYE+JZJ5iRnEjEjbkFdzskpMM=;
        b=FysncIMXX5aLjTHpKW038fWJ+BYdRXdVQ8pjOTHy0OoB/To3LdaSv4FoqulMTLPQkx
         hkNwZNwSug3ERiBA+cUEAoHRkpckuJoheBPGfNkGHvkwXsPkB+INlsqwxNX0kXCQ0X3X
         bX7j9oS8QHVEMQprC4tGzuoa3rWobe6GDEJpUYJCodN5DCS8jalXTU85zpGB6ANhLBmV
         CdOTcOcNFwA/ypa3pT3U93HjL5vH4emYQXGN4RzAxpIDbTip8esffSkXJCKf1vKb1/5d
         H5JWTHn5fFDuxyb+Kv2I+FB5ntDbav559nTf8OvuJYJ2JlavyPB5kWsQwLCFgnBSIm5T
         jdKg==
X-Gm-Message-State: AFqh2kq2Ig7OYBUTaj9oMp+W92ADwR3Gz/3xbtHIaG+XTjATAis6YyM4
        CVqSLcXN+3YAfpBn4NwCS4xc22DYyK3uH0p+
X-Google-Smtp-Source: AMrXdXv2eWY7PQIYgKEXqllnF/IzYRu4+rCKIHE6d9qVZu1v2ewTGDX2yT7ZLYgG92yHtdN6nKbXBQ==
X-Received: by 2002:a05:6512:1054:b0:4bb:70b2:6f50 with SMTP id c20-20020a056512105400b004bb70b26f50mr23490136lfb.52.1673538426202;
        Thu, 12 Jan 2023 07:47:06 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056512159600b004cc800b1f2csm2560603lfb.238.2023.01.12.07.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:47:04 -0800 (PST)
Message-ID: <6b24a176-8084-b01c-30e4-9e8fa2088138@linaro.org>
Date:   Thu, 12 Jan 2023 16:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] arm64: defconfig: enable Visionox VTDR6130 DSI
 Panel driver
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org>
 <20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.01.2023 10:42, Neil Armstrong wrote:
> Build the Visionox VTDR6130 DSI Panel driver as module
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c9011e1438c0..7bbf628ab80c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -765,6 +765,7 @@ CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
>  CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>  CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
> +CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>  CONFIG_DRM_LONTIUM_LT8912B=m
>  CONFIG_DRM_LONTIUM_LT9611=m
>  CONFIG_DRM_LONTIUM_LT9611UXC=m
> 
