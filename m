Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3D2768A6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 05:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjGaDvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 23:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGaDvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 23:51:52 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710C1E50
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 20:51:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe0eb0ca75so6363786e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690775509; x=1691380309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddUy3BUYmqLjU7l6ekKc9suZLaStpY0ol+tCNSEW3z4=;
        b=nRx536MdnTMZBddyBrZfQfZybPTj36s7dpBuoITV2AqiimJJ6/yLNoff6uITUtOlix
         5ep8CPWaxZ1gMvE8hmC0hqa3X7TNHVSIli2Uxdpn+EEvzybTBH0SI7iRHZq9JESIyrXy
         TJ1q5JA/ZX6vARBLAIndtCTCX/TCMTzVgHMhhKsfgaKSCiD7b5h9jjrgBeBtpgpaRXGQ
         NWSSvk0OfFy4zmqhZpZunAtLdCMLwlmdazlycSEaJkc1kHo05wniw8L0ayxj64Ju1Eh8
         q3Zp47UaMx1LpjaW/4rE6P2FOzwrXw7WyQkCCOLKlo5Z3khwcwvFfuvDRNiYjG1NRyZR
         CNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690775509; x=1691380309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddUy3BUYmqLjU7l6ekKc9suZLaStpY0ol+tCNSEW3z4=;
        b=BbeiXBGYqEDbP9oJU66jIxnH2EZPPWjQMjp4PJUxMTOJvvSUu8jqjeFpsC8SeHNCmw
         YarLk9QECdPXubCM+Kg7VuWF/e6/xuBWCSneRarK2hzUO4fzgE7HpVaI/DJxyNPsD9qo
         mPBtudmD96sC7G00tta1+M8u4h0T2bKNnnKOBKxEEz5EXcM+dAqCjzqwQzf7C+qwfrkt
         dFlTtHMcJ1D3MRwDfPqiEUdf9OKn/q3HUlT0K9jX5C/VeIaApwiMAWnhmS0GIQo8A/h1
         rnfuCq0ZNP/DSKJW+uIZ2z3NHEe+lxjp1So2/L49a2KChmDSeCv1of5JSyV17RAZlkuH
         PCog==
X-Gm-Message-State: ABy/qLZvWPB8XJvaPC7Y0JtCb8/uD6xdqeqMyoXYOxWxlBzHloDQWX9e
        t9YbKqXHl7XL2bF47CwoeQP0kg==
X-Google-Smtp-Source: APBJJlGW0FgZvkmVdnLqO2ISjEWdAxAGCuIY34ei7SO1aUTkpabJ/WTzELhPmhAG0RVo9crhEAFOEg==
X-Received: by 2002:a05:6512:44c:b0:4fd:f80d:f6a3 with SMTP id y12-20020a056512044c00b004fdf80df6a3mr4788001lfk.43.1690775508711;
        Sun, 30 Jul 2023 20:51:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l10-20020ac2430a000000b004fbb1bc1ae0sm1864789lfh.163.2023.07.30.20.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 20:51:48 -0700 (PDT)
Message-ID: <42d3106a-de8f-24f5-e7d2-1ad7ecde9d23@linaro.org>
Date:   Mon, 31 Jul 2023 06:51:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] ARM: dts: qcom: Use labels with generic node names
 for ADC channels
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230730-generic-adc-channels-v5-0-e6c69bda8034@somainline.org>
 <20230730-generic-adc-channels-v5-1-e6c69bda8034@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230730-generic-adc-channels-v5-1-e6c69bda8034@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/07/2023 23:31, Marijn Suijten wrote:
> A future bindings update will replace the free-form qcom,spmi-vadc and
> qcom,spmi-adc5 channel node names with the specific name `channel`, to
> be more consistent with how the driver parses the nodes and to match the
> generic node name set in `iio/adc/adc.yaml`.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   arch/arm/boot/dts/qcom/qcom-pm8226.dtsi  | 12 ++++++------
>   arch/arm/boot/dts/qcom/qcom-pm8941.dtsi  | 14 +++++++-------
>   arch/arm/boot/dts/qcom/qcom-pma8084.dtsi | 12 ++++++------
>   arch/arm/boot/dts/qcom/qcom-pmx55.dtsi   |  8 ++++----
>   4 files changed, 23 insertions(+), 23 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

