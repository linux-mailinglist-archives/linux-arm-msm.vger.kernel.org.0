Return-Path: <linux-arm-msm+bounces-105429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKOgC7br82kV8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D344A8FFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7358300362A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732763D9DB3;
	Thu, 30 Apr 2026 23:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ez1kh2IT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFD3D9058
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 23:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593266; cv=none; b=Mh0dkU7VoPwTvaVAKvvxYRNYKBq5cqD0X//w8bpmHVImc0tYoR8grM93wmkjmPuKwXmNQtTJr0YtWWK637zREvrgg3NcCDfJ2pKWAPLzLIHzsO4crM4is0uqYFr7UrlfMvygymBbSh1fGmhduwIJTF6b+Y+ub2hz4jUvl9o8ptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593266; c=relaxed/simple;
	bh=K6HjmbNrmRNPQFoeUy4vXzHlo/g/A/oFQFErhjwT8ZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rw9uYo+gWAF+O4L5pmTjQ7wp0n8afkWMq+feds/loZYucRGqzGi0J3AXxlY9arwLFerSLRRR8eMXomFm9ztZmtTskx8GyniiheaVokGY24PIihvHRUNwSutn4+DVUfudMsHb6bEiKxVv1IY7UrMfOM9s/cQvBJd6trvR0jz0YBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ez1kh2IT; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso1949206a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593259; x=1778198059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=Ez1kh2IT1tKxF1XKxEn0ZGSvtAhXLoZqs26W2A1gDRcMPPPXMa/tj4/jGIZMDdFadP
         t7V4+9TkvX2hAamn7V8ade24SItErlyq2hlHdRtK+Fn4mtJXMXz59ZWaoG/Gqo95dKQv
         PrFkekLv4n7wW1sxQCLPwqo2MONZQfp8X/D7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593259; x=1778198059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9C1umI5D1atr9W6hfkEvQCrhMpTXSs9QJYfV/9UKu8=;
        b=kuHfhvE33jh14ZYkfG7+SGMGnV5pXMXuW4ujVRFMprkSiSLtHggdsSSkhxyRglhnVm
         XvespKYMtRNEcyrkYS9T8xRoWaEGMsVAHP9PzuVh3VuNEWDRE/wt5gxk021jvUyIPPT2
         tJ1Yz+uzrLta7FpBNSMtoJk9U0wsLoHu0kSLfKjEuHHLBhYEduqMuZ8qnoobe9XL1hG3
         RiCphBvDJksQT2JijUlkvtGZYdiYVVf+1NIWN80G4fzInb7SAo12aTWFGC+inOWKGxlo
         RwsiiHgekA3yVryeQz2x5phTrtBs0bwamHaKq0SHPpm4lKg6jLvvifTvxJJCf/QjuaXq
         LEUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ksMnkKrhtNFZF4CRrOh6Lpb69pOSNlefKsHB9Z5u0CFpmjy+u0iikdW++MWGCpohP95mFXJpvkKxCWMae@vger.kernel.org
X-Gm-Message-State: AOJu0YwPlXNfWV0g0sCIVi6cbFsUaGNzrZsw1Jx/d1xPCvwBsm35UV2z
	sWaY0jdRpGyZpUhDSvAtloCZjviy5c/QVpSnUMaE3gF40hYoug3jGjaxZLWoVaJrq4Eoj7drgUT
	UCoy5PA==
X-Gm-Gg: AeBDieuY9H1nzNwmgl0mlfK9S5KZqSKXlby7deevSQeg7za7bqRv/62C6PQ+3FbZX9z
	QZIb4jROvNTfyOYN6TpEsoXLWMhajCAp9J+pvavyPtRH7oNJvLF/woozEVPzEyAmvf7ovLRWt04
	YYPoGxLNg8N3AuJ5rQlYhNHMeKBQvcInYzcuNW3tMcJBzurKZxxtT8/YY0LmB4vrG90lET9UQps
	gLmu1rozeZBVnl3zTiksSYQa3OB+PolK5EMx6G7jPWHp+gx71G17Hvnhe/MRoWo5RJL4b03S8O5
	KfL8a1BqIvdq20RzUhf/oJO3Hy/CdNk0IsRFOWkopzFiZ+cMoQf0ec9ZDiDrq5N9c1OjzhpSYmp
	D1Y3sbrpWxi31PLIfrmYRdUBJlyQEuIxwGZhxHBGqz7npb1lzKv37nZwnUpqM4IFA9MaozqMNjN
	FHe0nGI99uDF0GnpkTDKaEFsj6qgnm1wOhgNwLh2Fv2ERd0tWCdJsjHvzPos2vtqv9M+iTN7pq
X-Received: by 2002:a17:906:6a16:b0:b9e:8e4:8765 with SMTP id a640c23a62f3a-bbb69239600mr287978366b.10.1777593259370;
        Thu, 30 Apr 2026 16:54:19 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e254sm49711566b.30.2026.04.30.16.54.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:18 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so884549f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hc2ZvHhlaUe09Rorw72kBJmZBHH3Yb1S+XsoT0HJR9X8lkNpTQ+8TeSJQ9RT19HvACStVwpGKwsEprpwS@vger.kernel.org
X-Received: by 2002:a05:6000:40e0:b0:43d:50c:6f18 with SMTP id
 ffacd0b85a97d-4493cc3fdadmr8678277f8f.11.1777593256152; Thu, 30 Apr 2026
 16:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
X-Gm-Features: AVHnY4ITNUkQNF1rYH2AzAfyi5kerkzeuZiwFrCYx_qZbGHsYv-60K7BAEKUu9M
Message-ID: <CAD=FV=WhtAz7WM+AsQ9yTwzQMv2B--c1ca27a=fpvVFccRVd6w@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: C9D344A8FFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105429-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi,

On Tue, Apr 28, 2026 at 1:07=E2=80=AFPM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
>
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-versi=
on
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-sto=
rage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-siz=
e
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-off=
set
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
>
> The /firmware node has an empty 'ranges', but does not have
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

Reviewed-by: Douglas Anderson <dianders@chromium.org>

