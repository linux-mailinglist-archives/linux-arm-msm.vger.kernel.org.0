Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBD23B4A00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 23:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFYVM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 17:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYVM2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 17:12:28 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E3F6C061574;
        Fri, 25 Jun 2021 14:10:05 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bu12so17255841ejb.0;
        Fri, 25 Jun 2021 14:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YLp4UmmIH4EvjY1SnVELfqfg13JCZ/SHk9QG66Ll2AA=;
        b=XBAMTlG0HQ8oCA6i+XDh4V80K1yQgg2lNQCY3OwyMEo1zTdjJmMMnNo/mCaz/sAAzW
         P4FeV1e3kExS/V1cjzj4OgxK352AkEYhTzt5j3iQTLq8FuF+GsFx6QeYNR3WkhW8pQdE
         aqTjTEBmsoyLO2HG04BXfGlHFaMiNNTv1C7xFgG7flf0GWJSlu8+BF03cBnRypfM25lQ
         mKBFdFf2/+sRurXGa60x64GPsIePasHGhTSRRFW/74wC1YHErJE23f7P6gtvOuWI9bxY
         rzJ5PBqZiPnpelsQA4yXmzWIqeHA98nvjlt/T8rNfaOlsX/qSbmVVYoJIpzbEeGWrTWi
         t/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YLp4UmmIH4EvjY1SnVELfqfg13JCZ/SHk9QG66Ll2AA=;
        b=BoE+JAl5QPwN0C3pQi8s+y0YyPIHXsamvkV18VkJXC+eEz78jEiK4JNIQIVyFo4i5b
         cskBr3BM4ysZgjgmBI4l/SaCF50fcZgvjRA8gYqsQFv4+RsIOpnGB+M1vhZd/Yr+7/4W
         E2BzqcgCr4kwbZbMi+Bv0T2EZWElUZbv+bSV4sBFEQe7RhATXEIKkynXImrQB0YV0G7L
         S0rMTNIlWEFu+1tZtTw/djzaFna/H0iXywp/9v5N8hDZI3cWNXPDAYKb+BGtgIohjJDI
         8VUc5FWqIse+6NKd/LQjHhKRcymXM4TQC6isMaD3VIabxASU9WL/vlD/0/H2UCEQlJej
         C1Vg==
X-Gm-Message-State: AOAM5312WEpc2ewr60wbllhkLsTzXS00SC4Fm9UfOB4+fytCfjer2uKj
        8rtWeNEed1xVAB+xF4ZD39w=
X-Google-Smtp-Source: ABdhPJxnxTk1IiF/PPa+Xu2v16nnTqA+NPfY5VI6M/K/2IEm1Y0A9QIgQ2wTHQ7m1lbUXrrkTmKhbQ==
X-Received: by 2002:a17:906:b816:: with SMTP id dv22mr13022253ejb.503.1624655403787;
        Fri, 25 Jun 2021 14:10:03 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:1f53:c013:920b:f814? ([2001:981:6fec:1:1f53:c013:920b:f814])
        by smtp.gmail.com with ESMTPSA id e3sm3386960ejy.78.2021.06.25.14.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:10:02 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Wesley Cheng <wcheng@codeaurora.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        andy.shevchenko@gmail.com
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <cfb83fe4-369c-ec72-7887-3bcb0f20fe15@gmail.com>
 <ec8050c5-c013-4af6-b39e-69779c009a9c@codeaurora.org>
 <f5ed0ee7-e333-681f-0f1a-d0227562204b@gmail.com>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org>
 <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org>
 <4e5fbcdb-765a-895d-7723-a87feed6eed5@gmail.com>
 <d9441227-b494-ccb5-fc72-e59d3a7d2c72@codeaurora.org>
 <89af9004-9867-6c0a-a709-6c71817efa81@gmail.com>
 <d870b5c9-f553-3448-c69e-f1e32e23feb9@codeaurora.org>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <ee59382c-b8e6-9e5c-687f-ea654a28ed8a@gmail.com>
