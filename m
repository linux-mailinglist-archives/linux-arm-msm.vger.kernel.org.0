Return-Path: <linux-arm-msm+bounces-47578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF5A30C6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E7A33A52A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9030721CA12;
	Tue, 11 Feb 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="tm6NpqQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF8215799;
	Tue, 11 Feb 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279085; cv=none; b=REFVeEbU2pjsbnVy6kjtgtJxw5fAJdim1nAd6SEWeCl28Fbfvxh6opomQUenAwwZfdIYwQMBkBFYz2qFqgEJC+nDpPVZaFfqnYA+ED/s446Gdgqf9Hb2Z5vGtUhDx6BZZVnu0GQBFFVcP1WdLpWyFXO1Rk495kuBXMuVB2n83Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279085; c=relaxed/simple;
	bh=sAdcQi1hrUdjrMl6px17gNDTR1HqFZ87LlJBFbf9JzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAvD59abDxOI5t2sQ1jvjIsJhldbG43zMkRWiBlMpCy74cOBD6taKEGsMSjefurChv8tzBZ8vIYJnkNkKHr96iXBe8Fk3zwZBOmMl5fmGJjrUNyQ4c90ut57RSOzFbbkSactV6jEP/R4JIXYbiU0x7wj0kLcsnKzro8J61texKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=tm6NpqQa; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MbjM39msWvOuziAcuJFCWwbKhzNklQkM6TVt4zMre/4=; b=tm6NpqQa797j2ElKfgrG1fjoL/
	vuihCSCb+2lLV2HndDijV062w53OF1JSQzT6rXKwukiGEJQ99iOK3TvWx9mqwtOsaouBM/oarXAmD
	ymPtbZqaRqcMABRn0axZtfZ/kdOzKpWKoi/xO/yeZ8XqZnrQuXxoMVuYN/YhP5eIhVoQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1thpwC-00D3q3-DR; Tue, 11 Feb 2025 14:04:28 +0100
Date: Tue, 11 Feb 2025 14:04:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: Re: [PATCH net-next v3 03/14] net: ethernet: qualcomm: Add PPE
 driver for IPQ9574 SoC
Message-ID: <d0b608ef-bb22-43d5-b9fc-6739964e1bd5@lunn.ch>
References: <20250209-qcom_ipq_ppe-v3-0-453ea18d3271@quicinc.com>
 <20250209-qcom_ipq_ppe-v3-3-453ea18d3271@quicinc.com>
 <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e05149-abc2-4cf4-a6e8-35380823d94a@oss.qualcomm.com>

> > +#ifndef __PPE_H__
> > +#define __PPE_H__
> > +
> > +#include <linux/compiler.h>
> > +#include <linux/interconnect.h>
> > +
> > +struct device;
> #include <linux/device.h> ?
> 
> > +struct regmap;
> Same with previous one, include it's header file?
> 

If the structure is opaque at this level, it is fine to not include
the header. There is nothing in the header actually needed. By not
including it, the build it faster. A large part of the kernel build
time is spent processing headers, so less headers are better.

     Andrew

