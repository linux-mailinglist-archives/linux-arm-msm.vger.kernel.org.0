Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74787CE8AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 18:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbfJGQJK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 12:09:10 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41217 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfJGQJK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 12:09:10 -0400
Received: by mail-pl1-f196.google.com with SMTP id t10so7085638plr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2019 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aBgqQxTSUrypIINp0CWdo9JqgkyiVA1d7jt/RqpRlPU=;
        b=dNV0xk5XmmtEjnnKPK4foXc9ByJV90H2Uz8o96rrYBbNIMOCYOeceGfhUOXS1ker5h
         +dNeMdpb90TzApZYzmG6NZ5YYgEt6yLgJeT1pjZMDo5R9zpRvKY6aLqo9V8nn+bWXMuw
         C+fYIBd+KainiWIm5N0ysMRDucAhMs2rw67FtwhPmyEcAzUSRUu4JUmUadEOKTdwha1x
         mpZB3qFzRKjH4nZmwtvEi7fQsksvjZiVcdkbQjSozxm6KZg29F/QvQgOcvU1kXn6bXLZ
         97+bBX4l4UoIMCj1YoLJRLLQG/3ln+uxnIX1w8vr98qqYF/T5RwNvq0etGq2TWc2wtLm
         puNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aBgqQxTSUrypIINp0CWdo9JqgkyiVA1d7jt/RqpRlPU=;
        b=tc5kqy0gW7aFrZWCmqKFQ87MwI87l06wfyHMrorfQVmji1N8CA4/7RMGG1i58vUcnS
         r2A1q3tqWg9o/+0ESm9wobYZ+k3vuX2heY+Er11P6/ff1IvALHSG29Pcs9XDYgtjJuZv
         bpGafTO4oUJC9iEIehUytOF1Ge9wc8mW2iowSYG62CnSI/I0mZ4FoleMPeDJ5GuTyHdR
         nEzeTp5pbBf4CdP3o0imnrblJPlbwkIGSM9qUm9BemGggmedmLyiDj8Z3tXgDTTlZ5lq
         2insGhEgwt55SZBFbmCyOKi1HTGpvErYTRCwqlIAG/I/UcaVF/sYdsPhTJSNhOj7KhD/
         hImw==
X-Gm-Message-State: APjAAAUjlTD8YJ9boGWCpT2obOwBG2rD2TQ/u3CGjGP1aKgT8Oun3U8s
        wgqzrXwIoR4ifiWgvNy3CrQNQw==
X-Google-Smtp-Source: APXvYqzea5ibDvYZqN2MAn2BlMt02HhSOXkQyEnzAq5I/XmObJu1rcLlA9QSBrGJLpH2HcWmORsJnw==
X-Received: by 2002:a17:90a:65c8:: with SMTP id i8mr24350pjs.51.1570464511127;
        Mon, 07 Oct 2019 09:08:31 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e4sm15090747pff.22.2019.10.07.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 09:08:30 -0700 (PDT)
Date:   Mon, 7 Oct 2019 09:08:28 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] soc: qcom: ocmem: add missing includes
Message-ID: <20191007160828.GL6390@tuxbook-pro>
References: <20190901213037.25889-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190901213037.25889-1-masneyb@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 01 Sep 14:30 PDT 2019, Brian Masney wrote:

> The kbuild bot reported the following compiler errors when compiling on
> MIPS with CONFIG_QCOM_OCMEM disabled:
> 
>   In file included from <command-line>:0:0:
>   >> include/soc/qcom/ocmem.h:43:49: warning: 'struct device' declared
>      inside parameter list will not be visible outside of this
>      definition or declaration
>       static inline struct ocmem *of_get_ocmem(struct device *dev)
>                                                       ^~~~~~
>      include/soc/qcom/ocmem.h: In function 'of_get_ocmem':
>   >> include/soc/qcom/ocmem.h:45:9: error: implicit declaration of
>      function 'ERR_PTR' [-Werror=implicit-function-declaration]
>        return ERR_PTR(-ENODEV);
>               ^~~~~~~
>   >> include/soc/qcom/ocmem.h:45:18: error: 'ENODEV' undeclared (first
>      use in this function)
>        return ERR_PTR(-ENODEV);
> 
> Add the proper includes to fix the compiler errors.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Reported-by: kbuild test robot <lkp@intel.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> My OCMEM series [1] hasn't landed upstream yet so let me know if you
> want me to squash this into the existing patch set. I made this a
> separate patch so that the Reported-by could be included. The kbuild
> report is at [2].
> 
> [1] https://lore.kernel.org/lkml/20190823121637.5861-1-masneyb@onstation.org/
> [2] https://lists.01.org/pipermail/kbuild-all/2019-August/063530.html
> 
>  include/soc/qcom/ocmem.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/soc/qcom/ocmem.h b/include/soc/qcom/ocmem.h
> index a0ae336ba78b..02a8bc2677b1 100644
> --- a/include/soc/qcom/ocmem.h
> +++ b/include/soc/qcom/ocmem.h
> @@ -9,6 +9,9 @@
>   * Copyright (C) 2015 Red Hat. Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include <linux/device.h>
> +#include <linux/err.h>
> +
>  #ifndef __OCMEM_H__
>  #define __OCMEM_H__
>  
> -- 
> 2.21.0
> 
