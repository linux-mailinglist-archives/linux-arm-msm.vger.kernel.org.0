Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F193413049
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 10:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhIUIoO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 04:44:14 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33595 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhIUIoN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 04:44:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632213765; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GpX5pSz4V7nFNRLtI0j1LOAwCT2IOlbzkNy46PCg7aA=; b=Yxlrhz3RNRnmDfXe5HO5tamMY5QokktmITKO5VOFgHApWa6TDglOc2oVDqhmw17KTfKD+pUM
 aFYZqpKSTqvw4sWNYn4DbPejuQspj29kHPbHiyfUZa5+7xQeVn4kJC7rtWRQvDYZmqbiRzHu
 UWRAoMTpXfdieSbj6OLekRs7V0c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61499af6bd6681d8edd68c23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 08:42:30
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F313C4361A; Tue, 21 Sep 2021 08:42:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.204.90] (unknown [157.48.173.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67C7DC4338F;
        Tue, 21 Sep 2021 08:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 67C7DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/7] ASoC: qcom: Add compatible names in va,wsa,rx,tx
 codec drivers for sc7280
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
        robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51L7YSA4FDLv_2Q9U3nzxK1YY8hRtZ-G0cs42nomySMTA@mail.gmail.com>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <48c6b8b1-bc65-a148-254d-57a5658cdd5c@codeaurora.org>
Date:   Tue, 21 Sep 2021 14:12:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51L7YSA4FDLv_2Q9U3nzxK1YY8hRtZ-G0cs42nomySMTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/20/2021 11:47 PM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-09-20 00:35:25)
>> Add compatible names for sc7280 based targets in digital codec drivers
>> va,wsa,rx and tx.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c  | 1 +
>>   sound/soc/codecs/lpass-tx-macro.c  | 1 +
>>   sound/soc/codecs/lpass-va-macro.c  | 1 +
>>   sound/soc/codecs/lpass-wsa-macro.c | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 196b068..520c760 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -3578,6 +3578,7 @@ static int rx_macro_remove(struct platform_device *pdev)
>>
>>   static const struct of_device_id rx_macro_dt_match[] = {
>>          { .compatible = "qcom,sm8250-lpass-rx-macro" },
>> +       { .compatible = "qcom,sc7280-lpass-rx-macro" },
> Please sort alphabetically on compatible string.
Okay. will change and post new patch.
>>          { }
>>   };
>>   MODULE_DEVICE_TABLE(of, rx_macro_dt_match);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

