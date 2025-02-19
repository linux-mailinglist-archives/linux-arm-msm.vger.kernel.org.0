Return-Path: <linux-arm-msm+bounces-48524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D3EA3C34E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AABB5188FBB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292461DE2BB;
	Wed, 19 Feb 2025 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDW3FfKC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9801F3D53
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739978098; cv=none; b=WDsnzRWox6Qb2d5yGa743qBaCbcJyUXGimj5XyDZxGf8ueMOk6FXZyJUR1EiRD5taJcvoFWHf42IJc8evS+9PWx9G9MbWdRktV/DUBuljaEnnXVmM7HqGozO8LCS8FZGJYoToccXKTO94odrqZL0eXb1+WoGwDwzbQLhVrjS/qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739978098; c=relaxed/simple;
	bh=7ZzF5Ad64kAmT1EYsz/Ribn3T3yAZpN1quCf0vgkVIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3B2SZ7O1YJFCUBKGxz64Hcu/4FrRNn3s5BGhFoBAdG3UqyX+j4GwGwMdQD7whFyK/ccbug7AnL3bQcQdXJcDFIywtpi+g9qVqsYfgxo2VMdcqai7gHjlx6gNz147ftMG+3/w8FIb6IVRIql7XNWODS0bARkLTP62QLw2+EFPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cDW3FfKC; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f74b78df93so61304477b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 07:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739978095; x=1740582895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+E6kC7d+DNvc02YejfVB1otPtjrvjn2uNRtdwjS8Tw=;
        b=cDW3FfKCsShYdJ8iaSqiKbbPqupv2AD7ExsgYEMfibYJ5kpKAX9zyYOTEZceVHQIwo
         GxLEv4KVEGQ8ya6lw011D2bUFi6VSLBpi657IXERRArBGMDk+MiMWmvOIOWMbRVYa/wa
         2WnKgXU3pF1ifQACU/asTZktc2eE8mQGFnUsdLtIDVYEvX8Q3We86uYazT4tDUT744BH
         IIWpz1JvdxIxMl1M1O3qSbnDJ3BcuJ5ZsF1Hlfzk6OdI7+bafFhsK9mra/jLGaAVOsZ/
         lBD70Ly2Vhg11gj0rGPebf8+j3taSKqGbcD2I9T2U8XZ41vZM0GnMFxpIty6QiSpQUiR
         1hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978095; x=1740582895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+E6kC7d+DNvc02YejfVB1otPtjrvjn2uNRtdwjS8Tw=;
        b=v/OYOgUtlycxu7muZZGAAa3YV2OJyywQS+1u5cQS5ulawTZyPCyXAdiFrQTskS1XmT
         IjKJpT7szWlkASgFDmEgD2UIvp5ALlgub8SnX1zCvko/bEyfZ5VgMPbvzzTcD2xxkbLP
         AcIN+5MZ7qt6QajmDYBJcJqvGnqmtTXAv63hKyUoKg+NMRV1A1kDUvEESZyNwzVjvY3k
         snTBxoE/HlwY1kgkRIjqG5jil+0pDEshLm7RsJ+w37YHsxYhuapZ7j4pJRO4fWYc1h4b
         b1zq3Q56vS43/rTazNx7stmQEI9d0HDLyrqbAAEZ4Fmc0xX/kdWzgNC7RAKCthxrZXnf
         Habg==
X-Forwarded-Encrypted: i=1; AJvYcCUHf8o7YI4g/CPIhVCAatXD/VrcZE3WVSzuqmrHKmT2ag+bnBS5wnE7Pak06hV6jciyfioxJY9FuECTZO/3@vger.kernel.org
X-Gm-Message-State: AOJu0YznHGQe8IxeCF/q3/eCa8DHlbe3g67ym3WfyG8RRRgxPGhsuwgZ
	N0fEjk/IZ0ZPAJpiE6cNFaXVavF4IRU4X9IpGwTpue3mlmx7CQwAn4O8Y1QmH0B+ZpyIWf6MJL1
	foeuZ4h0z4lLJxALjKazOLlsAzYCw8vDTkitfsg==
