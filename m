Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF38DEB132
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 14:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfJaN3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 09:29:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:40606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726836AbfJaN3T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 09:29:19 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34B5520862;
        Thu, 31 Oct 2019 13:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572528559;
        bh=CZwLCQC08Yd2rFJN0WaEwbxJ61oj5DVAAFsImEubPO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=brqxESrJ8f9jGx5TG2+yTUCdTfm7FBHUPr4S/hC9c9wHbr1cLV+wpLNLgH7jusJPs
         9ttfVk4cbmaCG/yePe3MMuR2pXV3WfEJRQY9sOxPFxGpCYgGNAnJg9n2xwBOZjcewE
         vhqOlEG0CzOxG0LyOLbZi+JCViuZtYUkaO8zG3VU=
Date:   Thu, 31 Oct 2019 13:29:15 +0000
From:   Will Deacon <will@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, jhugo@codeaurora.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] arm64: cpufeature: Enable Qualcomm Falkor errata 1009
 for Kryo
Message-ID: <20191031132914.GD27196@willie-the-truck>
References: <20191029232738.1483923-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029232738.1483923-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[+Jeffrey]

On Tue, Oct 29, 2019 at 04:27:38PM -0700, Bjorn Andersson wrote:
> The Kryo cores share errata 1009 with Falkor, so add their model
> definitions and enable it for them as well.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - Use is_kryo_midr(), rather than listing each individual model.

Cheers, I've queued this up as a fix.

I also updated the E1009 entry in silicon-errata.rst but, in doing so, I
noticed that E1041 is listed there which apparently also affects
Kry^H^H^HHydra [1].

At which point, maybe we should rename both Kryo and Falkor in the tree
so that we consistently refer to Hydra as the underlying micro-architecture.
Obviously not something for 5.4, but it would sure help me to understand
what's doing on here.

Thoughts?

Will

[1] https://lore.kernel.org/kvmarm/20171115010505.GO11955@codeaurora.org/
