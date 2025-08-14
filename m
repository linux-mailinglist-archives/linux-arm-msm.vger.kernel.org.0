Return-Path: <linux-arm-msm+bounces-69293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB58B271F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13219AA0BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1D5293C42;
	Thu, 14 Aug 2025 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfgMWQ2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEE828136F;
	Thu, 14 Aug 2025 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211256; cv=none; b=idxuMeiIT3PvQJPXfmEaWBkH+WYEKKTomTqtEdAithcVQ7JySodXYGYA6ASM0lfVSBKGnU+pF/Dp2XTGKavqFUhnULmOQtDXT+z0yywmNrp5mXacKiXQwdgmuuu/UVXs14VDKBXjsMIP8QA3VJQEt72Rgcf8uRVMWkp7dTH7xvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211256; c=relaxed/simple;
	bh=8G9CxDqP1jybeUHRO2NOjhgGn1Kh5z/Nj845EVD600s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyvNcZ0qrHPKso7ASh7ZsxPofjOLhEELuYF9CXOLcU1KHJjZnY/5bqncQUq7P5tTihPeuCID1wrxWkqnqI498UUozu1ZUxZVFEeZj+q9BJrioUoVDy+uRW5AwmLk68bf2tGsbd/DLyF5dBuqs1B8HCTRjLtYDIRb1Ylx4KiX7A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfgMWQ2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AEAC4CEED;
	Thu, 14 Aug 2025 22:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755211255;
	bh=8G9CxDqP1jybeUHRO2NOjhgGn1Kh5z/Nj845EVD600s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfgMWQ2EU4SUB4CFGqVaqHLutotWkmyR/hY/lxAoi1q1I4JYIiR4vGGKpV7Ycbb/U
	 UU9tWmKc13L0/JNm8aMl6S6pNAcOTYyP8nNSaJzwmu0EqKRtdUTG6NZzF2AbKT48V/
	 kHdrzy1sKYAKAmiAnn97R/fiogAM2P11An+NfxfVkrPlxw42pwgcrvE/RTT6zMfUkh
	 ZtNc0snNGTztGfC+EvC3ZF4sy96Ig04+AmMjdef2GHAz97gD89caRB5MU7VRwPrmwJ
	 4I7BdX8OA2imiriWQ+YviVhYxHlDMUaWKbPC2VS/xx68rfo6RRKWTesCXiTXdlz/x/
	 QKTn+aWvXIuAQ==
Date: Thu, 14 Aug 2025 17:40:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pavithra R <quic_pavir@quicinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Lei Wei <quic_leiwei@quicinc.com>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-hardening@vger.kernel.org,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v7 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Message-ID: <175521125408.4049104.2810229443778226424.robh@kernel.org>
References: <20250812-qcom_ipq_ppe-v7-0-789404bdbc9a@quicinc.com>
 <20250812-qcom_ipq_ppe-v7-1-789404bdbc9a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-qcom_ipq_ppe-v7-1-789404bdbc9a@quicinc.com>


On Tue, 12 Aug 2025 22:10:25 +0800, Luo Jie wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
> are used to connect with external PHY devices by PCS. It includes an L2
> switch function for bridging packets among the 6 ethernet ports and the
> CPU port. The CPU port enables packet transfer between the ethernet ports
> and the ARM cores in the SoC, using the ethernet DMA.
> 
> The PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN.
> 
> The PPE switch is modeled according to the ethernet switch schema, with
> additional properties defined for the switch node for interrupts, clocks,
> resets, interconnects and Ethernet DMA. The switch port node is extended
> with additional properties for clocks and resets.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 533 +++++++++++++++++++++
>  1 file changed, 533 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


