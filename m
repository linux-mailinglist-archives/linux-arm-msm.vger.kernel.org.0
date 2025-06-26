Return-Path: <linux-arm-msm+bounces-62691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821A4AEA94D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 00:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04404643A4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 22:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BB8260579;
	Thu, 26 Jun 2025 22:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X6Rh22Wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5861DEFE9;
	Thu, 26 Jun 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975389; cv=none; b=ZE6X4V4CM2C2ruP2Xjc59OfCdm1su1s8lK23xSEz+NiAtfDLjv/pk/gI7AZk/ORDFHf062X4A5xTD/UAsRRI6AT73pFPekJqWMMJv4af1mQBo1XLJDZqs22G2iZCU8HKXWt/J/UeVy68QWSHS7NMfEt1HOszpw+4vHAw4fTCkZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975389; c=relaxed/simple;
	bh=Zz3TomaGnvO04qN3clsGVUtRn6+iXAtAnZgaeVNMRbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ol+ex3+NP/CqJcXVUzIhMv4hY6+qjt9GPfA7tEmayEvqC/Qpi12Jvzc+uTrbdulD+N2skResv7TrJwBMmzEdt5peiRYdwOaDOhwCmNnURLfGv3OBe6SCUy4FIK6jez16PyYv0kOkxw5em3jlevK9dxR+pSc/HVTSP1h1JIpndFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=X6Rh22Wo; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WFlQDU+VohmHIo9h8FaKE3p3VB4fZz3wWW+SCs2CefQ=; b=X6Rh22WouTtz+wX0RaCmLzXTK9
	EhvrrSmKL4GG8o1zLrSR7zhwz9q2Ow4J1XPCgE8DYP4vggAtbAqIPFlaKG0sY/Aj6oDU+9mPregrb
	AXwQipEcAnBpKDHotH9U911o1JMYFJv6RhVYA/hq+Uh+dGj2Z01MsohdKgW9JxYSywXG9h5XKeIIM
	B2KAGxSu2EhTOGaykyOO/J3TIp0doK7iD6fjcgJICT3cYmT+6DCuDpsBU9F+Il1RjTwa39w0fwFpk
	lSogVLqxPZiUriVCHZHOCCCJ3FIoTCnGP7hj/uZ5GMw7yeJUG9+E7H9tA3e5e33HxVtD08jr3Qu/j
	wHUR3jWg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUugG-0000000Cbf7-4Bro;
	Thu, 26 Jun 2025 22:02:53 +0000
Message-ID: <7553d675-622a-4eb6-a216-2eff2f5fe3b0@infradead.org>
Date: Thu, 26 Jun 2025 15:02:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 02/14] docs: networking: Add PPE driver
 documentation for Qualcomm IPQ9574 SoC
To: Luo Jie <quic_luoj@quicinc.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
 Suruchi Agarwal <quic_suruchia@quicinc.com>,
 Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
 quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-2-95bdc6b8f6ff@quicinc.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-2-95bdc6b8f6ff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 6/26/25 7:31 AM, Luo Jie wrote:
> +Below is a simplified hardware diagram of IPQ9574 SoC which includes the PPE engine and
> +other blocks which are in the SoC but outside the PPE engine. These blocks work together
> +to enable the Ethernet for the IPQ SoC::
> +

[snip]

> + | |              +-------------------------+ +---------+ +---------+         | |
> + | |125/312.5M clk|       (PCS0)            | | (PCS1)  | | (PCS2)  | pcs ops | |
> + | +--------------+       UNIPHY0           | | UNIPHY1 | | UNIPHY2 |<--------+ |
> + +--------------->|                         | |         | |         |           |
> + | 31.25M ref clk +-------------------------+ +---------+ +---------+           |
> + |                   |     |      |      |          |          |                |
> + |              +-----------------------------------------------------+         |
> + |25/50M ref clk| +-------------------------+    +------+   +------+  | link    |
> + +------------->| |      QUAD PHY           |    | PHY4 |   | PHY5 |  |---------+
> +                | +-------------------------+    +------+   +------+  | change
> +                |                                                     |
> +                |                       MDIO bus                      |
> +                +-----------------------------------------------------+

Does the 'M' on the clk signals on the left side mean megahertz (MHz)?
I guess that it does, but it was a little confusing when I first saw it.

Thanks.
-- 
~Randy


