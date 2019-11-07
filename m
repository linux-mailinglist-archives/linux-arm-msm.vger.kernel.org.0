Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEB5F273D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 06:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfKGFqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 00:46:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37802 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfKGFqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 00:46:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D814F60610; Thu,  7 Nov 2019 05:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573105582;
        bh=5R7CvQNT/kKjJNFdzKmIt6+BvlKhn1cLoLRrPsfKIqo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XhnrecfL1k6NaedMJcED78XJ9cA3/WyKOu1st82/QN7Z0abZaKeErpTF3RsAdcKMr
         2wNP5cn0mRpE7aPFzCJo129/AFLNkLmq8m9/1TCdq8uW6abeJJHVR57svyL7foxoqI
         uoZKJflTtqJCFkS9NUfUPRyU2Jyr5hy8XK/PcP7E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC8D560112;
        Thu,  7 Nov 2019 05:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573105582;
        bh=5R7CvQNT/kKjJNFdzKmIt6+BvlKhn1cLoLRrPsfKIqo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XhnrecfL1k6NaedMJcED78XJ9cA3/WyKOu1st82/QN7Z0abZaKeErpTF3RsAdcKMr
         2wNP5cn0mRpE7aPFzCJo129/AFLNkLmq8m9/1TCdq8uW6abeJJHVR57svyL7foxoqI
         uoZKJflTtqJCFkS9NUfUPRyU2Jyr5hy8XK/PcP7E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC8D560112
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 08/14] dt-bindings: qcom,pdc: Add compatible for sc7180
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        swboyd@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-9-rnayak@codeaurora.org> <20191106165632.GA15103@bogus>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <3302bde7-2299-476e-e3cc-35c84a459d63@codeaurora.org>
Date:   Thu, 7 Nov 2019 11:16:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106165632.GA15103@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/6/2019 10:26 PM, Rob Herring wrote:
> On Wed,  6 Nov 2019 12:20:11 +0530, Rajendra Nayak wrote:
>> Add the compatible string for sc7180 SoC from Qualcomm.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Lina Iyer <ilina@codeaurora.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> ---
>>   .../devicetree/bindings/interrupt-controller/qcom,pdc.txt      | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.

Sorry I missed mentioning the delta and the reason for not including your Acked-by.
The previous patch was proposing using just a SoC specific compatible, and this
one adds a SoC independent one along with the SoC specific one as discussed here [1]

[1] https://lkml.org/lkml/2019/11/4/73

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