Date:   Fri, 25 Jun 2021 23:10:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d870b5c9-f553-3448-c69e-f1e32e23feb9@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 23-06-2021 om 09:50 schreef Wesley Cheng:
>
> On 6/22/2021 3:12 PM, Ferry Toth wrote:
>> Hi
>>
>> Op 23-06-2021 om 00:00 schreef Wesley Cheng:
>>> On 6/22/2021 1:09 PM, Ferry Toth wrote:
>>>> Hi
>>>>
>>>> Op 22-06-2021 om 20:38 schreef Wesley Cheng:
>>>>> On 6/19/2021 5:40 AM, Ferry Toth wrote:
>>>>>> Hi
>>>>>>
>>>>>> Op 18-06-2021 om 00:25 schreef Wesley Cheng:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 6/17/2021 2:55 PM, Ferry Toth wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Op 17-06-2021 om 23:48 schreef Wesley Cheng:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 6/17/2021 2:01 PM, Ferry Toth wrote:
>>>>>>>>>> Hi
>>>>>>>>>>
>>>>>>>>>> Op 17-06-2021 om 11:58 schreef Wesley Cheng:
>>>>>>>>>>> Changes in V10:
>>>>>>>>>>>       - Fixed compilation errors in config where OF is not used
>>>>>>>>>>> (error due to
>>>>>>>>>>>         unknown symbol for of_add_property()).  Add
>>>>>>>>>>> of_add_property()
>>>>>>>>>>> stub.
>>>>>>>>>>>       - Fixed compilation warning for incorrect argument being
>>>>>>>>>>> passed to
>>>>>>>>>>> dwc3_mdwidth
>>>>>>>>>> This fixes the OOPS I had in V9. I do not see any change in
>>>>>>>>>> performance
>>>>>>>>>> on Merrifield though.
>>>>>>>>> I see...thanks Ferry! With your testing, are you writing to the
>>>>>>>>> device's
>>>>>>>>> internal storage (ie UFS, eMMC, etc...), or did you use a
>>>>>>>>> ramdisk as
>>>>>>>>> well?
>>>>>>>> In this case I just tested the EEM path using iperf3.
>>>>>>>>
>>>>>>> Got it.  I don't believe f_eem will use a high enough (if at all)
>>>>>>> bMaxBurst value to change the TXFIFO size.
>>>>>>>
>>>>>>>>> If not with a ramdisk, we might want to give that a try to avoid
>>>>>>>>> the
>>>>>>>>> storage path being the bottleneck.  You can use "dd" to create an
>>>>>>>>> empty
>>>>>>>>> file, and then just use that as the LUN's backing file.
>>>>>>>>>
>>>>>>>>> echo ramdisk.img >
>>>>>>>>> /sys/kernel/config/usb_gadget/g1/functions/mass_storage.0/lun.0/file
>>>>>>>>>
>>>>>>>> Ah, why didn't I think of that. I have currently mass storage setup
>>>>>>>> with
>>>>>>>> eMMC but it seems that is indeed the bottleneck.
>>>>>>>>
>>>>>> I created a 64MB disk following the instructions here
>>>>>> http://www.linux-usb.org/gadget/file_storage.html (that seems a little
>>>>>> outdated, at least I can not start the first partition at sector 8,
>>>>>> but
>>>>>> minimum 2048), and added a test file on it.
>>>>>>
>>>>>> I then copy the file to /dev/shm prior to setting configfs (composite
>>>>>> device gser/eem/mass_storage/uac2).
>>>>>>
>>>>>> journal shows:
>>>>>>
>>>>>> kernel: Mass Storage Function, version: 2009/09/11
>>>>>> kernel: LUN: removable file: (no medium)
>>>>>>
>>>>>> I don't know what that means, because I see the test file on the
>>>>>> ramdisk.
>>>>>>
>>>>>> Then I again used gnome disks to benchmark (read/write 10MB):
>>>>>>
>>>>>> With V10 on top v5.13.0-rc5:
>>>>>>
>>>>>> R/W speed = 35.6/35.8MB/s, access time 0.35ms
>>>>>>
>>>>>> With no patches on top v5.12.0:
>>>>>>
>>>>>> R/W speed = 35.7/36.1MB/s, access time 0.35ms
>>>>> Hi Ferry,
>>>>>
>>>>>> I see no speed difference (and it's about the same as with the eMMC
>>>>>> backed disk). But the patches are causing a new call trace
>>>>>>
>>>>> Would you happen to know what DWC3 controller revision the device is
>>>>> using?  The callstack print occurs, because it looks like it ran out of
>>>>> internal memory, although there should be logic present for making sure
>>>>> that at least there is enough room for 1 FIFO per endpoint.  (possibly
>>>>> the logic/math depends on the controller revision)
>>> Hi Ferry,
>>>
>>>> Do you know where I could find that in a file on the device?
>>>>
>>> Maybe you can just dump the DWC3 registers?
>>> cat /sys/kernel/debug/usb/<controller name>/regdump
>> This isin host mode:
>>
>> ~# cat /sys/kernel/debug/usb/dwc3.0.auto/regdump
>> GSBUSCFG0 = 0x00000006
>> GSBUSCFG1 = 0x00000f00
>> GTXTHRCFG = 0x230a0000
>> GRXTHRCFG = 0x22800000
>> GCTL = 0x45801002
>> GEVTEN = 0x00000000
>> GSTS = 0x3e800001
>> GUCTL1 = 0x00000000
>> GSNPSID = 0x5533250a
>> GGPIO = 0x00000000
>> GUID = 0x00050d00
>> GUCTL = 0x0200ce00
>> GBUSERRADDR0 = 0x00000000
>> GBUSERRADDR1 = 0x00000000
> ...
> Hi Ferry,
>
> Great!  Thanks, that got me the information regarding the DWC3 revision
> you're using. (its version 2.50a)  I checked the DWC3 databook and looks
> like certain versions have some different math to calculate the TXFIFO
> size.  I have taken this into account and factored that in in the next
> revision.
>
> Is there a way you could collect the regdump in device mode w/ mass
> storage only composition after enumerating with the PC?  That would help
> confirm how the TXFIFO resizing logic is working on your platform.

Sorry for the wait. Yes I have serial console. So here is in device 
mode, mass_storage only, enumerated but not mounted:

