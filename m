Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5089283D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 18:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731353AbfEWQgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 12:36:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45450 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731157AbfEWQgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 12:36:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id a5so2961382pls.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2019 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZHrK+VEAX/VhtgbnGngaaCqD5utZFEMM219guRaxE+E=;
        b=GorN/Qui+MVXqMMHGzBJqclGX9G6qBILF4AZy7hy0J2Jkz9bJv5a/lgqT77AO7krgL
         t5pCAjjuJBDRMa2gSHydXKIZze53hCW2b2ix5/3EWQv556/nTMUaIHDAr2/emt1R90rs
         dXn0pYf1PUHGFpkIoQWqHfXwJwBLb1vxtNl4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZHrK+VEAX/VhtgbnGngaaCqD5utZFEMM219guRaxE+E=;
        b=Tx7gb+G/1BKEbK8I/m+BRa2fRgFpqZhOdQaJzvJR347csFVpdOcqfnoAKMXiiAmUkZ
         B5F1VA83AVkxtxFw8NTfK9+getqwH0H6nX2BXQK5qBbAL+TEW+SLUDW6ZPdazgr7Vvpk
         GVIy1NsUJ66CPRm/nlynxpgVS8yOOQEMYgiecozTib3kbat6xIaKS4OJC5i+UF/7g4zM
         7H9uKYWuoIbqx/JQfMxhD6OiRPPz1t2ykH0n343K+uGbbZOxPPj0ECPZtXmZTwls02t/
         RzFQ+RyGM/+1vlXYNCnE6f4H1SsgRWHihOMVtYoGJG49sbBfEuXGiMeNykPcRDzsKSFR
         I2bw==
X-Gm-Message-State: APjAAAXcEXnTGdlFnjUVonF21V7sgkLn1vmc7glK4tr/WPTBlhJGgWb5
        nZ6m47NycvCHwAWOWw9BpASxFQ==
X-Google-Smtp-Source: APXvYqxzC+ORWnTrrOuRAOV5GhS5hVztdWBZSW4dRBg2tKPt3YliHLug2gmkP3GPmyVy614jfIqcmg==
X-Received: by 2002:a17:902:bd94:: with SMTP id q20mr77186915pls.146.1558629365385;
        Thu, 23 May 2019 09:36:05 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id q75sm41467250pfa.175.2019.05.23.09.36.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 09:36:04 -0700 (PDT)
Subject: Re: [PATCH 2/3] firmware: add offset to request_firmware_into_buf
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>
References: <20190523025113.4605-1-scott.branden@broadcom.com>
 <20190523025113.4605-3-scott.branden@broadcom.com>
 <20190523055233.GB22946@kroah.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <15c47e4d-e70d-26bb-9747-0ad0aa81597b@broadcom.com>
Date:   Thu, 23 May 2019 09:36:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523055233.GB22946@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

On 2019-05-22 10:52 p.m., Greg Kroah-Hartman wrote:
> On Wed, May 22, 2019 at 07:51:12PM -0700, Scott Branden wrote:
>> Add offset to request_firmware_into_buf to allow for portions
>> of firmware file to be read into a buffer.  Necessary where firmware
>> needs to be loaded in portions from file in memory constrained systems.
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   drivers/base/firmware_loader/firmware.h |  5 +++
>>   drivers/base/firmware_loader/main.c     | 49 +++++++++++++++++--------
>>   include/linux/firmware.h                |  8 +++-
>>   3 files changed, 45 insertions(+), 17 deletions(-)
> No new firmware test for this new option?  How do we know it even works?

I was unaware there are existing firmware tests.  Please let me know 
where these tests exists and I can add a test for this new option.

We have tested this with a new driver in development which requires the 
firmware file to be read in portions into memory.  I can add my 
tested-by and others to the commit message if desired.

> :)
>
> thanks,
>
> greg k-h

Regards,

Scott

