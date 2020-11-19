Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C54E2B9DC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 23:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKSWo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 17:44:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:34616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726105AbgKSWo4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 17:44:56 -0500
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2697C22227;
        Thu, 19 Nov 2020 22:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605825895;
        bh=OtvJO8yvmIDxhqSkBjQjFoBGFp/nQ39GEQmF1YaXcsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QGVKQ+m6/Nc+feFugcLakgmc/ol17FoOF5zCFohuHmRT181t/2WKSssYpZMmfnjME
         syhjfkVUxTyE3BxFf/eBLh8ybjnASTxUTXLKDmXrI7EPmCTq1b5vldIT+GmCbTt5tG
         bItZtP6k9YNlv16RHGZciUY62Zt6Q4Ml58vVT+EM=
Date:   Thu, 19 Nov 2020 14:44:53 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [Patch v2 0/6] Enable Qualcomm Crypto Engine on sdm845
Message-ID: <X7b1ZX5SEMq1PbVN@sol.localdomain>
References: <20201119155233.3974286-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119155233.3974286-1-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 19, 2020 at 10:52:27AM -0500, Thara Gopinath wrote:
> Qualcomm crypto engine supports hardware accelerated algorithms for
> encryption and authentication. Enable support for aes,des,3des encryption
> algorithms and sha1,sha256, hmac(sha1),hmac(sha256) authentication
> algorithms on sdm845.The patch series has been tested using the kernel
> crypto testing module tcrypto.ko.

Can you please test CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y too?  Implementations of
crypto algorithms shouldn't be enabled unless they are passing all tests.

Also, did you compare the performance of this hardware to ARMv8 CE?  I thought
that QCE (at least on other SoCs) isn't very useful because ARMv8 CE is faster.

- Eric
