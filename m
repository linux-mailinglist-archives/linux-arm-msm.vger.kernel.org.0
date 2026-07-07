Return-Path: <linux-arm-msm+bounces-117152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPE2Be6eTGq9nAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:38:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 706E871808E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cttVkvjt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117152-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117152-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 773123018401
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFC83A8759;
	Tue,  7 Jul 2026 06:38:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2C3A8723;
	Tue,  7 Jul 2026 06:38:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783406315; cv=none; b=vBmxWNCwbB8oXIqjp3hMu6xPyE99Zz8SI+usOqg18rCj8aM68hwHpURsBzuHikN24HSMuny9xQQd1TkLLfbxJdcVeeDnGvYIJDUVNvgzhP2eRnZhJhGw5arooLVY6v0bzxZGtoi9ktLYw28kD5Zd7l/6MB+IplsSdMv1H2v3fr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783406315; c=relaxed/simple;
	bh=+eLTE0jIRos+KiQnLItl8Nd/+iIjESwlIm7Y8amgD8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im3yubsbTm5pKwWRmjYSJnx71xuj/fvgjl+/BL+AUYPfbvzz+ICZsS/hffPeRVU2OcEo625yxapqaOCXdo2nXffKO7GQQBRlNIYfQ9OjM6AJ750Xo3HNTNd5GS3ff7pbsjUNJsdMyTqVSaFb8C4NNr/g+I+kOAS7CZQkSPCO178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cttVkvjt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497F31F000E9;
	Tue,  7 Jul 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783406314;
	bh=geu9NP3g+YF1JBxdLfVCOrN8abIfLh/AFGaevKQYnEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cttVkvjtqtNal0gM0IyWxCESRMqct0PH3xv5GLBqLqPvoY3dXwhrocbRKEsIKlUqp
	 WTPiD8vSg0Vf6aEJbO52YICkU37QkkW2X21ijVV6knWGm0dqMDOIIiJt6/QlgIsG8q
	 f8NpsqIw2h8HXPdtfg0GDeHIOZVK+pNkgZnwYidJRB6mE+5GiZy7gUbcZAhMs+IsrH
	 g6aEcW/xhZOwWNzsr0DJ2zWCa6liZPpwjsYeCeiNIzUKROTjwuAThDmXhHbFZ+fE7Q
	 IfjI+zyx83spO7lRs1K3cIdQcelbFpXzq2fZ8D7SL4lk2eYKf9R3lZdpu1OanF22j7
	 EpHi4xrpgY5Zw==
Date: Tue, 7 Jul 2026 08:38:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, 
	gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com, 
	priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Message-ID: <20260707-armored-azure-terrier-4dc3d3@quoll>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117152-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,quoll:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 706E871808E

On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
> sensor provider by adding the '#thermal-sensor-cells' property.
> 
> This allows the EC temperature sensors to be referenced from thermal
> zones in the device tree.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> index c87ccb5b3086..0d049979e35b 100644
> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
> @@ -26,10 +26,14 @@ properties:
>  
>    wakeup-source: true
>  
> +  "#thermal-sensor-cells":
> +    const: 1
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> +  - "#thermal-sensor-cells"

This looks like ABI break without explanation.

Best regards,
Krzysztof


