Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49C1DF3B7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 23:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfKGWfZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 17:35:25 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:54762 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKGWfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 17:35:25 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2233660D84; Thu,  7 Nov 2019 22:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573166124;
        bh=Q2G6160efqVb5qVyhoWW92xY36mZ64vNPwsbgT5/UE0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PtcZKf+ImPi9b7/IEeCW5PC1sMgJs0tayIdJU7odKLCIQW5qSdh9JYWx/GS0LMZ/A
         +wfuQ4IWq7q3ab3AwXG7Fi+qLZkTh52g6RyZT/jORds/ILyXnDmmPmlha/22jhS0Nw
         ztqI2jjDqPJYa26YvjHkVrHpQCjaMhvn/FvoN3K4=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6EC2260AD9;
        Thu,  7 Nov 2019 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573166123;
        bh=Q2G6160efqVb5qVyhoWW92xY36mZ64vNPwsbgT5/UE0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DTwZZgdX2gyXbuubR1oBlne3TXog4s/aJUuw6fx3yjpqEItoi3QiqqYRalQ0tRYuR
         0WDjzPPRqPCpNZWdiFV9EgjiBD8BbwVz+yBSqWkhBBVUqj5lAethZR0oETcXnt/GbP
         CvThii+QifpN4FMQ6t25unnKHN6x+ntyUHNDk7Tk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6EC2260AD9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v6 4/6] dt-bindings: clock: Add support for the MSM8998
 mmcc
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
 <1569959842-8399-1-git-send-email-jhugo@codeaurora.org>
 <20191107215506.8FBFA2084D@mail.kernel.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <7f3697ae-2e12-f306-b288-4dec19544275@codeaurora.org>
Date:   Thu, 7 Nov 2019 15:35:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107215506.8FBFA2084D@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/7/2019 2:55 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-10-01 12:57:22)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> index 8b0f7841af8d..a92f3cbc9736 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>> @@ -10,11 +10,32 @@ Required properties :
>>                          "qcom,mmcc-msm8960"
>>                          "qcom,mmcc-msm8974"
>>                          "qcom,mmcc-msm8996"
>> +                       "qcom,mmcc-msm8998"
> 
> Can you convert this binding to YAML? Makes it easier to validate it
> against the dts files.

I'll look at this since I'm already resending due to the merge conflict.

> 
>>   
>>   - reg : shall contain base register location and length
>>   - #clock-cells : shall contain 1
>>   - #reset-cells : shall contain 1
>>   
>> +For MSM8998 only:
>> +       - clocks: a list of phandles and clock-specifier pairs,
>> +                 one for each entry in clock-names.
>> +       - clock-names: "xo" for the xo clock.
>> +                      "gpll0" for the global pll 0 clock.
>> +                      "dsi0dsi" for the dsi0 pll dsi clock (required if dsi is
>> +                               enabled, optional otherwise).
>> +                      "dsi0byte" for the dsi0 pll byte clock (required if dsi
>> +                               is enabled, optional otherwise).
>> +                      "dsi1dsi" for the dsi1 pll dsi clock (required if dsi is
>> +                               enabled, optional otherwise).
>> +                      "dsi1byte" for the dsi1 pll byte clock (required if dsi
>> +                               is enabled, optional otherwise).
>> +                      "hdmipll" for the hdmi pll clock (required if hdmi is
>> +                               enabled, optional otherwise).
>> +                      "dpvco" for the displayport pll vco clock (required if
>> +                               dp is enabled, optional otherwise).
>> +                      "dplink" for the displayport pll link clock (required if
>> +                               dp is enabled, optional otherwise).
> 
> I'm not sure why it's optional. The hardware is "fixed" in the sense
> that the dp phy is always there and connected to this hardware block.
>  From a driver perspective I agree it's optional to be used, but from a
> DT perspective it's always there so it should be required.
> 

Sure, the DP phy is technically always there, but does a particular 
platform have an actual DP output connected to the phy?  If not, why 
bother describing something that isn't even used?

 From a more practical sense its undefined how to actually get the DP 
clocks - the DP binding is implicitly a clock provider since it has 
#clock-cells, but it doesn't specify how to actually get the clocks. 
The DSI binding tells you which index is the dsi clock, and which is the 
byte clock.

The HDMI binding is not a clock provider at all.  Needs to be revised, 
which didn't appear trivial when I took a quick look while working on mmcc.

I want to do the right thing here by specifying all the external clocks 
up front, and not have to worry about backwards compatibility with 
pre-existing DTs later on, but I also would like to focus on one problem 
at a time, and not go dig into all the problems with DP/HDMI before 
landing this, particularly as those components also rely on the mmcc.

Is that justification enough for you?  If not, how would you like to 
proceed?  Make them required in the binding, and just have an invalid 
(per the binding) DT until all the problems get sorted out?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
