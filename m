Return-Path: <linux-arm-msm+bounces-108690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM67KWeKDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:18:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924758B9CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB49B304F5ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493B23264E3;
	Wed, 20 May 2026 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djxyHMt5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282C332A3D7;
	Wed, 20 May 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272247; cv=none; b=j9TeHGgYpBbXH+EtBozUsx/L22jdGetg4ke5LFLzre4PJaYR2r/vrwFwTQIYSD458SwpJvrSVP3Jax/O3KIDjnny+0/K6jUAjY8BBhoQyzVq1Vvz7zGfXZikaLuNbGX/tV2smFKJ+DS9coSZpnM3wDWXcxgX/R70idvQpB978Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272247; c=relaxed/simple;
	bh=aqbExOtAGFdXsi44I6ZW9ObkM3OPKSb7xeLFB5wsQls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPB53kxoFXLd6WR/BQvGk+Uga9od+NHLSsicwvGv7jUFr0QIqKNgUGZw8E7bH37QPm1P/yzYyQdM693jGpDZzJJirpiIXioHXeQUoTcGO7nWCnEIjQLflVoOt4eT/c3eLyvYush+9G3f8G7Qc2caxF+wnm/aOGp/Irlw1rV4wVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djxyHMt5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757791F00893;
	Wed, 20 May 2026 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779272244;
	bh=mQ6Cp1sdBOxnl8/slSDJi8hlFkG1VQs+A0zGZ75H7XQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=djxyHMt5Zyl+huLO0UhXZHSzQKsCbID+w6RbO3XjziDXYoItwzdpo2jt7YNWUDTrT
	 F0fvPQg64Ohpa3rrFlxTVLS7xOMK67N+VzCpI15gdhnjtcsxmydw630lMos5MkTqyG
	 lAgmg95HFa+roCXrYRJUQDp+GyeB67JckmJS0GX8ApBleA3cX2ON686wWsK5R/qgyk
	 6Gx9+UqzO37WLxUfKG89gZuN1fzgLKIx98vkob1ITk9M3fHz4+ZmfJkaAvSpase8F+
	 kgYnrES8IfThjMEzLgLtjYslMxngXLzWQnx/9CxRH7WYkGKx5C3XYnVEi+a6d6wRT2
	 7UiNrRA4/1voQ==
Date: Wed, 20 May 2026 12:17:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump
 SRAM property
Message-ID: <20260520-hopeful-beautiful-agama-ecbebf@quoll>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
 <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108690-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8924758B9CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:44:39PM +0530, Mukesh Ojha wrote:
> On most Qualcomm SoCs where minidump is supported, a word in always-on
> SRAM is shared between the kernel and boot firmware. Before DDR is
> initialised on the warm reset following a crash, firmware reads this
> word to decide if minidump is enabled and collect a minidump and where
>  to deliver it (USB upload to a host, or save to local storage).
> 
> Add a 'sram' property to the SCM binding to describe a region in
> always-on SRAM where the minidump download destination value could be
> written. Boot firmware reads it before DDR is initialised on a warm
> reset to decide where to store the minidump either to host PC or to
> on device storage.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> index 25f62bacbc91..27422d00b8fc 100644
> --- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> +++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
> @@ -129,6 +129,13 @@ properties:
>            - description: offset of the download mode control register
>      description: TCSR hardware block
>  
> +  sram:
> +    description:
> +      Phandle to a region in always-on SRAM used to store the download
> +      mode value for boot firmware to read before DDR is initialised on
> +      the next warm reset.
> +    maxItems: 1
> +
>  allOf:
>    # Clocks
>    - if:
> @@ -250,3 +257,12 @@ examples:
>              clock-names = "core", "bus", "iface";
>          };
>      };
> +
> +  - |
> +    firmware {
> +        scm {
> +            compatible = "qcom,scm-kaanapali", "qcom,scm";

Incomplete, missing interrupts.

Best regards,
Krzysztof


