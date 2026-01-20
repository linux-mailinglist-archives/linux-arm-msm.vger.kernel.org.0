Return-Path: <linux-arm-msm+bounces-89806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBqtNfqMcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:23:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A2953724
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4F595A65D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 10:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEF740F8EA;
	Tue, 20 Jan 2026 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuKhgVOs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67240757D;
	Tue, 20 Jan 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905495; cv=none; b=QS5joagxE+OId4WOcOWRi3rHU07amjWtudoKrRqTmP7HWXt4FPkD6+7EbLUSRavlHUlTX0qZfjJDvI8ZsoHdLgRfZRXDQCJjbLpYdW1FQNziACTUmDZZz3IZJ2QIzHLDeS590GWcJm552dqzVCMDFfuxT8cHOgzG2BFh5PZQzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905495; c=relaxed/simple;
	bh=7mREF6bxhEwLB9AmrYmLxpUqve2VcjDdgI9iBmgIEXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+F9Xk4TuoW15ptt3xD+Eqzt49qy1Nb258+UmdHghWKRfopfz/dXKk85fm8WMrPcSDlBRC1Vq7CH0w75sZF1GAs8Yt1W5cZsh7OZZPXoh6Zhf+D2tdOYmAcmAoozW9dsoa0PCPZByiTmeaM1IJl/YeM/tvlH9tyKKD6U+eEhx0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuKhgVOs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5222DC16AAE;
	Tue, 20 Jan 2026 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768905494;
	bh=7mREF6bxhEwLB9AmrYmLxpUqve2VcjDdgI9iBmgIEXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuKhgVOsaYR6n1glWlwG8k+hl5X5tyeHoZNIpXpg0DH8BVrJO8iKRIGzP7H680KaI
	 RKJsoxm2jkAk2/jFUxg8/Sj9LbKrB81lEY9AJaEYpJgmETh5Fk6NtNSAAcK1lO6RJZ
	 7jvJA0lEwWExyXJEqKx3GuBXho1H2khOJAjli3L3tZb1LI9wl2moUDnaoGjygWsxuh
	 qn1M35VXgh5qolvSoXB0Q+HB3+ntMGMgnVDfabuaESlSmczUozNAKnzCth5MBqKDRK
	 gyLSLgA26OQFSq80hf/988j+7w48YYaOajKp3bNVAISrbWR09VQoUE8mWMqc2ylStD
	 5Ke5mZW7jPvpA==
Date: Tue, 20 Jan 2026 11:38:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petr Hodina <petr.hodina@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] doc: add Device Tree binding for AMS TCS3400 light
 sensor
Message-ID: <20260120-watchful-orchid-fulmar-c1f8c7@quoll>
References: <20260119-tsc3400-v1-0-82a65c5417aa@protonmail.com>
 <20260119-tsc3400-v1-1-82a65c5417aa@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-tsc3400-v1-1-82a65c5417aa@protonmail.com>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	TAGGED_FROM(0.00)[bounces-89806-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 79A2953724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 06:19:06PM +0100, Petr Hodina wrote:
> Adds a new YAML binding describing the AMS TCS3400 I2C light sensor,
> including compatible string, registers, interrupts, power supply, and an
> example node.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> ---

Also:

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof


