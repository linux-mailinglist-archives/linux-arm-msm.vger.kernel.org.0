Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A15217BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 01:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbgGGXlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 19:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgGGXlA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 19:41:00 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00455C08C5E1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 16:40:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id cm21so352882pjb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+qsfHnXN4F+YEwETsQED11ORVN8eSCHPY9sNm+VzKiE=;
        b=dfwsrWMWQXKk98nBQT0zKCcMgM2CYJMVBv5xq71lWfK4e3eNBX3+TIoBsD9shyxp+a
         /BspAc5iLOh45pal+FknoV+rVp7AzTkJ15nRomNNzb4Q+iiUJ4hdBQdSPo3Y2zx5kZAU
         NQaKaRX5qq3OWa8xLA8ACmvgxCobMjwHQg2vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+qsfHnXN4F+YEwETsQED11ORVN8eSCHPY9sNm+VzKiE=;
        b=I6m4yDBp2T6yWsX1n1WuE9kV5cKHk/K6Ta2P7J0X7gBi/Us/oK1oBT8qKOFZTPZu+q
         j+0aGXQW03QkpUQGd4ZwQ5Z292ITcGhCP+FL3c/fNrY6PEoUcEQPucVJwfWJp/Ofs1Rh
         k4DJyVSsUT6UXRSemzuZ5RMAYmGERQtbUnXIBaZnOugDuq1+j2QM4PwZsc7lfFKAwo/S
         tKvB8nxgOFCFDmvXUQWRqYGErXT9R0fPu8HeszyKAu/jNC7TlS9ZgBi5zLT18PKWqo3V
         BZ2XtZkjjMyNzeG+bskWDqT1m7pCq12fiozgIzvGXSsN6ESCb46oTBEzxteM1zISZbxq
         cAEw==
X-Gm-Message-State: AOAM530s0L0q0VpDZpizpzU+aW/a0W00slafPTONn2bueoadsOHRQ97x
        u6sqPxkuthf7M7kmmrQSeE2pjw==
X-Google-Smtp-Source: ABdhPJznDqnbmackWsksp8CmINCpL3p2ylcX2LFfCew2p3uhTVRTDZtOXaCuS1FezTamiBVHO3ifLQ==
X-Received: by 2002:a17:902:d211:: with SMTP id t17mr11298783ply.106.1594165259350;
        Tue, 07 Jul 2020 16:40:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c187sm22795684pfc.146.2020.07.07.16.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 16:40:58 -0700 (PDT)
Date:   Tue, 7 Jul 2020 16:40:57 -0700
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
Subject: Re: [PATCH v10 1/9] fs: move kernel_read_file* to its own include
 file
Message-ID: <202007071637.ABF914AB@keescook>
References: <20200706232309.12010-1-scott.branden@broadcom.com>
 <20200706232309.12010-2-scott.branden@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200706232309.12010-2-scott.branden@broadcom.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 06, 2020 at 04:23:01PM -0700, Scott Branden wrote:
> Move kernel_read_file* out of linux/fs.h to its own linux/kernel_read_file.h
> include file. That header gets pulled in just about everywhere
> and doesn't really need functions not related to the general fs interface.
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/base/firmware_loader/main.c |  1 +
>  fs/exec.c                           |  1 +
>  include/linux/fs.h                  | 39 ----------------------
>  include/linux/ima.h                 |  1 +
>  include/linux/kernel_read_file.h    | 52 +++++++++++++++++++++++++++++
>  include/linux/security.h            |  1 +
>  kernel/kexec_file.c                 |  1 +
>  kernel/module.c                     |  1 +
>  security/integrity/digsig.c         |  1 +
>  security/integrity/ima/ima_fs.c     |  1 +
>  security/integrity/ima/ima_main.c   |  1 +
>  security/integrity/ima/ima_policy.c |  1 +
>  security/loadpin/loadpin.c          |  1 +
>  security/security.c                 |  1 +
>  security/selinux/hooks.c            |  1 +
>  15 files changed, 65 insertions(+), 39 deletions(-)
>  create mode 100644 include/linux/kernel_read_file.h

This looks like too many files are getting touched. If it got added to
security.h, very few of the above .c files will need it explicitly
added (maybe none). You can test future versions of this change with an
allmodconfig build and make sure you have a matching .o for each .c
file that calls kernel_read_file(). :)

But otherwise, sure, seems good.

-- 
Kees Cook
