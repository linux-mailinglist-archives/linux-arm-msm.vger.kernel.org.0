Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6483133E29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 10:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgAHJQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 04:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:46506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727205AbgAHJQx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 04:16:53 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C672C20705;
        Wed,  8 Jan 2020 09:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578475012;
        bh=+IAbT80Thjb7cm6WAP8wRkhDBitTa05E7byZ57Le5ag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ie6mnSQIZ0/Cmh6ez45IJInqQwaokWY9MDyBZqRTZNt5uTgXRFmVAd2hNSM9uN3ID
         y/12CJS7TUfkeqVSwEDmyPF/a5pSrE4SVd4XYt+znN6uP71KT5adACbICf8qRxpEXp
         AQXOt9SNrLgS1q631MX+fnpE/s46nKozLm/TcjSk=
Date:   Wed, 8 Jan 2020 09:16:42 +0000
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, treding@nvidia.com
Subject: Re: [PATCH 0/3] iommu/arm-smmu: Qualcomm bootsplash/efifb
Message-ID: <20200108091641.GA15147@willie-the-truck>
References: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 26, 2019 at 02:17:06PM -0800, Bjorn Andersson wrote:
> These patches implements the stream mapping inheritance that's necessary in
> order to not hit a security violation as the display hardware looses its stream
> mapping during initialization of arm-smmu in various Qualcomm platforms.
> 
> This was previously posted as an RFC [1], changes since then involves the
> rebase and migration of the read-back code to the Qualcomm specific
> implementation, the mapping is maintained indefinitely - to handle probe
> deferring clients - and rewritten commit messages.

I don't think we should solve this in a Qualcomm-specific manner. Please can
you take a look at the proposal from Thierry [1] and see whether or not it
works for you?

Thanks,

Will

[1] https://lore.kernel.org/lkml/20191209150748.2471814-1-thierry.reding@gmail.com
