Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B24ED712DD7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjEZTrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEZTrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:47:16 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0235BB6
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:47:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so1275620e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130433; x=1687722433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UNyzR4Qz0WqOkQ65dYOGX7ztnahA5kSQZyxNTaKIt1E=;
        b=r2EFCvAvc/ir5Oi63Zcw/v+qkpOZVDcibvIDHNR6IO0s1AJJv4bN2Ds9bX/VOKGV62
         STolybMrNUejPitjH3bqqVfmrPJRVWsGBoH0V93LypVUaoaj1ANAoKwQDMbNeHjpZUx8
         5y32CCJFKKYYmX8OFlMj2HGvFmRD7tBszQwfAmgQppaCXpAzyn7MQKH2cuXtjit6lB12
         dL65Tr5a/cFcB6peewN/EhhkA34O9o9CaxYEofWkiF8ELJpM4/uGb1c3W5pEj3cdVXep
         WwUEyxYuEMGXUiRlLJTW/u3lrbsyT3vwYPd+ZzZ/AjDo7g0cMqtewH68fyHLHuSdxFzC
         aSGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130433; x=1687722433;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNyzR4Qz0WqOkQ65dYOGX7ztnahA5kSQZyxNTaKIt1E=;
        b=VcSxfP448RFxQax7lft0+wdW2Bzm/JaXcUgelwwt0OsDZJgUfi4tShupv8K/31lVt2
         L6TXSYD9OhpX/d/fwNEgIfy6f1MjM/tdVr28WX6BptKCxPZ7Kj+kyhex4KkwD9ghtX7z
         SYL6qlWN92bKrn5m36fUGW9OayU3cg/f1xNfDYcvv09kAflsE6Gy8AqFrhCM68PEDj9w
         QYB8FVTb1s6oFX8g+IwUYSgUwnfAzvtHkdr/Pi4iW8J0GSKrZQZ4xH5j65+XadjFcK1x
         6Gdk7pvCoSpzDZPm+6Z6DpW0BTqVssAWG0HV2vDV0aErIzcDB3z2PEH6vzuXDqkW7kub
         YRjg==
X-Gm-Message-State: AC+VfDzeD4WYpJaQDDPOS8Z3GIcG5UAP6qpyinn/0ReMdj+CVCf48Ni/
        QBQM04fOEmgnTVqYr6m3KVZapA==
X-Google-Smtp-Source: ACHHUZ4WYX/X/k0ljCvzME/590yAjqPIpTtD6sXJfbb+uZejYvV92ahh6XZqf42v8J6ELUcgEWuucQ==
X-Received: by 2002:ac2:4894:0:b0:4f4:c973:c97d with SMTP id x20-20020ac24894000000b004f4c973c97dmr928458lfc.25.1685130433269;
        Fri, 26 May 2023 12:47:13 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id j5-20020a19f505000000b004f3afa1767dsm743899lfb.197.2023.05.26.12.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:47:12 -0700 (PDT)
Message-ID: <93bd4663-89df-b3e9-0c83-333d671e02c4@linaro.org>
Date:   Fri, 26 May 2023 21:47:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sdm845-shift-axolotl: enable
 pmi8998 charger
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-5-f9334afc4505@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-5-f9334afc4505@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.05.2023 19:38, Caleb Connolly wrote:
> Enable the PMI8998/smb2 charger, and denote the secondary SMB1355
> charger which is used for parallel charging.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 0ad891348e0c..bb0f55c52a95 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -494,6 +494,10 @@ touchscreen@38 {
>  	};
>  };
>  
> +&i2c10 {
> +	/* SMB1355@0x0C */
> +};
> +
>  &ipa {
>  	qcom,gsi-loader = "self";
>  	memory-region = <&ipa_fw_mem>;
> @@ -522,6 +526,11 @@ pinconf {
>  	};
>  };
>  
> +&pmi8998_charger {
> +	status = "okay";
> +	monitored-battery = <&battery>;
Status last, please

Konrad
> +};
> +
>  &pm8998_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
> 
