Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9E2393DD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 09:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235358AbhE1H2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 03:28:53 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:50312 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234520AbhE1H2w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 03:28:52 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1lmWtl-0003gx-43; Fri, 28 May 2021 15:27:13 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1lmWtk-00020H-Dp; Fri, 28 May 2021 15:27:12 +0800
Date:   Fri, 28 May 2021 15:27:12 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     davem@davemloft.net, bjorn.andersson@linaro.org,
        ebiggers@google.com, ardb@kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] crypto: qce: skcipher: Fix incorrect sg count for dma
 transfers
Message-ID: <20210528072712.GK7392@gondor.apana.org.au>
References: <20210521022023.1237148-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521022023.1237148-1-thara.gopinath@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 20, 2021 at 10:20:23PM -0400, Thara Gopinath wrote:
> Use the sg count returned by dma_map_sg to call into
> dmaengine_prep_slave_sg rather than using the original sg count. dma_map_sg
> can merge consecutive sglist entries, thus making the original sg count
> wrong. This is a fix for memory coruption issues observed while testing
> encryption/decryption of large messages using libkcapi framework.
> 
> Patch has been tested further by running full suite of tcrypt.ko tests
> including fuzz tests.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  drivers/crypto/qce/skcipher.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
