Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D2F771A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 08:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjHGGf2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 02:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjHGGf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 02:35:27 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752E8170B
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Aug 2023 23:35:25 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so5684476a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Aug 2023 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691390124; x=1691994924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln71qb1Upy27G8ZY4+b/kRfYYp2es9bMhQqMxgaZOrQ=;
        b=Ezwn6IdcE09uCXoc5w324qjVikVOOl4+nIahqRmSpsjOHDep5NmH+J9OQ0B8iznsBd
         OyOAAySocuNz6j2BJCnwZe1xKFKOuEr9bMAn0khE5k6VsChyuM5DbYOwjoX5tKWnh7oZ
         ShOL2q4SZXE7EVLNHSDPHINq8Xyg2wzF83TAEr3cFUMC802PdGKvotcOG68QWpl09Ho3
         R/W6kDBlCTuVGSiwoP1dvYP6oyCCYlcIzuCYslf2Vmy+Ff5Z+S1hmyVHdqQtFaesdAd+
         1vsUlv+H9FeThxpBLXcAlYYnp2QevjeOjH7+j79QgXUfDifkjvUsXY5OooZl8rdSffwy
         mx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691390124; x=1691994924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln71qb1Upy27G8ZY4+b/kRfYYp2es9bMhQqMxgaZOrQ=;
        b=V+ifAouW1+N+iF2S7mCa2cOaM4KZdxXnwN9wLevqSWW7JIM6yyyv97gBMUaXH/hU1h
         g+iugUsGSJ378+0ZRVGLR2fAzTWqMK7obbKvx6VzAbV1PMxFmQPgqH8MzNFj+9cUXoZm
         BaW1I8vKtMQRkRKCFTV8FC4Vy++H3TYzc50QeymNw3AAJhElVf35pBt7Kd6lI6fFH5bf
         V3/Ol2nw1RvG1lXJZiNreDc2Mdg5lFRrewsi07EwslXAONfcMDrUpCBBi8w9oPFvnVLj
         4hrtX3642ekNafD+lyHUUpI+DAIfJJ65A4eYphRQOFpx7tr6jHijC02YU79czoaDEf/Q
         uGQA==
X-Gm-Message-State: AOJu0Yyubx50pmVIQs322SraC8DXwYG4W/86ATt3HzjXn1HEZPpjsqEf
        tWHlonRUY4n60aRF0+nWPOQy1Q==
X-Google-Smtp-Source: AGHT+IEEz65KpLi4QI0UNj/bsk/5/iVIqJEtST2rHfNNxMWgMWGL3FL2Vjt6+1xPvI1JLRfhEjPj2Q==
X-Received: by 2002:aa7:df0a:0:b0:522:1d80:7549 with SMTP id c10-20020aa7df0a000000b005221d807549mr5785501edy.26.1691390123973;
        Sun, 06 Aug 2023 23:35:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id c18-20020aa7c752000000b0052228721f84sm4763706eds.77.2023.08.06.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 23:35:23 -0700 (PDT)
Message-ID: <c4e1a5ed-cfdd-6d5d-7749-846ca27a8b94@linaro.org>
Date:   Mon, 7 Aug 2023 08:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sc7180: Add sku_id for
 lazor/limozeen
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230804095836.39551-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230804175734.v2.2.Ia4e268a027980f00c8fb0451a29938d76b765487@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230804175734.v2.2.Ia4e268a027980f00c8fb0451a29938d76b765487@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/08/2023 11:58, Sheng-Liang Pan wrote:
> SKU ID 10: Lazor LTE+Wifi, no-esim (Strapped 0 X 0)
> SKU ID 15: Limozeen LTE+Wifi, TS, no esim (Strapped 1 X 0)
> SKU ID 18: Limozeen LTE+Wifi, no TS, no esim (Strapped X 0 0)
> 
> Even though the "no esim" boards are strapped differently than
> ones that have an esim, the esim isn't represented in the
> device tree so the same device tree can be used for LTE w/ esim
> and LTE w/out esim.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts   | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
> index 913b5fc3ba76..cef57c15b70b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
> @@ -14,7 +14,7 @@
>  
>  / {
>  	model = "Google Lazor Limozeen without Touchscreen (rev9+)";
> -	compatible = "google,lazor-sku6", "qcom,sc7180";
> +	compatible = "google,lazor-sku6", "google,lazor-sku18", "qcom,sc7180";

NAK, you really did not test it. At all.

Best regards,
Krzysztof

