Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0AA1F0503
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2020 06:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgFFE5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Jun 2020 00:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgFFE5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Jun 2020 00:57:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE93C08C5C3
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2020 21:57:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b201so5943279pfb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2020 21:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AEeRqD/NorCUJBTa2b+IUYMUvQuNtNDzhJImkhNUMwE=;
        b=SvoXuSTIYbKCNLm3Rf+7U72DNelud+4d639oZBnjG8U23K7zlLH+w3p8CEs0PTD2dU
         Ja/nHOz6XUh0DjZ6xs6ZDwhhVtT0L8oSWdBRiKcSbDENa6K2+KVDoCZHJi5Hkz1nc1ai
         gDR8glzNryBj5xK1fylPWU9yiBhf+Lc+RZRZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AEeRqD/NorCUJBTa2b+IUYMUvQuNtNDzhJImkhNUMwE=;
        b=nw6mzmeyE/MlMSlsb+g2S+jgqayInFTVBrctgYsZGIZHM6NwWLCrW/WhlkSk1iiLSb
         +t8/n2eq7eizoA8jf5atCna5QUMRgmGEZh8jMskunxr+lD5HcZjmml6KPj/S9VzVXJl5
         9vQjwyPUySYb4ECqNXjunUj8eYVyz7xTazt+knmSscMPQTWWvRc74UpPo8ML+TpYgIi5
         DURViZqdF5dyOXv45BzGejOxGsk1+mqycXEJaOcKWK+vpZynG21fMF90a/1ns0/680hW
         5nCJc8ulcjii6DGFKfAAXi/Z8BvkY+CAPBi2X8xnh/i0XVO64aTgkdFpYWq3S0OnYkq+
         MEqw==
X-Gm-Message-State: AOAM530scJPa3qINMENp7dbLkjAZFihCAcZppSl55qYmItZfx2vWN0sh
        KHZLqRABep6VId6OgfIirhxppw==
X-Google-Smtp-Source: ABdhPJy1OnrZSXjJCECuXBSjTznNT2AEnf7+8B0WVOWyttYt253hWfCVsp/i4j2CztKv6MOa13rY4Q==
X-Received: by 2002:a63:ce0d:: with SMTP id y13mr12145554pgf.90.1591419433926;
        Fri, 05 Jun 2020 21:57:13 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id k126sm1088049pfd.129.2020.06.05.21.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 21:57:12 -0700 (PDT)
Subject: Re: [PATCH v6 1/8] fs: introduce kernel_pread_file* support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Brown <david.brown@linaro.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Shuah Khan <shuah@kernel.org>, bjorn.andersson@linaro.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Mimi Zohar <zohar@linux.ibm.com>,
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
        Andy Gross <agross@kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
References: <20200605225959.12424-1-scott.branden@broadcom.com>
 <20200605225959.12424-2-scott.branden@broadcom.com>
 <20200606032011.GM19604@bombadil.infradead.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <4ca91507-90a5-1a99-ab19-c6782423e870@broadcom.com>
Date:   Fri, 5 Jun 2020 21:56:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200606032011.GM19604@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthew,

On 2020-06-05 8:20 p.m., Matthew Wilcox wrote:
> On Fri, Jun 05, 2020 at 03:59:52PM -0700, Scott Branden wrote:
>> -int kernel_read_file(struct file *file, void **buf, loff_t *size,
>> -		     loff_t max_size, enum kernel_read_file_id id)
>> -{
>> -	loff_t i_size, pos;
>> +int kernel_pread_file(struct file *file, void **buf, loff_t *size,
>> +		      loff_t pos, loff_t max_size,
>> +		      enum kernel_pread_opt opt,
>> +		      enum kernel_read_file_id id)
> What is this 'kernel_pread_opt' foolishness?  Why not just pass in
> ~0UL as max_size if you want the entire file?
That is not how existing kernel_read_file api works - max_size is specified.
I guess not everyone has unlimited memory to read a file on any size.
>
>> -int kernel_read_file_from_path_initns(const char *path, void **buf,
>> -				      loff_t *size, loff_t max_size,
>> -				      enum kernel_read_file_id id)
>> +extern int kernel_pread_file_from_path_initns(const char *path, void **buf,
> extern?  really?  i'm shocked gcc doesn't vomit on that.
A typo.  thanks.  You'll have to ask the compiler gods about your shock.

