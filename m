Return-Path: <linux-arm-msm+bounces-59053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BDAC0CB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEDEC1712F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 13:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2246E28BAB1;
	Thu, 22 May 2025 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX8/fEVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43828A721;
	Thu, 22 May 2025 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920438; cv=none; b=SjWDvh32rLfcwBWJhlXeHbGEiBJLFCmwqmvDcEct8t+IeogVHM0OoaZycKmtHRxWcD/LysSdDLvS8eXe5VFBOxbiOSPR2IivdZ4zQPdB5auZU3nvhD3auu0QMv2pUwmxZ1EXSMYIRV+o7dwlLp5/ciybgTpZBCQLpav9Clj4TOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920438; c=relaxed/simple;
	bh=HCEjzAxEoNpGh9RhZKRmEp/YfkDRMjOx87EArtdY46E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egVBsucqZ4GmVl4mZO5YoJD8qcFia4mN4HRKHY8+hn+kxvg0+7XJyLkN8HMer/+pYKF2ltpWBPb2Jg5pz5G9yKO/4kCCVzVnEfQ9AypXEgdVZ59ZiVL810FvfV4x4R+ZuK0GtS61ColkfJVzpBtAOe/od/yd8jVFRLP1JwEpQFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX8/fEVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41359C4CEE4;
	Thu, 22 May 2025 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747920437;
	bh=HCEjzAxEoNpGh9RhZKRmEp/YfkDRMjOx87EArtdY46E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX8/fEVnJvd/yp+XvMm6fuoT2Be58dmLXfJr8hgrabR73FFcNigPFKdn+c3GtPvVq
	 6okjJznCebd8m4O8UJyXi0mht1LUzLR72gd8OH1y0nAmyd/xiRdMcA9XmFzf32q6tV
	 jIO8+Kp5rGT0S4VgtqsRPW7Hv8I0SljmLnNh5oLnpbHkNsvBQ38Jbe0HXa9NAa1Qhl
	 eHtLZtobi80OWuumLi4g3zf2jPDyKEVkacw+YhuM5AZEHlSGxToAC+qIdECIxH6+bY
	 3uHtIFk8lKy3sIDLZmA5C4nOnaYjcrbWWWny0shY57JnjSnmb3za+qk148NsSsDTuH
	 HY+tZN2kfneWQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uI5x4-000000003QS-1Ibp;
	Thu, 22 May 2025 15:27:14 +0200
Date: Thu, 22 May 2025 15:27:14 +0200
From: Johan Hovold <johan@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aC8mMiw2o3MRmBtm@hovoldconsulting.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>

On Mon, Apr 21, 2025 at 03:00:13PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> sequences to bring it out of reset and into an operational state.  This
> differs to the M31 USB driver, in that the M31 eUSB2 driver will
> require a connection to an eUSB2 repeater.  This PHY driver will handle
> the initialization of the associated eUSB2 repeater when required.

> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}

> +static int m31eusb2_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	const struct m31_eusb2_priv_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct m31eusb2_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;

> +	phy->phy = devm_phy_create(dev, NULL, &m31eusb2_phy_gen_ops);
> +	if (IS_ERR(phy->phy))
> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> +				     "failed to create phy\n");
> +
> +	ret = devm_regulator_bulk_get_const(dev, M31_EUSB_NUM_VREGS,
> +					    m31_eusb_phy_vregs, &phy->vregs);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to get regulator supplies\n");
> +
> +	phy_set_drvdata(phy->phy, phy);
> +
> +	phy->repeater = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy->repeater))
> +		return dev_err_probe(dev, PTR_ERR(phy->repeater),
> +				     "failed to get repeater\n");

Requesting the repeater PHY like this and managing it from the PHY ops
currently breaks lockdep as I've previously reported here:

	https://lore.kernel.org/lkml/ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com/

I don't think we should merge this until that issue has been resolved as
it leaves us with an increasing number of (Qualcomm) SoCs where lockdep
cannot be used, which risks introducing further locking bugs without
anyone noticing.

Johan

