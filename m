Return-Path: <linux-arm-msm+bounces-89246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE299D26B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 18:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85A373048716
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 17:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756573BFE3B;
	Thu, 15 Jan 2026 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVP+2yrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B79427A462;
	Thu, 15 Jan 2026 17:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498649; cv=none; b=GLsEJehFz/AfOcB3XP2M6UDsoo5HLQmbt6hR57QzjEwGuzeybZvbaNW6ljroqJBHqlfXcayJvA6bQLTHNpFPK8SBH2NL1iPMZSkgIuiboh1I1fdbs6rg43NDX99M6/RhuzvBY5Ww9B4orKqdchJOLzYmJ/IBR3GQtDPi2X7QcBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498649; c=relaxed/simple;
	bh=lENH+BbL89v1sioGWhjfNOfFQN1i3RM4np9biV2JDn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy0BeFFPBWUtgBQr/oM3Sa8XqXaJOp89tdfOL0bWJYbXNdmSr3ABbAg+1j4V9igDldA4dlWIcxALdXqEg06bKgQr6syZMq5zazak4/gz3yYWkGrGPxhIP96M/2CxYPCcYBez/iZ4ctGNsRp6a2gwhEs2fFluJyAtKGQ1RpbyjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVP+2yrR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC06C116D0;
	Thu, 15 Jan 2026 17:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498649;
	bh=lENH+BbL89v1sioGWhjfNOfFQN1i3RM4np9biV2JDn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVP+2yrRwM+4sci7INnjMuKYVOcM0Ftbo4IgTRzEAc6Opxu6kzQY6Gh9ahHMgpMbW
	 K2bH0Fo3ufATO5PsaquOD6nQ0ZbDr/UhRJ0b1S5fILJnKFUYASyrk/YyKwjYfsOUYa
	 jUEA4UClUsiuo8B54A0CE/yAusfYATAFZ/zYyRrpcQOnySpAR1BsYlyQE9UBuZCs/S
	 ctnLljH5lrfAkrtooNql/TxOJe5DCufnEokgWo9eKe7EBRvf6YxOC5ZMaxDdKFs3gg
	 W9rShNcqhNtdTy9rtcc4artHTAShVnaghr5vxDqjJ/M5txHN2fBQjM6JOZJPDYUlyd
	 DuxnfG3U+QvJg==
Date: Thu, 15 Jan 2026 11:37:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Kees Cook <kees@kernel.org>, devicetree@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>,
	Gabriel Gonzales <semfault@disroot.org>
Subject: Re: [PATCH 5/6] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
Message-ID: <176849864771.930572.3499774593785972153.robh@kernel.org>
References: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
 <20260112-xiaomi-willow-v1-5-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-xiaomi-willow-v1-5-8e4476897638@mainlining.org>


On Mon, 12 Jan 2026 21:13:28 +0100, Barnabás Czémán wrote:
> Document the Xiaomi Redmi Note 8 (willow).
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


