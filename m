Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE1D28D7BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 02:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgJNA7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 20:59:51 -0400
Received: from z5.mailgun.us ([104.130.96.5]:23901 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728763AbgJNA7u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 20:59:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602637189; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DC2/woCDg8293TlIy38cX+G3vDsQg2CODto9+XPlpsI=; b=f3bh0rpzT4xFqcYWldmWl9jfnKYqmJxn93PxrouAK0GahDxAxIb3ukrYq0UfjWp8u+WI5irN
 mgN7YeOLCdwlsDBk5Q2WGnNoIo0B5y2YnB6Z6Lf1eftTj9NW4L57kekZSUOwcwzoZXCzUxnj
 6ss8zZmi4PfrbBBZ2a3beQEtpQk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f864d84319d4e9cb5eada43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 00:59:48
 GMT
Sender: collinsd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6611C433F1; Wed, 14 Oct 2020 00:59:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.160.165] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: collinsd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 59140C433C9;
        Wed, 14 Oct 2020 00:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 59140C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=collinsd@codeaurora.org
Subject: Re: [RESEND PATCH] spmi: prefix spmi bus device names with "spmi"
To:     Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1600812258-17722-1-git-send-email-collinsd@codeaurora.org>
 <160151084091.310579.3876905878885019200@swboyd.mtv.corp.google.com>
 <20201001174326.GT6715@sirena.org.uk>
 <160157827040.310579.12112194764912078296@swboyd.mtv.corp.google.com>
 <7c45b147-f1d2-4b32-9e51-71c5d2cb576f@codeaurora.org>
 <20201002160324.GE5527@sirena.org.uk>
 <160166091282.310579.8553391053258607173@swboyd.mtv.corp.google.com>
 <20201002180430.GG5527@sirena.org.uk>
 <160167477566.310579.12040108464021349450@swboyd.mtv.corp.google.com>
From:   David Collins <collinsd@codeaurora.org>
Message-ID: <79326f1b-cd0a-50c2-db11-8b5a0f711cd3@codeaurora.org>
Date:   Tue, 13 Oct 2020 17:59:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160167477566.310579.12040108464021349450@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/2/20 2:39 PM, Stephen Boyd wrote:
> I see things like this on my console:
> 
> [    1.684617] spmi spmi-0: PMIC arbiter version v5 (0x50000000)
> 
> and 'spmi' is the bus name I'm thinking about. But I think that's
> because there isn't a driver attached. Nothing prints for the 0-00
> device by default, so I enabled the debug print for it and I see
> 
> [    1.693280] pmic-spmi 0-00: 28: unknown v2.0
> 
> Anyway, the device name was written to follow i2c as far as I can tell.
> 
> If scripts, i.e. computers, have a hard time figuring out the name of
> the device then fix the script?

I agree that we can drop this patch.  There is no technical requirement
for the spmi device naming scheme to be changed.  We will update our
downstream test scripts to use the upstream naming scheme and also
socialize the naming difference internally.

Take care,
David

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
