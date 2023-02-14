Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA5F696014
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 11:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232594AbjBNKAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 05:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232600AbjBNJ7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 04:59:40 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C06B2312C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:59:09 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id fj20so16542600edb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 01:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XRnS86X+zXrgWXdq79dBoDyQPlgKpKr03dox5OndJl8=;
        b=g6R/l+qWCtsLJSx7GyZ++uXbU5QcU8+NP0I3tFPOAQRpwUjjfCN0AQREJLods693DN
         S/M93wkIXza3Clte4cA5Nr6V52Wmy0/oucp2qk+IRLqKWcpXf+fDL/s8xe/xk9GqF1dT
         DBlAKWdyaLkbo5bjbrBOclSCLb1r5EF8PxsJlHilRWLTZEonvKhTHuW7nVe4vBos56zv
         4zljWbj4s7VJMPlG2675niqnqGmNnL+f9ep791e3Uqv6OJYPmru8n1RkrasaN8G+pGN5
         wTNMYs3sPzk84gadaUdVIXxU0TXwy2D7BRPh5bXoICqrsXsbBgu0VyRBPduNiCxG/IQ7
         MTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRnS86X+zXrgWXdq79dBoDyQPlgKpKr03dox5OndJl8=;
        b=0lu9fFCK3PNsQYLqWTKZZcqIONY47S9kS+Ilg1D0B+lCwb5a0iK9pRGGdWMf8L977M
         UpldpZMXybK9JrjY7UjQwIRBZ8Kfo16pYrBP3w9sk09lpyFEoPOh2AeS2jNz3UwRg3M3
         7upzwXMq8R+iHiq0ausEwVyntgwV0Z1Ji+aBFlWzWoGFh0dF04MXzcH9HpGgMD7X26ID
         UM3hFh7uedlBlQ07ixvLDmK/877ciYTpF3GXZL1BCMcU6+3ESDGGas6v81HV29/q2POV
         CCgVGc6H3eulJAA8HsW6VxrwvO3Oju8MKc/U9KxQ/1dkfwh9NIOYjkxMSh2EAWrc+CLy
         Ik6A==
X-Gm-Message-State: AO0yUKW839fUZRSoP4zvZXc+STEq0J+udPQjAfInTu0qWQdOzHz3qToy
        FL2YqywoyoKTVEUMPrieWGQrkQ==
X-Google-Smtp-Source: AK7set8Eo8g6Yz5nWwsWokvXAfZMvQdXyfsPLiw6N67oTe+UFkOARgO6A+a/yM/0fyBVZkQKzXg4JQ==
X-Received: by 2002:a50:871a:0:b0:4ac:b4f2:ce44 with SMTP id i26-20020a50871a000000b004acb4f2ce44mr1801284edb.38.1676368748229;
        Tue, 14 Feb 2023 01:59:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a50c448000000b0049668426aa6sm7787452edf.24.2023.02.14.01.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:59:07 -0800 (PST)
Message-ID: <8c7c4b63-28c7-d700-4b1d-96f6eb9462f7@linaro.org>
Date:   Tue, 14 Feb 2023 11:59:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qdu1000-idp: Enable mpss
Content-Language: en-GB
To:     Melody Olvera <quic_molvera@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213190122.178501-1-quic_molvera@quicinc.com>
 <20230213190122.178501-3-quic_molvera@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230213190122.178501-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/02/2023 21:01, Melody Olvera wrote:
> Add MPSS firmware paths for the QDU1000 IDP platform.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 9e9fd4b8023e..2b89814c67d6 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -448,6 +448,12 @@ &qupv3_id_0 {
>   	status = "okay";
>   };
>   
> +&remoteproc_mpss {
> +	firmware-name = "modem.mdt",
> +			"modem_dtb.mdt";

Please follow the other platforms for the firmware names: 
"qcom/<SoC>/<name>.mbn if the device in not fused for the particular set 
of keys and "qcom/<SoC>/<vendor>/<device>/<name>.mbn" if the device is 
fused.

> +	status = "okay";
> +};
> +
>   &uart7 {
>   	status = "okay";
>   };

-- 
With best wishes
Dmitry

