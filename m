Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6D5AD422
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2019 09:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388348AbfIIHsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Sep 2019 03:48:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38432 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388282AbfIIHsr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Sep 2019 03:48:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8A6CF607C6; Mon,  9 Sep 2019 07:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568015325;
        bh=LBIHaUHy7oCabOja1vBhxQ0rSOGqjdP1HeHyaPjBtvA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FsV+bI66Pdy2oEVRZFLBlACJzR7q64OhTjw9FxTFu0G6N6APK5vM4fKbDFB49lqC1
         X1eN0DAN9Gg3ItZVm+w0VecFJnaO35Vq6mzJv3yi6gZ5RTw1oJOY5w6lWF99cF6ktp
         m9LmcNAFG1HzRGYK8QvFEJkT/sRY+mY4D5/4HxcU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 764CC602F8;
        Mon,  9 Sep 2019 07:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568015325;
        bh=LBIHaUHy7oCabOja1vBhxQ0rSOGqjdP1HeHyaPjBtvA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FsV+bI66Pdy2oEVRZFLBlACJzR7q64OhTjw9FxTFu0G6N6APK5vM4fKbDFB49lqC1
         X1eN0DAN9Gg3ItZVm+w0VecFJnaO35Vq6mzJv3yi6gZ5RTw1oJOY5w6lWF99cF6ktp
         m9LmcNAFG1HzRGYK8QvFEJkT/sRY+mY4D5/4HxcU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 764CC602F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: Use floor ops for sdcc clks
To:     Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190906045659.20621-1-vkoul@kernel.org>
 <20190906203827.A2259208C3@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <adaad84a-15ce-3212-9fec-7ff387da2a88@codeaurora.org>
Date:   Mon, 9 Sep 2019 13:18:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190906203827.A2259208C3@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen, Vinod,

On 9/7/2019 2:08 AM, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-09-05 21:56:59)
>> Update the gcc qcs404 clock driver to use floor ops for sdcc clocks. As
>> disuccsed in [1] it is good idea to use floor ops for sdcc clocks as we
>> dont want the clock rates to do round up.
>>
>> [1]: https://lore.kernel.org/linux-arm-msm/20190830195142.103564-1-swboyd@chromium.org/
>>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
> 
> Is Taniya writing the rest? Please don't dribble it out over the next
> few weeks!

I have pushed the patch : https://patchwork.kernel.org/patch/11137393/

Vinod, I have taken care of the QCS404 in the same patch, so as to keep 
the change in one patch.

> 
>>   drivers/clk/qcom/gcc-qcs404.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
