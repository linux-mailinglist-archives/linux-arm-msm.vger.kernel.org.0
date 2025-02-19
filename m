Return-Path: <linux-arm-msm+bounces-48523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F3A3C2C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C5F3AAC6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF741F30A8;
	Wed, 19 Feb 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B83SWrx5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C061DA4E;
	Wed, 19 Feb 2025 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976698; cv=none; b=Tt1nlCT/Vb0PfqHzouVejor1UbLq7s4/z0g5u/uc9yii0JeuzXtNEUIXbFLfdgQYtqOcDR9FB0gtXTPvhCZLIWeEJ+rTTjULNwYqigZBhVpCgukwTIRRV6QGUmmMiHIDI4QHWAl0ZXfRduA+ZzYZ2afvTY9/0nSk0HDivfUyGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976698; c=relaxed/simple;
	bh=Qa3aHZaPjSJnaVInLcCe/VM+HdWsRFrXkLx3rBDRyZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCtKdpYRIuXQ9Wo3Pa62OcQ69m819bXr0wpQu7eBLFHsyQ/i1JWwGbrKVlEoXv4Ikoq+VvQE6JnUEefZEV1vNstgIyU8v4eNs3ewGN739sdURunUdMHj40soCj8wfT5Mpc73IA/g4keU3PE7PWGQlemaVy55n0hNMPpfJLKEg7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B83SWrx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EA5C4CED6;
	Wed, 19 Feb 2025 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739976697;
	bh=Qa3aHZaPjSJnaVInLcCe/VM+HdWsRFrXkLx3rBDRyZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B83SWrx5dyJT7vFmWa8aCrx8EY4QYd7QsB4WpM3EL5EjuqwlgOBnkguLphYTS9/2B
	 1igwtt2x1rylE4jl3nzocC2ZB8+qjtx6dFODaCryn6jIBfxN++yy8LPC3nF8bBmqcV
	 tGiVWU5SpJTU7d21tnGTd7ch+EwuT2P57go/PtVN79F2lxlZJ6S21B89KpafCDrSOM
	 ib8qJqGF4ftuxM7GBDsv9LNARv0zTvvptmGUYqD/uItJ6OxHaZCHkIAWYfhiGHft2T
	 vx1iqzYDVqhYZ8XSNGY5Tsy3WBXCgauRo83TO4HdpF1YfX3F38BYgDx0gA6IYfVg72
	 NYkSKF5DCDiNQ==
Date: Wed, 19 Feb 2025 14:51:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: core: verify cell's raw_len
Message-ID: <Z7Xv9lNc6ckJVtKc@finisterre.sirena.org.uk>
References: <20250109-sar2130p-nvmem-v4-0-633739fe5f11@linaro.org>
 <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yAIvbNRF25QIvEN9"
Content-Disposition: inline
In-Reply-To: <20250109-sar2130p-nvmem-v4-2-633739fe5f11@linaro.org>
X-Cookie: Filmed before a live audience.


--yAIvbNRF25QIvEN9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2025 at 06:35:46AM +0200, Dmitry Baryshkov wrote:
> Check that the NVMEM cell's raw_len is a aligned to word_size. Otherwise
> Otherwise drivers might face incomplete read while accessing the last
> part of the NVMEM cell.

I'm seeing a bunch of failures on i.MX platforms in -next which bisect
to this patch.  For example on the i.MX6q based UDOOq various things
including the ethernet fail to come up due to the efuse not appearing:

[    1.735264] nvmem imx-ocotp0: cell mac-addr raw len 6 unaligned to nvmem=
 word size 4
[    1.735289] imx_ocotp 21bc000.efuse: probe with driver imx_ocotp failed =
with error -22

=2E..

[   12.647970] platform 20c8000.anatop:tempmon: deferred probe pending: pla=
tform: wait for supplier /soc/bus@2100000/efuse@21bc000/temp-grade@20
[   12.648001] platform imx6q-cpufreq: deferred probe pending: (reason unkn=
own)
[   12.648012] platform 2188000.ethernet: deferred probe pending: platform:=
 wait for supplier /soc/bus@2100000/efuse@21bc000/mac-addr@88

full log:

   https://lava.sirena.org.uk/scheduler/job/1128243

I'm also seeing the efuse failing to come up on i.MX8MP platforms:

