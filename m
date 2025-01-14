Return-Path: <linux-arm-msm+bounces-45030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A608BA10E13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4FDA168152
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D082B1FA256;
	Tue, 14 Jan 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQHiRpI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BA21FA15B;
	Tue, 14 Jan 2025 17:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876694; cv=none; b=m34orrJA8O7Kui4PhkeERxtOt7MO/Lm6450a6WVYWITaFvK1YYZiNVwkwDUnJ6h2uiRaslOxd1pE8WnlI8EfuvDoQwsg0K5zpbGtYpUFnNWhmtDghLtatXJM2OroBGM+7vy/tqd9F+0D989faGXD7euWQXG9rlVxSp6Ca9bK5HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876694; c=relaxed/simple;
	bh=OTCnha/a9rNAsnNEvgldUgUR0XgD0TIbmvA4K9sREXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6NQUY2x3gLNudzgDYraYHu0eN1jS5bv5J4SE+U9yc7yV1spgIMUyhaTGNwI3X78XI1wC+Pys+8laKWA3yfelIQgnXQJrDsaziV3zqY+kcmyosq0uhbqrZnVMeG1mvn8IWCzeupJxiSTVRo5uOszpKLRdf20hZ60WoYcW8JGSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQHiRpI2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0305AC4CEE3;
	Tue, 14 Jan 2025 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736876693;
	bh=OTCnha/a9rNAsnNEvgldUgUR0XgD0TIbmvA4K9sREXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQHiRpI2VMOvMYrTphKAsz9y+tHcOAa7ekE9WWHV/+BTPk0hdiYHq7QBbLNlSwjgM
	 GOmd+HDSXuKd+HBiRWczdMRKVaZ4qCKUJ/+JAOF2gPokZa32QIGqsHaJ4oA6r2V0ha
	 hnWnR5CeThS1B5tit+ww9w9sf+Z2/HXY5TteAZsp9B8mCEhCBgLGd6snopFpyIUYuv
	 HHxGTfQGjGKkuCzwxhPLXSFobR1cbALtGBZhBZ1zIvpTf6okjWws+LTwFj0FWLx7aV
	 +QW91xEgFkKIcmsvJrPOXmmJmtpQ8r0pWB4pdx+tS36XzV3wiz7VVxffzy+eRmuh6v
	 RDOtN9kmL/zdg==
Date: Tue, 14 Jan 2025 11:44:52 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <20250114174452.GB1414434-robh@kernel.org>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>

On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> The USB IP-block found in most Qualcomm platforms is modelled in the
> Linux kernel as 3 different independent device drivers, but as shown by
> the already existing layering violations in the Qualcomm glue driver
> they can not be operated independently.
> 
> With the current implementation, the glue driver registers the core and
> has no way to know when this is done. As a result, e.g. the suspend
> callbacks needs to guard against NULL pointer dereferences when trying
> to peek into the struct dwc3 found in the drvdata of the child.
> 
> Missing from the upstream Qualcomm USB support is proper handling of
> role switching, in which the glue needs to be notified upon DRD mode
> changes. Several attempts has been made through the years to register
> callbacks etc, but they always fall short when it comes to handling of
> the core's probe deferral on resources etc.
> 
> Furhtermore, the DeviceTree binding is a direct representation of the
> Linux driver model, and doesn't necessarily describe "the USB IP-block".
> 
> This series therefor attempts to flatten the driver split, and operate
> the glue and core out of the same platform_device instance. And in order
> to do this, the DeviceTree representation of the IP block is flattened.
> 
> To avoid littering the dwc3-qcom driver with the migration code - which
> we should be able to drop again in a LTS or two - this is now placed in
> drivers/of/overlays.
> 
> A patch to convert a single platform - sc8280xp - is included in the
> series. The broader conversion will be submitted in a follow up series.

Is it not possible to use the same overlays also fixup the .dts files at 
build time?

Rob

