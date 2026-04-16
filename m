Return-Path: <linux-arm-msm+bounces-103359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMcJBaqu4GkRkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555140C823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C56C318634F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 09:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3429939C013;
	Thu, 16 Apr 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqNrE+8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E8739C002;
	Thu, 16 Apr 2026 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332143; cv=none; b=ql9ad3rfae3m1znsWqdZMziUy9EPXBGeKJdcPCRIfMiKLodkMeMxIZ6k7nOKOh8oH2KFBUJoAUE43GrAzgxLl0A7ut4qe5tKepG/18emOPGRbLqL2gbiIq+q/G0l5T4xmGU21twaBbH2tyKx+luDRcg/sbvVFog9QMzp0+gM6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332143; c=relaxed/simple;
	bh=Na4TpuUuc6fAl3ui0+vDl787FpKfXjMymOJKEX2Kqxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/K8VSr8eNaohHaEH+TvnDteKcKJuyr/mVJy4AmC7kJiPB7HXg9+ImAycL1oXSADM8Yqq1FMKZvMnvp5iYZpKGlEOHo3xelUzVfOUx0MgcnyoVD3JHa3Xf1XKD6Bg3xJ6YFyT0+HBmolDWovYKuhzzVO8wZ2r+nYt1ItzoliuqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqNrE+8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998B9C2BCAF;
	Thu, 16 Apr 2026 09:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332143;
	bh=Na4TpuUuc6fAl3ui0+vDl787FpKfXjMymOJKEX2Kqxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hqNrE+8N4RGODIxVEx4DzoS1vXFzYMvqlD42LlDfYjaK38NXFNb6ke0g9pMqe5Ktl
	 xS9X/k77rumIsBH4VmEMaUSqvB9kkclyPucYw/321Xfk9wT61d6l6Qi1IuWlo1M3dn
	 Ue/TIIwTT5mwYsSI0klz5v29a7g6ifXmpnhc6rwk5x/dB1bUsrpXqcBEWdn5vDa2qx
	 S/Kz1t8WTURQSTRrjfnsUwwq4SYl6NIm0lQS8KoM1D+dEy9thSWMetYL5es7DH6VT3
	 YxDAWNPZ7C3UbvPPyZLw6e2mk08u8YA9Uifl5jWTse5XvLlD07m3eSpGIREt+scSv7
	 hqc28/lTA95BQ==
Date: Thu, 16 Apr 2026 11:35:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
Message-ID: <20260416-khaki-goose-of-will-ec76bf@quoll>
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
X-Spamd-Result: default: False [5.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103359-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.393];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 5555140C823
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 07:03:19PM +0530, Kathiravan Thirumoorthy wrote:
> +		xo_board: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {

Labels should be lowercase.

Best regards,
Krzysztof


