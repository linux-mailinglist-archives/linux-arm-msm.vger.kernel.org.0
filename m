Return-Path: <linux-arm-msm+bounces-103716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNx7COz05Wl+pgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EFF428F39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 11:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29AAD3011770
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE7F38945C;
	Mon, 20 Apr 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wg12nC1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ADD388E63;
	Mon, 20 Apr 2026 09:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776678054; cv=none; b=ozj5jYfJn1moE1eNOcRtcwwyGKv2bIRoTTx2BqgxcZfvzAHG+A1EKOBB8djc5gHXiu67cYakt/HG9KTsu/hbUxd3VE2G7fu/4kHQs2GRTSTwcyboTCbCrQ+i4NZOVe1TIgNV4ySPibs0IqhhiQhNprBU9IJebf0IMLhSHvcsZ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776678054; c=relaxed/simple;
	bh=y2RTbOhSTVfDP0vUgKUYtkZFQAu0tsGb5vnlkXcja1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KglQcQRsIQmw6+NmDnKbLkKTi406fs7+DGG85uKxYslfv4a5mAmFw0Fnf4vlCTfMnoFyPHjq7ct/7fwUyoLn/SRPCplsxgzQxzrqRgdAQh9CPPO5UZdn5zem3ZDz4hU9J7qH1dUZCZbI5BsXVldnuLUv0tnJTeFt/EUrTxcovdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wg12nC1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B932C19425;
	Mon, 20 Apr 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776678054;
	bh=y2RTbOhSTVfDP0vUgKUYtkZFQAu0tsGb5vnlkXcja1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wg12nC1xPlL+Un7Hp65KIuWfkz2EfWbkbwUPR3dWHldGvFH8mILCJiILF8JKFSAvA
	 5SsipftRUG75PH/FUTWGy2/CuZT+oNjQYfzUztc/6+ZzvOUZRtAvRTOaTe/0nnzh46
	 pzwUO9w1rLgDliYZuPSvy9hfc1DJfdyjQMBqo2jRt72Y/e39WUlitXeXQ9767irxGz
	 zKh8gZRa9EnCbvtw49sc7OTebkDRc0NeTJUGg42fWzYI0KHOQ8mrgddSxpKRtIoFuO
	 sD1DiuRkaZPuknTg9mBjWtLw1jmE0Lxh7JjY6RHesPIYPYe/tRJE1g1LRfILy22qdM
	 s3WUn4SM7eMYw==
Date: Mon, 20 Apr 2026 15:10:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bvanassche@acm.org, nitin.rawat@oss.qualcomm.com, shawn.lin@rock-chips.com
Subject: Re: [PATCH v4 2/2] ufs: ufs-qcom: Enable Auto Hibern8 clock request
 support
Message-ID: <4jdkik7lathl5vartkoprcycfvehs6zfhy7zjcwds5p7ccd7nl@7j3co54djvgw>
References: <20260417045602.3042928-1-palash.kambar@oss.qualcomm.com>
 <20260417045602.3042928-3-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417045602.3042928-3-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-103716-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 76EFF428F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 10:26:02AM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 
> On platforms that support Auto Hibern8 (AH8), the UFS controller can
> autonomously de-assert clk_req signals to the Global Clock Controller
> when entering the Hibern8 state. This allows Global Clock Controller
> (GCC) to gate unused clocks, improving power efficiency.
> 
> Enable the Clock Request feature by setting the UFS_HW_CLK_CTRL_EN
> bit in the UFS_AH8_CFG register, as recommended in the Hardware
> Programming Guidelines.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/ufs/host/ufs-qcom.c | 10 ++++++++++
>  drivers/ufs/host/ufs-qcom.h | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8ebee0cc5313..ed4c531e1fb2 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -683,6 +683,13 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
>  	return 0;
>  }
>  
> +static void ufs_qcom_link_startup_post_change(struct ufs_hba *hba)
> +{
> +	if (ufshcd_is_auto_hibern8_supported(hba))
> +		ufshcd_rmwl(hba, UFS_HW_CLK_CTRL_EN, UFS_HW_CLK_CTRL_EN,
> +			    UFS_AH8_CFG);
> +}
> +
>  static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  					enum ufs_notify_change_status status)
>  {
> @@ -708,6 +715,9 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>  		 */
>  		err = ufshcd_disable_host_tx_lcc(hba);
>  
> +		break;
> +	case POST_CHANGE:
> +		ufs_qcom_link_startup_post_change(hba);
>  		break;
>  	default:
>  		break;
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index 380d02333d38..f19def37c86f 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -228,6 +228,17 @@ enum {
>   */
>  #define NUM_TX_R1W1 13
>  
> +/* bit definitions for UFS_AH8_CFG register */
> +#define CC_UFS_SYS_CLK_REQ_EN          BIT(2)
> +#define CC_UFS_ICE_CORE_CLK_REQ_EN     BIT(3)
> +#define CC_UFS_UNIPRO_CORE_CLK_REQ_EN  BIT(4)
> +#define CC_UFS_AUXCLK_REQ_EN           BIT(5)
> +
> +#define UFS_HW_CLK_CTRL_EN	(CC_UFS_SYS_CLK_REQ_EN |\
> +				CC_UFS_ICE_CORE_CLK_REQ_EN |\
> +				CC_UFS_UNIPRO_CORE_CLK_REQ_EN |\
> +				CC_UFS_AUXCLK_REQ_EN)
> +
>  static inline void
>  ufs_qcom_get_controller_revision(struct ufs_hba *hba,
>  				 u8 *major, u16 *minor, u16 *step)
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

