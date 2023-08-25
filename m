Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16EA9788511
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 12:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244444AbjHYKjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 06:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244501AbjHYKiy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 06:38:54 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FB11995
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:38:51 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso1153537a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692959930; x=1693564730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3C+86T5StrlLjJhPZobulBJ5EM1n9ZhQMafts6OhmY=;
        b=Iny/APsjg2ZXEcZFuPYahGnFXzs8Q673KdHP1n472FNMvhnQWGofqWgUnF49fL9H4j
         psTf3gW2UqW4XbRj1XFRwBcpF7O7kr6M7yV3tMs6l+Zei6sxDEX2Nf01ijNoabDSpYJg
         9F0FEjPZDm8DyIuovK0QdtM44Qnd0V7HDlXmxmllZO09wj9zZMigiCJj8Ikl6TdGk//i
         /M9zfowc1aCclRT7FVoDSdueNEuS1IkmX9zyeRh3J44wvpHWkcrJzU4L174L6lgtwq1q
         Yl3I8Wp/EwvZSGqIJFrnDCyrdALRjWVgDH1B6dU3frUdRWzAGe772l4wz4/8CcT//qbC
         Gnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692959930; x=1693564730;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3C+86T5StrlLjJhPZobulBJ5EM1n9ZhQMafts6OhmY=;
        b=fG4ebGmNJn8XiLb7ZKMu6bzckV8mC4Gp+p/4Ki8xH4iOfnYqRcutTURdhVxac4WdCv
         hGRK/VOi+P3IBt8yWY8Cwn9y1U/ng9zIj3MqkPCHUOF8kDjkiuKuQRaYhwKgxIfk7MGS
         0vw2zqpxycmKypFY4qQimlK1U1ywcrz1VWYVYp6mT85lVPfN3wFWFXdV7JTiydsxaY5N
         E9//tAKsvj3PPWDQ+Ho7Mu3hg/+lWmHQmKGXmJkqLW1oQ9259QF2aMKxdmpoLulOGN/l
         Qjbh82RMNAu07urbn1VhfakUlwtyZscatxnRFc1hhPBXnHnwHR5vVAdf6kpNYcKYBcH5
         a3Nw==
X-Gm-Message-State: AOJu0YwhAT9AMUUnF6dGwyO2/v2w7ppdd1+OFff31qagcUBsiUv8x6SN
        MMw9jtSDgFUTYBaA6SRGCEVvvw==
X-Google-Smtp-Source: AGHT+IFN8932Eby5S9OZDlGNpVF0+Zju5KfZZSZwwcQkQWqVLGGgaDFmghzjTCLMy5XUEKel54LPSg==
X-Received: by 2002:a17:906:9be3:b0:992:3897:1985 with SMTP id de35-20020a1709069be300b0099238971985mr14396652ejc.43.1692959930048;
        Fri, 25 Aug 2023 03:38:50 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id r22-20020a170906365600b009a1b857e3a5sm818029ejb.54.2023.08.25.03.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:38:49 -0700 (PDT)
Message-ID: <5373a7b5-df23-47df-b732-60a31c1ea6d0@linaro.org>
Date:   Fri, 25 Aug 2023 12:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Enable USB
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Amandeep Singh <quic_amansing@quicinc.com>
References: <20230825093531.7399-1-quic_nsekar@quicinc.com>
 <20230825093531.7399-6-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825093531.7399-6-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 11:35, Nitheesh Sekar wrote:
> Enable USB2 in host mode.
> 
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> index e636a1cb9b77..cdf5e22ec54e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
> @@ -70,3 +70,15 @@
>  &xo_board_clk {
>  	clock-frequency = <24000000>;
>  };
> +
> +&usbphy0 {

u is before x

Best regards,
Krzysztof

