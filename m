Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC10F5F41B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Oct 2022 13:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiJDLMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 07:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJDLMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 07:12:47 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EB9DBF60
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Oct 2022 04:12:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so7145124lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Oct 2022 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=x/UVnKQq2iVd0ICEWMggEXxpcjYOxGCnpPIsJwOOc2U=;
        b=EKIA4qVP9ReXIT4sScu3l6+d6br93KTJbxb6OIjPDeJac8ceMqQE30rhIAbttWztCI
         je2hsXNdmxTOh0FtUSH7/f4o98GrRoEd63kN5nlxWKe0Dm13QoBcElihAm9ohFdk27sg
         LKvu/xGkZ9sHIt2xxaGSvySgO+zgqUHOlEsqahnkqpX7GuFMIU/ql41iOoMATE0gixuq
         7V4CtJFaedMIwKTP1ALWarpORXqU1eiq40zjqxmPeF38jUXVEst4Rnnn0DFvSp0Ct4Eg
         kRsPl4cL86Dr2RkgOa/Or428KHbhzGUkH4vCn3eMow/4C9LlR7DV15YKWowdN9lM5Rbt
         gU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=x/UVnKQq2iVd0ICEWMggEXxpcjYOxGCnpPIsJwOOc2U=;
        b=6UNesluou+ISO/0pmszx3MTg4dgXrIcEGKJ2Ma85080Wykj+JvZYMrFjWMaZufxLhB
         pmn0dV9JXSfOPXC6o/jCROVo757lDVCCFgU2USt4Go3YPeD9n5wuIK5Yc2Qh4POnY8I2
         +T6BtIHbh961xFRYlmz6mE3SQ2/1ezkkrB0pmPsYA6XNGBbXX20Q3uB1oSc0XCdX+IPG
         eEaFQOQXewAGFUQlZRGr5Gd8C6SGMo1gxTkHvg5nW41VUo1//M+16dOEMu4CJJaxLzCv
         BnmpxVNSIABjHGZBO7RgsM60XfSmVtQSrk4cpbjNH8GMWVUJepkYEdBJet0BuZPJ7nO4
         AoRA==
X-Gm-Message-State: ACrzQf3MMMYJTuEh3uaJjaUNEFhPXQ5LOz978keVQ4zaGK4RO8Zs3A36
        SpaSqlSIK2D93Op4JvfxRo17vg==
X-Google-Smtp-Source: AMsMyM5ChPxndJIa8z05JUTtcIDcc7VWPDS6Y3oyAt3y/tH5hyrhBqmcM2aZ/gaaY7l1L0HQHIyBPg==
X-Received: by 2002:a05:6512:32b8:b0:4a2:3a87:39b8 with SMTP id q24-20020a05651232b800b004a23a8739b8mr3674163lfe.6.1664881964698;
        Tue, 04 Oct 2022 04:12:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t6-20020a2e7806000000b0026de2aa9c9csm516577ljc.111.2022.10.04.04.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 04:12:44 -0700 (PDT)
Message-ID: <df96217f-5f28-f335-423b-d68066399544@linaro.org>
Date:   Tue, 4 Oct 2022 13:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: sagit: add initial device tree
 for sagit
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221003194315.943903-1-dsankouski@gmail.com>
 <20221003194315.943903-2-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003194315.943903-2-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/10/2022 21:43, Dzmitry Sankouski wrote:
> New device support - Xiaomi Mi6 phone
> 
> What works:
> - storage
> - usb
> - power regulators
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes for v5:
> - use pm8005_regulators label

It's the third patch sent right after another. No. You need to wait one
day. More over, all previous changelog is gone, so I really have no clue
what is happening here.

Send v6 with proper changelogs and all comments applied or keep
discussing. You keep ignoring comments, then resending something three
times. It's not the way to work with reviewers and make their life easier.

> +
> +	wcd_int_n: wcd-int-n {
> +		pins = "gpio54";
> +		function = "gpio";
> +		bias-pull-down;
> +		drive-strength = <2>;
> +		input-enable;
> +	};
> +
> +	wsa_leftspk_pwr_n: wsa-leftspk-pwr-n {
> +		pins = "gpio65";
> +		function = "gpio";

Still wrong.

Best regards,
Krzysztof

