Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35402FBE44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbhASRtI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:49:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:48294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390207AbhASPIA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 10:08:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 035CC207B1;
        Tue, 19 Jan 2021 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611068833;
        bh=cjjgrYSgEnYiBolImxrg+RGrrFu4TUxboZoVL1FEYxU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OglnyEkYsIB/BDPrZAnEJvkw61y+Zek0WEl/+UYM8zj627yvb1BM+vNr/L4PpRR9y
         2uTN8/1xVvbfNJsyzzWhqnsKTCny/XsSEA/BqrR7F6mIcfV16I7cFbbIBj7NjMbhKK
         849VeIwspECEzzqQLTCO349ck4G8qSNezDW3mDDcfQMZ8KtyQnEfYh79DCjiMDPJzM
         QIRmoKz3Zh4WsuoidAztp6nEoV+3LsvgPPH8N5GXz8l+YGFozb40Ei6xs4XJb8URE+
         aAO8AZaBviknFjPT8u3pWrjbdabLbLwwWUYqZjXv5LQPr/O/Ab0S8qTiHtpe5TjYnv
         Wd6uOOgZSdjAw==
Date:   Tue, 19 Jan 2021 20:37:07 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mgautam@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, marijn.suijten@somainline.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom-qusb2: Allow specifying default clock
 scheme
Message-ID: <20210119150707.GB2771@vkoul-mobl>
References: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114174718.398638-1-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14-01-21, 18:47, AngeloGioacchino Del Regno wrote:
> The TCSR's PHY_CLK_SCHEME register is not available on all SoC
> models, but some may still use a differential reference clock.
> 
> In preparation for these SoCs, add a se_clk_scheme_default
> configuration entry and declare it to true for all currently
> supported SoCs (retaining the previous defaults.
> 
> This patch brings no functional changes.

Patch 2 had two blank lines getting inserted, I have fixed that up while
applying.. so:

Applied all, thanks

-- 
~Vinod
