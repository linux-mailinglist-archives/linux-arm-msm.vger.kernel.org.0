Return-Path: <linux-arm-msm+bounces-64341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03EAFFF63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FF65645CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723F92D8DBE;
	Thu, 10 Jul 2025 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck0Q9158"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439CF19CC28;
	Thu, 10 Jul 2025 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143719; cv=none; b=SQ+IvZM3eua8BOrnkK8tQVSuoYyiPAo+jVTUUsGkSYoTeEUDIf03Iu7WtzmY95SGs7GWj7TpBUjxzVDAMiqM8xJKTrOgoo1SWpaxUSemZqdRVuY7+Hg6iYdxrmLsb16qzSdodyWZaJnEl46NtAA6N+89a1ru6FKTXYNqRX1KlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143719; c=relaxed/simple;
	bh=bYZMyZWLjbybXxy6KtLgDhn/vD8fk7GrJM/5ipnjZL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SaX8785W57dXchCSXKJakPOoZD9oPLtUB6reYY+BuyVwCYQ7D4kWbwH7ETEXMPMj2wr2CRwiIzfHBlqAp8UpGs2tIN50iqyEJtkaZ+N/K350BDst+8Plk+S6qiJ6l7wVR5k94IIBVanGw8Ecfee2UT0d7VIjCVbvOSmEId5tfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck0Q9158; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FC6C4CEE3;
	Thu, 10 Jul 2025 10:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752143719;
	bh=bYZMyZWLjbybXxy6KtLgDhn/vD8fk7GrJM/5ipnjZL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ck0Q91586xsRB4whk1o6Tu4MKUSqZKpZN09appcfipZ4+SUKdIQfXekmZOrtBWHG/
	 3CUuLC8/2we290Dh8/cSIK24SzbDxMG9jrLCfnOcoQ8U2i4eyaKh3J2G2O4QUuFbnA
	 LV/7DQVyr02y4gE+5EvI1UjE1oaiFMwT9oWbi8k9AnYtN/h9ZjtZNMEU8qH+jnRMkL
	 7N1MysoyYjZ0sHiZ4uJQwWSUPBb4NiBFu/sqlT2anLN+CxGRrGlRxdbhCFd01eAzFM
	 3xX0AsVnWBjVH+n+4mGZKNH3JXwdQivpgGe4qHwj7ga//j3jHEWYGNQCjGzu4zzbuC
	 i3go/8u74ssqA==
Message-ID: <6f7328df-712b-4c62-82c6-ee69ecec2108@kernel.org>
Date: Thu, 10 Jul 2025 11:35:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "soundwire: qcom: Add set_channel_map api support"
To: Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mohammad Rafi Shaik
 <quic_mohs@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-sound <linux-sound@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
References: <20250709174949.8541-1-amit.pundir@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250709174949.8541-1-amit.pundir@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/25 6:49 PM, Amit Pundir wrote:
> This reverts commit 7796c97df6b1b2206681a07f3c80f6023a6593d5.
> 
> This patch broke Dragonboard 845c (sdm845). I see:
> 
thanks Amit for sending this out,

>     Unexpected kernel BRK exception at EL1
>     Internal error: BRK handler: 00000000f20003e8 [#1]  SMP
>     pc : qcom_swrm_set_channel_map+0x7c/0x80 [soundwire_qcom]
>     lr : snd_soc_dai_set_channel_map+0x34/0x78
>     Call trace:
>      qcom_swrm_set_channel_map+0x7c/0x80 [soundwire_qcom] (P)
>      sdm845_dai_init+0x18c/0x2e0 [snd_soc_sdm845]
>      snd_soc_link_init+0x28/0x6c
>      snd_soc_bind_card+0x5f4/0xb0c
>      snd_soc_register_card+0x148/0x1a4
>      devm_snd_soc_register_card+0x50/0xb0
>      sdm845_snd_platform_probe+0x124/0x148 [snd_soc_sdm845]
>      platform_probe+0x6c/0xd0
>      really_probe+0xc0/0x2a4
>      __driver_probe_device+0x7c/0x130
>      driver_probe_device+0x40/0x118
>      __device_attach_driver+0xc4/0x108
>      bus_for_each_drv+0x8c/0xf0
>      __device_attach+0xa4/0x198
>      device_initial_probe+0x18/0x28
>      bus_probe_device+0xb8/0xbc
>      deferred_probe_work_func+0xac/0xfc
>      process_one_work+0x244/0x658
>      worker_thread+0x1b4/0x360
>      kthread+0x148/0x228
>      ret_from_fork+0x10/0x20
>     Kernel panic - not syncing: BRK handler: Fatal exception
> 
> Dan has also reported following issues with the original patch
> https://lore.kernel.org/all/33fe8fe7-719a-405a-9ed2-d9f816ce1d57@sabinyo.mountain/
> 
> Bug #1:
> The zeroeth element of ctrl->pconfig[] is supposed to be unused.  We
> start counting at 1.  However this code sets ctrl->pconfig[0].ch_mask = 128.
> 
> Bug #2:
> There are SLIM_MAX_TX_PORTS (16) elements in tx_ch[] array but only
> QCOM_SDW_MAX_PORTS + 1 (15) in the ctrl->pconfig[] array so it corrupts
> memory like Yongqin Liu pointed out.
> 
> Bug 3:
> Like Jie Gan pointed out, it erases all the tx information with the rx
> information.
> 
> Cc: <stable@vger.kernel.org> # v6.15+
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---

Acked-by: Srinivas Kandagatla <srini@kernel.org>

--srini
>  drivers/soundwire/qcom.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 295a46dc2be7..0f45e3404756 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -156,7 +156,6 @@ struct qcom_swrm_port_config {
>  	u8 word_length;
>  	u8 blk_group_count;
>  	u8 lane_control;
> -	u8 ch_mask;
>  };
>  
>  /*
> @@ -1049,13 +1048,9 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>  {
>  	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
>  	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> -	struct qcom_swrm_port_config *pcfg;
>  	u32 val;
>  
> -	pcfg = &ctrl->pconfig[enable_ch->port_num];
>  	ctrl->reg_read(ctrl, reg, &val);
> -	if (pcfg->ch_mask != SWR_INVALID_PARAM && pcfg->ch_mask != 0)
> -		enable_ch->ch_mask = pcfg->ch_mask;
>  
>  	if (enable_ch->enable)
>  		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> @@ -1275,26 +1270,6 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
>  	return ctrl->sruntime[dai->id];
>  }
>  
> -static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
> -				     unsigned int tx_num, const unsigned int *tx_slot,
> -				     unsigned int rx_num, const unsigned int *rx_slot)
> -{
> -	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> -	int i;
> -
> -	if (tx_slot) {
> -		for (i = 0; i < tx_num; i++)
> -			ctrl->pconfig[i].ch_mask = tx_slot[i];
> -	}
> -
> -	if (rx_slot) {
> -		for (i = 0; i < rx_num; i++)
> -			ctrl->pconfig[i].ch_mask = rx_slot[i];
> -	}
> -
> -	return 0;
> -}
> -
>  static int qcom_swrm_startup(struct snd_pcm_substream *substream,
>  			     struct snd_soc_dai *dai)
>  {
> @@ -1331,7 +1306,6 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
>  	.shutdown = qcom_swrm_shutdown,
>  	.set_stream = qcom_swrm_set_sdw_stream,
>  	.get_stream = qcom_swrm_get_sdw_stream,
> -	.set_channel_map = qcom_swrm_set_channel_map,
>  };
>  
>  static const struct snd_soc_component_driver qcom_swrm_dai_component = {


