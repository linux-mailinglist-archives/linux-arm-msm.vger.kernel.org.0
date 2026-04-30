Return-Path: <linux-arm-msm+bounces-105433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IN9D0zs82kV8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:57:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DC4A906E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A8D3005778
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38553D9DD8;
	Thu, 30 Apr 2026 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SFy2gu6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387FF3D9DAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 23:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593300; cv=none; b=rp1YI5lug9GKX/PrcaksE3Mzi763Lk/PaRob2Hhq5ZqXeA7BIYzT+dpuX+8BoEv1rN5WUKAxY8cD4STQJlbCdfaWUb+YbAkjgDRl1SSXrHKBvpOpIeQUHs0ZztWJI7AExgYlccLoyAB1augP/o2UEB/wOCtY4oCtInyHMPRSNTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593300; c=relaxed/simple;
	bh=AAia2qkIDmebyJmcu5PDgIuA9G3bwKwbRmrU6wAzc8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDnuFK4DZxGeEipSZ/4vGJxhj3wqTEw9q/+smRNX8/YtS5tx61kIXx3zV4I6sHoi/aFSwvlA7nqC1Az0NsajFu6/8uVr6Z2I9cRVCPEnkZMQaJzA+nQ1fcJNHjhoYi+8qw9O9VUzVsXnanJG1lUnlHPeSVmL7gbsg9pROLKV7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SFy2gu6e; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ba545100a13so267171966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593293; x=1778198093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=SFy2gu6eaE4/v4+Z+SKKATwOosCg7IUdrOTXKkmCWvARveYJ39wsVQG5u337Usl0yd
         /pULJDFSXXsAn4i+bdXKzEI08jiXXovwOdj1oxGLudq9OKueQioAMc/CYkPKjmEhMPRj
         8u2/IFLWnrysz96ojqW6s5NYV25y2rhKUJv+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593293; x=1778198093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmXN7WSIeoo9s9Ua/S5/Car8IH3Zms7BcEHEOsscCUg=;
        b=C3L7kJWYgX0l0xEli2dlD/4fcsNGshgglu+czZayChbBMJLgrlc8B4wS7LTKfdjU+N
         aYSEmg2rduJn2OtTWazhE14PeuIzCgzxvr3Rdmu5aQfWAOc/etHz2UmaC2WnREniRevi
         aQidOGwwIIWHbJU599WJGt7LLsOkdlgx5I3t3np3cXZyFTGKitrGzWLOqjM2Lo1Gr28W
         0YQlBRBTD5YriUDQVC4wE97YZCA0WyZQbi08QXmOmv7QlT1FonjZ9lR/RZIB8ZreWS3G
         EhIsUFNrsbr6yaiiHMohw4s5g5yWN+RRnxq+Ktflbdpp688k83BssFzEKs6r5bYwmGN+
         /6ww==
X-Forwarded-Encrypted: i=1; AFNElJ+wGoWwdXcjwo360r+/zEzkiAyxThj3Aa3ao8VbHFTXUZtZx6gcBdA984I/4Yjce32iSZ9xiG/EbOkig3s7@vger.kernel.org
X-Gm-Message-State: AOJu0YyTbF7qBPJQ4t94A//SSNkI4nd/EE5wJjTjLMqEalxYRKnt7cIq
	VShLSDakhUmTPUH6LyElOARmi2DDSUjEV9t41HrU/D986uRHq6CEhMbubelROQGG3548wZEDDx2
	xwdxZbg==
X-Gm-Gg: AeBDieuw/3JXNc+w5c00AOYkpDnW6q6OmzD9949sK9pMT35e7YxZxvZb8SIxsRiVD3L
	W2lsfZlGw/bE2i6UMKfFVvJQE5qlbygiQIc6HvyjOVcE2i3D/Xju8uvOF4aTkapCQWn9Shgy2uF
	lLvL03mTqcie8W0zE9gWpB41yia/0meCqEKeq8GrL8WrSc4G3m0PD6GCesBPt4qbgxJ872nAImc
	Lh0vjZgEeUDc1d+VVLeAQ2i2VK5L7HQy4xTPFgIwt9yXf3jZPLuF51MG1tPhtjV7JOykGmTeS1Z
	ahNrsX6s6RPPLWIzIySoMYLMgwQH231KR0LDYNg2egbMeCHpcQsxYc4lE5wWqQHowdtnOf4xWnL
	1tm0HQyQEFjJy69MwLZNJa8lo4VlOv2iK8qS7QhZYt0EuWvHguffs2xK75DRIjr9BP+PYPMHUQS
	t92Ke9JB/sMONxb63fmr0+irhGPr7n/Sef3ULahpPgdu0rrFLwzvCJhtRddCqPP1Cu4UEUSFEM
X-Received: by 2002:a17:907:d02:b0:ba5:4bb3:38f9 with SMTP id a640c23a62f3a-bbec0803d73mr38194766b.27.1777593292972;
        Thu, 30 Apr 2026 16:54:52 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6a64c900sm51569066b.24.2026.04.30.16.54.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:52 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso732873f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/u+D5azZ4WZK+cqFiqhwvLd4Z/xIxVy7k/BW3NXXfqTlYTLiSzGMRPH1tW+BMJ13qpZ77kB9LVv3wZufuH@vger.kernel.org
X-Received: by 2002:a05:6000:2905:b0:43f:e16f:3cc3 with SMTP id
 ffacd0b85a97d-44a88058b32mr1086350f8f.22.1777593286514; Thu, 30 Apr 2026
 16:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-5-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-5-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
X-Gm-Features: AVHnY4IqCV1PxHRIY-OTvaBqqWEOfyPxbcpa8ZWBIyLwROAiOEZ_SsblLMHW3zY
Message-ID: <CAD=FV=XrPJwCC3bUJVQJGPwO3HifNOkK4tFd+xwNac_36kHvqg@mail.gmail.com>
Subject: Re: [PATCH 4/7] ARM: dts: samsung: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: DC9DC4A906E
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
	TAGGED_FROM(0.00)[bounces-105433-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[crrev.com:url,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
>  arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5250-spring.dts       | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts    | 5 +++++
>  arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts     | 5 +++++
>  4 files changed, 20 insertions(+)

As per:

http://lore.kernel.org/r/afExm9HeB-FMmP4P@google.com

This patch shouldn't land.

