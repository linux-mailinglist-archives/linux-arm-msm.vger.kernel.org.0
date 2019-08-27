Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF3919F579
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfH0Vpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:45:52 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37828 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfH0Vpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:45:51 -0400
Received: by mail-wr1-f66.google.com with SMTP id z11so318359wrt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UKwNCZ3kYbqKK0CEnypD41umaTIfpON2HwG6q7KFDlI=;
        b=oQAowJpwokGyA7CyiOV+GSrCQJvxChQfZevZu1BLUnGoxo609uYzfiHOohYW+2Go3s
         xir3yP2cD30zuXAkniV6fA/YXpyekCxqLfDVhB53xEMSQC4dRvv5psVbnEgIK3BRIk4a
         6BBmkDS/PIVst70jZCVj/KQ+7XtmdW9do8OPuT2LiJGR6Lg9gu6Z7NeAkQok5Kzv1+A5
         65GTrcwSe1W8UW3+dHIVW6RXQX4OP9/KHeXPCeaEaYK+10iGHDA8SCYxFLrbeIqNFyCz
         NwN/wQn2S3FqsdHzfat4o21Jw/NbIgEOpIhIje4bbw/lTFmd/2bEuKkDiq6ewqx5rtx+
         5xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UKwNCZ3kYbqKK0CEnypD41umaTIfpON2HwG6q7KFDlI=;
        b=UofzP4mQJSQIVMsz4HdjVIl9iVTnCfVWgiu+eoQdG95/7GEAgQLuNP3qjI67zZmA2c
         uzKfXAhrDJgboeCakvh0lt7d9xWpd2kSMVC4HVV/xIfLoZQ9bjS1l54zdMac+i3PL+UR
         WJRHRXsiu6ioB01KDlGZ14DPR+pjr1jTvcLWE20svGS/FSCdb0PH05r/XrRcXMiMxBaF
         eG/w+srE4fKQ/5m/vxjJml4MtTH7gAKhFYuXGUtJePbw92bJ37DEoogN7cXioM5IZExj
         zyzEzGZbMPIkC5UZPCfUbacgaN7joOtnnc1E6ofE+epOeIszUTp9ODMog2QExFIwl31G
         gLpA==
X-Gm-Message-State: APjAAAX1kpS3UhiyS4VLCiFVtwOZ/suciCUVDvaiUQR2j8CjzFShRwrB
        mDK0Bkz9v5gFCFPJrLiGQnRGeQ==
X-Google-Smtp-Source: APXvYqziAisOZLDMdT1NhbUMLZb+6dgffb+3qITgnWys+YhakxZqpmI/s8VFsjAs/reQoaQnTB+/hA==
X-Received: by 2002:a5d:5388:: with SMTP id d8mr262118wrv.299.1566942348151;
        Tue, 27 Aug 2019 14:45:48 -0700 (PDT)
Received: from [192.168.86.29] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id c11sm186282wrs.86.2019.08.27.14.45.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 14:45:47 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 4/5] misc: fastrpc: fix double refcounting on dmabuf
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, arnd@arndb.de,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mayank Chopra <mak.chopra@codeaurora.org>
References: <20190823100622.3892-1-srinivas.kandagatla@linaro.org>
 <20190823100622.3892-5-srinivas.kandagatla@linaro.org>
 <CAC8LzUAnz+RZYh+bBbJbXJYP3QDq4H1847W8rJxj-aF1B1J9QQ@mail.gmail.com>
Message-ID: <cb003c11-d331-a2c7-1eb4-a89ba025f4c6@linaro.org>
Date:   Tue, 27 Aug 2019 22:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAC8LzUAnz+RZYh+bBbJbXJYP3QDq4H1847W8rJxj-aF1B1J9QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 23/08/2019 16:23, Jorge Ramirez-Ortiz wrote:
> can you add me as a co-author to this patch please?

No problem I can do that if you feel so!

> since I spent about a day doing the analysis, sent you  a fix that 
> maintained the API used by the library and explained you how to 
> reproduce the issue I think it is just fair. > the  fact that the api could be be modified and the fix be done a bit
> differently- free dma buf ioctl removed- seems just a minor 
> implementation detail to me.

No, that's not true, this is a clear fastrpc design issue.

Userspace is already doing a refcount via mmap/unmap on that dmabuf fd, 
having an additional api adds another level of refcount which is totally 
redundant and is the root cause for this leak.


--srini

> 
> also you can add my tested-by if you want
> 
> TIA
> 
> On Fri, 23 Aug 2019 at 12:07, Srinivas Kandagatla 
> <srinivas.kandagatla@linaro.org <mailto:srinivas.kandagatla@linaro.org>> 
> wrote:
> 
>     dma buf refcount has to be done by the driver which is going to use
>     the fd.
>     This driver already does refcount on the dmabuf fd if its actively
>     using it
>     but also does an additional refcounting via extra ioctl.
>     This additional refcount can lead to memory leak in cases where the
>     applications fail to call the ioctl to decrement the refcount.
> 
>     So remove this extra refcount in the ioctl
> 
>     More info of dma buf usage at drivers/dma-buf/dma-buf.c
> 
>     Reported-by: Mayank Chopra <mak.chopra@codeaurora.org
>     <mailto:mak.chopra@codeaurora.org>>
>     Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org
>     <mailto:jorge.ramirez-ortiz@linaro.org>>
>     Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org
>     <mailto:srinivas.kandagatla@linaro.org>>
>     ---
>       drivers/misc/fastrpc.c | 25 -------------------------
>       1 file changed, 25 deletions(-)
> 
>     diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>     index 38829fa74f28..eee2bb398947 100644
>     --- a/drivers/misc/fastrpc.c
>     +++ b/drivers/misc/fastrpc.c
>     @@ -1198,26 +1198,6 @@ static int fastrpc_device_open(struct inode
>     *inode, struct file *filp)
>              return 0;
>       }
> 
>     -static int fastrpc_dmabuf_free(struct fastrpc_user *fl, char __user
>     *argp)
>     -{
>     -       struct dma_buf *buf;
>     -       int info;
>     -
>     -       if (copy_from_user(&info, argp, sizeof(info)))
>     -               return -EFAULT;
>     -
>     -       buf = dma_buf_get(info);
>     -       if (IS_ERR_OR_NULL(buf))
>     -               return -EINVAL;
>     -       /*
>     -        * one for the last get and other for the ALLOC_DMA_BUFF ioctl
>     -        */
>     -       dma_buf_put(buf);
>     -       dma_buf_put(buf);
>     -
>     -       return 0;
>     -}
>     -
>       static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char
>     __user *argp)
>       {
>              struct fastrpc_alloc_dma_buf bp;
>     @@ -1253,8 +1233,6 @@ static int fastrpc_dmabuf_alloc(struct
>     fastrpc_user *fl, char __user *argp)
>                      return -EFAULT;
>              }
> 
>     -       get_dma_buf(buf->dmabuf);
>     -
>              return 0;
>       }
> 
>     @@ -1322,9 +1300,6 @@ static long fastrpc_device_ioctl(struct file
>     *file, unsigned int cmd,
>              case FASTRPC_IOCTL_INIT_CREATE:
>                      err = fastrpc_init_create_process(fl, argp);
>                      break;
>     -       case FASTRPC_IOCTL_FREE_DMA_BUFF:
>     -               err = fastrpc_dmabuf_free(fl, argp);
>     -               break;
>              case FASTRPC_IOCTL_ALLOC_DMA_BUFF:
>                      err = fastrpc_dmabuf_alloc(fl, argp);
>                      break;
>     -- 
>     2.21.0
> 
