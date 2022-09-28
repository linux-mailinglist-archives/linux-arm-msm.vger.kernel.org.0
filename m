Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 456075ED6B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbiI1Htg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiI1HsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:48:06 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0B9B4DB59
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:44:37 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id c11so18371091wrp.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=a40ycwUQAORZ/EP8EjFJ8+hxzAMohdI5ey9LKUDQA5I=;
        b=ej2DEi/pbBp1Qa+DcofXiiafQv/Ns28Q0o40aVH0pPtfF6xemW8LQKU4lirCFWXwIv
         ZX6/A/kwSmkrhQwysbMgmiUhMmAWhjHESR6gT9G1Hd79fQnqiPf9ACbA1Yw9qlAvccNl
         W2F6dOvDm8UalXovVZDbn9giOxVXOmto90IrSdNVNTJlsM/lc3GfA7KLrPsBy21TC9LI
         0ZgoSz0jvAW+1+F3altGsknWgNeMHIwZ5CBW+UP5XyzU+ltkzsVpE069rqhchXRGnsqm
         7MtGui/NQTgQqOEkmfCmilEzcD3VA5KSaASyB2C9bS99BlTM4RFiuSFcx2KKNjKuVmHu
         DcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=a40ycwUQAORZ/EP8EjFJ8+hxzAMohdI5ey9LKUDQA5I=;
        b=32aiZekSJEsulSdhIM0TrlPIW5eITdAtO/Kgs3K9SWiKAuFYoH14d2pTCNAMGo5l98
         Ln6Hivcc+dcZDCacn0/2wEpxNxBaRI7aei9wr5JuGw0itCCwNIsBFvk8J+kQmB582Vsm
         xbib+7i6t3BmVSPP0YNlV1nkXGF9nyIiunqq8/SAL23yQP4W3yvcxN4JoN/B8bF6bxDE
         rZpnXh5/EmKAF6vTW0rTNLLbLespJMpYx68GXNYkLKFDePpuje56v6NfDmkqB9DWsr1c
         uwK0IrjKEhU7Lg6fL81DP7uJWpbZa1nRouQc/GnNjwiti05QdV742TT2TjEi5ebF/Cyy
         gpjA==
X-Gm-Message-State: ACrzQf1P0qBZCCJwNUUMkBRTAyyHJNdCr49O00HY6pDi3/KfxGi4UI69
        pV5yPn76vNs9GhgJaduTSicQbA==
X-Google-Smtp-Source: AMsMyM4rJC9W+nT3Jo3LHMeaoxrEK4S93UZ7SGe6NmOiNWniaLm+a7HcbKEfmHsH3oeUjVgaoGmZDw==
X-Received: by 2002:adf:c713:0:b0:22a:3670:b08d with SMTP id k19-20020adfc713000000b0022a3670b08dmr19809577wrg.175.1664351069888;
        Wed, 28 Sep 2022 00:44:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c020700b003b492753826sm915175wmi.43.2022.09.28.00.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:44:29 -0700 (PDT)
Message-ID: <e157ff8a-403e-b1ce-7a7d-be141cc895f8@linaro.org>
Date:   Wed, 28 Sep 2022 09:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: cp01-c1: use "okay" instead of "ok"
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201415.1265191-1-robimarko@gmail.com>
 <20220927201415.1265191-2-robimarko@gmail.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
In-Reply-To: <20220927201415.1265191-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:14, Robert Marko wrote:
> Use "okay" instead of "ok" in USB nodes as "ok" is deprecated.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index eaaaaa72234f..c424b8390c78 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -106,9 +106,9 @@ &sdhci {
>   };
>   
>   &qusb_phy_1 {
> -	status = "ok";
> +	status = "okay";
>   };
>   
>   &usb2 {
> -	status = "ok";
> +	status = "okay";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
