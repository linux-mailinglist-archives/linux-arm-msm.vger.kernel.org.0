Return-Path: <linux-arm-msm+bounces-33061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948F98FA84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B46F1C22E10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11DA1D0488;
	Thu,  3 Oct 2024 23:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8JSdqsb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7361D017F;
	Thu,  3 Oct 2024 23:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727998483; cv=none; b=Ein41pDYdkK1r5GZw4IsnBYYGZM2ygLjV4gGYdOp47wXj/3L6DEm8bpuh5+ri6yiaUsoVeqBhpmxIciiWPzcet+pBew8z8wzG0ZiUkVqaoSMF0kotuYeBfM5+lVsJO9JnjETNnJdqfRgHbxgLaBdyeBqpqFstWL3LVpUBBJnQRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727998483; c=relaxed/simple;
	bh=LmLiVd8buAfyuJvGbppveG4LjHwRWKVjQEKB/WLTCow=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Q/GD5GJ4MMbVwytHXKHBimDQdUNMwdjDjmrcTgu4enIz2oJOLzi0IJgaucm90Ppn2k99zkMS6aAFZdoQDoE7+2k1GElXoHBxUrDYmJQ33TAtjBKs5mD2aKtvrIJSbrq5gzRw9YK/vHJ18cmOqnB1E2939T/dSnxqhUntSJknoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q8JSdqsb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF00C4CEC7;
	Thu,  3 Oct 2024 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727998483;
	bh=LmLiVd8buAfyuJvGbppveG4LjHwRWKVjQEKB/WLTCow=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q8JSdqsbFO1KItO3T5SI36nQwk3d/dDnd2mPQY2FHI5/u7jRd/KZvyVsok6pH52LF
	 m0RVdnSjpL1/b8JMp56/w0LzL3eYkJKv9zpm+SCV+U/W0PMJVpS9MWrmYzyos0jgd7
	 rIFLKwY7pMPqTPeNOJQq7ajdWB7oyo6AmGIXgRtC52GNxCwMa2cGfCX67RlzbZuYpm
	 Ho+lZKtLZOVO2GoA0kuYAYlj8X4je4U5NyuHzhvEpIbh+M2wNYyboG0DBb2C10JcAh
	 XtjKME7Bax1FoqxsvSEnUzlIByPL4jRZqpyNHcxhG3kPVVOT+AlbQa4cj/b2KQ/Ieb
	 abV2fZ0nJzz9w==
Date: Thu, 03 Oct 2024 18:34:41 -0500
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Andrew Lunn <andrew@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-mtd@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 William Zhang <william.zhang@broadcom.com>, 
 linux-mediatek@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Bjorn Andersson <andersson@kernel.org>, netdev@vger.kernel.org, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Eric Dumazet <edumazet@google.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Anand Gore <anand.gore@broadcom.com>
In-Reply-To: <20241003215746.275349-6-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
 <20241003215746.275349-6-rosenp@gmail.com>
Message-Id: <172799847928.1778189.17633670027886493277.robh@kernel.org>
Subject: Re: [PATCH 5/5] documentation: use nvmem-layout in examples


On Thu, 03 Oct 2024 14:57:46 -0700, Rosen Penev wrote:
> nvmem-cells are deprecated and replaced with nvmem-layout. For these
> examples, replace. They're not relevant to the main point of the
> document anyway.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
>  .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/marvell,aquantia.example.dts:59.25-26 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/net/marvell,aquantia.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241003215746.275349-6-rosenp@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


