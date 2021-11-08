Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B78447ABB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 08:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237014AbhKHHQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 02:16:58 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:19661 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236991AbhKHHQ5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 02:16:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636355653; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=H3Py7jP2GUA5VQ+q4AwPW7QOOVIpCHp+rEOb0D+S1h0=;
 b=w/M1NKQ2VfMp83iBI3/h2jwuUo7H6Qd41kyKAn6Cg05cvXsOF7IA5gAz0iIipf0ZoT8bYuSu
 xAuqOeOjAls/aKC6MuTZ6J0Cg6S81FCTyjWwHmGaNvJjznUBRFSXXw/8eJ+kMPqQp2BrMxG9
 T7s6FEtQZOf1glV7u7D6ClqlN3k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6188ce3e4596a04707217f4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 07:14:06
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3822CC43618; Mon,  8 Nov 2021 07:14:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 550D8C4338F;
        Mon,  8 Nov 2021 07:14:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Nov 2021 15:14:02 +0800
From:   tjiang@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org,
        yahuan@qti.qualcomm.com
Subject: Re: [PATCH v2] Bluetooth: btusb: Add the new support IDs for WCN6855
In-Reply-To: <0ce5a54881f72766e845ec72b4db0752@codeaurora.org>
References: <0f45bb361c49a2000508d6efa4d185f8@codeaurora.org>
 <B9C317D2-8ACB-4E69-9E41-8256F3F3B606@holtmann.org>
 <412f59a8f505fce364a2a93bc54f96bc@codeaurora.org>
 <0ce5a54881f72766e845ec72b4db0752@codeaurora.org>
Message-ID: <159e430f80f7bc0d208b23c10488c179@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel:
   could you help answer my query , need your help , thank you.

regards.
tim


On 2021-11-01 16:32, tjiang@codeaurora.org wrote:
> Hi Marcel:
>   could you help check my query ? and could you also share the code
> for "what we have done for the Intel
>>> unification of its hardware"?  thank you.
> 
> regards.
> tim
> 
> On 2021-10-26 18:30, tjiang@codeaurora.org wrote:
>> Hi Marcel:
>>   please see inline comments.
>> 
>> regards.
>> tim
>> 
>> On 2021-10-25 21:29, Marcel Holtmann wrote:
>>> Hi
>>> 
>>>> On Oct 21, 2021, at 10:50, tjiang@codeaurora.org wrote:
>>>> 
>>>> Add the more IDs to usb_device_id table for WCN6855.
>>>> 
>>>> -Device(0489:e0cc) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0cc Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0c9) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0c9 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0d6) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0d6 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0e3) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0e3 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0d0) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0d0 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0df) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0df Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(0489:e0e1) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=0489 ProdID=e0e1 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(04ca:3025) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=04ca ProdID=3025 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(10ab:9608) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=10ab ProdID=9608 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(10ab:9609) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=10ab ProdID=9609 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(10ab:9308) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=10ab ProdID=9308 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> -Device(10ab:9309) from /sys/kernel/debug/usb/devices
>>>> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
>>>> D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
>>>> P:  Vendor=10ab ProdID=9309 Rev= 0.01
>>>> C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
>>>> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
>>>> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>>>> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
>>>> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
>>>> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
>>>> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
>>>> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
>>>> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
>>>> I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
>>>> I:  If#= 1 Alt= 7 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
>>>> E:  Ad=83(I) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> E:  Ad=03(O) Atr=01(Isoc) MxPS=  65 Ivl=1ms
>>>> 
>>>> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
>>>> ---
>>>> drivers/bluetooth/btusb.c | 37 +++++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 37 insertions(+)
>>>> 
>>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>>> index 87b71740fad8..dd138e54aaab 100644
>>>> --- a/drivers/bluetooth/btusb.c
>>>> +++ b/drivers/bluetooth/btusb.c
>>>> @@ -295,6 +295,43 @@ static const struct usb_device_id 
>>>> blacklist_table[] = {
>>>> 	{ USB_DEVICE(0x0cf3, 0xe600), .driver_info = BTUSB_QCA_WCN6855 |
>>>> 						     BTUSB_WIDEBAND_SPEECH |
>>>> 						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0cc), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0c9), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0d6), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0e3), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0d0), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0df), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x0489, 0xe0e1), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x04ca, 0x3025), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x10ab, 0x9608), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x10ab, 0x9609), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x10ab, 0x9308), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +	{ USB_DEVICE(0x10ab, 0x9309), .driver_info = BTUSB_QCA_WCN6855 |
>>>> +						     BTUSB_WIDEBAND_SPEECH |
>>>> +						     BTUSB_VALID_LE_STATES },
>>>> +
>>> 
>>> why is this not using USB_VENDOR_AND_INTERFACE_INFO and a Qualcomm
>>> specific hdev->setup routine is figuring out works features are
>>> support or quirks are needed.
>>> 
>>> The USB blacklist should really only be used if the driver can not
>>> figure it out by itself. See what we have done for the Intel
>>> unification of its hardware.
>> [Tim] Hi Marcel: I see the vendorID is 0x0489 and 0x04ca have been
>> used by BRCM, the code as following:
>> 
>>  132     /* Foxconn - Hon Hai */
>>  133     { USB_VENDOR_AND_INTERFACE_INFO(0x0489, 0xff, 0x01, 0x01),
>>  134       .driver_info = BTUSB_BCM_PATCHRAM },
>>  135
>>  136     /* Lite-On Technology - Broadcom based */
>>  137     { USB_VENDOR_AND_INTERFACE_INFO(0x04ca, 0xff, 0x01, 0x01),
>>  138       .driver_info = BTUSB_BCM_PATCHRAM },
>> 
>> how to handle this case ? thank you.
>> 
>>> 
>>> Regards
>>> 
>>> Marcel
