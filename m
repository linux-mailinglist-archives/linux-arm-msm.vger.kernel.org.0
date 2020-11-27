Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D333C2C600F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 07:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392570AbgK0GZW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 01:25:22 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:33422 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728043AbgK0GZW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 01:25:22 -0500
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kiXBx-0000x6-0Y; Fri, 27 Nov 2020 17:25:14 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 27 Nov 2020 17:25:12 +1100
Date:   Fri, 27 Nov 2020 17:25:12 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [Patch v2 0/6] Enable Qualcomm Crypto Engine on sdm845
Message-ID: <20201127062512.GB11448@gondor.apana.org.au>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119155233.3974286-1-thara.gopinath@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 10:52:27AM -0500, Thara Gopinath wrote:
> Qualcomm crypto engine supports hardware accelerated algorithms for
> encryption and authentication. Enable support for aes,des,3des encryption
> algorithms and sha1,sha256, hmac(sha1),hmac(sha256) authentication
> algorithms on sdm845.The patch series has been tested using the kernel
> crypto testing module tcrypto.ko.
> 
> v1->v2:
> - Rebased to linux-next v5.10-rc4.
> - Fixed subject line format in all patches as per Bjorn's feedback.
> 
> Thara Gopinath (6):
>   dt-binding:clock: Add entry for crypto engine RPMH clock resource
>   clk:qcom:rpmh: Add CE clock on sdm845.
>   drivers:crypto:qce: Enable support for crypto engine on sdm845.
>   drivers:crypto:qce: Fix SHA result buffer corruption issues.
>   dts:qcom:sdm845: Add dt entries to support crypto engine.
>   devicetree:bindings:crypto: Extend qcom-qce binding to add support for
>     crypto engine version 5.4
> 
>  .../devicetree/bindings/crypto/qcom-qce.txt   |  4 ++-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 30 +++++++++++++++++++
>  drivers/clk/qcom/clk-rpmh.c                   |  2 ++
>  drivers/crypto/qce/core.c                     | 17 ++++++++++-
>  drivers/crypto/qce/sha.c                      |  2 +-
>  include/dt-bindings/clock/qcom,rpmh.h         |  1 +
>  6 files changed, 53 insertions(+), 3 deletions(-)

Patches 3-4 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