[    2.503137] nvmem imx-ocotp0: cell mac-address raw len 6 unaligned to nv=
mem word size 4
[    2.503155] imx_ocotp 30350000.efuse: probe with driver imx_ocotp failed=
 with error -22

Full log:

   https://lava.sirena.org.uk/scheduler/job/1126672

Bisection log, there's a bunch of additional good commits added at the
start because my automation feeds in results it already knows about to
narrow things down:

# bad: [8936cec5cb6e27649b86fabf383d7ce4113bba49] Add linux-next specific f=
iles for 20250219
# good: [67961d4f4e34f5ed1aeebab08f42c2e706837ec5] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [d1a09c610027e446ed30c21f61c2f2443bf92a3f] MAINTAINERS: adjust the =
file entry in SPI OFFLOAD
# good: [5d9fca12f54d3e25e02521aa8f3ec5d53759b334] ASoC: amd: ps: fix incon=
sistent indenting warning in check_and_handle_sdw_dma_irq()
# good: [e08fe24c34d37d00e84009f2fb4c35f5978041e6] ASoC: SOF: Intel: Use st=
r_enable_disable() helper
# good: [d64c4c3d1c578f98d70db1c5e2535b47adce9d07] ASoC: tas2764: Add reg d=
efaults for TAS2764_INT_CLK_CFG
# good: [42da18e62652b58ba5ecd1524c146b202cda9bb7] ASoC: soc-pcm: cleanup d=
pcm_fe_dai_do_trigger()
# good: [994719ed6d81a6f4677875ab6730254c0bc484ea] ASoC: Intel: avs: Use st=
r_on_off() in avs_dsp_core_power()
# good: [ae575d2145d1a2c8bb5d2835d7d54751f3b0bace] ASoC: tegra: Remove the =
isomgr_bw APIs export
# good: [f22ba3561daa792dd138ed543e0bf48efe0b999c] ASoC: SOF: imx-common: s=
et sdev->pdata->hw_pdata after common is alloc'd
# good: [ad0fbcebb5f6e093d433a0873758a2778d747eb8] ASoC: adau1701: use gpio=
d_multi_set_value_cansleep
# good: [e957c96455e8f4c630d5e374312cad0633ca7e17] spi: offload: fix use af=
ter free
# good: [ff4d4158ef9143327a42f7be4298751cb0d1be69] spi: spi-offload-trigger=
-pwm: add extra headers
# good: [21aa330fec31bb530a4ef6c9555fb157d0711112] ASoC: fsl_micfil: Add de=
cimation filter bypass mode support
# good: [c5528214c7c0a753c908a7b353309ba665985fb4] ASoC: codecs: wcd93xx-sd=
w: fix of_property_read_bool() warnings
# good: [330cbb40bb3664a18a19760bd6dc6003d6624041] dt-bindings: ASoC: rockc=
hip: Add compatible for RK3588 SPDIF
# good: [5a19e1985d014fab9892348f6175a19143cec810] spi: axi-spi-engine: imp=
lement offload support
# good: [6cf5df1040ba0694aea6a5edc6f31811a442ea36] ASoC: SOF: imx: add driv=
er for the imx95 chip
# good: [9da195880f167ab7c2d595388decf783c9920121] ASoC: SDCA: Add support =
for PDE Entity properties
# good: [852c0b7204ded184924c41ab99b2ac7a70ad4dab] ASoC: Intel: soc-acpi-in=
tel-ptl-match: add rt713_vb_l2_rt1320_l13
# good: [4bb5b6f13fd83b32c8a93fbd399e7558415d1ce0] ASoC: amd: amd_sdw: Add =
quirks for Dell SKU's
# good: [cb161c333927142818d6bf22a4da2b023fb2b8c9] ASoC: tas2781: Switch to=
 use %ptTsr
# good: [153dbf4adad0082d030c30d20541df2b1af52db6] regmap: irq: Use one way=
 of setting all bits in the register
# good: [0e9a970d7b2cb98d741bc0e32ad8c8f30c009c63] ASoC: qcom: sdw: Add get=
 and set channel maps support from codec to cpu dais
