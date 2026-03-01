Return-Path: <linux-arm-msm+bounces-94716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPYeFs8ipGmMYAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:28:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC461CF54D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 12:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4B2E43007A5A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB8D2EDD7E;
	Sun,  1 Mar 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDy7tykc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B815E2571D7;
	Sun,  1 Mar 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772364487; cv=none; b=SaJaEMReIEHwYZqKr/m+YT8iHipYQDP9k6jQlcvd4oYiUm68tsKBPcrBKbLIGSmHBZsN9frQ/BrkF2MTadnqcswkjBmNsTYIlzzlRVUjaocmD/HWXWrlmJeWTU6P2siHwKkrybRvojXyWaDdptx9qDbQVGH7JJoLxF74i0Wr2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772364487; c=relaxed/simple;
	bh=QWtrvOMn7T/gNS0lawrZ9ZDrwiUkAIFr2H48pd/kStA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j98G9s/dy6l48U1YGHoOeOufcG9MkkCoky+DNyiCxOM0Ta5y63GGxxo1AE9mIe2KcudGX5+LxBvkjXpZVQmscib2N92T4wHKHpeUT/whrKjLoc4lx40Q0hBBf2LUoEWKY8C2JMhZ6c414stC1ixBb7B2JrRTq7174eJKSaJPAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDy7tykc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B862EC116C6;
	Sun,  1 Mar 2026 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772364487;
	bh=QWtrvOMn7T/gNS0lawrZ9ZDrwiUkAIFr2H48pd/kStA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDy7tykcrPsYsgzPrMmxrgbJLPV5GO6KtZO7ANfATMUsswtFgdhLHzCeHBAZw6+ld
	 jXyJJv//Um5rJ8XO8uTqI0AnnjH0z3jMaBNWCnqUBwcokcoLAQlysIG9wtam1l5TEG
	 3LSqCgxhb0q+uQ6Ed7yLClK0dVD4jNHGQha0DN+9CXgorWyYNRtbVCbMoF3zdSBjm+
	 p2cDmKZH0ViX//4g+toZlPXgBlgrTdEOaJ6T8dEQt03WWX0oKcqoKgEYlKDHEW1t+Q
	 BEYpENdSwoP/QGE396AJviL8R4O4Nn5xnrPPzziLntskl5o8EoqnNcH8gffKzmhl6M
	 uCGs2e8DGfQYA==
Date: Sun, 1 Mar 2026 12:28:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: ipq5332: Add the IMEM node
Message-ID: <20260301-tricky-fine-bonobo-da83c0@quoll>
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-6-20fbcc1a9404@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228-imem-v3-6-20fbcc1a9404@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94716-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.131.57.192:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[78b7000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5BC461CF54D
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 06:38:05PM +0530, Kathiravan Thirumoorthy wrote:
> Add the IMEM node to the device tree to extract debugging information
> like system restart reason, which is populated via IMEM. Define the
> IMEM region to enable this functionality.
> 
> As described, overall IMEM region is 80KB but only initial 4KB is
> accessible by all masters in the SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 45fc512a3bab221c0d99f819294abf63369987da..b5f87db419fe7c1cecd05b5a85745cc3971028e4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -423,6 +423,17 @@ blsp1_spi2: spi@78b7000 {
>  			status = "disabled";
>  		};
>  
> +		sram@8600000 {
> +			compatible = "qcom,ipq5332-imem", "mmio-sram";
> +			reg = <0x08600000 0x14000>;
> +			ranges = <0 0x08600000 0x14000>;

Why?

> +
> +			no-memory-wc;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;

Why? You do not have any children.

Best regards,
Krzysztof


