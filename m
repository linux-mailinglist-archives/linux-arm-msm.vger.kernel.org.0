Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC0EF739BD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 11:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjFVJEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 05:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjFVJDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 05:03:49 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2554046B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:57:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f87592ecaeso5814795e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687424237; x=1690016237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8JJC5MbeRl35Lgr29rOxqKueNcHatWfOiyxtFqQ4VU=;
        b=YNd7aH2hMxKS2KCUtXwaAUgKiMN4JBd9cDEIZIwu742lvpetQ6CeP96xaB8S3Bk8in
         Ux4yDHQbhOlv3wxDjiYBP3ggNiR1pwV+WxWsrsqMoMVC0WNNcculLOlsVh0WxskbwWDG
         m3p8xjCRXVhPCiV67mtW1nnaGObKFwOWePkGW4wDI7oY1EsRkFWHB0lkAeGDn877PArU
         8tEDfYKoeI6btiK+V/R8b3V8g6NfEH7MDJKHETKywIapXqXSsjMy364E59qTj1K5Eq2X
         RIYt9MOUVp5nab6DquEQtfDaSYs15/kbrLj4FfkZoLaE99hqED8lJfyoA2Oq4vafnzvZ
         SBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424237; x=1690016237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h8JJC5MbeRl35Lgr29rOxqKueNcHatWfOiyxtFqQ4VU=;
        b=CGuAZKTmku0S+K9Hv7CgmJSXiVyAFEpmHDeoZdm+0EJRWlpIMbejMG4uQFEehTNWdK
         Niewkju55V6isrulIObdESDY7+tldw0CydIXzhjsxSlyJQipHJvfZSqDpM+Uf7V58x7h
         cu/v94nTEIb2y7QF5Wx37/4JsP5qVHSXR7XY0m3CGgDduxblQW265dEODoXrgiboamzN
         5JXwdpIw+w1npBAF4YLf9MtKXKDWSQ2Vtp9S0C0cx8m/cR8qt94Dtj+eiD4mmgmHQSPh
         eaKz89THwCaYISKxx7CUr/R7fIGk+7MnmPJlNShs2FcOzO83zzC9vbEBKxER8bBq96NW
         cuzw==
X-Gm-Message-State: AC+VfDwrHJyTzAG40L9K0ekd/ehUvMRSj6QCvXDakq6o6B0kQPUqm1h8
        gD/jMzxFXmA+UgA855ShgNB/Rj4Lb0lYrLNEy5c=
X-Google-Smtp-Source: ACHHUZ5DtqCuLkszK5asTi0X5yVeZC+RRCrK/xxXcA0FCKadOHbmfMInI+WR3WuoBg1nFonFGVf8NQ==
X-Received: by 2002:a05:6512:447:b0:4f8:5fce:3683 with SMTP id y7-20020a056512044700b004f85fce3683mr8532131lfk.20.1687424237104;
        Thu, 22 Jun 2023 01:57:17 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id d8-20020ac244c8000000b004f85a24d2basm1041560lfm.105.2023.06.22.01.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:57:16 -0700 (PDT)
Message-ID: <6b1cbaf4-53c1-1b99-e781-c11261a1f4df@linaro.org>
Date:   Thu, 22 Jun 2023 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-sony-xperia-kanuti-tulip: Add
 missing 'chassis-type'
Content-Language: en-US
To:     Raymond Hackley <raymondhackley@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230622021105.66015-1-raymondhackley@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230622021105.66015-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22.06.2023 04:11, Raymond Hackley wrote:
> Sony Xperia M4 Aqua is a handset. Add the chassis-type = "handset"; to it.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> index 8613cf93dac5..0633e3006f17 100644
> --- a/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8939-sony-xperia-kanuti-tulip.dts
> @@ -16,6 +16,7 @@
>  / {
>  	model = "Sony Xperia M4 Aqua";
>  	compatible = "sony,kanuti-tulip", "qcom,msm8939";
> +	chassis-type = "handset";
>  
>  	qcom,board-id = <QCOM_BOARD_ID_MTP 0>;
>  	qcom,msm-id = <QCOM_ID_MSM8939 0>, <QCOM_ID_MSM8939 0x30000>;