# good: [583348bd65ceaf4a5067a6267dd236929e1b4b37] ASoC: SOF: ipc4-topology=
: Improve the information in prepare_copier prints
# good: [0a7c85b516830c0bb088b0bdb2f2c50c76fc531a] regulator: ad5398: Fix i=
ncorrect power down bit mask
# good: [4c7518062d638837cea915e0ffe30f846780639a] ASoC: SOF: ipc4: Add sup=
port for split firmware releases
# good: [215705db51eb23052c73126d2efb6acbc2db0424] spi: Replace custom fsle=
ep() implementation
# good: [6603c5133daadbb3277fbd93be0d0d5b8ec928e8] ASoC: dt-bindings: atmel=
,at91-ssc: Convert to YAML format
# good: [25fac20edd09b60651eabcc57c187b1277f43d08] spi: gpio: Support a sin=
gle always-selected device
# good: [e27c125040b1e1f26d910b46daabbe55e67fdf3b] ASoC: codecs: wcd934x: u=
se wcd934x binding header
# good: [652ffad172d089acb1a20e5fde1b66e687832b06] spi: fsi: Batch TX opera=
tions
# good: [6eab7034579917f207ca6d8e3f4e11e85e0ab7d5] ASoC: soc-core: Stop usi=
ng of_property_read_bool() for non-boolean properties
# good: [856366dc924a9561dae39f252b45dfd6cc6895ce] ALSA: hda: Select avs-dr=
iver by default on MBL
# good: [5a6a461079decea452fdcae955bccecf92e07e97] regulator: ad5398: Add d=
evice tree support
# good: [f5aab0438ef17f01c5ecd25e61ae6a03f82a4586] regulator: pca9450: Fix =
enable register for LDO5
# good: [c1ac98492d1584d31f335d233a5cd7a4d4116e5a] spi: realtek-rtl-snand: =
Drop unneeded assignment for cache_type
# good: [7ed1b265021dd13ce5619501b388e489ddc8e204] ASoC: cpcap: Implement j=
ack detection
# good: [89785306453ce6d949e783f6936821a0b7649ee2] spi: zynqmp-gqspi: Alway=
s acknowledge interrupts
# good: [995cf0e014b0144edf1125668a97c252c5ab775e] regmap: Reorder 'struct =
regmap'
git bisect start '8936cec5cb6e27649b86fabf383d7ce4113bba49' '67961d4f4e34f5=
ed1aeebab08f42c2e706837ec5' 'd1a09c610027e446ed30c21f61c2f2443bf92a3f' '5d9=
fca12f54d3e25e02521aa8f3ec5d53759b334' 'e08fe24c34d37d00e84009f2fb4c35f5978=
041e6' 'd64c4c3d1c578f98d70db1c5e2535b47adce9d07' '42da18e62652b58ba5ecd152=
4c146b202cda9bb7' '994719ed6d81a6f4677875ab6730254c0bc484ea' 'ae575d2145d1a=
2c8bb5d2835d7d54751f3b0bace' 'f22ba3561daa792dd138ed543e0bf48efe0b999c' 'ad=
0fbcebb5f6e093d433a0873758a2778d747eb8' 'e957c96455e8f4c630d5e374312cad0633=
ca7e17' 'ff4d4158ef9143327a42f7be4298751cb0d1be69' '21aa330fec31bb530a4ef6c=
9555fb157d0711112' 'c5528214c7c0a753c908a7b353309ba665985fb4' '330cbb40bb36=
64a18a19760bd6dc6003d6624041' '5a19e1985d014fab9892348f6175a19143cec810' '6=
cf5df1040ba0694aea6a5edc6f31811a442ea36' '9da195880f167ab7c2d595388decf783c=
9920121' '852c0b7204ded184924c41ab99b2ac7a70ad4dab' '4bb5b6f13fd83b32c8a93f=
bd399e7558415d1ce0' 'cb161c333927142818d6bf22a4da2b023fb2b8c9' '153dbf4adad=
0082d030c30d20541df2b1af52db6' '0e9a970d7b2cb98d741bc0e32ad8c8f30c009c63' '=
583348bd65ceaf4a5067a6267dd236929e1b4b37' '0a7c85b516830c0bb088b0bdb2f2c50c=
76fc531a' '4c7518062d638837cea915e0ffe30f846780639a' '215705db51eb23052c731=
26d2efb6acbc2db0424' '6603c5133daadbb3277fbd93be0d0d5b8ec928e8' '25fac20edd=
09b60651eabcc57c187b1277f43d08' 'e27c125040b1e1f26d910b46daabbe55e67fdf3b' =
'652ffad172d089acb1a20e5fde1b66e687832b06' '6eab7034579917f207ca6d8e3f4e11e=
85e0ab7d5' '856366dc924a9561dae39f252b45dfd6cc6895ce' '5a6a461079decea452fd=
cae955bccecf92e07e97' 'f5aab0438ef17f01c5ecd25e61ae6a03f82a4586' 'c1ac98492=
d1584d31f335d233a5cd7a4d4116e5a' '7ed1b265021dd13ce5619501b388e489ddc8e204'=
 '89785306453ce6d949e783f6936821a0b7649ee2' '995cf0e014b0144edf1125668a97c2=
