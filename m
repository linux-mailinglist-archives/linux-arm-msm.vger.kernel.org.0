Return-Path: <linux-arm-msm+bounces-89935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHv+HTw5cGmgXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:26:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB44FBC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 03:26:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 008D4BC0316
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 02:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB296339B3D;
	Wed, 21 Jan 2026 02:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0IkePLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAEF2DC321;
	Wed, 21 Jan 2026 02:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962290; cv=none; b=XBv99Uov1UIEkplnC36yHKz9JhPT4i4NhhNvweFOZlvOE1fksI8V3Ccc23D4dgtSQknRRdBX9mEw0k1cHl7tApY0gT2enVPIQKQQGnZsKwikKyVROYiGz3se3wL3TwW9me8w1IoLAz12nZYM/dMCPvG6Ubzv7lSBnGTKBMhiHOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962290; c=relaxed/simple;
	bh=JRDYILHwOsjCdsZ2mQzG5u1ZDZRnQxOez+lzXqMzsDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXWi75nBwuMoXmNXFjS9aw8ZMmNg8hoL1Vfixl8Qb9s7TlBVSrWht5gntXxvraDuoQPD2Q2rkHBjp4g6q96AIhQz8hNZ55jROGdACntuBxPmlfWZv/WCEfSo2cn3sVLErPJEVMJKrJpuEabpqRjjLxTCE7CVVLIQC45H/G0VsLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e0IkePLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01519C16AAE;
	Wed, 21 Jan 2026 02:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962290;
	bh=JRDYILHwOsjCdsZ2mQzG5u1ZDZRnQxOez+lzXqMzsDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0IkePLlGxCppGZ3uOZN0hjYWm7Ohozz2QBO69cd6Ur2KOvb1zMJAF4GBeULbbrKm
	 2J0nS4u74Ar6f/N/9fGG8ozuM8jL0fwq65xiukxM+ov/A/4zVANY7NnRPuxQS+WQQl
	 UkEqOu8wdgnln4hzRDhIZE5gOl0KOsf3TTDJhNZaxP/SiA3p/r7SqUtQ90QVptuHLg
	 RXhaLKzKLRpYj0jmat8dg3QpCQhchlTmTV3fziX/sb0tBFaOZXofJj9fjl3GxtUBVq
	 mzjVn1371bfvVC49RLRRn97x9L2rVSaJaJhAA0lxBjI5sGn5Fve5Dra6HObsmn3AEK
	 PNlWQBEItUxWA==
Date: Tue, 20 Jan 2026 20:24:49 -0600
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
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
Message-ID: <20260121022449.GA1804139-robh@kernel.org>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
 <20260120103312.2174727-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120103312.2174727-2-swati.agarwal@oss.qualcomm.com>
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-89935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: E3CB44FBC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 04:03:09PM +0530, Swati Agarwal wrote:
> Add the binding for the USB3.2 Genesys Logic GL3590 hub.
> GL3590 hub requires 1.2V and 3.3V supplies for operation.
> 
> Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/genesys,gl850g.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index 9a94b2a74a1e..a4a359000ca1 100644
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
> @@ -69,6 +74,18 @@ allOf:
>          peer-hub: true
>          vdd-supply: true
>  
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

true is the default, so this does nothing. It's all the existing 
compatibles that should disallow vdd12-supply.

Rob

