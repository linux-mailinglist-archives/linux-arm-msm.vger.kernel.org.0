Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5D7F1D0724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 08:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbgEMGXe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 02:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729399AbgEMGXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 02:23:33 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B48C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 23:23:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id fu13so10515478pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 23:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=pPDL7nHthBYJbuOWF4Ez9lptkfcJt9l/vKCI5S+qTUQ=;
        b=G3CWkGbqwr2ZjOkZmxg0bhfVzNRTgFZZRSpV9HK+yrfulwjrNU4oBk47i1deBCP+ZF
         nEBsEOGlMLwMdgIHMhAH1l1xiVCVoevr5Btvz/Ug/YyuVlzenAcFdxkJwa9sGfr9jxww
         LvzPS+Wbj75ICGRhG9ORbuA40ZPMfZnRiBIs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=pPDL7nHthBYJbuOWF4Ez9lptkfcJt9l/vKCI5S+qTUQ=;
        b=XyfD8y6cni1wy9LuKwRQtTq5131/0UtqXUofVHqo/DyFY8ibghYD8xTbiqHWhcbVSL
         729Wq58oq2v443j/vuxAD0MT/hFX10ntCA2d2Ip99qYkpAHg5+4Wj8dOPD0/poJVMjvR
         HUN+zJlUYgRvcDFAF27f+y+yNT2C9fEMCMVTGU7njKINtuDGrprp7wolOtlfxMuZsVpJ
         hKk99IClTPg8ZZI8TvBGPwmAqq2WEY+bd3fnlKAYs2OD8f1CTYMPzKYbpM1P35uncTQg
         oyxHc/4OX7jEwZ3iWl/F3cV5v+oEdik2ASxVYFVZNJvMMmH1AGsfOW7sxi16lH/PfK+P
         TIFg==
X-Gm-Message-State: AGi0Pua/RGeelhtghdbSucs+a7XGBd9Gzxy18rl0MJBz1Uc3oP7SPoPc
        vUgvfZEuS1rxB/PNCbAm4MT6Sw==
X-Google-Smtp-Source: APiQypIFwsxMDhFCuYj9/P/Ksn5rHw0yMkAgXB9HDoGdhukybNyGidMDC7m4rw7KW/4GSfCdYKmotw==
X-Received: by 2002:a17:90a:d086:: with SMTP id k6mr34164442pju.47.1589351011521;
        Tue, 12 May 2020 23:23:31 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id l11sm606845pjj.33.2020.05.12.23.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2020 23:23:30 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] fs: introduce kernel_pread_file* support
To:     Luis Chamberlain <mcgrof@kernel.org>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-fsdevel@vger.kernel.org,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Kees Cook <keescook@chromium.org>,
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <20200508002739.19360-1-scott.branden@broadcom.com>
 <20200508002739.19360-2-scott.branden@broadcom.com>
 <20200513002741.GG11244@42.do-not-panic.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <2e4bc125-5fe5-e3e5-4881-29374da942aa@broadcom.com>
Date:   Tue, 12 May 2020 23:23:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513002741.GG11244@42.do-not-panic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luis,

A few comments inline before I cleanup.

On 2020-05-12 5:27 p.m., Luis Chamberlain wrote:
> On Thu, May 07, 2020 at 05:27:33PM -0700, Scott Branden wrote:
>> diff --git a/fs/exec.c b/fs/exec.c
>> index 06b4c550af5d..cfab212fab9d 100644
>> --- a/fs/exec.c
>> +++ b/fs/exec.c
>> @@ -896,10 +896,14 @@ struct file *open_exec(const char *name)
>>   }
>>   EXPORT_SYMBOL(open_exec);
>>   
>> -int kernel_read_file(struct file *file, void **buf, loff_t *size,
>> -		     loff_t max_size, enum kernel_read_file_id id)
>> -{
>> -	loff_t i_size, pos;
>> +int kernel_pread_file(struct file *file, void **buf, loff_t *size,
>> +		      loff_t pos, loff_t max_size, unsigned int flags,
> You use int flags, but.. these are mutually exclusive operations, and
> so flags is a misnomer. Just use an enum instead of a define, that way
> we can use kdoc for documentation.
OK, flags could be used to expand with additional flag options in the 
future (without change to function prototype, but will change to enum if 
that is what is desired.
>> +EXPORT_SYMBOL_GPL(kernel_pread_file);
>> +EXPORT_SYMBOL_GPL(kernel_pread_file_from_path);
>> +EXPORT_SYMBOL_GPL(kernel_pread_file_from_path_initns);
>> +EXPORT_SYMBOL_GPL(kernel_pread_file_from_fd);
> If no one is using these don't export them. I think you only use one of
> these. In fact just remove the code from the ones which are not used.
I do not use them but added them to provide consistent api with 
kernel_read_file_* functions.  That way someone can take advantage of 
the _from_path and from_fd variants in the future if desired. But if you 
want them removed it is simple to drop the EXPORT_SYMBOL_GPL and then 
add that back when first driver that calls them needs them in the future.

Note: Existing kernel_read_file_from_path_initns is not used in the 
kernel.  Should we delete that as well?

>
>    Luis
Thanks,
  Scott
