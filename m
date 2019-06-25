Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A7655B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 00:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbfFYWcc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 18:32:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbfFYWcc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 18:32:32 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 923712053B;
        Tue, 25 Jun 2019 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561501951;
        bh=2vgiJrS9XOyadE0tibDao2AJ3GuPX5u2vY1CXkOvBWM=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=Vxse2In8RWeMO/e3m/uiryFM9Aks8h4hokezlEwlL3l5qQS2yA6VfaSFEsSat2VnE
         tOimRC1pShkv5JsQrpjd2V0YV5mcLhQG0sK30ZxyuKBQSPzzLqciVrViFRkWMI1Q3O
         36JWuKXqyLc1q9uxeBXpKeZCrCHJmvqkIufmWQT4=
Date:   Tue, 25 Jun 2019 15:32:31 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] linux/kernel.h: fix overflow for DIV_ROUND_UP_ULL
Message-Id: <20190625153231.9b2d2fb8d8bf35c6acd5aafd@linux-foundation.org>
In-Reply-To: <20190625152938.d1ebf43f0da5f5276c77cf4c@linux-foundation.org>
References: <20190625100518.30753-1-vkoul@kernel.org>
        <20190625152938.d1ebf43f0da5f5276c77cf4c@linux-foundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 25 Jun 2019 15:29:38 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> On Tue, 25 Jun 2019 15:35:18 +0530 Vinod Koul <vkoul@kernel.org> wrote:
> 
> > DIV_ROUND_UP_ULL adds the two arguments and then invokes
> > DIV_ROUND_DOWN_ULL. But on a 32bit system the addition of two 32 bit
> > values can overflow. DIV_ROUND_DOWN_ULL does it correctly and stashes
> > the addition into a unsigned long long so cast the result to unsigned
> > long long here to avoid the overflow condition.
> >
> > ...
> >
> > --- a/include/linux/kernel.h
> > +++ b/include/linux/kernel.h
> > @@ -93,7 +93,8 @@
> >  #define DIV_ROUND_DOWN_ULL(ll, d) \
> >  	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
> >  
> > -#define DIV_ROUND_UP_ULL(ll, d)		DIV_ROUND_DOWN_ULL((ll) + (d) - 1, (d))
> > +#define DIV_ROUND_UP_ULL(ll, d) \
> > +	({ DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d)) })
> >  
> 
> This clearly wasn't tested :(
> 
> fs/fs-writeback.c: In function wb_split_bdi_pages:
> ./include/linux/kernel.h:97:65: error: expected ; before } token
>   ({ DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d)) })
>                                                                  ^
> fs/fs-writeback.c:811:10: note: in expansion of macro DIV_ROUND_UP_ULL
>    return DIV_ROUND_UP_ULL((u64)nr_pages * this_bw, tot_bw);
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: linux-kernelh-fix-overflow-for-div_round_up_ull-fix
> 
> DIV_ROUND_UP_ULL must be an rval
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  include/linux/kernel.h |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> --- a/include/linux/kernel.h~linux-kernelh-fix-overflow-for-div_round_up_ull-fix
> +++ a/include/linux/kernel.h
> @@ -93,8 +93,10 @@
>  #define DIV_ROUND_DOWN_ULL(ll, d) \
>  	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
>  
> -#define DIV_ROUND_UP_ULL(ll, d) \
> -	({ DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d)) })
> +#define DIV_ROUND_UP_ULL(ll, d) ({ \
> +	unsigned long long _tmp; \
> +	_tmp = DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d)); \
> +	_tmp; })

Simpler:

--- a/include/linux/kernel.h~linux-kernelh-fix-overflow-for-div_round_up_ull-fix
+++ a/include/linux/kernel.h
@@ -94,7 +94,7 @@
 	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
 
 #define DIV_ROUND_UP_ULL(ll, d) \
-	({ DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d)) })
+	DIV_ROUND_DOWN_ULL((unsigned long long)(ll) + (d) - 1, (d))
 
 #if BITS_PER_LONG == 32
 # define DIV_ROUND_UP_SECTOR_T(ll,d) DIV_ROUND_UP_ULL(ll, d)
_

