Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8526374B94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 00:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhEEW7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 May 2021 18:59:47 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:54420 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229827AbhEEW7r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 May 2021 18:59:47 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.89 #2 (Debian))
        id 1leQTa-0004CG-2z; Thu, 06 May 2021 06:58:42 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1leQTY-0008EU-1V; Thu, 06 May 2021 06:58:40 +0800
Date:   Thu, 6 May 2021 06:58:40 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     davem@davemloft.net, bjorn.andersson@linaro.org,
        ebiggers@google.com, ardb@kernel.org, sivaprak@codeaurora.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [Patch v4 0/7] Add support for AEAD algorithms in Qualcomm
 Crypto Engine driver
Message-ID: <20210505225839.uy6zlj3gtp77uuqk@gondor.apana.org.au>
References: <20210429150707.3168383-1-thara.gopinath@linaro.org>
 <48d51bb5-a107-4756-4767-f62131d28505@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48d51bb5-a107-4756-4767-f62131d28505@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 05, 2021 at 06:54:18PM -0400, Thara Gopinath wrote:
> 
> 
> On 4/29/21 11:07 AM, Thara Gopinath wrote:
> > Enable support for AEAD algorithms in Qualcomm CE driver.  The first three
> > patches in this series are cleanups and add a few missing pieces required
> > to add support for AEAD algorithms.  Patch 4 introduces supported AEAD
> > transformations on Qualcomm CE.  Patches 5 and 6 implements the h/w
> > infrastructure needed to enable and run the AEAD transformations on
> > Qualcomm CE.  Patch 7 adds support to queue fallback algorithms in case of
> > unsupported special inputs.
> > 
> > This patch series has been tested with in kernel crypto testing module
> > tcrypt.ko with fuzz tests enabled as well.
> 
> Hi Herbert,
> 
> I have fixed all the review comments on this series and fuzz tests pass as
> well. Do you think this can be merged ?

We're still in the merge window, no new features are accepted
at this point.  Please be patient.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
