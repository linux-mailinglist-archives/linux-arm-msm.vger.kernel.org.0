Return-Path: <linux-arm-msm+bounces-47590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95251A30CF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 585113A84A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABDB241CAF;
	Tue, 11 Feb 2025 13:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="U4zvpwon"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF601F03E2;
	Tue, 11 Feb 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280738; cv=none; b=Upc2cLAs0GBOydDk/bD2rGesWWR7FpR4bz9o1LHA2bX1Yci3Mbhh8Cii5Z4mreiwZuklGzNizTL+PRHBCRb0vDr6t1qCDe0RLmN8Ld8VLWFfTh4RezcxsbGnrRzWZRITX6CsC6usf4kiOL2WQ9sxgIqNLt4Vj9YqDL4klfGOT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280738; c=relaxed/simple;
	bh=iblFUqfFN7d6iW/DvwtRFMBHAXoJS+rlnKGUZSuP+eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnTKVHjG8l42l5l6K2ISD3o+91XbXlhbkl33OsQYpp+WiiE6DUArqrGa53gEXr4VJQ89xQtZS1QbN0GQY8zziumvSgvagupC3KNAR9+/8p3IJLAeYw4yRph92e6u/83GRaxDjh/gpa7iNFnkhNp1kRLzaC1zpMesZcOpxWUuKww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=U4zvpwon; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ov1w7hbGSo+7ZZmwYvIYEyViiZM3fh+QAdoSLNmScKo=; b=U4zvpwonp0ObNX9gO169W88LHC
	SfAud6VbkHOQd8nm6OmV1sEvAPL31fYu0fIMpJURooNlxkVaLmB104doUfo2Suhs/VfFmyiXtjtqn
	GDjPTL6fGzTFeaHUeFL9n0ZA42vT51LGMTusgtl6qxfMF6KDL2Y8ORN9o53kaqfrGKfM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thqMx-00D4M7-3L; Tue, 11 Feb 2025 14:32:07 +0100
Date: Tue, 11 Feb 2025 14:32:07 +0100
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
Subject: Re: [PATCH net-next v3 06/14] net: ethernet: qualcomm: Initialize
 the PPE scheduler settings
Message-ID: <f8d30195-1ee9-42f2-be82-819c7f7bd219@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-6-453ea18d3271@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-qcom_ipq_ppe-v3-6-453ea18d3271@quicinc.com>

> +/* Scheduler configuration for the assigning and releasing buffers for the
> + * packet passing through PPE, which is different per SoC.
> + */
> +static const struct ppe_scheduler_bm_config ipq9574_ppe_sch_bm_config[] = {
> +	{1, 0, 0, 0, 0},
> +	{1, 1, 0, 0, 0},
> +	{1, 0, 5, 0, 0},
> +	{1, 1, 5, 0, 0},
> +	{1, 0, 6, 0, 0},
> +	{1, 1, 6, 0, 0},
> +	{1, 0, 1, 0, 0},
> +	{1, 1, 1, 0, 0},

Rather than add a comment what it is, add a comment what it means.

It also looks like the first, 3 and 4 value are fixed, so do they even
need to be in the table? And the second value flip-flops?

	Andrew

