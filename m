Return-Path: <linux-arm-msm+bounces-106559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH+3K1Qj/Wn6YAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 01:42:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B86ED4F0311
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 01:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BBF3A300F7B2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 23:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57CC372B51;
	Thu,  7 May 2026 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVSXDHrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C433123D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778197324; cv=none; b=imswCLO21ZkBRi00P09Fvp68kVBZO5tGVvB6WxBzpfpLSgPOeGTytWQfqO1zvjuhHAICDgrPi8krUoYebvPev1rJaPrUNOSZ0IcZE+JsRQ7MPwqkYZ0+pX2aiEwLHY62qA9L+hI/RBZ0IYAqyzUkkgNjvHkQVEZ8CLQISpOkIAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778197324; c=relaxed/simple;
	bh=p7Rx6qNuAwgaIK8zmFad1PXiQo0SfDFYMCJz06kHD8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5plIRglc1u/Jjd6EpvqAOfLgMz91XO8CwnUwcNkuHb7fyqXib0iuE8ThyGoC8ZWICzmotlNoFpcP+ADLyh3Dpw/XrNwGNXcWEyLGuUokulxgm8Rcn8+vcp6k5lEnhqRN/lWRz8tu72fcoQgJlgVGksC0hfcV4TLiyNDqlgytn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVSXDHrp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13CFC2BD01
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778197324;
	bh=p7Rx6qNuAwgaIK8zmFad1PXiQo0SfDFYMCJz06kHD8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVSXDHrpJKD3xum7FnwZCCrA8iQEYbbX5GpPhqtER+Kb6ORUOY3o6PbYdaH27ErrQ
	 kOT8v1aEKkqxk3pXWvcFlkpl9WqFtXYrCXYyzwY9QlBKenIv8N4ArqaqEbDr34fGlc
	 v6s6uH/QYfdQQkmL6JKXVMxYqW1O2LOnJAsCod7JH6RB4mWoJSrBAIcwEzGXRaVPa6
	 9V2lo8OCSID8OvbS0r0xvh7WvOtEv0WIpowa09YfkGNLYVEfEfbosRNN2LybFa7EfU
	 UsV+GtnDWNlb2e/HbImt4blT9TVNkcaoufYLk3uCSmoQJLcp/3Fwxc2xjxD0jGNocb
	 Tq1eNGpBaQ4ZA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so760278a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 16:42:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zZnDe5vig+8PxNEqXQUsNFNP5UjTBfVTRcdIUyuWGq4iZVKRURUqnY4aBl6bis496BJsx+pMWvdquyWY9@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGoAxGVwC9A4SmIFE7wY/DFTGVA21Hbz3WsL3GZ2JyxGJYeGZ
	8QdirJB29G4NuDG+1EvQP0+WL8EcVA3ZejGRJ12/tK7t0wJtjgWOa3S/+IRnr8aSNHoQcc3Oddu
	ndprVJogitUPemkNSJ6flWRzxwaGt4A==
X-Received: by 2002:aa7:da02:0:b0:66e:e024:1a08 with SMTP id
 4fb4d7f45d1cf-67d646b082bmr4114635a12.24.1778197322778; Thu, 07 May 2026
 16:42:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com> <20260501155421.3329862-9-elder@riscstar.com>
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:41:49 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
X-Gm-Features: AVHnY4JOM9jN3mcHfPknCHd75ZrjDOMLe5cKzgxlMhp-0Ek9NIaM4mPgQRK3hWI
Message-ID: <CAL_Jsq+GY5O-ygTHDOA8pVBDi_aKcmcJ0yt-3Rv4a4=Ygk66uQ@mail.gmail.com>
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, 
	arnd@arndb.de, gregkh@linuxfoundation.org, 
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, 
	alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com, 
	chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com, 
	john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com, 
	matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com, 
	rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn, 
	weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B86ED4F0311
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106559-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,devicetree.org:url,riscstar.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 1, 2026 at 10:55=E2=80=AFAM Alex Elder <elder@riscstar.com> wro=
te:
>
> From: Daniel Thompson <daniel@riscstar.com>
>
> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> bridges.
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-=
dwmac.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.y=
aml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> new file mode 100644
> index 0000000000000..d95d22a3761da
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/toshiba,tc956x-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba TC956x Ethernet-AVB/TSN Controller
> +
> +maintainers:
> +  - Alex Elder <elder@riscstar.com>
> +  - Daniel Thompson <daniel@riscstar.com>
> +
> +description: |
> +  This node provides properties for configuring the Ethernet PCI functio=
ns
> +  that are attached to the internal downstream port of the TC956x's PCIe
> +  switch.
> +
> +  TC956x are a family of Ethernet-AVB/TSN bridge chips that combine a PC=
Ie
> +  switch together with a number of Ethernet controllers. These bindings
> +  cover only the Ethernet functions of these devices.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus-common.yaml#
> +  - $ref: /schemas/pci/pci-device.yaml#
> +
> +unevaluatedProperties: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1179,0220 # Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  # We can't allOf reference Ethernet-controller.yaml because we end up =
with
> +  # contradictory $nodename rules (`ethernet@` versus `pci@`). Happily o=
nly a
> +  # small number of the properties are useful on TC956x so we can just r=
eference
> +  # what we need.

That would be due to the error sashiko pointed out. 'pci' is for PCI
bridges (host or PCI-PCI).

Rob

