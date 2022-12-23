Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 796C9654E32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 10:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236099AbiLWJOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 04:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiLWJOF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 04:14:05 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865393137A
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:14:04 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f34so6331943lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce317vF268IfvnfP9+p1VVXhxTBGucn4dlvIXgjdsZU=;
        b=lbcLMP6Q0HWuQk3H+EUrd087gzWF425/OhsFFMYt4hGdRdOUV6SaUQNRZLuSlCTujO
         4GhCLyhanmjjP2Avp9EBcI7tdkVUqbMns1YcHUeZZEVO3t/91c+NG5QX2mYaXiPXSqt1
         In8EMzGzBFt0nWOOEL18D5yOD07DhJbYXiDNwDDJI91NsAq1escZVkv258nOteTgh2EV
         WBngyAjP6aDsDZ2mGOcKEJcbKVcwv/BRrncxVuk1dke6OFxey+G+LocDd65zE9x+HdxI
         BLWI/m/D1joMjV8cCnpDB4tcKcMr+vJ4GBS/OabCU148XwTIv7YP110nGkDBoLgUzzy4
         1B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ce317vF268IfvnfP9+p1VVXhxTBGucn4dlvIXgjdsZU=;
        b=cAWNAzfYTIVZUb/V2x2Kmq8MLaBq+QydOgPolC9RpebSy9vtTmZWNeSe9tJIkikjjO
         Lb7ISIWnm6JJd28qBGRVosNc2q6msznpUPuNgzNyusIk9DYCg+kfvUCzYYv1ycWqGUVK
         2A4DK9FNxsX5QCzen3FF4MxhB5ZX/EzgLJNbqwBIyc4J41/JoQUmMeGv8TNpkBGeyCwt
         M3Jzbbo/6vOj7tCAaAs7RBNK6V6IRXeONVo1XjKjd0Keo71xBJEMQ+yEcUvxvmzWCw0m
         ow/c5lfoDGKouxSqOGt/2tebox+q1FOX+192mKsyrKSdcIO9TG4CL2yXhKsJlt+Bn+Aq
         KrRQ==
X-Gm-Message-State: AFqh2kpWcmQK1iI80QKEiqE8CNFocSqQyuvJ9JTrbrUiJ+aQQu8YY2CR
        0lmqeZHcGu3MF0tsfAAD3+ZyNQ==
X-Google-Smtp-Source: AMrXdXuvuxfOoh7btFzaHq0D7UEX6Vdsw/DhoOg+jC0H2+ELHxHS4cMpuHtdiGRPa7224JaeRiKhkw==
X-Received: by 2002:a05:6512:70a:b0:4c0:4214:cd2c with SMTP id b10-20020a056512070a00b004c04214cd2cmr2211602lfs.43.1671786842930;
        Fri, 23 Dec 2022 01:14:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512315000b0049876c1bb24sm440414lfi.225.2022.12.23.01.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 01:14:02 -0800 (PST)
Message-ID: <9b435fb2-9ba9-e985-e132-e10f793ca659@linaro.org>
Date:   Fri, 23 Dec 2022 10:14:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc7280: audioreach: Add CGCR reset
 property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        konrad.dybcio@linaro.org
References: <1671702170-24781-1-git-send-email-quic_srivasam@quicinc.com>
 <1671702170-24781-6-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1671702170-24781-6-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 10:42, Srinivasa Rao Mandadapu wrote:
> Add CGCR register reset property for both RX and TX soundwire
> slave devices.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
> This patch depends on:
>     -- https://lore.kernel.org/linux-clk/1671618061-6329-1-git-send-email-quic_srivasam@quicinc.com/
> 
>  .../arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index a750f05..ce5d69e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -217,3 +217,12 @@
>  		};
>  	};
>  };
> +
> +&swr0 {
> +	resets = <&lpasscc LPASS_AUDIO_SWR_RX_CGCR>;
> +};
> +
> +&swr1 {

Why here not in SoC DTSI?

> +	resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
> +};
> +

Are you adding stray new lines?

Best regards,
Krzysztof

