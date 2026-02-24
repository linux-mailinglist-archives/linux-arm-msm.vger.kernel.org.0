Return-Path: <linux-arm-msm+bounces-93920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCBGIRJTnWk2OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:28:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D0183063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D553B301BCDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10772EFDA2;
	Tue, 24 Feb 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEY/yORA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC1E4317D;
	Tue, 24 Feb 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918020; cv=none; b=ZVxH+0jtLmRL0Sk/IZObA8oRM6+T2lsl3SqZq5Q8cCvE6kl5q//mJVYtSl17JibPvr6jbVqIH1IW1uV0ljGAXgKi1jJh+uQiTK+eGYS771ToT1xSX+YU67nLxRhskZVSFbt6c/sfzZYlHY1a3NDY0iIT8c9DZkhO3vP0oWYZ4ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918020; c=relaxed/simple;
	bh=W2QnXydZ8TXgPGDCJFF1RA/206phbk0pHFu+twrsOZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGp8azDlg3FuxUu4Ib2rWHqfrL9Elh1mtGqbYA2oqWpbDkk2NpEBHIlvdtJrlXqARkvECep08rTFmcZ8RiP+gCI357HzmWhZ2E+TYQKJrcXY0OIqny7aYPql1tQsxECEx+UMNS9uqwNyACzzsaSJ5J2Xv8CAa+3sfdYX8XG10rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEY/yORA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D441DC116D0;
	Tue, 24 Feb 2026 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771918020;
	bh=W2QnXydZ8TXgPGDCJFF1RA/206phbk0pHFu+twrsOZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OEY/yORAt+16j92j8HRQQ4xN4ZHhpzdQBh9whYVLsi8X3MJVS+uv7uSl0m7+nBgvK
	 c3agvlrteuL8VFd4jk1picJJ/gOhyRhN2/w1ExHYdQxoVY+aVYWJwKKjxYx13lS/X2
	 l7KTKQxJQD3DqoPtfo7vXdwn90QP/SzCdHjFqsHb4py5EZxw/pxF/Eghx48YH2XX01
	 E3q4FlVGvCxqu7/OdZ0Dwv4ZMwoSQXORP3ughSQlj/fQzpofg5oJmA5m9AzXretJ4v
	 zzOZ4nddpPxke0DYCG6bR16PGyHbDy4cfUQS8SEN2mJANWwDvzrs1fgmZNHBfyyKXC
	 FDVtWp/PQpxDg==
Date: Tue, 24 Feb 2026 08:26:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
Message-ID: <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93920-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: DE3D0183063
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:26:20PM +0200, Yedaya Katsman wrote:
> Document Samsung S6E8FCO 6.09" 720x1560 panel
> found in the Xiaomi Mi A3 smartphone.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/subm=
itting-patches.rst#L597

>=20
> Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../bindings/display/panel/samsung,s6e8fco.yaml    | 64 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 69 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8=
fco.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.=
yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..8c042ce5f65bf317df48e109d=
88ebdc87ef5d5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E8FCO AMOLED Panel
> +
> +maintainers:
> +  - Yedaya Katsman <yedaya.ka@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e8fco
> +
> +  reg:
> +    maxItems: 1
> +
> +  vddio-supply: true
> +  ldo-supply: true

LDO is the name of the type of regulator. Why is it called as name of
the supply?

Isn't this binding exactly the same as s6e3ha8, s6e8aa5x01, sofef00 or
any others?

> +  iovcc-supply: true


Best regards,
Krzysztof


