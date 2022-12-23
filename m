Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC5366549BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 01:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiLWAT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 19:19:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiLWAT4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 19:19:56 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4972EBF0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 16:19:55 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m29so4981404lfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 16:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKqGvadHYxircTvtSptZNWbv6JSsnlop14P7nPXcPpc=;
        b=jbyCauIkK78J5w5f9HnllxFg1In/+m70bKa/KNJuUBXsT2RkhuhheqB4xK2ePY/Zna
         s18okiRjwo9Povd130kN/I0mN/Ns7AlkQxKVpSw4Tmk3ZgKunpsqTtD2W6o0lJmdE7+Q
         tJLPnbdG3bygXtY5yc+wWv0kXyJwRKXwV5RAXG0ID6IyYdirbvKfPRDlbqprdUW0wRmj
         7zsdP6NNyWaho+AAzPlVkubic8E0UQmYnDDArZp9eQ28OtZE4VpkVdNYDOOO3fGtviGZ
         TI4UJKk8hToGhFDXGPsiVQYkyyZ01LlpkK5SqE2f8NeCzBWV1B2iLnJurWMB4Kaud/uj
         hrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKqGvadHYxircTvtSptZNWbv6JSsnlop14P7nPXcPpc=;
        b=DUamjJh4KGIF6vCq8AzC6JYbOswpbKB3xpr4Nygi4QIs2W26KDlGe3yLxkDqAMhTLj
         ISV2EB7uLaiK4Ax7ngDxqLOOc3M4n5vgbMHruS6bbcAi/zlEV5jBHzMEQn9g5321Lk4I
         vSM0cDE7DdJzE+58HIM6PjPY2I2/kiIW629LbAO/chLqYwYAuYQB+K/TEJGOU+Ow04/6
         rXJlXoTS6AUXP9Puil5asLSTQx8Jci8nhZd2xjT0QAO3KIlYjxbDFzaAOYvpptEKPeqG
         xniTFNULaJDMVMNmFLYTih7kPxw9H5owqK0Abu6/7rZRiiATGoOX4mPvB24J7os8fqz8
         ggSA==
X-Gm-Message-State: AFqh2koWHRg3/K+o8GWAoUDZxEHuXcxUV1NLedahPdeNOqH1r4KnZUPZ
        YYn3zEFI6wqx1lE4Phs/bmn69gJjfBf67vMimR4=
X-Google-Smtp-Source: AMrXdXvHAWdJVJQKJhH9N8jHbEzirr0i+moOjEfPNScQNTad/bKzjrvadQosPoLs3hpEUo+9ghFd1A==
X-Received: by 2002:a05:6512:3e0d:b0:4a9:a1f1:3f57 with SMTP id i13-20020a0565123e0d00b004a9a1f13f57mr3074322lfv.50.1671754793561;
        Thu, 22 Dec 2022 16:19:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o8-20020ac24348000000b004b49025f96dsm264129lfl.187.2022.12.22.16.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 16:19:52 -0800 (PST)
Message-ID: <96c5212d-ddf8-48ba-27ca-234f6c9128b9@linaro.org>
Date:   Fri, 23 Dec 2022 02:19:52 +0200
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

Just to note. I had occasional boot issues with UFS on msm8996 even 
after these patches being applied. It seems I was able to fix them by 
enabling interconnect support in the UFS-qcom driver.

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

-- 
With best wishes
Dmitry

