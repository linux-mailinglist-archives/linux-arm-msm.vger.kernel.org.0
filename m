Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2024211A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 22:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgHKUID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 16:08:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40752 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbgHKUID (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 16:08:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597176483; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c+Gm6+UBSxuYp9eQxZTBOgGyHEhfY4Etd44uMrLVLZ0=; b=CORzZNnbtc4jD+rGXEx/4D4hSIeY3x0uNe8tL1TwF8QVjd8yr+a+FVRd6YZLaJkQyVfiUl6h
 LFq1qnyzx8zfQ76rwv3zOLGUS8sEJzexGYIzk+KabLlHAqg61G8rhkMDOWVc4IRwpjQ9vhYx
 GCjiXsqRMdhaIYVrY9JGXp+a+iY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f32fa881e4d3989d463c31e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 11 Aug 2020 20:07:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7914CC433C9; Tue, 11 Aug 2020 20:07:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.160] (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sanm)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9083C433CA;
        Tue, 11 Aug 2020 20:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9083C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sanm@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: gcc: Add genpd active wakeup flag for
 sc7180
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1591885683-29514-1-git-send-email-sanm@codeaurora.org>
 <1591885683-29514-2-git-send-email-sanm@codeaurora.org>
 <159191561875.242598.18326727418245335996@swboyd.mtv.corp.google.com>
 <159683666176.1360974.5500366475077976771@swboyd.mtv.corp.google.com>
From:   "Sandeep Maheswaram (Temp)" <sanm@codeaurora.org>
Message-ID: <257c6fbf-336f-b416-4ef7-7af83e65d0fa@codeaurora.org>
Date:   Wed, 12 Aug 2020 01:37:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159683666176.1360974.5500366475077976771@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 8/8/2020 3:14 AM, Stephen Boyd wrote:
> Quoting Stephen Boyd (2020-06-11 15:46:58)
>> Quoting Sandeep Maheswaram (2020-06-11 07:28:02)
>>> From: Taniya Das <tdas@codeaurora.org>
>>>
>>> The USB client requires the usb30_prim gdsc to be kept active for
>>> certain use cases, thus add the GENPD_FLAG_ACTIVE_WAKEUP flag.
>> Can you please describe more of what this is for? Once sentence doesn't
>> tell me much at all. I guess that sometimes we want to wakeup from USB
>> and so the usb gdsc should be marked as "maybe keep on for wakeups" with
>> the GENPD_FLAG_ACTIVE_WAKEUP flag if the USB controller is wakeup
>> enabled?
>>
>>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>>> ---
>> Add a Fixes: tag too? And I assume we need to do this for all USB gdscs
>> on various SoCs and maybe other GDSCs like PCIe. Any plans to fix those
>> GDSCs?
>>
> Any update here?

I moved this change to usb driver code dwc3-qcom.c in v2 of this series https://patchwork.kernel.org/cover/11652281/
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

