Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58DE9654E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 10:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbiLWJN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 04:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiLWJNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 04:13:25 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5CBDF47
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:13:25 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b13so6370649lfo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 01:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHN7DDcS7nZ1cFrOceolRofMEbbkNs2dqEr6ujP/YdU=;
        b=W07pqGy4CreoMdurzJl/VbTvWUqiTZS2TL+sok2QHSpiFjHvR8DeY9PZSjirwrvOqi
         4lsBU7tfqjuGwviFbN7C7vTjJ5BNt5I1ILluyS83w0Ju+xp6wLEWuAm12JPXhdX184f/
         NibP0BYQsGfefLFkT05ZwXzPNd8BlADCsR56u4l2ADfwENOk+z0F5izlf9r+yW37N243
         23WVSOKUCw6WY2+fDHt1fJfwlSOrxHee+f0v/cZAS7nNOA3viGZWu6RBdYnSwn2RwyNj
         PsduTzTx8ol+rlEHVHR9QBjmgP3DxshH9n5Szm8k8xvOfp77FuSlLaBZrPUxfRlUNYMg
         xogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHN7DDcS7nZ1cFrOceolRofMEbbkNs2dqEr6ujP/YdU=;
        b=z2ZF9/+j95DPC0dZoUZgGiIFbECBUi9wgu1FERRy+hRALlq5wD6ByFM8LPKHQ6o+uf
         XQawMdOAjfKHN1XVZ9QKFw8vgN9BpF7sfQgVCKvNrCLUczPfPJyHehjLaHDDMXwnddG8
         r0tejM0S4iCfFNQAfzcMdqjVtsac55NlMOnm0FrqRNW7L6yNRFU+GVTGLIkR9WrGNRue
         q5PZ0WWC2VJV5qmwK6oh4NS8S+kHaX3aYNWtzK/230hic5DIS9a0gSB75BoJ13kBVeEs
         UPrg9yMeo2+MlAdaHk/YH07TTZtm1T48eD7HTG8vD2DQIjEeNGbA20SqIKMXNlp3m7O1
         3kmw==
X-Gm-Message-State: AFqh2koOnzzvwmkW1XMxfbeZaNDnftlTvO/Ab2DgHtCTr8BNnZS6M/2m
        cre23ZigEPjvqFFEOJ55/ZDFIg==
X-Google-Smtp-Source: AMrXdXt569rGwmxRny6+JZiocZXjZ2lfSlwIU6OXtuVNu8eReVWLbk2yZ7BUQx1eK7OgLjH4QcOsww==
X-Received: by 2002:a05:6512:1111:b0:4b5:43ef:a552 with SMTP id l17-20020a056512111100b004b543efa552mr2723310lfg.16.1671786803264;
        Fri, 23 Dec 2022 01:13:23 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bq27-20020a056512151b00b004b591c33b99sm449075lfb.13.2022.12.23.01.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 01:13:22 -0800 (PST)
Message-ID: <09fd48bd-7f92-b0e0-cb2a-ab2fb6ece868@linaro.org>
Date:   Fri, 23 Dec 2022 10:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/7] arm64: dts: qcom: sc7280: audioreach: Update lpasscc
 reg property
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        konrad.dybcio@linaro.org
References: <1671702170-24781-1-git-send-email-quic_srivasam@quicinc.com>
 <1671702170-24781-5-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1671702170-24781-5-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/2022 10:42, Srinivasa Rao Mandadapu wrote:
> Update lpasscc register mapping for avoiding memory regions conflict with
> ADSP pil node.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 0ce8755..a750f05 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -111,6 +111,14 @@
>  	};
>  };
>  
> +&lpasscc {
> +	reg = <0 0x03c04000 0 0x4>,
> +		<0 0x032a9000 0 0x1000>;

Misaligned.

> +	reg-names = "top_cc", "reset-cgcr";

I have doubts this was tested... git grep shows 0 answers.

> +	#reset-cells = <1>;

Why all these are not part of SoC DTSI?

> +	status = "okay";

Why?

> +};
> +
>  &soc {
>  	qcom,lpass@3000000 {
>  		compatible = "qcom,sc7280-adsp-pil";

Best regards,
Krzysztof

