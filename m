Return-Path: <linux-arm-msm+bounces-95367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOiUOGNcqGmZtgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:22:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6337D204236
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 17:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9F42310CCF5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 15:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554B23590B8;
	Wed,  4 Mar 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkoHOiBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FF335BDA4;
	Wed,  4 Mar 2026 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638882; cv=none; b=Yrmf6zlIPpuHoPFufLxSp7IqvcGohSwgJ+Fm/va3IulSlq+aLJukX966WULDTNP/9F2J6AD+MPew1Vzj2slJvc0m3ziunlw8e/8aFCkXkX5iiRgO3t5WT4LngXPb5w+X8qPoUdZc5x1QlaEqgARhvzAuQbWllMYfC5mClMGgXZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638882; c=relaxed/simple;
	bh=GDgZsDaYWixd0mifvp7HmDTxMKQ00NvpOQFXn9PzWT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huNSQ1A1XO1sR5Nb9F4qU3vhGuochLCzOJqa+iOKz20xNrayOq0+T75e39ryu6QoIMNV85mvFqQlTh/UxmX2upSKrNn81vYFwwaN2VGKuQqSxMc6J3XKsrHUyTmGIvapG6cKZesK5eDorAIUWicU3WLfEsD73YzA/Et9vlsctKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkoHOiBg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B8CC4CEF7;
	Wed,  4 Mar 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772638881;
	bh=GDgZsDaYWixd0mifvp7HmDTxMKQ00NvpOQFXn9PzWT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkoHOiBgnbbxYJXbLPm3fjmmg931YF9DWFPj3iDpzjvISn8JrRs3zsS+abyNs6fFM
	 aTzPzDdL7mWzstSqwlmrRRgFHNGN00+GLBVGhEva59S3ZTkowJrxL2UF7UjGHi/W0I
	 FXVKUxs9TLX//Bv4ZWWcUznHyDzurpgAORFyPoj8V6FWWBEVa5c8bhuVFT3rvkK7ni
	 WUx+MIyqgn2JsgXruCVawwlGzYdnQE2ibbIYyfMtyerg1KboEQe+Fc+k/8urcWvW6n
	 +kY15BTkBBzg4MaYr5yhQLoB+1YDOBgdLdsq1Yy06YLX6ofAsE2EZXJ8zQpcSN4xtn
	 RZDpyf9oYNp+Q==
Date: Wed, 4 Mar 2026 21:11:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Can Guo <can.guo@oss.qualcomm.com>
Cc: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com, 
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/11] scsi: ufs: ufs-qcom: Implement vops
 apply_tx_eqtr_settings()
Message-ID: <uqhyyyt5spxggiyhzcrnlcl2noomkfybw5kieki4lde6kdaryt@ozdoxegemqpn>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
 <20260304135313.413688-11-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304135313.413688-11-can.guo@oss.qualcomm.com>
X-Rspamd-Queue-Id: 6337D204236
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95367-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 05:53:12AM -0800, Can Guo wrote:
> On some platforms, when Host Software triggers TX Equalization Training,
> HW does not take TX EQTR settings programmed in PA_TxEQTRSetting, instead
> HW takes TX EQTR settings from PA_TxEQG1Setting. Implement vops
> apply_tx_eqtr_setting() to work around it by programming TX EQTR settings
> to PA_TxEQG1Setting during TX EQTR procedure.
> 
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 33 +++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h |  2 ++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index b8fa4670ddd6..89bea823a08b 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2848,6 +2848,28 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
>  	return ret;
>  }
>  
> +static int ufs_qcom_apply_tx_eqtr_settings(struct ufs_hba *hba,
> +					   struct ufs_pa_layer_attr *pwr_mode,
> +					   struct tx_eqtr_iter *h_iter,
> +					   struct tx_eqtr_iter *d_iter)
> +{
> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> +	u32 setting = 0;
> +	int lane, ret;
> +
> +	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
> +		return 0;
> +
> +	for (lane = 0; lane < h_iter->num_lanes; lane++) {
> +		setting |= TX_HS_PRESHOOT_BITS(lane, h_iter->preshoot);
> +		setting |= TX_HS_DEEMPHASIS_BITS(lane, h_iter->deemphasis);
> +	}
> +
> +	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXEQG1SETTING), setting);

nit: return ...

- Mani

-- 
மணிவண்ணன் சதாசிவம்

