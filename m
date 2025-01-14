Return-Path: <linux-arm-msm+bounces-45054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C2A114F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 00:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 985091889504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 23:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C022577B;
	Tue, 14 Jan 2025 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JydcXOJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB39A221DB1;
	Tue, 14 Jan 2025 23:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736895892; cv=none; b=N3MscfKf3CDRq/I62LAoNpY8/XYWNh2xxy+/GkmBMS/BTDh+11u+gA8ramZxMATfQA9wPKqzwzATYT+nbN61aD2dChUXK7QpXgaHTD1NO0VU5PwCRh8zM2ZHGZ3bELqqL2zJcvZdfR9YV7Ca2CTDeYgb/Scs2tmeYUdBAip98co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736895892; c=relaxed/simple;
	bh=BDTu/UGBHqvqR/oBOPzTd6pu0SwRgZfuzWa5ftsPDb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XU0AERtZK9VJNEWuiBAHej2nhAfwRWxeVD0yp6L5xDJMceKcJEccekdpVSpMnwSqDyODlJjFt8PPnIXIu3zXNUAg32oAAdFZzS+rNL7LR4YH54OxqJXoeKV7LOuy+VzhPfhqPAO/VQ8J7ft81U+AIQ6Z5DOul0ZmuU2HLVhqdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JydcXOJc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484FDC4CEDD;
	Tue, 14 Jan 2025 23:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736895891;
	bh=BDTu/UGBHqvqR/oBOPzTd6pu0SwRgZfuzWa5ftsPDb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JydcXOJcDslTcyYsKUw5dZInb4/aigzSvXoXn0ipywY334Q8WZjrGi6eS1INQlU6g
	 0JrNGPXW3Qz6el1ztm97ipap5RR9lSnsEIxzX1/mqHpHs8ZqKuoKkG+AlyzEj/Wp5B
	 +E2p1JNRgdky+xOowakBypUv2QhC0ECsauKGlftYYDsNTuX/PNww8lY1Qw5tmhuytq
	 qayPNld7CtkzhWllD2U3pIwzbElY7qiI+wZqPub3K/FSGFi9+/hpZfoWRHzF1LBhcA
	 qP2N1WQcXCuv0oEV05XDoUDneE0u2p5lF4U/KvsUfH1k2FklstkySH4RPrbcJuW6cN
	 S15NqcqQrv2ig==
Date: Tue, 14 Jan 2025 17:04:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/12] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <srhxu3r4sxy5ntx53nicf7l43sdjpiwavzd2qsgq2ovquzvt3u@cskcthmqznex>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250114174452.GB1414434-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114174452.GB1414434-robh@kernel.org>

On Tue, Jan 14, 2025 at 11:44:52AM -0600, Rob Herring wrote:
> On Mon, Jan 13, 2025 at 09:11:33PM -0800, Bjorn Andersson wrote:
> > The USB IP-block found in most Qualcomm platforms is modelled in the
> > Linux kernel as 3 different independent device drivers, but as shown by
> > the already existing layering violations in the Qualcomm glue driver
> > they can not be operated independently.
> > 
> > With the current implementation, the glue driver registers the core and
> > has no way to know when this is done. As a result, e.g. the suspend
> > callbacks needs to guard against NULL pointer dereferences when trying
> > to peek into the struct dwc3 found in the drvdata of the child.
> > 
> > Missing from the upstream Qualcomm USB support is proper handling of
> > role switching, in which the glue needs to be notified upon DRD mode
> > changes. Several attempts has been made through the years to register
> > callbacks etc, but they always fall short when it comes to handling of
> > the core's probe deferral on resources etc.
> > 
> > Furhtermore, the DeviceTree binding is a direct representation of the
> > Linux driver model, and doesn't necessarily describe "the USB IP-block".
> > 
> > This series therefor attempts to flatten the driver split, and operate
> > the glue and core out of the same platform_device instance. And in order
> > to do this, the DeviceTree representation of the IP block is flattened.
> > 
> > To avoid littering the dwc3-qcom driver with the migration code - which
> > we should be able to drop again in a LTS or two - this is now placed in
> > drivers/of/overlays.
> > 
> > A patch to convert a single platform - sc8280xp - is included in the
> > series. The broader conversion will be submitted in a follow up series.
> 
> Is it not possible to use the same overlays also fixup the .dts files at 
> build time?
> 

I presume so. What would the benefit of that be, over fixing up the
source asap?

Regards,
Bjorn

