Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239BA457B31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Nov 2021 05:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236856AbhKTEdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Nov 2021 23:33:31 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:56912 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236997AbhKTEd0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Nov 2021 23:33:26 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1moI13-0001KA-Iv; Sat, 20 Nov 2021 12:30:17 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1moI13-0006mS-87; Sat, 20 Nov 2021 12:30:17 +0800
Date:   Sat, 20 Nov 2021 12:30:17 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Chengfeng Ye <cyeaa@connect.ust.hk>
Cc:     thara.gopinath@linaro.org, davem@davemloft.net,
        svarbanov@mm-sol.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] crypto: qce: fix uaf on qce_skcipher_register_one
Message-ID: <20211120043017.GJ25752@gondor.apana.org.au>
References: <20211104134642.20638-1-cyeaa@connect.ust.hk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104134642.20638-1-cyeaa@connect.ust.hk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 04, 2021 at 06:46:42AM -0700, Chengfeng Ye wrote:
> Pointer alg points to sub field of tmpl, it
> is dereferenced after tmpl is freed. Fix
> this by accessing alg before free tmpl.
> 
> Fixes: ec8f5d8f ("crypto: qce - Qualcomm crypto engine driver")
> Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>
> ---
>  drivers/crypto/qce/skcipher.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
