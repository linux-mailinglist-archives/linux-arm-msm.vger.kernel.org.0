Return-Path: <linux-arm-msm+bounces-3782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 643838096B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 00:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BD5D1F211DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 23:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C03563BE;
	Thu,  7 Dec 2023 23:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVsGFRUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668342ABB;
	Thu,  7 Dec 2023 23:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F705C433C7;
	Thu,  7 Dec 2023 23:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992467;
	bh=F3yFkrBoPvYgnjqkAbhACfF2pHqxuP+Z8Rav20Zxl9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVsGFRUVrs4k5SOD5D4kjazODSA2OlpFebdxjWr9QRTQE34EGts47fCXyNNrWcQSu
	 0we2lGdWGyCpY5jzbRxaB4KUQqrchdbtak2IZLwjdLovJHc3/GG3eT8gF0l+Q6R1wh
	 8IuMxwKflIvH0bvQJiN1d7xTqY3fXPMM/pitmNzkk+RGGhzwJTAydRSXrNTzJ26iWP
	 IxRs1McwWB/6Dk8gYMrYE1Qf7oxw3aOX3+BzM6i8xjm2+gdBGr8kS7ZFzKTt3QBw1f
	 BOzJRCOAx/r2vMeuFOU+adlKp+RpubHa7AjsTb0KVYC1NaPExMotCjZApyPHR7dpx4
	 GMeQdBaS7+H0w==
Date: Thu, 7 Dec 2023 15:44:25 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc: quic_bjorande@quicinc.com, andersson@kernel.org, quic_clew@quicinc.com, 
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, quic_sarannya@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V1] rpmsg: glink: smem: validate index before fifo read
 write
Message-ID: <yqa3hodfpdisdncluoojkqk533lqko5ymbzms3mstjfcxvbkvm@dwwzg24zxpxm>
References: <20231201110631.669085-1-quic_deesin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201110631.669085-1-quic_deesin@quicinc.com>

On Fri, Dec 01, 2023 at 04:36:31PM +0530, Deepak Kumar Singh wrote:
> Fifo head and tail index can be modified with wrong values from
> untrusted remote procs. Glink smem is not validating these index
> before using to read or write fifo. This can result in out of
> bound memory access if head and tail have incorrect values.
> 
> Add check for validation of head and tail index. This check will
> put index within fifo boundaries, so that no invalid memory access
> is made. Further this may result in certain packet drops unless
> glink finds a valid packet header in fifo again and recovers.
> 
> Crash signature and calltrace with wrong head and tail values:
> 
> Internal error: Oops: 96000007 [#1] PREEMPT SMP
> pc : __memcpy_fromio+0x34/0xb4
> lr : glink_smem_rx_peak+0x68/0x94
> 
> __memcpy_fromio+0x34/0xb4
> glink_smem_rx_peak+0x68/0x94
> qcom_glink_native_intr+0x90/0x888
> 
> Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
> ---
>  drivers/rpmsg/qcom_glink_smem.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
> index 7a982c60a8dd..9eba0aaae916 100644
> --- a/drivers/rpmsg/qcom_glink_smem.c
> +++ b/drivers/rpmsg/qcom_glink_smem.c
> @@ -86,9 +86,14 @@ static size_t glink_smem_rx_avail(struct qcom_glink_pipe *np)
>  	tail = le32_to_cpu(*pipe->tail);
>  
>  	if (head < tail)
> -		return pipe->native.length - tail + head;
> +		len = pipe->native.length - tail + head;
>  	else
> -		return head - tail;
> +		len = head - tail;
> +
> +	if (WARN_ON_ONCE(len > pipe->native.length))
> +		len = 0;
> +
> +	return len;
>  }
>  
>  static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
> @@ -99,6 +104,10 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
>  	u32 tail;
>  
>  	tail = le32_to_cpu(*pipe->tail);
> +
> +	if (WARN_ON_ONCE(tail > pipe->native.length))
> +		return;

Just returning here will leave the caller with garbage in @data, which
they will act upon. It does avoid the out of bounds read, but I'm not
confident in what happens next.

> +
>  	tail += offset;
>  	if (tail >= pipe->native.length)
>  		tail -= pipe->native.length;
> @@ -121,7 +130,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
>  
>  	tail += count;
>  	if (tail >= pipe->native.length)
> -		tail -= pipe->native.length;
> +		tail %= pipe->native.length;

If @tail had a bogus value before we incremented then we now have a
completely random value. The next time the FIFO is read these values
will be OK and we will return some random values to the caller.

>  
>  	*pipe->tail = cpu_to_le32(tail);
>  }
> @@ -146,6 +155,9 @@ static size_t glink_smem_tx_avail(struct qcom_glink_pipe *np)
>  	else
>  		avail -= FIFO_FULL_RESERVE + TX_BLOCKED_CMD_RESERVE;
>  
> +	if (WARN_ON_ONCE(avail > pipe->native.length))
> +		avail = 0;
> +
>  	return avail;
>  }
>  
> @@ -155,6 +167,9 @@ static unsigned int glink_smem_tx_write_one(struct glink_smem_pipe *pipe,
>  {
>  	size_t len;
>  
> +	if (WARN_ON_ONCE(head > pipe->native.length))
> +		return head;

As above, but with less probability, this might end up adjusting
pipe->head (in glink_smem_tx_write()) to a random position within the
FIFO - which then upon next access will corrupt the data.

This shouldn't cause any direct issues on the Linux side though, we will
just corrupt the outgoing FIFO (which probably don't matter given that
things are already broken).

Regards,
Bjorn

> +
>  	len = min_t(size_t, count, pipe->native.length - head);
>  	if (len)
>  		memcpy(pipe->fifo + head, data, len);
> -- 
> 2.34.1
> 

