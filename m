Return-Path: <linux-arm-msm+bounces-118462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id koLsDzFnUmp/PQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:54:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1A7420D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:54:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bRSMLdJf;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118462-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118462-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5FB53013692
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 15:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CDA3446C9;
	Sat, 11 Jul 2026 15:54:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300332030A;
	Sat, 11 Jul 2026 15:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783785260; cv=none; b=EdpVxEaGpEDXVwGI9x33sdzFU8PeTyjgmS6Opn7qlsS9Yoig4sqmRzUAeBS0KfE5b75aXONcAT5oc5LmOeDSrbn1ER0P560o6qWqLG2uLx5E//0d7WPmk3hA5TBA7Lxj8SZZcYdY6hRa0RfQapYTDyhquxFu3fK47SZXHyM8vCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783785260; c=relaxed/simple;
	bh=Cp0RGIbmrJ5uaOllymo8LDlTD3mMKBPLKxKUuJJZc5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5mgv9IZZFJRTZRPdQT7adTpmSF5KxmIwN9FY0uFeTrL9wGL/t6OA3x9+wzuKhI/u2ph35OZqYOO6DVM/a0v/OjDhCtsSZwoVzam6TvM347F2v2LZ5SAHSTDWL8gvbuEr/OogBAARdLjtT8ur9rem105iIvVpCH5AnSpGy+9IYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRSMLdJf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC1D1F000E9;
	Sat, 11 Jul 2026 15:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783785258;
	bh=/VtPtZme2My9bugHbl1zZZoDHLVRyyk18mXCvdBvYkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bRSMLdJfZ3VTrvJpm/7eIFq4G3Mh1m9jly29naiXV3B04gb3OdjiCmHF9+lSymxr9
	 1u+/Yt9J69u4CTCKaOeGW7h0SbObEndcQEtFtvoX2vJD/C1ZrnEGYC/NsqbvuF9paI
	 wCzpYpWneGUoZH1QkOzzoi4DJP4z3G75dakH6PecdSjxCW7hxwk7mlTKaoFiJz20P3
	 h/oFTP8ckew6QkNszotjjXwmsLZUSNKRfiLiimydVzZ0YNlyD0mx+SJHMQDsMFoFov
	 0IGAp2KUTeRUAPv79p/5DqJSkF3UF0y4I4MWKW4RMIBIZj9YoEBIrptvu0Ogi3XnIC
	 Vmn5l1AxqWSeQ==
Date: Sat, 11 Jul 2026 10:54:16 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] soc: qcom: geni-se: trace: Add trace event
 support for GENI SE registers dump
Message-ID: <alJmNx7Zhkh_qpeX@baldur>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-1-ca1e9ba62359@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-add-tracepoints-for-se-reg-dump-v2-1-ca1e9ba62359@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118462-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,vger.kernel.org:from_smtp,baldur:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2A1A7420D8

On Sat, Jul 11, 2026 at 12:18:41AM +0530, Praveen Talari wrote:
> Add a new trace event header for the Qualcomm GENI Serial Engine (SE)
> framework providing a geni_se_regs tracepoint. This tracepoint
> captures a comprehensive snapshot of the GENI SE hardware state in a
> single trace record, making it possible to correlate register values at
> a precise point in time without multiple sequential reads.

As stated in [a], start your commit message by describing the problem
you're trying to solve, the reader shouldn't have to read the whole
commit message to get an idea about why the change is needed.

[a] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> 
> The trace event records the following register groups:
> 
>  - Main/secondary command and IRQ status (M_CMD0, S_CMD0, M/S_IRQ_STATUS)
>  - Engine status, IOS, and command control/error registers
>  - TX/RX FIFO status and watermark registers (including RFR watermark)
>  - M/S GP length registers
>  - DMA TX/RX IRQ, enable, length, pointer, attribute, and burst registers
>  - DMA interface enable, general config, QSB trans config, and debug
>  - M/S IRQ enable, GSI event enable, and top-level SE IRQ enable
>  - Serial master/slave clock config, general config, output control,
>    clock control RO, FIFO interface disable, and FW multilock MSA
>  - Clock select register
> 
> Having all these registers captured atomically in a single ftrace record
> allows drivers built on top of the GENI SE framework (serial, SPI, I2C)
> to invoke this tracepoint on error paths and reconstruct the full engine
> state during post-mortem analysis without instrumenting each driver
> separately.

