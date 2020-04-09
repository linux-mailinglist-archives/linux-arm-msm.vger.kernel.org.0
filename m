Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651041A3082
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 09:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgDIHyQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 03:54:16 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:56441 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726052AbgDIHyQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 03:54:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586418856; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gpYNJ+1uFbtBOpwWzbW0PBBrQVIMD0bMtMbgzX+iZko=;
 b=tqVZnhQon1c2r8kx7c85x3vw/E75YnaefdmW645g1JCNrLU21ikP1Xs4XxcCTNPyqnEG0LrM
 aI47C2nQP2yLBLv+CWuTMr011/BNmWWYzJMutQ81LIkz2iCM8JWOG4a4jbSNC84C/RtX+H0T
 hjnLENIkV6N6ZlKkSs0W8u9/B24=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8ed4a1.7ffb11aa0490-smtp-out-n05;
 Thu, 09 Apr 2020 07:54:09 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E887FC43636; Thu,  9 Apr 2020 07:54:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54ECDC433F2;
        Thu,  9 Apr 2020 07:54:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Apr 2020 13:24:07 +0530
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc7180: Add Coresight support
In-Reply-To: <158641674726.126188.15598430709257198656@swboyd.mtv.corp.google.com>
References: <cover.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <351f1091af0b6d6e0537382fad0c1c51db45edc5.1584689229.git.saiprakash.ranjan@codeaurora.org>
 <158641674726.126188.15598430709257198656@swboyd.mtv.corp.google.com>
Message-ID: <8cd2aec8523775a36fd0be9ec5c8858f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-09 12:49, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-03-20 00:44:29)
>> Add coresight components found on Qualcomm SC7180 SoC.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
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
> 
> Does this SoC have a cpu-debug coresight component? Specifically
> wondering if there's an 'arm,coresight-cpu-debug' compatible node that
> can be added to this dtsi file.

There is no coresight cpu-debug component on SC7180 and SDM845.

  -Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
