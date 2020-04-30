Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160331BEF85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 07:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgD3FCY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 01:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726337AbgD3FCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 01:02:23 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5577C035495
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 22:02:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d24so1804966pll.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2020 22:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/x+rzFhqL8qq/IbAbhJvN4V9t4Lz3kP/p46lFDN1LPU=;
        b=QeUOH2T0toOL6FXdkhKq+g+r/NoRVo1i2zlq/dnOlDFJ7Qg3JgS5yBug89VdkBBuXJ
         uIwAth6iHY+LFOy85L2+cBK/fyvKlE6++yw6wsviDaoMtG//30Iq79W3dCFahjhHej5m
         bsyu7z3tWK77hkQZEtJyGjU+mVA97ThGY/dMIESgne0XoachFQI/glwM066JniYC5Yjv
         jiyuJbGAgCgs0avenlhmD3u3Q0MDjNA/wPRb0I+kaLNcjDHYng4SUtXkqg1iIbklShcT
         u/OmWS2O17Fbavnp7f8ERKiwbf5WesDEha3GK1DB5/91dT7HOZIt04oibLGSAW2F2BL3
         VI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/x+rzFhqL8qq/IbAbhJvN4V9t4Lz3kP/p46lFDN1LPU=;
        b=WVUbD/oi4gU4ES4J6H3dmse0uVa2KKBZCft382pUnd6JDrWCmQGuTojGTG2EF4IsRd
         JSN33Tdr+ksrrTmr/aMXHESeoIS7l5zRJtjTjoIqz7bcpO42RqbtwPZljCEOves1yjux
         sK6PXRjLIvXa1IJ7hEKEYXzwY0KYonxo0U8Jj8HdWB2oBYjoXYa8ZXLDIhs8lvMMzIET
         N0tBBR9yaHAaFK9f4o38E6fswqdfzzyN1hqtP3jhCR1zBRFXwfNHIswQ0aCaxWGLvAnX
         0IKKu2j1vjVKYTcX7i7qKbY9/r2Ss7vL9T7J5KdCUTG8ZMnwasznGpjZswZDypRnadSE
         Gwug==
X-Gm-Message-State: AGi0PuZJ11t58ughvsyfuuEu6das+o+JS6xnaMqvyAfxfWkF41GmwKCx
        t0Fg9a7NtDSFrjLKeeV8w4Ttcw==
X-Google-Smtp-Source: APiQypJzR7a0kCiE/1VDTmkgBdSYfEHsJ0JsARDvEUXhRCY3bEJHo7Os1dih7PRmqQ2XQpmx9ywNJw==
X-Received: by 2002:a17:90b:1104:: with SMTP id gi4mr937970pjb.115.1588222943125;
        Wed, 29 Apr 2020 22:02:23 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o9sm671869pje.47.2020.04.29.22.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 22:02:22 -0700 (PDT)
Date:   Wed, 29 Apr 2020 22:02:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, arnd@arndb.de
Subject: Re: [PATCH] misc: fastrpc: fix memory leak
Message-ID: <20200430050259.GB2166963@builder.lan>
References: <20200429152951.18504-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429152951.18504-1-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 29 Apr 08:29 PDT 2020, Srinivas Kandagatla wrote:

> if misc_register() fails, previously allocated data is left without freeing,
> this could result in memory leak.

s/could/will/

> 
> So fix it!
> 

As Markus pointed out, a Fixes: tag would be in order to make sure this
is backported properly.


PS: although unlikely, if of_platform_populate() where to fail we're
leaking both the contet and the misc device.

Regards,
Bjorn

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/misc/fastrpc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index e3e085e33d46..9065d3e71ff7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1613,8 +1613,10 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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
