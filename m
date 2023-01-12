Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E320F666CBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 09:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236069AbjALIo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 03:44:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236635AbjALInG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 03:43:06 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D727D3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 00:40:52 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id qk9so43011198ejc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 00:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ENm6iorv0nXln4vaicjGTY0QYGWRA2CrScr4ZR1sLeg=;
        b=jlYz7H9d/myNayeY/5i8py3FP4b/UDBR2+p0jjp/WL++hDL7mg6P66lMIFWQubqWfS
         Czw0Eu8ctiYay+UlZer/NHZCWAVGqVk34cHrDLBUKIr5JtrrNoVkKAsx+9vv5zccvaAL
         qjwiLGxsEejqsUWhoPOTgkSuZ4LE7IInFjUvMmn+N8OHufQRTJF0NXzgohY710PohYjw
         hQo+o42k485mFOBUdWWmSPlG/uX1nNVzUel/ssaGig63wr5r1TwK3gACzhEOFbszKaJz
         VU2QbjF5y9eGk8INzZ1Bg1D/1hQbwiW6pH01T+5a34yItohVXqM6LDTxMFxRN9qT1aXs
         g5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ENm6iorv0nXln4vaicjGTY0QYGWRA2CrScr4ZR1sLeg=;
        b=okh8Yi6Nz2LymvHDVGhd+O7QROgkOGQQQn7lWiCUWDQzTviQxAhxGQgdksYQMviqFB
         nr1fhgrB/49XxNGwu5IMwblZoGdOcmejUgg4eJUzYlQCNDBqnXtBqiItcAuE/zi0AucJ
         WW2a38GhVt/UlBxmQKCmHN+fsKH9XoIaxjcLIGk0KN9Hz4wqTGIr6jkHHB7RZsQUku78
         s3VeeMldUFyypC1p9jdsetqeiJEjVHlv0R4JzSo4ZE4OPoxWztNVexykPWNnVP366gfo
         llbM4nM+LY1+i4RwBrZQMZJDnUcwihJz008i2Wn2kfjV+RpHwfJMDQSaTLhoYzaOck/G
         imrg==
X-Gm-Message-State: AFqh2kopVTw0PStEWxbsttZz2znLGWRUmVA+BOkMCebhb2pAD794wRFF
        SW+RK/I0zkyKJEmXwqg1LLsaTg==
X-Google-Smtp-Source: AMrXdXthfuv8FieEIEtEsqiKdgK/AJAySU3zHEVGZAskG/gWbt1tR5IhJNQ8wLEbgagglAyuZJwYrw==
X-Received: by 2002:a17:906:a891:b0:7c1:4d35:a143 with SMTP id ha17-20020a170906a89100b007c14d35a143mr61317242ejb.3.1673512851031;
        Thu, 12 Jan 2023 00:40:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709066b0e00b0074134543f82sm7322955ejr.90.2023.01.12.00.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 00:40:50 -0800 (PST)
Message-ID: <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
Date:   Thu, 12 Jan 2023 09:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/01/2023 20:57, Dmitry Baryshkov wrote:
> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
> between two CPU clusters. The CBF clock should follow the CPU
> frequencies to provide enough bandwidth between clusters. Thus a single
> driver implements both a clock and an interconnect to set the clock
> rate.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> new file mode 100644
> index 000000000000..2080e1743b2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license, please.

Best regards,
Krzysztof

