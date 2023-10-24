Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3ED87D5DEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 00:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234965AbjJXWJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 18:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbjJXWJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 18:09:49 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E472310C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 15:09:46 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32dd70c5401so3367227f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698185385; x=1698790185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eW4/b7pttVdrOHJ1oWcsCaKgbQur0E4wQP+v/cgTaDg=;
        b=Y397B1xB5GlLazO5+O0yi0MMCZDDdnIWCgUCKhENODt9bYSu/H1Rv9jr4pm6pYDRnQ
         RlePr58GoJupKikZ5pISiM4KnQ0tFt/H4A1gsGbM/DpS73WcZuqBqob2P7DrXvKORJ6m
         vu8MKRSPqvbOU21zdMhG95NBXPGUiNhPH2v5ik3hJPemSHzu94OiUPXBgb+y/xQCf5xz
         Y61nTOYFb1GffwRuFJqHnSJP7en0wQGs97imKIOu92+Tp1uMvIVxUsOocxGbV3+j5NgA
         utqQ58wSxYGrI9+wW371EaxrdB6hFKZYNoDgrfhE10ETrUhXnQqQGY3/JnjhsPJpgDKK
         upxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698185385; x=1698790185;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW4/b7pttVdrOHJ1oWcsCaKgbQur0E4wQP+v/cgTaDg=;
        b=dTddviXPOs1t4QG6w57PXS7vEfEGdKIHsceHi51g5HtcUa66MHcpRoDkx/eEeTZu13
         01lZFm1uEFrN0Ld8W273bB5OB3cGYqMtTAbPNRDQV/RHzzRUPBauxXIej+MuJ+dlSs0v
         gADUCwbLm9tm1N807/i482GdPxixkwNW5b0X50Fb2SPCiGB4jy3x6ySb92XLooEJC68G
         QEo7KQBjCNPY1zrcleSYbs58G2Ni02Psk09ocRz/kGsz+RMYWppQFex8rT3AdpUBB49w
         WHtglOuCTgR3WHgNL0g3A3VrB3jdLAXRil0uJ7pRT0IK45ls3iMncuMKz/ynuWqSnyfz
         3gLg==
X-Gm-Message-State: AOJu0YyuCAob/zv/8jyxLCjNoLFM28x6AfInXwbBlLemq/jttirSIoK1
        few5MRssd7T/yW+Eo7eU6yFIBQ==
X-Google-Smtp-Source: AGHT+IGaoaxXCtiNpKvBP2hDYd/SGzvJRL76ZfuEMP5bouvglaPXvLiIJvHzvg7G9VhJCPmwMwoYhQ==
X-Received: by 2002:adf:f50d:0:b0:31f:afeb:4e7e with SMTP id q13-20020adff50d000000b0031fafeb4e7emr8729753wro.37.1698185385357;
        Tue, 24 Oct 2023 15:09:45 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d6987000000b003232380ffd7sm10738098wru.102.2023.10.24.15.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 15:09:44 -0700 (PDT)
Message-ID: <07f48f49-4264-46f6-b9ad-f6188bd074b8@linaro.org>
Date:   Tue, 24 Oct 2023 23:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: starqltechn: disable crypto
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20231024154338.407191-1-dsankouski@gmail.com>
 <20231024154338.407191-6-dsankouski@gmail.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231024154338.407191-6-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2023 16:43, Dzmitry Sankouski wrote:
> Disable the crypto block due to it causing an SError in qce_start() on
> the starqltechn, which happens upon every boot when cryptomanager tests are
> enabled.
> 
> Same problem is on Lenovo C630, see
> commit 382e3e0eb6a8 ("arm64: dts: qcom: c630: disable crypto due to serror")
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> Link: https://lore.kernel.org/r/20211105035235.2392-1-steev@kali.org
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> 
> ---
> 
> Changes in v2:
> - none
> 
>   arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index f2bc3c412a2f..0e2c7df2baa7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -504,6 +504,11 @@ touchscreen@48 {
>   	};
>   };
>   
> +&crypto {
> +	/* FIXME: qce_start triggers an SError */
> +	status = "disable";
> +};
> +
>   /* Modem/wifi*/
>   &mss_pil {
>   	status = "okay";

Probably another patch that should have Fixes.

BTW when you do "git send-email" please include a 
"--to=someone@adomain.xyz" your emails appear with a weird red box that 
declares "(no To-header on input)<>" in Thunderbird - I guess because 
you didn't do "git send-email --to="

For preference I do "--to=" for everybody who appears as a 
maintainer/supporter and "--cc=" to the named mailing lists with myself 
last.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
