Return-Path: <linux-arm-msm+bounces-53771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16740A83AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77910171D97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 07:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888E5207666;
	Thu, 10 Apr 2025 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q64sysY0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7A204C3C;
	Thu, 10 Apr 2025 07:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269415; cv=none; b=bRESvLya771BwN8UNHvukohxdhTqgxhITtRPYqC8A7CxEOEWJS6cgZPR56yB8guyy2Dy7BnHwoxWm0XfNDKnndHBW/NFpIg2XyMLjjmZpdgoHZH+xr3BdnlVuEF3rSm+lWlAUMIBZHoP5IOGSS2/sBFjkW4DrwuN2H70ghM2miA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269415; c=relaxed/simple;
	bh=zAbhoNegydtMza1MTmjhtIxxlGmk108gu/bUj1yPPio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6aZa4I9kaZByBP0Q57ZRoOt6gQQPCLupoJWBdBvSlwHNt8CZSo2y9it1rzefId8kqziNFpXLYYSOvZXA7+lZcSqFiAehX1p4k0tpa+KTuJqQQoL6Z1DqWIEvfuV7CU9mTUxHw+itbQY1Aou3tfrV6GcLTfgiHYlcixJJcostRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q64sysY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD61C4CEDD;
	Thu, 10 Apr 2025 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744269413;
	bh=zAbhoNegydtMza1MTmjhtIxxlGmk108gu/bUj1yPPio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q64sysY0jJCV8AJ30ycX/Fct5MUGX4cE5zzOnqgO9ZAvRE83rON1bkPpme1Yvrl+j
	 dYoAppyJEasLAu7ypfN5Gf+pFAROF+E6HSKR/M+EDdo2/g7xAAjf7Ezu3V0auqGYdl
	 yr0r0CvIfJoc6303l233YJewTdjECN7swxrapB/1CtfFk/c+RTGWa5bq7R/Mm5ggrq
	 tIF7pE3mhGuhWexWSRHsMIHvm2NMBU+uCcP7/NeD92rzYQ0/+oAM8U1a9eMZF6qq4l
	 LXUQ5OJTMrBMgqBaiw0KMhb3vNx8rM5MME6/IMkupKzYPtnhTwA1vJOP95YxnoAg1T
	 4TK/2AcaTJjZw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u2m9g-000000003T3-1Bqx;
	Thu, 10 Apr 2025 09:16:57 +0200
Date: Thu, 10 Apr 2025 09:16:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org, johan+linaro@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
Message-ID: <Z_dwaEMoavqsGOEw@hovoldconsulting.com>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
 <20250314174800.10142-3-srinivas.kandagatla@linaro.org>
 <Z_O2RhwYp6iy02cM@hovoldconsulting.com>
 <7222bbbd-51f7-43b6-9755-29808833cf5f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7222bbbd-51f7-43b6-9755-29808833cf5f@linaro.org>

On Tue, Apr 08, 2025 at 09:07:27AM +0100, Srinivas Kandagatla wrote:
> On 07/04/2025 12:25, Johan Hovold wrote:
> > On Fri, Mar 14, 2025 at 05:47:57PM +0000, Srinivas Kandagatla wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >> Implement an helper function in q6apm to be able to read the current
> >> hardware pointer for both read and write buffers.
> >>
> >> This should help q6apm-dai to get the hardware pointer consistently
> >> without it doing manual calculation, which could go wrong in some race
> >> conditions.

> >> @@ -553,6 +567,8 @@ static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
> >>   		rd_done = data->payload;
> >>   		phys = graph->tx_data.buf[hdr->token].phys;
> >>   		mutex_unlock(&graph->lock);
> >> +		/* token numbering starts at 0 */
> >> +		atomic_set(&graph->tx_data.hw_ptr, hdr->token + 1);
> >>   
> >>   		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
> >>   		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {
> > 
> > 			graph->result.opcode = hdr->opcode;
> >                          graph->result.status = rd_done->status;
> >                          if (graph->cb)
> >                                  graph->cb(client_event, hdr->token, data->payload, graph->priv);
> >                  } else {
> >                          dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n", rd_done->buf_addr_lsw,
> >                                  rd_done->buf_addr_msw);
> >                  }
> > 
> > I just hit the following error on the T14s with 6.15-rc1 that I've never
> > seen before and which looks like it could be related to this series:

> Its unlikely, but the timings have changed here.
> I have not seen it either, but I will try to reproduce this with 6.15-rc1.
> > 
> > 	q6apm-dai 6800000.remoteproc:glink-edge:gpr:service@1:dais: RD BUFF Unexpected addr ffe0d200-00000001
> > 
> > Any ideas about what may be causing this?

> How easy is this to reproduce?

I've only noticed this error once on the first boot of 6.15-rc1, and it
does not seem to show up again now.

I did a fair bit of testing with this series on 6.14-rcs, but did not
check the logs while doing so (and there's nothing in the logs I still
have).

Johan

