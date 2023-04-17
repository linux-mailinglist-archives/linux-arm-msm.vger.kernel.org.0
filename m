Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502BF6E4B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 16:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjDQOep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 10:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjDQOem (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 10:34:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD4D65AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:34:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4edc63c82d1so560771e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681742075; x=1684334075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbFC79Oq+9Hmqepmm6jPvUsF/5+tyLfUN18+6Z858KQ=;
        b=i2gd9vrsSf0FZ3njsdwlXYbOAQmsvA7jjO3MFexLRv6nEN46apEntdBYccGWUdL9o2
         Ul3NRO9qCUApBTMRDy/sAW5OcR9e1DsQecqtaLSHduCtS5SPLA+zSQv6LGcGikBBRHCt
         RZSHyagv0hHkj3QYOXy+ZA5inw9Fpu9/PuzegV1FYBiRTDeWYbyJxMZA3QQceq9QyIw4
         MovaLcksvSNOT0tiN5Ld1mtHgSaGnns5FkrsaCl7JnKwmANsJsga9BG4dZuRFVoTRXz7
         atr5I9wYOKJ+6bttLJHOfFQP7kfsOi6O/W+xrlUcCWYDpRlN1t2w02hYARZeYSK8Y3gQ
         BdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681742075; x=1684334075;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbFC79Oq+9Hmqepmm6jPvUsF/5+tyLfUN18+6Z858KQ=;
        b=PnpfH76HqCGH5xMypkdUrP93woolMZLuMLFRbkaLXRJcuc4P9Aw20icnPLWpZUDqVw
         +9f+A2greUA9ToAd/ZJ6+9T9mLJ/MwA0DQJ6E5jIJG/jBNQ1196TxyTcLx/l+IGYSKqM
         RmToJ679yKkSn3mx8NikX7qA/XWVjSiE9hG54AVUmJ1B4EPCNVe5okyNtBZF3R+KwNG/
         FWmK543nwbbcyP4bbeUonohJ/0WzabNGed3yITlgQD6sSWtAoRvoXfk+qWxuLMxZhkPK
         nCHpMKfy1wS75/v7TgofTXos8fZnYtnolUJJCYeL7taHzC+0SFrV5KjoiFhYMbDrbfcD
         T7Lg==
X-Gm-Message-State: AAQBX9eeJxKLpDr7yghFxebcCDcVxmO9DySXbwBcQVyaxurgtvGzudFl
        BAqPH5C0LVDiwa60l6xQL7C6NA==
X-Google-Smtp-Source: AKy350aaUQGrmfENt3BQQZ0nR1tYMqNpI8SGmDfriGYVbYfw49/uQIcT2pRp7Ln1mH1Ij+mbAcC/zg==
X-Received: by 2002:ac2:5dc4:0:b0:4e8:49ff:8df8 with SMTP id x4-20020ac25dc4000000b004e849ff8df8mr2001819lfq.61.1681742075428;
        Mon, 17 Apr 2023 07:34:35 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id m14-20020ac24ace000000b004e83fbba141sm2062414lfp.164.2023.04.17.07.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:34:35 -0700 (PDT)
Message-ID: <b2ddefb6-78e1-1c25-00de-3512b9f76b6d@linaro.org>
Date:   Mon, 17 Apr 2023 16:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2] clk: qcom: ipq5332: fix the order of SLEEP_CLK and XO
 clock
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230417105607.4091-1-quic_kathirav@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417105607.4091-1-quic_kathirav@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.04.2023 12:56, Kathiravan T wrote:
> The order of DT_SLEEP_CLK and DT_XO are swapped and it is incorrect.
> Due to which the clocks for which the parent should be XO is having parent
> as SLEEP_CLK and vice versa. So fix the same by re-ordering the entries.
> 
> Fixes: 3d89d52970fd ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5332 SoC")
> Reported-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
This matches what I can see in the bindings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes in V2:
> 	- Added the Reported-by and Fixes tag
> 
>  drivers/clk/qcom/gcc-ipq5332.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index 8cacbfb10c72..14096887d436 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -20,8 +20,8 @@
>  #include "reset.h"
>  
>  enum {
> -	DT_SLEEP_CLK,
>  	DT_XO,
> +	DT_SLEEP_CLK,
>  	DT_PCIE_2LANE_PHY_PIPE_CLK,
>  	DT_PCIE_2LANE_PHY_PIPE_CLK_X1,
>  	DT_USB_PCIE_WRAPPER_PIPE_CLK,
