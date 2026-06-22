Return-Path: <linux-arm-msm+bounces-113975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K7yGG8MWOWqSmgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2D16AEEFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:04:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U+7eGbWw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3AAA3012CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A563793A5;
	Mon, 22 Jun 2026 11:04:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B82E1746;
	Mon, 22 Jun 2026 11:04:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126273; cv=none; b=W4mBZGxTmQdNEcl80+jdMEjwGFLoJIOWQvMDaTRR7MmPDjnx2cPihwe2fWsvDoieEQ8ZnONphMCNEQ12l8b0tAgimo5OCVc8nJ0RWlQI3J3MCFjdY/qLcGI/aDFySm7EBjuojtufLkc3OFglBGuTASoZrV7gFy38Rtr/Qi48BG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126273; c=relaxed/simple;
	bh=ul3KPSH68nxfJgvRe0DktHRdrkKajBUPjqLwYjvXXM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkNyU3hgUQrdKWjmJ2+yMmAgGXn2Ohz01L2Q66yZe5crb0idBeyI69BNUGRnWy5x3yjSocHqTQwlt3npxTPAd1kUjah+IQsQ7o8GbN6TVPkzmXxkmO7itgZ6bND0PCIhR5uJdN5PV+VNDQg9KDijjW5v5dRtVyhFOW/JUlm+7V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+7eGbWw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8E31F000E9;
	Mon, 22 Jun 2026 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126271;
	bh=YSs58y/GFP40wa2ZLv0++iuUUCeFyDMAOw4QyEvLl/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+7eGbWwC1BuJt9yXHJSoGrPm9GrXLcfa0L2cSuJ5hyI5ocfhj7HDDu665jv+BJH7
	 SxWF8HHYc6JlZ1o4UEDCfcyIDKlBHg/GWGKg6O8ncugO0xsbM4m1Fg6FOQDx4sjzXv
	 VHBr22BqqsqlLbdmdA9MQEHqEkQR+rhoFtEsH4feXBHwCuRveUma9HmZQtFmBeCDvZ
	 keMJlsSMkN31IDeWd+MGAa+rtEgKOIWBGF/vuzbRQJDxRta5QPJcPG/lMDIZ4RNQz9
	 UvYg6kGuqfzghtAI5HjxCLCDs5kAvIqwG7git16HOmFNhXDBrB5nb6cj6XUr1cP4pt
	 yNTcMcRW/oOVg==
Date: Mon, 22 Jun 2026 13:04:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ayushi.makhija@oss.qualcomm.com, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: add Ilitek ILI7807S
 panel controller
Message-ID: <20260622-grateful-hypnotic-grasshopper-9de3f4@quoll>
References: <20260618-ili7807s-v2-0-b3f0c109b102@oss.qualcomm.com>
 <20260618-ili7807s-v2-1-b3f0c109b102@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-ili7807s-v2-1-b3f0c109b102@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113975-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:arpit.saini@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ayushi.makhija@oss.qualcomm.com,m:rajeevny@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,qti.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA2D16AEEFA

On Thu, Jun 18, 2026 at 03:54:02PM +0530, Arpit Saini wrote:
> ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
> The DLC DLC0697 1080x1920 LCD panel is based on this controller.
> 
> The panel requires a reset GPIO, I/O voltage supply (vddi), positive
> LCD bias supply (avdd) and negative LCD bias supply (avee). The panel
> operates in video burst mode with four data lanes using RGB888 pixel
> format.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  .../bindings/display/panel/ilitek,ili7807s.yaml    | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


