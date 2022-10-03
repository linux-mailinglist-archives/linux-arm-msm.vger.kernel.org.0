Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27EA05F3377
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiJCQZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiJCQYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:24:49 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB685F5F
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:24:40 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id f11so14873159wrm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=mUVmAv6pixqPkHHg2IsLkObiP52l5D8qllYf47yFXoA=;
        b=A4KHCllf0delUFKb72u7jyTldFlZ8x6sGaWSQFz3ylvo9RkO4jVTnaYwC4hp54Ud/M
         wor/bf3wQOGk6PTT+6NK8PrvN7wTvlBJFs/orRXBD7HMs1KZy1SuqBgOUq08jmiXocnF
         +QSZIVe+hzj39QHskXGUZf6Taz/mnXBONcsHaKJlEArYBZ3Y4LTAdgrWLTg4QKMkfHX5
         hiF5tTWc08p3Fh8owKlGnmpxsukgT5BUFBlcR/xPbQWk/kA/eMcVa86OJ+FLdJUO35Tf
         BBpacbM96+UtOjP5b6aLri/p8tt+IRUAaTL3HHXZVZIuAmKnC6SrNfVKrqkMNNkosKwO
         WuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=mUVmAv6pixqPkHHg2IsLkObiP52l5D8qllYf47yFXoA=;
        b=1ngs1s0sptBEoHi5xDblxY1Q+MTV6Ir/KmDszYcsEDi2Ryq6Y5XwOAN1mjRG8dE7M6
         uBALTxRGR4IjcT8jZ6MoGf6IleznbGWBCqKMnJPzez2MPRS4qmzDCp2qFdbFxZNXjU/t
         ucm6JlIgsNyodahImWTT4Q1aCGsxYhSJl9MaBFdWMTfKdT47q2nChsm0mW9NvcfN5Clm
         pQZGp9RZfU5Nu1RhTGvmf8OOv8srY15dCcUPfZL6PPIABSCWqlVN+YPAOZN2OQcRApA+
         qzuNZJSTlGqEUEgI/sdMVR7POpBSFcGR5X2XTS1EqC3GNW8PCOzzHquAHra7lhfHEm17
         rYJg==
X-Gm-Message-State: ACrzQf2/5914QE/U0ux+u3p27LdyZ9UaT3PE/rUHgQPd6aivr5AeVW54
        0H/5QiW0w8sRpTl3aPmW+ql18Q==
X-Google-Smtp-Source: AMsMyM4C10MoEMagmOLG7nAHTETiJElK05ac1AlIzNLEbkc6co7TE6hV6a8ugEQqQrRgpusc8AZOtw==
X-Received: by 2002:adf:a4ce:0:b0:22e:48a8:dcdc with SMTP id h14-20020adfa4ce000000b0022e48a8dcdcmr901776wrb.486.1664814278190;
        Mon, 03 Oct 2022 09:24:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c4f1100b003b4ff30e566sm25578041wmq.3.2022.10.03.09.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:24:37 -0700 (PDT)
Message-ID: <2c61d376-f88f-e6b3-8db4-02f17dc6dbb1@linaro.org>
Date:   Mon, 3 Oct 2022 18:24:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 15/23] ARM: dts: qcom: apq8064: fix the riva-pil node id
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-16-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Fix the address of the riva-pil node. The first region address is
> 0x3200800, so the node should also be called riva-pil@3200800.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index be4c82945c53..66f1e504a08e 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -1549,7 +1549,7 @@ mdp_dtv_out: endpoint {
>   			};
>   		};
>   
> -		riva: riva-pil@3204000 {
> +		riva: riva-pil@3200800 {
>   			compatible = "qcom,riva-pil";
>   
>   			reg = <0x03200800 0x1000>, <0x03202000 0x2000>, <0x03204000 0x100>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
