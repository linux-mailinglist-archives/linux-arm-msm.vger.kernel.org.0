Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBE56F422F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbjEBLBv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233878AbjEBLBs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:01:48 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D3A4EEB
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:01:44 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f00d3f98deso27503891e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683025302; x=1685617302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v50vcld9qamI/KF8qPxIrKjGZ5X082G+i+o6qlLq29M=;
        b=dKIX3STGdFeZqEBtmd444++mC5FBOJW6C/HSJgrW4/HtEJLaDXE21FXu/RNf676cMt
         1+8QTYZ5xOTWPOEtpldN9uHDw77cJbDCVKNZ6xSus21DrKBgT1qdeKWC38X3i5THbqsk
         iG6rOWbOKCvufmReuSn09ZPVyqukUS9caBrYjxYEx8jVVsaf5RnCwpCI36qLLWnPeGYT
         HpceQSQqhkU8Wxbeh8S2Yy9CENVSMPirU5K7C2gul1/a5v9BIt004faHfElWyQRV4g0c
         8I3XiGiuZiI63hxS1wGPv1Tb2GTQ3ksFaG4CTqQl7Ow5k5tySSPajR3+R9EJeWCG6yyH
         QGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683025302; x=1685617302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v50vcld9qamI/KF8qPxIrKjGZ5X082G+i+o6qlLq29M=;
        b=Y/HiTYcoZ3+zOZ115yxYJIFf0ZuQgt7smr33TRUDqAyt20DkWiUqxHXnaFkEhdQ+jy
         SbnuMsNqbA+a5s2SWH7lSNRLZXXPE+Ev/PMyUraWHYjFZnrUzPmyfD8sRT/7dcDsIlUw
         yGi226xCplABPq0jc+WVMNa5bjvdo3sJVToQ7KtzRfyQBntNAKriB4XfKXt/LSHfulrg
         Ns3VO54dR4ba4n9iRsM6qeupa/WkjOEky9IdY6lQzHxkyAJl1cSqKS/X2889PmxAafBR
         FhB4/0oEmA7JDDAh9U4vWBOysyZblPeSIYdmk9L02uOjo7IhCCLVt5sTzm5HGfVOGUoD
         kHFQ==
X-Gm-Message-State: AC+VfDw2VuOoWSWk+YW2wnOTbv5CuNYfLZVBSbv5K5XGnOJZKPBdSuIn
        689tbnCRGkxLR5cE+0kFG+nSJQ==
X-Google-Smtp-Source: ACHHUZ5QEADZJD5b1gLgNxqKk4YVmBjvZtaKsFP2C9ly4bHeBPZd2w/hj8hPhp92TgvZucGAbyzagA==
X-Received: by 2002:a05:6512:32c1:b0:4ef:ef1d:a987 with SMTP id f1-20020a05651232c100b004efef1da987mr5382694lfg.25.1683025302398;
        Tue, 02 May 2023 04:01:42 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id c15-20020a05651221af00b004edd2dc9a09sm5349992lft.258.2023.05.02.04.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:01:42 -0700 (PDT)
Message-ID: <5cc6d473-5702-4735-be0a-9d8df36e43d5@linaro.org>
Date:   Tue, 2 May 2023 13:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v6 08/13] arm64: dts: qcom: sm8250: Define ports for
 qmpphy orientation-switching
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-9-bryan.odonoghue@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230501121111.1058190-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.05.2023 14:11, Bryan O'Donoghue wrote:
> ports for orientation switching input and output. The individual board dts
> files will instantiate port@0 and port@1 depending on the supported
> feature-set.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index a91d1175255e8..af16d3ba76b8e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -3581,6 +3581,19 @@ dp_phy: dp-phy@88ea200 {
>  				#phy-cells = <0>;
>  				#clock-cells = <1>;
>  			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
>  		};
>  
>  		usb_2_qmpphy: phy@88eb000 {
