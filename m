Return-Path: <linux-arm-msm+bounces-105436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1aJMDt82ms8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 02:03:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4004A9179
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 02:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0974F300C90A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 00:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC629EEC3;
	Fri,  1 May 2026 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZnXjTSV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691291FD4
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 00:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593759; cv=none; b=U6PbdauZ+/ZGa+fZnRFYu1Ta8sHwagl/IuWXRrS0pIu5SONivi63lkAegLIrXyl1cF6P7aVrmfVlNaFJeODT8OHgdwjxVMg/rs4FgqxQNIIjDu4t4zb+nbJQl8v40udi7grccTyYxwUd1x8Ua7Abw63gJqS8OQEFHLRD4mjBcKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593759; c=relaxed/simple;
	bh=Po793qEB14FDeszlUgfCZzMNPlO0hdsx5m4i9+Am1UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TecFq1md+Akm5PREisiav6oyjAkyw/Ycx1+N8m7XFnmoeXlZTqXbEpU1N0SIZ+cYJcF3NhQxp0XBr9kyhhvKMGQWrXS9m4MIDFNp6JsMHl9J4Z51q7W8KJUaZdrxGNvcKwHjKEGIWMloy/IW4MZsUeZ32NIzMddmb0U9oZ2gP28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZnXjTSV4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba51e69988aso250888466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593755; x=1778198555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=ZnXjTSV4Bq+aGrMUE97A0kJLiJwVmXvFEce3VJzNQ3+Ci27W6TUA92b0kNWXDo12BQ
         9putFxUvNJNhVBulI6VgRNZ+/BpnVNr2Yy478ZUW7eOIH0neYzPM1gSDTWDiwwGHVlq/
         HxGkoxS3RusniGvzqpISdPgz/cTwQ4GwKAX0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593755; x=1778198555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/stw2Li+z9zBw8IsGsJQTT0j6lAz8JjDjcZka6O6Bc=;
        b=DghyvS9BBgK37zpJm2aVquAZVmIR5vBefmU91v+VCb0jvSnW1TvMmIJUisyQMsfr6d
         Fb9OMmZw/23yLKvuWVrg9ZedSeMP8guDYtXiiEpbG1XjP3J/m0VSiGvRM0H4BUaZBzIj
         /MEjIj4nSaTOy/azdMWUdooaovnN/FUvKZuzONKkJhBmn9warorGXHWsvh0fkzGzCDWx
         7lBo6aWzGWGuyVvcX5NLIxiGWW84ox5knrIgdU1BuPbJCz787DaISw3E+M70n6OwPa20
         2dDMuKzsUapSKuDyGQ7gbSUPR7uwxG8Qnh8LnWA42u9ym0Za1cVYYCAVnN/MpyRE2FpR
         jfeA==
X-Forwarded-Encrypted: i=1; AFNElJ+DQdgcFo52YqJXOyh855i/WzyQ6QtJNaetMuNxJV3HZ9WRtrOl0w/fmbSPB5EHYoqbCb1TOfNIIrnbRxOd@vger.kernel.org
X-Gm-Message-State: AOJu0YygRkXe/15mKHuJRN4F7WNwvjfXSwVVKCGTKGvV0VU7EgC5MtXB
	9bC4PIUhn7xCAGxR+p1Bzwf8djcn6pEZ896k7w+bcb8/NDMgoc0cxt4i1nmH8CM0n2raePmj7sj
	h8VVjqFs5
X-Gm-Gg: AeBDietvfXUBiWLqrLnn3rehJzMH3W59ilTu6svwfKnzJ6LM2nMN8KIXxjswMVLgd3R
	N8tYm1igmxWMeskLULADBWvw+5bXaikC69Ah1fVasHlRFwP5LxT91Bq6hbE781iOXW+fzFJ5MX/
	ga4TcpkjIhMZELxHafW1cba18NBA8i7cJlcS6qMrGP9LZ3sYrEECdVBRnMc15nRXxJg0mnimu+w
	XcDPPE+T1rN5fiBCKwSkA7tXj7gQxhh68l5jbvBZHfovO0AArP4jYJJjJtIyMTH1IWeCeEVOxw1
	bOidbsf2cP2HUDRd2jjZN5pRJQmc0+3kx70saEDXilk7g/KCF1dedTeXEWpzpG8/4jh4uBlSJSI
	uMeDPcJkGVjYBZ17jmTexbIYQrH1vghOusMdnG0+/Z0SxxLJaC95phKUfh4FF0zbm9T0foHW3GH
	rUpRFd33TFMnGtLMQ9oUkttgXynDmD3Nme+YbZXz1BusEnITLniSXNQxUJGCiaLnXBxUsV6C1I
X-Received: by 2002:a17:907:84e:b0:ba7:5c47:7b32 with SMTP id a640c23a62f3a-bbebeafd7a8mr34066866b.10.1777593755483;
        Thu, 30 Apr 2026 17:02:35 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06964dsm49177366b.35.2026.04.30.17.02.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 17:02:35 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d73352cf2so1313479f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:02:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Icx9+1C/IDJM3Y8ynWhUi8FPz0IrzsxlPSglzpjNj6M5B5sl6S446hyJQYbClCj2YbwirH3W0Bwq0ysWL@vger.kernel.org
X-Received: by 2002:a5d:5846:0:b0:447:55b5:d532 with SMTP id
 ffacd0b85a97d-44a87f60a32mr1080919f8f.37.1777593318187; Thu, 30 Apr 2026
 16:55:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-8-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
X-Gm-Features: AVHnY4JV5Y3mu38iXutrpDHLS51XF8wv90SD0VK4jxBhsJoT2PtDnx5IHddvQ_U
Message-ID: <CAD=FV=V2H426VR8z5EEm4bWuK-Fvg_wr+mAkkaAfJrWcU0kV1g@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: 3E4004A9179
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
	TAGGED_FROM(0.00)[bounces-105436-lists,linux-arm-msm=lfdr.de];
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
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 5 +++++
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 5 +++++
>  2 files changed, 10 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

