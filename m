Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831922A3C5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 07:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725982AbgKCGAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 01:00:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:59576 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbgKCGAE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 01:00:04 -0500
Received: from localhost (unknown [122.179.37.237])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 177E222277;
        Tue,  3 Nov 2020 06:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604383204;
        bh=0psGTZJPBlL+v4LFDl6ebb19ZjeZMkNRScIndKpNHls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=09am7ycjyw0yM+cSwhwsVkiqxp6hpGnXUbdYF62FAulHBTQoIN/h0awU/eC2rC6mK
         zruyQeaGe433WNtpNZtQ8yIz0VcW5NqUAqKo2AmLoBTESnZ72pY2An6Wx1VP1lHrWI
         +ZYPtweBUh5/p3y+YVEfAW80Fm/P8Dlbu2BQg0eY=
Date:   Tue, 3 Nov 2020 11:29:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     john.stultz@linaro.org, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm Command DB driver
Message-ID: <20201103055959.GC2621@vkoul-mobl>
References: <20201103010850.757500-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103010850.757500-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-11-20, 17:08, Bjorn Andersson wrote:
> The Qualcomm Command DB driver seems to have been indirectly enabled by
> the Qualcomm DRM driver and up until the introduction of '778279f4f5e4
> ("soc: qcom: cmd-db: allow loading as a module")' this resulted in the
> driver "always" being builtin on arm64. But with the introduction of
> said change it, and all other RPMH related drivers, becomes =m.
> 
> The immediate result is that the uart driver fails to probe, which
> depending on userspace's dependency on the presence of /dev/console
> might be fatal. For systems getting past this the default timeout of 0
> seconds for probe deferral of many subsystems causes the system to be
> completely useless.
> 
> So, make Command DB builtin.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
