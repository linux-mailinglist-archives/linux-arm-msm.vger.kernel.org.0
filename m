Return-Path: <linux-arm-msm+bounces-105430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEv2OsPr82lg8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:54:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9650D4A9007
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90AB83012CBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED4D3D9DB3;
	Thu, 30 Apr 2026 23:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JkAJLzSb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671A93D9DAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593280; cv=none; b=OI1E9DCTrLo8smyjdHd1vHfHzWFhigG5sb2LOVLioo6yh1vk5s07qolPFQ5b/wflDXRvBCMjbQBIe4ST56AlYXEfGok18PNTykIfqyJ4QBqOw5nCHCuK8EoZV9VsV/gaD7AzwiYBfaF/+2wk0bndsEZFyBgTbSFWsNmTCfYLm+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593280; c=relaxed/simple;
	bh=rWDl9l88s5smH4oJB25R8ZD9EUfLZO6b7a2lfjBov+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coylSnecVGhzcXshWd6RDH04TwE4P8AEqz1xUAp5mD5TGmcM46kSNTYGJIsKI7mfTZigh6+dUbDWCkrIp4wPoMXzla7dMo03Qv+6sl8yuu3JEi8SO1yQS0ulKY2phHaISMRzPsRr2hAZ4EAAGqFma5k8CWx8ga4hst001cPbjt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JkAJLzSb; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso194849666b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593277; x=1778198077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=JkAJLzSbbpgpkNtOrjlmzFA69wlgD7N0BDyH2VNaINmq9LmZatuVZBHyCHmtuKZXqM
         mjIB9eePuB9qw2bKi2djMi7gL+wnFGnJAFvfObC+RGFoJluZnCh/hmj+YlkFHiCxe9y4
         /tm+NT/yrRQMw6Q8L172qD+1EvM/iWbnIGjlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593277; x=1778198077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6F0Zles587cKnPSm5xIL1UTxvPC2KivgOEAzPu9dSY=;
        b=acSvKlsJqBlZPZV/W0pqiYbXaFzK9x8Ab4dEBKuIGLRIU2yqV281tU9N/95BPZxH2p
         8QAvpRjZG+JoqvoIDftP7RKa5W7d7G3ZEErRKjxfcaRQCTOv7sUMVu+0YhRznib1bVsD
         MMIYM/U7bs0BnV18Qs0PugAnAnib2tJ4jcxgEytY6QTh5AgX+5dnO24sS6SU37kTKKYE
         1KYbEFeMYw1wx0Fmc5frsnGYCyp4TBQsTyRtLZqQPPywx1s8ZEQwJogQWAUscqDEtzV3
         iWPqp6YpVW2Gk2gn4hCLc7AAa2MfOJsjFlqHt8S/EAQ8res5RoNqcTaOJDzebNpQWUek
         h/8g==
X-Forwarded-Encrypted: i=1; AFNElJ/Uro0CWt9vyQiAbi39ZdENStpcMh+w6h6KT49SrtIgXm82nJepUVguaUJ035icncnMIwKEY0AgAQks/pAr@vger.kernel.org
X-Gm-Message-State: AOJu0YzzpPgppzPBONqm38M++YruRxW8UuviOC4wbRqhUc1fDfVo1+0K
	5YYJXFR8yUEP8Sy9SFX6Kffmci4t1Sf7Hn1UTzQ5R/QZ4T8gakwUWpt9LEsgc/AhpDMVNY4r5uq
	GflU8PA==
X-Gm-Gg: AeBDietuq1Qni99Vx0BstRKNmKMKmILLjfW9c+w+Tf3uKDohhvoMzyvI6yx0Cp2eAdD
	Lt6PeJWTHcxUDASs9+JiKviwOrbT73YPHPFKsAaUi5y6BUm71PCTa9H0IsyeVX32VMAtrimN6HH
	1STo9I4g7KnBB3n4jl1IRwE6KhKPM9S03l9zeN5RYapeJWkH69aNGA+Kx8ubXlwDhjDpFJX8dls
	3TJTF1yKZrV6K8sbXf1zPLiMtXd1hECLYg2SDE019Bb+9Gmmq9cWL1Q5/o8joTIB5xugJRfml6/
	/Vd+jG7xXIck3dPwzrjkrkm/fRX6iwIGhFOeAQuNi1JiX6miYiBEa3f0D+noYLyw0PmqJZtSrmB
	8u7e+w9gDyUeNaA+vC2Gljtzmhnjlldkbrs5x68iSE3jh1FoiPdaWtc/TwdSnPGv2FRl0xDGB3P
	ElopBRwYokgDUkEXJwXKSbBWyeCE1ELZenqEAi1f8YxyHRJt/PuU9u1ULMGEFzU0KeorPrZm/R
X-Received: by 2002:a17:907:980d:b0:bab:f5f6:d700 with SMTP id a640c23a62f3a-bbac7c92172mr327695666b.38.1777593277179;
        Thu, 30 Apr 2026 16:54:37 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64d8c2sm50852566b.17.2026.04.30.16.54.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891cd41959so12952215e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/SCrM9vLZsnmH9al9DzBnEToCGaeGHMDVYxCGyh73CGFg4poK51Q5vU84qFpAKzrhUPZ7wkqQIdBw4WNfa@vger.kernel.org
X-Received: by 2002:a5d:584a:0:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-4493dcd3c71mr8939823f8f.11.1777593275557; Thu, 30 Apr 2026
 16:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-3-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-3-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
X-Gm-Features: AVHnY4Kl-1ca-wbSwPcS9uBBAU6zbdhWLbd9Fj0fAjnpUI5H2rQOrfd8cK8P088
Message-ID: <CAD=FV=VFCEEBKYY8Wnt6JEK_N4NaUvvhWXYR1pbt6teLL=zYeA@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: 9650D4A9007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105430-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid]

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
>  arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

