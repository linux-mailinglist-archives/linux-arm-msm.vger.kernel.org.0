Return-Path: <linux-arm-msm+bounces-47585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF5A30CBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D97C3A5D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9711D20B81B;
	Tue, 11 Feb 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fj+OHqQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E4320F;
	Tue, 11 Feb 2025 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280160; cv=none; b=O+o8Oza8FlV/Vj43zxFdE5/aA/VQT9Np7cD0XLSduMJW8PNVxuMOBgnB+q8GeNWzOES1PQmZLYHguiUSLz0UNwVyBMmVWGyuLMUggNJDGEJNY5Z8isoarV+H5ve6LLxDRGPXi32RujwwUoH2alE8/MXINs6NMzzbdc2WHaKKRA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280160; c=relaxed/simple;
	bh=arLglQmV5VidFxnBkrW2+9ueIxpEFFsBaPpAR/6uRLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITnBU9/9DHH2/7iNnARrYH+fVNeeLPY/PuCWP8M281OA5p/5b630PJa6YJa+hl0IsGNcvutd3t/CYYX/oOgE+S9O0rU3Afp0FVS6QKdzSVQW8qs0Z8rvlVI/yN+Jldmp33nq27Hy85Y+zIFKqss/v+zQzMYdwHYpU9OVCYuP0tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fj+OHqQx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nMhOBh8DgkON3jQ47+9kyvLDG3k/HaJv7Qu7721ywG8=; b=fj+OHqQxs9aFuslv8VSUdy/Fgx
	yw89d+vudrPTbh1CDSH9uk4PEqTZe0JStKWpPVO+p62C8fBwJjWXyutNgKE8rYMfV7eaj045AOoei
	z0j5sHyosidbjvE6xOZd2QLjKKgE/Q15eZVAqmt+wnDk2gfe8yewAZQU2kuLH1Z8jVPI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thqDd-00D4BP-JJ; Tue, 11 Feb 2025 14:22:29 +0100
Date: Tue, 11 Feb 2025 14:22:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
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
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
	srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org,
	john@phrozen.org
Subject: Re: [PATCH net-next v3 04/14] net: ethernet: qualcomm: Initialize
 PPE buffer management for IPQ9574
Message-ID: <a79027ed-012c-4771-982c-b80b55ab0c8a@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-qcom_ipq_ppe-v3-4-453ea18d3271@quicinc.com>

> +	/* Configure BM flow control related threshold. */
> +	PPE_BM_PORT_FC_SET_WEIGHT(bm_fc_val, port_cfg.weight);
> +	PPE_BM_PORT_FC_SET_RESUME_OFFSET(bm_fc_val, port_cfg.resume_offset);
> +	PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(bm_fc_val, port_cfg.resume_ceil);
> +	PPE_BM_PORT_FC_SET_DYNAMIC(bm_fc_val, port_cfg.dynamic);
> +	PPE_BM_PORT_FC_SET_REACT_LIMIT(bm_fc_val, port_cfg.in_fly_buf);
> +	PPE_BM_PORT_FC_SET_PRE_ALLOC(bm_fc_val, port_cfg.pre_alloc);

...

> +#define PPE_BM_PORT_FC_CFG_TBL_ADDR		0x601000
> +#define PPE_BM_PORT_FC_CFG_TBL_ENTRIES		15
> +#define PPE_BM_PORT_FC_CFG_TBL_INC		0x10
> +#define PPE_BM_PORT_FC_W0_REACT_LIMIT		GENMASK(8, 0)
> +#define PPE_BM_PORT_FC_W0_RESUME_THRESHOLD	GENMASK(17, 9)
> +#define PPE_BM_PORT_FC_W0_RESUME_OFFSET		GENMASK(28, 18)
> +#define PPE_BM_PORT_FC_W0_CEILING_LOW		GENMASK(31, 29)
> +#define PPE_BM_PORT_FC_W1_CEILING_HIGH		GENMASK(7, 0)
> +#define PPE_BM_PORT_FC_W1_WEIGHT		GENMASK(10, 8)
> +#define PPE_BM_PORT_FC_W1_DYNAMIC		BIT(11)
> +#define PPE_BM_PORT_FC_W1_PRE_ALLOC		GENMASK(22, 12)
> +
> +#define PPE_BM_PORT_FC_SET_REACT_LIMIT(tbl_cfg, value)	\
> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_REACT_LIMIT)
> +#define PPE_BM_PORT_FC_SET_RESUME_THRESHOLD(tbl_cfg, value)	\
> +	u32p_replace_bits((u32 *)tbl_cfg, value, PPE_BM_PORT_FC_W0_RESUME_THRESHOLD)

Where is u32p_replace_bits()?

This cast does not look good. And this does not look like anything any
other driver does. I suspect you are not using FIELD_PREP() etc when
you should.

https://elixir.bootlin.com/linux/v6.14-rc2/source/include/linux/bitfield.h

	Andrew

