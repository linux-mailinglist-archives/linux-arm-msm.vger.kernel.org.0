Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00E7345491A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 15:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238730AbhKQOtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 09:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbhKQOtl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 09:49:41 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7739C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 06:46:42 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id bf8so6886568oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MlZnU/mGa3t8lFvT3gWebiTE3OHE/PLCtEsn2Vv+mPw=;
        b=RNPNdP/ZchqxGv5kfs4KJaIs4f+O7DXWbmfzZnIGd9VcOApT8XZ1tksur5sa8YzQns
         WVcx+957h7dvMmX6HZJq5MpQFZEN3//yhp1H5ybREYVnkz9Q65kJy/ppu/8aJmy7QkBN
         /pGhx4ZJVWJI+DDhedk//CLeez0lijqTM39HeJUVVUrajxRkaGat9X9WLnX7/3KEWDf1
         2mtCL1eyQgaih1Z9KN0tb9WKVogpqkmglaSyh7Vs1aaLc0xQBjL28SLNtPKZnLBD29VL
         ADtrRrRylbTnxCithgv6e1QXoaBGCYMW2YI8J0Ayxis8BLhP6WwzeWi36baqsYw2VYIH
         YPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MlZnU/mGa3t8lFvT3gWebiTE3OHE/PLCtEsn2Vv+mPw=;
        b=hDpVQTHiAIvrdmPlWFGBNCbCIoBC+BNYd3o5NbZ1YURo2cGLnfoarKg4XBT676tNqG
         B39DvscCdhqDKX1StLfK8XnJQpSAXproFciRq6+7mVdlGbm2kwxpQPiXwYCid9d5c5WA
         AUX8kbe4Xon45JPqJCTEr8HhOfVW7A8Df2NIi28VKcP+zn6Ue4wd8ju5A/8YxH8ohcY9
         BU7iXqZojSvfXQc4h+9E/ACGFVMbNQa1SfPg07a49cc5vyMbgRZ0Z60iiWDFeJZlsIDK
         LtGAEXoq1ViYsWgho6p+k/sptURlhWU4Au4/SoufCc2VNpXd3UYXION0cWHdQNSU1kbm
         rPHQ==
X-Gm-Message-State: AOAM532E9PQ46EH2SLKDGHp6NjdEgZcQ3RmiUHOfNVUdnEjwNSXm8dSE
        rVzDdtI2Oam+V4/q9151+AkiqBkF6KF9PQ==
X-Google-Smtp-Source: ABdhPJzNJ1c3j1QrYQ6hswoWgZsbAxfMIhLMnSz+G5oGHs7cPZ3gxJCBPpFdTHzWw16MsNIibs02Yw==
X-Received: by 2002:a05:6808:220f:: with SMTP id bd15mr219628oib.12.1637160402013;
        Wed, 17 Nov 2021 06:46:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j20sm8874ota.76.2021.11.17.06.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 06:46:41 -0800 (PST)
Date:   Wed, 17 Nov 2021 08:46:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: Don't memcpy_toio more than is provided
Message-ID: <YZUVzkGykrIQS2oG@builder.lan>
References: <20211117065454.4142936-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117065454.4142936-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 17 Nov 00:54 CST 2021, Stephen Boyd wrote:

> If the string passed into qcom_pil_info_store() isn't as long as
> PIL_RELOC_NAME_LEN we'll try to copy the string assuming the length is
> PIL_RELOC_NAME_LEN to the io space and go beyond the bounds of the
> string. Let's only copy as many byes as the string is long, ignoring the
> NUL terminator.
> 
> This fixes the following KASAN error:
> 
>  BUG: KASAN: global-out-of-bounds in __memcpy_toio+0x124/0x140
>  Read of size 1 at addr ffffffd35086e386 by task rmtfs/2392
> 
>  CPU: 2 PID: 2392 Comm: rmtfs Tainted: G        W         5.16.0-rc1-lockdep+ #10
>  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>  Call trace:
>   dump_backtrace+0x0/0x410
>   show_stack+0x24/0x30
>   dump_stack_lvl+0x7c/0xa0
>   print_address_description+0x78/0x2bc
>   kasan_report+0x160/0x1a0
>   __asan_report_load1_noabort+0x44/0x50
>   __memcpy_toio+0x124/0x140
>   qcom_pil_info_store+0x298/0x358 [qcom_pil_info]
>   q6v5_start+0xdf0/0x12e0 [qcom_q6v5_mss]
>   rproc_start+0x178/0x3a0
>   rproc_boot+0x5f0/0xb90
>   state_store+0x78/0x1bc
>   dev_attr_store+0x70/0x90
>   sysfs_kf_write+0xf4/0x118
>   kernfs_fop_write_iter+0x208/0x300
>   vfs_write+0x55c/0x804
>   ksys_pwrite64+0xc8/0x134
>   __arm64_compat_sys_aarch32_pwrite64+0xc4/0xdc
>   invoke_syscall+0x78/0x20c
>   el0_svc_common+0x11c/0x1f0
>   do_el0_svc_compat+0x50/0x60
>   el0_svc_compat+0x5c/0xec
>   el0t_32_sync_handler+0xc0/0xf0
>   el0t_32_sync+0x1a4/0x1a8
> 
>  The buggy address belongs to the variable:
>   .str.59+0x6/0xffffffffffffec80 [qcom_q6v5_mss]
> 
>  Memory state around the buggy address:
>   ffffffd35086e280: 00 00 00 00 02 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
>   ffffffd35086e300: 00 02 f9 f9 f9 f9 f9 f9 00 00 00 06 f9 f9 f9 f9
>  >ffffffd35086e380: 06 f9 f9 f9 05 f9 f9 f9 00 00 00 00 00 06 f9 f9
>                     ^
>   ffffffd35086e400: f9 f9 f9 f9 01 f9 f9 f9 04 f9 f9 f9 00 00 01 f9
>   ffffffd35086e480: f9 f9 f9 f9 00 00 00 00 00 00 00 01 f9 f9 f9 f9
> 
> Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_pil_info.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
> index 7c007dd7b200..aca21560e20b 100644
> --- a/drivers/remoteproc/qcom_pil_info.c
> +++ b/drivers/remoteproc/qcom_pil_info.c
> @@ -104,7 +104,7 @@ int qcom_pil_info_store(const char *image, phys_addr_t base, size_t size)
>  	return -ENOMEM;
>  
>  found_unused:
> -	memcpy_toio(entry, image, PIL_RELOC_NAME_LEN);
> +	memcpy_toio(entry, image, strnlen(image, PIL_RELOC_NAME_LEN));
>  found_existing:
>  	/* Use two writel() as base is only aligned to 4 bytes on odd entries */
>  	writel(base, entry + PIL_RELOC_NAME_LEN);
> 
> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf
> -- 
> https://chromeos.dev
> 
