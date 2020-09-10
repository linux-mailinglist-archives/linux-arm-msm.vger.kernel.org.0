Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A5A263D34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 08:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgIJGYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 02:24:41 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:33474
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726228AbgIJGYd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 02:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599719072;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=sw5/57ZGcdqOaLzApeRTgEINqFme0CmU64O/ouWdLzQ=;
        b=kwO7rFfPQV8eA+r9XtGKWrUuPxQ5GhAiYGbkCRPqM6+n0HNCBF57+m9yF0ssblTw
        usspULVUyKIcWQ6II/wi6v6/kxE1IfvISiJ5LE1ST4zSCfGkCg/ztL2bsrcK9Z5YyZD
        v6JX76SDLQ1tor0C7L/yYdPhBYhQn///1WV3tTpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599719072;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=sw5/57ZGcdqOaLzApeRTgEINqFme0CmU64O/ouWdLzQ=;
        b=bxeCA5GEbpgfh1xQtCEQIE3Tb/gHtffkU15OBfmSb57CCPeAsBJPtGEFqBfE3uwu
        QfmjI9J3mh/P1xjDSbBl7j3bwH9kWTBqtjltNlGMDIiXLLX5wZwTeHZVCpvHUUJ/HgK
        gBcFnoPXAacS94jXU6U/ljiZI/pkSFmk9OKxim+o=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 10 Sep 2020 06:24:32 +0000
From:   parashar@codeaurora.org
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
        akashast@codeaurora.org
Subject: Re: [PATCH] serial: qcom_geni_serial: To correct QUP Version
 detection logic
In-Reply-To: <20200902060435.GA141898@kroah.com>
References: <1599026211-12800-1-git-send-email-parashar@codeaurora.org>
 <20200902060435.GA141898@kroah.com>
Message-ID: <0101017476afe173-62ad03fb-2f46-4f50-82f3-6967630a8ee0-000000@us-west-2.amazonses.com>
X-Sender: parashar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.10-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-02 11:34, Greg Kroah-Hartman wrote:
> On Wed, Sep 02, 2020 at 11:26:51AM +0530, Paras Sharma wrote:
>> The current implementation reduces the sampling rate by half
>> if qup HW version is  greater is than 2.5 by checking if the
>> geni SE major version is greater than 2 and geni SE minor version
>> is greater than 5.
>> 
>> This implementation fails when the version is 3 or greater.
>> 
>> Hence new implementation checks if version is greater than or equal
>> to 0x20050000 which would work for any future version.
>> 
>> Signed-off-by: Paras Sharma <parashar@codeaurora.org>
>> ---
>>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Is this a v2 patch?  What changed from the first one?

This patch is in continuation of 
https://patchwork.kernel.org/patch/11708805/ .
It should have been V3 , i will correct it in my next patch .
In the previous version ,i had added a new condition to separately check 
if QUP se major version is greater than or equal to 3.
In this ,i replaced the older logic of separately checking major and 
minor versions for 2.5 and 3 with value of Qup version 0x20050000 .
This checks for version greater than 2.5 directly.
This would reduce the logic and will work for any future versions.

> 
>> 
>> diff --git a/drivers/tty/serial/qcom_geni_serial.c 
>> b/drivers/tty/serial/qcom_geni_serial.c
>> index f0b1b47..e18b431 100644
>> --- a/drivers/tty/serial/qcom_geni_serial.c
>> +++ b/drivers/tty/serial/qcom_geni_serial.c
>> @@ -1000,7 +1000,7 @@ static void qcom_geni_serial_set_termios(struct 
>> uart_port *uport,
>>  	sampling_rate = UART_OVERSAMPLING;
>>  	/* Sampling rate is halved for IP versions >= 2.5 */
>>  	ver = geni_se_get_qup_hw_version(&port->se);
>> -	if (GENI_SE_VERSION_MAJOR(ver) >= 2 && GENI_SE_VERSION_MINOR(ver) >= 
>> 5)
>> +	if (ver >= 0x20050000)
> 
> That's an odd "magic value", can't you use the existing macros to 
> define
> this somehow so it makes sense?

The stable tag is not required because the board supporting version > 
3 is not in any of the previous kernel versions.
I will define a separate macro for this value in my next patch.

> 
> thanks,
> 
> greg k-h
