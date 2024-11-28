Return-Path: <linux-arm-msm+bounces-39487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A39DBB72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98FB2B22016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1621C1BD9EE;
	Thu, 28 Nov 2024 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEfZGUbG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA411B85FA;
	Thu, 28 Nov 2024 16:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812229; cv=none; b=PypI2Fb3Gf8NilHTCHJgzEtJ9cIlhQBD/F72qS0lDNLWnDeRCFV9TlHT3rqrn9qRGXSj7bLbCK9CKwMaCIGFmxib21QughDzgUXNseNqSurmChd4NVcdxZd7q1ESaTRt6uy2noNcvYQMb8gp0XV8DcR5MjsZGuRBFeVxKRruqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812229; c=relaxed/simple;
	bh=cfGnX3HhW0ZLkB6Rpk07vfYDD6bx5vOherGOdZSl7mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfatLneKUrWfxQhbOGNGB8teAQbhJ0jnUQiD+BpNyZDVka0KjH3hnvVixwqgWdo/ZA2IpkYsJWM7yu1KvSykmbvAE1ZpueefrXvUuwGvnBowaAOdTGsmoaGXnW+6NP9wJOsTKSTaRah9HVWN7gA9DsnKmjSAeI6cO9snMnI9xNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEfZGUbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822B1C4CECE;
	Thu, 28 Nov 2024 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732812228;
	bh=cfGnX3HhW0ZLkB6Rpk07vfYDD6bx5vOherGOdZSl7mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEfZGUbGESxjukgGsMx0W1DMiYtp3MPy0kCVcFl89B4W5MoUzR/7pA9fWq0j/gY1d
	 9EAFbqwIrZeYgfUqmMtxaltDKpCa08muuIUscn0Th2A4Al/43KDkOy0BuA8pSG96Fu
	 XKdWVe35z6BNhlsa3elcuFwdf+Q8EmjqoLKV8+704pDR6U4OJ7GJ0oJtFR6QUHaSAK
	 U67PlWV0JyEP0fDIV6irBIkMZF9k7g3iIEAPqYbObbtfVw9co/lRQSTOs5E/HsmYU/
	 H8Mdi1RL5qwAugOuMlODoIaDJM6xixfhdCKI1ISbJSlGf8aj4k9dS68plxbY0cuJEA
	 3eSvq2a6NpnPg==
Date: Thu, 28 Nov 2024 10:43:45 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Song Xue <quic_songxue@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Manu Gautam <mgautam@codeaurora.org>, 
	Vivek Gautam <vivek.gautam@codeaurora.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm
 usb phy
Message-ID: <vbuo2yel2pdcwnmz32f4t5pb6v3ptt2bcs2t6ybab2jxnkd6e7@rjnsbawj4zpb>
References: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>

On Thu, Nov 21, 2024 at 04:09:27PM +0800, Song Xue wrote:
> Set the current load before enable regulator supplies at QUSB phy.
> 
> Encountered one issue where the board powered down instantly once the UVC
> camera was attached to USB port while adding host mode on usb port and
> testing a UVC camera with the driver on QCS615 platform. The extensible
> boot loader mentioned that OCP(Over Current Protection) occurred at LDO12
> from regulators-0 upon powered on board again. That indicates that the
> current load set for QUSB phy, which use the regulator supply, is lower
> than expected.
> 
> As per QUSB spec, set the maximum current load at 30mA to avoid overcurrent
> load when attach a device to the USB port.
> 
> Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before initialization")
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>

The patch looks good. But if we describe the regulator(s) with
regulator-allow-set-load; and not all the consumers vote for load, the
sum of the load when USB phy is disabled goes to 0 and we will enter
LPM.

For this reason we're not doing any load requests today. Can you confirm
that this works fine with a dtb where only HPM is permitted (as well as
LPM and HPM)? If so I'd be in favor of us merging this change, but
keeping the dts HPM-only until someone confirms that all consumers of
these regulators specify load-votes.

Regards,
Bjorn

> ---
> Changes in v2:
> - Removed "---" above the Fixes. 
> - Link to v1: https://lore.kernel.org/r/20241121-add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -722,16 +722,27 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
>  	return ret;
>  }
>  
> +#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
> +
>  static int qusb2_phy_init(struct phy *phy)
>  {
>  	struct qusb2_phy *qphy = phy_get_drvdata(phy);
>  	const struct qusb2_phy_cfg *cfg = qphy->cfg;
>  	unsigned int val = 0;
>  	unsigned int clk_scheme;
> -	int ret;
> +	int ret, i;
>  
>  	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
>  
> +	/* set the current load */
> +	for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
> +		ret = regulator_set_load(qphy->vregs[i].consumer, QUSB2PHY_HPM_LOAD);
> +		if (ret) {
> +			dev_err(&phy->dev, "failed to set load at %s\n", qphy->vregs[i].supply);
> +			return ret;
> +		}
> +	}
> +
>  	/* turn on regulator supplies */
>  	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
>  	if (ret)
> 
> ---
> base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
> 
> Best regards,
> -- 
> Song Xue <quic_songxue@quicinc.com>
> 
> 

