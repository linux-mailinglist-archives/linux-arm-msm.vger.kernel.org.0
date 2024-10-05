Return-Path: <linux-arm-msm+bounces-33164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D050991399
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 02:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A621F1C220F2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 00:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EEB01804E;
	Sat,  5 Oct 2024 00:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uKARuMy0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F5B17BD3;
	Sat,  5 Oct 2024 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728089150; cv=none; b=oACCkoc+UScyZ5rHluDrzg2SVbdPLfY0cIPM2uGYyBhjIvXRbtAo2AC+j7ozilln6TtKT+6DWOiu5UoXmVovrTh1ipWIWTLbxi9maILfiEzboPhcPKs/VrA+puIPjrkyyvw1BZ3rTsbj2/FVr+xCYb1C4iIuzvZq5RWYqQJJ/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728089150; c=relaxed/simple;
	bh=D8THuL/WtjamRz9W5coZAbJh0EtstxtlVs5yWnjdESk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=AE/uKEgZ5K8jBCEDyk5DXjHO8fXt6TwJzZPWZ6b3WRfH7JyAisxdt99Dp7Eq8JXCS6Y+JZLD/oZR+tkH2qv5DxjAvFCJTsYP1IFaDpRTFRTXjZC3uabnGV+xccFz4SZYxTiZMMh+lItQXDHt1Cbqb4ug0BHyfkOwGTpq5VLdb74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uKARuMy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D340C4CEC6;
	Sat,  5 Oct 2024 00:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728089149;
	bh=D8THuL/WtjamRz9W5coZAbJh0EtstxtlVs5yWnjdESk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uKARuMy09Q0qxfk2hLo/lsJCQT/NM+khzdhiyM6w+mtS8zviqo4UBbJDBF98P8Wwd
	 jsTTIfqaD90nJcc+qR03NlkSHw7l29eLm/0q6TqZD/ZwlPZIpO5EGP5kmQqnqYQBdG
	 j7Yjr4ZrDUOPy2kf5PoSISmH2ZA0MMMK/BBbrlteWeZ4oshlKFDkL6rGBYxrEhSihJ
	 0ixbLATSjwhFXnIqvgS3rtAHPGRdHJktsqYpKpfvMOHaVMNR9N+97Ku/7a4wP26AaH
	 pDx17AqmbqfoC0qFh2JEgrGMHAY04nPlFnfTsbwEfn1/FgrpbRuVejpUdjbQZVVriL
	 OMVHSO67n5Bhw==
Date: Fri, 04 Oct 2024 19:45:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 "David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jakub Kicinski <kuba@kernel.org>, linux-mtd@lists.infradead.org, 
 Richard Weinberger <richard@nod.at>, 
 William Zhang <william.zhang@broadcom.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
Message-Id: <172808887889.121631.5291340274404319375.robh@kernel.org>
Subject: Re: [PATCHv2 0/5] devicetree: move nvmem-cells users to
 nvmem-layout


On Thu, 03 Oct 2024 17:00:10 -0700, Rosen Penev wrote:
> The former has been soft deprecated by the latter. Move all users to the
> latter to avoid having nvmem-cells as an example.
> 
> v2: add missing semicolon to fix dt_binding_check
> 
> Rosen Penev (5):
>   ARM: dts: qcom: ipq4019: use nvmem-layout
>   arm64: dts: bcm4908: nvmem-layout conversion
>   arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
>   arm64: dts: mediatek: 7886cax: use nvmem-layout
>   documentation: use nvmem-layout in examples
> 
>  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++-----
>  .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
>  .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
>  .../bcmbca/bcm4906-netgear-r8000p.dts         | 14 +++++----
>  .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
>  .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
>  6 files changed, 53 insertions(+), 43 deletions(-)
> 
> --
> 2.46.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y broadcom/bcmbca/bcm4906-netgear-r8000p.dtb marvell/armada-3720-gl-mv1000.dtb mediatek/mt7986a-acelink-ew-7886cax.dtb' for 20241004000015.544297-1-rosenp@gmail.com:

arch/arm64/boot/dts/broadcom/bcmbca/bcm4906-netgear-r8000p.dts:149.4-30: Warning (ranges_format): /bus@ff800000/nand-controller@1800/nand@0/partitions/partition@0:ranges: "ranges" property has invalid length (12 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 1)






