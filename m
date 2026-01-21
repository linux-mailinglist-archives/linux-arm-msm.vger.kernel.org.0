Return-Path: <linux-arm-msm+bounces-89961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGx0KkiMcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:20:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE953689
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1F7787C7266
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E308F477E2C;
	Wed, 21 Jan 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o5pRUrVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816B34279F4;
	Wed, 21 Jan 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768983285; cv=none; b=G8DO0ggloHJJFqEMbNiBLwzI7XqWynp3p1jmzTdujct6bALtNSnPD66Mpj/VBio209M/u5IqPf9xT9LcIqx5VHdbBd1YfEYTjLhMbfjlr/Oav/0+YdMEoOEDOtTuIorP05KmXqZvjoCBwYleF8cONBwMXyn/HJjGQx9iyRxySGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768983285; c=relaxed/simple;
	bh=zAedwpMEfavJKbKvXrY91g08dbDmU2qrvKWCcgKDiWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG0ZSc4nu9s1OwvXwkxH4I7HwmVrdTv5Q0yjf3jpowJqKJY5mdWAhgpAHuv2giPvQ08Z9l6EfUrA+MkyyoeUefldJWMW4Zf0FsRUtn/0GaAZ24iL5KySOSu/j1wXCW8zh4QfnIlaljNTcihi+MbKa7TrsSUwI6eKKuX3iAmFuLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o5pRUrVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7094BC116D0;
	Wed, 21 Jan 2026 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768983284;
	bh=zAedwpMEfavJKbKvXrY91g08dbDmU2qrvKWCcgKDiWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5pRUrVCXgCLhDjtsGo/RV8Lc2AIqLtjTH3vT51oo6Zu0eOCKqDpcWSKOuKbFELha
	 qEtjSbzPktzAIKSdXvcwvF4wiVW4LEQi7ZkGt05CFyfGmj7cmC9vEn7JJ0nwSnELrt
	 /lljYXlXFRTHCKNYLKROye6cZtzdA0s0mvx88q7makzZ8PEVz+BW0d5utvJs6sU2nC
	 6EgRb9eChFHYDRPcLyvWo1AjijubzU9KdBisLOihEgYoCawlwmnWTzOCz6GvR+EiGg
	 LJ8bCNz09EEDlTXbF3yn3Ch6Bwjs0wFmDK7CteTgkiQeN9B4qR39QRMD6YEpijcs9b
	 Wc192avI+DT8w==
Date: Wed, 21 Jan 2026 09:14:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	robh@kernel.org, david@ixit.cz
Subject: Re: [PATCH 1/7] dt-bindings: arm: qcom: add Xiaomi SDM636/SDM660
 devices
Message-ID: <20260121-sincere-manipulative-whale-6efde6@quoll>
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-2-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120180052.1031231-2-morf3089@gmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89961-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0ECE953689
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 07:00:46PM +0100, Gianluca Boiano wrote:
> Add device tree bindings for:
> - Xiaomi Redmi Note 6 Pro (tulip) - SDM636
> - Xiaomi Redmi Note 5 Pro (whyred) - SDM636
> - Xiaomi Mi A2 (jasmine) - SDM660
> - Xiaomi Mi 8 Lite (platina) - SDM660
> 
> These are Android-based smartphones that can boot mainline Linux
> with simple-framebuffer and USB support.
> 
> Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


