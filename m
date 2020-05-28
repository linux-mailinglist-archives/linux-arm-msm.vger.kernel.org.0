Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7926D1E5BC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 11:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgE1JYX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 05:24:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27467 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728355AbgE1JYW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 05:24:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590657861; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iMb1wbf6uPwfZB8sG11hmQ4ZThGw/6wXcct0WODPnkE=; b=bYK6/6F50m6qbbAxcyUKOFjPTYnd+AvXhPKYpP8yEg+sIaKKJgFTumhzkrqZiVdjWpIG0y4x
 IPYMdeq70yKG5+Hgn2g86J8YItoI11eNEDZld71j4n5rcFVaW1zarHzas7y7ll08AsuAeSP6
 bRaJXIEjV2dEEI30paD7eMF6S9U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ecf8344c6d4683243ce189c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 09:24:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9D2DFC43391; Thu, 28 May 2020 09:24:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BCF3C433C9;
        Thu, 28 May 2020 09:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0BCF3C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
To:     Felipe Balbi <balbi@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org> <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org> <87tv0h3fpv.fsf@kernel.org>
 <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org> <87r1vl3e42.fsf@kernel.org>
 <20200518183512.GE2165@builder.lan>
 <b20775ba-7870-b0ca-7c65-d72a08fdacb2@codeaurora.org>
 <0723aee9-9ea4-dab5-e083-3cf3858a8f96@linaro.org> <871rn63orz.fsf@kernel.org>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <158003c3-6d8a-52c2-cfd6-3904ac7376c5@codeaurora.org>
Date:   Thu, 28 May 2020 14:54:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <871rn63orz.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/26/2020 5:13 PM, Felipe Balbi wrote:
> Hi,
>
> Georgi Djakov <georgi.djakov@linaro.org> writes:
>> On 26.05.20 14:04, Sandeep Maheswaram (Temp) wrote:
>>> Hi Felipe,
>>>
>>> Please let me know how to go forward with this patch
> (don't top-post!)
>
>> Please just add a patch to fix the allmodconfig error. Felipe has
>> suggested to introduce a separate patch which exports the
>> device_is_bound() function. This export should precede the addition
>> of interconnect support.
>>
>> Also regarding the "depends on INTERCONNECT || !INTERCONNECT" change,
>> no "depends on" would be needed, as we just made the interconnect
>> framework bool.
> y'all have lost the current merge window, I guess. I'm not sure Greg
> will take last minute changes to drivers base and I have already sent
> him my pull request for v5.8. On the plus side, this gives you the
> chance to run hundreds of randbuilds with your patches.
Hi  Georgi,

I am assuming that the patch which exports the device_is_bound() function will solve the allmodconfig error.
Or do i need to change anything in dwc3 driver?

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

