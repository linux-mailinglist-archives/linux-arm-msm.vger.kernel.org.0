Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B9F11DE68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 08:07:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbfLMHHL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Dec 2019 02:07:11 -0500
Received: from m228-4.mailgun.net ([159.135.228.4]:42758 "EHLO
        m228-4.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfLMHHK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Dec 2019 02:07:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576220830; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TM9I4rJRMGS2Z/g+a78Bvn/OtzXKQTFlqms85rGn+48=; b=JnS/HHnRhbxxXBKWMIdEbrKDj1mWyOy+Arns8zV6eja92LaWuubHfNFJvoWmjtjHv0qTciPa
 Q+fOUxk+97+5R0ssRmJmOzZikcLV0+jQ1Kd4JNPZWK0lVF/mBOIt6dSnZf1C5PMXqqvGETpz
 EtT9VFczOfaTKfohFMCUgJE6ues=
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df3389b.7f19fc6cdd18-smtp-out-n01;
 Fri, 13 Dec 2019 07:07:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF487C4479F; Fri, 13 Dec 2019 07:07:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.214] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 584B4C43383;
        Fri, 13 Dec 2019 07:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 584B4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH] usb: dwc3: qcom: Remove useless compatible strings from
 the match table
To:     Douglas Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20191212132122.1.I85a23bdcff04dbce48cc46ddb8f1ffe7a51015eb@changeid>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <3fc8f36f-9ca2-7b56-9f1f-94507481b715@codeaurora.org>
Date:   Fri, 13 Dec 2019 12:37:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212132122.1.I85a23bdcff04dbce48cc46ddb8f1ffe7a51015eb@changeid>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks. Patch looks good to me.

On 12/13/2019 2:51 AM, Douglas Anderson wrote:
> The of match table in dwc3-qcom.c had an entry per Qualcomm SoC known
> to have dwc3.  That's not needed.  Here's why:
>
> 1. The bindings specify that the compatible string in the device tree
>    should contain the SoC-specific compatible string followed by the
>    string "qcom,dwc3".
>
> 2. All known Qualcomm SoC dts files (confirmed via git grep in
>    mainline Linux) using dwc3 follow the rules and do, in fact,
>    contain the SoC-specific compatible string followed by the string
>    "qcom,dwc3".
>
> 3. The source code does nothing special with the per-SoC strings--they
>    are only used to match the node.
>
> Let's remove the extra strings from the table.  Doing so will avoid
> the need to land future useless patches [1] that do nothing more than
> add yet more strings to the table.

Reviewed-by: Manu Gautam <mgautam@codeaurora.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