X-Gm-Gg: ASbGncvfMlcNFQ9D2cysPZjGesYpJx2vsEhsuLfJ0MFOQsT4o58v5Whrj2vYbbBUWSz
	WWwMg/e4xGe8U6JCTQzy7VxJGs0jy12Mi216U8G3VGCgwVq7AutMXOc5mPsSzLa1JcCWCYWC+gQ
	OQvfLWS6mWxD4=
X-Google-Smtp-Source: AGHT+IGzsPfDdeeAveGhU+aOYK1SYop1lJB2Gp+ImKyViDH0yKDhHuYN7jg/YXNY7Ml0uxzkPfJKqZciVxbo+viEHSg=
X-Received: by 2002:a05:690c:450e:b0:6fb:277f:f022 with SMTP id
 00721157ae682-6fba56ac46amr37599417b3.15.1739978094861; Wed, 19 Feb 2025
 07:14:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org> <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
In-Reply-To: <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Feb 2025 17:14:43 +0200
X-Gm-Features: AWEUYZlKZrJ6BlnP5LZGrcDfshTk8gmJlBpd2Sd2bgFCh0GYo_K5SDi55MeUV-E
Message-ID: <CAA8EJpp-mE2w_c3K08+8AR3Mn1r8X58FRXvAUFALQ-u2ppoKgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Feb 2025 at 16:51, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jan 09, 2025 at 06:35:46AM +0200, Dmitry Baryshkov wrote:
> > Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwis=
e
> > Otherwise drivers might face incomplete read while accessing the last
> > part of the NVMEM cell.
>
> I'm seeing a bunch of failures on i.MX platforms in -next which bisect
> to this patch.  For example on the i.MX6q based UDOOq various things
> including the ethernet fail to come up due to the efuse not appearing:
>
> [    1.735264] nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvm=
em word size 4
> [    1.735289] imx_ocotp 21bc000.efuse: probe with driver imx_ocotp faile=
d with error -22

This looks like an error on the i.MX platforms. The raw_len must be
aligned to word size. I think the easiest fix is to implement the
.fixup_dt_cell_info() callback like I did for the qfprom driver.

>
> ...
>
> [   12.647970] platform 20c8000.anatop:tempmon: deferred probe pending: p=
latform: wait for supplier /soc/bus@2100000/efuse@21bc000/temp-grade@20
> [   12.648001] platform imx6q-cpufreq: deferred probe pending: (reason un=
known)
> [   12.648012] platform 2188000.ethernet: deferred probe pending: platfor=
m: wait for supplier /soc/bus@2100000/efuse@21bc000/mac-addr@88
>
> full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1128243
>
> I'm also seeing the efuse failing to come up on i.MX8MP platforms:
>
> [    2.503137] nvmem imx-ocotp0: cell mac-address raw len 6 unaligned to =
nvmem word size 4
> [    2.503155] imx_ocotp 30350000.efuse: probe with driver imx_ocotp fail=
ed with error -22
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/1126672
>
> Bisection log, there's a bunch of additional good commits added at the
> start because my automation feeds in results it already knows about to
> narrow things down:
>
> # bad: [8936cec5cb6e27649b86fabf383d7ce4113bba49] Add linux-next specific=
 files for 20250219
> # good: [67961d4f4e34f5ed1aeebab08f42c2e706837ec5] Merge branch 'for-linu=
x-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
> # good: [d1a09c610027e446ed30c21f61c2f2443bf92a3f] MAINTAINERS: adjust th=
e file entry in SPI OFFLOAD
> # good: [5d9fca12f54d3e25e02521aa8f3ec5d53759b334] ASoC: amd: ps: fix inc=
onsistent indenting warning in check_and_handle_sdw_dma_irq()
> # good: [e08fe24c34d37d00e84009f2fb4c35f5978041e6] ASoC: SOF: Intel: Use =
str_enable_disable() helper
> # good: [d64c4c3d1c578f98d70db1c5e2535b47adce9d07] ASoC: tas2764: Add reg=
 defaults for TAS2764_INT_CLK_CFG