GSBUSCFG0 = 0x00000006
GSBUSCFG1 = 0x00000f00
GTXTHRCFG = 0x230a0000
GRXTHRCFG = 0x02800000
GCTL = 0x45802002
GEVTEN = 0x00000000
GSTS = 0x3e800000
GUCTL1 = 0x00000000
GSNPSID = 0x5533250a
GGPIO = 0x00000000
GUID = 0x00050d00
GUCTL = 0x0200ce00
GBUSERRADDR0 = 0x00000000
GBUSERRADDR1 = 0x00000000
GPRTBIMAP0 = 0x00000000
GPRTBIMAP1 = 0x00000000
GHWPARAMS0 = 0x2020400a
GHWPARAMS1 = 0x0260c93b
GHWPARAMS2 = 0x008086a0
GHWPARAMS3 = 0x10420089
GHWPARAMS4 = 0x47a22004
GHWPARAMS5 = 0x04202088
GHWPARAMS6 = 0x0c00ac20
GHWPARAMS7 = 0x038807e6
GDBGFIFOSPACE = 0x00420000
GDBGLTSSM = 0x01090440
GDBGBMU = 0x20300000
GPRTBIMAP_HS0 = 0x00000000
GPRTBIMAP_HS1 = 0x00000000
GPRTBIMAP_FS0 = 0x00000000
GPRTBIMAP_FS1 = 0x00000000
GUSB2PHYCFG(0) = 0x0000a710
GUSB2PHYCFG(1) = 0x00000000
GUSB2PHYCFG(2) = 0x00000000
GUSB2PHYCFG(3) = 0x00000000
GUSB2PHYCFG(4) = 0x00000000
GUSB2PHYCFG(5) = 0x00000000
GUSB2PHYCFG(6) = 0x00000000
GUSB2PHYCFG(7) = 0x00000000
GUSB2PHYCFG(8) = 0x00000000
GUSB2PHYCFG(9) = 0x00000000
GUSB2PHYCFG(10) = 0x00000000
GUSB2PHYCFG(11) = 0x00000000
GUSB2PHYCFG(12) = 0x00000000
GUSB2PHYCFG(13) = 0x00000000
GUSB2PHYCFG(14) = 0x00000000
GUSB2PHYCFG(15) = 0x00000000
GUSB2I2CCTL(0) = 0x00000000
GUSB2I2CCTL(1) = 0x00000000
GUSB2I2CCTL(2) = 0x00000000
GUSB2I2CCTL(3) = 0x00000000
GUSB2I2CCTL(4) = 0x00000000
GUSB2I2CCTL(5) = 0x00000000
GUSB2I2CCTL(6) = 0x00000000
GUSB2I2CCTL(7) = 0x00000000
GUSB2I2CCTL(8) = 0x00000000
GUSB2I2CCTL(9) = 0x00000000
GUSB2I2CCTL(10) = 0x00000000
GUSB2I2CCTL(11) = 0x00000000
GUSB2I2CCTL(12) = 0x00000000
GUSB2I2CCTL(13) = 0x00000000
GUSB2I2CCTL(14) = 0x00000000
GUSB2I2CCTL(15) = 0x00000000
GUSB2PHYACC(0) = 0x014a0000
GUSB2PHYACC(1) = 0x00000000
GUSB2PHYACC(2) = 0x00000000
GUSB2PHYACC(3) = 0x00000000
GUSB2PHYACC(4) = 0x00000000
GUSB2PHYACC(5) = 0x00000000
GUSB2PHYACC(6) = 0x00000000
GUSB2PHYACC(7) = 0x00000000
GUSB2PHYACC(8) = 0x00000000
GUSB2PHYACC(9) = 0x00000000
GUSB2PHYACC(10) = 0x00000000
GUSB2PHYACC(11) = 0x00000000
GUSB2PHYACC(12) = 0x00000000
GUSB2PHYACC(13) = 0x00000000
GUSB2PHYACC(14) = 0x00000000
GUSB2PHYACC(15) = 0x00000000
GUSB3PIPECTL(0) = 0x02000002
GUSB3PIPECTL(1) = 0x00000000
GUSB3PIPECTL(2) = 0x00000000
GUSB3PIPECTL(3) = 0x00000000
GUSB3PIPECTL(4) = 0x00000000
GUSB3PIPECTL(5) = 0x00000000
GUSB3PIPECTL(6) = 0x00000000
GUSB3PIPECTL(7) = 0x00000000
GUSB3PIPECTL(8) = 0x00000000
GUSB3PIPECTL(9) = 0x00000000
GUSB3PIPECTL(10) = 0x00000000
GUSB3PIPECTL(11) = 0x00000000
GUSB3PIPECTL(12) = 0x00000000
GUSB3PIPECTL(13) = 0x00000000
GUSB3PIPECTL(14) = 0x00000000
GUSB3PIPECTL(15) = 0x00000000
GTXFIFOSIZ(0) = 0x00000042
GTXFIFOSIZ(1) = 0x00000000
GTXFIFOSIZ(2) = 0x00420083
GTXFIFOSIZ(3) = 0x00000000
GTXFIFOSIZ(4) = 0x00000000
GTXFIFOSIZ(5) = 0x00000000
GTXFIFOSIZ(6) = 0x00000000
GTXFIFOSIZ(7) = 0x00000000
GTXFIFOSIZ(8) = 0x00000000
GTXFIFOSIZ(9) = 0x00000000
GTXFIFOSIZ(10) = 0x00000000
GTXFIFOSIZ(11) = 0x00000000
GTXFIFOSIZ(12) = 0x00000000
GTXFIFOSIZ(13) = 0x00000000
GTXFIFOSIZ(14) = 0x00000000
GTXFIFOSIZ(15) = 0x00000000
GTXFIFOSIZ(16) = 0x00000000
GTXFIFOSIZ(17) = 0x00000000
GTXFIFOSIZ(18) = 0x00000000
GTXFIFOSIZ(19) = 0x00000000
GTXFIFOSIZ(20) = 0x00000000
GTXFIFOSIZ(21) = 0x00000000
GTXFIFOSIZ(22) = 0x00000000
GTXFIFOSIZ(23) = 0x00000000
GTXFIFOSIZ(24) = 0x00000000
GTXFIFOSIZ(25) = 0x00000000
GTXFIFOSIZ(26) = 0x00000000
GTXFIFOSIZ(27) = 0x00000000
GTXFIFOSIZ(28) = 0x00000000
GTXFIFOSIZ(29) = 0x00000000
GTXFIFOSIZ(30) = 0x00000000
GTXFIFOSIZ(31) = 0x00000000
GRXFIFOSIZ(0) = 0x00000385
GRXFIFOSIZ(1) = 0x03850000
GRXFIFOSIZ(2) = 0x03850000
GRXFIFOSIZ(3) = 0x00000000
GRXFIFOSIZ(4) = 0x00000000
GRXFIFOSIZ(5) = 0x00000000
GRXFIFOSIZ(6) = 0x00000000
GRXFIFOSIZ(7) = 0x00000000
GRXFIFOSIZ(8) = 0x00000000
GRXFIFOSIZ(9) = 0x00000000
GRXFIFOSIZ(10) = 0x00000000
GRXFIFOSIZ(11) = 0x00000000
GRXFIFOSIZ(12) = 0x00000000
GRXFIFOSIZ(13) = 0x00000000
GRXFIFOSIZ(14) = 0x00000000
GRXFIFOSIZ(15) = 0x00000000
GRXFIFOSIZ(16) = 0x00000000
GRXFIFOSIZ(17) = 0x00000000
GRXFIFOSIZ(18) = 0x00000000
GRXFIFOSIZ(19) = 0x00000000
GRXFIFOSIZ(20) = 0x00000000
GRXFIFOSIZ(21) = 0x00000000
GRXFIFOSIZ(22) = 0x00000000
GRXFIFOSIZ(23) = 0x00000000
GRXFIFOSIZ(24) = 0x00000000
GRXFIFOSIZ(25) = 0x00000000
GRXFIFOSIZ(26) = 0x00000000
GRXFIFOSIZ(27) = 0x00000000
GRXFIFOSIZ(28) = 0x00000000
GRXFIFOSIZ(29) = 0x00000000
GRXFIFOSIZ(30) = 0x00000000
GRXFIFOSIZ(31) = 0x00000000
GEVNTADRLO(0) = 0x08b15000
GEVNTADRHI(0) = 0x00000000
GEVNTSIZ(0) = 0x00001000
GEVNTCOUNT(0) = 0x00000000
GHWPARAMS8 = 0x00000c00
DCFG = 0x008e082c
DCTL = 0x80f00a00
DEVTEN = 0x00000257
DSTS = 0x00833f98
DGCMDPAR = 0x00000000
DGCMD = 0x00000000
DALEPENA = 0x00000027
DEPCMDPAR2(0) = 0x00000000
DEPCMDPAR1(0) = 0x06a41000
DEPCMDPAR0(0) = 0x00000000
DEPCMD(0) = 0x00000006
DEPCMDPAR2(1) = 0x00000000
DEPCMDPAR1(1) = 0x06a41000
DEPCMDPAR0(1) = 0x00000000
DEPCMD(1) = 0x00010006
DEPCMDPAR2(2) = 0x00000000
DEPCMDPAR1(2) = 0x00000000
DEPCMDPAR0(2) = 0x00000000
DEPCMD(2) = 0x00020007
DEPCMDPAR2(3) = 0x00000000
DEPCMDPAR1(3) = 0x00000000
DEPCMDPAR0(3) = 0x00000000
DEPCMD(3) = 0x00000000
DEPCMDPAR2(4) = 0x00000000
DEPCMDPAR1(4) = 0x00000000
DEPCMDPAR0(4) = 0x00000001
DEPCMD(4) = 0x00040002
DEPCMDPAR2(5) = 0x00000000
DEPCMDPAR1(5) = 0x00000000
DEPCMDPAR0(5) = 0x00000000
DEPCMD(5) = 0x00040007
DEPCMDPAR2(6) = 0x00000000
DEPCMDPAR1(6) = 0x00000000
DEPCMDPAR0(6) = 0x00000001
DEPCMD(6) = 0x00060002
DEPCMDPAR2(7) = 0x00000000
DEPCMDPAR1(7) = 0x00000000
DEPCMDPAR0(7) = 0x00000001
DEPCMD(7) = 0x00070002
DEPCMDPAR2(8) = 0x00000000
DEPCMDPAR1(8) = 0x00000000
DEPCMDPAR0(8) = 0x00000001
DEPCMD(8) = 0x00080002
DEPCMDPAR2(9) = 0x00000000
DEPCMDPAR1(9) = 0x00000000
DEPCMDPAR0(9) = 0x00000001
DEPCMD(9) = 0x00090002
DEPCMDPAR2(10) = 0x00000000
DEPCMDPAR1(10) = 0x00000000
DEPCMDPAR0(10) = 0x00000001
DEPCMD(10) = 0x000a0002
DEPCMDPAR2(11) = 0x00000000
DEPCMDPAR1(11) = 0x00000000
DEPCMDPAR0(11) = 0x00000001
DEPCMD(11) = 0x000b0002
DEPCMDPAR2(12) = 0x00000000
DEPCMDPAR1(12) = 0x00000000
DEPCMDPAR0(12) = 0x00000001
DEPCMD(12) = 0x000c0002
DEPCMDPAR2(13) = 0x00000000
DEPCMDPAR1(13) = 0x00000000
DEPCMDPAR0(13) = 0x00000001
DEPCMD(13) = 0x000d0002
DEPCMDPAR2(14) = 0x00000000
DEPCMDPAR1(14) = 0x00000000
DEPCMDPAR0(14) = 0x00000001
DEPCMD(14) = 0x000e0002
DEPCMDPAR2(15) = 0x00000000
DEPCMDPAR1(15) = 0x00000000
DEPCMDPAR0(15) = 0x00000001
DEPCMD(15) = 0x000f0002
DEPCMDPAR2(16) = 0x00000000
DEPCMDPAR1(16) = 0x00000000
DEPCMDPAR0(16) = 0x00000000
DEPCMD(16) = 0x00000000
DEPCMDPAR2(17) = 0x00000000
DEPCMDPAR1(17) = 0x00000000
DEPCMDPAR0(17) = 0x00000000
DEPCMD(17) = 0x00000000
DEPCMDPAR2(18) = 0x00000000
DEPCMDPAR1(18) = 0x00000000
DEPCMDPAR0(18) = 0x00000001
DEPCMD(18) = 0x00100002
DEPCMDPAR2(19) = 0x00000000
DEPCMDPAR1(19) = 0x00000000
DEPCMDPAR0(19) = 0x00000001
DEPCMD(19) = 0x00110002
DEPCMDPAR2(20) = 0x00000000
DEPCMDPAR1(20) = 0x00000000
DEPCMDPAR0(20) = 0x00000001
DEPCMD(20) = 0x00120002
DEPCMDPAR2(21) = 0x00000000
DEPCMDPAR1(21) = 0x00000000
DEPCMDPAR0(21) = 0x00000001
DEPCMD(21) = 0x00130002
DEPCMDPAR2(22) = 0x00000000
DEPCMDPAR1(22) = 0x00000000
DEPCMDPAR0(22) = 0x00000001
DEPCMD(22) = 0x00140002
DEPCMDPAR2(23) = 0x00000000
DEPCMDPAR1(23) = 0x00000000
DEPCMDPAR0(23) = 0x00000001
DEPCMD(23) = 0x00150002
DEPCMDPAR2(24) = 0x00000000
DEPCMDPAR1(24) = 0x00000000
DEPCMDPAR0(24) = 0x00000001
DEPCMD(24) = 0x00160002
DEPCMDPAR2(25) = 0x00000000
DEPCMDPAR1(25) = 0x00000000
DEPCMDPAR0(25) = 0x00000001
DEPCMD(25) = 0x00170002
DEPCMDPAR2(26) = 0x00000000
DEPCMDPAR1(26) = 0x00000000
DEPCMDPAR0(26) = 0x00000001
DEPCMD(26) = 0x00180002
DEPCMDPAR2(27) = 0x00000000
DEPCMDPAR1(27) = 0x00000000
DEPCMDPAR0(27) = 0x00000001
DEPCMD(27) = 0x00190002
DEPCMDPAR2(28) = 0x00000000
DEPCMDPAR1(28) = 0x00000000
DEPCMDPAR0(28) = 0x00000001
DEPCMD(28) = 0x001a0002
DEPCMDPAR2(29) = 0x00000000
DEPCMDPAR1(29) = 0x00000000
DEPCMDPAR0(29) = 0x00000001
DEPCMD(29) = 0x001b0002
DEPCMDPAR2(30) = 0x00000000
DEPCMDPAR1(30) = 0x00000000
DEPCMDPAR0(30) = 0x00000001
DEPCMD(30) = 0x001c0002
DEPCMDPAR2(31) = 0x00000000
DEPCMDPAR1(31) = 0x00000000
DEPCMDPAR0(31) = 0x00000001
DEPCMD(31) = 0x001d0002
OCFG = 0x00000000
OCTL = 0x00000040
OEVT = 0x80000000
OEVTEN = 0x00000000
OSTS = 0x0000201f

