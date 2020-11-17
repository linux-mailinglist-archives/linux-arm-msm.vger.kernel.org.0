Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743D92B6AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 17:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgKQQ5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 11:57:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:42928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727070AbgKQQ5f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 11:57:35 -0500
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B41422447;
        Tue, 17 Nov 2020 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605632254;
        bh=9YRqsxQ2usGvEt2meH9lhvEXpcTOviy8taZs/VJohUM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pU/xwNuFBJ++tk+KbBaiLmoAm+Qqa30OahDDtH5y/GcbS0mJ6tKITuUEFG23l0BD/
         MmGCY3oU+KQBoEBZQQisTlo4ka/NFvqBjkPPsAvTPeqNpTosj8N+A3xGnzEjukqQA5
         Y71qpStax2oLIrQnwWCbmpSEOXbBoM41HPPCOuUA=
Date:   Tue, 17 Nov 2020 08:57:32 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/6] Enable Qualcomm Crypto Engine on sdm845
Message-ID: <X7QA/BMr/A/jjayk@sol.localdomain>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117134714.3456446-1-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 17, 2020 at 08:47:08AM -0500, Thara Gopinath wrote:
> Qualcomm crypto engine supports hardware accelerated algorithms for
> encryption and authentication. Enable support for aes,des,3des encryption
> algorithms and sha1,sha256, hmac(sha1),hmac(sha256) authentication
> algorithms on sdm845.The patch series has been tested using the kernel
> crypto testing module tcrypto.ko.

Did you do this testing with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled?
Do all tests pass with it enabled?

- Eric
