Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514A37196B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 11:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjFAJUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 05:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232647AbjFAJUN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 05:20:13 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B7E123
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 02:20:10 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af2958db45so8354311fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685611209; x=1688203209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Upah+Y2Kh3L4tAtOneXdavHB+WOOs6JqtTqR8dmqzds=;
        b=S/KHssHYzPJWmfFSB5M5xj22NYmg/IOW4C4BQvGuikrGKeyG+xulgw5l15OVYiPkjY
         RTjoVbRRNwVA2maZFzhBj4Cciat+jaljNMi8aUEsvN5lPCZ0SS4qBXxqtKuEQlRh0bMb
         Bx6yIPXJN11nAxR2roAQS1ynl6MJbco+JW9i1hfa6vwqJ3evf9qYt+4xEdlPrrab5KoI
         4R4iVUzbL4PA/dVOzJ6e1kBiADVsa1JpIBLgiii32bt1AX+t+7ezN6Ivnq417vSIu43D
         nzJ/hWX2InOAMX8VaBCV6Xgp9H68B/qc5C9GqdCcmbVg9tCL3VOw5cEYpZWc6z5PHl3D
         mptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685611209; x=1688203209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Upah+Y2Kh3L4tAtOneXdavHB+WOOs6JqtTqR8dmqzds=;
        b=DmRm5+wiQ6X1oWHSm0mogWaGyOy0E/luqleImwMEKvJF1AwyxYcJMMqnIA12nPwTs4
         ARxz1W5AL3vr3whyjmilUVafMW6ehCN+dPEMfyvcw6QVjHDxxOc0EhmXi091bzjpZIMd
         Nwwm+GwAdNIVkqXDUbDW9ptfvaw7y03KEfXLscPDI+HjsgAKkRpEkUizva+IJZLXbI9y
         6voVgpFR0kM5LtGbn+GKCxmHwzmVIXhVwYdoveRxQ0e4h4c5mTZCqGk+Z8R8jBG5pjlf
         wTaYwdBQ6y3vaZMQKNMPW7fqOSYFpr6pDlX5buJYE7l6LAxuXGzSrKTHpoo+ANVGVnGD
         g9Cg==
X-Gm-Message-State: AC+VfDzu8fSAD4u6HFbR1gTLr7EbI3YfFo1mGboHFfMj1sdoi6bWgR/K
        s5MnzWGOLXuckdI2T9L/gOu/wQ==
X-Google-Smtp-Source: ACHHUZ6RxwFq+p0b2D5wHLlVhYYjxiBWXwQJegyxxJ116UwzQSHJVQQWNbBwcND/yWywUW9ZHQFnBw==
X-Received: by 2002:a2e:8283:0:b0:2a8:e4d3:11e2 with SMTP id y3-20020a2e8283000000b002a8e4d311e2mr4741440ljg.39.1685611209198;
        Thu, 01 Jun 2023 02:20:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s18-20020a2e2c12000000b0029c96178425sm3719347ljs.19.2023.06.01.02.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 02:20:08 -0700 (PDT)
Message-ID: <2679410b-b40d-97b5-b7c2-46f32395b796@linaro.org>
Date:   Thu, 1 Jun 2023 12:20:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/20] soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, Evan Green <evgreen@chromium.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20230526-topic-smd_icc-v1-0-1bf8e6663c4e@linaro.org>
 <20230526-topic-smd_icc-v1-1-1bf8e6663c4e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v1-1-1bf8e6663c4e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/05/2023 13:20, Konrad Dybcio wrote:
> Add a preprocessor define to indicate the number of RPM contexts/states.
> While at it, use tabs instead of spaces for the existing entries.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   include/linux/soc/qcom/smd-rpm.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
> index 2990f425fdef..99499e4b080e 100644
> --- a/include/linux/soc/qcom/smd-rpm.h
> +++ b/include/linux/soc/qcom/smd-rpm.h
> @@ -4,8 +4,9 @@
>   
>   struct qcom_smd_rpm;
>   
> -#define QCOM_SMD_RPM_ACTIVE_STATE        0
> -#define QCOM_SMD_RPM_SLEEP_STATE         1
> +#define QCOM_SMD_RPM_ACTIVE_STATE	0
> +#define QCOM_SMD_RPM_SLEEP_STATE	1

This is what we usually try to abstain from: ident changes + functional 
changes. I'd say, leave spaces as is and just add the new entry.

> +#define QCOM_SMD_RPM_STATE_NUM		2
>   
>   /*
>    * Constants used for addressing resources in the RPM.
> 

-- 
With best wishes
Dmitry

