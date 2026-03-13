Return-Path: <linux-arm-msm+bounces-97355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LzGFTPHs2kqawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:13:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C480E27F653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD8B0300ECA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12F237187A;
	Fri, 13 Mar 2026 08:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fk8FfzDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3E31E83D;
	Fri, 13 Mar 2026 08:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389616; cv=none; b=Qxc5U3nEp7NgmoMqracj4KbLfw4olHULDt8AHhNqrSAp/uR/mAhUjQzBSD1GQtqLgtKqtVaZXesg7Z/Nf7LnN11u+G5TbLKsDFD6xQeLiLn9OPapL2glpIkO31uyrM6MKDYU/vE3qZj8zPuxnzMOHzV9OKgAPo+a3iEN7FB0RDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389616; c=relaxed/simple;
	bh=UrYSt37MGAER+9Ep72XoXGzY0mFLVlfAzzNxX+EpPbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFXTcOFwErDKSkYSYY+KiV/G7zB3eD11IH8gixIMjIMNd8gnkNEXOaGSWemN7Ya5nS+pjK/kpe0YfITY6JOl2aHMAtcwdqdy6/5Kb3o0vUVkeFkcNVkh2BOeW98GC8/4bOqFJDkfZIeMY25SkFoxl7ETMij6sE1iPriAotlZVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fk8FfzDh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171B9C19421;
	Fri, 13 Mar 2026 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773389615;
	bh=UrYSt37MGAER+9Ep72XoXGzY0mFLVlfAzzNxX+EpPbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fk8FfzDhYUKL6M5W5CRY1o66y9enM5SZq67F+91bPq0gZfEca7/vXJZucNlrikRNi
	 UHrHTIwUxzgEMrT+5+A27HPViBxdLDXkPEsqiGawYrs3kdFxvbCO8H1pn/zaD9KvWn
	 h7a0Psx9wtKSvbBbcCI211DuKl/5Cnf+Y1wG4Df0k6MUaWZarrm9n5zuasedO3HAKJ
	 4BBHsgaN0pGX1efbUsMYzLL6Nfjn0AHbyDNhWLZqPbnzw62U9J3+zWOwe092TS6iuT
	 +ANMb7PKDv+bexAmhiamaPzAJEfg0ksoo5jzasp8U4g5fX1shGcTQ/AOCY8O202INJ
	 de4aMnvufw58Q==
Date: Fri, 13 Mar 2026 09:13:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Samsung
 S6E8FCO-M1906F9
Message-ID: <20260313-lurking-acoustic-angelfish-c1343d@quoll>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
 <20260312-panel-patches-v3-1-6ed8c006d0be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312-panel-patches-v3-1-6ed8c006d0be@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97355-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: C480E27F653
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:55:08PM +0200, Yedaya Katsman wrote:
> Document Samsung S6E8FCO DTS binding used with the M1906F9 6.09" 720x1560
> panel found in the Xiaomi Mi A3 smartphone.
>=20
> Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../display/panel/samsung,s6e8fco-m1906f9.yaml     | 63 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8=
fco-m1906f9.yaml b/Documentation/devicetree/bindings/display/panel/samsung,=
s6e8fco-m1906f9.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..927d170793dcd49c19ebe3532=
68980710ad4b5b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco-m19=
06f9.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco-m1906f9=
=2Eyaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E8FCO DSI for the Samsung M1906F9 AMOLED Panel
> +
> +maintainers:
> +  - Yedaya Katsman <yedaya.ka@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e8fco-m1906f9
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddi-supply:
> +    description: VDDI regulator
> +  vci-supply:
> +    description: VCI regulator

I pointed out last time to other schemas and after changes you should
notice that it is the same as other bindings. Or almost the same. See:
samsung,s6e88a0-ams452ef01
samsung,s6e88a0-ams427ap24
samsung,s6e8aa5x01-ams561ra01

so should be added there - to the last one - instead of having one more
file. On mentioned schematics I did not see the panel, thus the pin
supply does not need to be named VDDI, just because output of the PMIC
is called like that.

Best regards,
Krzysztof


