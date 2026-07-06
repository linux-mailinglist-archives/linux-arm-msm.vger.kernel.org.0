Return-Path: <linux-arm-msm+bounces-116912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G7y+ImvPS2rLagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:53:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F285712D85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=goodmis.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E8A130A3F1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7E342465D;
	Mon,  6 Jul 2026 14:59:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD33822A5;
	Mon,  6 Jul 2026 14:59:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349991; cv=none; b=iqe6v2TdNGd8hxmY3q4cSQiEJcxzvtBDBKbPT0/fz2BHXzqEPmYSFh34UQ48Av+K14Q5nYq00YkP6CxV594DHKZKzeQPPsvbAG6QQssNTcwIG4M9DSHIFKWJMX4X5FaJ5Exnc8UkTC1NdkbSwt5PabxbYtN00YYCxoKOildWy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349991; c=relaxed/simple;
	bh=JLV6tpr3rJ75ST9YS7WzytTvmi+8ph/kKJQ3HYtwU9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTD5NoDD6EQvTl1AmtELTGBEZA9dH8P03A3NeXTacznWFqxIDT1GdMoyoyBqFcFedEnjgdBrfaDP9YR7htV+cox1YMJqYueq+In18j0Dwp2/bioDdExCZSsiZsOZpZTyn8kAgGI5mIDpTn5l3tRsuPfBgylnVMR6XXYIW+Vrtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Received: from omf05.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id D0F20A00FF;
	Mon,  6 Jul 2026 14:59:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 258C720011;
	Mon,  6 Jul 2026 14:59:39 +0000 (UTC)
Date: Mon, 6 Jul 2026 10:59:39 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Mark Brown
 <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com,
 chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: trace: Add trace event support
 for GENI SE registers dump
Message-ID: <20260706105939.7d545304@gandalf.local.home>
In-Reply-To: <20260706-add-tracepoints-for-se-reg-dump-v1-1-48bd08e28cf2@oss.qualcomm.com>
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
	<20260706-add-tracepoints-for-se-reg-dump-v1-1-48bd08e28cf2@oss.qualcomm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: uu6yosxwkakubk1mywby7bgr6uxq4qga
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+WzFChi0OJkl1mFRGNIttsSoW1a5AExP0=
X-HE-Tag: 1783349979-464698
X-HE-Meta: U2FsdGVkX19hJLE9wlLmJYf7g3+Klj0cZFNFrWDZP43p/EAH9WFQNqKArJddvap7x9e3oHFcdXKpRszwGXYo/EqMBQA70dmLcCtUQZMWIw55jaAuHAiisJSf0XOu/9G81EBhjHIE7rkxbv+2UeH1quCVZHQqRXyYv7ccJ91G1pGAq6jCj+PTdtAfVQR9SGB7FpSynsIXmWNi7kuzM6v34ZHVR59Wu0mQ6jVeAYRly0+ASSRg9oPYrIY2qmU7L/FFlpF1kkSqdlqVnz9zWASymgPs7L0cIrBrG67Yi9LB+MQdYnDrjB31hIihMh66RXW9EUSIMOZPx4S/STI+PLOfQK4CSLMIH0qzt5T5AtiF0pJu/5GZ9QuYeUlLzj81Gtird6iLlZ5ICSpsaII5vo2KhA==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116912-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rostedt@goodmis.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,goodmis.org:from_mime,goodmis.org:email,gandalf.local.home:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F285712D85

On Mon, 06 Jul 2026 16:38:12 +0530
Praveen Talari <praveen.talari@oss.qualcomm.com> wrote:

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

Wow, a pretty big trace event! But it still fits in the ring buffer.

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

