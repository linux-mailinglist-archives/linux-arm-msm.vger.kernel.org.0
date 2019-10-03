Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9697CB26E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 01:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbfJCXoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 19:44:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCXoD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 19:44:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 81EEA619F9; Thu,  3 Oct 2019 23:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570146242;
        bh=xXDm0IoORHj+KX8F1sz/PoDzwJGxR7sIGiaUfIuABsw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KR7A3mH7C+soXw/x+zvhVHMDvFVVv3Sk1luB6/MzqX3E7wBg+6U+5ItB3C88BblmD
         uqfR0Wbmbwuo8S1wmoS5LNfihdnPUP6yM0mAZJQ2dlVvHB08yhIJo8x5DhiUlWzM8w
         8VY8FqJ39MXqnjgxESDDcjhmZhkaDDYQDt+EbA0E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 87D3A60312;
        Thu,  3 Oct 2019 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570146241;
        bh=xXDm0IoORHj+KX8F1sz/PoDzwJGxR7sIGiaUfIuABsw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PkAGomt4xIPzFsTZVyOVW7bdskfgFjepad90CJajiQKHg/tIPchzxlSFyF6W8eRZQ
         sPGBFTL2tjjvDK6bejFbQRslnRJF3zb/ft2VPErHTwTWKwVInCM1eyt3uaKkOL80nt
         58rQ0eiaWe0S6IZVvSJtE2VDZeRdBzjG+eOmVPvs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Oct 2019 16:44:01 -0700
From:   mnalajal@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
In-Reply-To: <5d9682d5.1c69fb81.4efda.d786@mx.google.com>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <5d9682d5.1c69fb81.4efda.d786@mx.google.com>
Message-ID: <ce2f11601c3d2203069487b7bc2364d8@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-03 16:22, Stephen Boyd wrote:
> Quoting Murali Nalajala (2019-10-02 17:06:14)
>> @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
>>  struct soc_device *soc_device_register(struct soc_device_attribute 
>> *soc_dev_attr)
>>  {
>>         struct soc_device *soc_dev;
>> +       const struct attribute_group **soc_attr_groups = NULL;
> 
> Don't initialize this to NULL because it is only tested after it's been
> unconditionally assigned to the result of the allocation.
Done
> 
>>         int ret;
>> 
>>         if (!soc_bus_type.p) {
>> @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct 
>> soc_device_attribute *soc_dev_attr
>>                 goto out1;
>>         }
>> 
>> +       soc_attr_groups = kzalloc(sizeof(*soc_attr_groups) *
> 
> Please use kcalloc() instead and drop the define for NUM_ATTR_GROUPS
> because it's used once.
> 
done
>> +                                               NUM_ATTR_GROUPS, 
>> GFP_KERNEL);
>> +       if (!soc_attr_groups) {
>> +               ret = -ENOMEM;
>> +               goto out2;
>> +       }
>> +       soc_attr_groups[0] = &soc_attr_group;
>> +       soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
>> +       soc_attr_groups[2] = NULL;
> 
> Drop this assignment to NULL because kzalloc() and kcalloc() zero out
> the memory anyway.
done
