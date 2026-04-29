Return-Path: <linux-arm-msm+bounces-105100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DKWDF6G8WlEhgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:17:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A6748F12E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:17:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7D09303D2FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6825C3890E0;
	Wed, 29 Apr 2026 04:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dvDACpim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6952C158A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436245; cv=pass; b=nAp+41nVVOLMtjPkDfNVFXcX6m704HxMMOQ1HeUQvPHRMPR2xjidEBw/LlUbvQ8cHVLSN3Ww5KU5xkdxahIMxHupGr2TJaui77HS9MUgv1IOca4/KkwgYtTvungLeXF/l80/laEJr9W7JJZMzjVJqwfsl+pTHV5k+KJ7+FDdDV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436245; c=relaxed/simple;
	bh=ucY3TNrWMvRb0oHVhltYdiDBL03lh8F0+Cv3NgZ1q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iiR7q+1nW1u95QiDwNERLL8vr8Q21TBOL2fzk1IbPUNCgsFsFumURkYwMdfXcXX1pirHekAcgegoWEsDQtQ9R8pGFmCixnSB64S9XemKOHI4dJQ08gPLQYL7mu3wPQGWCZ23aMB1IM3tsGG1DrF0HxMKokyB6ySydutug/YLPJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dvDACpim; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a41099fa86so10722622e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436241; cv=none;
        d=google.com; s=arc-20240605;
        b=MQ9aQ3QaHWfsORqB4clAWtc+OKX7g+y6Pxi08a4KbMSbxwCPvakb90Sevuz6QqSI0/
         UidJNWTYvKJx+QbvXEksbMSYinTzCqKqfFeovfdN561cK9gy5jjvlOAodUQ+F05f+FuS
         +6M029Gv7TPXIsyZ4D/eeQP6ps08Ami2Cdm7kGGuSfbZnI1pxXuvV8mJj/aMjk/fGa7Z
         YIg2Q9IqWORuaxVGh7SchL4ZgtbWAhkimsQihmirKglCLuMALR4PKJqDaAl/z/AHi4md
         R4ZJN1vOySoiP6VLl6jGdYkR/OW24XR5BTJy3Fz/NQaZ4cUkyrBS0COuNL6DrD8dJIcf
         k3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        fh=OwXI8tXDgjxTgO2yAvM7Yf8YslkeYj+2UmdHWtSq/Ao=;
        b=QGeO4h1ZgfFrtovZhPMCQQd2Ki+FCfBZb+VIy/sAI8uj2N1CQcutZ84zDMU6LDAzUH
         wy4qDxQF28AzDX7aCO4Sq65YSAodAFjNF+DLj5kkJWAzQ0AWBFD2Y6hJAuBw95bnPwhI
         wb7LiAp+a/bi92uwPDK5Rj8A/JNXsq6w2onddMSc0jiCHeE9Fx6XwxkXgv+yNHrunQqV
         IWMZw66xAm2l7zH/SLWoz9KoLF1kyhc17I1GVx6t4YpO+osync2pZv0kaV+UmbtH/QAS
         krNzEC4MMcoJUUx4KI0UhQifRTA2r74aTidxlgP464FoiZIjtP5Umv2niDFsF2kNt2qG
         E+uQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436241; x=1778041041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=dvDACpimEfz+lkjDu+p4DjT+fvQBqaJ38nt13vAj6O5Zjc3j5SRV7RVEUyAsHY5zDy
         k7SDY3R2RpdAJvuxg2G9SneYMEVqCzmGkqLfRFIYzTR0vB68T5h0PdGzttJYBLPSjwwp
         zysiSnFZUrxLZPQ4xUk/g5MimDPy32mTPkyA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436241; x=1778041041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+wgx278PuWohl1935Byl8WX7gkc8WHJmkUS4pGdFI4=;
        b=Obk6QuP/XY9gFU9M10GxnY3/qY3hVovCxMFB8z+MOq0P3NkuNId5yBFF8brre7t4Z5
         PfBSppHnN4thkSO6xb8Cm5dSXnsRe1CTzBMr7GRIQ5jIotfbzgRD7GWRsA9u0Z3PUwzM
         VIoaxWbMNnYutpbMidBs2xrxvmpQnZfPbc39NHlZXmz8J3o5ATLnPcSF7IgnGL2+y4aY
         Lt26A2AAjeG0BT505U+SjYL+gdXRQlh2+nZYzuGkRcM2KbsHsidXGaodRxUVED/9hJy2
         TuNH1PTpYLrQ24I8Di7Bom4WyJNHlCichs0KuY1W4bZpuZlOYZd9nvitUMkwUFUtEsvi
         PvLw==
X-Forwarded-Encrypted: i=1; AFNElJ/GDXsMXRBwaSS8DTglyv4AJrEjKoqEHdls5/QtWLUKolEAwASCuojVAdd310dNdD70bfTJloiIKaEjR5YX@vger.kernel.org
X-Gm-Message-State: AOJu0YxKa2myCQo6aW2exWsKSDHzxO3iSz1Mm3lRLGcYJzlDkW+EOV+2
	QZuZxOVBqTkel2S8S3ZiOw23rAYglgJj8/HkJny+/B8+IDcd5NRjf+nJmpxQbM12qKLtNwOvX0P
	wbDuEdHZF60WbeAVPjpWCBkADjNv5CwU0SzcElJSj
X-Gm-Gg: AeBDieuOZMRDJK9MSqulAPNR0Pvxwk1nPOEj/NvaCTB5S6WWs5/aulmymu5myxcFieF
	oGS6PJX8ZGDzqlkj4mMAyxHxdHGmV5LpahMS1Cjs8uPiY/Hc6xOPHhh845+tuNVn4e3F+4o0gZQ
	u10iix4HY+YLrOXetGB8Cu8iPUaQ+MiArWGsG88SIKsaRTo946ST89zhjxOObAzp5hWVUHNhyZG
	qyMvtP0tnktoVKtpr5+N9IxDq+uiaD8u6Y+1GKbQxaKf++HVJmwC+5GdoYyuP9JpcIWsVbJOAE+
	XFzICFnMkvPAVhr3AQ==
X-Received: by 2002:a05:6512:3983:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a746623733mr2096698e87.20.1777436240634; Tue, 28 Apr 2026
 21:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-6-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-6-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:09 +0900
X-Gm-Features: AVHnY4JUF2jGqzImUjvVT0R20VSVC4ANB99NMBVznnvWckelDQ9DcqAgZCUM5q8
Message-ID: <CAGXv+5FZ0kTqrqWEu8AX_1cxtEQD0urr=FJO=Van20h75_Z1Xw@mail.gmail.com>
Subject: Re: [PATCH 5/7] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Heiko Stuebner <heiko@sntech.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	Julius Werner <jwerner@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 19A6748F12E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105100-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,chromium.org,lists.infradead.org,lists.linux.dev,samsung.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

