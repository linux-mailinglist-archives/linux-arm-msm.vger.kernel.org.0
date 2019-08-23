Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 916479B740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 21:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436864AbfHWTor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 15:44:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40515 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436835AbfHWToq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 15:44:46 -0400
Received: by mail-pg1-f194.google.com with SMTP id w10so6304462pgj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2019 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oqC5xMMUbO+7V3ahvqsbNQ/fSXZ8+DsANxH/wBr9efU=;
        b=Wg7Vh2cQk3mZ+LOk5wcrEiyksh6120g652gNH8TDhjTA5q3FBDvG0IIuxcjbCD8eIP
         LhliYDFeq/BrRg6qXP6XtIWDjsY6gx2dzpOWFIWG2BC4hx3fHQ6RIqO6vH2uuXO+LlXy
         K0ljUn6TVEunhoY/CgBzCEUPNHwh2/q8IJ6Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oqC5xMMUbO+7V3ahvqsbNQ/fSXZ8+DsANxH/wBr9efU=;
        b=abvHzBkhJcyTQvvdsUaNkC/DrzbcexTRpH1MfOdy4hRYQob8WlZMs/4Oux3u8hzhF9
         yAFES6I3O2QIV/4C5YeshT4Y7REX0Nry7yTHqoXuibqnNLHl/xmJHRY0HQPjlTvZpA+K
         eq8EFgIwSyuFCDkJgYXCl/Y9aayaDUW06pRdDaqNRJ12vXutRTSn+Zo0/rKqRnzvmYjf
         lNafRGp+ZAsaYA5GhenJnMcKAnq4ah4mA9Pzag3tZ4aiBvcXHdK2VcWrs7ILzbbt9z78
         PLQo6Zecrepdbj9Tg2yVX1yIfTjDaQH9e8Ydi+WBozyVlC1Ds/XcUhivlFm36zLGhxsZ
         qcPA==
X-Gm-Message-State: APjAAAVZ8NeRsRQUfp8/vs3+zeCFdXiwvS3eadaxn4+GP+tqVLCTPfVx
        budFsPQZarAcFs75WXgiyZLqYg==
X-Google-Smtp-Source: APXvYqzkVWrnPqc1ZXrsqfv6TsSH/aBZJ8pJxskRShIF3jD8xD9RghuJl0fSJBDJTy57m4Ln5Pxwiw==
X-Received: by 2002:a63:505a:: with SMTP id q26mr5298383pgl.18.1566589485862;
        Fri, 23 Aug 2019 12:44:45 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id j15sm3332347pfr.146.2019.08.23.12.44.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 12:44:44 -0700 (PDT)
Subject: Re: [PATCH 2/7] firmware: add offset to request_firmware_into_buf
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-kselftest@vger.kernel.org
References: <20190822192451.5983-1-scott.branden@broadcom.com>
 <20190822192451.5983-3-scott.branden@broadcom.com>
 <s5hef1crybq.wl-tiwai@suse.de>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <10461fcf-9eca-32b6-0f9d-23c63b3f3442@broadcom.com>
Date:   Fri, 23 Aug 2019 12:44:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hef1crybq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Takashi,

Thanks for review.  comments below.

On 2019-08-23 3:05 a.m., Takashi Iwai wrote:
> On Thu, 22 Aug 2019 21:24:46 +0200,
> Scott Branden wrote:
>> Add offset to request_firmware_into_buf to allow for portions
>> of firmware file to be read into a buffer.  Necessary where firmware
>> needs to be loaded in portions from file in memory constrained systems.
> AFAIU, this won't work with the fallback user helper, right?
Seems to work fine in the fw_run_tests.sh with fallbacks.
> Also it won't work for the compressed firmware files as-is.
Although unnecessary, seems to work fine in the fw_run_tests.sh with 
"both" and "xzonly" options.
>
> So this new API usage is for the limited use cases, hence it needs
> such checks and returns error/warns if the condition isn't met.
>
> IOW, this can't be a simple extension of request_firmware_into_buf()
> to pass a new flag.
>
>
> thanks,
>
> Takashi
