Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A728EB5D61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 08:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfIRGeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 02:34:10 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37301 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbfIRGeH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 02:34:07 -0400
Received: by mail-pf1-f195.google.com with SMTP id y5so3690115pfo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2019 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7hTH+QZ0Rg1J8IDO+1UiOPyFh3Jvo6QqRltmoWe2MW4=;
        b=X0g3AnbCKw+4TwyXRilD5SoauIs7wFaCMcwJKFXFr+zMxnDhMe2h8FvUT7Uilb0cyQ
         rOHGkNZRi46MCx5F3tyS4fy75friu9ruEtFpKh0Z2S6tWdUkZx4uLAeBKh4xjqoxzzut
         G81E4cQU5C8fHwDxi0SovdBNlntxF3QSRCx+VA6snwPzZXgabK/h0b2LIylAYFPIKd47
         JWy1+Eyc3nQWc3YU6i5tTx4u3XuZVT0CYgFy7OpgYJpZi0MtU3J1bN49gsY96lzLHLk9
         z5THRSdFErwm8GSn5Xt6MaUpUggMzlOHC/DVjWGjGE6c61eUSrIhwQ5edcmv5qO4QayY
         wi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7hTH+QZ0Rg1J8IDO+1UiOPyFh3Jvo6QqRltmoWe2MW4=;
        b=b0srFKljQV4qIKqX9KU22jny5NWiu84daBYxCNEExLIA//yH/bq33Bivx1c+nOkJKP
         +feF4lEJqQqBMGCy4TqQef7zKwhyS6EzAg88IoDbFcVZhAIn/OJ8e/kVuFH72aSD50sK
         7DbLJKubtWDzK0pSzgGaVDExaNMx12r+vZluZDKv6s9/ReSDpNzWyhqLAbh3H2smfFXp
         iu6mz0sbXxgbRwJuOzPUPXQso5X/HKInzuk3tc+GQNxn9lmSuCFZEaCKmmda2XUdDUpX
         leKQVMKOLkhvVqjw1CVTReyLpIJVYdVfU4EQzdNKtmYmXRFc+AxA+UIuWMwB3rXulMTQ
         TxHw==
X-Gm-Message-State: APjAAAVFGMn1wVxnnXO8/WPS1358LoIF9H9//xVRRuD3Tmwo9yF+NtF/
        FRJNj8dbx1E6PV3uuQRgHjsD+Q==
X-Google-Smtp-Source: APXvYqzAcu1KGj9IOpAdn6O/jLmmzMqwMmQyCiZJCCQ7WyfF5e2xkCOUO7dFfLtz2I7kRQrfl391pA==
X-Received: by 2002:aa7:8dcf:: with SMTP id j15mr2449689pfr.5.1568788446445;
        Tue, 17 Sep 2019 23:34:06 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y28sm7614921pfq.48.2019.09.17.23.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 23:34:05 -0700 (PDT)
Date:   Tue, 17 Sep 2019 23:34:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/5] misc: fastrpc: fix memory leak from miscdev->name
Message-ID: <20190918063403.GD1636@tuxbook-pro>
References: <20190913152532.24484-1-jorge.ramirez-ortiz@linaro.org>
 <20190913152532.24484-3-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913152532.24484-3-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 13 Sep 08:25 PDT 2019, Jorge Ramirez-Ortiz wrote:

> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Fix a memory leak in miscdev->name by using devm_variant
> 
> Orignally reported by kmemleak:
>     [<ffffff80088b74d8>] kmemleak_alloc+0x50/0x84
>     [<ffffff80081e015c>] __kmalloc_track_caller+0xe8/0x168
>     [<ffffff8008371ab0>] kvasprintf+0x78/0x100
>     [<ffffff8008371c6c>] kasprintf+0x50/0x74
>     [<ffffff8008507f2c>] fastrpc_rpmsg_probe+0xd8/0x20c
>     [<ffffff80086b63b4>] rpmsg_dev_probe+0xa8/0x148
>     [<ffffff80084de50c>] really_probe+0x208/0x248
>     [<ffffff80084de2dc>] driver_probe_device+0x98/0xc0
>     [<ffffff80084dec6c>] __device_attach_driver+0x9c/0xac
>     [<ffffff80084dca8c>] bus_for_each_drv+0x60/0x8c
>     [<ffffff80084de64c>] __device_attach+0x8c/0x100
>     [<ffffff80084de6e0>] device_initial_probe+0x20/0x28
>     [<ffffff80084dcbd0>] bus_probe_device+0x34/0x7c
>     [<ffffff80084da32c>] device_add+0x420/0x498
>     [<ffffff80084da680>] device_register+0x24/0x2c
> 

Cc: stable@vger.kernel.org
Fixes: f6f9279f2bf0 ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

You should append your S-o-b here, as you forwarded the patch.


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 8903388993d3..bc03500bfe60 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1599,8 +1599,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  
>  	data->miscdev.minor = MISC_DYNAMIC_MINOR;
> -	data->miscdev.name = kasprintf(GFP_KERNEL, "fastrpc-%s",
> -				domains[domain_id]);
> +	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
> +					    domains[domain_id]);
>  	data->miscdev.fops = &fastrpc_fops;
>  	err = misc_register(&data->miscdev);
>  	if (err)
> -- 
> 2.23.0
> 
