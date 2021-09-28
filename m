Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB00D41B516
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241974AbhI1R0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242060AbhI1R0K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:26:10 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9094FC061746
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:24:30 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id 5-20020a9d0685000000b0054706d7b8e5so29893205otx.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Tz7rXxaL4F/0f9c2pv27juc+BGdU7ScDq2tqCmIv38Y=;
        b=tR2pRCj/qKxjNExZrPW1JMusgHTkF217aDaxwmJWEm2fFtDA/r7cVLoE6t7EzHMG+j
         4cnF8eefX32CXwbIWS6Fb2aNitjEQgYmhl/kiZWdzTtTEgr5BzM5bDrNr0xGoQcnHfo4
         ukAyh1JNMGUrNsZ4ZRwG+Cz3NZM+zUpCggoPt4Asg9JC7DVN8QeAGxfMPgjNvvfvWI+o
         VTDg52u12ACCsADmcqS7lLTm4+uCVoHSAG1DP1EAuiZkXe6vAFC8vMFuc33DT81Th2U9
         zWszlzIR4HpkbUqmWejkpNV+2ZUU010wD19zv6P/NL6yj08YpU3BBQ76/wRQfklSWNK4
         xWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tz7rXxaL4F/0f9c2pv27juc+BGdU7ScDq2tqCmIv38Y=;
        b=I8AuI6c0ESYiDemfGDbLCj+48InXcHDlRomcUKSYxeucQ1ulAhFdGH6ZMrXTowTBDR
         +Fz9dd3wg7bJh+EL27wJd5lGYuKTyyUtRf3Y8FeJHUGxYoF7VaTUNnpKuCI7xd69qhv0
         2vvP/RkmE7DitkwIvXzTxMCDWqDl3wsy1ua6ltfCNs4SFR9db0JFyf5urGCxvwjxz5AT
         rzt1fuh9NaUAlGiBsb2Jf5e5OGN8IGp3PzyZfRGSqjOvHa6CRcL2tJ2/7f2F6/uqH5sf
         K0JpF4PU5/j7fspZueodezPm7ES2ZvqU4yAsrHkKfPXF28OCaLILpe19EwzPqFMEu/ED
         BbRw==
X-Gm-Message-State: AOAM5320SNYyEnOXxKK/BgmItoAWbo27Pkgx02wnUwq3aADIX/+L8lZw
        3wwZX474A9k6LAeQNUNBYd/GDQ==
X-Google-Smtp-Source: ABdhPJwIoTF2vk7NvGDYXmuN/1D5SS3NUp6rSCUQCZ5HX/Jvkr7HMFjXoFn7PWmdaYmAJBezNd8FNg==
X-Received: by 2002:a05:6830:1d43:: with SMTP id p3mr5968746oth.80.1632849869862;
        Tue, 28 Sep 2021 10:24:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z1sm5225337ooj.25.2021.09.28.10.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:24:29 -0700 (PDT)
Date:   Tue, 28 Sep 2021 12:24:27 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: qrtr: combine nameservice into main module
Message-ID: <YVNPy+IAtLiKI19Q@builder.lan>
References: <20210928171156.6353-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928171156.6353-1-luca@z3ntu.xyz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Sep 12:11 CDT 2021, Luca Weiss wrote:

> Previously with CONFIG_QRTR=m a separate ns.ko would be built which
> wasn't done on purpose and should be included in qrtr.ko.
> 
> Rename qrtr.c to af_qrtr.c so we can build a qrtr.ko with both af_qrtr.c
> and ns.c.
> 

Nice, I don't think we ever intended to end up with "ns.ko" on its own.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  net/qrtr/Makefile              | 3 ++-
>  net/qrtr/{qrtr.c => af_qrtr.c} | 0
>  2 files changed, 2 insertions(+), 1 deletion(-)
>  rename net/qrtr/{qrtr.c => af_qrtr.c} (100%)
> 
> diff --git a/net/qrtr/Makefile b/net/qrtr/Makefile
> index 1b1411d158a7..8e0605f88a73 100644
> --- a/net/qrtr/Makefile
> +++ b/net/qrtr/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_QRTR) := qrtr.o ns.o
> +obj-$(CONFIG_QRTR) += qrtr.o
> +qrtr-y	:= af_qrtr.o ns.o
>  
>  obj-$(CONFIG_QRTR_SMD) += qrtr-smd.o
>  qrtr-smd-y	:= smd.o
> diff --git a/net/qrtr/qrtr.c b/net/qrtr/af_qrtr.c
> similarity index 100%
> rename from net/qrtr/qrtr.c
> rename to net/qrtr/af_qrtr.c
> -- 
> 2.33.0
> 
