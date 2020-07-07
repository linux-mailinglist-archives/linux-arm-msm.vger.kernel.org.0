Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9263217BFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 01:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgGGX7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 19:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729418AbgGGX7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 19:59:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736ECC08C5E3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 16:59:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so13900695pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 16:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t+MUHlMV05Venpi+dxgNFy9m2mM7Us7wpJwUgu+0RIA=;
        b=LafhCb4tq/+15NiiNOG2BKxCpeSoxaozRMft+310cV24Ytgchd8f5pyzQOSHeWZXfw
         sY1Dm+QXQug+61+HPKC9CsVVEyxHf9zqWNxuuTHnNPhg66oQiL6GpDh7ADEmoCmMSf41
         2+4zCqnrVxslrHZBmUrwZXf+GBK3TOSDNm1TQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t+MUHlMV05Venpi+dxgNFy9m2mM7Us7wpJwUgu+0RIA=;
        b=JqfCBc6/j9phN5cfCMsB2rhYl/rWjWdiEJ0VvZArvUn8rQMjdbw7VNvBFlCC8rc6n7
         x/rcuRLP0GNYfSVHANqW2afnS88Tb1wtqtdN2ZR7sAiF9dtcheV07r/ywGTj31J0oTah
         XoE/Hn3beTSRxoW4/0Bbwb7jrAPkjy2Ecx18RvRrZAwnWfF4bXPNwj5Lez0tDnxh2DY5
         1QKWRYPJVVpBwqk9P0/KcC6HQBqUTR+Q/IGZjgpcj9TbSMFgR6tt0VGfWJfCepju3oDF
         Rh5ADGXl3c8uDNCOjckv76NXqEXReMSfHy/kSRaDkUsrMC9ePqMbfQWoUPuQUokkIxXv
         uEbA==
X-Gm-Message-State: AOAM530j8EqUme4okDkcvqiY06W71Sem74C6bwIa42E0idEGfpRlvJRQ
        JDji4ihdztEzYkXdeK0WkKZ0Ow==
X-Google-Smtp-Source: ABdhPJxrg7MIOsckToNcEU8cl8R/PG88U4PcKuHFAM793HgSei/rQl//+UCXuWhNnVDpB4swbIRxQw==
X-Received: by 2002:aa7:8651:: with SMTP id a17mr44429243pfo.48.1594166381010;
        Tue, 07 Jul 2020 16:59:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 66sm10992837pfg.63.2020.07.07.16.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 16:59:40 -0700 (PDT)
Date:   Tue, 7 Jul 2020 16:59:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Scott Branden <scott.branden@broadcom.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
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
        Takashi Iwai <tiwai@suse.de>, linux-kselftest@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH v10 4/9] test_firmware: add partial read support for
 request_firmware_into_buf
Message-ID: <202007071659.38721F7@keescook>
References: <20200706232309.12010-1-scott.branden@broadcom.com>
 <20200706232309.12010-5-scott.branden@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706232309.12010-5-scott.branden@broadcom.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 06, 2020 at 04:23:04PM -0700, Scott Branden wrote:
> Add additional hooks to test_firmware to pass in support
> for partial file read using request_firmware_into_buf.
> buf_size: size of buffer to request firmware into
> partial: indicates that a partial file request is being made
> file_offset: to indicate offset into file to request
> 
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>

I am a fan of tests. :) If Luis gives an Ack here, you're good.

-- 
Kees Cook
