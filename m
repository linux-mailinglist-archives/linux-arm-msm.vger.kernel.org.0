Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1408347247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 08:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhCXHTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 03:19:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57690 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232827AbhCXHTL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 03:19:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616570349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LNxz6dk8N6Qim1jk1gv3DRN8orM2zCPzuP4pcushAnw=;
        b=jMPvQvEUPMzDW4rTi//xjb32aJhjzju/YQBK0RtGA0HaqCuWqiuqX4ysCShH/bIYEuhkwx
        S4vO7GM0Y7RkkulSzkw0oJV3lAlpQ+2xIrXKH8PtSjK3VqRcYA2OuKeD+gleJYWL9qqMc3
        2k/7LtCyavvx94+pSXnjH3VSFmvIcTY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-E1SwgSwUPy2awTBqoFY3Bw-1; Wed, 24 Mar 2021 03:19:06 -0400
X-MC-Unique: E1SwgSwUPy2awTBqoFY3Bw-1
Received: by mail-ej1-f70.google.com with SMTP id a22so493930ejx.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Mar 2021 00:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LNxz6dk8N6Qim1jk1gv3DRN8orM2zCPzuP4pcushAnw=;
        b=LLWzn7pPVxNnzHflk/Nd3/cwMiAJTXWbJ1aeh+QCPTpPdnyaa6vAsLYkfI0Miya7SH
         c3IFd09gjMugEtl86jwZjVWBQVlRnzZV6TRnn9s6w6I2euo7FAgz8pmpxmrSA3ZpNZ32
         1IGLun8AKt+eHvjdRmPCpH1EySBlqks6zDJA3R9DeWQcRQZzAePNzRqjDcNs4j4GosPb
         kmOT5AZznMr/lNt5H7FqdkozPcqawpPec/YId/UE7S3uZdalHdTXru27ZSrLwq9H1KEm
         lFdmonU7xBYrDFuxgl7tvEBxHCCY/hi8BP5VGVZAOzhNRa7ggo2tHK1Tl51bN++35ZQT
         CFLQ==
X-Gm-Message-State: AOAM531oFORBCsaZHqg5qrp6MukCJyh3PuFQkckngiTAycMYOHxUDGJZ
        s/qKSTG3EY5aFNNiOG4kk5rRJpQ4nWBIMtBVUrn85Pjlr5IgMvv6iTsyRpIYxZ8WpbTKmRgzlSJ
        08FezBxnGzv4EKH3V91tPWHBdGw==
X-Received: by 2002:a05:6402:50c8:: with SMTP id h8mr1863234edb.360.1616570345811;
        Wed, 24 Mar 2021 00:19:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlbfdmREJxME+JRNtvUW27K2DsKI6/XR8AbALCh74d7s9kMg/MD7c5V9abhKL5/x66UnXfjg==
X-Received: by 2002:a05:6402:50c8:: with SMTP id h8mr1863215edb.360.1616570345634;
        Wed, 24 Mar 2021 00:19:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i11sm484830ejf.76.2021.03.24.00.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 00:19:05 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] extconn: Clean-up few drivers by using managed
 work init
To:     matti.vaittinen@fi.rohmeurope.com,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <CGME20210323135719epcas1p326dfbf8acd6c95703a30d832fb111879@epcas1p3.samsung.com>
 <b1030eddbf0069f2d39e951be1d8e40d6413aeeb.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <14800e19-da8c-81ba-48ee-cc51cc1925c9@samsung.com>
 <1f5247a81077f6cb3c96730b1202bbd61dd1900b.camel@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <efc4359d-9c2c-9115-7cee-b9f6eb51539c@redhat.com>
Date:   Wed, 24 Mar 2021 08:19:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f5247a81077f6cb3c96730b1202bbd61dd1900b.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/24/21 6:02 AM, Matti Vaittinen wrote:
> Hello Chanwoo, Greg,
> 
> Thanks for the review.
> 
> On Wed, 2021-03-24 at 11:09 +0900, Chanwoo Choi wrote:
>> Hi,
>>
>> Need to fix the work as following:
>> s/extconn/extcon
>>
>> And I'd like you to use the more correct patch title like the
>> following example:
>> "extcon: Use resource-managed function for delayed work"
> 
> I think Greg merged this already. How should we handle this?
> 
>> @@ -112,7 +113,9 @@ static int gpio_extcon_probe(struct
>>> platform_device *pdev)
>>>  	if (ret < 0)
>>>  		return ret;
>>>  
>>> -	INIT_DELAYED_WORK(&data->work, gpio_extcon_work);
>>> +	ret = devm_delayed_work_autocancel(dev, &data->work,
>>> gpio_extcon_work);
>>> +	if (ret)
>>> +		return ret;
>>
>> Need to add the error log as following:
>> 	if (ret) {
>> 		dev_err(dev, "Failed to initialize delayed_work");
>> 		return ret;
>> 	}	
> 
> I could send incremental patch to Greg for this but it does not change
> the commit message.

We cannot do anything about the commit message anymore, but the ordering
issue which you introduced really needs to be fixed.

Please send an incremental patch fixing the wrong order and the double
init of the workqueue.

Regards,

Hans

