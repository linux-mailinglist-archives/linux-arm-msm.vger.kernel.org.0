Return-Path: <linux-arm-msm+bounces-36317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8389B4DEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 16:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFDF51C211AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71B51946A2;
	Tue, 29 Oct 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaPrkfmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96EF1940AA;
	Tue, 29 Oct 2024 15:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215738; cv=none; b=PBTgZEVDF/epj7lYgDkUpSmMMU98T+xB68PUjBvUOG8+L2gXQmMb20Z2/Cocm/RgGvdk4R1WmIlSfASAsnDRs7QY8J2dbhqmtzsOHit1h7HP/nmfFSPUuO4zqxeD3skOLHttqS3LqPdteHdexn7+TzjM6nN6dXN1hDmzu3d69xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215738; c=relaxed/simple;
	bh=1XV7AWS0bMyulrKlI+gBgBaXL63lg4lT/SPouYmF8PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGfPZI2NqJaBjZIYja38e+YykcU3Ic9z6WiNtf7da6aiQuJvlCL4+U2/X5OEwVpenlnGOFhnFMhqbvSBFif/5KcZzmJYB/6ymCHujOh5Q4ywM6fo9rOmP5NnSdBYio1OoVFNSY5Pmr+iolW45INSgpLsBw3N9slkjvvu4smaBqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaPrkfmz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A46EC4CECD;
	Tue, 29 Oct 2024 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215738;
	bh=1XV7AWS0bMyulrKlI+gBgBaXL63lg4lT/SPouYmF8PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaPrkfmzzrMFXFt2M7i9kHf/cA2XPoN8VUSFlKyoQiOA8BFmeIwWBLIoyd1BCQs16
	 zJCB/ZTmWW/ggrJNRYgKSt6QQkL2WGSDSt+GVRZEBCa7wOy3i+txUVG9lLKxyF51IX
	 WXsErryQjhXYlt31uRFMgSsQL3FGVQbeEfFR/IaAypVXD9sPN235veYrBR5om7YDMb
	 lfdfDXwZTvw7sdtBoCf1GCmOC+H8PVkrNiZqjc6Y5d29ZvLMnQZgrnPvQxUYBS156l
	 5knwzbwSkMxNwMR0YtY3Mjx2kJN6RBET7HBIcNa6U7x+myCjdzCIA8zgaTRxOUXtEr
	 pvyHEqicIUXnA==
Date: Tue, 29 Oct 2024 10:28:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, angus.chen@jaguarmicro.com
Subject: Re: [PATCH] usb: typec: qcom-pmic: fix uninitialized value hdr_len
 and txbuf_len
Message-ID: <q5vuljnuhhasjbexc2aphfd3bzykz3v43sx2bb7vu5h5zacb4y@gvzbthmmg6wj>
References: <20241029021823.1978-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029021823.1978-1-rex.nie@jaguarmicro.com>

On Tue, Oct 29, 2024 at 10:18:23AM GMT, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. It makes no sense to print message header
> and payload. It is also not safe to print uninitialized length of ram.
> 
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 5b7f52b74a40..53c2180a773a 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -221,7 +221,7 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>  					  unsigned int negotiated_rev)
>  {
>  	struct device *dev = pmic_typec_pdphy->dev;
> -	unsigned int val, hdr_len, txbuf_len, txsize_len;
> +	unsigned int val, hdr_len = 0, txbuf_len = 0, txsize_len;

This stops us from printing uninitialized values, but the error print is
now containing misleading/false data instead.

As far as I can tell, the assignment of these three variables depend
only on the  "msg" argument passed to the function, not on the
operations leading up to their assignment.

So how about just moving the 3 assignments up to the top of the function
instead?

Regards,
Bjorn

>  	unsigned long flags;
>  	int ret;
>  
> -- 
> 2.17.1
> 
> 

