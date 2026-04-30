Return-Path: <linux-arm-msm+bounces-105435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELWBLL3t82ms8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 02:03:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 319CA4A9172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 02:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7641E3007E27
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 00:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EC320ED;
	Fri,  1 May 2026 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gL6O79Wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07E8EEC3
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 00:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593759; cv=none; b=GYvB5fbvxhOw0MIrGecQs4Vg6ZJ1WlID9DPrRVzzMFf0Uux+8tkTqgj/Zix1mpm51JwzdRrldK4p3RLTOAUgSyxR+TyJ/u3nbNuu6iaHv3Q/4U1CTlPKr2Ueqa6J3/SbsKc8GQq32J9geceyaLSW5/V50K1keEOQDer2vvVwrjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593759; c=relaxed/simple;
	bh=1iYFrQZWmKEVWrScCekgHrk90TTezLU+zo9EhcJOGkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0tjN4uDfCW3s7syQjffHcQuB7EgQHdFF0ExyA9JwFTLYC7rokKMLPSwueaiUNds1KhZzxxlEXuZwgvkevcUOArOmg1WUGXXBCHo2pTumUdfZPWLvWMBahnnhXalFB5Zk4W+iB1sBz9CYLTLXDy+O5tZjOaeSut4/8mPfnlWK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gL6O79Wd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-676d8582a13so2708503a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593755; x=1778198555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=gL6O79Wd9EG+VApCbCrN74sjWbP2kOFvMR1vSR5NPoi0ZrpmjXiXVMgcWJIN+ZTBqj
         AcOhXm8+cV2fvIOTFfUQte48np8+3Qgt72wG2XJiZbj7uh2ehb29RZ17fLf+8l7AIOJo
         7yAVwmsVWEOHySbHhvhEBuTTaq34DtlXFwSjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593755; x=1778198555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6+mZxHBvv1WgYnS9amllda9wyu/ABf+laADAiAQpVXA=;
        b=qXGJdAeJQQoU63rKVA9fsoHqQKIexl/qA2cr+I85HMuHsC5xtfQNd/K4TSfFAfCVNj
         yTPWF/G0a1DnaZUIQ8jfxWJ93VGS3qXPNMkNq1yjlyKcMSmc36l6HCqjUMM8txDaq5Nv
         cuP9hQerX1tBg9hGbQxfnM6NwDMHX0dcs6ZN6BvP1HVkdM8RMoxsLDvkoadtdMzPzbHB
         szgwpvq08l2mxICbocJb3yfYe5hE9b4ecJgiO7YMLqaqYygMvSasW2+cNVDC1joBhUuu
         BmMXUQLIjyui5lAo++YBmXtrHB2WvfE3GHw3kTKcxe+8P13RFIHdBrwpwkfTkkeIEwE8
         wsiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0j3iLNsul+HW8V4JQ/sycmZwwKFoYbF1Xi0V0x9IEB1n2VW3qx6CAqrLHK7MmvBNfy4VY3d/mnb4W5XAH@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnFPkhgZcnXh2d2lDICafLM1Zy3h2G/YbL735wMNwhC3Prf9P
	l/othQpMoUqx3HxMwGmTWtc26DjrJsPrKGGI/yjOq/dqIQ4xRtCwzGj9OHPNnR7O6/roYLZ0pJW
	xzP0BmAU2
X-Gm-Gg: AeBDiet593HkveWGn60Q0hsHl4Rv8MgX4uT3J97lj2v8jaYT1iaKVCOt+p2w1ITLK3G
	ZIXVDoAMCKQra3PB2vzWkfEnySkd2Pw7TshbGER3gtxlCVQzHOvFiVJipn3v0zpDrTCIj9z+k0O
	4S7vg4kbVnMSzEhb+rn93LjASmkJqgoqgKz1nCmbZq9oX7+hk6YFCAlbo77GXzeNmMTA10rbfrI
	zRzarw4TEL0KrZ8SWd5oPqMCbZ106j+HfmaljA4Xuk8pgZoIt7f8UVvRIslR/D0YjtWlCMkuY8l
	uQllXN6RgZEtixYwN3Y4vvID0y2KxzB1xTrDmExPBNnDUe021pnuclMTt8MR6vq6KAJSoyRhYMM
	+9YIdH2iXvb/ZAJpCpeVRzsPQ6uozQ1XvsH00cvsvPXy9bViMm0OfCNqZZw8wI6Q+T6DFSwUC9M
	QulhRQeO0GfVVCZLgOJkSO0Nl0gM+FGKdhAFJFlEFKLk4j36xJIMi+5z4OUDBbehSsVMNz8nU5
X-Received: by 2002:a17:907:7b9c:b0:bab:75f6:78d2 with SMTP id a640c23a62f3a-bbac4eebde3mr321901166b.11.1777593755314;
        Thu, 30 Apr 2026 17:02:35 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6df5cab5sm47795066b.62.2026.04.30.17.02.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:02:35 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6788838d543so2679463a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:02:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96CBNpRV/wLvHbOddkbZF85yq4zlJnwzsgwsVYUaoOKXIPh84QG0RWC6NapH2P/ch48lzj8GRvHlUYzawL@vger.kernel.org
X-Received: by 2002:a05:600c:8483:b0:487:2671:fb8f with SMTP id
 5b1f17b1804b1-48a83d73324mr83882365e9.8.1777593300707; Thu, 30 Apr 2026
 16:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-7-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-7-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
X-Gm-Features: AVHnY4Jn8yjvVDQMrk9sfxS2s1IXmKHM3MKByZAYOfzP-smNW0WjILYj0XY4G5A
Message-ID: <CAD=FV=Whp6JADcVOZ11Jr=5THGrCe9cWZhX0ye54wQ84GtUOwg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: 319CA4A9172
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
	TAGGED_FROM(0.00)[bounces-105435-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,crrev.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

