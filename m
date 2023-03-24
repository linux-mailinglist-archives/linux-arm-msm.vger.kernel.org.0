Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F146C7C08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 10:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjCXJyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 05:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjCXJys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 05:54:48 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCC111654
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:54:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eg48so5429559edb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679651686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iw1UaQoTuwfT83c4P5+2WHVEENaw7MTifvMn4w2/Tm8=;
        b=dQfTkDP6t74KJXA/s5wL6xcM49oknITHoIo0ZBTbWc/JMReuL5x3TddChp33mRNqXx
         p9uyvK9I8RUEODDgY6SbVO2Md9e9DfYEu3W0MCqf+cWhdvU6aNdul5D3Wu526tdp9wId
         mFWPZfQOC+Vgya0HRg+P4LAl3FTuLCN+CZ375oaej3b7pifbUhrE5tjVzMyfQy9a1mS5
         FbooiutBt2FilmfELNvOwkZgbxrGh6+j4RHPC7LLO0nLhQ0kljk69GJTRnWdz/KBtGnz
         S7tlbfUKls046jw9V+ay4hD9GU+mgyNMDcSH4jNMHAdVXnFUIBlSc5lRQPpZpsVx9Kkw
         ZvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679651686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw1UaQoTuwfT83c4P5+2WHVEENaw7MTifvMn4w2/Tm8=;
        b=z6h/DoFWijm7g5YaTFhrj9HBpd3cyWiOHH7buqaDXirJVEiWGpUAPq47jtME/T34bJ
         1CNw6dfhOngir+lZvdXH1BoVcxWIVe4CfzoMUB0kfBeLcwiTZc3nF/rIpzrPH4FyLKwb
         z4n77kaPhLpaI9R1hCWts9Q5wxabCdnRel6JFx/aXxsT3Z5MvHV2Vxb+TzQV8eghMcNI
         aHitSP1M38AN/u452fR2NFwWSC+fB+5qNEmtSgf7a5aF8CV/pR8J5y7gkXDpY8SSfLgs
         wNHFCKpP/QRf9yphxe32S2KdhHL2jp7/BxPE5mEFxcbRzPqw7FhWwWZDFoQnorMaefO5
         uUvA==
X-Gm-Message-State: AAQBX9fEFwKBAErBxaoiRan+cFgTR9AzV+HLvPMhdkGK10NMgwUnJJgK
        S6DU4KKGqM1J7+bzK4CSBR8OKQ==
X-Google-Smtp-Source: AKy350aWnFfvupIZYHm9AQKziyyxPbpWmcy+Lc6NHr2yBvKdu+YCp7lUrZnaQ4krC1yJ4TkIwUKfyg==
X-Received: by 2002:a17:907:3da1:b0:932:e6d5:bd7c with SMTP id he33-20020a1709073da100b00932e6d5bd7cmr2777042ejc.20.1679651685829;
        Fri, 24 Mar 2023 02:54:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373? ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709063c1900b008e8e975e185sm9944734ejg.32.2023.03.24.02.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:54:45 -0700 (PDT)
Message-ID: <84db08b2-b8f3-db65-0e07-25d19038273d@linaro.org>
Date:   Fri, 24 Mar 2023 10:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845: update QCE compatible
 according to a new scheme
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230323233735.2131020-1-vladimir.zapolskiy@linaro.org>
 <20230323233735.2131020-4-vladimir.zapolskiy@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323233735.2131020-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/03/2023 00:37, Vladimir Zapolskiy wrote:
> Change the old deprecated compatible name of QCE IP on SDM845 to new
> ones based on SoC name.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2f32179c7d1b..bca0521dc08c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -2643,7 +2643,7 @@ cryptobam: dma-controller@1dc4000 {
>  		};
>  
>  		crypto: crypto@1dfa000 {
> -			compatible = "qcom,crypto-v5.4";
> +			compatible = "qcom,sdm845-qce", "qcom,ipq4019-qce", "qcom,qce";

Same comments as previous patch. I guess it applies to other patches as
well.

Best regards,
Krzysztof