> # good: [42da18e62652b58ba5ecd1524c146b202cda9bb7] ASoC: soc-pcm: cleanup=
 dpcm_fe_dai_do_trigger()
> # good: [994719ed6d81a6f4677875ab6730254c0bc484ea] ASoC: Intel: avs: Use =
str_on_off() in avs_dsp_core_power()
> # good: [ae575d2145d1a2c8bb5d2835d7d54751f3b0bace] ASoC: tegra: Remove th=
e isomgr_bw APIs export
> # good: [f22ba3561daa792dd138ed543e0bf48efe0b999c] ASoC: SOF: imx-common:=
 set sdev->pdata->hw_pdata after common is alloc'd
> # good: [ad0fbcebb5f6e093d433a0873758a2778d747eb8] ASoC: adau1701: use gp=
iod_multi_set_value_cansleep
> # good: [e957c96455e8f4c630d5e374312cad0633ca7e17] spi: offload: fix use =
after free
> # good: [ff4d4158ef9143327a42f7be4298751cb0d1be69] spi: spi-offload-trigg=
er-pwm: add extra headers
> # good: [21aa330fec31bb530a4ef6c9555fb157d0711112] ASoC: fsl_micfil: Add =
decimation filter bypass mode support
> # good: [c5528214c7c0a753c908a7b353309ba665985fb4] ASoC: codecs: wcd93xx-=
sdw: fix of_property_read_bool() warnings
> # good: [330cbb40bb3664a18a19760bd6dc6003d6624041] dt-bindings: ASoC: roc=
kchip: Add compatible for RK3588 SPDIF
> # good: [5a19e1985d014fab9892348f6175a19143cec810] spi: axi-spi-engine: i=
mplement offload support
> # good: [6cf5df1040ba0694aea6a5edc6f31811a442ea36] ASoC: SOF: imx: add dr=
iver for the imx95 chip
> # good: [9da195880f167ab7c2d595388decf783c9920121] ASoC: SDCA: Add suppor=
t for PDE Entity properties
> # good: [852c0b7204ded184924c41ab99b2ac7a70ad4dab] ASoC: Intel: soc-acpi-=
intel-ptl-match: add rt713_vb_l2_rt1320_l13
> # good: [4bb5b6f13fd83b32c8a93fbd399e7558415d1ce0] ASoC: amd: amd_sdw: Ad=
d quirks for Dell SKU's
> # good: [cb161c333927142818d6bf22a4da2b023fb2b8c9] ASoC: tas2781: Switch =
to use %ptTsr
> # good: [153dbf4adad0082d030c30d20541df2b1af52db6] regmap: irq: Use one w=
ay of setting all bits in the register
> # good: [0e9a970d7b2cb98d741bc0e32ad8c8f30c009c63] ASoC: qcom: sdw: Add g=
et and set channel maps support from codec to cpu dais
> # good: [583348bd65ceaf4a5067a6267dd236929e1b4b37] ASoC: SOF: ipc4-topolo=
gy: Improve the information in prepare_copier prints
> # good: [0a7c85b516830c0bb088b0bdb2f2c50c76fc531a] regulator: ad5398: Fix=
 incorrect power down bit mask
