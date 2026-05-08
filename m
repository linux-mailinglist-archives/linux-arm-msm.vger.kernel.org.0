Return-Path: <linux-arm-msm+bounces-106738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHtkO2hK/mllowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 22:41:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 443614FB8DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 22:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0A94302BE19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 20:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D6F3FBEAA;
	Fri,  8 May 2026 20:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezSN5YK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316D2F8E86;
	Fri,  8 May 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778272870; cv=none; b=B/raaT9xHUvBJlUEXarmrfSR4o0omuYof2ctGYZWekZdx/yrXAgvoiRH6wAT6kZgFa7b59p29HWtYd6SvuG+psuewcTG0UGs7Tk88Or78Lms816iFfVZoz5cRQnrYNTf4L472nWZBZf8ypFUK2ecVXK+TgBkLg4tYk21oGPe7sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778272870; c=relaxed/simple;
	bh=0Qce7ji6HZHiSet9KkBcABJoUjVUTi1bg5p1SOdfLfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUzDK895HlCJxs59bImFrOZ9M9iouLuneZNRYmz/lacjG1HxzOK2riilEjW7f9Gbh/hvJklMEIFQqOlTXVp76cigcTHH6ATx9orSay34fF85XKu36B8OfzVZlgJpt6x+pG0hhJLRvcWr/vA44Q3tXiJdcClMoN4T7OW8/SRxqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezSN5YK0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C4DC2BCB0;
	Fri,  8 May 2026 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778272869;
	bh=0Qce7ji6HZHiSet9KkBcABJoUjVUTi1bg5p1SOdfLfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezSN5YK0pMKhStIldJv8EiP70nBtpNpkTVCKb7VHt5mwUg1XfAk79Hi+SZ7rqiOF3
	 hWaImOhQE3EwM0hkOCpxjVKCm0d0H2FF19x5DSizpH/CSs+OanZig6NS8rgMy1bT4C
	 ijQgj5jGP8IcDje+1OId7Dp25CLCIzZyOh1Jy1vcmq0PJnIFG03s3ou3XozYjbw3XE
	 CCVr0hgXI2s6L9nEhx+rmKVUii27gTOf1Pe/ov9PTyPXmjlSZEAESG3B2Fr4KgIT/w
	 GOpAW28w0oefR9SZMfEKAp2cLXYy2yq4BV7aQD83U1+ca2h3ptrgTDQp1wGHRMqUK2
	 CjOhCPom9VotA==
Message-ID: <27a2c0aa-ca50-4bdf-a735-f4375ffdc8bb@kernel.org>
Date: Fri, 8 May 2026 23:41:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add interconnect provider driver
 for Nord SoC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260420021351.1239355-1-shengchao.guo@oss.qualcomm.com>
 <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
