Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7000380889
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 13:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhENLgp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 07:36:45 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37238 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232134AbhENLgn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 07:36:43 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.89 #2 (Debian))
        id 1lhW6I-0002wd-Jz; Fri, 14 May 2021 19:35:26 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1lhW6H-0002Y6-By; Fri, 14 May 2021 19:35:25 +0800
Date:   Fri, 14 May 2021 19:35:25 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     davem@davemloft.net, bjorn.andersson@linaro.org,
        ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [Patch v4 0/7] Add support for AEAD algorithms in Qualcomm
 Crypto Engine driver
Message-ID: <20210514113525.2e6b77qq4neox73o@gondor.apana.org.au>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429150707.3168383-1-thara.gopinath@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 29, 2021 at 11:07:00AM -0400, Thara Gopinath wrote:
> Enable support for AEAD algorithms in Qualcomm CE driver.  The first three
> patches in this series are cleanups and add a few missing pieces required
> to add support for AEAD algorithms.  Patch 4 introduces supported AEAD
> transformations on Qualcomm CE.  Patches 5 and 6 implements the h/w
> infrastructure needed to enable and run the AEAD transformations on
> Qualcomm CE.  Patch 7 adds support to queue fallback algorithms in case of
> unsupported special inputs.
> 
> This patch series has been tested with in kernel crypto testing module
> tcrypt.ko with fuzz tests enabled as well.
> 
> Thara Gopinath (7):
>   crypto: qce: common: Add MAC failed error checking
>   crypto: qce: common: Make result dump optional
>   crypto: qce: Add mode for rfc4309
>   crypto: qce: Add support for AEAD algorithms
>   crypto: qce: common: Clean up qce_auth_cfg
>   crypto: qce: common: Add support for AEAD algorithms
>   crypto: qce: aead: Schedule fallback algorithm
> 
>  drivers/crypto/Kconfig      |  15 +
>  drivers/crypto/qce/Makefile |   1 +
>  drivers/crypto/qce/aead.c   | 841 ++++++++++++++++++++++++++++++++++++
>  drivers/crypto/qce/aead.h   |  56 +++
>  drivers/crypto/qce/common.c | 196 ++++++++-
>  drivers/crypto/qce/common.h |   9 +-
>  drivers/crypto/qce/core.c   |   4 +
>  7 files changed, 1102 insertions(+), 20 deletions(-)
>  create mode 100644 drivers/crypto/qce/aead.c
>  create mode 100644 drivers/crypto/qce/aead.h

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
