Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6AA18F05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 08:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbgCWHiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 03:38:13 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:40239 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727389AbgCWHiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 03:38:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584949089; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qD6MdWpyeM1qFTA64jlmNgu6EXEHLcXXCvElH53FoOg=;
 b=GKrxJvbJV5NdnjQA74z4t1lyTyeFdPlNVGtimQ4Id0NyS/9DhyJa2zxF+3pt5Zlz3CoIzTxU
 xf6hwiQqvm3/RBdKuQzQ3IbQjNBM8kp/e3oZtHS4K40N2qIuWCAhIAPJ7sj0QftxHD5eXu0a
 DkJ1VXTR/JB3C8TLb4n+XOvkwD4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e786754.7efcbe51f8f0-smtp-out-n05;
 Mon, 23 Mar 2020 07:37:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 733AFC43637; Mon, 23 Mar 2020 07:37:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC68CC433CB;
        Mon, 23 Mar 2020 07:37:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Mar 2020 13:07:55 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        devicetree@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add Coresight support
In-Reply-To: <158482865109.125146.10520179077419628836@swboyd.mtv.corp.google.com>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <158482865109.125146.10520179077419628836@swboyd.mtv.corp.google.com>
Message-ID: <de3d226dbd7b00f9c4b7cd6c86db97e0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-03-22 03:40, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-03-20 00:44:29)
>> Add coresight components found on Qualcomm SC7180 SoC.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> 
> One nit below.
> 
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 507 
>> +++++++++++++++++++++++++++
>>  1 file changed, 507 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 998f101ad623..d8fe960d6ace 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -1294,6 +1294,513 @@
>>                         };
>>                 };
>> 
>> +               stm@6002000 {
>> +                       compatible = "arm,coresight-stm", 
>> "arm,primecell";
>> +                       reg = <0 0x06002000 0 0x1000>,
>> +                             <0 0x16280000 0 0x180000>;
>> +                       reg-names = "stm-base", "stm-stimulus-base";
>> +
>> +                       clocks = <&aoss_qmp>;
>> +                       clock-names = "apb_pclk";
>> +
>> +                       out-ports {
>> +                               port {
>> +                                       stm_out: endpoint {
>> +                                               remote-endpoint =
>> +                                                 <&funnel0_in7>;
> 
> Given that this is DT I'd say we just put this remote-endpoint all on
> one line. Makes it more readable and I don't think we really care about
> the line length in these cases. We're nested pretty deep because it's a
> graph binding.
> 

Thanks for the review and test, I will make this change.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
