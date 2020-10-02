Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02624280BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 02:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbgJBApF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 20:45:05 -0400
Received: from z5.mailgun.us ([104.130.96.5]:27821 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733275AbgJBApF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 20:45:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601599505; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tIPTDeHw77fjXshMc7iSNtvBryZjsLxbooevavI8i74=; b=Z4oLddha5FtOlrqqrzz1+c+zotImxvN6dUck4/7vQJJiYmkbImG7FylW6D/qFac1IBXV5+/Y
 adGFZkxzbKy7YLuQqTdJyjJ9DRiG5yCqzBCDRFvO2mHnJ+78yX+D0KBsFS+t+Lzn0xsvEKJ6
 denEzzltj4lrX/JIjugSWtOMQYE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f767811726b122f31eae16e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Oct 2020 00:45:05
 GMT
Sender: collinsd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 50022C433CA; Fri,  2 Oct 2020 00:45:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.160.165] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: collinsd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AA208C433C8;
        Fri,  2 Oct 2020 00:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA208C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=collinsd@codeaurora.org
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
To:     Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
 <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
 <20201001174326.GT6715@sirena.org.uk>
 <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
From:   David Collins <collinsd@codeaurora.org>
Message-ID: <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org>
Date:   Thu, 1 Oct 2020 17:45:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/1/20 11:51 AM, Stephen Boyd wrote:
> Quoting Mark Brown (2020-10-01 10:43:26)
>> On Wed, Sep 30, 2020 at 05:07:20PM -0700, Stephen Boyd wrote:
>>> Quoting David Collins (2020-09-22 15:04:18)
>>
>>>> This helps to disambiguate SPMI device regmaps from I2C ones
>>>> at /sys/kernel/debug/regmap since I2C devices use a very
>>>> similar naming scheme: 0-0000.
>>
>>> Can regmap debugfs prepend the bus name on the node made in debugfs?
>>> Does it do that already?
>>
>> It doesn't do that.  I have to say that given the use of dev_name() in
>> logging it does feel like it'd be useful to have distinct names for
>> grepping if we're running into collisions, IIRC the reason I went with
>> dev_name() was that it's a commonly used human readable handle for
>> diagnostic infrastrucuture so it makes it easier to follow things around.
> 
> To me the dev_name() usage seems fine. Maybe David has some real reason
> to change this though?
> 
> In general I don't think userspace cares what the SPMI device name is,
> i.e. the device name isn't used for dev nodes because SPMI doesn't
> support ioctls or read/write APIs on the bus. That could be a nice
> feature addition though, to support something like i2c-dev.
> 
> Changing it so that regmap debugfs is less likely to collide looks
> weird. It doesn't actually collide anyway, so it seems like we're adding
> spmi prefix to make it easier to find in debugfs?

Yes, that is correct.  There isn't a collision since I2C uses 0-0000 and
SPMI uses 0-00 naming scheme.  However, those names are very similar and
it is hard for a user to tell which is which inside
/sys/kernel/debug/regmap without a deep understanding of the I2C and SPMI
code.

The SPMI regmap debugfs files are used extensively for testing and debug
purposes internally at Qualcomm and by our customers.  It would be helpful
if the more verbose naming scheme were accepted upstream to avoid
confusion and broken test scripts.

Thanks,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
