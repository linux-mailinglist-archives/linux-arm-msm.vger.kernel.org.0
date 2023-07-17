Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC14755CD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 09:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbjGQH0P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 03:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjGQH0O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 03:26:14 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90759E4F
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:26:10 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51ff0e3d8c1so5477404a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 00:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578769; x=1692170769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8NyLL7xIHFr8TM9wgkdAiK0RyCfmwsOPlj/7DHoIVLg=;
        b=JdfgC8rC468QIy07zzQ9PkbABPnq0krXDaXPZSbVqGDg6mLQ7/WyTwIDDRIPT8tk/K
         6Mp0KNG+0cB2rRc46Jzog/xUf/VTInxyQOZeo4t5M6oOFKJO/zU+22rrFSXvaRCZe4gQ
         Ul6em6JGJHgVtnzzYVxTSzdP6/cBl9n/KXk3uAWAbzi+wKiVH9jSS33sCzK4JhMhkN/t
         xQM0iKojs2H//BgG5SNoonrZPm7KzVYJxgLiSUsI2gVo34rWjhjYD57mSLsLUDw3ravZ
         A94PbnT9TdmKWZ6jTK4OnDxFxTwTz+ySHr9IBhaNZiIrxJt/dWAPrxvSjR7IXgYNojTr
         VA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578769; x=1692170769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NyLL7xIHFr8TM9wgkdAiK0RyCfmwsOPlj/7DHoIVLg=;
        b=P7IbcB+EAVwelqOhzCOrul4gx1VxG8HfqgVLUuMiiNDiYPITEw4i85iHomHEyvky+b
         VHf/Tc2WRy9B7zFlvkjR4rvWiYAIDUn6OqwyKzh3n7jib60q34cl6kWnniRvaOuHvlT1
         789BTVgQyCTAl4/Ce8LfiZEPHt2y44lH7lOzw/ap95I4SRQTD3FTY3FFPhpuULI+v4ux
         T56cMPmG2/5uFr8VqSLZTgcDQKE1U/0qPZzvOIGzKy4Jr1NnL3ElkfVnRLGYmNyqQtWL
         SOZkMAPt6miqfHHRKb9HPOJZe5JIr+IN/VTIXrlbR9E7agOHgkYDbGOM7vfgG2gjSLmT
         2gVg==
X-Gm-Message-State: ABy/qLY1+eVbZM0OYUmKHPlYHuoyFvdP4pVaN3mHTjGnI+wBnS71T2pU
        Lf375Li7PYIfPv6UsC/Q6jxDFg==
X-Google-Smtp-Source: APBJJlE22ZFdkIUR/k32sD9ntkgnOqDp+SIuqLRIXRHbsi5WrLBE9vSWsH4Qp/COnyAo7f04OEA9Rg==
X-Received: by 2002:a17:906:7a59:b0:973:cc48:f19c with SMTP id i25-20020a1709067a5900b00973cc48f19cmr8750922ejo.56.1689578768619;
        Mon, 17 Jul 2023 00:26:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090655cf00b00987e2f84768sm8808852ejp.0.2023.07.17.00.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:26:08 -0700 (PDT)
Message-ID: <5c6f7a88-2660-12b4-2c9b-f0eb4f108f5b@linaro.org>
Date:   Mon, 17 Jul 2023 09:26:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: sa8775p-ride: enable pcie nodes
Content-Language: en-US
To:     Mrinmay Sarkar <quic_msarkar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, konrad.dybcio@linaro.org, mani@kernel.org
Cc:     quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
        quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
        dmitry.baryshkov@linaro.org,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <1689311319-22054-1-git-send-email-quic_msarkar@quicinc.com>
 <1689311319-22054-7-git-send-email-quic_msarkar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1689311319-22054-7-git-send-email-quic_msarkar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2023 07:08, Mrinmay Sarkar wrote:
> Enable pcie0, pcie1 nodes and their respective phy's.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 80 +++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> index b2aa160..d3b2ab0 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
> @@ -552,6 +552,86 @@
>  			bias-pull-down;
>  		};
>  	};
> +
> +	pcie0_default_state: pcie0-default {
> +		perst {

Really?

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

