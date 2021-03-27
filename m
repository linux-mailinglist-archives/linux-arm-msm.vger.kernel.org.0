Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497F834B3A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Mar 2021 02:53:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbhC0BxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 21:53:08 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:35140 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231172AbhC0Bw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 21:52:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616809976; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=w3B05Lcc00i+kMRUOl0eohJ8ozsXKgERZwHmZcxTDzI=; b=MqKwL91jCIjKz1HQTj2jxdSoVJvorc0PuPslwpMmbg2f1O4oF3R5K5gkPbM//3c2n33MAXFU
 EPzRblb8+5Cwj0hh31qZ/1UCnJYS9gROnf+ghfuRC3gjoeZ3TZyqOBjjtyOPpYPjLeZ/ieFb
 g8MXb9lP4YkRjSBz+WlcjCXT3N0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 605e8ff2c39407c327eae6e1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 27 Mar 2021 01:52:50
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A1CB7C433C6; Sat, 27 Mar 2021 01:52:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [49.204.180.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF7AAC433CA;
        Sat, 27 Mar 2021 01:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF7AAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH] clk: qcom: camcc: Update the clock ops for the SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1616140054-5141-1-git-send-email-tdas@codeaurora.org>
 <161648457933.3012082.10324281519544090271@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1d1b9ab5-9344-fb33-8edd-bcb2024a7b24@codeaurora.org>
Date:   Sat, 27 Mar 2021 07:22:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <161648457933.3012082.10324281519544090271@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Thanks Stephen for the review.

On 3/23/2021 12:59 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-03-19 00:47:34)
>> Update the RCGs to use shared ops to park the RCGs at XO.
> 
> s/Update/fix/?
> 
> Can you also elaborate more on why we need to park the RCGs here for all
> these different clks? Is the camera driver supposed to not touch these
> and let the firmware take over? Is there zero coordination between the
> kernel and the firmware?
> 

Updated the patch with details.

>>
>> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
