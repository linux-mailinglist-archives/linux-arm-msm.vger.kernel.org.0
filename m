Return-Path: <linux-arm-msm+bounces-105101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEU1MnyG8WlEhgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:18:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C41548F157
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 06:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2302301FCAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 04:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0D2388E60;
	Wed, 29 Apr 2026 04:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOYbthWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32E537CD3D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436279; cv=pass; b=Yj5D2BslUNLatOXzO0RlCYHoCZQxqEOMHnNdFwWj0fPO7jf7CbEJogl7YfbYBWXe+S725Nso+eW5OtEyc3m0bhCMTQkcul/WaIYFl6tlWDEYCPCL7RXvlIOzCQBPstqX2/1Y2snGu0qdrHCKWjoi9ccqltrA3z6tz/t+zSl3R6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436279; c=relaxed/simple;
	bh=AzwVlyIqYxfmPExGHlhzDdBcn2kCaAcRsyV/IiibDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9eNh448iFY17Psav4pPZ1vmPF8VnrMTqmyjE/HCAbXap6WZkxQFNRxSgHB4j1KC4962iueoqaMF33RIEZ4IuNF+em7G9IdEe3VGqiEgrV9hMJty1Ug+PULERP1SOvHYufLk+gTsR1gvOwC49kGrpv+XYVdhe/HAh/+w+lQjj2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOYbthWP; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so10534082e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:17:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777436274; cv=none;
        d=google.com; s=arc-20240605;
        b=F/PLgn5ChFUBiNEvroBLfnWflXL16yrqlUqlhMoq75abPUrdlhwCqyVN9XybVAQ3Ni
         yYdK16N1/I0bGKS9LwPZgmsl52GbXuo8DQRWC0U77iGpEqQphLJFLEBbAFWYVjTBXgIr
         SgwRtlxZ5Zcxn5HfNdBJ4xo9z5LadrEqxbvTLqho3c4fDvzyjE53ueutRgjE4VStLMot
         hBuZ0qgyAArbct1IoZxHpkN4/fsZS0eC/WPyrvNbxxFtSySaWsEfn4vXOBQkIEnOxGY0
         anotGPQy5ELzYMh6mqRDICJRtItd4AWiCMxrzeZ4Hkczk6/e26XiARXY8tF6H/WM8AkM
         lR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        fh=GTWrHaRrkB359ZiIOcFeSRqs7dLs5WCAEicY2x9rfTk=;
        b=eeEI1pNdTPbxjuoSdsrIbV272frWTo9/0d8APbvl3RupL4NqJJIe3hm7iNc7Nwg6Jw
         A+cYRPgvm6bYWAMVqDOcc1KiHIEFrdBr9EKWevKhojUGeexxcoA0WRWQVfkiQcU/mGvW
         dIkvpkRVOiSZbwNGUW/reVUzKmHIVI2bqguEp2PV7wfRLqtwhbsYstT4biWfr4ha8hM0
         B33aMDWLkXf7v8hASZO5xioCj8S2lkv5woVbzJ/x6OBqbCZV/x1WW+Nq1UtL8sXJu0F2
         PGcQe1SIeDT5MIGn5fqP3Kq738uC+CpmEmyyHu3jZ3ljg6+CQnm8YgVetRjbRIRWAx5K
         P54A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777436274; x=1778041074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=FOYbthWPP8lZx5mA4McOSfJeVR0BRGPHdmtlgr+cFqDyaIit578GgtZp31cw0VznxH
         wKUndv8E0Ym7rLT/XDgblyvzj9usFKBf1rj3kFh+mLXvelnaKsP7iTgtAULRzrmny72b
         FRk3AuvUtX08mGI610FMukA4zPRDmNgO5zMjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436274; x=1778041074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGT5/UW9QnYnxFplrWMvYfyGjM/y+JrwSoKrwJn5UdU=;
        b=Q2ElBcAcC1wBKLLgtaX7T56qe5DPa3B8NwS3UcAW7bAnBLAA83RgvuZ49T3iIvFqPv
         uKXjtw6GnI1u0gtLayAzE+WK2Iuljz/A4qe99mzAp/x0HFnSk3atGAxGO4N0Yl0suMJ/
         9p7frTFggNuzdihwjqEBiN+r8s/fVfazo0E8rYVCtRFlicPBbPSZRIBcmrOVdh007/ip
         3UfmqkivwfuzNUxgcbQMgFW2ImQ6h484BUheCZZ5Y6hBjN/YMue8+qxkIk/VwkYHdxON
         4qlMyka/ZZ18ntjgyMA1A3ftenBvTHeF2T7Z8KxdSfg8/o2SCJGbS/VjSmNEi2bN7n/i
         SuKg==
X-Forwarded-Encrypted: i=1; AFNElJ8Xd1cj4bfgaRBAr01DpRUH5M21UsYyWkDasfN/c/atAyN3EGA9hb1HJGRwkYnbCm0RsThHzdTtzQ+Oh8y5@vger.kernel.org
X-Gm-Message-State: AOJu0YxOSd5DqJ8geHeu1VVzfTd5h1qZ17cqiY03P0m4VGiN4VZpl635
	B4sQsReoys4FJgbRkhukhaeauEhaKoZ1+LO8hgCqb84Y+BzMYi7ggLEL6gXaxtfxEsi/L9YR/jn
	hJmYuJhl+nKOccskauLs5nPEV9+df16PdxL/fcK/y
X-Gm-Gg: AeBDietahWwmfZR9uUFAvm5yf1F+fzKYmqTnN69vyf5L8qPfFNBkdGfPcEeVl5BxcKX
	VCmbiut/gx/edSRJ9PrhZf26D9g2viCz9bX17aUQG3iv/i4E4tdAMbATAlvQGOQwj9x70tSqw5w
	tQFuV5tAS3ynbibsZGNV3UB/PvqYglFmsL8LdzcxC6yOF9atMaeSqOzrgITRLZQvHSXKaEEUFAL
	yWKne67wLKUD6KH0hg3rqXO5gl2zqY2YLZPQyl+GYT/ir3Uj5StzBNB4DYiFq6WnlW1cIv7OwiB
	eu0mSy4nNMgLjmkexA==
X-Received: by 2002:a05:6512:3b21:b0:5a7:46f1:d96a with SMTP id
 2adb3069b0e04-5a749cf6fd8mr890120e87.13.1777436274082; Tue, 28 Apr 2026
 21:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-2-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-2-briannorris@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Apr 2026 13:17:42 +0900
X-Gm-Features: AVHnY4JKvPmufJ1LEj4mzB6PnqIoSu-1P7-pbmF9YGak1q31h2Rrygv9WVJBRdY
Message-ID: <CAGXv+5EPpB92d=ttP9ezOipL6=bC6WYpQakkd5L-weDjLpkrFA@mail.gmail.com>
Subject: Re: [PATCH 1/7] arm64: dts: rockchip: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: 8C41548F157
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105101-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[crrev.com:url,chromium.org:dkim,chromium.org:email,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 1:12=E2=80=AFPM Brian Norris <briannorris@chromium.=
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

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

