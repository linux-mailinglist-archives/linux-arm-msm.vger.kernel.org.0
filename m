Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651CF61F2C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 13:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbiKGMRr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 07:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbiKGMRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 07:17:31 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4139A1B7B0
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 04:17:23 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so9503658wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 04:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xH58tesGHB8cYWMBvsr3HiUtTm3R7vrGcMS78GCszzI=;
        b=nEfiADr+cZuJExNoKj9KxB5sOrmAr7ZP0Hg+vcQWt2ghuUaVowk7vMX1S+0CDWhl/U
         xbAQRDvdJ7KmrkC0i+M1L3+iuJ3lIcbnMOhhmsKyoSVpkYWYxpn+PzZvIQDXR9p0D8V/
         qPIT6r7n/p8qtfX06yic6zu2IHqF+IJO8y+TvYALB+Yy0frcwMdUXnsWdPfQIiufqeEj
         6espEPL+2PM9KI8DOYyFAm8UMkq3JqqSa0JjazHKctv36UAWyuqCYP9vVimxu/elCCYc
         icAVQ+Wvitw0N6d+6kmrJsFF4Kutj4IjUfWnfRqIH2sBXhZ7btPVlv2TKj4QlmQWEeDn
         4Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH58tesGHB8cYWMBvsr3HiUtTm3R7vrGcMS78GCszzI=;
        b=11WzNeSZvoQXn/UNF8mWqGI+/Z87P4eZvlyAiFI2WXvLuHrxHjKJibftGq7KccsuC0
         oqhaLJpGMlEXQk011PvOoHdvDF9KIUOdtpdGILIMh7l+neJ+TTIO6jJ0NqW6v8aAoxT+
         TWtExqEBFKZZAirE9aKRlLrDRP2LzvO2jhLyXoCfoebBfGthOSZ6srMle4QbvCv/erHC
         5mOrps0kp+3jy2h1ETrzP4G+Qrjw+XYTaOtxXTQCr+jX6PHinFWQWBKqXLE/oM6mNCU8
         3GX6U1D8WeLn6sGD/7/QeBrYkMROLBBgskpEOik4SNNVW5p9qw8tK06xXjqwKW1/dhJM
         eAuA==
X-Gm-Message-State: ACrzQf3Jh/14A+JiqLWKZwkWvC4FVuI1y+rK0fav0qGcfNZFQgkGMiqK
        Onr0kd5RMPkQCgJ3FNMnLRo2VA==
X-Google-Smtp-Source: AMsMyM4HxXIZHvHy5OIylB0y/B+DICBebdf6fw2Ao2Hz3nrxHGZGQqKsojfeV2LZKZDz7nLarrHAFw==
X-Received: by 2002:a05:600c:1614:b0:3cf:816e:4a69 with SMTP id m20-20020a05600c161400b003cf816e4a69mr22653291wmn.33.1667823420861;
        Mon, 07 Nov 2022 04:17:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1335:cf6:1309:c14? ([2a01:e0a:982:cbb0:1335:cf6:1309:c14])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003c5571c27a1sm10594181wmq.32.2022.11.07.04.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 04:17:00 -0800 (PST)
Message-ID: <3319f872-5138-9b05-35dd-2904c4693f36@linaro.org>
Date:   Mon, 7 Nov 2022 13:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] MAINTAINERS: Update Konrad Dybcio's email address
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org
References: <20221107092207.5832-1-konrad.dybcio@linaro.org>
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20221107092207.5832-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/11/2022 10:22, Konrad Dybcio wrote:
> Use my new Linaro address in place of my SoMainline one.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 03ae061c5f6f..16751383a233 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2641,7 +2641,7 @@ W:	http://www.armlinux.org.uk/
>   ARM/QUALCOMM SUPPORT
>   M:	Andy Gross <agross@kernel.org>
>   M:	Bjorn Andersson <andersson@kernel.org>
> -R:	Konrad Dybcio <konrad.dybcio@somainline.org>
> +R:	Konrad Dybcio <konrad.dybcio@linaro.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
