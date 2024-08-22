Return-Path: <linux-arm-msm+bounces-29272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2395B3B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 915B9B21725
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6DA1C93AC;
	Thu, 22 Aug 2024 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmNssrdI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967AC16EB54;
	Thu, 22 Aug 2024 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325928; cv=none; b=FPu2P1Z0uncmAfTUXjYPEdU6NlT8v9budYLQXsOtciI+py95NGqfFTW5i4/QnQ3OlNkBKjS/OHTIge3ttlKhHcPwPynlYfOpZYRfI1ECpPHMG7K/eNiNtlltc+K1KwdmI9Aop2SlwiOtyZaAemB3qS+QBdLHjcrxFT47Sxv2yh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325928; c=relaxed/simple;
	bh=0wm2QDWmoy3DcgYoZOxR4m3/bMn4YIfdxBe8Ay0Wn9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxaZFktbb7bWwR5BhlB/xzPD+zROTTKNq8BHtNjdtq1tF4ytaW+2c4Z3Pi+K6CsF6lIxhO3l//d53ks4+qi33vC3WG+bnRbU8E4fGF/2de9+5e1LuyrHpQGxy1eTRF3eFsHtTtF05z3GpgIkhNc7dCw1f77HUQPatp28FCEt5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmNssrdI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F28C32782;
	Thu, 22 Aug 2024 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724325928;
	bh=0wm2QDWmoy3DcgYoZOxR4m3/bMn4YIfdxBe8Ay0Wn9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmNssrdIoA7QqnvUX8wDzc0wlu56DCiIj/IpdYq5EjtIZr2CpXMWBHEYGqtdNiATe
	 imBWPOyzQiWKjdZ+4L0O9Vgu920Wv4AdnFSeFlLpipcTwEwsB9f1+Lg90CCVgdALIH
	 fiwWShqOf4J2QZlcfieLeGmYTKjzzvKffUGzYAKpp3YnoZdLez791ACWo4rlXuapBD
	 U+sHbemXbWAElMwN36PvEQFtSJ2zyX3FwliANBPWSuh1N6mNulhtBpn9ugWLQX7EWn
	 5+/gmqTEUz1pC9Zba4kv6t9Ar/MuhoSuxhyPMWhm0YjmUKygP0pCba4eF7tHK0m5ez
	 O5ebkcMkczQtw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sh5wZ-000000005PY-2Jhk;
	Thu, 22 Aug 2024 13:25:32 +0200
Date: Thu, 22 Aug 2024 13:25:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Faisal Hassan <quic_faisalh@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Message-ID: <ZscgKygXTFON3lKk@hovoldconsulting.com>
References: <20240813111847.31062-1-quic_faisalh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813111847.31062-1-quic_faisalh@quicinc.com>

On Tue, Aug 13, 2024 at 04:48:47PM +0530, Faisal Hassan wrote:
> Null pointer dereference occurs when accessing 'hcd' to detect speed
> from dwc3_qcom_suspend after the xhci-hcd is unbound.

Why are you unbinding the xhci driver?

> To avoid this issue, ensure to check for NULL in dwc3_qcom_read_usb2_speed.
> 
> echo xhci-hcd.0.auto > /sys/bus/platform/drivers/xhci-hcd/unbind
>   xhci_plat_remove() -> usb_put_hcd() -> hcd_release() -> kfree(hcd)
> 
>   Unable to handle kernel NULL pointer dereference at virtual address
>   0000000000000060
>   Call trace:
>    dwc3_qcom_suspend.part.0+0x17c/0x2d0 [dwc3_qcom]
>    dwc3_qcom_runtime_suspend+0x2c/0x40 [dwc3_qcom]
>    pm_generic_runtime_suspend+0x30/0x44
>    __rpm_callback+0x4c/0x190
>    rpm_callback+0x6c/0x80
>    rpm_suspend+0x10c/0x620
>    pm_runtime_work+0xc8/0xe0
>    process_one_work+0x1e4/0x4f4
>    worker_thread+0x64/0x43c
>    kthread+0xec/0x100
>    ret_from_fork+0x10/0x20
> 
> Fixes: c5f14abeb52b ("usb: dwc3: qcom: fix peripheral and OTG suspend")

This is clearly not the commit that introduced this issue, please be
more careful.

Also make sure to CC the author of any patch introducing a bug so that
they may help with review.

> Cc: stable@vger.kernel.org
> Signed-off-by: Faisal Hassan <quic_faisalh@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 88fb6706a18d..0c7846478655 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -319,13 +319,15 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
>  {
>  	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> -	struct usb_device *udev;
> +	struct usb_device __maybe_unused *udev;
>  	struct usb_hcd __maybe_unused *hcd;
>  
>  	/*
>  	 * FIXME: Fix this layering violation.
>  	 */
>  	hcd = platform_get_drvdata(dwc->xhci);
> +	if (!hcd)
> +		return USB_SPEED_UNKNOWN;

This is just papering over the real issue here which is the layering
violation of having drivers accessing driver data of their children. 

Nothing is preventing the driver data from being deallocated after you
check for NULL here.

I suggest leaving this as is until Bjorn's patches that should address
this properly lands.

>  
>  #ifdef CONFIG_USB
>  	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);

Johan

