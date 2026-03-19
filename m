Return-Path: <linux-arm-msm+bounces-98685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDh8E1bGu2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:48:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 478AB2C8FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F5B530E1788
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7AE3B8BA7;
	Thu, 19 Mar 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3TR3HwY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260743B895A;
	Thu, 19 Mar 2026 09:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773912253; cv=none; b=ueXKb8UjZmV3cYHY8D2PgPFxfQxefRQS9WNrDD9AkjpnPqbdoroHvHdLd6iDAf3iSH0Y5y9uYto00c9jOzU+oYzSAB3Q1yDekN9YIOmNcfv0ccIOF/MeQnY9qPEahoIhwKia8YX7MdjtO5/8776is7+GgHU9PZN6YEQASHWydg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773912253; c=relaxed/simple;
	bh=Bx1rjw2rk50viqe242DZq/D1RPwDt5491jvjAaZVMmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUm8dncssmUKFwSShFeTsi3am5U9ro5DfPa1OpKaXsDlFMA9/JSwdrsr7T83MOdclPmRpCL7LFNdr7bti+8g85w/ISR6EJSKAIrhmYt2QgieGGTBoOkTkdAEUJg3JNSZWyvBmkf958M/HqzzckbSKWX9jiTxXfFw0iTARivpaCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3TR3HwY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41768C2BC87;
	Thu, 19 Mar 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773912252;
	bh=Bx1rjw2rk50viqe242DZq/D1RPwDt5491jvjAaZVMmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3TR3HwYhqfD6/931mTC478evfvn02n3t350rgbhMAUulY2HT0p06aA8Y13nvSmg3
	 Ed/ziDh5xli7is9TdRieF+yLheAaPLGhpti81nUQfrVPul2oRqSsVx8nVfTvFIgzL2
	 Zm3fKojcpoHO41TsOIZ72RqqpjdIi/nPEpd+UHcO8dTREari1VuiVFehqrQ/0KdP7n
	 Uk57RBLIitJjlOaeo5YSVQnh1O5peyEncRH8+aPehd858nwj3nuW7W2YrK0dBEk0+H
	 sgyPTi38spRXYhzfRpscjop1cSgKeZuo8vpDbQgRS16NvGWY3TUZKUIvp3uQjrUOLW
	 1UuIvfqM0rZ4A==
Date: Thu, 19 Mar 2026 10:24:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Document the Eliza
 compatible
Message-ID: <20260319-spiffy-tacky-tuatara-d8ad9d@quoll>
References: <20260318-eliza-bindings-dwc3-v1-1-92bdf233cb87@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318-eliza-bindings-dwc3-v1-1-92bdf233cb87@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98685-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 478AB2C8FDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 10:13:22AM +0200, Abel Vesa wrote:
> Document the compatible for the Qualcomm Synopsys DWC3 glue controller
> found on Eliza SoC.
> 
> It follows the same binding requirements as other recent Qualcomm
> SoCs, so add it to the existing schema conditionals covering the
> required properties.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


