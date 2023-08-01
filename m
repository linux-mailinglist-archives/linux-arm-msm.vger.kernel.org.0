Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DA876B4F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 14:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233821AbjHAMmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 08:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbjHAMmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 08:42:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40B02103
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 05:42:05 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fe389d6f19so3163270e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690893724; x=1691498524;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Sx00KCd/I73UD7Jgi0iQD/5vs5FBynmP3hawrc6fIM=;
        b=xPCntxirpOkSkCaC/E4r/mdMy+FZXHGoUH1+avEG5qjevxdt5ZwBmIFHDsAXaD5Hwp
         uzzkMOOH3AToiV7Eq0P/nKhrXYQuOkgbAc/BM9ZpbS4hnAASLzbo1U1fkf454/cPVtV3
         PVcz/gqsHcfFB7csA5+C65sWm6KKePBB1/Na2xvpxAnolaGiA05xxPTaKmiJPQ27+2lp
         qqg0PgnEOOF7EfjgX4qbjbH38+puPjcDq6MZLMtIZeMSz3V2qe2brLycVcxPFvmyx5pl
         iQPLAQk7HXeH1vhX5axIItkyudoifJ6OrPXf9lKS352ZBgOYSRN3mnc/8l3FxxaByhFE
         RnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690893724; x=1691498524;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Sx00KCd/I73UD7Jgi0iQD/5vs5FBynmP3hawrc6fIM=;
        b=WyN3FzyVX8Zyaj7paLsegwwEDt0g5bdezPHm+hD7pGAxwgRheT8dOifgiAWYPIbuyn
         B8D1GiV+kf85wTQZINR8VveeJCh4j4hqQtjSbHEOHpR0TuYjh54Clijw1NvxNtoJqxYZ
         adDZWEN0b6DI+oJtMx0fEOP3eijGVZgSIC8m4e+ShmU/mQqKfVOnJIpDEMJ3P5Lk8rob
         JmK9BabrnFqHTLDvt6zUBT6UUlTFBsTEMJahl/Vw6gf5g7tOVAhwUePdU01qmZJz0q7q
         AcDgr/z0znRKrH3t52lUZFE7XC/Pcon6hEzQORFUYg4IFdR/TG0nujnVNwFZr4EDr73y
         yXww==
X-Gm-Message-State: ABy/qLZfNEZmEI2uz+/MwrGXWD/KDHh19AA+1AxdYT+0/76yA4X45ETn
        ksCp/LdWkbiyNjsQkoDngSY9GVr3wHlmpANHH71Wt0WN
X-Google-Smtp-Source: APBJJlG3kIaU3rZ1Qz5LGTyep1P3r3SfYknoFENE/wJ6e5koKTJ/0RDO2o6iQesYdsgDYv+bpLazrw==
X-Received: by 2002:a19:6452:0:b0:4fc:df79:3781 with SMTP id b18-20020a196452000000b004fcdf793781mr2164469lfj.66.1690893723622;
        Tue, 01 Aug 2023 05:42:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3? ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
        by smtp.gmail.com with ESMTPSA id p3-20020a1c7403000000b003fbc9d178a8sm16617578wmc.4.2023.08.01.05.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 05:42:03 -0700 (PDT)
Message-ID: <5e38ac4e-dc50-b172-3601-8da7507d7293@linaro.org>
Date:   Tue, 1 Aug 2023 14:42:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix LDO 12 regulator for PM8550
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230801095702.2891127-1-abel.vesa@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230801095702.2891127-1-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 01/08/2023 11:57, Abel Vesa wrote:
> The LDO 12 is NLDO 515 low voltage type, so fix accordingly.
> 
> Fixes: e6e3776d682d ("regulator: qcom-rpmh: Add support for PM8550 regulators")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 88ddd6c54d04..d990ba19c50e 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -1067,7 +1067,7 @@ static const struct rpmh_vreg_init_data pm8550_vreg_data[] = {
>   	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,    "vdd-l8-l9"),
>   	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo515,    "vdd-l1-l4-l10"),
>   	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo515,    "vdd-l11"),
> -	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo,    "vdd-l12"),
> +	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_nldo515,    "vdd-l12"),
>   	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,    "vdd-l2-l13-l14"),
>   	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,    "vdd-l2-l13-l14"),
>   	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo515,    "vdd-l15"),

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
