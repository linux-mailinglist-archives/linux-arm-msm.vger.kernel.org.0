Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A8343C45C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 09:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240653AbhJ0Hvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 03:51:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:53911 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238848AbhJ0Hvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 03:51:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635320953; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=8GMdHbbqAULcs7zIj12mg8RI8efLCizjjiOsYZymurY=; b=fqDJEdvOZoskzf8EfSNQAaW0LR67iwEaUcyiLu7Bv9K5iuyihuJ98JT9JKfM49jh/V3rhZbW
 Xw+UNSuzJaVnXDUp94qU3rWS4zq0xvKEz+teLs3XaCzhJR6bWtIiGQ1dKkOHTdUDpwak4C4/
 WSjSoLf5nTyPEFtaS63bpPniWw4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61790469bd6886bdf713ba23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 07:48:57
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CD049C4338F; Wed, 27 Oct 2021 07:48:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.143.72] (unknown [202.46.23.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99EA1C43616;
        Wed, 27 Oct 2021 07:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 99EA1C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/3] pinctrl: qcom: Add SC7280 lpass pin configuration
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
 <1633614519-26680-4-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <1d951b30-8298-b739-51c4-13cb2de741b9@codeaurora.org>
Date:   Wed, 27 Oct 2021 13:18:49 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53SqOHKDpMQicrFNmZ1YxAPesTAk4j6kJVi3xMV8re4-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/7/2021 11:24 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:39)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index c0117c5..0b68065 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -237,6 +264,15 @@ static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>>          .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>
>> +static struct lpi_pinctrl_variant_data sc7280_lpi_data = {
> Can this variant data be const?
Okay. Will change accordingly.
>> +       .pins = lpass_lpi_pins,
>> +       .npins = ARRAY_SIZE(lpass_lpi_pins),
>> +       .groups = sc7280_groups,
>> +       .ngroups = ARRAY_SIZE(sc7280_groups),
>> +       .functions = lpass_functions,
>> +       .nfunctions = ARRAY_SIZE(lpass_functions),
>> +};
>> +
>>   static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>>                           unsigned int addr)
>>   {

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

