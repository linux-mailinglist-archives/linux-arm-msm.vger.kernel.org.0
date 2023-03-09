Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F47E6B1F2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 10:03:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjCIJD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 04:03:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjCIJDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 04:03:03 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CE81633D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 01:00:58 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so3038895wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 01:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678352457;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahQvvXgpAC4sImhVbYw58xhhuuWXnXUtY4vE77nNUsU=;
        b=DAJ0wh1lZGDn+vomPLVfpSlOyFbTrd5Wlpt0nO9fRINX6sd9KSKydH3US/nr2bfQct
         5y31vlBveHuehveBeAJgy2NJkl8KpBq8ZBP2hGfA+ZE8RI7gOlMUAST87NVMxkiaxrpQ
         wFMQg5grA8BvMczuP9wa8kRztYq0XepRae8v+BakFuc1joPLr0wka5AGyWjCEaR9Tq3I
         sh0olYH/OoNZcQ7iMpP+C5evP0Ob6rkUAzxSzV36vqJrMMQ+287TOrJReRi+qNRZdfal
         r73ArPt/fqnWG78h9x3U+dBhvZQBm1u4ldiKQjxkoJGfLqW5ZCW7jd1MNu7BoVMLIjCF
         bnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678352457;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahQvvXgpAC4sImhVbYw58xhhuuWXnXUtY4vE77nNUsU=;
        b=ogyXCXagJDXIr6BSiDDRvlChZpFy33KnWGUlvEYor6EwCXm425sPUjbXOb5fsaPZOG
         NbcZBhVFxaT0M9ZiFJbQpG22KgylqLsxGSBBjx6taHCtXRJ/l+hZ50thz8ZnMGeGvzyC
         hyidPCS6fcAYC7dnDPF7bEiLGTPnjeyhWVgrR5uCaumwdLulchPVHZ1SHPwCvDTIYgm1
         2Fb0ulcZYgsGW08QQfaTyZwRr5nvHRbI9nDvDLwrsGAF8EjdkExb66+XZwcGkGCiTS42
         roaPIstUNAe+nRyXwJSfrWQ0MH8SGEs7bipD+XStB48LzhB7ukDnJmd/JVxR06YTpmNL
         LCxw==
X-Gm-Message-State: AO0yUKVITMhOYS38voK0t73gd4Pd7rRsUd5c314CBgfJAqXZGhKDs1qt
        k0KmmKrAYnlkb6Ds1u9FNFtcsw==
X-Google-Smtp-Source: AK7set++QhcnMV+CVFS+bcpFv3gMgCZjfUlt/K24s/n+K9yXjdLVCJScvyhpqvbKUYy4QHqVvjxCYw==
X-Received: by 2002:a05:600c:5107:b0:3eb:2de9:8af3 with SMTP id o7-20020a05600c510700b003eb2de98af3mr18113595wms.23.1678352456810;
        Thu, 09 Mar 2023 01:00:56 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id bg42-20020a05600c3caa00b003e6efc0f91csm1972470wmb.42.2023.03.09.01.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 01:00:55 -0800 (PST)
Message-ID: <1d0f3570-ac71-70aa-f9e4-b6d12f3a17c5@linaro.org>
Date:   Thu, 9 Mar 2023 09:00:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 05/28] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 USB_RX port
To:     Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
        perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com,
        andersson@kernel.org, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, tiwai@suse.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, quic_jackp@quicinc.com,
        quic_plai@quicinc.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-6-quic_wcheng@quicinc.com>
Content-Language: en-US
In-Reply-To: <20230308235751.495-6-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/03/2023 23:57, Wesley Cheng wrote:
> Q6DSP supports handling of USB playback audio data if USB audio offloading
> is enabled.  Add a new definition for the USB_RX AFE port, which is
> referenced when the AFE port is started.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 9f7c5103bc82..746bc462bb2e 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -131,6 +131,7 @@
>   #define RX_CODEC_DMA_RX_7	126
>   #define QUINARY_MI2S_RX		127
>   #define QUINARY_MI2S_TX		128
> +#define USB_RX				129
>   
>   #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
>   #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
