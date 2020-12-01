Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9C0B2C9461
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 01:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389105AbgLAA64 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 19:58:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387945AbgLAA64 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 19:58:56 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D1272085B;
        Tue,  1 Dec 2020 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606784295;
        bh=XJqH1TMtP9xmOi3v0LL0YOX06RA7xOFQmJ5B2q80Cq8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ou7cats3Yo9Rn7R9ZlDllSDOXxyvTUh6VuvZdyh7lUQvrfr/qp2aVIRi4aAL52b/g
         lbUqNJp5br86jdXTPTtsN2RadZoo8DLiFWt2tX1r/E2ClquSLRfpneOkDqwBaHktWI
         uBwKPp1wd6xStKGqIavltCSD2iyeaplBHaVlc6HQ=
Date:   Tue, 1 Dec 2020 08:58:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Vinod Koul <vkoul@kernel.org>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable HID multitouch
Message-ID: <20201201005810.GN4072@dragon>
References: <20201130162834.310282-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201130162834.310282-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 30, 2020 at 10:28:34AM -0600, Bjorn Andersson wrote:
> The Lenovo Yoga C630 relies on HID multitouch support for proper
> touchpad operation, so enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>
