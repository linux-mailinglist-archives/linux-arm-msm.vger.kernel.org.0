Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A137723D5E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 06:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgHFEAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 00:00:32 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:16491 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725271AbgHFEAb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 00:00:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596686430; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=385LRkURABpjFHvOhGppwgzxlDi5diqKefwwA9AZkPM=; b=YIUVgHlRwI0C6qiaiYB2fDQWoo7LmLDKO5AZs+xH46cwE1h7/3ETU4/ANGtJ7hxohnKzm5UU
 934u4IYh0lvRoUUuqgHNE+0iXAQhuzLetrUq1b6qTdE4qswPAXQg7SbPbeKb1XfGqqTDFDkG
 SQLOl9IuB2kNiUG58iwHs1L/jBk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f2b804f56dc452789e2b7ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 06 Aug 2020 04:00:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 754C9C433A0; Thu,  6 Aug 2020 04:00:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.129] (unknown [183.83.142.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D254C433C6;
        Thu,  6 Aug 2020 03:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0D254C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v4 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Ajit Pandey <ajitp@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-2-git-send-email-rohitkr@codeaurora.org>
 <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
From:   Rohit Kumar <rohitkr@codeaurora.org>
Message-ID: <989f1d99-3cd0-e725-3f6d-43facf1ec04d@codeaurora.org>
Date:   Thu, 6 Aug 2020 09:29:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159667391634.1360974.15763918681460437981@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for reviewing.

On 8/6/2020 6:01 AM, Stephen Boyd wrote:
> Quoting Rohit kumar (2020-07-22 03:31:44)
>> From: Ajit Pandey <ajitp@codeaurora.org>
>>
>> LPASS variants have their own soc specific clocks that needs to be
>> enabled for MI2S audio support. Added a common variable in drvdata to
>> initialize such clocks using bulk clk api. Such clock names is
>> defined in variants specific data and needs to fetched during init.
> Why not just get all the clks and not even care about the names of them?
> Use devm_clk_bulk_get_all() for that, unless some clks need to change
> rates?

There is ahbix clk which needs clk rate to be set. Please check below 
patch in

the series for reference

[PATCH v5 02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform 
specific function

Thanks,

Rohit

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

