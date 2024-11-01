Return-Path: <linux-arm-msm+bounces-36693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF39B8C83
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 09:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD791C20F06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98005150994;
	Fri,  1 Nov 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqgarssz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DB117C91;
	Fri,  1 Nov 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448028; cv=none; b=rKDYKzTJEkpuhkW53uLzn3PGOpc6ZaGRCcpr3y/buz/zfOLK5H7H/nEHUcFTk1DC2tUEAWoHDqFuIOCyt1N2uZNOG39FG+sjV26L66FTd14N4DBvW08oFYQxDdnxAQPgZNGaEPduwA80gHoQ2wQ/GYsZAqSeicWmXx1m5xAhu9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448028; c=relaxed/simple;
	bh=M5wGyoj87XjZ9EpojGAJCvyuvik1ystP/e5RlhITVLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIeSsGUjTy0afk0EnFsaBCBwKlMnyN1LaQBZGdmxD1HC1Q8Bs8RTB8FHurzjQ3eP3SYT/OudFVTNKjpOD6WsUHl8PYV8k3hg/KwI0Homxg1xpmR7Ih+uEwBt8PoTpEznER/Cqpx+RjYttsZtCDdygddwzrVJI8P7SVfBEMV3z6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqgarssz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5400EC4CECD;
	Fri,  1 Nov 2024 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730448028;
	bh=M5wGyoj87XjZ9EpojGAJCvyuvik1ystP/e5RlhITVLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KqgarsszEIyOBGOkMaXsNo+lc5V3lUAoVZC5ZF62BYCkQUeWSGNJqcWffHrEvCmvk
	 QT9gh7hSFggFW9L6g8hzvKf2071DIwzFuZ3+PIJ0o69DJ7idPXRWQ6luWhWMbCbgV/
	 wMjABcSka4kkG8COwPL4ib3fJ54PrFHQ+uLJJr0mOEn8aP6X2G8LTyiWB3reUhkqZi
	 PZGMG/0IrYjMfG0X7G3oDwo3H66s1Ig+iyqFHv9HZHZJQ8A3Dr3LkDhO6zfdsaJM7L
	 0IW/zsqL8eufHYzUuAmdLQFWow/e4wFuLU+eA7RXzzzyl4rkl/nu+cJi7sAmG8IbHX
	 XTcvswPfJpeng==
Date: Fri, 1 Nov 2024 09:00:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/10] ASoC: dt-bindings: add wsa881x-i2c binding for
 analog mode
Message-ID: <5idkusmyyhdqovsfzou7b7qj36kpfidehn5sro7tzghawmw2oh@7sbuqap36xa6>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-7-alexey.klimov@linaro.org>
 <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>

On Fri, Nov 01, 2024 at 08:57:26AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 05:31:50AM +0000, Alexey Klimov wrote:
> > Add binding document for WSA881X family of smart speaker amplifiers
> > that set to work in analog mode only and configurable via i2c only.
> > Such devices are found in Qualcomm QRB4210 RB2 boards with
> > SM4250/SM6115 SoCs.
> > 
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  .../bindings/sound/qcom,wsa881x-i2c.yaml      | 103 ++++++++++++++++++
> >  1 file changed, 103 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> > new file mode 100644
> > index 000000000000..51b040b134d2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> 
> Filename must match compatible.

Wait, there is already binding for this device: qcom,wsa881x.yaml. This
has to be there, it's the same device, exactly the same.

Best regards,
Krzysztof


