Return-Path: <linux-arm-msm+bounces-104813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOrLOFuz72kYEAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:04:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4D478FFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C552030459C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EC93EDAA9;
	Mon, 27 Apr 2026 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qi0vwyy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1015E285CA2;
	Mon, 27 Apr 2026 19:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316564; cv=none; b=Fqu/8QiyZQbkqFsM798rpYSc3LdKhi6nLNmi4ypmiCdlw0Y7lYmE05mURMk2Af2eO9rzcmNPpbLoldwNI3Swfq8ySBKms8SZ+YSaZRzdNykEWmRcz0j6iwkWP3Efr3ftoqdNR0OIhp6vYu6eR3ha0T7TL8DXuDovs3VhxqzQ9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316564; c=relaxed/simple;
	bh=jTWwfj0zZG7bsq6Opv6LU53fDAa+a75QEi6tnfm6hmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9SEijycq/nAXBeT6syID2kl4j2gLSsUureTs9yhtMZFGj6encxLKHd3W+a0wEKpPpZNrPoCF54erdv5+/d6gaKH1gOm/UsheZdoq6N4+X5BXumiXhyzvzeMSDJfbT+Ow6Q6Va4ucvzFJknmfwgRcySX7N0ij2TEkWl//3ZtyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qi0vwyy6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BA9C19425;
	Mon, 27 Apr 2026 19:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777316563;
	bh=jTWwfj0zZG7bsq6Opv6LU53fDAa+a75QEi6tnfm6hmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qi0vwyy6lKqMm8ChV2AS977CuHDGOgXUvJfAPLdcG8y1QT2M1YCJighptIannJWwv
	 FdtNpxGVmzFYgMaHvkPxEktcfVxj06I117dTznfVsE+OZiOVBCuNN4G6u1DHdinXmc
	 jEcIoM3v04iK9xagvoNGG5t4kYB5tXEr8i6jrKrkDiPJe8Lkt4zvHRevDEgl4KoZZE
	 GVwN5W20w5vsmDGXKW11nQHG9zrtKfg5HiL7qZ4i3gnj5FtvGzbpzN86j17dBDroWS
	 29gEIm4HVxVbx7OCHPqDP/YfGN9msTKjeiByeqWr6Au2omR2369F9PmzUXEBTBxC4H
	 A9EsYBPLn/ejw==
Date: Mon, 27 Apr 2026 14:02:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Yifei Zhan <yifei@zhan.science>
Subject: Re: [PATCH v3 0/5] Support for the Pixel 3a XL with the Tianma panel
Message-ID: <ae-yXomgNWLd8IcE@baldur>
References: <20260310002606.16413-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310002606.16413-1-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 59D4D478FFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104813-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,ravnborg.org,vger.kernel.org,lists.freedesktop.org,zhan.science];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Mar 09, 2026 at 08:26:01PM -0400, Richard Acayan wrote:
> This expands Pixel 3a support to the Pixel 3a XL, starting with one of
> the panel variants. The Pixel 3a XL has two variants with panels from
> Samsung or from Tianma/Novatek.
> 
> This series depends on the IMX355 front camera devicetree patches
> (https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).

Please resubmit the DeviceTree patches once this dependency has been
resolved.

Regards,
Bjorn

> 
> Changes since v2 (https://lore.kernel.org/r/20260217000854.131242-1-mailingradian@gmail.com):
> - add support for regulator (Dmitry's review retained) (3/5)
> - use common set page function (Dmitry's review retained) (3/5)
> - squash new labels into common dtsi patch (review tags dropped) (4/5)
> - specify framebuffer in terms of memory region (4/5)
> - only specify height in XL/non-XL specific devicetrees (4/5, 5/5)
> - remove status in display devices (4/5, 5/5)
> - preserve same touchscreen physical width in sargo (4/5)
> - move entry in Makefile to correct place (5/5)
> - omit copyright year in new file (4/5)
> - correct top-of-file comment about which panel is supported (5/5)
> - explain license identifier change from GPL-2.0 to GPL-2.0-only (4/5)
> - add review tags (1/5, 3/5, 5/5)
> 
> Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
> - use multi functions in disable callback (3/6)
> - add and reformat comments about XL differences (5/6)
> - mention the sdc panel (6/6)
> - explain google,bonito compatible (1/6)
> - remove TODO item in code (3/6)
> - add review and testing tags (2/6, 3/6, 5/6)
> 
> Richard Acayan (5):
>   dt-bindings: arm: qcom: document google,bonito-tianma board
>   dt-bindings: panel-simple-dsi: add nt37700f compatible
>   drm/panel: Add Novatek/Tianma NT37700F panel
>   arm64: dts: qcom: sdm670-google: add common device tree include
>   arm64: dts: qcom: add support for pixel 3a xl with the tianma panel
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   6 +
>  .../display/panel/panel-simple-dsi.yaml       |   2 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sdm670-google-bonito-tianma.dts  |  32 +
>  ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
>  .../boot/dts/qcom/sdm670-google-sargo.dts     | 709 +-----------------
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-novatek-nt37700f.c    | 299 ++++++++
>  9 files changed, 370 insertions(+), 711 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
>  copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
>  create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c
> 
> -- 
> 2.53.0
> 

