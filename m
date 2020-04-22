Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA991B4FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 00:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgDVWBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 18:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgDVWBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 18:01:53 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E29C03C1A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 15:01:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x17so3711474wrt.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=em+wcShpdUXMOwEuiMKWPovG1hGJ7vnjNO1+x5kgI0M=;
        b=GKxKz1ZpRtm0Zath9tELAqG/QrfcwqyTN791UFjljwVoF/QYBEfF5W5V877GGat3MF
         4a+wKQQkqA6adYYwVLZzyz1N8RXUac6p5fJZq08vBjqmQFrTjYVDL79IV6jj1Qo+LZLQ
         3120q21JUFdmW+FqSTo2C7aY1tviiDz+7tJT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=em+wcShpdUXMOwEuiMKWPovG1hGJ7vnjNO1+x5kgI0M=;
        b=EQTLpuqI/P2Uja0C01eHtQIzdk84cA8cEfCiq7z+yCGkXT+XjBSF1g5Sw8kkbtXG7Z
         /9L2meQMm6u/JKfmTThzBdLTnB3GzfPLgLf+7Qfc5xBmFzwByqE5JUi5+g9/kIhrpLO0
         RdjBQwFInYkdCA1W5p35yln0Mp8K2cazYe3BMFsrekRDHSlerrYWtJQhFu3KsRA6PvQK
         aZ2EKDGreYBrEjLhsUW0z2lxQB3ybZ/j3lkfYfhVo4TYlDs0dnC2C12yLJU+Q0naJ5Vz
         M5CgFxXyz4C5g7v3TfrMz7vOkDbaRTGH0dQkRXPaz8KrHbx+05EkjWKcx28vmAJJM7eP
         mW/A==
X-Gm-Message-State: AGi0PubYB/9bRU31b+BsAZVyg4nbM2hoRgl8qhsyWDXUMx0yX5ZIsxof
        tqs0QkYmDoaX7169KH8TNi/8HQ==
X-Google-Smtp-Source: APiQypKI8k4TySX2HxG45ANUOlTXZ016fEV88ihQ/i/kGs1Reh4zJF1QAgKUNB6iUGMJJTHVq4CGAw==
X-Received: by 2002:adf:a309:: with SMTP id c9mr1154684wrb.97.1587592911938;
        Wed, 22 Apr 2020 15:01:51 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id z10sm702728wrg.69.2020.04.22.15.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 15:01:50 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] misc: bcm-vk: add Broadcom VK driver
From:   Scott Branden <scott.branden@broadcom.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        kbuild test robot <lkp@intel.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <skhan@linuxfoundation.org>,
        bjorn.andersson@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        kbuild-all@lists.01.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Dan Carpenter <error27@gmail.com>
References: <20200420162809.17529-7-scott.branden@broadcom.com>
 <202004221945.LY6x0DQD%lkp@intel.com> <20200422113558.GJ2659@kadam>
 <b626e7fe-ae3f-827f-6f5b-2e6639f55775@broadcom.com>
Message-ID: <d9e6d8a0-9e99-e822-8907-e1478c3a7f47@broadcom.com>
Date:   Wed, 22 Apr 2020 15:01:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b626e7fe-ae3f-827f-6f5b-2e6639f55775@broadcom.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2020-04-22 9:13 a.m., Scott Branden wrote:
>
>
> On 2020-04-22 4:35 a.m., Dan Carpenter wrote:
>> On Wed, Apr 22, 2020 at 07:17:34PM +0800, kbuild test robot wrote:
>>> Hi Scott,
>>>
>>> I love your patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on driver-core/driver-core-testing]
>>> [also build test WARNING on next-20200421]
>>> [cannot apply to char-misc/char-misc-testing kselftest/next 
>>> linus/master v5.7-rc2]
>>> [if your patch is applied to the wrong git tree, please drop us a 
>>> note to help
>>> improve the system. BTW, we also suggest to use '--base' option to 
>>> specify the
>>> base tree in git format-patch, please see 
>>> https://stackoverflow.com/a/37406982]
>>>
>>> url: 
>>> https://github.com/0day-ci/linux/commits/Scott-Branden/firmware-add-partial-read-support-in-request_firmware_into_buf/20200422-114528
>>> base: 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git 
>>> 55623260bb33e2ab849af76edf2253bc04cb241f
>>> reproduce:
>>>          # apt-get install sparse
>>>          # sparse version: v0.6.1-191-gc51a0382-dirty
>>>          make ARCH=x86_64 allmodconfig
>>>          make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
>>                                             ^^^^^^^^^^^^^^^^^^^
>>
>> Sorry, you asked me about this earlier.  You will need to add
>> -D__CHECK_ENDIAN__ to enable these Sparse warnings.
> This is strange.  I ran the sparse build and thought I had fixed all 
> the issues.
> I'll have to try again.
>
> One other question with the sparse build.  I get many of the messages 
> printed but the build seems to go to the end (even without my patches 
> applied):
> ./arch/x86/include/asm/paravirt.h:333:9: error: got __inline
> ./arch/x86/include/asm/paravirt.h:338:9: error: Expected ( after asm
> ./arch/x86/include/asm/paravirt.h:338:9: error: got __inline
> ./arch/x86/include/asm/paravirt.h:343:9: error: Expected ( after asm
> ./arch/x86/include/asm/paravirt.h:343:9: error: got __inline
> ./arch/x86/include/asm/paravirt.h:348:9: error: Expected ( after asm
> ./arch/x86/include/asm/paravirt.h:348:9: error: too many errors
>
> Any way to suppress or I am doing something wrong?  I just run the 2 
> make commands:
>
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
I figured out the sparse utility on ubuntu 18.04 is out of date causing 
the issue.
>
>> regards,
>> dan carpenter
>>
>