From: Georgi Djakov <djakov@kernel.org>
Content-Language: en-US
In-Reply-To: <20260420021351.1239355-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 443614FB8DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106738-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djakov@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 4/20/26 5:13 AM, Shawn Guo wrote:
> From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> 
> Add driver for the Qualcomm interconnect buses found on Nord SoC.
> The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pair.
> 
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   drivers/interconnect/qcom/Kconfig  |   11 +
>   drivers/interconnect/qcom/Makefile |    2 +
>   drivers/interconnect/qcom/nord.c   | 2682 ++++++++++++++++++++++++++++
>   3 files changed, 2695 insertions(+)
>   create mode 100644 drivers/interconnect/qcom/nord.c
> 
[..]
> +static struct qcom_icc_node * const aggre1_noc_nodes[] = {
> +	[MASTER_QSPI_0] = &qhm_qspi,
> +	[MASTER_SAILSS_MD1] = &qnm_sailss_md1,
> +	[MASTER_QUP_3] = &qxm_qup02,

Maybe this should be qxm_qup3 ?

> +	[SLAVE_A1NOC_SNOC] = &qns_a1noc_snoc,
> +};
[..]
> +static struct qcom_icc_node * const cnoc_cfg_nodes[] = {
> +	[MASTER_CNOC_CFG] = &qsm_cfg,
> +	[SLAVE_PS_ETH_0] = &ps_eth_0,
> +	[SLAVE_PS_ETH_1] = &ps_eth_1,
> +	[SLAVE_SHS_SERVER] = &ps_shs_server,
> +	[SLAVE_AHB2PHY_0] = &qhs_ahb2phy0,
> +	[SLAVE_AHB2PHY_1] = &qhs_ahb2phy1,
> +	[SLAVE_AHB2PHY_2] = &qhs_ahb2phy2,
> +	[SLAVE_AHB2PHY_3] = &qhs_ahb2phy3,
> +	[SLAVE_AHB2PHY_ETH_0] = &qhs_ahb2phy_eth_0,
> +	[SLAVE_AHB2PHY_ETH_1] = &qhs_ahb2phy_eth_1,
> +	[SLAVE_CAMERA_CFG] = &qhs_camera_cfg,
> +	[SLAVE_CLK_CTL] = &qhs_clk_ctl,
> +	[SLAVE_CRYPTO_0_CFG] = &qhs_crypto0_cfg,
> +	[SLAVE_CRYPTO_1_CFG] = &qhs_crypto1_cfg,
> +	[SLAVE_CRYPTO_2_CFG] = &qhs_crypto2_cfg,
> +	[SLAVE_DISPLAY_1_CFG] = &qhs_display_1_cfg,
> +	[SLAVE_DISPLAY_CFG] = &qhs_display_cfg,
> +	[SLAVE_DPRX0] = &qhs_dprx0,
> +	[SLAVE_DPRX1] = &qhs_dprx1,
> +	[SLAVE_EVA_CFG] = &qhs_eva_cfg,
> +	[SLAVE_GFX3D_CFG] = &qhs_gpuss_0_cfg,
> +	[SLAVE_GFX3D_1_CFG] = &qhs_gpuss_1_cfg,
> +	[SLAVE_I2C] = &qhs_i2c,
> +	[SLAVE_IMEM_CFG] = &qhs_imem_cfg,
> +	[SLAVE_MCW_PCIE] = &qhs_mcw_pcie,
> +	[SLAVE_MM_RSCC] = &qhs_mm_rscc,
> +	[SLAVE_NE_CLK_CTL] = &qhs_ne_clk_ctl,
> +	[SLAVE_NSPSS0_CFG] = &qhs_nspss0_cfg,
> +	[SLAVE_NSPSS1_CFG] = &qhs_nspss1_cfg,
> +	[SLAVE_NSPSS2_CFG] = &qhs_nspss2_cfg,
> +	[SLAVE_NSPSS3_CFG] = &qhs_nspss3_cfg,
> +	[SLAVE_NW_CLK_CTL] = &qhs_nw_clk_ctl,
> +	[SLAVE_PRNG] = &qhs_prng,
> +	[SLAVE_QDSS_CFG] = &qhs_qdss_cfg,
> +	[SLAVE_QSPI_0] = &qhs_qspi,
> +	[SLAVE_QUP_0] = &qhs_qup0,
> +	[SLAVE_QUP_3] = &qhs_qup02,

qhs_qup3 maybe?

> +	[SLAVE_QUP_1] = &qhs_qup1,
> +	[SLAVE_QUP_2] = &qhs_qup2,
> +	[SLAVE_SAFEDMA_CFG] = &qhs_safedma_cfg,
> +	[SLAVE_SDCC_4] = &qhs_sdc4,
> +	[SLAVE_SE_CLK_CTL] = &qhs_se_clk_ctl,
> +	[SLAVE_TCSR] = &qhs_tcsr,
> +	[SLAVE_TLMM] = &qhs_tlmm,
> +	[SLAVE_TSC_CFG] = &qhs_tsc_cfg,
> +	[SLAVE_UFS_MEM_CFG] = &qhs_ufs_mem_cfg,
> +	[SLAVE_USB2] = &qhs_usb2,
> +	[SLAVE_USB3_0] = &qhs_usb3_0,
> +	[SLAVE_USB3_1] = &qhs_usb3_1,
> +	[SLAVE_VENUS_CFG] = &qhs_venus_cfg,
> +	[SLAVE_COMPUTENOC_CFG] = &qss_computenoc_cfg,
> +	[SLAVE_PCIE_NOC_CFG] = &qss_pcie_noc_cfg,
> +	[SLAVE_QTC_CFG] = &qss_qtc_cfg,
> +	[SLAVE_QDSS_STM] = &xs_qdss_stm,
> +	[SLAVE_SYS_TCU0_CFG] = &xs_sys_tcu0_cfg,
> +	[SLAVE_SYS_TCU1_CFG] = &xs_sys_tcu1_cfg,
> +	[SLAVE_SYS_TCU2_CFG] = &xs_sys_tcu2_cfg,
> +};
[..]
> +static const struct regmap_config nord_hscnoc_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x45080,

Is this value correct? The qosbox offsets for some nodes go beyond this.

> +	.fast_io = true,
> +};
> +

The rest looks good!

Thanks,
Georgi

