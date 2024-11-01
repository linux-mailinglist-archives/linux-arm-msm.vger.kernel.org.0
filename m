Return-Path: <linux-arm-msm+bounces-36765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802889B94AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45CDA28217D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97211C75EC;
	Fri,  1 Nov 2024 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rticl3aU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FEB24B34;
	Fri,  1 Nov 2024 15:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730475915; cv=none; b=Tpx3jMtWNZZrqlUwr3XyY8gQccPDmIi0mS50fH5NzaEEXXbSybQEdh33mUNBHbY2/ZY1Ed+0XJdWm6t1yjC/Zg2YhehxbjtHlPwlS+6Rla9pNOvvqHPiYJEhwDUY5qsoAEE+3N21CsA5OEerK9JcwsQTJMlV/dAbm0gZhQmQ7mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730475915; c=relaxed/simple;
	bh=3vulanNLtTjI+wiz2l4SFzXx/jfbPRTrULNZ2xQqFK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tP/JCfEq9jhc09W+6Pmk9uhsu5nggBHorTZe4/DJ0jbJexNySTzPojTTnSWiBiT5hMdhv2MDhKN/EQjpbDfRHWUSkTgPuu2uQpj4Jrzf3rZxJRK1JnFhQXWkHGwXghNUy2B+c4QMPOHG3ScoSFjFd6U0OXMylkOLV146Z5tYsqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rticl3aU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEECC4CECD;
	Fri,  1 Nov 2024 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730475915;
	bh=3vulanNLtTjI+wiz2l4SFzXx/jfbPRTrULNZ2xQqFK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rticl3aUoGUST6XxG+48LKqrFksdNO96HR0AOdHnQeeU6J9IyeI/Eq9UrxCXd/PN7
	 Jtiv5onuq9eCgsel7erep/lKdXVt4Ob0W3vtGhkP8Fge+EdM34+tOs0xf3xt87fGEi
	 GqCzg3JX861IkOsBTt/MEZORG67m0VVCxj03hex/xgzrlHcgl/HffSrp26XvPoPWci
	 rgUshTB2Ow3DrQwjwFn6lcanDaiFZgP8PwniYMRG3ptTGAqyyqA+b1ZcZ1o6FaOSGA
	 JkBABXwdqLTp27HGTKHLKdZyCKLH0Exj6h4WfuFgVZ21ZT1H5xIPG1EX1SE5e+8z2i
	 fSFJBKRqBU61Q==
Date: Fri, 1 Nov 2024 10:45:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rex Nie <rex.nie@jaguarmicro.com>
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux@roeck-us.net, caleb.connolly@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	angus.chen@jaguarmicro.com, stable@vger.kernel.org
Subject: Re: [PATCH v4] usb: typec: qcom-pmic: init value of
 hdr_len/txbuf_len earlier
Message-ID: <cmudnqum4qaec6hjoxj7wxfkdui65nkij4q2fziihf7tsmg7ry@qa3lkf4g7npw>
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030133632.2116-1-rex.nie@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030133632.2116-1-rex.nie@jaguarmicro.com>

On Wed, Oct 30, 2024 at 09:36:32PM GMT, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Nice job. Next time, please don't use In-Reply-To between patch
versions.

Regards,
Bjorn

> ---
> V2 -> V3:
> - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
> - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
> V1 -> V2:
> - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
> - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 5b7f52b74a40..726423684bae 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>  
>  	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
>  
> +	hdr_len = sizeof(msg->header);
> +	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> +	txsize_len = hdr_len + txbuf_len - 1;
> +
>  	ret = regmap_read(pmic_typec_pdphy->regmap,
>  			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
>  			  &val);
> @@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>  	if (ret)
>  		goto done;
>  
> -	hdr_len = sizeof(msg->header);
> -	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> -	txsize_len = hdr_len + txbuf_len - 1;
> -
>  	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
>  	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
>  				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
> -- 
> 2.17.1
> 
> 

