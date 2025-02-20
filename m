Return-Path: <linux-arm-msm+bounces-48701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D5A3DE0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFE841635CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C441D6DA1;
	Thu, 20 Feb 2025 15:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QPUTR3x3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE01CA84;
	Thu, 20 Feb 2025 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064379; cv=none; b=qTAKll70YeDHff7SAq0brQtD61vYttbrtmIp7miC6C0PBlJGRY7h72vBKbTQNqupTMC4eiOiGuCuyQ5c3J8UrTP7HwcKiGs4Mi5ciQ0n3cCO2in0kgjvDPnaVBdPp7soETkcQf+e8ri7uYZ1mvhZKaOZCHsZE1PnO/0CmSPawEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064379; c=relaxed/simple;
	bh=L3ZAFtJopOmv/JiMgxJtyYZ5ZuSirVnb/9abSSZF/1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHEzBoa6CXJDq49MKjNkWcSDQthIGlXQQqAtgmi2C3PPHWMbukZXg9R0ZeUSus18C47H6LtEoxACS0YGA+CWyKpRkU0VnEuQEsGHUS+XAVcZAC679m4Qfm0UadXS4KRpd6WawvWBiDnOK3IEjNtY+nFcHIajIu99BKrhoBph+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=QPUTR3x3; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2W3SBq7jsU0PL6xM+MxseF1qgZIPA0cYwMttD5g9Jl4=; b=QPUTR3x3mzWpBgVDlxZ7X9k0wf
	1AV1lEVJJ+Mn4A8diCb4wdnO+sP24RxwwX3ixEFKrjTGBPF/DQZ8XEHdcVTVyH8YVSUJie8ptrrI5
	B2LNRicG3KRVv3ehFObzSDAYncjN9bYqrtJ/rWVGNXyTwR18/IMDZhu4b+mEhuPT5lwE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tl8EL-00G03T-Ee; Thu, 20 Feb 2025 16:12:49 +0100
Date: Thu, 20 Feb 2025 16:12:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
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
Message-ID: <d0cf941b-db9b-451c-904f-468ffb11e2f7@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-6-453ea18d3271@quicinc.com>
 <f8d30195-1ee9-42f2-be82-819c7f7bd219@lunn.ch>
 <877b3796-3afc-4f3e-a0f5-ec1a6174a921@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877b3796-3afc-4f3e-a0f5-ec1a6174a921@quicinc.com>

> As a general rule, we have tried to keep the data structure definition
> accurately mirror the hardware table design, for easier understanding
> and debug ability of the code.

Could you point me at the datasheet which describes the table?

	Andrew

