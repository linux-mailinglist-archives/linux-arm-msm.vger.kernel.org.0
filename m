Return-Path: <linux-arm-msm+bounces-68961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDCB24710
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 12:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22126167893
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 10:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96122DCF6C;
	Wed, 13 Aug 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oC17s7pu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8952E2D8DAA;
	Wed, 13 Aug 2025 10:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755080385; cv=none; b=Og3QBhm2vWKM2cHqpaX+NGDHMk14lOa7wJE5sPHhXCalNiP8tQ1Cijgy3bo9MMGuXQe1iNEk1502EMugg1Qpphdml2CeqgAEOQ9MvvtU1X6v6XhyXAeeIVBrV5XTxlJNXxnck58t82uGTZ8OffRfETaP4ukI5F2pfbmzh5fwlx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755080385; c=relaxed/simple;
	bh=WW7Mir+gU34YiTAJqNIWuQD1iRMqnkoBG2eCmufkgPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkA6qr+6r03wMG1XY0xePh5tWvBR8Zu4caH57I0wKaHgCKP1LMuwr++0HWudFQ2iwPibTGsTe38AnVmNiHEkPYfyAz/WpcHYFLdnB2Qtwh1+bj0GW0UmAezqiWFBHXmJIz4x7Og/6dVfYsC0zirF7oc7mafAdrdCwVRJoAYBWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oC17s7pu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9ADC4CEF5;
	Wed, 13 Aug 2025 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755080385;
	bh=WW7Mir+gU34YiTAJqNIWuQD1iRMqnkoBG2eCmufkgPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oC17s7pui1RY1stDQ4cvL6jKwFcXt1pDaUFjfZ7i6p7z6iJikK//nDYYhjeuYjTNt
	 GnrBT7utltwCN2DLL/JxsMdvWXbdZ7vTk5x/PgacmASc5PbJWlkmh1/l/mX3vUlYNu
	 cRDJVxtxpbc7BfhPIqzJ+OcyHvCLllYFJUQ0e745HAVyxkEkw+BMf96RTLdR7/VuDS
	 zdKmbkC5USUw9EnDBTF/binacvEC2KBqVEjV6mhtjj6L1To4g6JfMVoasioIehQP+b
	 hyQ+GdOEz/rXTdZhlbY9u8sinChZFmHvfNTYjKuLvrXk8rOpVkxMqa1gxIfW0THaxY
	 a8t8CAwR8a74A==
Date: Wed, 13 Aug 2025 15:49:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Palash Kambar <quic_pkambar@quicinc.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_nitirawa@quicinc.com
Subject: Re: [PATCH] ufs: ufs-qcom: disable lane clocks during phy hibern8
Message-ID: <w5mkkhxhhndrqhlfomvwohssndtl2njcw7khupyh7qechsynns@kl5ykxtwqawt>
References: <20250715160524.3088594-1-quic_pkambar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715160524.3088594-1-quic_pkambar@quicinc.com>

On Tue, Jul 15, 2025 at 09:35:24PM GMT, Palash Kambar wrote:
> The UFS lane clocks ensure that the PHY is adequately powered and
> synchronized before initiating the link. Currently, these clocks
> remain enabled even after the link enters the Hibern8 state and
> are only turned off during runtime or system suspend.
> 
> Modify the behavior to disable the lane clocks immediately after
> the link transitions to Hibern8, thereby reducing the power
> consumption.
> 

This statement is technically misleading. You are disabling lane clocks in
ufs_qcom_setup_clocks(), which gets called during suspend/resume/clk_gate phase.

But if you want to disable the clocks immediately after Hibern8, you may want to
add the disable/enable logic in hibern8_notify() callback.

If that is not a strict requirement and you want to do it in
ufs_qcom_setup_clocks(), you have to reword the description.

- Mani

> Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 318dca7fe3d7..50e174d9b406 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1141,6 +1141,13 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  	case PRE_CHANGE:
>  		if (on) {
>  			ufs_qcom_icc_update_bw(host);
> +			if (ufs_qcom_is_link_hibern8(hba)) {
> +				err = ufs_qcom_enable_lane_clks(host);
> +				if (err) {
> +					dev_err(hba->dev, "enable lane clks failed, ret=%d\n", err);
> +					return err;
> +				}
> +			}
>  		} else {
>  			if (!ufs_qcom_is_link_active(hba)) {
>  				/* disable device ref_clk */
> @@ -1166,6 +1173,9 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>  			if (ufshcd_is_hs_mode(&hba->pwr_info))
>  				ufs_qcom_dev_ref_clk_ctrl(host, true);
>  		} else {
> +			if (ufs_qcom_is_link_hibern8(hba))
> +				ufs_qcom_disable_lane_clks(host);
> +
>  			ufs_qcom_icc_set_bw(host, ufs_qcom_bw_table[MODE_MIN][0][0].mem_bw,
>  					    ufs_qcom_bw_table[MODE_MIN][0][0].cfg_bw);
>  		}
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