I'm not rejecting the patch, but isn't this exactly why we have e.g.
DCC? To allow grabbing a set of registers in adverse events - without
having to write debug code like this in each driver?

Regards,
Bjorn

> 
> Acked-by: Steven Rostedt <rostedt@goodmis.org>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/geni-se.h    |  38 +++++++++
>  include/trace/events/qcom_geni_se.h | 157 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 195 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index c5e6ab85df09..8c08c1917374 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -81,13 +81,16 @@ struct geni_se {
>  };
>  
>  /* Common SE registers */
> +#define GENI_GENERAL_CFG		0x10
>  #define GENI_FORCE_DEFAULT_REG		0x20
>  #define GENI_OUTPUT_CTRL		0x24
>  #define SE_GENI_STATUS			0x40
>  #define GENI_SER_M_CLK_CFG		0x48
>  #define GENI_SER_S_CLK_CFG		0x4c
> +#define GENI_CLK_CTRL_RO		0x60
>  #define GENI_IF_DISABLE_RO		0x64
>  #define GENI_FW_REVISION_RO		0x68
> +#define GENI_FW_MULTILOCK_MSA_RO	0x74
>  #define SE_GENI_CLK_SEL			0x7c
>  #define SE_GENI_CFG_SEQ_START		0x84
>  #define SE_GENI_DMA_MODE_EN		0x258
> @@ -98,6 +101,8 @@ struct geni_se {
>  #define SE_GENI_M_IRQ_CLEAR		0x618
>  #define SE_GENI_M_IRQ_EN_SET		0x61c
>  #define SE_GENI_M_IRQ_EN_CLEAR		0x620
> +#define M_CMD_ERR_STATUS		0x624
> +#define M_FW_ERR_STATUS			0x628
>  #define SE_GENI_S_CMD0			0x630
>  #define SE_GENI_S_CMD_CTRL_REG		0x634
>  #define SE_GENI_S_IRQ_STATUS		0x640
> @@ -115,15 +120,42 @@ struct geni_se {
>  #define SE_GENI_IOS			0x908
>  #define SE_GENI_M_GP_LENGTH		0x910
>  #define SE_GENI_S_GP_LENGTH		0x914
> +/* TX DMA registers */
> +#define SE_DMA_TX_PTR_L			0xc30
> +#define SE_DMA_TX_PTR_H			0xc34
> +#define SE_DMA_TX_ATTR			0xc38
> +#define SE_DMA_TX_LEN			0xc3c
>  #define SE_DMA_TX_IRQ_STAT		0xc40
>  #define SE_DMA_TX_IRQ_CLR		0xc44
> +#define SE_DMA_TX_IRQ_EN		0xc48
> +#define SE_DMA_TX_IRQ_EN_SET		0xc4c
> +#define SE_DMA_TX_IRQ_EN_CLR		0xc50
> +#define SE_DMA_TX_LEN_IN		0xc54
>  #define SE_DMA_TX_FSM_RST		0xc58
> +#define SE_DMA_TX_MAX_BURST		0xc5c
> +/* RX DMA registers */
> +#define SE_DMA_RX_PTR_L			0xd30
> +#define SE_DMA_RX_PTR_H			0xd34
> +#define SE_DMA_RX_ATTR			0xd38
> +#define SE_DMA_RX_LEN			0xd3c
>  #define SE_DMA_RX_IRQ_STAT		0xd40
>  #define SE_DMA_RX_IRQ_CLR		0xd44
> +#define SE_DMA_RX_IRQ_EN		0xd48
> +#define SE_DMA_RX_IRQ_EN_SET		0xd4c
> +#define SE_DMA_RX_IRQ_EN_CLR		0xd50
>  #define SE_DMA_RX_LEN_IN		0xd54
>  #define SE_DMA_RX_FSM_RST		0xd58
> +#define SE_DMA_RX_MAX_BURST		0xd5c
> +/* DMA general / debug registers */
> +#define SE_GSI_EVENT_EN			0xe18
> +#define SE_IRQ_EN			0xe1c
> +#define DMA_IF_EN_RO			0xe20
>  #define SE_HW_PARAM_0			0xe24
>  #define SE_HW_PARAM_1			0xe28
> +#define DMA_GENERAL_CFG			0xe30
> +#define SE_DMA_QSB_TRANS_CFG		0xe38
> +#define SE_DMA_DEBUG_REG0		0xe40
> +#define SE_DMA_IF_EN			0x2004
>  
>  /* GENI_FORCE_DEFAULT_REG fields */
>  #define FORCE_DEFAULT	BIT(0)
> @@ -269,6 +301,12 @@ struct geni_se {
>  #define RX_GENI_GP_IRQ_EXT		GENMASK(13, 12)
>  #define RX_GENI_CANCEL_IRQ		BIT(14)
>  
> +/* SE_DMA_DEBUG_REG0 fields */
> +#define DMA_TX_ACTIVE			BIT(0)
> +#define DMA_RX_ACTIVE			BIT(1)
> +#define DMA_TX_STATE			GENMASK(7, 4)
> +#define DMA_RX_STATE			GENMASK(11, 8)
> +
>  /* SE_HW_PARAM_0 fields */
>  #define TX_FIFO_WIDTH_MSK		GENMASK(29, 24)
>  #define TX_FIFO_WIDTH_SHFT		24
> diff --git a/include/trace/events/qcom_geni_se.h b/include/trace/events/qcom_geni_se.h
> new file mode 100644
> index 000000000000..4a6e1ba2d147
> --- /dev/null
> +++ b/include/trace/events/qcom_geni_se.h
> @@ -0,0 +1,157 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM qcom_geni_se
> +
> +#if !defined(_TRACE_QCOM_GENI_SE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_QCOM_GENI_SE_H
> +
> +#include <linux/io.h>
> +#include <linux/tracepoint.h>
> +#include <linux/soc/qcom/geni-se.h>
> +
> +TRACE_EVENT(geni_se_regs,
> +	    TP_PROTO(struct geni_se *se),
> +
> +	    TP_ARGS(se),
> +
> +	    TP_STRUCT__entry(__string(geni_se_name,		dev_name(se->dev))
> +		__field(u32,	geni_se_m_cmd0)
> +		__field(u32,	geni_se_m_irq_status)
> +		__field(u32,	geni_se_s_cmd0)
> +		__field(u32,	geni_se_s_irq_status)
> +		__field(u32,	geni_se_status)
> +		__field(u32,	geni_se_ios)
> +		__field(u32,	geni_se_m_cmd_ctrl)
> +		__field(u32,	geni_se_m_cmd_err)
> +		__field(u32,	geni_se_m_fw_err)
> +		__field(u32,	geni_se_tx_fifo_status)
> +		__field(u32,	geni_se_rx_fifo_status)
> +		__field(u32,	geni_se_tx_watermark)
> +		__field(u32,	geni_se_rx_watermark)
> +		__field(u32,	geni_se_rx_watermark_rfr)
> +		__field(u32,	geni_se_m_gp_length)
> +		__field(u32,	geni_se_s_gp_length)
> +		__field(u32,	geni_se_dma_tx_irq)
> +		__field(u32,	geni_se_dma_rx_irq)
> +		__field(u32,	geni_se_dma_tx_irq_en)
> +		__field(u32,	geni_se_dma_rx_irq_en)
> +		__field(u32,	geni_se_dma_rx_len)
> +		__field(u32,	geni_se_dma_rx_len_in)
> +		__field(u32,	geni_se_dma_tx_len)
> +		__field(u32,	geni_se_dma_tx_len_in)
> +		__field(u32,	geni_se_dma_tx_ptr_l)
> +		__field(u32,	geni_se_dma_tx_ptr_h)
> +		__field(u32,	geni_se_dma_rx_ptr_l)
> +		__field(u32,	geni_se_dma_rx_ptr_h)
> +		__field(u32,	geni_se_dma_tx_attr)
> +		__field(u32,	geni_se_dma_tx_max_burst)
> +		__field(u32,	geni_se_dma_rx_attr)
> +		__field(u32,	geni_se_dma_rx_max_burst)
> +		__field(u32,	geni_se_dma_if_en)
> +		__field(u32,	geni_se_dma_if_en_ro)
> +		__field(u32,	geni_se_dma_general_cfg)
> +		__field(u32,	geni_se_dma_qsb_trans_cfg)
> +		__field(u32,	geni_se_dma_dbg)
> +		__field(u32,	geni_se_m_irq_en)
> +		__field(u32,	geni_se_s_irq_en)
> +		__field(u32,	geni_se_gsi_event_en)
> +		__field(u32,	geni_se_irq_en)
> +		__field(u32,	geni_se_ser_m_clk_cfg)
> +		__field(u32,	geni_se_ser_s_clk_cfg)
> +		__field(u32,	geni_se_general_cfg)
> +		__field(u32,	geni_se_output_ctrl)
> +		__field(u32,	geni_se_clk_ctrl_ro)
> +		__field(u32,	geni_se_fifo_if_disable)
> +		__field(u32,	geni_se_fw_multilock_msa)
> +		__field(u32,	geni_se_clk_sel)
> +	    ),
> +
> +	    TP_fast_assign(__assign_str(geni_se_name);
> +		__entry->geni_se_m_cmd0		  = readl(se->base + SE_GENI_M_CMD0);
> +		__entry->geni_se_m_irq_status	  = readl(se->base + SE_GENI_M_IRQ_STATUS);
> +		__entry->geni_se_s_cmd0		  = readl(se->base + SE_GENI_S_CMD0);
> +		__entry->geni_se_s_irq_status	  = readl(se->base + SE_GENI_S_IRQ_STATUS);
> +		__entry->geni_se_status		  = readl(se->base + SE_GENI_STATUS);
> +		__entry->geni_se_ios		  = readl(se->base + SE_GENI_IOS);
> +		__entry->geni_se_m_cmd_ctrl	  = readl(se->base + SE_GENI_M_CMD_CTRL_REG);
> +		__entry->geni_se_m_cmd_err	  = readl(se->base + M_CMD_ERR_STATUS);
> +		__entry->geni_se_m_fw_err	  = readl(se->base + M_FW_ERR_STATUS);
> +		__entry->geni_se_tx_fifo_status	  = readl(se->base + SE_GENI_TX_FIFO_STATUS);
> +		__entry->geni_se_rx_fifo_status	  = readl(se->base + SE_GENI_RX_FIFO_STATUS);
> +		__entry->geni_se_tx_watermark	  = readl(se->base + SE_GENI_TX_WATERMARK_REG);
> +		__entry->geni_se_rx_watermark	  = readl(se->base + SE_GENI_RX_WATERMARK_REG);
> +		__entry->geni_se_rx_watermark_rfr = readl(se->base + SE_GENI_RX_RFR_WATERMARK_REG);
> +		__entry->geni_se_m_gp_length	  = readl(se->base + SE_GENI_M_GP_LENGTH);
> +		__entry->geni_se_s_gp_length	  = readl(se->base + SE_GENI_S_GP_LENGTH);
> +		__entry->geni_se_dma_tx_irq	  = readl(se->base + SE_DMA_TX_IRQ_STAT);
> +		__entry->geni_se_dma_rx_irq	  = readl(se->base + SE_DMA_RX_IRQ_STAT);
> +		__entry->geni_se_dma_tx_irq_en	  = readl(se->base + SE_DMA_TX_IRQ_EN);
> +		__entry->geni_se_dma_rx_irq_en	  = readl(se->base + SE_DMA_RX_IRQ_EN);
> +		__entry->geni_se_dma_rx_len	  = readl(se->base + SE_DMA_RX_LEN);
> +		__entry->geni_se_dma_rx_len_in	  = readl(se->base + SE_DMA_RX_LEN_IN);
> +		__entry->geni_se_dma_tx_len	  = readl(se->base + SE_DMA_TX_LEN);
> +		__entry->geni_se_dma_tx_len_in	  = readl(se->base + SE_DMA_TX_LEN_IN);
> +		__entry->geni_se_dma_tx_ptr_l	  = readl(se->base + SE_DMA_TX_PTR_L);
> +		__entry->geni_se_dma_tx_ptr_h	  = readl(se->base + SE_DMA_TX_PTR_H);
> +		__entry->geni_se_dma_rx_ptr_l	  = readl(se->base + SE_DMA_RX_PTR_L);
> +		__entry->geni_se_dma_rx_ptr_h	  = readl(se->base + SE_DMA_RX_PTR_H);
> +		__entry->geni_se_dma_tx_attr	  = readl(se->base + SE_DMA_TX_ATTR);
> +		__entry->geni_se_dma_tx_max_burst = readl(se->base + SE_DMA_TX_MAX_BURST);
> +		__entry->geni_se_dma_rx_attr	  = readl(se->base + SE_DMA_RX_ATTR);
> +		__entry->geni_se_dma_rx_max_burst = readl(se->base + SE_DMA_RX_MAX_BURST);
> +		__entry->geni_se_dma_if_en	  = readl(se->base + SE_DMA_IF_EN);
> +		__entry->geni_se_dma_if_en_ro	  = readl(se->base + DMA_IF_EN_RO);
> +		__entry->geni_se_dma_general_cfg  = readl(se->base + DMA_GENERAL_CFG);
> +		__entry->geni_se_dma_qsb_trans_cfg = readl(se->base + SE_DMA_QSB_TRANS_CFG);
> +		__entry->geni_se_dma_dbg	  = readl(se->base + SE_DMA_DEBUG_REG0);
> +		__entry->geni_se_m_irq_en	  = readl(se->base + SE_GENI_M_IRQ_EN);
> +		__entry->geni_se_s_irq_en	  = readl(se->base + SE_GENI_S_IRQ_EN);
> +		__entry->geni_se_gsi_event_en	  = readl(se->base + SE_GSI_EVENT_EN);
> +		__entry->geni_se_irq_en		  = readl(se->base + SE_IRQ_EN);
> +		__entry->geni_se_ser_m_clk_cfg	  = readl(se->base + GENI_SER_M_CLK_CFG);
> +		__entry->geni_se_ser_s_clk_cfg	  = readl(se->base + GENI_SER_S_CLK_CFG);
> +		__entry->geni_se_general_cfg	  = readl(se->base + GENI_GENERAL_CFG);
> +		__entry->geni_se_output_ctrl	  = readl(se->base + GENI_OUTPUT_CTRL);
> +		__entry->geni_se_clk_ctrl_ro	  = readl(se->base + GENI_CLK_CTRL_RO);
> +		__entry->geni_se_fifo_if_disable  = readl(se->base + GENI_IF_DISABLE_RO);
> +		__entry->geni_se_fw_multilock_msa = readl(se->base + GENI_FW_MULTILOCK_MSA_RO);
> +		__entry->geni_se_clk_sel	  = readl(se->base + SE_GENI_CLK_SEL);
> +	    ),
> +
> +	    TP_printk("%s: m_cmd0=0x%08x m_irq_status=0x%08x s_cmd0=0x%08x s_irq_status=0x%08x geni_status=0x%08x geni_ios=0x%08x m_cmd_ctrl=0x%08x m_cmd_err=0x%08x m_fw_err=0x%08x tx_fifo_sts=0x%08x rx_fifo_sts=0x%08x tx_watermark=0x%08x rx_watermark=0x%08x rx_watermark_rfr=0x%08x m_gp_length=0x%08x s_gp_length=0x%08x dma_tx_irq=0x%08x dma_rx_irq=0x%08x dma_tx_irq_en=0x%08x dma_rx_irq_en=0x%08x dma_rx_len=0x%08x dma_rx_len_in=0x%08x dma_tx_len=0x%08x dma_tx_len_in=0x%08x dma_tx_ptr_l=0x%08x dma_tx_ptr_h=0x%08x dma_rx_ptr_l=0x%08x dma_rx_ptr_h=0x%08x dma_tx_attr=0x%08x dma_tx_max_burst=0x%08x dma_rx_attr=0x%08x dma_rx_max_burst=0x%08x dma_if_en=0x%08x dma_if_en_ro=0x%08x dma_general_cfg=0x%08x dma_qsb_trans_cfg=0x%08x dma_dbg=0x%08x m_irq_en=0x%08x s_irq_en=0x%08x gsi_event_en=0x%08x se_irq_en=0x%08x ser_m_clk_cfg=0x%08x ser_s_clk_cfg=0x%08x general_cfg=0x%08x output_ctrl=0x%08x clk_ctrl_ro=0x%08x fifo_if_dis=0x%08x fw_multilock_msa=0x%08x clk_sel=0x%08x",
> +		      __get_str(geni_se_name),
> +		      __entry->geni_se_m_cmd0, __entry->geni_se_m_irq_status,
> +		      __entry->geni_se_s_cmd0, __entry->geni_se_s_irq_status,
> +		      __entry->geni_se_status, __entry->geni_se_ios,
> +		      __entry->geni_se_m_cmd_ctrl,
> +		      __entry->geni_se_m_cmd_err, __entry->geni_se_m_fw_err,
> +		      __entry->geni_se_tx_fifo_status, __entry->geni_se_rx_fifo_status,
> +		      __entry->geni_se_tx_watermark, __entry->geni_se_rx_watermark,
> +		      __entry->geni_se_rx_watermark_rfr,
> +		      __entry->geni_se_m_gp_length, __entry->geni_se_s_gp_length,
> +		      __entry->geni_se_dma_tx_irq, __entry->geni_se_dma_rx_irq,
> +		      __entry->geni_se_dma_tx_irq_en, __entry->geni_se_dma_rx_irq_en,
> +		      __entry->geni_se_dma_rx_len, __entry->geni_se_dma_rx_len_in,
> +		      __entry->geni_se_dma_tx_len, __entry->geni_se_dma_tx_len_in,
> +		      __entry->geni_se_dma_tx_ptr_l, __entry->geni_se_dma_tx_ptr_h,
> +		      __entry->geni_se_dma_rx_ptr_l, __entry->geni_se_dma_rx_ptr_h,
> +		      __entry->geni_se_dma_tx_attr, __entry->geni_se_dma_tx_max_burst,
> +		      __entry->geni_se_dma_rx_attr, __entry->geni_se_dma_rx_max_burst,
> +		      __entry->geni_se_dma_if_en, __entry->geni_se_dma_if_en_ro,
> +		      __entry->geni_se_dma_general_cfg, __entry->geni_se_dma_qsb_trans_cfg,
> +		      __entry->geni_se_dma_dbg,
> +		      __entry->geni_se_m_irq_en, __entry->geni_se_s_irq_en,
> +		      __entry->geni_se_gsi_event_en, __entry->geni_se_irq_en,
> +		      __entry->geni_se_ser_m_clk_cfg, __entry->geni_se_ser_s_clk_cfg,
> +		      __entry->geni_se_general_cfg, __entry->geni_se_output_ctrl,
> +		      __entry->geni_se_clk_ctrl_ro, __entry->geni_se_fifo_if_disable,
> +		      __entry->geni_se_fw_multilock_msa, __entry->geni_se_clk_sel)
> +);
> +
> +#endif /* _TRACE_QCOM_GENI_SE_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> 
> -- 
> 2.34.1
> 

