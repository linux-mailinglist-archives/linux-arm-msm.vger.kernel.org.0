Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1852F4825E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Dec 2021 22:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhLaVRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Dec 2021 16:17:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhLaVRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Dec 2021 16:17:51 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 242DCC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 13:17:51 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso36655842ots.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Dec 2021 13:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DlRbHj73DS9RIDR6up4UyNzekEo1BWrofpZzPM/fckg=;
        b=nU9RLot+V0RJg8GQABKDiSsmHKZrO45QIf6j6GVz46ls9QVr0mka1gm6kbygngyPZm
         enYW8wUitae2W20KLVHDWnPhLNsCPATYSY7HUAO9zRxq9IHTfKNQZwDAXCZZl45iXwcS
         ehSA2Fot52LaHarxtVNiXwDfiYaIGmbw4rWCAiDSYqcTwXLqxr1k0QwOhW/ArYufNMR1
         i7W7w6XCPV73OYGZ4Bu4/nJfuXViF0XmlZUD7YGbAqUP8qMlQUT5bvOVb0T7/pRD0iBs
         87Azjv2CgbLG6YfYdjsVQOZwpLWMdmsGWWYjei9E0hYrRBhlGD3zVumdIDOQ8epM1p8E
         Dfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DlRbHj73DS9RIDR6up4UyNzekEo1BWrofpZzPM/fckg=;
        b=CN28hhWJvDvjBAVZoBdC3pThS2sTQVNxx0+Lym3VojSmbb208dOA5prkiDL5a0TzoH
         dewz1kwt6TEYrg16SBwR5YfZrAmSeL/qKMeyHRPpB9AuN0V3sj/AB4NFMd4DFaiab8+X
         9PWD4VybE3bYNOzMGbJ6keN4LmjmKnlxWAz8xu6+OEMJus46Unf36m1sr9t3czNSHPzc
         WwegEQes5wgzHDVxSijotOibYBnSWwKNLpZKPGhU2wksJUuhHI0RRU5m63cB4BwCjcsn
         s+h06WOi6WdT8jrmbNLgs7XqhAFtX715l9JAn03tuwg7wWQAv3pq1lV11haEpUZVUzAd
         Tnug==
X-Gm-Message-State: AOAM5317ivXS8KIUyjtt/THMNQYvPeGBCW9sai64H6SQ6hWy9GAkgI0D
        jdTL6/IRJOFiTwzITiFa97RHLZAvOMRrSw==
X-Google-Smtp-Source: ABdhPJy5va2zGxlpvwMIkCMhazTZFGVP55+m2hJHem1xX0+XiWYP3SoEsWAACoLC8jz329yzDk0uNw==
X-Received: by 2002:a9d:832:: with SMTP id 47mr25237625oty.196.1640985470222;
        Fri, 31 Dec 2021 13:17:50 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c17sm4698059otn.72.2021.12.31.13.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 13:17:49 -0800 (PST)
Date:   Fri, 31 Dec 2021 13:18:47 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc:     linux-arm-msm@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>,
        Sricharan R <sricharan@codeaurora.org>,
        arajkuma@codeaurora.org, speriaka@codeaurora.org,
        sivaprak@codeaurora.org, jason <jason@wallystech.com>,
        linus.walleij@linaro.org
Subject: Re: External data abort on ipq6018 gpio # 20 ~ offset 0x14000 any
 ideas ?
Message-ID: <Yc9zt9vOWXTPZ8PH@ripper>
References: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbe181af-402d-c8eb-3104-4ee48f8d525a@nexus-software.ie>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 Dec 09:05 PST 2021, Bryan O'Donoghue wrote:

> Hi.
> 
> I've been poking a problem on an ipq6018 board I have. Specifically it
> pertains to the address range for GPIO # 20, touching any address in the
> range 0x14000 - 0x14FFC results in data-abort.
> 

This problem exists on pretty much all Qualcomm platforms.

> I initially encountered this with the upstream kernel here:
> https://paste.debian.net/1225390/
> 
> and assumed that I was doing something wrong, so went hunting for evidence
> that the downstream kernel touched the registers in that range, my
> assumption that something extra was happening the downstream kernel to make
> the register read kosher, turned out to be wrong, assuming something like
> the transition from arm32 to arm64 or a trustzone setting getting in the
> way.
> 
> Downstream doesn't touch that register with the default drivers and shipping
> DTS files.
> 

Iirc the change that introduced this "regression" is 3edfb7bd76bd
("gpiolib: Show correct direction from the beginning"), which seems to
have been introduced in 4.20. So any downstream older than that will
typically boot just fine.

But I believe cat /sys/kernel/debug/gpio will crash the system still.

> Modifying the downstream kernel to do a simple read of each ctrl_reg makes
> downstream choke on the address too.
> 
> This is the only bootable version of the downstream kernel reading every
> ctrl_reg in the range of gpio0 - gpio79 - skipping gpio20 since even
> downstream the address range 0x14000 - 0x14FFC is broken.
> 
> In other words I can prove the problem is only with the physical range
> 0x01014000 - 0x01014FFC
> 
> gpio19 @ 01013000 - 01013FFC is fine
> gpio21 @ 01015000 - 01015FFC is fine
> 
> the issue is limited to gpio20 @ 0x01014000 - 0x01014FFC
> 
> Downstream kernel:
> https://paste.debian.net/1225388/
> 
> This is also the case when doing a dumb dump in u-boot
> Stock u-boot:
> 
> https://paste.debian.net/1225389/
> https://paste.debian.net/1225396/
> 
> Is there a sku of this SoC which perhaps reserves 0x14000 - 0x14FFC or a
> version of the firmware that does so ?
> 
> I've already discussed this offline with Baruch who suggested firmware
> versions based on previous feedback working with this part, however the
> firmware version on the board is newer than what was suggested here
> 
> https://lore.kernel.org/all/5ba36dcd7c50b640e0bdaf5b9c2248f3@codeaurora.org/
> 
> "Please try with TZ version >= TZ.WNS.5.1-00084."
> 

The reason for seeing this issue is typically that the pins are related
to some I2C bus that is used for some secure application, i.e. they are
reserved for TZ to use.

As such I don't think you can use the >= comparator to determine if the
firmware exposes you to this problem or not, because it will depend on
if the particular release branch has such features enabled or not.

> admin@OpenWrt:~$ cat /proc/device-tree/tz_version
> CRM-TZ.WNS.5.1-00113
> admin@OpenWrt:~$ cat /proc/device-tree/tz_version
> CRM-TZ.WNS.5.1-00113
> admin@OpenWrt:~$ cat /proc/device-tree/rpm_version
> CRM-RPM.BF.2.4.1-00089
> admin@OpenWrt:~$  cat /proc/device-tree/boot_version
> crm-ubuntu47-BOOT.XF.0.3-00090-IPQ60xxLZB-2
> 
> I'm not far off writing a patch based on a "compatible" string to mark gpio
> # 20 as bad - any other ideas or insights welcome though.
> 

Unfortunately I don't know how to determine the list of protected GPIOs,
other than trial and error.

But once you have the list, you can use "gpio-reserved-ranges" (a series
of offset, count pairs) in the TLMM DT node to mark off these gpios as
reserved.

Regards,
Bjorn