> Thanks
> Wesley Cheng
>
>>> Was going to ask for the same to confirm the TXFIFO sizes from your
>>> results below :).
>>>
>>>> Otherwise, I'm hoping Andy will know?
>>>>
>>>>> Also, is there a way to use just a mass storage only composition?
>>>>> Based
>>>>> on the above observation, that probably means that the mass storage
>>>>> interface wasn't resized at all, because the configuration took up a
>>>>> lot
>>>>> of the internal FIFO space.
>>>> Sure, it's configured through configfs. With only mass_storage I have:
>>>>
>>>> With V10 on top v5.13.0-rc5:
>>>>
>>>> R/W speed = 41,6/39,3MB/s, access time 0.33ms
>>>>
>>>> With no patches on top v5.12.0:
>>>>
>>>> R/W speed = 41,1/38,7MB/s, access time 0.38ms
>>>>
>>> Thanks Ferry!  Could you collect the regdump, so I can confirm the two
>>> things mentioned?
>>>
>>> Thanks
>>> Wesley Cheng
>>>
>>>>> Thanks
>>>>> Wesley Cheng
>>>>>
>>>>>> kernel: using random self ethernet address
>>>>>> kernel: using random host ethernet address
>>>>>> kernel: Mass Storage Function, version: 2009/09/11
>>>>>> kernel: LUN: removable file: (no medium)
>>>>>> kernel: usb0: HOST MAC aa:bb:cc:dd:ee:f2
>>>>>> kernel: usb0: MAC aa:bb:cc:dd:ee:f1
>>>>>> kernel: IPv6: ADDRCONF(NETDEV_CHANGE): usb0: link becomes ready
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: ------------[ cut here ]------------
>>>>>> kernel: WARNING: CPU: 0 PID: 594 at drivers/usb/gadget/udc/core.c:278
>>>>>> usb_ep_queue+0x75/0x80
>>>>>> kernel: Modules linked in: usb_f_uac2 u_audio usb_f_mass_storage
>>>>>> usb_f_eem u_ether usb_f_serial u_serial libcomposite rfcomm
>>>>>> iptable_nat
>>>>>> bnep snd_sof_nocodec spi_pxa2>
>>>>>> kernel: CPU: 0 PID: 594 Comm: irq/14-dwc3 Not tainted
>>>>>> 5.13.0-rc5-edison-acpi-standard #1
>>>>>> kernel: Hardware name: Intel Corporation Merrifield/BODEGA BAY,
>>>>>> BIOS 542
>>>>>> 2015.01.21:18.19.48
>>>>>> kernel: RIP: 0010:usb_ep_queue+0x75/0x80
>>>>>> kernel: Code: 01 73 e4 48 8b 05 fb 63 06 01 48 85 c0 74 12 48 8b 78 08
>>>>>> 44 89 e9 4c 89 e2 48 89 ee e8 74 05 00 00 44 89 e8 5d 41 5c 41 5d c3
>>>>>> <0f> 0b 41 bd 94 ff ff ff >
>>>>>> kernel: RSP: 0000:ffff91eec083fc98 EFLAGS: 00010082
>>>>>> kernel: RAX: ffff8af20357d960 RBX: 0000000000000000 RCX:
>>>>>> ffff8af202f06400
>>>>>> kernel: RDX: 0000000000000a20 RSI: ffff8af208785780 RDI:
>>>>>> ffff8af202e9ae00
>>>>>> kernel: RBP: ffff8af202e9ae00 R08: 00000000000000c0 R09:
>>>>>> ffff8af208785780
>>>>>> kernel: R10: 00000000ffffe000 R11: 3fffffffffffffff R12:
>>>>>> ffff8af208785780
>>>>>> kernel: R13: 0000000000000000 R14: ffff8af202e9ae00 R15:
>>>>>> ffff8af203e26cc0
>>>>>> kernel: FS:  0000000000000000(0000) GS:ffff8af23e200000(0000)
>>>>>> knlGS:0000000000000000
>>>>>> kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>> kernel: CR2: 000055e2c21f2100 CR3: 0000000003b38000 CR4:
>>>>>> 00000000001006f0
>>>>>> kernel: Call Trace:
>>>>>> kernel:  u_audio_start_playback+0x107/0x1a0 [u_audio]
>>>>>> kernel:  composite_setup+0x224/0x1ba0 [libcomposite]
>>>>>> kernel:  ? dwc3_gadget_ep_queue+0xf6/0x1a0
>>>>>> kernel:  ? usb_ep_queue+0x2a/0x80
>>>>>> kernel:  ? configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>> kernel:  configfs_composite_setup+0x6b/0x90 [libcomposite]
>>>>>> kernel:  dwc3_ep0_interrupt+0x469/0xa80
>>>>>> kernel:  dwc3_thread_interrupt+0x8ee/0xf40
>>>>>> kernel:  ? __wake_up_common_lock+0x85/0xb0
>>>>>> kernel:  ? disable_irq_nosync+0x10/0x10
>>>>>> kernel:  irq_thread_fn+0x1b/0x60
>>>>>> kernel:  irq_thread+0xd6/0x170
>>>>>> kernel:  ? irq_thread_check_affinity+0x70/0x70
>>>>>> kernel:  ? irq_forced_thread_fn+0x70/0x70
>>>>>> kernel:  kthread+0x116/0x130
>>>>>> kernel:  ? kthread_create_worker_on_cpu+0x60/0x60
>>>>>> kernel:  ret_from_fork+0x22/0x30
>>>>>> kernel: ---[ end trace e5b9e28058c53584 ]---
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000036ac129 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000fbc71244 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000ad1b8c18 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: Fifosize(2154) > RAM size(2022) ep5in
>>>>>> depth:115540359
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: configfs-gadget gadget: u_audio_start_playback:451 Error!
>>>>>> kernel: dwc3 dwc3.0.auto: request 000000003c32dcc5 was not queued to
>>>>>> ep5in
>>>>>> kernel: dwc3 dwc3.0.auto: request 00000000b2512aa9 was not queued to
>>>>>> ep5in
>>>>>>
>>>>>> Removing uac2 from the config makes the call trace go away, but the
>>>>>> R/W
>>>>>> speed does not change.
>>>>>>
>>>>>>> :), not a problem...I've been working on getting the ideal set up for
>>>>>>> the performance profiling for awhile, so anything I can do to make
>>>>>>> sure
>>>>>>> we get some good results.
>>>>>>>
>>>>>>>> I'll try with a ramdisk and let you know.
>>>>>>>>
>>>>>>> Thanks again for the testing, Ferry.
>>>>>>>
>>>>>>> Thanks
>>>>>>> Wesley Cheng
>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>> Wesley Cheng
>>>>>>>>>
>>>>>>>>>>> Changes in V9:
>>>>>>>>>>>       - Fixed incorrect patch in series.  Removed changes in
>>>>>>>>>>> DTSI, as
>>>>>>>>>>> dwc3-qcom will
>>>>>>>>>>>         add the property by default from the kernel.
>>>>>>>>>>>
>>>>>>>>>>> Changes in V8:
>>>>>>>>>>>       - Rebased to usb-testing
>>>>>>>>>>>       - Using devm_kzalloc for adding txfifo property in dwc3-qcom
>>>>>>>>>>>       - Removed DWC3 QCOM ACPI property for enabling the txfifo
>>>>>>>>>>> resize
>>>>>>>>>>>
>>>>>>>>>>> Changes in V7:
>>>>>>>>>>>       - Added a new property tx-fifo-max-num for limiting how much
>>>>>>>>>>> fifo
>>>>>>>>>>> space the
>>>>>>>>>>>         resizing logic can allocate for endpoints with large burst
>>>>>>>>>>> values.  This
>>>>>>>>>>>         can differ across platforms, and tie in closely with
>>>>>>>>>>> overall
>>>>>>>>>>> system latency.
>>>>>>>>>>>       - Added recommended checks for DWC32.
>>>>>>>>>>>       - Added changes to set the tx-fifo-resize property from
>>>>>>>>>>> dwc3-qcom by
>>>>>>>>>>> default
>>>>>>>>>>>         instead of modifying the current DTSI files.
>>>>>>>>>>>       - Added comments on all APIs/variables introduced.
>>>>>>>>>>>       - Updated the DWC3 YAML to include a better description
>>>>>>>>>>> of the
>>>>>>>>>>> tx-fifo-resize
>>>>>>>>>>>         property and added an entry for tx-fifo-max-num.
>>>>>>>>>>>
>>>>>>>>>>> Changes in V6:
>>>>>>>>>>>       - Rebased patches to usb-testing.
>>>>>>>>>>>       - Renamed to PATCH series instead of RFC.
>>>>>>>>>>>       - Checking for fs_descriptors instead of ss_descriptors for
>>>>>>>>>>> determining the
>>>>>>>>>>>         endpoint count for a particular configuration.
>>>>>>>>>>>       - Re-ordered patch series to fix patch dependencies.
>>>>>>>>>>>
>>>>>>>>>>> Changes in V5:
>>>>>>>>>>>       - Added check_config() logic, which is used to
>>>>>>>>>>> communicate the
>>>>>>>>>>> number of EPs
>>>>>>>>>>>         used in a particular configuration.  Based on this, the
>>>>>>>>>>> DWC3
>>>>>>>>>>> gadget driver
>>>>>>>>>>>         has the ability to know the maximum number of eps
>>>>>>>>>>> utilized in
>>>>>>>>>>> all
>>>>>>>>>>> configs.
>>>>>>>>>>>         This helps reduce unnecessary allocation to unused eps,
>>>>>>>>>>> and will
>>>>>>>>>>> catch fifo
>>>>>>>>>>>         allocation issues at bind() time.
>>>>>>>>>>>       - Fixed variable declaration to single line per variable,
>>>>>>>>>>> and
>>>>>>>>>>> reverse xmas.
>>>>>>>>>>>       - Created a helper for fifo clearing, which is used by ep0.c
>>>>>>>>>>>
>>>>>>>>>>> Changes in V4:
>>>>>>>>>>>       - Removed struct dwc3* as an argument for
>>>>>>>>>>> dwc3_gadget_resize_tx_fifos()
>>>>>>>>>>>       - Removed WARN_ON(1) in case we run out of fifo space
>>>>>>>>>>>       Changes in V3:
>>>>>>>>>>>       - Removed "Reviewed-by" tags
>>>>>>>>>>>       - Renamed series back to RFC
>>>>>>>>>>>       - Modified logic to ensure that fifo_size is reset if we
>>>>>>>>>>> pass the
>>>>>>>>>>> minimum
>>>>>>>>>>>         threshold.  Tested with binding multiple FDs requesting 6
>>>>>>>>>>> FIFOs.
>>>>>>>>>>>
>>>>>>>>>>> Changes in V2:
>>>>>>>>>>>       - Modified TXFIFO resizing logic to ensure that each EP is
>>>>>>>>>>> reserved a
>>>>>>>>>>>         FIFO.
>>>>>>>>>>>       - Removed dev_dbg() prints and fixed typos from patches
>>>>>>>>>>>       - Added some more description on the dt-bindings commit
>>>>>>>>>>> message
>>>>>>>>>>>
>>>>>>>>>>> Currently, there is no functionality to allow for resizing the
>>>>>>>>>>> TXFIFOs, and
>>>>>>>>>>> relying on the HW default setting for the TXFIFO depth.  In most
>>>>>>>>>>> cases, the
>>>>>>>>>>> HW default is probably sufficient, but for USB compositions that
>>>>>>>>>>> contain
>>>>>>>>>>> multiple functions that require EP bursting, the default settings
>>>>>>>>>>> might not be enough.  Also to note, the current SW will assign an
>>>>>>>>>>> EP to a
>>>>>>>>>>> function driver w/o checking to see if the TXFIFO size for that
>>>>>>>>>>> particular
>>>>>>>>>>> EP is large enough. (this is a problem if there are multiple HW
>>>>>>>>>>> defined
>>>>>>>>>>> values for the TXFIFO size)
>>>>>>>>>>>
>>>>>>>>>>> It is mentioned in the SNPS databook that a minimum of TX FIFO
>>>>>>>>>>> depth = 3
>>>>>>>>>>> is required for an EP that supports bursting.  Otherwise, there
>>>>>>>>>>> may be
>>>>>>>>>>> frequent occurences of bursts ending.  For high bandwidth
>>>>>>>>>>> functions,
>>>>>>>>>>> such as data tethering (protocols that support data aggregation),
>>>>>>>>>>> mass
>>>>>>>>>>> storage, and media transfer protocol (over FFS), the bMaxBurst
>>>>>>>>>>> value
>>>>>>>>>>> can be
>>>>>>>>>>> large, and a bigger TXFIFO depth may prove to be beneficial in
>>>>>>>>>>> terms
>>>>>>>>>>> of USB
>>>>>>>>>>> throughput. (which can be associated to system access latency,
>>>>>>>>>>> etc...)  It
>>>>>>>>>>> allows for a more consistent burst of traffic, w/o any
>>>>>>>>>>> interruptions, as
>>>>>>>>>>> data is readily available in the FIFO.
>>>>>>>>>>>
>>>>>>>>>>> With testing done using the mass storage function driver, the
>>>>>>>>>>> results
>>>>>>>>>>> show
>>>>>>>>>>> that with a larger TXFIFO depth, the bandwidth increased
>>>>>>>>>>> significantly.
>>>>>>>>>>>
>>>>>>>>>>> Test Parameters:
>>>>>>>>>>>       - Platform: Qualcomm SM8150
>>>>>>>>>>>       - bMaxBurst = 6
>>>>>>>>>>>       - USB req size = 256kB
>>>>>>>>>>>       - Num of USB reqs = 16
>>>>>>>>>>>       - USB Speed = Super-Speed
>>>>>>>>>>>       - Function Driver: Mass Storage (w/ ramdisk)
>>>>>>>>>>>       - Test Application: CrystalDiskMark
>>>>>>>>>>>
>>>>>>>>>>> Results:
>>>>>>>>>>>
>>>>>>>>>>> TXFIFO Depth = 3 max packets
>>>>>>>>>>>
>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>> Read      |9 loops    | 193.60
>>>>>>>>>>>           |           | 195.86
>>>>>>>>>>>                |           | 184.77
>>>>>>>>>>>                |           | 193.60
>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>
>>>>>>>>>>> TXFIFO Depth = 6 max packets
>>>>>>>>>>>
>>>>>>>>>>> Test Case | Data Size | AVG tput (in MB/s)
>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>> Sequential|1 GB x     |
>>>>>>>>>>> Read      |9 loops    | 287.35
>>>>>>>>>>>           |           | 304.94
>>>>>>>>>>>                |           | 289.64
>>>>>>>>>>>                |           | 293.61
>>>>>>>>>>> -------------------------------------------
>>>>>>>>>>>
>>>>>>>>>>> Wesley Cheng (6):
>>>>>>>>>>>        usb: gadget: udc: core: Introduce check_config to verify
>>>>>>>>>>> USB
>>>>>>>>>>>          configuration
>>>>>>>>>>>        usb: gadget: configfs: Check USB configuration before
>>>>>>>>>>> adding
>>>>>>>>>>>        usb: dwc3: Resize TX FIFOs to meet EP bursting requirements
>>>>>>>>>>>        of: Add stub for of_add_property()
>>>>>>>>>>>        usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by
>>>>>>>>>>> default
>>>>>>>>>>>        dt-bindings: usb: dwc3: Update dwc3 TX fifo properties
>>>>>>>>>>>
>>>>>>>>>>>       .../devicetree/bindings/usb/snps,dwc3.yaml         |  15 +-
>>>>>>>>>>>       drivers/usb/dwc3/core.c                            |   9 +
>>>>>>>>>>>       drivers/usb/dwc3/core.h                            |  15 ++
>>>>>>>>>>>       drivers/usb/dwc3/dwc3-qcom.c                       |   9 +
>>>>>>>>>>>       drivers/usb/dwc3/ep0.c                             |   2 +
>>>>>>>>>>>       drivers/usb/dwc3/gadget.c                          | 212
>>>>>>>>>>> +++++++++++++++++++++
>>>>>>>>>>>       drivers/usb/gadget/configfs.c                      |  22 +++
>>>>>>>>>>>       drivers/usb/gadget/udc/core.c                      |  25 +++
>>>>>>>>>>>       include/linux/of.h                                 |   5 +
>>>>>>>>>>>       include/linux/usb/gadget.h                         |   5 +
>>>>>>>>>>>       10 files changed, 317 insertions(+), 2 deletions(-)
>>>>>>>>>>>
