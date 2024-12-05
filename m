Return-Path: <linux-arm-msm+bounces-40470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEEC9E51A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182151881520
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBAB1D61BC;
	Thu,  5 Dec 2024 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJqGGy5p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5C41D5171;
	Thu,  5 Dec 2024 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392061; cv=none; b=Nk1c1x5ksrKwBojSoGPPjxSa+sFesWR5wTgNGgzZzRajpxLeGs9uUPnk4c8Iziqwoyb0JQWwN3v/KWTQ9j0ey3hajC50lkVdgtBvob/63Z79lD7XO7qOw9AqEb4amxWMj95JSufWAilecil6+LLjYJFUcDFZDYtmaXLCRPG0vEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392061; c=relaxed/simple;
	bh=xkjQ1LCSn0m1UxXdzzbdUaPfHjEpu/TP8K1XT00Hy1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOvl+g9ZEWNcW+by1QRObFYBQcT9n/PJQHwo/SHELESFiNPti92DPiAB/7yvbotwcHqjs27lbeD/EmRi1EAWS/aRCsjV7tlssUtckL0iSLibHi0t3XIUUNS7Ark6C1VF1kJOJhrwGVvUeQdr+BzoiLPZ5RRRFSYWDeqE/xzGyIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJqGGy5p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B98C4CED1;
	Thu,  5 Dec 2024 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733392054;
	bh=xkjQ1LCSn0m1UxXdzzbdUaPfHjEpu/TP8K1XT00Hy1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CJqGGy5pxlef3RiAbt0dxRPk8mUiaP+guKX9nc2EviVw7+EF7xo7kxqnY/1V4s5lz
	 Xjh5KPmFIo0V109eYqmeOgf2RaBH95Xc9AWZeeq4RfsqP5gVia2KH/+V3TBFmHay2v
	 +F9qUXZxkD2IRjmcEVXQmluebLnb2o4Fhuew1IdcR1i5zcMRVwiWNA7ZbRrLaK+N6S
	 q3Hp0eUjtBezxnW5iDpfa+sZRcZmzROj67WRI2YTpsObmudDvSZXH5Hp3kbzQrVTuP
	 lLzTEyMtOzfxR7bAsS4JPlIo0BuAAM/GhkBws2oREg0DQ61ZVnD1+SOQ/f8HTmwzug
	 QG6yaIfjPVIoQ==
Date: Thu, 5 Dec 2024 10:47:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lei Wei <quic_leiwei@quicinc.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_kkumarcs@quicinc.com, 
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com, quic_linchen@quicinc.com, 
	quic_luoj@quicinc.com, srinivas.kandagatla@linaro.org, bartosz.golaszewski@linaro.org, 
	vsmuthu@qti.qualcomm.com, john@phrozen.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/5] dt-bindings: net: pcs: Add Ethernet PCS
 for Qualcomm IPQ9574 SoC
Message-ID: <hjdvvki5semqcqn3au7kiqe7njehzxn5rxb4fq3exfzww6zdat@xrzen7rjvckb>
References: <20241204-ipq_pcs_rc1-v2-0-26155f5364a1@quicinc.com>
 <20241204-ipq_pcs_rc1-v2-1-26155f5364a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204-ipq_pcs_rc1-v2-1-26155f5364a1@quicinc.com>

On Wed, Dec 04, 2024 at 10:43:53PM +0800, Lei Wei wrote:
> The 'UNIPHY' PCS block in the IPQ9574 SoC includes PCS and SerDes
> functions. It supports different interface modes to enable Ethernet
> MAC connections to different types of external PHYs/switch. It includes
> PCS functions for 1Gbps and 2.5Gbps interface modes and XPCS functions
> for 10Gbps interface modes. There are three UNIPHY (PCS) instances
> in IPQ9574 SoC which provide PCS/XPCS functions to the six Ethernet
> ports.
> 
> Signed-off-by: Lei Wei <quic_leiwei@quicinc.com>
> ---
>  .../bindings/net/pcs/qcom,ipq9574-pcs.yaml         | 190 +++++++++++++++++++++
>  include/dt-bindings/net/qcom,ipq9574-pcs.h         |  15 ++
>  2 files changed, 205 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


