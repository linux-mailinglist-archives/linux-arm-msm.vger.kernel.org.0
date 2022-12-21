Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1AE4653737
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Dec 2022 20:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiLUTuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Dec 2022 14:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiLUTuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Dec 2022 14:50:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F8C22280
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 11:50:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g13so8370963lfv.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Dec 2022 11:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RMne3R7o0AY1CWxoY6gy/HesnlUHqI5x+TuV3ldiHog=;
        b=otPQp9Z0wimtf//Fvm0pCWYhCQg7fyBH9I8pwpY/sfgIMqIwhsOcmvRRtFYgNpcvvI
         OvsiuIFhL+dpNjNeuz5ByLDmw9bTtDEh33n1z33U9Tm1G6utOwMfFIzEbgp6CAhlgxgx
         Ey7Kkewg4zJ6TKVRdgUcW6n7Y5zxcepIm8vArPbFG2sbwnlBvmFf7iB7DFw27jql9k8r
         NhtNu7V8U3cYxxOEIHsEeHvkip5xxk4cUJVZPb9Spu63G+ezY/UHBPHMg8wiwgRK5gOf
         Vxczxl304Ho2dEODWBKsICCz3vkij1M3r0CJihwzlk72KzQO53zqPhuOTA9TtTxpDBHZ
         Weeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RMne3R7o0AY1CWxoY6gy/HesnlUHqI5x+TuV3ldiHog=;
        b=s+2EBly2criybt3VYZUjMEAFQ+lt7UNNju08uLC6UBuSrk9+r+66udIzvSDO6B+LV9
         nKioqsHSb/VzCNdK/LxyVdVez98vJ+wtbTuUcwStuS7mOj4UIJL9VPCo9ftkpujFaYb3
         5At0ctzaStz2bhdKRUrMHcFt6dk0j3BFqdR0zLSq6cY3bZ0Dq6m3qxv222ysyDuYwIc9
         QxYXpSYwyo67Y+LpcvmTIN9EbR5Q8JO8uP8Fw2NIf9mM/rna4ATQyRlmmkw4bXlzNDOo
         WOHKN2QdI23o0PeepxOAwc8dw/YOeedADIu4CnNISe/s46/dng2abrWyl62E6N2xoIEY
         t0Ag==
X-Gm-Message-State: AFqh2kp/uubh+LuHBiys4DqcjdrAJ6TeJvM3toQj8/H76vetBDltILvg
        Y5eHmyg/Z9LHLMbceWlAWTaS1LLgn/eCCN7eL4w=
X-Google-Smtp-Source: AMrXdXt12yd7w3bdTUQqcT+w9RgRSCKIZBDEJ3NZ9+bUwJoKwtuQUwGNHMDr3QLMfVLw4F54UAA4vg==
X-Received: by 2002:a05:6512:2a85:b0:4a9:39f4:579a with SMTP id dt5-20020a0565122a8500b004a939f4579amr940271lfb.66.1671652203405;
        Wed, 21 Dec 2022 11:50:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o18-20020a05651238b200b004ac6a444b26sm1937026lft.141.2022.12.21.11.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:50:02 -0800 (PST)
Message-ID: <87aeef4d-02a7-5abe-b16c-2074bb2b8934@linaro.org>
Date:   Wed, 21 Dec 2022 21:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/5] MSM8996 eMMC boot fix
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/12/2022 22:03, Konrad Dybcio wrote:
> In a very unfortunate turn of events, enabling interconnect on non-UFS
> devices (or more precisely devices-with-UFS-clocks-disabled-from-
> bootloader) crashes the device, as a memory read to an unlocked peripheral
> is attempted. This series tries to fix that with the least amount of
> casualties..
> 
> Konrad Dybcio (5):
>    dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>    interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>    interconnect: qcom: msm8996: Fix regmap max_register values
>    interconnect: qcom: rpm: Use _optional func for provider clocks
>    arm64: dts: qcom: msm8996: Add additional A2NoC clocks
> 
>   .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>   drivers/interconnect/qcom/icc-rpm.c           |  2 +-
>   drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
>   4 files changed, 42 insertions(+), 9 deletions(-)
> 

For the whole series:

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #db820c

The series indeed seems to fix the rare boot hang we observed on the 
dragonboard.

-- 
With best wishes
Dmitry

