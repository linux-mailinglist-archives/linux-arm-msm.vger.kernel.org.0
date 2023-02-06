Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F24468C6E3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 20:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjBFTgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 14:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBFTgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 14:36:19 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1A62196E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 11:36:18 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i5so4271959wrc.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 11:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30k6aVZ3lQKYjywAhccCPTJ4QlS09nql1ha1KpCSPYw=;
        b=EZKhQlH5xDkFw6fmkr87KlD6I7BbCxotrN6jXkMcE8O1Utp2KYnnW0bJzWVybhkDPP
         JWDaCbPxDbpD8ZJdRIr4e7DkYW5auRFAgrhzXKK5fijt2IR4sr8ohruJQ9kiU1NZj31R
         lhEeu7XdY0Rmy5WiuMRs8CccluklMjNmt1CCNIJJkn53g+nhUxXkmeoF4i61wigSYkqc
         YzaVJUHfP5LrsgiNwAODJCV4a+ioPFrv81ut1yatbf6a/68QoOgW2RDCJMG+tub5sm1H
         risKh4iHFWgOGSYwdsAHYe1Jeos0lSbckScB250K2KtFMu7QOGyKtBh9Bp0ct1iRY2NV
         4jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30k6aVZ3lQKYjywAhccCPTJ4QlS09nql1ha1KpCSPYw=;
        b=7u3XO4fAbueE7y8EXWNFxKmlx5HdZ1DUrYBzyLwXIyBGTQNch1IoglMmDPRW7/cgZJ
         3TrHQRadZEkI/hSa3Fo64paTgXuiG9+xqqxa3Tpg6zyKxSs53B/YPbm2eSLAoBHYA8+3
         RrUNTlfAzMnpIDtJMlHKiCG1oSN+VvQo8Smuj6Cw79mytLsbpzDJYLVRvmuvfzRKXpA8
         ctNT+gQMB6ryXfPrn0yZvZ6Iriwbbhtcb0j9YSoyswYFM9mfjQv/gOvd/wagYTLysMFj
         jQwR8iVs+YU13/D27Cm1Dc/IVg4nRLzLTucbVM4cun9wuRaJoVmZkmYfKG0nWO4pSQF3
         VyXA==
X-Gm-Message-State: AO0yUKUb78RKN4qzqgzmMw28mMf5SWB3SN883QAwqd5hCjiadsjZWmh5
        AuDRqO3YCG4BGIXF/NXE7fXiom9zZYcPm8Ro
X-Google-Smtp-Source: AK7set8qKZ60WpOLGW/+Mx9lLQ+xssiCnYs/DSVaoCLJD5TFXE2AQl4xs01TMJHZsHxHfITAaeNsRQ==
X-Received: by 2002:a5d:60c7:0:b0:2b5:47ab:6fa0 with SMTP id x7-20020a5d60c7000000b002b547ab6fa0mr25347wrt.38.1675712177204;
        Mon, 06 Feb 2023 11:36:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id u17-20020adfdb91000000b002bdd96d88b4sm9667603wri.75.2023.02.06.11.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:36:16 -0800 (PST)
Message-ID: <8c819cc7-5071-376d-5c1e-c06555eed539@linaro.org>
Date:   Mon, 6 Feb 2023 20:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: correct power
 domains
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206193313.30667-1-krzysztof.kozlowski@linaro.org>
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

On 06/02/2023 20:33, Krzysztof Kozlowski wrote:
> Correct CDSP and MPSS power domains to match what is used in DTS and the
> Linux driver:
> 
>   sm8550-mtp.dtb: remoteproc@32300000: power-domain-names: ['cx', 'mxc', 'nsp'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

And probably:

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")

Best regards,
Krzysztof

