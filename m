Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D91D219CFFE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 08:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbgDCGBl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 02:01:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:39720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729349AbgDCGBl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 02:01:41 -0400
Received: from localhost (unknown [171.76.107.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19CB6206F6;
        Fri,  3 Apr 2020 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585893700;
        bh=p2IuVwkph+/SUR16YqbpBqb56Vyf1fYOzyLt2WbYoB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QKav23U/eh6h/UhxXS/ncKxL41JZk1qm0n5hpfLHzXL0ONIxq+/ZuqChX9TyH49dI
         eKvRgnzQOuoAVCmL62/441OrFBkq2FrvtPqwQ+N7TAlBRl4lJk5QUGCbPOQhfKc8JC
         Z/x/weXzdPtovzgoqretYp6zsUfL3N1DnfrgIdCc=
Date:   Fri, 3 Apr 2020 11:31:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/5] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
Message-ID: <20200403060127.GM72691@vkoul-mobl>
References: <1585880634-15222-1-git-send-email-wcheng@codeaurora.org>
 <1585880634-15222-3-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585880634-15222-3-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-04-20, 19:23, Wesley Cheng wrote:
> This adds the SNPS FemtoPHY V2 driver used in QCOM SOCs.  There
> are potentially multiple instances of this UTMI PHY on the
> SOC, all which can utilize this driver.  The V2 driver will
> have a different register map compared to V1.

Some nitpicks below, otherwise:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> +/**
> + * struct qcom_snps_hsphy - structure holding snps hs phy attributes
> + *
> + * @phy: generic phy
> + * @base: iomapped memory space for qubs2 phy
> + *
> + * @cfg_ahb_clk: AHB2PHY interface clock
> + * @ref_clk: phy reference clock
> + * @iface_clk: phy interface clock
> + * @phy_reset: phy reset control
> + * @vregs: regulator supplies bulk data
> +

This is missing the marker * for kernel doc

> + * @phy_initialized: if PHY has been initialized correctly
> + *

This empty line is redundant

> + */
> +struct qcom_snps_hsphy {
> +	struct phy *phy;
> +	void __iomem *base;
> +
> +	struct clk *cfg_ahb_clk;
> +	struct clk *ref_clk;
> +	struct reset_control *phy_reset;
> +	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> +
> +	bool phy_initialized;
> +};
> +
> +static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
> +				    u32 mask, u32 val)

coding style mandates that second line should start at preceeding line
opening brace :), so can you please make it:

static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
                                              u32 mask, u32 val)

-- 
~Vinod
