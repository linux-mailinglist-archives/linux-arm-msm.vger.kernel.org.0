Return-Path: <linux-arm-msm+bounces-89957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNRQHwWKcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:10:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D0553477
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5519F527502
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D528344CAD0;
	Wed, 21 Jan 2026 08:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKRNWLLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E7477E23;
	Wed, 21 Jan 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982829; cv=none; b=WGDeWeNwnVjPyhnoWDFVfmn1x3rkMg4I9Kbd6qWIadt15+2m8K2GccVKjZwtDo6Vade/ajLmOvYEqPg8wTu2RFctRREENzHjpFcRI923zO/mew59Y8fxszN2S3ShH6eL9+o3GclegrsEk3tuodn6dFCYj7qF+e+xn0hAuy4VGA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982829; c=relaxed/simple;
	bh=6CNJstc+EJX/tnhim9OhFJTIhOjwm2af/Beb+EwxGo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LF91udou7GWy3tPlAOX4j6w1aWEPO7CcuZvQ4XmNb8PA8x2LkFe/y/cc9L8+yh587948Ij/zL0kBZbOLx5IorOqsA9lv2M8JgFRztKHjc3vsukAjb4JeVdzNQOMYcwuxWo0hxZ1Uq0LgAxM61t1vWLqTofh3aCn8Fn2VAXfYVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKRNWLLn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFF0C116D0;
	Wed, 21 Jan 2026 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768982828;
	bh=6CNJstc+EJX/tnhim9OhFJTIhOjwm2af/Beb+EwxGo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKRNWLLnW/17+ZQcMRYuOc1w84EK/nquNejND5/cCBBsNGmmyu46g1f9/s+0VUiNd
	 VpilHqhO9nRSgf5kKA6+r52n0MkH4sx7EITCLtbRYrN3fbThK6eYc39h5U0VRza5hp
	 3GDQ2d6Spg8ZDevrrHzK7J612DAn817hhl8PfO/LTZQUsWG4IWSp9x6+Sq+Emmmqb+
	 YrXILqQ3wZTOALzIQkXU4qxdMWcG9cFGLWaWXEQTFGJogAVxu8a9HjZaHCAIyfVeXt
	 XCIZ7DvWoXIAp+3eqGV8vZOpuxIAaSrlXPVZeBcrWS+TP3QRoHsJOwlpl/TyW0RLa+
	 4sRQCanzwFE0Q==
Date: Wed, 21 Jan 2026 09:07:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ECS (Elitegroup
 Computer Systems)
Message-ID: <20260121-uptight-ocelot-of-chivalry-fd9bea@quoll>
References: <20260120234029.419825-2-val@packett.cool>
 <20260120234029.419825-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120234029.419825-3-val@packett.cool>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-89957-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,packett.cool:email]
X-Rspamd-Queue-Id: 25D0553477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 08:30:05PM -0300, Val Packett wrote:
> ECS is a Taiwanese manufacturer of mainboards and mini-PCs.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


