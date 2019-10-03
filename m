Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9806CCADFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 20:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387643AbfJCSRo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 14:17:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55136 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731113AbfJCSRo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 14:17:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5281E60112; Thu,  3 Oct 2019 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570126662;
        bh=xIqGqW0piKiXUEqR/RPS5JaWIHumHlqdtcjkLnL5uH8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=B1MkE0cIx5kNzPL7VzqfuaywF4O4399544rZoFcRj1d+HXWwQiemu6nBSRc81nBgQ
         42IsRZbwmDM2ZLg98JPtr/lIvaCEvqSRfB/Mw0iSQRJkOxvhODbCjlh5oHY/YnQDVx
         f2nBRI7gt3ur56gpIAyLpiwtaN0W5keO8PcJ/Hk8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 0587B60112;
        Thu,  3 Oct 2019 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570126660;
        bh=xIqGqW0piKiXUEqR/RPS5JaWIHumHlqdtcjkLnL5uH8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ceR0uFZFvg7YiG94VsMZQHuxWzrPrKkG3DHt0nbfPwoFKq4muZCdgi8jhy1adG+r0
         CilfgCJ6ahfzK5CBuBuY1J1DxIaabRinKaZ405sHJbKUn2RcGaLmcyo8r7Wzq/dBuc
         X4Y8To2O0+RotsF52BviWWHqkewTzU3HnVEn43jI=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Oct 2019 11:17:39 -0700
From:   mnalajal@codeaurora.org
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     rafael@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] base: soc: Handle custom soc information sysfs entries
In-Reply-To: <20191003070502.GB1814133@kroah.com>
References: <1570061174-4918-1-git-send-email-mnalajal@codeaurora.org>
 <20191003070502.GB1814133@kroah.com>
Message-ID: <dd126bd256feb2e32f38409b2a7ba5cc@codeaurora.org>
X-Sender: mnalajal@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-03 00:05, Greg KH wrote:
> On Wed, Oct 02, 2019 at 05:06:14PM -0700, Murali Nalajala wrote:
>> Soc framework exposed sysfs entries are not sufficient for some
>> of the h/w platforms. Currently there is no interface where soc
>> drivers can expose further information about their SoCs via soc
>> framework. This change address this limitation where clients can
>> pass their custom entries as attribute group and soc framework
>> would expose them as sysfs properties.
>> 
>> Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
>> ---
>>  drivers/base/soc.c      | 26 ++++++++++++++++++--------
>>  include/linux/sys_soc.h |  1 +
>>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> Can you change a soc driver to use this?  I don't think that this patch
> works because:
> 
>> 
>> diff --git a/drivers/base/soc.c b/drivers/base/soc.c
>> index 7c0c5ca..ec70a58 100644
>> --- a/drivers/base/soc.c
>> +++ b/drivers/base/soc.c
>> @@ -15,6 +15,8 @@
>>  #include <linux/err.h>
>>  #include <linux/glob.h>
>> 
>> +#define NUM_ATTR_GROUPS 3
>> +
>>  static DEFINE_IDA(soc_ida);
>> 
>>  static ssize_t soc_info_get(struct device *dev,
>> @@ -104,11 +106,6 @@ static ssize_t soc_info_get(struct device *dev,
>>  	.is_visible = soc_attribute_mode,
>>  };
>> 
>> -static const struct attribute_group *soc_attr_groups[] = {
>> -	&soc_attr_group,
>> -	NULL,
>> -};
>> -
>>  static void soc_release(struct device *dev)
>>  {
>>  	struct soc_device *soc_dev = container_of(dev, struct soc_device, 
>> dev);
>> @@ -121,6 +118,7 @@ static void soc_release(struct device *dev)
>>  struct soc_device *soc_device_register(struct soc_device_attribute 
>> *soc_dev_attr)
>>  {
>>  	struct soc_device *soc_dev;
>> +	const struct attribute_group **soc_attr_groups = NULL;
>>  	int ret;
>> 
>>  	if (!soc_bus_type.p) {
>> @@ -136,10 +134,20 @@ struct soc_device *soc_device_register(struct 
>> soc_device_attribute *soc_dev_attr
>>  		goto out1;
>>  	}
>> 
>> +	soc_attr_groups = kzalloc(sizeof(*soc_attr_groups) *
>> +						NUM_ATTR_GROUPS, GFP_KERNEL);
>> +	if (!soc_attr_groups) {
>> +		ret = -ENOMEM;
>> +		goto out2;
>> +	}
>> +	soc_attr_groups[0] = &soc_attr_group;
>> +	soc_attr_groups[1] = soc_dev_attr->custom_attr_group;
>> +	soc_attr_groups[2] = NULL;
> 
> You set this, but never do anything with it that I can see.  What am I
> missing?
no, since i am using the "soc_attr_groups" name as it here you do not 
see the assignment below.
It is something like this soc_dev->dev.groups = soc_attr_groups;
> 
>> +
>>  	/* Fetch a unique (reclaimable) SOC ID. */
>>  	ret = ida_simple_get(&soc_ida, 0, 0, GFP_KERNEL);
>>  	if (ret < 0)
>> -		goto out2;
>> +		goto out3;
>>  	soc_dev->soc_dev_num = ret;
>> 
>>  	soc_dev->attr = soc_dev_attr;
>> @@ -151,14 +159,16 @@ struct soc_device *soc_device_register(struct 
>> soc_device_attribute *soc_dev_attr
>> 
>>  	ret = device_register(&soc_dev->dev);
>>  	if (ret)
>> -		goto out3;
>> +		goto out4;
>> 
>>  	return soc_dev;
>> 
>> -out3:
>> +out4:
>>  	ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
>>  	put_device(&soc_dev->dev);
>>  	soc_dev = NULL;
>> +out3:
>> +	kfree(soc_attr_groups);
>>  out2:
>>  	kfree(soc_dev);
>>  out1:
> 
> You don't free it when the soc is removed?
agree, will fix it in my next patch.
> 
> thanks,
> 
> greg k-h
These changes are verified at my side on SM8250 with mode static 
compilation and module.
