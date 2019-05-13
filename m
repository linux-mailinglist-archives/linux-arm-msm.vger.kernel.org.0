Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93951AF38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 05:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbfEMDoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 May 2019 23:44:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48230 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfEMDoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 May 2019 23:44:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C244D6016D; Mon, 13 May 2019 03:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557719092;
        bh=aC/siESkfqyPwZqxlLNGpYFrcrfYJOzDMbmJcKmnt8Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LCuDUzzMo1fBLmd1EvgoyFXQi1lbDKsroM/CaZgKtM3RuzPBxYMhn9C70x2wOz/hs
         l8uLVULdvMRM/YjIT6Dh6JtAReBew4cmMGgAKGP77kF62eYVJcrENHlSgCO38UEuzt
         wlZndxuJb/i8oNNpu/clWpAHVnEkuo8owsWDNIQA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8381F6016D;
        Mon, 13 May 2019 03:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557719092;
        bh=aC/siESkfqyPwZqxlLNGpYFrcrfYJOzDMbmJcKmnt8Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LCuDUzzMo1fBLmd1EvgoyFXQi1lbDKsroM/CaZgKtM3RuzPBxYMhn9C70x2wOz/hs
         l8uLVULdvMRM/YjIT6Dh6JtAReBew4cmMGgAKGP77kF62eYVJcrENHlSgCO38UEuzt
         wlZndxuJb/i8oNNpu/clWpAHVnEkuo8owsWDNIQA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8381F6016D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 3/3] clk: qcom: rcg: update the DFS macro for RCG
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1557339895-21952-1-git-send-email-tdas@codeaurora.org>
 <1557339895-21952-4-git-send-email-tdas@codeaurora.org>
 <155742286525.14659.18081373668341127486@swboyd.mtv.corp.google.com>
 <07bcd2df-a786-ea52-8566-70f484248952@codeaurora.org>
 <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <f65811f8-42ea-6365-7822-db662eaea228@codeaurora.org>
Date:   Mon, 13 May 2019 09:14:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155751085370.14659.7749105088997177801@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

On 5/10/2019 11:24 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-05-09 19:58:39)
>> Hello Stephen,
>>
>> Thanks for the review.
>>
>> On 5/9/2019 10:57 PM, Stephen Boyd wrote:
>>> Quoting Taniya Das (2019-05-08 11:24:55)
>>>> Update the init data name for each of the dynamic frequency switch
>>>> controlled clock associated with the RCG clock name, so that it can be
>>>> generated as per the hardware plan. Thus update the macro accordingly.
>>>>
>>>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>>>
>>> This patch doesn't make any sense to me.
>>>
>>>> ---
>>>>    drivers/clk/qcom/clk-rcg.h    |  2 +-
>>>>    drivers/clk/qcom/gcc-sdm845.c | 96 +++++++++++++++++++++----------------------
>>>>    2 files changed, 49 insertions(+), 49 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
>>>> index 5562f38..e40e8f8 100644
>>>> --- a/drivers/clk/qcom/clk-rcg.h
>>>> +++ b/drivers/clk/qcom/clk-rcg.h
>>>> @@ -171,7 +171,7 @@ struct clk_rcg_dfs_data {
>>>>    };
>>>>
>>>>    #define DEFINE_RCG_DFS(r) \
>>>> -       { .rcg = &r##_src, .init = &r##_init }
>>>> +       { .rcg = &r, .init = &r##_init }
>>>
>>> Why do we need to rename the init data?
>>>
>>
>> We want to manage the init data as the clock source name, so that we
>> could manage to auto generate our code. So that we do not have to
>> re-name the clock init data manually if the DFS source names gets
>> updated at any point of time.
>>
> 
> Why is the clk name changing to not have a _src after the "root" of the
> clk name? As long as I can remember, RCGs have a "_src" postfix.
> 

Yes, the RCGs would have _src, so we do want the init data also to be
generated with _src postfix. So that we do not have to manually clean up 
the generated code.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
