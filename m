Return-Path: <linux-arm-msm+bounces-53364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77485A7DC2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 13:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5D43AD111
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F5B23BCF4;
	Mon,  7 Apr 2025 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdC4ZxUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E96823DE;
	Mon,  7 Apr 2025 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025152; cv=none; b=mif4rSg0TKIOwSoLTQszjfIvb+4BRse+W90q43X2Sa9YGYfMbm1kJJAQaRPNVF71Pnrv5euFvBliFqSR41ZWW4PqqAWTq2efXZCRH+DSyJjMm1cVYlWF0tnwjartmNTcc1D7ZD3Q5PsJOglOvfj75tQs0iAJ0BD3LUVg/zl2zL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025152; c=relaxed/simple;
	bh=BCuSCWOwFUWbO+XDwPmD2ImUDpAzKHSxQ1lnkPkMPMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFfPeSfmzomy1a/fLuW2Y6NtctS4O0046jumTglHiXCZX4HMev2nRceoG60yXLrA6eJzCdAylWYuINI2T5nQFJUWo1qv3AAjcwcc/XK/SG5Twy5qYhQdgZwMk0rJziveKBUvIuvIkW6jzAFdFUh09+5CWe30muJZwH0KghHRQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdC4ZxUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B3DC4CEDD;
	Mon,  7 Apr 2025 11:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744025152;
	bh=BCuSCWOwFUWbO+XDwPmD2ImUDpAzKHSxQ1lnkPkMPMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdC4ZxUAXHZd8mh8kDreiJy8CQtH8sIPk1CItKc3FH29LuIJECbarERXftciSArLj
	 yxNw0yxWo+pt/RmzK0kvfhLE+hMkrF8PlGjtJuydcr9AUFVXZAtMk3OnlLg55nNCqp
	 5M/UtgHayCzmr/3L3/4J3A2KGoY9KLh2WeKeFnt7404Lw7cSS+55LBQWiZ8q8jQiUs
	 7B7M/SLVBtrt3St+JxacBcpcK/O19LhBalbZ8bbwoEhg2k4YQnZWuFO0tqEGYY9PuW
	 86ycj32YeG/lDaXABY5LRNn2I/1sNw4+iuvADZ5XRr4yDr0bnpmZpNA9d52UfoWPYH
	 U1Y7hcEOv4p9w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u1kc2-0000000022g-0fBB;
	Mon, 07 Apr 2025 13:25:58 +0200
Date: Mon, 7 Apr 2025 13:25:58 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Message-ID: <Z_O2RhwYp6iy02cM@hovoldconsulting.com>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314174800.10142-3-srinivas.kandagatla@linaro.org>

Hi Srini,

On Fri, Mar 14, 2025 at 05:47:57PM +0000, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Implement an helper function in q6apm to be able to read the current
> hardware pointer for both read and write buffers.
> 
> This should help q6apm-dai to get the hardware pointer consistently
> without it doing manual calculation, which could go wrong in some race
> conditions.
 
> +int q6apm_get_hw_pointer(struct q6apm_graph *graph, int dir)
> +{
> +	struct audioreach_graph_data *data;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	return (int)atomic_read(&data->hw_ptr);
> +}
> +EXPORT_SYMBOL_GPL(q6apm_get_hw_pointer);

> @@ -553,6 +567,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>  		rd_done = data->payload;
>  		phys = graph->tx_data.buf[hdr->token].phys;
>  		mutex_unlock(&graph->lock);
> +		/* token numbering starts at 0 */
> +		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
>  
>  		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
>  		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {

			graph->result.opcode = hdr->opcode;
                        graph->result.status = rd_done->status;
                        if (graph->cb)
                                graph->cb(client_event, hdr->token, data->payload, graph->priv);
                } else {
                        dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n", rd_done->buf_addr_lsw,
                                rd_done->buf_addr_msw);
                }

I just hit the following error on the T14s with 6.15-rc1 that I've never
seen before and which looks like it could be related to this series:

	q6apm-dai 6800000.remoteproc:glink-edge:gpr:service@1:dais: RD BUFF Unexpected addr ffe0d200-00000001

Any ideas about what may be causing this?

Johan

