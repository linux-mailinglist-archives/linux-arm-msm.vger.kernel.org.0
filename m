Return-Path: <linux-arm-msm+bounces-105431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG3rBfLr82lg8wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:55:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFD4A9041
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 01:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A209F30072A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 23:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75C93DCD8C;
	Thu, 30 Apr 2026 23:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cBUCLzB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496A3D9DAA
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777593293; cv=none; b=YMzgZsvJicOxW1kEBZPXockMhyXN7jI7qLfxuECAXiVKt8eI/axu/VyUuxJU+MA17NDVqz2SKpKYa5KWQEy1kFcloAL/EafUyNnN/QYXA0VC8+/yxpZRVgrJfJoLmiP2zpl8hvbk9vutE1RasDBuVXyswU8+ueyFBMOstK/q3Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777593293; c=relaxed/simple;
	bh=E5GkC4G7rtGBz2MILCU8/hEbtGwGymi8oc5Ct4p7lLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2+awFQ+V2xNI/JgvqO9o8KWYMaQYEaTuvnkN9l9D69xNYyxhRyFg4d7sd2UM6wqYJy9PIJ+VcwzeCaRjKyOkx1qMJuU7oGwGf6ALhUitAFcyky4jgVOxlcPadoI1dLNcdP1eezhnomzaaF2/G001GP74XrLns2x0Sblw5pL7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cBUCLzB1; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bad54961385so243998266b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777593286; x=1778198086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=cBUCLzB1HrCXcWxAfvO6XkzllsrPwLo6f/tOv+0rpiA0CsZr2SPSTIX9miPXBbvZDU
         5ha40MY1pWOQmTgyuOlxo5aBh+rdrhYtKKxp2jGOS9iqSUbNTPjlx4Pgm2vl1pgW3Ce9
         7029ykc6/+mVFJb7ClwodXRpyxDnZneYGurOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777593286; x=1778198086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FVHhCQMUid03F9iDcHc+WtyXeEQi+bjBCIpWQi6kbrQ=;
        b=kC3tPlJoy4WA7fPZqWNrMTEj6oeCCg1xuoSwdIoGDOCqjmP9BpI1XJ0y72VsASeKV1
         1VUx9UjRpDDf1k8pLewCVaYdaVSOWrc/G9QtOGTCaZGRMO3qhxiVbFwiuIXh1lwUiCWa
         BXBb8exAN5idFc+SM+1v+EHME7CsJR/aACgclvQYXfWn1BL5ffSLcNC4Wf6I/ZV68Aiq
         Zu2Q+Hmny2k+AXKGn2W6yUmD0SiDUWpJxTEIrKfRum9nhOsh9f7ApFIxSLkMtkHFVDoF
         TesoUeglMDjJOJQqkgdgW0eBtQUbg18KKDlxMAHZAW0qGVOPPETD5RZ7edEgb+NmKrwV
         jjcg==
X-Forwarded-Encrypted: i=1; AFNElJ8VKKOI2PGI4q1/pQheEdlZ2U85hmABGuFYPoDZ7VfICbpEtoUreRoVe/lWQeSeu5J1xWdEVIy1Cy3OtZ/r@vger.kernel.org
X-Gm-Message-State: AOJu0YwChcSyzLlbCTi2b6q3H4TYtXG9/zhiI4Iy/JK99ef7zm8vaBOV
	kUflqruBeWznBLfcYqG51JnmoFwr6AMsDm0DQSfd3z15TcvPk2mKbVSSzzjev4ySzbceu6iUCN7
	fHgr56Q==
X-Gm-Gg: AeBDiesmT9S5scFq/EJaEn4e0CBd4KUUQJdJKUqNevXz20FPbzzQmTY94V8uHPdmlh7
	zcQ6/7SGL0pxHggcClxoUtdOaISTUHaxpNV3ZNSOZbTSdpGGueTn8FtZlmxVtt4dBlObquI5yWh
	cmMoLU7WcmBzRzdoIgcJFDoN2+W3/WIJmaBOYN8j74m7FXPzL9geOo/Kst9QMpd89c3quw322Tp
	5Po6f9Wrr/lNPG16ttFjcmQRO6KPNHdxPk4U3X54n4L664AuO3KS8mIuqU7zZg6wU8uXek3ioop
	qyHcIcUdXB3HVXV28mlUS5Gs6U3DQzNuJ9VcUlDpCDxdZEo7qs460V1FGRdDiAzBPs8o/xgqRe/
	PZaLArqOySs2ZgCORnLTdJ4uGeo2ul+Dtu0uq+AQqM1TQlnDChw8R0CxRomkCXVb+A/z+58/wwo
	R7cm7cVtRhRsaQ0UJmgP55t7ghTR/Y7S2/+5HQgKqDWh0Lk3QxSpiyjK3s7BJIhZCKzYCaO75X
X-Received: by 2002:a17:907:d8a:b0:ba7:62f:9fa6 with SMTP id a640c23a62f3a-bbac46d3942mr324993266b.2.1777593285580;
        Thu, 30 Apr 2026 16:54:45 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d668435sm48437166b.42.2026.04.30.16.54.41
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:54:44 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1009619f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 16:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZNQyLf4beUlGI8VHvlqI4UWo+crNGwxVIP4RKrWFLhuq+OKrooVRqvIGclGz5JOxv1eqXpmGzyLcsDzZF@vger.kernel.org
X-Received: by 2002:a05:6000:2385:b0:43d:7ba4:6b5a with SMTP id
 ffacd0b85a97d-4493f814094mr7876169f8f.22.1777593281177; Thu, 30 Apr 2026
 16:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428200712.2660635-1-briannorris@chromium.org> <20260428200712.2660635-4-briannorris@chromium.org>
In-Reply-To: <20260428200712.2660635-4-briannorris@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2026 16:54:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
X-Gm-Features: AVHnY4Lf_-e67ZfLDh6j0F0tOI3LrjkSTUbSwaFXekuSrX2ugdsS_RxN4nbO7Qo
Message-ID: <CAD=FV=Wzk3BW7qOQHm3zait9p=K+pTNVviMgUF1dfdqw9rimnw@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to
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
X-Rspamd-Queue-Id: 1DBFD4A9041
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105431-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

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

Reviewed-by: Douglas Anderson <dianders@chromium.org>

