Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AE043C428
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 09:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238873AbhJ0Hor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 03:44:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:11424 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240565AbhJ0Hoq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 03:44:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635320542; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3ipj9C9Z+CcARpvtwqbGA4rPC5dN+YNxfZHwxGPY7Qc=; b=jtsce476BGnbsUEXkfN/Sx1+8YTYiRiiQdviNSHDOnzVpsW//spXIokDOFX23bS6VhUal1WU
 4B1NhfB6b3B253Bi1cZ0fjm11XclCTPXPAU27a5tkknP83zuSctZZ4/SHe8wkZG9mygMbRVw
 VhB/CdGv5w1MXjry8SCuK+cK3LQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 617902dd5ca800b6c1cb7e7c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 07:42:21
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E88EC4360C; Wed, 27 Oct 2021 07:42:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E47BC43460;
        Wed, 27 Oct 2021 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1E47BC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d00db826-5834-be00-d75b-e226e6f751b5@codeaurora.org>
Date:   Wed, 27 Oct 2021 13:12:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/7/2021 11:27 PM, Stephen Boyd wrote:
Thanks for Your Time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:37)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 2f19ab4..c0117c5 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -124,7 +124,8 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>>          PINCTRL_PIN(13, "gpio13"),
>>   };
>>
>> -enum sm8250_lpi_functions {
>> +
> Please drop this extra newline so the diff makes sense.
Okay.
>> +enum lpass_lpi_functions {
>>          LPI_MUX_dmic1_clk,
>>          LPI_MUX_dmic1_data,
>>          LPI_MUX_dmic2_clk,
>> @@ -203,7 +204,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>>          LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>
>> -static const struct lpi_function sm8250_functions[] = {
>> +static const struct lpi_function lpass_functions[] = {
> Why not follow the approach of other qcom pinctrl drivers and make a
> core driver that each SoC uses as a library?

Actually this driver is for lpass LPI pin control purpose. For this only 
14 pins are there and mostly fixed for all platforms.

So I feel for now this approach is fine.

>>          LPI_FUNCTION(dmic1_clk),
>>          LPI_FUNCTION(dmic1_data),
>>          LPI_FUNCTION(dmic2_clk),
>> @@ -615,7 +616,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>                  return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>                                       "Slew resource not provided\n");
>>
>> -       ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +       ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> Please mention in the commit text why this is now optional.
Okay. will update commit message accordingly.
>
>>          if (ret)
>>                  return dev_err_probe(dev, ret, "Can't get clocks\n");
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