52c5ab775e'
# bad: [8936cec5cb6e27649b86fabf383d7ce4113bba49] Add linux-next specific f=
iles for 20250219
git bisect bad 8936cec5cb6e27649b86fabf383d7ce4113bba49
# good: [4aa591507214c82976992e1810d5ac121a8545d2] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git
git bisect good 4aa591507214c82976992e1810d5ac121a8545d2
# good: [79eb91f3f44b4146967f38834f55b21c328569ee] Merge branch 'for-next' =
of git://git.kernel.dk/linux-block.git
git bisect good 79eb91f3f44b4146967f38834f55b21c328569ee
# good: [c21be55001aaa27cb2470ecc26109970058228f1] Merge branch 'driver-cor=
e-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core=
=2Egit
git bisect good c21be55001aaa27cb2470ecc26109970058228f1
# good: [b708438ccc2b4dc37ec478db6589c03aca76c4ac] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git bisect good b708438ccc2b4dc37ec478db6589c03aca76c4ac
# bad: [3a3b9078eb6ae21a99e26b80447e1dcf31cd6491] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git
git bisect bad 3a3b9078eb6ae21a99e26b80447e1dcf31cd6491
# good: [7e17e80c3a7eb2734795f66ba946f933412d597f] Merge branch 'for-6.14/s=
tack-order' into for-next
git bisect good 7e17e80c3a7eb2734795f66ba946f933412d597f
# good: [e5bb72d538dabba8cad1224b853aa0fbd6d79844] Merge branch 'at24/for-n=
ext' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
git bisect good e5bb72d538dabba8cad1224b853aa0fbd6d79844
# bad: [4770132f37dbf327d25455d226e54fafbef6a5c4] nvmem: qfprom: switch to =
4-byte aligned reads
git bisect bad 4770132f37dbf327d25455d226e54fafbef6a5c4
# good: [3419bdfd88e314bc5f80b02fa4651c81a0a85b57] dt-bindings: nvmem: qfpr=
om: Add X1E80100 compatible
git bisect good 3419bdfd88e314bc5f80b02fa4651c81a0a85b57
# good: [d5d9e982a0886a1a99a1a8ef5320c57e257b4fb0] nvmem: core: fix bit off=
sets of more than one byte
git bisect good d5d9e982a0886a1a99a1a8ef5320c57e257b4fb0
# bad: [eca73df072715efb5e880514bb8395e0a4e74a59] nvmem: core: update raw_l=
en if the bit reading is required
git bisect bad eca73df072715efb5e880514bb8395e0a4e74a59
# bad: [11ccaa3121119eeff9ab9d537e0cf6be3b10698b] nvmem: core: verify cell'=
s raw_len
git bisect bad 11ccaa3121119eeff9ab9d537e0cf6be3b10698b
# first bad commit: [11ccaa3121119eeff9ab9d537e0cf6be3b10698b] nvmem: core:=
 verify cell's raw_len

--yAIvbNRF25QIvEN9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme17/UACgkQJNaLcl1U
h9AmYQf+ILW3D2JyaoxSaQDHJk8ov0ERt00q1oNpBS0+yx1wnWT7CZnZdZoeUaGE
yOLZK44ukHZ/QizFkFuGyy+RVYapbWKxr5NM4JS511HGfThuKFXX5yhgv8llTv0Q
Xu9c7Fmg0fGO9yaYvYWPzFfRgRUJdggM0/tiuR9Z/ddWWJab7GBtXWga6UsNJhbZ
lshhVsDxkdRw9T+/D2+qTNPw47v9H89sspg4MuOmFXOSYVSecn920iiMQlUYoyTy
opkgpL6V7iwtOT0qpqj9fXmeC3fZ9tKzjXYKScM+QNfiJpub/5p42pJZkf7H3Plc
vv0CPT2uuss/u/0MFDXf3LsCowe71A==
=9VmG
-----END PGP SIGNATURE-----

--yAIvbNRF25QIvEN9--

