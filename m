Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1707076B4F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 14:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbjHAMl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 08:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbjHAMl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 08:41:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101C62106
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 05:41:55 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3110ab7110aso5748289f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690893713; x=1691498513;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qwSU5RXQg7VsspNAMIrrPontjcHjYD2O86ltcwdGdmA=;
        b=s9hmaxrUP2ngbn2IUdUbqZhA2+mvvxk4HLjAhIdyYJEztjdMDxdOACPDD++q21vmX3
         lFfVXoR6GsSxXSLjHJCPRGrrYfxIR9dEKBDlcgGeqv6xT4d+SJC3v/rBYAuS3iv/fgzC
         IdmN8mLA7MXVQO9zLm1WHghyQT+E/0mPuEAUWvbzFDoK+1jja3u7BNelUPa9sJbemx29
         ZAmB+br5CnuKRmaxUVjzqVdLx1DzB8Vwz2RNs1qcbiay2q0jOVPJaZLrmP0zMdNvZXN/
         y+l+ndYf9JyXZIigH6TNKLGv7Eui43ptwYA92O1QOUCT8k7v8eJfGPE+F328LhQCqWKk
         AJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690893713; x=1691498513;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwSU5RXQg7VsspNAMIrrPontjcHjYD2O86ltcwdGdmA=;
        b=lRvW+uLNXFEGtMH/BbLV9umMrtv6vb07M/IzppN2OM+DWfMjAi5SSUvp8q05DtaWn1
         j7wYbeXpPfzrG2pu/wgEivLRNU7wn7YM6vl1fnykUPgkNM/3yTO9Yf1zOQMrVAw4lru2
         jqQEWYEYPrjHiHt/x/kkeNSNOoY6ZQ5eRlExelfY/VtccN4L6fO6JFgwVU98gRYACC4o
         Rm0+AMpLYtWFdkCropGa96aIXR2lSrg3Ri3B0GlXEOb0tZbJXbH/BiSkinOF6uh/LrvD
         i4jxMu9qC/v1Nj6p2eR8DEnPXnAcKwVA6TTT5KxLchcRTCy1j6gWA9PLi2P6z6aof7Vx
         dHnQ==
X-Gm-Message-State: ABy/qLZSYgf1ssIGrI4pbQxVc4PLW3Sw3iT8HxzvyQOSQrXkNfyd+A/M
        TNU6vXa81+UargkZaIS5PoHWSQ==
X-Google-Smtp-Source: APBJJlFJ7CpyVlemF6FeCX+aVgAhKIaADhcWfW5e1JDrbU0/IflmKJpzpkuSrFVNy+Rm106zsJIM5Q==
X-Received: by 2002:adf:f102:0:b0:314:a3f:9c08 with SMTP id r2-20020adff102000000b003140a3f9c08mr2248867wro.39.1690893713452;
        Tue, 01 Aug 2023 05:41:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3? ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
        by smtp.gmail.com with ESMTPSA id m12-20020adff38c000000b00313f031876esm16089597wro.43.2023.08.01.05.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 05:41:52 -0700 (PDT)
Message-ID: <4f240fb4-b40b-2146-7dcb-e6c26d60ddd7@linaro.org>
Date:   Tue, 1 Aug 2023 14:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550-mtp: Add missing supply for L1B
 regulator
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230801095246.2884770-1-abel.vesa@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230801095246.2884770-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/08/2023 11:52, Abel Vesa wrote:
> Even though currently there is no consumer for L1B, add the supply
> for it anyway.
> 
> Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 00c7e1704a8c..0127c6c285b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -187,6 +187,7 @@ regulators-0 {
>   
>   		vdd-bob1-supply = <&vph_pwr>;
>   		vdd-bob2-supply = <&vph_pwr>;
> +		vdd-l1-l4-l10-supply = <&vreg_s6g_1p8>;
>   		vdd-l2-l13-l14-supply = <&vreg_bob1>;
>   		vdd-l3-supply = <&vreg_s4g_1p3>;
>   		vdd-l5-l16-supply = <&vreg_bob1>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
