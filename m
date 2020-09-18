Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C733227038F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRRxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:53:51 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:46077 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgIRRxv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:53:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600451630; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7lylX8MQHlGZ8MSNHOfJfe7J/XsAMSY6kQActmiQXxs=; b=mrbmyyoJe4GmkkZdwuif9SuaASIQ9B0ye6Oi2vc7hwOfNqVtFsSNlfjlna7r/bnQO3RcoUBY
 OXgSVyMuXT/SS8x8FQrQDakDUNguxfg2d5dLyUcNY635ycXVJgvfiEtasId1fZCvSfOsYzIt
 HRRbvPKgtazlt6gALQ/Q/Gckgac=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f64f42d0915d3035782c6b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:53:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3364DC433CA; Fri, 18 Sep 2020 17:53:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40CB3C433C8;
        Fri, 18 Sep 2020 17:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40CB3C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
 <20200917164047.GB721081@kroah.com>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <c936a8fc-19e4-ff97-3905-2a84c81176f1@codeaurora.org>
Date:   Fri, 18 Sep 2020 10:53:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200917164047.GB721081@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 9/17/20 9:40 AM, Greg KH wrote:
> On Wed, Sep 16, 2020 at 12:56:07PM -0700, Hemant Kumar wrote:
>> +/**
>> + * struct uci_dev - MHI uci device
>> + * @minor: uci device node minor number
>> + * @mhi_dev: associated mhi device object
>> + * @chan: MHI channel name
>> + * @lock: mutex lock
>> + * @ul_chan: uplink uci channel object
>> + * @dl_chan: downlink uci channel object
>> + * @mtu: max tx buffer length
>> + * @actual_mtu: maximum size of incoming buffer
>> + * @open: open called for device node
>> + * @enabled: uci device probed
>> + * @ref_count: uci_dev reference count
>> + */
>> +struct uci_dev {
>> +	unsigned int minor;
>> +	struct mhi_device *mhi_dev;
>> +	const char *chan;
>> +
>> +	/* protects uci_dev struct members */
>> +	struct mutex lock;
>> +
>> +	struct uci_chan ul_chan;
>> +	struct uci_chan dl_chan;
>> +	size_t mtu;
>> +	size_t actual_mtu;
>> +	bool enabled;
>> +	struct kref ref_count;
>> +};
> 
> I don't think you actually made the kernel documentation based on these
> lines.
> 
> Or if you did, you ignored the warnings :(
> 
> Please test build your patches before sending them out...
Thanks for pointing out the kernel doc, it was a miss. i will fix it.
> 
> thanks,
> 
> greg k-h
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
