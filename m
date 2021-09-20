Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51724127CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 23:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234560AbhITVRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 17:17:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48323 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233874AbhITVPZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 17:15:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632172437; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4ijXYlmqoMPuqo2n4/kMk/32yQvABM55JAadYGLqsTw=; b=OlgpWG+x8uE3VLtndh8JbhdRjXNeHAyy1qzU3kuXAsvN+TjFYxXRS5nKCBj0Z/0Mg2RrdPt+
 9sgOSWH2LEo9WfEOjdvJW9C8hhK0paYhSy6s1E/s/hIz7PJuIrD4N5kjgs+eW1a0aksakSIn
 oJmkJZfVIuahg5P5QEI6vak4bow=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6148f99565c3cc8c63e8b31a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 21:13:57
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 07FD0C43460; Mon, 20 Sep 2021 21:13:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.26] (075-140-094-099.biz.spectrum.com [75.140.94.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 835BAC43460;
        Mon, 20 Sep 2021 21:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 835BAC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: dwc3-qcom: tx-fifo-resize regression on Poco F1 (sdm845) with
 v5.15-rc1
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-usb@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>
References: <CAMi1Hd3k2snB4-=M57pVrMVom=a9_2a0DTFk-+Hzpubwk-Pr9Q@mail.gmail.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <64a2a428-8bb1-0078-2403-1ca8e28cf4b1@codeaurora.org>
Date:   Mon, 20 Sep 2021 14:13:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMi1Hd3k2snB4-=M57pVrMVom=a9_2a0DTFk-+Hzpubwk-Pr9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Amit,

On 9/20/2021 1:45 PM, Amit Pundir wrote:
> Hi Wesley, All,
> 
> I see a reboot loop on Xiaomi Pocophone F1 (sdm845) with TX FIFO
> resize patches which landed in v5.15-rc1. Upstream commit cefdd52fa045
> "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default" to
> be specific, which switched on this feature by default.
> 
> At times the phone crashes into the fastboot mode after the reboot
> loop, but mostly end up booting to UI after a while. This is what it
> looks like https://people.linaro.org/~amit.pundir/beryllium-userdebug/PXL_20210920_162749483.mp4.
> 

I believe Android will attempt a number of bootup sequences and if it
fails, it falls back to fastboot mode.  Are there any available logs you
might be able to collect to see where the issue is?

> PocoF1 does support TX fifo resizing as I can see that in the
> downstream dts. So maybe it is the tx-fifo-max-num which need to be
> adjusted for the device? I couldn't find the tx-fifo-max-num
> equivalent in the downstream tree though
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/dipper-q-oss/
> 

I assume that you've already confirmed reverting that change resolves
the constant reboots?

> Curious if you had any ideas what might be going wrong? For now I'll
> keep digging around tx-fifo-max-num, but I figured I'd ask just in
> case it's obvious to you.
> 

The tx-fifo-max-num parameter should still be set to 6 for SDM845, which
would be the same for more recent targets as well.

Thanks
Wesley Cheng

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
