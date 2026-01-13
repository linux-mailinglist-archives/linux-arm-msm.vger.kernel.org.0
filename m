Return-Path: <linux-arm-msm+bounces-88692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A5D173AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1E0330046CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9905D3793B0;
	Tue, 13 Jan 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utoE0g34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F1034D909;
	Tue, 13 Jan 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292048; cv=none; b=bBrwmPvF8OkWzpeA/PdGDPPL5e1GCi6FlwSnskQHWlZhp0tREiIZOi6COfaz5PRSY6RBAUIMsctiHwx0TIwVzdon/2CnsjK1UPcuu18Nv49OIvXPJ0QCT5UERgNQbK4aHKn1M1gAcQK3mZd1HoBd4KtaPboktFIf8DgfyOi8T0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292048; c=relaxed/simple;
	bh=A7mGP5zBcxtKo6Ya32gDahYikc66GApTgdae0kYiY3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prDEv2FjoAS9Jruj+y2I7qzUoBz8t+RTBPgtoMxuGz5fE+r00eMy8qhgvdCizXPnsdT+b5mccuVOq4DLwv4HSda2vlmyH984XCa1q8a5Of1bse5DB7KbQwqh9zxYNYKCyp3O9QMMgXe+AR/1awemWvIH2B24aie+ZsA2q6D0ZFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utoE0g34; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9302CC116C6;
	Tue, 13 Jan 2026 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292048;
	bh=A7mGP5zBcxtKo6Ya32gDahYikc66GApTgdae0kYiY3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utoE0g34qABZkA2cE1BzQXdN2qB9cXqwaiQwd9A5LtXzg6l9tmr6OwXlqjVgbAr5j
	 8pKsCi6wDl26YYH/zCZg1am4OxTHneGuNEofYR+ET2J9Vmh9vzIKQWyVlt43TOi8LF
	 LDsZP5BrnGKXmVsglUx3VJpqedUv1XW16JNLMxd9JPoo3zwynvbqKeSvx0VgXW9V46
	 0aDkKv5V/vSWtLlMPXzLctCdrqlkL1wG/1t+0Pk1smRx+xThF5MtFEZkoMbB9bVVc6
	 FwMvC+Ppwt6LwnCM7l4RvKaIg8GyuhlGexewGUZcJyECrWgFv9Q+h9PnyOqHkBP6XL
	 ifwMgp6Sx9wSQ==
Date: Tue, 13 Jan 2026 13:44:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 07/11] bus: mhi: host: core: Add overflow disable flag
Message-ID: <vzmacvzafgrtxupg6cmm2bi5kxuzyeoeod56qzp5ftlnh4txlj@xni5cok2lj3j>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-7-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-7-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:39PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> When the client transfers a large packet, the host may set
> overflow events if the packet size exceeds the transfer ring
> element size. Add a flag to disable overflow events.
> 
> Scenario: A device sends a packet of 5000 bytes. The host has
> buffers of 2048 bytes, so the packet is split across three
> buffers. The host expects one event for the entire packet, but
> three events are generated: two marked as overflow and the
> third as end of packet. The client driver wants only one
> callback for the EOT event, not for overflow events. This
> change prevents host channels from generating overflow events.
> 
> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Great, you just broke bisectability. This patch should come before 06/11 which
uses this flag.

- Mani

> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h        | 3 ++-
>  drivers/bus/mhi/host/init.c     | 3 +++
>  drivers/bus/mhi/host/internal.h | 1 +
>  include/linux/mhi.h             | 2 ++
>  4 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 58f27c6ba63e..31ff4d2e6eba 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -282,7 +282,8 @@ struct mhi_event_ctxt {
>  #define CHAN_CTX_CHSTATE_MASK		GENMASK(7, 0)
>  #define CHAN_CTX_BRSTMODE_MASK		GENMASK(9, 8)
>  #define CHAN_CTX_POLLCFG_MASK		GENMASK(15, 10)
> -#define CHAN_CTX_RESERVED_MASK		GENMASK(31, 16)
> +#define CHAN_CTX_OVF_DISABLE_MASK	GENMASK(17, 16)
> +#define CHAN_CTX_RESERVED_MASK		GENMASK(31, 18)
>  struct mhi_chan_ctxt {
>  	__le32 chcfg;
>  	__le32 chtype;
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 4c092490c9fd..50f96f2c823f 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -340,6 +340,8 @@ static int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
>  		tmp |= FIELD_PREP(CHAN_CTX_BRSTMODE_MASK, mhi_chan->db_cfg.brstmode);
>  		tmp &= ~CHAN_CTX_POLLCFG_MASK;
>  		tmp |= FIELD_PREP(CHAN_CTX_POLLCFG_MASK, mhi_chan->db_cfg.pollcfg);
> +		tmp &= ~CHAN_CTX_OVF_DISABLE_MASK;
> +		tmp |= FIELD_PREP(CHAN_CTX_OVF_DISABLE_MASK, mhi_chan->db_cfg.ovf_dis);
>  		chan_ctxt->chcfg = cpu_to_le32(tmp);
>  
>  		chan_ctxt->chtype = cpu_to_le32(mhi_chan->type);
> @@ -870,6 +872,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  
>  		mhi_chan->ee_mask = ch_cfg->ee_mask;
>  		mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
> +		mhi_chan->db_cfg.ovf_dis = ch_cfg->ovf_disable;
>  		mhi_chan->lpm_notify = ch_cfg->lpm_notify;
>  		mhi_chan->offload_ch = ch_cfg->offload_channel;
>  		mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 97bf6a70b9fa..db00ede0aa48 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -189,6 +189,7 @@ struct db_cfg {
>  	bool reset_req;
>  	bool db_mode;
>  	u32 pollcfg;
> +	bool ovf_dis;
>  	enum mhi_db_brst_mode brstmode;
>  	dma_addr_t db_val;
>  	void (*process_db)(struct mhi_controller *mhi_cntrl,
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 299216b5e4de..926a20835467 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -215,6 +215,7 @@ enum mhi_db_brst_mode {
>   * @ee_mask: Execution Environment mask for this channel
>   * @pollcfg: Polling configuration for burst mode.  0 is default.  milliseconds
>  	     for UL channels, multiple of 8 ring elements for DL channels
> + * @ovf_disbale: Overflow disable flag
>   * @doorbell: Doorbell mode
>   * @lpm_notify: The channel master requires low power mode notifications
>   * @offload_channel: The client manages the channel completely
> @@ -232,6 +233,7 @@ struct mhi_channel_config {
>  	enum mhi_ch_type type;
>  	u32 ee_mask;
>  	u32 pollcfg;
> +	bool ovf_disable;
>  	enum mhi_db_brst_mode doorbell;
>  	bool lpm_notify;
>  	bool offload_channel;
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

