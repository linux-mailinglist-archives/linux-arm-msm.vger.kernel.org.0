Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8776A5811A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbiGZLK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238823AbiGZLKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:10:23 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8644C6591
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:21 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u20so8326862ljk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q71wm7CDrrw+8MFcgul/CYR1wp8vBGJy6kTlVWPpVSQ=;
        b=A/BrziB0qDRI/sH7Ez4qPRxYRsvl80TyeJZxD1hLtQp9qExVWJnVd7bspEds4H47An
         eP1pjO3+/swFGxSZr6q/QQgrO6IvIDBeU54zJqJhZpDEuslsDWekJX+/eTGOu+rP11e7
         aFrc67o3WC/6e8XEUb+u2ZCsFxQ0ql4Pa43UryT7ok1rN4CRkylGgpKO9+20KM6X8PDN
         3DrlwCfokgvMYQS8t3Pd7yp5TgQne2JTxmN4s9gobjz4J0DtJOUE0VFPk8CR0k7cKGCo
         uJzVsEQzl9/erPHgg1Gcc35rwmGMsXzhgeU4OUTTmXsAzW2ETGYqlGZ0cNZbbO22QfoC
         IBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q71wm7CDrrw+8MFcgul/CYR1wp8vBGJy6kTlVWPpVSQ=;
        b=ffp11aXJ4BAWzyc0S5rcbVq/hOIuFrxBga5xQfcnLFSY/i8Ut0O+Lqt3XI4uuOLNTv
         tPgiAnzbtYGJkIuft5/2u6/iXORbjSPnf/+QoZoQR6OYcPxt7r1j5vOmyGdWWFsfZcuJ
         iOxKmsyR5OoAHVVZO/Abk9H9sHHkZ90tCTFtQmYfBqiO/h7sSXLuroHqBtQEQ6XtUkQg
         kFA/qU/N2UwptbWyvwjcYpJin6c9lCRbb4Kx4zFPIc/t24nHBneaCOqn5IhslDGfQix4
         bfl1l8u3SbjueVzhgYxF/hcqGxyyrZC6IaVSORzNvbRzL40NAeDgsbdDh9ZaixV1gewj
         ZYhQ==
X-Gm-Message-State: AJIora8jQBxydNrcvRUbHTNsnaKzXDTKOndyjsWwi89jit4Rn+Gvry2F
        /de7RkfZNVLcpjttYkUxQfbLY4wEUce+iCvJ
X-Google-Smtp-Source: AGRyM1uAFyILh2j2O7SQT30CvhwGiHlZYpE1N1CvOdZAjyDpr1FV7K2dx+5lEZFP4dnFGzLjoEfeeg==
X-Received: by 2002:a05:651c:1581:b0:255:48d1:fdae with SMTP id h1-20020a05651c158100b0025548d1fdaemr5792293ljq.286.1658833819882;
        Tue, 26 Jul 2022 04:10:19 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id v13-20020a2ea44d000000b0025d4b372d5esm3204315ljn.126.2022.07.26.04.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:10:19 -0700 (PDT)
Message-ID: <ed93772c-74fa-5b2a-512f-b10e6dde86ba@linaro.org>
Date:   Tue, 26 Jul 2022 13:10:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/7] arm64: dts: qcom: msm8996-xiaomi-scorpio, natrium:
 Use MSM8996 Pro
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> From: Yassine Oudjana <yassine.oudjana@gmail.com>
> 
> The Xiaomi Mi Note 2 has the MSM8996 Pro SoC. Rename the dts
> to match, include msm8996pro.dtsi, and add the qcom,msm8996pro
> compatible. To do that, the msm8996.dtsi include in msm8996-xiaomi-common
> has to be moved to msm8996-xiaomi-gemini, the only device that needs it
> included after this change.
> 
> Since MSM8996Pro is largely compatible with MSM8996, keep old compatible
> too rather than insiting on qcom,msm8996pro only. This allows the code
> that doesn't yet know about msm8996pro to continue supporting these
> devices.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> [DB: Applied the same change to Xiaomi Mi 5s Plus (natrium).]
> [DB: Dropped msm-id changes.]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                             | 4 ++--
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi           | 3 ---
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts            | 1 +
>  ...m8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} | 3 ++-
>  ...m8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} | 3 ++-
>  5 files changed, 7 insertions(+), 7 deletions(-)
>  rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-natrium.dts => msm8996pro-xiaomi-natrium.dts} (99%)
>  rename arch/arm64/boot/dts/qcom/{msm8996-xiaomi-scorpio.dts => msm8996pro-xiaomi-scorpio.dts} (99%)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1d86a33de528..78534c33a61e 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
