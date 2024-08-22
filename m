Return-Path: <linux-arm-msm+bounces-29258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96295B1BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC5928443E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 09:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44771741FA;
	Thu, 22 Aug 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GZcvv2nS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D61615572C;
	Thu, 22 Aug 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319220; cv=none; b=X3UBZBewi9RPKpzfk+Rb6+5oVe9WZsOlNprD78DdEV2VLpbPzcfDXHEcWAnlJCF8f6mRFZIPGbvMmCdRqWv/1QE0EWutDx5KTulUs9krCTA463L3MgBnCK4BoCkzAeV0wE3x/DsD6ZSbC9Ag2g0IGjRkFO6rrQsMvsauVoeUsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319220; c=relaxed/simple;
	bh=p7S48QfruIYwHkz8S8PWUe82mvLlNq2MePw4nAygAmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+4+HDU60JIvqRDiAppIRDJRS0ivUoGZ0i4ZzHBVYDWqLHWZd+JE1Qy58jaCfwuslYScIRshe4uls3hE/63lDVs0JI7Zw8fEOECRfcEd877Fd3QFT42GNGGumHDZmjx+fK2BWQsAk4tww2Siqt7XUpD5Gzpyl/3+2WsAhsyd8Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GZcvv2nS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A427C32782;
	Thu, 22 Aug 2024 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724319220;
	bh=p7S48QfruIYwHkz8S8PWUe82mvLlNq2MePw4nAygAmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GZcvv2nSDceIxMI7AFu9lNkmDZhvmyMsG1aSr3IguWOc41YJx94I1plLe1fLHyzYq
	 a9D1D7Gm6Cn3GUe+iz4byvG5GonvMkqivb99KaHVCBAD6KzkZ8Z8NsugwJaJD0uekR
	 SmAT8IkQMyUc+3H8NVZrsTk5Oo1heDPUZRKtc8+Q=
Date: Thu, 22 Aug 2024 17:33:37 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Faisal Hassan <quic_faisalh@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: fix NULL pointer dereference on
 dwc3_qcom_read_usb2_speed
Message-ID: <2024082211-eleven-stinking-9083@gregkh>
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

This change is not relevant to this overall patch, please remove it and
submit it separately if still needed.

thanks,

greg k-h

