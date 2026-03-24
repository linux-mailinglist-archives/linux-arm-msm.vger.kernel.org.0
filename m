Return-Path: <linux-arm-msm+bounces-99517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3O7MHt30wWnEYQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:20:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72030116B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4973A3039CB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C7D3845DC;
	Tue, 24 Mar 2026 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yg0lpVXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ABD37E31A;
	Tue, 24 Mar 2026 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318516; cv=none; b=T70RxiGgTOZBmaSELLJH1XsfzIvcKKmCORbAkr80DvXBCn83aJakwfuvXVdJIuhn3x51bgPnXF0+0B+e1jmtod8lF2TP6WOmdk4iR1gGfoMAhByKahF8KbMcduTr6lMwChNiaVCAgWunvjEZPkkhGvnOkJw3ogl+YT2rYrcKgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318516; c=relaxed/simple;
	bh=rIFWwJUqiCp1Jl+mqpSyqvTB8W+mi57oTKhMqKYzxa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFjCz4VIdLJr7V91X3DpDYPB01w2m2/eX/dCJuq4vqdmDeyKmmBumjkpqcRG5J+iyPSfQVevdNf1VCN16fqMHrYddNiNOaKB5AHDEvQ2TE+XZ+e5tJfoPx4o7lgvCtiCV949HYhEoVwHTfosWGF4OmIZVcV7GesexVJp2rQktDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yg0lpVXq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00AF0C4CEF7;
	Tue, 24 Mar 2026 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774318515;
	bh=rIFWwJUqiCp1Jl+mqpSyqvTB8W+mi57oTKhMqKYzxa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yg0lpVXqZSKwxAx3dWOhTxIyqeGZrR1/1VJtyb2fOWjMNUHNmFy4jSCJyCBFpRsfe
	 gq+5V1uq0ZNu2ZxYHrkjaNbH69pt+5v5VbcZ9DmgoDgViD9bZhbbh8SwGgyPfeYMdC
	 Yl2zG1Ijx0QQqu00A6T9acFRX9rIv+9NiN69g52O6Kk3C8nQGmEqNPwLQXXi3g11xv
	 lJrj37mrq+lynKHULYAdZ9F0P7OeTmFcKKfPHLV2Pt4/rQg/QswnzTlAkuLoIU5r5Q
	 brWr5WTv/2WvHY8QBRoMvjcPks4WgO5C7gLYGi7VNX8EOuAxXuOfGzhygCaS5EeF8E
	 fDppf+fl+YsbQ==
Date: Mon, 23 Mar 2026 21:15:12 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <acHxosznN-xbWtjJ@baldur>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99517-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.134.160:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EE72030116B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms.

Your commit message should describe the problem that the patch is trying
to solve, not the story about how the patch came to be.

> Without this, RPMh may not aggregate the correct load for the CX rail,

"may not"?

In what case will it aggregate the client votes cast on the GDSCs
aggregate to anything without the power-domains property?

> potentially leading to voltage
> drops and system instability.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 

I think the commit message should be something like:

"""
Unless CX is declared the power-domain of GCC votes (power and
performance) on the GDSCs provided by GCC will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.
"""

Regards,
Bjorn

> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index 5dc3aede6842..fab603cd8e42 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
>  				 <&ufs_mem_phy 2>,
>  				 <0>;
>  
> +			power-domains = <&rpmhpd RPMHPD_CX>;
> +
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> 
> -- 
> 2.48.1
> 

