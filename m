Return-Path: <linux-arm-msm+bounces-54035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F00A85F5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 700F07B26A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609A41D86FB;
	Fri, 11 Apr 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z7cKJleZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADF1C5489;
	Fri, 11 Apr 2025 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379034; cv=none; b=TjwkcCqCNkQDz+KMO/Gu8fgLfwwrMX2Gpwp2nJQnUvx/li7/gr+L4fjk0GNHdPcVvBqvGwA/kmU3nC/c0LMGtSXyhARdkKHi9UxOF+m9iljrY6QUTkeRuHKOPnQFFnsZ0ETnMDpb6nSoYxD9L3tsOiNl1XVIlZ5r5q20VY1fazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379034; c=relaxed/simple;
	bh=oRdkdzG1fCjcQr/AxLrV6rsBYdJstSSe6ay/qNRbRso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoM5ywzQHXaXxMDKMIjzmCgbljtuOiWeNZB6tNN6Odx422vkT/xZUTWD6MXYSjOa+Ije8hUYW2Ub5a/fDgTyLsx9B2bQdv5vqRjOiKUxkSgadxmQ0xzFjsPvv2fYktLC9Abyc1hNBK6uT8Ciwd0XhgwJZ8QVV5btigYpQoZRaLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z7cKJleZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0458BC4CEE2;
	Fri, 11 Apr 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744379032;
	bh=oRdkdzG1fCjcQr/AxLrV6rsBYdJstSSe6ay/qNRbRso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7cKJleZm2+INpziPqaQyQr7vTXNxh5dqv0TuaDXljNy9EufPBMyxRoiPlOYzj53B
	 ui5eq9knW7x7qaTtrS0L+d7/34ceoeCe2DYjb18+8/08DngUcAZw5F4qaJVe2bH5Q8
	 XSYxWs9KBU8zqENO/NhtvtTmBlbTrbYGk3NP6ucI=
Date: Fri, 11 Apr 2025 15:43:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] usb: dwc3: qcom: Flatten dwc3 structure
Message-ID: <2025041135-sanitizer-desolate-67cb@gregkh>
References: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-dwc3-refactor-v6-0-dc0d1b336135@oss.qualcomm.com>

On Thu, Apr 10, 2025 at 10:50:11PM -0500, Bjorn Andersson wrote:
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
> Departing from previous versions' attempts at runtime-convert the
> Devicetree representation is swapped out and instead a snapshot of the
> current dwc3-qcom driver is proposed to be carried for a limited time.
> 
> A patch to convert a single platform - sc8280xp - was included in the
> series. This, and others, will be submitted in a separate series as soon
> as its introduction won't break bisection.

Doesn't apply to my usb-next branch, can you rebase and resend?

thanks,

greg k-h

