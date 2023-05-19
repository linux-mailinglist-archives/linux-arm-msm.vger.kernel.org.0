Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDF27094AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 12:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjESKWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 06:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjESKWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 06:22:33 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4508E10DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:22:27 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f415a90215so29690575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 03:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684491746; x=1687083746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/QFC45etN1BVr/CRelIotBHqCWGvrxTZ78FfYnnInhQ=;
        b=o5z3BOYjKwfbYDYrlK8oJ2gwzblDUPsqIT66zb3k15qAOci+hgqbrTTfh4DW46mVQs
         ywZe7V2jhjGaUoNTXzJ5YeJK98FfD/2KSwULshqqWVj/Wc3vjPmloFsMzBzFcCLLbf4s
         ds3TAj0NdPA44vGUP+z76NAUw3jTlCnLQgPjMwVWUE1TB5F9Wf48/IIEvYrd3461pxR+
         kNRNDrTUo0pSZdC50yQstlwtPPdyMGscZ+1aUQOzi3MxGvI/8lNmp1oWsN7e+yg7f/oJ
         cg8yAn+GhPc5KrhRmhSkonwZQaTtRaGVYmfBtJ3S6rfg3CK6FARkQBwaUaj4P3DKx9iP
         FxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491746; x=1687083746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QFC45etN1BVr/CRelIotBHqCWGvrxTZ78FfYnnInhQ=;
        b=PKQ6bA6s8mzu3oGIhwKz+Ug0Vs7U5ga7g2BCNpo1auREwZkqkmM5kTAgAXujl9MbSQ
         DipZkgwX2lUNZ1KZpD47LAHOx57aWqPjJ64w/VErhTmxwoFfElYbYEAnhRGuDEYrItJn
         IaefF6mNGu090+wOvteQFtaGDK6jbRJJg2SFb5tlHJgnE45j7dUy08iLOJWqstPtQI1I
         4SpZZ51/fpPfeVBIbiAk84DwxNmP7dElVhj3MUXKOj4gnjfdmNoIJHCUm5Fn2OPTGnno
         xHWcGX1Ec6jXiWyZkrGBa20Cc8zXsRuPJjo9X47zjkXW75jos0/4Nqj1BTdk2MRGFDxz
         vl/Q==
X-Gm-Message-State: AC+VfDzrvdhsXl8DWD0YQ6G94mqcUIFa/VKuUDXoGAq/M52ZiMW9yT6R
        v0oHtlzD98c+9R7eM/t0/GWlKg==
X-Google-Smtp-Source: ACHHUZ5yN9VLaq3RBCpVpZzJ31VMgDn2KYhY3d4nSaXke8UcVsZFmr8ilGHB0FVdUSs1KUNr+eC4Rw==
X-Received: by 2002:a5d:5704:0:b0:306:44a9:76a1 with SMTP id a4-20020a5d5704000000b0030644a976a1mr1129284wrv.17.1684491745677;
        Fri, 19 May 2023 03:22:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe585000000b002f7780eee10sm4831863wrm.59.2023.05.19.03.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:22:22 -0700 (PDT)
Date:   Fri, 19 May 2023 13:22:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Sukrut Bellary <sukrut.bellary@linux.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <b0115d7d-d15a-4948-8726-09a8b37f3f36@kili.mountain>
References: <20230518100829.515143-1-sukrut.bellary@linux.com>
 <9194ebdf-f335-4cd6-bf89-bb4f86a57784@kili.mountain>
 <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f47b17c1-1c02-2aa3-ba10-fcef70cb25a8@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> ----------------------->cut<---------------------------
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index f60bbf99485c..3fdd326e1ae8 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1891,7 +1891,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> char __user *argp)
>                                       &args[0]);
>         if (err) {
>                 dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> -               goto err_invoke;
> +               fastrpc_buf_free(buf);
> +               return err;
>         }
> 
>         /* update the buffer to be able to deallocate the memory on the DSP
> */
> @@ -1930,11 +1931,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl,
> char __user *argp)
>         return 0;
> 
>  err_assign:
> -       fastrpc_req_munmap_impl(fl, buf);
> -err_invoke:
> -       fastrpc_buf_free(buf);
> -
> -       return err;
> +       return fastrpc_req_munmap_impl(fl, buf);

This will return success if copy_to_user() fails.

regards,
dan carpenter

