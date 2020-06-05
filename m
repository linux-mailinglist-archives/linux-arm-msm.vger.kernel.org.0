Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B28C1F037F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2020 01:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgFEXbU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 19:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbgFEXbT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 19:31:19 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAC9C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2020 16:31:19 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so5669549pfn.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2020 16:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QT3TOfTZM7n8upLOBb9CoT35uLEYwP8QmqKQlYpotu8=;
        b=aRVd9mVasyOpi3qj6L+9LPZYEZeqaeUcati7cYFOWdqTeHQHVCYu1Mg3TZAEJ+Cemq
         dfXKAo+Q6UNAFsH/2ZXA/hLBkWgSa0nz4wSjsYb/wFS0rixfFi3JJfcl8n4oR6+Ps1Qy
         U+/FztKv09P0+eWToCYdTvhCeWQASBbcJYwWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QT3TOfTZM7n8upLOBb9CoT35uLEYwP8QmqKQlYpotu8=;
        b=hwzGg8mIPy0Ns9bhdTuDXaTJbZSiuzeG+3APqMNqw7j71N2KmrOBlk4W3DsTIWpCze
         aEr3KCrqPVw1SebhldYZWgAgpANfpsQzf0/aI3kMgk4+WMh0WJNlq6psoqSFmzMCVBy1
         FnQgrahy2/URI1nPCrZmMyN3lhxs+s12/0dETENdT7wpeiNuVwTIYtg5RgtIJEupm61M
         my1P6DDdaqvDFxU3pZ3ri/xr0plo3k0TbvyGAFLhgpggjlMK+DPysVWKSa02go/j11ed
         E0itzujyHPLN24GBcE/qyPIIcg54pUFh4KMmrSk6TxXzVndlezmSVW5qVDPQgUto1YzU
         twOA==
X-Gm-Message-State: AOAM530dr+xYpcFii2ZV7sK8Xv7CnkaLHxO9I7eu7ykzpm/FCe2hL7nt
        U+/zSlHYEnJMmSpz+qc5qXykNQ==
X-Google-Smtp-Source: ABdhPJyjNvTuZNiXBWA+wu5gD204795YG4uT5HA5nAd7pQQKXRGvD9NKYFP7JEix9AMrHm3M2js3SQ==
X-Received: by 2002:a65:6715:: with SMTP id u21mr12073266pgf.365.1591399879036;
        Fri, 05 Jun 2020 16:31:19 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 125sm588134pff.130.2020.06.05.16.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 16:31:17 -0700 (PDT)
Subject: Re: [PATCH v6 8/8] ima: add FIRMWARE_PARTIAL_READ support
To:     Mimi Zohar <zohar@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
References: <20200605225959.12424-1-scott.branden@broadcom.com>
 <20200605225959.12424-9-scott.branden@broadcom.com>
 <1591399166.4615.37.camel@linux.ibm.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <824407ae-8ab8-0fe3-bd72-270fce960ac5@broadcom.com>
Date:   Fri, 5 Jun 2020 16:31:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1591399166.4615.37.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mimi,

On 2020-06-05 4:19 p.m., Mimi Zohar wrote:
> Hi Scott,
>
> On Fri, 2020-06-05 at 15:59 -0700, Scott Branden wrote:
>> @@ -648,6 +667,9 @@ int ima_post_read_file(struct file *file, void *buf, loff_t size,
>>   	enum ima_hooks func;
>>   	u32 secid;
>>   
>> +	if (!file && read_id == READING_FIRMWARE_PARTIAL_READ)
>> +		return 0;
> The file should be measured on the pre security hook, not here on the
> post security hook.  Here, whether "file" is defined or not, is
> irrelevant.  The test should just check "read_id".
OK, will remove the !file from here.
>
> Have you tested measuring the firmware by booting a system with
> "ima_policy=tcb" specified on the boot command line and compared the
> measurement entry in the IMA measurement list with the file hash (eg.
> sha1sum, sha256sum)?
Yes, I enabled IMA in my kernel and added ima_policy=tsb to the boot 
command line,

Here are the entries from 
/sys/kernel/security/ima/ascii_runtime_measurements of the files I am 
accessing.
Please let me know if I am doing anything incorrectly.

10 4612bce355b2dbc45ecd95e17001636be8832c7f ima-ng 
sha1:fddd9a28c2b15acf3b0fc9ec0cf187cb2153d7f2 
/lib/firmware/vk-boot1-bcm958401m2.ecdsa.bin
10 4c0eb0fc30eb7ac3a30a27f05c1d2a8d28d6a9ec ima-ng 
sha1:b16d343dd63352d10309690c71b110762a9444c3 
/lib/firmware/vk-boot2-bcm958401m2_a72.ecdsn

The sha1 sum matches:
root@genericx86-64:/sys/kernel/security/ima# sha1sum 
/lib/firmware/vk-boot1-bcm958401m2.ecdsa.bin
fddd9a28c2b15acf3b0fc9ec0cf187cb2153d7f2 
/lib/firmware/vk-boot1-bcm958401m2.ecdsa.bin

root@genericx86-64:/sys/kernel/security/ima# sha1sum 
/lib/firmware/vk-boot2-bcm958401m2_a72.ecdsa.bin
b16d343dd63352d10309690c71b110762a9444c3 
/lib/firmware/vk-boot2-bcm958401m2_a72.ecdsa.bin


>
> Mimi
>
>> +
>>   	if (!file && read_id == READING_FIRMWARE) {
>>   		if ((ima_appraise & IMA_APPRAISE_FIRMWARE) &&
>>   		    (ima_appraise & IMA_APPRAISE_ENFORCE)) {

