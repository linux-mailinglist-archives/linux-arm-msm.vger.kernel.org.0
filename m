Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411831D9633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 14:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbgESMZB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 08:25:01 -0400
Received: from 8bytes.org ([81.169.241.247]:43888 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726196AbgESMZB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 08:25:01 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B216B386; Tue, 19 May 2020 14:24:59 +0200 (CEST)
Date:   Tue, 19 May 2020 14:24:58 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH v2] iommu/qcom: add optional 'tbu' clock for TLB
 invalidate
Message-ID: <20200519122458.GJ18353@8bytes.org>
References: <20200518141656.26284-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518141656.26284-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 18, 2020 at 10:16:56PM +0800, Shawn Guo wrote:
> On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
> needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
> will not be correctly reflected, causing the system to go into a bad
> state.  Add it as an optional clock, so that platforms that have this
> clock can pass it over DT.
> 
> While adding the third clock, let's switch to bulk clk API to simplify
> the enable/disable calls.  clk_bulk_get() cannot used because the
> existing two clocks are required while the new one is optional.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
>  - Use devm_clk_get_optional() to simplify code and improve readability.
>  - Rename the new clock from 'tlb' to 'tbu'.
>  - qcom_iommu: use bulk clk API to simplfy enable/disable.
> 
>  drivers/iommu/qcom_iommu.c | 62 ++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 36 deletions(-)

Applied, thanks.
