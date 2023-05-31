Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471B1717C25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235588AbjEaJj1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235605AbjEaJjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:39:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FA61AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:39:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f122ff663eso6296021e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685525939; x=1688117939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcQj1PQKQt+mj2cHXtB/7OX8If2ViynPyLX6/qVrf5o=;
        b=F7vBE0PFGVZi27XPLYYFZKFMSiuvVkGQlnk9QXsA0qhEgqC0hd+hGvbP9NGrOQxDfU
         YjyBZ47pXAemTKk9fwfFr2b3OAK6h1qZC1KQ+FKY0WS8JbgLHaXLWyNbrDVbAPadXrgr
         iXzktzCODGVnfOd57CcZSZoM48UDDCrT4Nqzulv/zXZ/YCVRfa3YUFzmSs4mg1ZPEcV2
         Q84QCtQ9lkKbuKtmNAdFr+D3G0kT4P7rljvq70YKpPQvxIq48JzlnoaMaBw1Kv0g5zaa
         HzuGwPvTzUYp680bQ9zvoVPILhjjeyBqbbtdBX5J8mu+ZDGCVOAuZdNbfDLiAkXCtpHH
         g1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525939; x=1688117939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcQj1PQKQt+mj2cHXtB/7OX8If2ViynPyLX6/qVrf5o=;
        b=a7Z2aMGDixSM9lYgBqqxdnuziDmHhpUQHprdbI8VLdlXd8Ii+tfxYta8NId6/ZMcBl
         px3154V7pmVkJhtq9+nX5xGb0wuTeMe6oF3qZ1CjcJWGZ5S2kgBKfS/21+mlQJSSmVtz
         fK6tsNfYzz1Qsdsm6lbhw2Sv0etJQcRXiTcqRA5iZ2qySIUrTbgwbHTP5N0fgaJvpsWU
         e/hEvZufD2WR6WTDOjR38GBdTwAdcXsaD8zyObDlVdGef0Vt1v3v5tkbX5uy6SqSQwbC
         NmVjYnL4feYa+wp37np0zzJKNZ97IByL4zoLkLRgLzvuIrYnn+Fdz77PK/pcVXniwQyO
         sHfg==
X-Gm-Message-State: AC+VfDx2/V+233b5RsktCSyiw02jMkC/w3OQ9CNxOG6dJUNqCyb31yw2
        p5jUX6YgKxDUsOkHcOqkBwlBOze03IvE3yBZnGw=
X-Google-Smtp-Source: ACHHUZ4QoXcQEIb8jGDNI+bPcLcNYk8ExQPQpkC35xUPUfRv2no1RqsHdK9AACDFJkwngUVVBBGvSw==
X-Received: by 2002:ac2:5935:0:b0:4f3:a99f:1ea1 with SMTP id v21-20020ac25935000000b004f3a99f1ea1mr2301664lfi.45.1685525939004;
        Wed, 31 May 2023 02:38:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id q1-20020ac25101000000b004f001b0eda2sm649317lfb.56.2023.05.31.02.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:38:58 -0700 (PDT)
Message-ID: <84b09e20-d517-c199-058e-5b88a3cb481a@linaro.org>
Date:   Wed, 31 May 2023 11:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 03/14] arm64: dts: qcom: sm8450-hdk: remove useless
 enablement of mdss_mdp
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> The MDP/DPU device is not disabled by default, so there is not point in
> enabling it in the board DTS file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index d5aeb7319776..bc4c125d1832 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -568,10 +568,6 @@ mdss_dp0_out: endpoint {
>  	};
>  };
>  
> -&mdss_mdp {
> -	status = "okay";
> -};
> -
>  &pcie0 {
>  	status = "okay";
>  	max-link-speed = <2>;
