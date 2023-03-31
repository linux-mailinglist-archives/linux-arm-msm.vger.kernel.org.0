Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 818756D1560
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 03:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjCaB7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 21:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjCaB7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 21:59:48 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7737EBB88
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:59:45 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x17so27060474lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680227984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LrdqQsi+Mv3ed2QJ1tyPoG21t02ZSNOqBkB39/94wo=;
        b=qB9NCJVH3f7foEU/lFWOL4l1MEcM5bQ47YJ9FMnJZBP6lyBF4JCM+r6AEz8PmgEXvq
         5Dod30us/1aeeuXeq+vmdY7uktAjE39LblJfgZq14ObZleDQHeqxKnMGYRkAIDse2nTc
         h1zdzn9iQR3TJvEWlxAnDx4f7WUPVJJ6M/LQa0887qau/KHFQIH7Drq5aMEbbkbGo5Km
         OUI2y8d8hqnWw1GPxWFLsdAIYa1sWUxJka4GRwVl5v/c40yC/5IBeSwmjvdl+m/WR+F9
         UKLYxDPsZ33fIlDTNdgv3++lf9cZHEt2tTd59veHamuVALWBttejjQqqCRFYcjcxSudS
         E4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680227984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LrdqQsi+Mv3ed2QJ1tyPoG21t02ZSNOqBkB39/94wo=;
        b=nBDYBLJoYLvnIgMtZsSp/ycdQAOK/M13O9mazSVivL3Ad8yRM4YZU/GN9pCvopOT1y
         X4yVI60gFMa4USQGaVgINulDJr3LEXyTaUh8cZK9mhyMrPEaz0Y9PTiRZLFvpi3YHlv2
         qR7+atrHbxWM/i/kcBwiRJXdP4H5Sdebd++gHhVyad+emy95xsgBsHOEjswVNj4clo6U
         SzgHQEUCuxlQXrJ/WZdZzjRPAhDtklNHBGOYmQ/yHrqdD7Cr3bXJjhMtE89KYfFB15iE
         Q5BPa64lY1ywPjcMyDd7KLIYV+0Y/oUy5ttq4g098i2+HcMjYCET68Il7V7ew3rDyTPn
         BHcA==
X-Gm-Message-State: AAQBX9d/Mgg0L3iyjPvYw3oYffJeYfrtLagASYgtFEMHBzYDXo0lCK8m
        Y/71Y49LD6iBW8FHqm0IFiAaEg==
X-Google-Smtp-Source: AKy350YTg42fxzLzvv5IArCBgg9jsiA1Qq4UQ9ia9aY1W9yEjkRlMwePF5gbvqFPyTgqdB52/KIJzg==
X-Received: by 2002:ac2:5581:0:b0:4e8:3b51:e7ec with SMTP id v1-20020ac25581000000b004e83b51e7ecmr7246518lfg.48.1680227983726;
        Thu, 30 Mar 2023 18:59:43 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004e88a166eb6sm170513lfq.46.2023.03.30.18.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 18:59:43 -0700 (PDT)
Message-ID: <ee6bc89e-fbe1-fda0-e028-f16f78070dd2@linaro.org>
Date:   Fri, 31 Mar 2023 03:59:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/4] dts: arm64: qcom: sdm845-oneplus: enable SLPI
Content-Language: en-US
To:     Dylan Van Assche <me@dylanvanassche.be>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230330165322.118279-1-me@dylanvanassche.be>
 <20230330165322.118279-4-me@dylanvanassche.be>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330165322.118279-4-me@dylanvanassche.be>
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



On 30.03.2023 18:53, Dylan Van Assche wrote:
> Enable the SLPI DSP on the Oneplus 6 phone with a Qualcomm SDM845 SoC.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index b01542d79ae2..3bd15984990c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -552,6 +552,11 @@ &qup_uart9_tx {
>  	bias-disable;
>  };
>  
> +&slpi_pas {
> +	firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
> +	status = "okay";
> +};
> +
>  &sound {
>  	compatible = "qcom,sdm845-sndcard";
>  	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
