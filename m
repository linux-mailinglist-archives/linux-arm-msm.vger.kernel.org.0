Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A24E08722A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 08:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405339AbfHIGUr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 02:20:47 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37502 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405415AbfHIGUr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 02:20:47 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1hvyG7-0007PS-Tu; Fri, 09 Aug 2019 16:20:16 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1hvyFz-0002sF-Ec; Fri, 09 Aug 2019 16:20:07 +1000
Date:   Fri, 9 Aug 2019 16:20:07 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     lars.persson@axis.com, jesper.nilsson@axis.com,
        davem@davemloft.net, thomas.lendacky@amd.com, gary.hook@amd.com,
        krzk@kernel.org, kgene@kernel.org, antoine.tenart@bootlin.com,
        matthias.bgg@gmail.com, jamie@jamieiles.com, agross@kernel.org,
        heiko@sntech.de, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, clabbe.montjoie@gmail.com,
        mripard@kernel.org, wens@csie.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@axis.com,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH -next 00/12] crypto: use devm_platform_ioremap_resource()
 to simplify code
Message-ID: <20190809062007.GP10392@gondor.apana.org.au>
References: <20190802132809.8116-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802132809.8116-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 02, 2019 at 09:27:57PM +0800, YueHaibing wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> YueHaibing (12):
>   crypto: artpec6 - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: ccp - use devm_platform_ioremap_resource() to simplify code
>   crypto: exynos - use devm_platform_ioremap_resource() to simplify code
>   crypto: img-hash - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: inside-secure - use devm_platform_ioremap_resource() to
>     simplify code
>   crypto: mediatek - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: picoxcell - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: sunxi-ss - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: rockchip - use devm_platform_ioremap_resource() to simplify
>     code
>   crypto: stm32 - use devm_platform_ioremap_resource() to simplify code
>   crypto: qce - use devm_platform_ioremap_resource() to simplify code
>   crypto: qcom-rng - use devm_platform_ioremap_resource() to simplify
>     code
> 
>  drivers/crypto/axis/artpec6_crypto.c    | 4 +---
>  drivers/crypto/ccp/sp-platform.c        | 4 +---
>  drivers/crypto/exynos-rng.c             | 4 +---
>  drivers/crypto/img-hash.c               | 4 +---
>  drivers/crypto/inside-secure/safexcel.c | 4 +---
>  drivers/crypto/mediatek/mtk-platform.c  | 3 +--
>  drivers/crypto/picoxcell_crypto.c       | 5 ++---
>  drivers/crypto/qce/core.c               | 4 +---
>  drivers/crypto/qcom-rng.c               | 4 +---
>  drivers/crypto/rockchip/rk3288_crypto.c | 4 +---
>  drivers/crypto/stm32/stm32-crc32.c      | 4 +---
>  drivers/crypto/stm32/stm32-cryp.c       | 4 +---
>  drivers/crypto/sunxi-ss/sun4i-ss-core.c | 4 +---
>  13 files changed, 14 insertions(+), 38 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