> # good: [4c7518062d638837cea915e0ffe30f846780639a] ASoC: SOF: ipc4: Add s=
upport for split firmware releases
> # good: [215705db51eb23052c73126d2efb6acbc2db0424] spi: Replace custom fs=
leep() implementation
> # good: [6603c5133daadbb3277fbd93be0d0d5b8ec928e8] ASoC: dt-bindings: atm=
el,at91-ssc: Convert to YAML format
> # good: [25fac20edd09b60651eabcc57c187b1277f43d08] spi: gpio: Support a s=
ingle always-selected device
> # good: [e27c125040b1e1f26d910b46daabbe55e67fdf3b] ASoC: codecs: wcd934x:=
 use wcd934x binding header
> # good: [652ffad172d089acb1a20e5fde1b66e687832b06] spi: fsi: Batch TX ope=
rations
> # good: [6eab7034579917f207ca6d8e3f4e11e85e0ab7d5] ASoC: soc-core: Stop u=
sing of_property_read_bool() for non-boolean properties
> # good: [856366dc924a9561dae39f252b45dfd6cc6895ce] ALSA: hda: Select avs-=
driver by default on MBL
> # good: [5a6a461079decea452fdcae955bccecf92e07e97] regulator: ad5398: Add=
 device tree support
> # good: [f5aab0438ef17f01c5ecd25e61ae6a03f82a4586] regulator: pca9450: Fi=
x enable register for LDO5
> # good: [c1ac98492d1584d31f335d233a5cd7a4d4116e5a] spi: realtek-rtl-snand=
: Drop unneeded assignment for cache_type
> # good: [7ed1b265021dd13ce5619501b388e489ddc8e204] ASoC: cpcap: Implement=
 jack detection
> # good: [89785306453ce6d949e783f6936821a0b7649ee2] spi: zynqmp-gqspi: Alw=
ays acknowledge interrupts
> # good: [995cf0e014b0144edf1125668a97c252c5ab775e] regmap: Reorder 'struc=
t regmap'
> git bisect start '8936cec5cb6e27649b86fabf383d7ce4113bba49' '67961d4f4e34=
f5ed1aeebab08f42c2e706837ec5' 'd1a09c610027e446ed30c21f61c2f2443bf92a3f' '5=
d9fca12f54d3e25e02521aa8f3ec5d53759b334' 'e08fe24c34d37d00e84009f2fb4c35f59=
78041e6' 'd64c4c3d1c578f98d70db1c5e2535b47adce9d07' '42da18e62652b58ba5ecd1=
524c146b202cda9bb7' '994719ed6d81a6f4677875ab6730254c0bc484ea' 'ae575d2145d=
1a2c8bb5d2835d7d54751f3b0bace' 'f22ba3561daa792dd138ed543e0bf48efe0b999c' '=
ad0fbcebb5f6e093d433a0873758a2778d747eb8' 'e957c96455e8f4c630d5e374312cad06=
33ca7e17' 'ff4d4158ef9143327a42f7be4298751cb0d1be69' '21aa330fec31bb530a4ef=
6c9555fb157d0711112' 'c5528214c7c0a753c908a7b353309ba665985fb4' '330cbb40bb=
3664a18a19760bd6dc6003d6624041' '5a19e1985d014fab9892348f6175a19143cec810' =
'6cf5df1040ba0694aea6a5edc6f31811a442ea36' '9da195880f167ab7c2d595388decf78=
3c9920121' '852c0b7204ded184924c41ab99b2ac7a70ad4dab' '4bb5b6f13fd83b32c8a9=
3fbd399e7558415d1ce0' 'cb161c333927142818d6bf22a4da2b023fb2b8c9' '153dbf4ad=
ad0082d030c30d20541df2b1af52db6' '0e9a970d7b2cb98d741bc0e32ad8c8f30c009c63'=
 '583348bd65ceaf4a5067a6267dd236929e1b4b37' '0a7c85b516830c0bb088b0bdb2f2c5=
