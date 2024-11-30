Return-Path: <linux-arm-msm+bounces-39684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F29DEEDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 04:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE964163460
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 03:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A07082D;
	Sat, 30 Nov 2024 03:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpN7QEkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D49163A9;
	Sat, 30 Nov 2024 03:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732939152; cv=none; b=b5CQvGGP0OlT98wpZF57qCnr8kAW4xwXwmzwxeAqrUPpfP8e8YKY3yHTpDIYlduyICBE/UeJFhhy1s+fjVypUSVgPp3AVhY1IPM7Tbw20vjXFc1DDpwfjjcug2xx+JH3Dc8Lud5OxutxSpZG9nhPWIhfAk5Bbq5mu6gNB7CmwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732939152; c=relaxed/simple;
	bh=0GOBdCGWWrSL7+vSv3osD3eqYgmfi9cR5h0KH+QDgL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNf2wj7X8fNqrtkPHsHrS+YrENI0Z8r2Z4mINUqioOe45iwatWYFVcqCHb12TwO1Jgy3DIhk/yYN1XFDEmWYTJsFMHoVRJE2VoiTabo2qwk0KcHicef8a4YexCsd+0APRiov8Dd3xtx8kpFE5Pk4CuV/kKGSzk8cjpsRbKdXiSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpN7QEkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB561C4CECC;
	Sat, 30 Nov 2024 03:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732939151;
	bh=0GOBdCGWWrSL7+vSv3osD3eqYgmfi9cR5h0KH+QDgL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpN7QEkZZr+sR0ngqdiBz3KXhOzEvzNde7uFgolSfCYKZ6FmCwqzGvyNUPdqv9iDE
	 H/AYrxVzeL2HrWDVIIE/tM0mwpFvjU1lLYEQGus2cy3vQozDJgx1LijfOfOpTiO7RG
	 WecoDuYVrHgS7nRC1gsfuTuQrC4eiAbAg/33LfQQKUVm+MBH0cm+OraoHSVs513cI5
	 2m1susl6PHvBM1Yh4Q3VD9UcU4mZCqOy/MmIAGUKB6lb9fvepyf+xWvJeWM0dyhAqq
	 epF6hAgZ02eAthApQzNcEpjTD7NhUMd4DyFN6GcJfNoG+rvLo27qzM5y3gTVWcrDLi
	 UmvB2LvQxhQeA==
Date: Fri, 29 Nov 2024 21:59:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Song Xue <quic_songxue@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Manu Gautam <mgautam@codeaurora.org>, 
	Vivek Gautam <vivek.gautam@codeaurora.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: qcom-qusb2: Add regulator_set_load to Qualcomm
 usb phy
Message-ID: <5tbevb5wv2s43pccytv4qol4yhq4s7iw2mmqp23vt3ujqd6xev@hkioqmwoitbd>
References: <20241121-add_set_load_to_qusb_phy-v2-1-1c5da1befec0@quicinc.com>
 <vbuo2yel2pdcwnmz32f4t5pb6v3ptt2bcs2t6ybab2jxnkd6e7@rjnsbawj4zpb>
 <18e40154-f4ea-4100-9f4f-9c9aa5e251d7@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18e40154-f4ea-4100-9f4f-9c9aa5e251d7@quicinc.com>

