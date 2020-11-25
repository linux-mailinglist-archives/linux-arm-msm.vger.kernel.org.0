Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAD52C37FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 05:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgKYETP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 23:19:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgKYETP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 23:19:15 -0500
Received: from localhost (unknown [122.179.120.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95EBD20872;
        Wed, 25 Nov 2020 04:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606277954;
        bh=eQVNhQ0UAEYFl/DUM5l/IxLjQMOsbadOvstLoA9OzlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xEsPm6I5DzMQYXfHRZZHiNUNPvGBGuqlh2hZ1Ambo60f8mvPL+/pmCl2Zsan93anB
         6mVyTu/l0jbAK4KJn3WCEsvY9V4eybonJDkPQnoYP9mcBjH3rWBqlg0aKV6Lx9C3u/
         7TNiIxrQolRtsQ1QIFUEmMA2q6Y9h9fcnHieqgeM=
Date:   Wed, 25 Nov 2020 09:49:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm PON driver
Message-ID: <20201125041909.GA8403@vkoul-mobl>
References: <20201125023831.99774-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125023831.99774-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-11-20, 20:38, Bjorn Andersson wrote:
> The PON block in the PMIC provides, among other things, support for
> "reboot reason", power key and reset "key" handling. Let's enable the
> driver for this block.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