0c76fc531a' '4c7518062d638837cea915e0ffe30f846780639a' '215705db51eb23052c7=
3126d2efb6acbc2db0424' '6603c5133daadbb3277fbd93be0d0d5b8ec928e8' '25fac20e=
dd09b60651eabcc57c187b1277f43d08' 'e27c125040b1e1f26d910b46daabbe55e67fdf3b=
' '652ffad172d089acb1a20e5fde1b66e687832b06' '6eab7034579917f207ca6d8e3f4e1=
1e85e0ab7d5' '856366dc924a9561dae39f252b45dfd6cc6895ce' '5a6a461079decea452=
fdcae955bccecf92e07e97' 'f5aab0438ef17f01c5ecd25e61ae6a03f82a4586' 'c1ac984=
92d1584d31f335d233a5cd7a4d4116e5a' '7ed1b265021dd13ce5619501b388e489ddc8e20=
4' '89785306453ce6d949e783f6936821a0b7649ee2' '995cf0e014b0144edf1125668a97=
c252c5ab775e'
> # bad: [8936cec5cb6e27649b86fabf383d7ce4113bba49] Add linux-next specific=
 files for 20250219
> git bisect bad 8936cec5cb6e27649b86fabf383d7ce4113bba49
> # good: [4aa591507214c82976992e1810d5ac121a8545d2] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.g=
it
> git bisect good 4aa591507214c82976992e1810d5ac121a8545d2
> # good: [79eb91f3f44b4146967f38834f55b21c328569ee] Merge branch 'for-next=
' of git://git.kernel.dk/linux-block.git
> git bisect good 79eb91f3f44b4146967f38834f55b21c328569ee
> # good: [c21be55001aaa27cb2470ecc26109970058228f1] Merge branch 'driver-c=
ore-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-co=
re.git
> git bisect good c21be55001aaa27cb2470ecc26109970058228f1
> # good: [b708438ccc2b4dc37ec478db6589c03aca76c4ac] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> git bisect good b708438ccc2b4dc37ec478db6589c03aca76c4ac
> # bad: [3a3b9078eb6ae21a99e26b80447e1dcf31cd6491] Merge branch 'for-next'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git
> git bisect bad 3a3b9078eb6ae21a99e26b80447e1dcf31cd6491
> # good: [7e17e80c3a7eb2734795f66ba946f933412d597f] Merge branch 'for-6.14=
/stack-order' into for-next
> git bisect good 7e17e80c3a7eb2734795f66ba946f933412d597f
> # good: [e5bb72d538dabba8cad1224b853aa0fbd6d79844] Merge branch 'at24/for=
-next' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> git bisect good e5bb72d538dabba8cad1224b853aa0fbd6d79844
> # bad: [4770132f37dbf327d25455d226e54fafbef6a5c4] nvmem: qfprom: switch t=
o 4-byte aligned reads
> git bisect bad 4770132f37dbf327d25455d226e54fafbef6a5c4
> # good: [3419bdfd88e314bc5f80b02fa4651c81a0a85b57] dt-bindings: nvmem: qf=
prom: Add X1E80100 compatible
> git bisect good 3419bdfd88e314bc5f80b02fa4651c81a0a85b57
> # good: [d5d9e982a0886a1a99a1a8ef5320c57e257b4fb0] nvmem: core: fix bit o=
ffsets of more than one byte
> git bisect good d5d9e982a0886a1a99a1a8ef5320c57e257b4fb0
> # bad: [eca73df072715efb5e880514bb8395e0a4e74a59] nvmem: core: update raw=
_len if the bit reading is required
> git bisect bad eca73df072715efb5e880514bb8395e0a4e74a59
> # bad: [11ccaa3121119eeff9ab9d537e0cf6be3b10698b] nvmem: core: verify cel=
l's raw_len
> git bisect bad 11ccaa3121119eeff9ab9d537e0cf6be3b10698b
> # first bad commit: [11ccaa3121119eeff9ab9d537e0cf6be3b10698b] nvmem: cor=
e: verify cell's raw_len



--=20
With best wishes
Dmitry