On Fri, Nov 29, 2024 at 06:26:30PM +0800, Tingwei Zhang wrote:
> On 11/29/2024 12:43 AM, Bjorn Andersson wrote:
> > On Thu, Nov 21, 2024 at 04:09:27PM +0800, Song Xue wrote:
> > > Set the current load before enable regulator supplies at QUSB phy.
> > > 
> > > Encountered one issue where the board powered down instantly once the UVC
> > > camera was attached to USB port while adding host mode on usb port and
> > > testing a UVC camera with the driver on QCS615 platform. The extensible
> > > boot loader mentioned that OCP(Over Current Protection) occurred at LDO12
> > > from regulators-0 upon powered on board again. That indicates that the
> > > current load set for QUSB phy, which use the regulator supply, is lower
> > > than expected.
> > > 
> > > As per QUSB spec, set the maximum current load at 30mA to avoid overcurrent
> > > load when attach a device to the USB port.
> > > 
> > > Fixes: 937e17f36a32 ("phy: qcom-qusb2: Power-on PHY before initialization")
> > > Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> > 
> > The patch looks good. But if we describe the regulator(s) with
> > regulator-allow-set-load; and not all the consumers vote for load, the
> > sum of the load when USB phy is disabled goes to 0 and we will enter
> > LPM.
> 
> That's exactly the issue we encountered on QCS615 ride. Qualcomm UFS driver
> sets load while USB phy doesn't set load. That's the reason we raised this
> patch.
> > 
> > For this reason we're not doing any load requests today. Can you confirm
> 
> When I grep regulator_set_load in Kernel, there are 27 hits in drivers. You
> are correct, it will trigger issue when some consumers set load while some
> don't.
> However, how can we prevent other drivers outside of Qualcomm to use
> regulator_set_load?

We can avoid this by not specifying "regulator-allow-set-load" in
DeviceTree.

That said, this isn't the correct solution, we shouldn't use the
hardware description to deal with implementation issues. It is however
the currently chosen pragmatic solution, so feel free to follow this.

> It will trigger the same issue.
> Is there something we can do in regulator driver to prevent this issue? If
> consumer doesn't set load, regulator works in HPM even another consumer set
> load to 0?
> 
> > that this works fine with a dtb where only HPM is permitted (as well as
> > LPM and HPM)? If so I'd be in favor of us merging this change, but
> 
> Do you mean test with HPM only regulator and regulator which allows to be
> set to HPM and LPM?
> 

Yes, please double check that your patch works with and without
regulator-allow-set-load.

Regards,
Bjorn

> > keeping the dts HPM-only until someone confirms that all consumers of
> > these regulators specify load-votes.
> > 
> > Regards,
> > Bjorn
> > 
> > > ---
> > > Changes in v2:
> > > - Removed "---" above the Fixes.
> > > - Link to v1: https://lore.kernel.org/r/20241121-add_set_load_to_qusb_phy-v1-1-0f44f3a3290e@quicinc.com
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qusb2.c | 13 ++++++++++++-
> > >   1 file changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > index c52655a383cef008552ed4533b9f31d1cbf34a13..80f0d17c42717e843937255a9a780bbae5998535 100644
> > > --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> > > @@ -722,16 +722,27 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
> > >   	return ret;
> > >   }
> > > +#define QUSB2PHY_HPM_LOAD 30000 /*uA*/
> > > +
> > >   static int qusb2_phy_init(struct phy *phy)
> > >   {
> > >   	struct qusb2_phy *qphy = phy_get_drvdata(phy);
> > >   	const struct qusb2_phy_cfg *cfg = qphy->cfg;
> > >   	unsigned int val = 0;
> > >   	unsigned int clk_scheme;
> > > -	int ret;
> > > +	int ret, i;
> > >   	dev_vdbg(&phy->dev, "%s(): Initializing QUSB2 phy\n", __func__);
> > > +	/* set the current load */
> > > +	for (i = 0; i < ARRAY_SIZE(qphy->vregs); i++) {
> > > +		ret = regulator_set_load(qphy->vregs[i].consumer, QUSB2PHY_HPM_LOAD);
> > > +		if (ret) {
> > > +			dev_err(&phy->dev, "failed to set load at %s\n", qphy->vregs[i].supply);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > >   	/* turn on regulator supplies */
> > >   	ret = regulator_bulk_enable(ARRAY_SIZE(qphy->vregs), qphy->vregs);
> > >   	if (ret)
> > > 
> > > ---
> > > base-commit: decc701f41d07481893fdea942c0ac6b226e84cd
> > > change-id: 20241121-add_set_load_to_qusb_phy-d1327c797ffe
> > > 
> > > Best regards,
> > > -- 
> > > Song Xue <quic_songxue@quicinc.com>
> > > 
> > > 
> 
> 
> -- 
> Thanks,
> Tingwei

