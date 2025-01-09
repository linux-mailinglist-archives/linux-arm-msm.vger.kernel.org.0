Return-Path: <linux-arm-msm+bounces-44654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F6A07F19
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 18:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 613A11690A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5710E19DFA4;
	Thu,  9 Jan 2025 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7qV75z4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491F192D7E;
	Thu,  9 Jan 2025 17:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736444563; cv=none; b=ru29GR42VRQTzOE5v3mLbOoSKrJVM76zexm/AglEvs9GPELxa8vP7fnR4EQ3jn0ikZdwAgXvJ1Er/GdPirqgPT+IVLDmp3znwrudSlk8pOtuAykEAg/lNhx2kLmZq3bO0cEVKostu43o34JuLJs4G6ERUCJwcvFB1JZ+q5Xw6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736444563; c=relaxed/simple;
	bh=EijKJl28wp+gcuB4mOs6c/TVvHLtx/iw+sxnVMthWYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUSUOFJeoo1vCSgon1yjWfBZ8qlMsubpJKKHcP/0fDN23awdwgc1GE9tqam5y0Ya+kTq1azQMCE7DP+miRW6IAghnMwIe6SMe6aA36U/Mze0IWDQ9MeikS8es1tDjZYh2Uj5iRvbCG0EjY7qxE5zFiAczzwZhSB5VsHdgYALRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7qV75z4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7544C4CED2;
	Thu,  9 Jan 2025 17:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736444561;
	bh=EijKJl28wp+gcuB4mOs6c/TVvHLtx/iw+sxnVMthWYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7qV75z4FmBSLJbt39+WewUqPOjCeSu1TiqeR1vuQkGR/v/WEhXbohOlZi0J+cNg6
	 EYZtY1F9KLKvJfwJtHMO0ly3KoBUnd6Yx0UxjqPCCkuuU0GcqPM2pOxcrpOqts8nVl
	 3oBUhaXCkkdMsevFFbau9KMsobHOlKvyKbG2dO89xQ4HEZ+69koBU+V1BUF3BC9YyB
	 Q6G2KRzajkCcw7rzt9BZLP9jPvwOuonRLKt5grRbl+8fBYT19skPaRWWdkSzzxxngt
	 pPUT9KinyWtt1hMxSE+5M9d/2iC3OTsea25obE9autsUMHykBLcZkLdMz3ZduwJaG9
	 0BSS/fh5yCDbQ==
Date: Thu, 9 Jan 2025 17:42:34 +0000
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
Subject: Re: [PATCH net-next v2 06/14] net: ethernet: qualcomm: Initialize
 the PPE scheduler settings
Message-ID: <20250109174234.GO7706@kernel.org>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
 <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-qcom_ipq_ppe-v2-6-7394dbda7199@quicinc.com>

On Wed, Jan 08, 2025 at 09:47:13PM +0800, Luo Jie wrote:
> The PPE scheduler settings determine the priority of scheduling the
> packet across the different hardware queues per PPE port.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 789 ++++++++++++++++++++++++-
>  drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  37 ++
>  drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   |  97 +++
>  3 files changed, 922 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c

...

> +/**
> + * ppe_queue_scheduler_set - Configure scheduler for PPE hardware queue
> + * @ppe_dev: PPE device
> + * @node_id: PPE queue ID or flow ID
> + * @flow_level: Flow level scheduler or queue level scheduler
> + * @port: PPE port ID set scheduler configuration
> + * @scheduler_cfg: PPE scheduler configuration
> + *
> + * PPE scheduler configuration supports queue level and flow level on
> + * the PPE egress port.
> + *
> + * Return 0 on success, negative error code on failure.

Nit: The tooling would prefer this last line formatted as;

    * Return: ...

or

    * Returns: ...

Flagged by ./scripts/kernel-doc -none -Wall

> + */
> +int ppe_queue_scheduler_set(struct ppe_device *ppe_dev,
> +			    int node_id, bool flow_level, int port,
> +			    struct ppe_scheduler_cfg scheduler_cfg)
> +{
> +	if (flow_level)
> +		return ppe_scheduler_l1_queue_map_set(ppe_dev, node_id,
> +						      port, scheduler_cfg);
> +
> +	return ppe_scheduler_l0_queue_map_set(ppe_dev, node_id,
> +					      port, scheduler_cfg);
> +}

...

