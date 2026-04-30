Return-Path: <linux-arm-msm+bounces-105432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPGWO0ns82kV8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:56:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D34A9067
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 980C0300213F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959B63D6466;
	Thu, 30 Apr 2026 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="McXKF5LM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E2F3D9DAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593297; cv=none; b=XKK5gLQPb1MLToq4sbtZMvcuQfE6vrZVN3KXzS/FrFoiVEFGqv5SavgHR0gU8Nt5gMgOyat0nZvSPiQ3N2vwvehZ/79tOJRa1LEscZjRghf4a1eAEUR8+izoI1x6HLuD5tlzG5H3QMNv25g/QsFqnQ7cT4Q2K46b43eeeC5lBak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593297; c=relaxed/simple;
	bh=sQxuhOfm4oyjjyHRHwYJHnDekKF9G661/WNU4U8f4VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=thV6t0c9wCEMt8C9Xt+3JA2wAhvsFjhGjVLgdfBDrgqbm0zGVzduC0MPSX2qfoB+MoyvtOwbPFqi/Lu8GSYhPkCcU/rdc6L+1XSDN08OtZxhBBCQ0Fn1oR2tTq7QhNboXA/79+0mUhhR7sq4oeRVz7Vlpc/S67ZnVOExpwu041M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=McXKF5LM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba36357195bso197528466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593294; x=1778198094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=McXKF5LM8j5BkWNY6FJbmKNO7UNeVDXvxcjM55d3/RRfFFh/zTEEWjIVP/ItoHnwEG
         wIdPgfsrRbmW2JNuW/rHTEVtWnXonlyzldIPfpTgnKjy7oULGdzy78AMwG8gpZlWJOiC
         gL4A3zBQvWcEMS90um0++htXyeG8gyKNZfSGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593294; x=1778198094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z/X8TMTxizrgbcCVq8AAcQ8SrqTljyGddB0DA+TirOI=;
        b=tKGGfvrs4FnlPpsyGWl/vNze3tHK7LR+yRx02q1Msf6lJgNc3hUJPg3xuCbCq8h90u
         EGJjGUh+D28oqLGRATFFZgl+TWsS3VQC++LbnnE/OMxedzq9yMUmnRUSFFWiCxoaAUTG
         npsg9ePe1Y22jyOPZMgt8YgRkYYK6tSH/bffTr84RDk47VSoy/1lQNSBMjeAR4eY7rsL
         ymqPSF3BzwFsPM3p0glowBX6yo+1iRokkNrNgdS6R59qKutGClVWJFDNnSrOjYy5L/85
         IhCH6yDTH6U/OSshuF3iaKbVTTc8em/o943jBEDvKCpsFaYXQLqJFYsy+yrrF9kodIm/
         MC2A==
X-Forwarded-Encrypted: i=1; AFNElJ8NfoT73KWjUIZ6tWSa8hupVwrsM6odTDxaScQqS7vs/KBVApBK7fp9sdFrpheooiwO3EA0qKbH8Sy4e1Ph@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyFxk0AeWK93Apze2A9O5lJBUBmsOiqDP+wxfFv6Ij7Uhievn
	G+WeicRaB3+8qaD9gRZm+GL4yEDEb6zdJqkrqTad9XUfX9toMZjIHhUTH/99K2Rwik0+FTO9dxm
	9f9cpiw==
X-Gm-Gg: AeBDievCznDYYlwWAGf2mYeq1ynnwepm9UUYB0Z7DRFD9Jgwvst8ACNnEivbGwXKhuq
	NwQecNE/aVkshcPizwSWSitHoY5Jx/tzfuPQArNw+87xnzO62mu2YLxT/ZdPXwCR2Ro8kJMHTfk
	id3yPjWIhRZ/0kNXjK52JAmdvbdzc21Hd4V+uQ0rC9MMx0XFp3BtqSTExAmcXjzDN3k+o9uSdtG
	NOCCen3XZ9Xv1FQ8txcPzw42gtVtXI2giBSAPh995zk6nzLNNfyQWNSXTjXZi98llNwJUOrkJIK
	W3YMXEe/MivB90KTZD2H2XOlsWzF5+d2VOnT4gwDILMum/4zrKj8r9SqFGgbZRPPxQX4HIexb+f
	pSv8FhXM7fVwhXubE8xNmfT8mXwYI4eZVohLtCtutV1V6nfwW5yREWUCaXQ0Ld1cdOwMI0eIBgk
	ALpOdsUvgunfEHtscbPJOIwkU49tGNK5GRoA7VjVapE7mzFzG/DpIWA2rD33RdXow+XOI149Qc
X-Received: by 2002:a17:907:940d:b0:ba7:ade5:8605 with SMTP id a640c23a62f3a-bbac5ac9c12mr334173066b.6.1777593294560;
        Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6da73509sm48258166b.53.2026.04.30.16.54.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488d2079582so16024485e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87c9L1rs3oTglE2RL+j7ivAo4fg223SuvBa+bhOAnfFMlu3FuBIeAFdnr0LJ+UwFgR3YAdp0lGo1w8ycDX@vger.kernel.org
X-Received: by 2002:a05:6000:26cb:b0:43d:6fb7:fedb with SMTP id
 ffacd0b85a97d-4493ec61e55mr8612204f8f.36.1777593293572; Thu, 30 Apr 2026
 16:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
X-Gm-Features: AVHnY4KLFGb62k1dRvCKyy7EF6W0tPNO3zKHC2HCyssJ_nJGpMzpFc_-TEUNEXc
Message-ID: <CAD=FV=UcDrakNVEZW24hCRizyh-VkgCGiZaPd3z+QyPoYzU=YA@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, Julius Werner <jwerner@chromium.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5C2D34A9067
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105432-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,chromium.org,samsung.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,crrev.com:url]

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
> / {
>         firmware {
>                 ranges;
>
>                 coreboot {
>                         compatible =3D "coreboot";
>                         reg =3D <...>;
>                         ...;
>                 };
>         };
> };
>
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
>
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
>
> [    7.763870] coreboot_table firmware:coreboot: probe with driver corebo=
ot_table failed with error -22
>
> Add appropriate #{address,size}-cells to work around the problem.
>
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
>
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
>
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating no=
n-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi     | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi  | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 5 +++++
>  6 files changed, 30 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

