Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26B9E6B1833
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 01:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjCIAvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 19:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCIAue (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 19:50:34 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4029AA11
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 16:50:27 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id t14so220678ljd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 16:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678323027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ut0NKrrmJpcZE86pvln2zJpYj/UO7+bDI29L6LGhRzI=;
        b=fpYZce9XoDJK0bMS6sLsPQ/4JRC0SZEJQRJd8/vpYY7RD7FRlsdKS3EMvoY/2+uGEx
         Q4Vu8LBZaLBFO1e8aMQh9S1V+VPlk1luw3NOWDxtGaUaXSN1/JoJamYbxlffZ5VfSMJW
         yZ4N9FB6p7cjA5ekK+GCNHyGbugy6fDxReetFh/OOcjb+E8NBCSk9no5JZxFcANndXem
         zxA4Qj2rnqXRlyu1QbbQ0PUm6CNTYlhSyv5LIgKeWL8hOvT3E3Lp3biZrAU4fq6EK8D9
         dmU0ZRq1fS5bE/zE2tNuPTaIyiUvtEqRcMI8eexaIQlU2ZOlWKTh0kMeBmRv1OnbZgY8
         eIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678323027;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ut0NKrrmJpcZE86pvln2zJpYj/UO7+bDI29L6LGhRzI=;
        b=2JJRfN5egtrXjAs+1EvLYrM6sR1d/em1PZp2JPwIAdSYcgk/nHcir01tmK0r2uSsIW
         dMnHt6hT2SIUN831XyDTS0mExA0r7O7knfDiwNOGTkEk7HYEDbqMVku39I6/fmS5l6S6
         PdB0+OGck+8vNhbZ+q1KU6eZzoiW3sQh0LIQk8JKdrhVsVMEHZSi2lT6pE3WmQfwM+AJ
         Ip7r5bC926BX8IAk0BLNkUMkvc5/eIamdGXAWEJpC36bHx3RHgOMGeQ4qhO6PC6IahBy
         Ac/QWOZGVlMUxCPrQ+P/MaXCndqRYZ1jaLjYj1Z2VCD67jLmnHzXe1xMXKu1UqVa5ksc
         Q9ug==
X-Gm-Message-State: AO0yUKXKVq9tfQukQKOes3vtrBzOOowj3/pZbwYlr+AKYtEMhXWAIbLO
        2wQHVJRFYU67uMa8QrmmKpNZ5A==
X-Google-Smtp-Source: AK7set+HnokK5N0HIox0l7I9KqzxZ8YkRzgaK8HIrha8WK8EtKzLjssiWL2lWWJV2dHWjfPc5yQ8RA==
X-Received: by 2002:a05:651c:1720:b0:293:4fe3:8f97 with SMTP id be32-20020a05651c172000b002934fe38f97mr5661884ljb.20.1678323027009;
        Wed, 08 Mar 2023 16:50:27 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9c56000000b00295da33c42dsm2771053ljj.15.2023.03.08.16.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 16:50:26 -0800 (PST)
Message-ID: <3ad9123f-5a39-cf2e-b8e3-68d8f3129215@linaro.org>
Date:   Thu, 9 Mar 2023 02:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFT v2 08/14] clk: qcom: smd-rpm: Separate out a macro for
 defining an AO clock
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <20230303-topic-rpmcc_sleep-v2-8-ae80a325fe94@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230303-topic-rpmcc_sleep-v2-8-ae80a325fe94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 23:35, Konrad Dybcio wrote:
> To declare a keepalive variant of a bus clock, it will be useful to
> have a reusable macro which will ease defining a keepalive variant
> of an AO clock with an IS_CRITICAL flag. Introduce it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

