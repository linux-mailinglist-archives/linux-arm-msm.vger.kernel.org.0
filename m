Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083A4324ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 12:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhBYLLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 06:11:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhBYLKm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 06:10:42 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE765C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 03:10:01 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id w36so7975426lfu.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Feb 2021 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KsVwr/SgHimLoekwI/bdVNURN0jFlKqAbUptmf67o5U=;
        b=T+qkOHu3rv0PtEZuU2y0Q0dtYGNt03jhzNks4s/nDqX4r5pusHWu5T0vyQALvDt3lw
         JOTdpdrh/udLx/V2gKWixcDpH0+g6pZrFvlzxP0kFY+JACin8njulDHIWFOI63Um8aD1
         S7D1vZ4SoLhUIsgPvMOpCNJyeO68GMcsS84t7DyIV286ved6lDnFjzf9snYJMD/MfSxb
         nQ3lKC6yPDYpP/xhJUef3KRlpIGcz9nyV38Xq0qT60tkxhsnIL6tf9Ag6JRgwjrzk6t4
         gZpiB62aichJM3EiFmdnKuIWYxSkWxXCYMtHmqa0wW0HuCjLMNI2k+X669Y8UBmBvX5Q
         P6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KsVwr/SgHimLoekwI/bdVNURN0jFlKqAbUptmf67o5U=;
        b=DALRoAW1fMo7uToFVA1lz1kdODMOsIewOND78EtmNJRn7SAq/a143r5r48s23XzAFK
         tkbMfdRwEgiy9sincQ2K+Cx639YvbeIKds0erZTr1obU4yMItf7AqctnOQ195F4wvxHt
         IUpKp3yg7C0OWJk6aQu5rNsJKCB18FBM6SGyUjEhaM4QyV46l0mSuqR+5dnNQ54w5sHs
         Xq9eMuon7/yhdvR/czEmgBlNziUgf+T5ba+xLALSDeUi3F4rp0s0tXguQpJtYbNOqA5T
         f7/lozg4b3QeWRwJChqXIu06VTQWbtl6lKRwF80Cx7gmZ+yBKyxapK5+WrNRpz+sB563
         W+0A==
X-Gm-Message-State: AOAM5313G8qeXjepa31ah1wpdwo91RC/UQUDP4PAdhPE/6WVp4MMOi/3
        PgAVAKKGnLlKbDimVFPgLoD5QsPE3i81Bw==
X-Google-Smtp-Source: ABdhPJxO+31XRf9aeobSv/xOGy6tmP4FnGyIw4EYnd9nFbGUUaXei++utAw0Elga/21sjRzu79YSoA==
X-Received: by 2002:a05:6512:2295:: with SMTP id f21mr1799266lfu.187.1614251399794;
        Thu, 25 Feb 2021 03:09:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y11sm198588ljc.18.2021.02.25.03.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 03:09:59 -0800 (PST)
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515
 buck
To:     satya priya <skakit@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
Date:   Thu, 25 Feb 2021 14:09:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1614155592-14060-4-git-send-email-skakit@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/02/2021 11:33, satya priya wrote:
> Correct the REGULATOR_LINEAR_RANGE and n_voltges for
> pmic5_hfsmps515 buck.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>   drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 79a554f..36542c3 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -726,8 +726,8 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
>   static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
>   	.regulator_type = VRM,
>   	.ops = &rpmh_regulator_vrm_ops,
> -	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000),
> -	.n_voltages = 5,
> +	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 235, 16000),
> +	.n_voltages = 236,

I've checked the docs for pm8009, the chip which also uses hfsmps515 
regulators. The pdf clearly states that the 'Output voltage operating 
range' is from 2.8 V to 2.85 V.

So we'd probably need to define different versions of HFS515 regulator 
data (like I had to create for pm8009-1).


>   	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>   	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>   };
> 


-- 
With best wishes
Dmitry
