Return-Path: <linux-arm-msm+bounces-44656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2543A07F5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DCA73A5E60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34651991D2;
	Thu,  9 Jan 2025 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4ssNGvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE73198A32;
	Thu,  9 Jan 2025 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445127; cv=none; b=LQYYEmwtLrLPn/BYtZ8p3U9bQEt5gOodhHjg+bPM0K7j4SP+PZPK49hgebLexZ6UWf0ku/u9PklZtcGNsIkUOMoTroIa5jssir9F7JanDDfCWio2fyk9jiskilqwXjscG3ZlLGzDCh1C9XFX+rW+fqnCpXQ6dkb/cHslzuHKTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445127; c=relaxed/simple;
	bh=G5CNd0F6kBeo7WGXY+3uBhghJdC70IEAanK9+fFs46Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Epkoq/QEqpQJ/x7Q481VvkYmpuqss9IEMjTPf78JyvqF4BqXfX0TI9h10phabGW1VjuNW9bg9/J3u6rraFLuNXmhjFh1mYVauE5hdPRwpo9PDAmFf+NERmx/MoxMKJCTOoJyjzAtCuT9OWf+Fv/K5QrouTpVBYA14+5OmnR+yTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4ssNGvO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AD8C4CEDF;
	Thu,  9 Jan 2025 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736445127;
	bh=G5CNd0F6kBeo7WGXY+3uBhghJdC70IEAanK9+fFs46Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T4ssNGvOYO0GrVuVdqFOW0WLmQvIE10vp8FN2EJqni7EGvi6zYCp3K+q2dp6h8Eeh
	 h0+po04upZfRSWBkxx+FYhyOFXEQ3GQJhA4VOwYESk9xvaTjBdNRIiDJdcjhKkzab9
	 OHla+2wQgOjgKoWYSCjf8RM74as+VJSR1wvXE7Wa5GzYKbXafn1I2G8Pvo6XiNj5k9
	 khjg+AdWftpoRv/TiHZxheaIL6qufh8WbT3yPhoWf4bQ51r8zEv+iD/UYrdfmjZuFa
	 oAF9s5DYbQfxibuITn+q2OFcJ6gdZel4IbYmJJjZP3mPZ5ER70cQr0BDQyQxNa7vja
	 buFF5CyOZRNjw==
Date: Thu, 9 Jan 2025 17:52:00 +0000
From: Simon Horman <horms@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v2 07/14] net: ethernet: qualcomm: Initialize
 PPE queue settings
Message-ID: <20250109175200.GP7706@kernel.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-7-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:14PM +0800, Luo Jie wrote:
> Configure unicast and multicast hardware queues for the PPE
> ports to enable packet forwarding between the ports.
> 
> Each PPE port is assigned with a range of queues. The queue ID
> selection for a packet is decided by the queue base and queue
> offset that is configured based on the internal priority and
> the RSS hash value of the packet.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 357 ++++++++++++++++++++++++-
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  63 +++++
>  drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  21 ++
>  3 files changed, 440 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c

...

> @@ -673,6 +701,111 @@ static struct ppe_scheduler_port_config ppe_port_sch_config[] = {
>  	},
>  };
>  
> +/* The scheduler resource is applied to each PPE port, The resource
> + * includes the unicast & multicast queues, flow nodes and DRR nodes.
> + */
> +static struct ppe_port_schedule_resource ppe_scheduler_res[] = {
> +	{	.ucastq_start	= 0,
> +		.ucastq_end	= 63,
> +		.mcastq_start	= 256,
> +		.ucastq_end	= 271,

Hi Luo Jie,

This appears to duplicate the initialisation of .ucastq_end.
Should the line above initialise .mcastq_end instead?

Likewise for other elements of this array.

Flagged by W=1 builds with both clang-19 and gcc-14.

> +		.flow_id_start	= 0,
> +		.flow_id_end	= 0,
> +		.l0node_start	= 0,
> +		.l0node_end	= 7,
> +		.l1node_start	= 0,
> +		.l1node_end	= 0,
> +	},
> +	{	.ucastq_start	= 144,
> +		.ucastq_end	= 159,
> +		.mcastq_start	= 272,
> +		.ucastq_end	= 275,
> +		.flow_id_start	= 36,
> +		.flow_id_end	= 39,
> +		.l0node_start	= 48,
> +		.l0node_end	= 63,
> +		.l1node_start	= 8,
> +		.l1node_end	= 11,
> +	},

...

> +};

...

