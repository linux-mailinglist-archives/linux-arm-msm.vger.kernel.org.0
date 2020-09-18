Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160992702F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgIRRJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:09:55 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:46441 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIRRJz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:09:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600448994; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=thyujIIB3eiKeskRUDzOVjH6lcM4CSCxYjc4gLe9/ZU=;
 b=rlSL2FescMNfhAOHeIJBuhXTqq5MtOTL4YdtC2KO1f8mHgK6djuH553824uTEmx3M+0aFXIX
 hZUP0B92sReSSOovpL4/lOhrB7do++rfSCpXKZ2LZamlKk0dLF2vPa9cApueKLoJd/eE8gvx
 3WsxxjPbKgKZsyrKeAXj6l0g1LE=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f64e99c4ab73023a70f57b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 17:08:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E77EC433FE; Fri, 18 Sep 2020 17:08:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86C4CC433CB;
        Fri, 18 Sep 2020 17:08:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 10:08:43 -0700
From:   bbhatt@codeaurora.org
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] bus: mhi: core: Introduce debugfs entries for MHI
In-Reply-To: <bf24b8fe-8ff3-4ff3-a1f0-c276dcc5832c@infradead.org>
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-3-git-send-email-bbhatt@codeaurora.org>
 <bf24b8fe-8ff3-4ff3-a1f0-c276dcc5832c@infradead.org>
Message-ID: <59df7b450303542c498ff845ea171be4@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-17 16:36, Randy Dunlap wrote:
> On 9/17/20 3:19 PM, Bhaumik Bhatt wrote:
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index a8bd9bd..ae68347 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -12,3 +12,11 @@ config MHI_BUS
>>  	 communication protocol used by the host processors to control
>>  	 and communicate with modem devices over a high speed peripheral
>>  	 bus or shared memory.
>> +
>> +config MHI_BUS_DEBUG
>> +       bool "Debugfs support for the MHI bus"
>> +       depends on MHI_BUS && DEBUG_FS
>> +       help
>> +	 Enable debugfs support for use with the MHI transport. Allows
>> +	 reading and/or modifying some values within the MHI controller
>> +	 for debug and test purposes.
> 
> from Documentation/process/coding-style.rst:
> 
> """For all of the Kconfig* configuration files throughout the source 
> tree,
> the indentation is somewhat different.  Lines under a ``config`` 
> definition
> are indented with one tab, while help text is indented an additional 
> two
> spaces."""
> 
> Several lines above use spaces instead of one tab...
Thank you for pointing out. I will fix this.
