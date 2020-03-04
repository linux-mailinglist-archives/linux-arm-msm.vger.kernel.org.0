Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF1C3178A12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 06:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgCDFZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 00:25:05 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:55819 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725773AbgCDFZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 00:25:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583299504; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=oihPKp8ryrKXx/gJOsIWTwnq9rmnQIjm1elo0OxWhdQ=; b=GGzBFUvCjh/5vkTPtkRgxMkLihYTk7U/iUpvuRBUJoqDq6WWuHlpCbXbUCXpPdFWJ4BmDzSO
 xfDe0WWDc8btvIONyy7EOOH1gfiCONXlyeEw+66TWcID7PZzBRLDnVX06Mi2WV6dRtzweofm
 TKP7QYOFtr0A0z5Wd06WA3KkWjg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5f3baf.7f29cfba42d0-smtp-out-n03;
 Wed, 04 Mar 2020 05:25:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F097C447A0; Wed,  4 Mar 2020 05:25:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.206.126.249])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A36ABC43383;
        Wed,  4 Mar 2020 05:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A36ABC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
 <20200227171425.GA4211@bogus>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <b4e3fad9-414f-ce90-26b0-ba8498d21ade@codeaurora.org>
Date:   Wed, 4 Mar 2020 10:54:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227171425.GA4211@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

I ran make dt_binding_check and dtbs_check both on mainline(5.6-rc4) and 
linux-next both are successful.

The file qcom,gcc-ipq6018.h is merged in 5.6, not sure what is going wrong.

Could you please help?

Thanks,

Siva

On 2/27/2020 10:44 PM, Rob Herring wrote:
> On Thu, 27 Feb 2020 15:25:17 +0530, Sivaprakash Murugesan wrote:
>> add dt-binding for ipq6018 apss clock controller
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>>   2 files changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> Documentation/devicetree/bindings/clock/qcom,apsscc.example.dts:17:10: fatal error: dt-bindings/clock/qcom,gcc-ipq6018.h: No such file or directory
>   #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> scripts/Makefile.lib:300: recipe for target 'Documentation/devicetree/bindings/clock/qcom,apsscc.example.dt.yaml' failed
> make[1]: *** [Documentation/devicetree/bindings/clock/qcom,apsscc.example.dt.yaml] Error 1
> Makefile:1263: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
>
> See https://patchwork.ozlabs.org/patch/1245691
> Please check and re-submit.
