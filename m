Return-Path: <linux-arm-msm+bounces-90241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JnvHoRncmmrjwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:08:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A356C004
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E03EB314A607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE97E3DA2D6;
	Thu, 22 Jan 2026 17:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdKExb2s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A601395731;
	Thu, 22 Jan 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769101613; cv=none; b=RqDtlEhamefCAgJ191Xra1ZbUmeSi8TsulFWWBQwGAOn5DV58KVluHsFXUpfTpqGDywD3P8Kfj9u/rIGdc9TAaH1GtsJL8YslwbRFboP0CGoi6r68ya57ejKNgfHC1031CjRMx2jkGgUFzk3PAi6haSdjGFXDn9djiUlTw/+5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769101613; c=relaxed/simple;
	bh=riDE5Q5BDE4FI/xKxhVniW2Qhd4SP6QksPMOACfu2/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIdc2sIjuXVp3279iw5s3f7IPJ1t3RECCiqLF+IRq8R33C6FtxrP3sqIrvSLo6D1y49SGs0XK3BdCKbpvKh/Nx8s9xx5PvigSN/Q2bfyBhqIbOTi/2KO28JuNyV3FTY1zeUkmxaEMTsd+DZhTG/PSEZG5skDmZPnw2nQu14LOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdKExb2s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67534C116C6;
	Thu, 22 Jan 2026 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769101612;
	bh=riDE5Q5BDE4FI/xKxhVniW2Qhd4SP6QksPMOACfu2/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdKExb2sEIKcJjvZGqffcSS2/X1AbgL8H287wRZVxqjkqCCbFN1zOCtIIEQbe5wIb
	 4k7gBZsR10FwWyAWuMxTfoKU+/bTstVr8Lz+O6adTPPZcd0J3wZ0grO7m0ViRY4avz
	 UvBap2V2rT1pkXTDA6WCvjM/Fr4sZ7AVhHM+hj1wlZtpTNh4zWhGkySOAKGJbpc13T
	 SFTgMAAqdot1fp++cyL8dV9y/2yN7As4npdSyjcwh1b81uTGyUlCVFuNh75Df/kuIM
	 DxohTvbNOtq4sTCMi6H51wwLtpbw4iqICx2x89XzacTd1mUd7HKWrKvR7aZx/FPVCB
	 ZZFDPfqpcTN8w==
Date: Thu, 22 Jan 2026 11:06:51 -0600
From: Rob Herring <robh@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	Matthias Kaehlcke <mka@chromium.org>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Stephen Boyd <swboyd@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Pin-yen Lin <treapking@chromium.org>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
Message-ID: <20260122170651.GA2632938-robh@kernel.org>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
 <20260122092852.887624-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122092852.887624-2-swati.agarwal@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90241-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: D5A356C004
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:58:49PM +0530, Swati Agarwal wrote:
> Add the binding for the USB3.2 Genesys Logic GL3590 hub.
> GL3590 hub requires 1.2V and 3.3V supplies for operation.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  .../bindings/usb/genesys,gl850g.yaml          | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index 9a94b2a74a1e..6ab13785e832 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -15,6 +15,7 @@ properties:
>        - usb5e3,608
>        - usb5e3,610
>        - usb5e3,620
> +      - usb5e3,625
>        - usb5e3,626
>  
>    reg: true
> @@ -26,6 +27,10 @@ properties:
>      description:
>        The regulator that provides 3.3V or 5.0V core power to the hub.
>  
> +  vdd12-supply:
> +    description:
> +      The regulator that provides 1.2V power to the hub.
> +
>    peer-hub: true
>  
>    ports:
> @@ -56,6 +61,7 @@ allOf:
>        properties:
>          peer-hub: false
>          vdd-supply: false
> +        vdd12-supply: false
>  
>    - if:
>        properties:
> @@ -68,6 +74,19 @@ allOf:
>        properties:
>          peer-hub: true
>          vdd-supply: true
> +        vdd12-supply: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,625
> +    then:
> +      properties:
> +        peer-hub: true
> +        vdd-supply: true
> +        vdd12-supply: true

Comment on v4 still applies. All the 'true' lines are pointless.

Rob

