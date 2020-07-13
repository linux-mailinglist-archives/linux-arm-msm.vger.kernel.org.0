Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C91621CED9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 07:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbgGMFdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 01:33:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:59390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgGMFdB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 01:33:01 -0400
Received: from localhost (unknown [122.182.251.219])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC5402068F;
        Mon, 13 Jul 2020 05:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594618380;
        bh=xHhlhOG2O5smTAneN0ZnuiRbm7rrhPP60vF/0+KOSM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SDy5y0Xs12hnjkGWFqhjDKbEIXVc0CnyWy7cI5B9idC9gkLt1ktAu0W7oQJ7e4lwY
         MC/rNJ+kVDnhp2yca4crjhjsgxbqRDpeZdamgs2IX9jbiAU9BChpzBrEp69QcInYHg
         tyaay/MDgtmEWuDRUSVStCAy25Etw+IG0ywLx6lA=
Date:   Mon, 13 Jul 2020 11:02:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@codeaurora.org>,
        Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH v7 1/2] phy: qualcomm: add qcom ipq806x dwc usb
 phy driver
Message-ID: <20200713053255.GY34333@vkoul-mobl>
References: <20200615205333.20747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615205333.20747-1-ansuelsmth@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-06-20, 22:53, Ansuel Smith wrote:

> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2014-2015, Code Aurora Forum. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 and
> + * only version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.

You have SPDX tag, so we dont need the license text, please remove this.
Also we are in 2020 now so Copyright looks incorrect

> +static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
> +{
> +	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
> +	int ret;
> +	u32 data = 0;

Superfluous init

> +static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct usb_phy	*phy_dwc3;
> +	struct phy_provider		*phy_provider;
> +	struct phy			*generic_phy;
> +	const struct of_device_id *match;
> +	const struct phy_drvdata *data;
> +	struct resource			*res;
> +	resource_size_t			size;

Pls pick one, tabs or single spaces, not both. and reverse christmas
looks better :)

> +	struct device_node *np;
> +
> +	phy_dwc3 = devm_kzalloc(&pdev->dev, sizeof(*phy_dwc3), GFP_KERNEL);
> +	if (!phy_dwc3)
> +		return -ENOMEM;
> +
> +	match = of_match_node(qcom_ipq806x_usb_phy_table, pdev->dev.of_node);
> +	data = match->data;

How about using of_device_get_match_data() instead?
-- 
~Vinod
