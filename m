Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0728D737E94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 11:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjFUInr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 04:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjFUInq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 04:43:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C52B10E6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 01:43:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-988a5383fd4so588370966b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687337023; x=1689929023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2Kz4mhZ5NhzflxslpPdDmilN35XglyTAYV8hsPZpaE=;
        b=jXpnIwUeuFoxX9JBb12JmmY6ewTjwwjEAokuT+H4fKpH0TDopxcDyanK9UaDI7w+j3
         6E5nSTpE3f9XWpBgK4/8WgHhdRSe7h482tsqJHfBctM5j62NkGAVWzfbLka9oq70pZab
         0Q3Nf8QROYTPA5xRN8D4ZrYBbeF196feVkIP7s1cUZUHgkUkoLDN116GjZrCbk6j97jv
         Ns9Yuu3bpCmUZRgr43tgr1pujBZXnG9xkNmb/g59G3ZgUc4slZ9OovBXRDaLjSWEMwLx
         R8Y0c+T6EsKc0a0PImDTwMTCtp0trpX5f3PP9Qs0m/COO38CO7+EtJFrnyHhJP8XX5rI
         5QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687337023; x=1689929023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2Kz4mhZ5NhzflxslpPdDmilN35XglyTAYV8hsPZpaE=;
        b=KSJvxK98IEG3Wwl7wdH9WJpTUJLSWKsymQkq8Shzt+OHvV7PMqfCEmve74ZCI2EwgK
         Lp1NPzLV8aqeKSjcwOh/+ySMDi9ATkY93T8ZNNELCnY1VoWob090GVOskD1WI+LuhOgp
         Wp7xbOSLE3/br4ojorBZRlnIr1p1900zdyIC849hnpCcDCYNzSGG1Zxmy042zC32ALjr
         gtdKITW4Wkz6e6cAraUgnLaQgZS/SCOc/cpwaBfF+/0jTTGqTTiCGFPP0HrBuTx2QvQD
         LBglIYKY3JhQTLxtX/fmMq4fWfRsJuy1xj7LtTkF/pkzxY0s6+5/IsjVMjiKq4z1/RcX
         4QbA==
X-Gm-Message-State: AC+VfDyWoiEawuw8lbLwowpe6jTx0ZE0peVqatFL+YDUXeendaGF1SVG
        7zYOg/6NFPHKf+ZKyVH9XjH+fA==
X-Google-Smtp-Source: ACHHUZ7vclfELi9G7yDOkfIcP1pfbpU9l07YtQf/u79BJENXrzqrZRFFBWYdHwVKmMJA/qNz7Xb2wg==
X-Received: by 2002:a17:907:d26:b0:977:d468:827 with SMTP id gn38-20020a1709070d2600b00977d4680827mr15211393ejc.17.1687337022910;
        Wed, 21 Jun 2023 01:43:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n19-20020a1709061d1300b00982a352f078sm2715466ejh.124.2023.06.21.01.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 01:43:42 -0700 (PDT)
Message-ID: <dd78b449-8ff8-108d-cc49-fbddbb660c76@linaro.org>
Date:   Wed, 21 Jun 2023 10:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,m31: Document qcom,m31 USB phy
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        p.zabel@pengutronix.de, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, rafal@milecki.pl, quic_srichara@quicinc.com,
        quic_varada@quicinc.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
References: <cover.1686126439.git.quic_varada@quicinc.com>
 <14f60578e2935c0844537eab162af3afa52ffe39.1686126439.git.quic_varada@quicinc.com>
 <98960024-7dbc-91a3-75de-90b529637916@linaro.org>
 <20230615052746.GB22186@varda-linux.qualcomm.com>
 <aca54f67-cc09-ff4f-93ca-6973d153db2c@linaro.org>
 <20230620093225.GA9966@varda-linux.qualcomm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230620093225.GA9966@varda-linux.qualcomm.com>
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

On 20/06/2023 11:32, Varadarajan Narayanan wrote:

> 
>> And then we have... existing bindings qcom,usb-hs-phy.yaml. Don't create
>> something similar with difference in the hyphen. Just use device
>> specific compatible thus device specific filename.
> 
> qcom,usb-hs-phy.yaml seems to be for ULPI mode phy and the
> driver we are introducing is for UTMI. We would have to
> modify phy-qcom-usb-hs.c to accomodate M31. Will that be
> acceptable to phy-qcom-usb-hs.c owners/maintainers?

We don't talk about drivers here but bindings. Why would you need to
modify the driver when introducing new binding for different device?



Best regards,
Krzysztof

