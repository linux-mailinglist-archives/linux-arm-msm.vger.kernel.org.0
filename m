Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDB96E445
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2019 12:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbfGSK3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jul 2019 06:29:10 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52336 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfGSK3J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jul 2019 06:29:09 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7B75561633; Fri, 19 Jul 2019 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563532148;
        bh=VV9h9+j4OURu4RUr60QbOyNI3a2ZiA7WIr1P5diLdXY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V1Z0kK5UI4uEc+a4c4JW2JUb1A17pWw7RbBr9UfKu9ALdbWrkLwoCV9r/hw//F0su
         UH75FVFtqBtBQwsBhNZsyHx15dsZNod829rfw18b26O4cTuaYtJ5ungxJRv5nNtC4C
         FahTl8+4rabBbtV8Q3HH8RpQ61uypevkdksXaitw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.47] (unknown [157.49.206.83])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 615F760275;
        Fri, 19 Jul 2019 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563532147;
        bh=VV9h9+j4OURu4RUr60QbOyNI3a2ZiA7WIr1P5diLdXY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EUFE27chUPuph25X/Y7xP28qz93qjEb1Y6tC3kgo296KaENOv9XuFs9NG6U+Uq5uF
         tJxaWrPDKh1ArNq2/YhgCw1yZhhVokF2Hl5TEIIY8TKCZKCPy0dl4s5DSpchj2shLQ
         1oLxm++aU0dhV3RurE9Om9f70GFRuSbMj2pfYUG8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 615F760275
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCHv8 1/5] arm64: dts: qcom: sdm845: Add Coresight support
To:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        gregkh@linuxfoundation.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <52550ed9bbc10dca860eb1700aef5c97f644327b.1562940244.git.saiprakash.ranjan@codeaurora.org>
 <33215f68-1bf9-322a-d889-1d22514bdbdc@arm.com>
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Message-ID: <a1a2a9c6-f58b-f849-76e4-3a76d6faaab5@codeaurora.org>
Date:   Fri, 19 Jul 2019 15:58:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <33215f68-1bf9-322a-d889-1d22514bdbdc@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 7/19/2019 3:16 PM, Suzuki K Poulose wrote:
> 
> Hi Sai,
> 
> 
> On 12/07/2019 15:16, Sai Prakash Ranjan wrote:
>> Add coresight components found on Qualcomm SDM845 SoC.
>>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 451 +++++++++++++++++++++++++++
>>   1 file changed, 451 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi 
>> b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 4babff5f19b5..5d7e3f8e0f91 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1815,6 +1815,457 @@
>>               clock-names = "xo";
>>           };
>> +        stm@6002000 {
>> +            compatible = "arm,coresight-stm", "arm,primecell";
>> +            reg = <0 0x06002000 0 0x1000>,
>> +                  <0 0x16280000 0 0x180000>;
>> +            reg-names = "stm-base", "stm-stimulus-base";
>> +
>> +            clocks = <&aoss_qmp>;
>> +            clock-names = "apb_pclk";
>> +
>> +            out-ports {
>> +                port {
>> +                    stm_out: endpoint {
>> +                        remote-endpoint =
>> +                          <&funnel0_in7>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +
>> +        funnel@6041000 {
>> +            compatible = "arm,coresight-funnel", "arm,primecell";
> 
> We added support for static funnels and have thus updated our DT 
> bindings. And
> that implies, the above binding is now obsolete.
> As of the coresight/next tree, and thus linux-next, this must be 
> arm,coresight-dynamic-funnel and same applies everywhere else in the 
> series. Please could you
> update the series ?
> 

Sure, will update in the next version of the series.

Thanks,
Sai


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
