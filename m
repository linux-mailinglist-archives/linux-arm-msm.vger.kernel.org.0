Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21F22146137
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 05:55:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWEza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 23:55:30 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:15605 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726135AbgAWEz3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 23:55:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579755329; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=99PdJyM1Ez87NeZe2HjnZWq1VMrDCTFIbcSGdc8l8U4=;
 b=M+sOXDa4QLTMhDi0V/ee1rWESsruOmqLurQgo2Kdr+MnL7Q4TPk7zclR/hQ7Ie07zmreU0tL
 /wqrS8Hx0x7gLAW4HGyaAG+mnE1dSn/sCOOeuVEiWnOpxhk4Hwo5Oj7QH+QiofA5bQZ3o8zQ
 jUx21kGOfcIbgAj/QhQw+kOCAQk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29273d.7fc7ea9d0d88-smtp-out-n01;
 Thu, 23 Jan 2020 04:55:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 824BDC433CB; Thu, 23 Jan 2020 04:55:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99255C43383;
        Thu, 23 Jan 2020 04:55:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Jan 2020 10:25:24 +0530
From:   kgunda@codeaurora.org
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Chen Zhou <chenzhou10@huawei.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, b.zolnierkie@samsung.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison to
 zero
In-Reply-To: <20200122105540.w5vrvs34zxmhkjae@holly.lan>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
 <20200122105540.w5vrvs34zxmhkjae@holly.lan>
Message-ID: <c9da004a1110b51d1737fe773901678b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-22 16:25, Daniel Thompson wrote:
> On Wed, Jan 22, 2020 at 09:32:40AM +0800, Chen Zhou wrote:
>> Fixes coccicheck warning:
>> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
>> 	WARNING: Unsigned expression compared with zero: string_len > 0
>> 
>> The unsigned variable string_len is assigned a return value from the 
>> call
>> to of_property_count_elems_of_size(), which may return negative error 
>> code.
>> 
>> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for 
>> WLED3")
>> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
Reviewed-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>> 
>> changes in v2:
>> - fix commit message description.
>> 
>> ---
>>  drivers/video/backlight/qcom-wled.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index d46052d..3d276b3 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  	struct wled_config *cfg = &wled->cfg;
>>  	struct device *dev = wled->dev;
>>  	const __be32 *prop_addr;
>> -	u32 size, val, c, string_len;
>> -	int rc, i, j;
>> +	u32 size, val, c;
>> +	int rc, i, j, string_len;
>> 
>>  	const struct wled_u32_opts *u32_opts = NULL;
>>  	const struct wled_u32_opts wled3_opts[] = {
>> --
>> 2.7.4
>> 
