Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48EF1BAA3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 18:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgD0QpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 12:45:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgD0QpU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 12:45:20 -0400
Received: from localhost (unknown [171.76.79.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 68DA0206D9;
        Mon, 27 Apr 2020 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588005920;
        bh=HQGfAja2rJ6tyBFd7iZNONvuPgYmUPhKQCqiJIZ0BlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xzlbn+/rAZkVD3vyFds6UKBjLoLGjModPNllFHhNZDkEgS39vG+qdWwpWnbsSDskK
         pznWxE0Uco91kl+/FLdEV9VAI8l+ezAah0yDdb0MMNqvxYyKr2SF4IGQQHBVB/hsVz
         /LxlGZuwpTCDIfUbUsT8st6PQA2gSg8e7V2mQPMo=
Date:   Mon, 27 Apr 2020 22:15:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v6 1/3] phy: add driver for Qualcomm IPQ40xx USB PHY
Message-ID: <20200427164514.GQ56386@vkoul-mobl.Dlink>
References: <20200401163542.83278-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401163542.83278-1-robert.marko@sartura.hr>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Robert,

On 01-04-20, 18:35, Robert Marko wrote:

> +static int ipq4019_ss_phy_power_on(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	ipq4019_ss_phy_power_off(_phy);
> +
> +	reset_control_deassert(phy->por_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_ss_phy_ops = {
> +	.power_on	= ipq4019_ss_phy_power_on,
> +	.power_off	= ipq4019_ss_phy_power_off,
> +};
> +
> +static int ipq4019_hs_phy_power_off(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	reset_control_assert(phy->por_rst);
> +	msleep(10);

why not call ipq4019_ss_phy_power_off() here as well?

> +
> +	reset_control_assert(phy->srif_rst);
> +	msleep(10);
> +
> +	return 0;
> +}
> +
> +static int ipq4019_hs_phy_power_on(struct phy *_phy)
> +{
> +	struct ipq4019_usb_phy *phy = phy_get_drvdata(_phy);
> +
> +	ipq4019_hs_phy_power_off(_phy);
> +
> +	reset_control_deassert(phy->srif_rst);
> +	msleep(10);
> +
> +	reset_control_deassert(phy->por_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy_ops ipq4019_usb_hs_phy_ops = {
> +	.power_on	= ipq4019_hs_phy_power_on,
> +	.power_off	= ipq4019_hs_phy_power_off,
> +};

So this is fiddling with resets, what about phy configuration and
calibration, who take care of that?

> +static int ipq4019_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct phy_provider *phy_provider;
> +	struct ipq4019_usb_phy *phy;
> +	const struct of_device_id *match;
> +
> +	match = of_match_device(ipq4019_usb_phy_of_match, &pdev->dev);
> +	if (!match)
> +		return -ENODEV;

you are using this to get match-data few lines below, why not use
of_device_get_match_data() and get the match->data which you are
interested in?

-- 
~Vinod
