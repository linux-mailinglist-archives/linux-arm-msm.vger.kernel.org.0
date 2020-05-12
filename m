Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7EB1CE9DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 02:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgELA7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 20:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbgELA7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 20:59:01 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AB3C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 17:59:00 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so5554696pfd.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TwHuRNxPbEy8mYDXf8pk2T6sofwkpEQ+jJn9FbtTcxo=;
        b=NkUiRxSigjraS3WE+8oP1tKZ4yDuE7jLtql0CgplLYHwttV6mLR1/TUF/Q1MVJOyTx
         UxGYseDgdk+LNCh585+Er7kyLZkE8zsu6X7k3+eTwZaCH201STrD7K1i2+NjEZyr9vk5
         tWPZ3TmtOZc4qkNquuYwFhJqmjxBNXmOdPccrB5ctoecAKHai7k+djHrlIgw2E0+jSBt
         dzKAsQ7DYHjnM3q6xEnD2TOGqr7IJviehlCQgKbI+ANsG7q2Jlv4oqRI46qRH6b+KNBK
         DikS9Vs3b65O426NyPg/Afxw+fOQBEiQ1jA6I+SYGTuDd8cepZRUCEhiIqM+W70h3o7g
         QZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TwHuRNxPbEy8mYDXf8pk2T6sofwkpEQ+jJn9FbtTcxo=;
        b=RZ69tozt9Y13zHDgvRF/J95r0mdSLnSEEpxyt+/Qz6jrdtXEtcc+HjTSp9VaPN4Vbf
         IQZUXjPNlfoTqUdcMs+jDGH+1epeujVt089XnS2J0oSRF+87gVDwdmcRLMbEvnRrMUe5
         uk/r9rtuL9XQo8/IsLfzf2oT6fCO91EtCLsOKAkLCQWf/UH8iI7icQchnnHIwjVL0GrR
         5VwVMfE2uruC7mCCkDogZMbGJfpK00lqnC5Cj3PJfStgHIZaISni20HOQ3AoI36vW8Wc
         mVihBb937oz3pVuwFT7HXafv89ZK4TjIVF1rxuN7mrVlikQGOCmZwq7YZz+edzSPnOsI
         OzzQ==
X-Gm-Message-State: AGi0PuYEuYp4pLaGWI4GUto/Y+QYSQvW2dV0rQcgmY3C0F+Oj8KoTGAG
        jmL3u3vx3IiacmJ0MNh0tzvcmA==
X-Google-Smtp-Source: APiQypJwJEBcM1EmQHnk4doWfnyeHPF9R7zotlY5IVw07p+XqwIeBDN2yaOR9mnGmE7iw5z+kpmAOg==
X-Received: by 2002:a65:6497:: with SMTP id e23mr17093339pgv.347.1589245140297;
        Mon, 11 May 2020 17:59:00 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e12sm8902034pgv.16.2020.05.11.17.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 17:58:59 -0700 (PDT)
Date:   Mon, 11 May 2020 17:57:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH v2] misc: fastrpc: Fix an incomplete memory release in
 fastrpc_rpmsg_probe()
Message-ID: <20200512005725.GA57962@builder.lan>
References: <20200511162722.2552-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511162722.2552-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 11 May 09:27 PDT 2020, Srinivas Kandagatla wrote:

> fastrpc_channel_ctx is not freed if misc_register() fails, this would
> lead to a memory leak. Fix this leak by adding kfree in misc_register()
> error path.
> 
> Fixes: 278d56f970ae ("misc: fastrpc: Reference count channel context")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes since v1:
> 	- Update subject as suggested
> 	- added fixes tag
> 
>  drivers/misc/fastrpc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index c562e285e0f4..07065728e39f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1615,8 +1615,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  					    domains[domain_id]);
>  	data->miscdev.fops = &fastrpc_fops;
>  	err = misc_register(&data->miscdev);
> -	if (err)
> +	if (err) {
> +		kfree(data);
>  		return err;
> +	}
>  
>  	kref_init(&data->refcount);
>  
> -- 
> 2.21.0
> 
