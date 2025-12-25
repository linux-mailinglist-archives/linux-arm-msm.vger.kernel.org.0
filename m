Return-Path: <linux-arm-msm+bounces-86615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D8CDD8FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 10:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FF2430078BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 09:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAA93161A0;
	Thu, 25 Dec 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CT8cZl2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF283161BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653673; cv=none; b=MQ7PHdDyJIL+LAd0qVmSdO/CDU+lgciHUoyvqeD0hh5Lop+8y7uWPADM86FwIOvLrEs4Hc7Z9wE/GFqFihRG4/WnFesCsz3CIN3y7fdnbzfH7OTIMmESPDV/mnyW4ut5A2Brp0SCv/4JwM+NxTud6d4qlX8s/F3XmhYQAnX3fAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653673; c=relaxed/simple;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ve67gorMuUtf0nT/SbW5ePt6h0IEAeZ07yId74XRpeamZANFROrBVLJ9PKGvw9ID8+dRll/lSEST3Spl1Z57HWSDxR0evTb3VX5aYo9Uvym1KmkcfAWrIgNQ+F+NQnF2jr/Pk7YBN2ezXTmeNdQXpp80NdBF+RvKoX46CzYUv14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CT8cZl2u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31D8C16AAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653672;
	bh=hZc1+DU7BxaZ0pHjHw8/tfR/Nq71rMC9Z07diFqHTEw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=CT8cZl2uFKLiTpaQOQBp9gYmCflZEBYDeYfJB/2enatbFWeqPj6/ldI8cWJeC2hxj
	 rqgDICrR1nVDeyu0zbuJZiULKiiPUMu79YfHcDbOGAmgD4b9eV8akAOe1m0DcvTlB+
	 XOiAmSVHMcqj676aNSLd4X35T2IUpDCWLOKMJ/4NhD/sM+6vsUso+GxZI2UIt/yZ4Z
	 koo4vF8fZtJI2H1LW1oY6DvYpOPYJWlj7IlYMFyv+PzR3MAtThGqDIbh69Bph9I9IO
	 Gb6TLDUaEiRhiI7y+k0bZiMMw2PTd6/MM1YU4jN226aHcHLSFqZLN0oOl17hWq5Sij
	 8iWe4DrFAmjHA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so6843751e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Dec 2025 01:07:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/XnMsvYoQDxhrnP3nI2gIYiDp/xmFx4v4DmXfCBJ4BUt6yDDyAeqEvVQdqpnsrZX8RLLBcLOc6z5eyGoO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Xof51FxAiPlKvnZghxBurKnOkwpEB5MSm4eFDaBud1lNKzAj
	qDdNR+MS42VKeHfJqKFm1W5k3Hqxjlq3R3nGUumjMwvGt2ogz1N1zEvjCQxDAAaIDdhlRIPtjYs
	mRsnUw3Ndf0WrzK1EOevehWX5NXyWsgo=
X-Google-Smtp-Source: AGHT+IHfPWz1heWtm82AOh8ny5sgT9kzx+lyzDjyJcBgqVf6WZJpwpmEyZeQVabkjvt5oV4xlzU03UcKE5H1xk8UgF0=
X-Received: by 2002:a05:651c:1470:b0:378:e0f3:53c1 with SMTP id
 38308e7fff4ca-38113275820mr72648701fa.18.1766653671109; Thu, 25 Dec 2025
 01:07:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212231203.727227-1-robh@kernel.org>
In-Reply-To: <20251212231203.727227-1-robh@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:07:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
X-Gm-Features: AQt7F2qwpZzDsTD1g9DqdU3xoJFe0KlIMNtkshCEa1nlt61s05fF43c85tHciK8
Message-ID: <CAGb2v65Pt=c7rNtE-u7j_=SbT4DLw03iOw=PFchbisPQenhOtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused includes
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Peter Rosin <peda@axentia.se>, 
	Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-iio@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, imx@lists.linux.dev, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 13, 2025 at 7:12=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Remove includes which are not referenced by either DTS files or drivers.
>
> There's a few more which are new, so they are excluded for now.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/dt-bindings/clock/oxsemi,ox810se.h    |  19 --
>  include/dt-bindings/clock/oxsemi,ox820.h      |  29 --
>  include/dt-bindings/clock/qcom,mss-sc7180.h   |  12 -
>  include/dt-bindings/clock/xlnx-versal-clk.h   | 123 ---------
>  include/dt-bindings/clock/xlnx-zynqmp-clk.h   | 133 ---------
>  include/dt-bindings/dma/jz4775-dma.h          |  44 ---
>  include/dt-bindings/dma/x2000-dma.h           |  54 ----
>  include/dt-bindings/gce/mt6779-gce.h          | 222 ---------------
>  .../dt-bindings/iio/qcom,spmi-adc7-pmr735b.h  |  30 --
>  .../dt-bindings/iio/qcom,spmi-adc7-smb139x.h  |  19 --
>  include/dt-bindings/memory/mt6779-larb-port.h | 206 --------------
>  include/dt-bindings/mux/ti-serdes.h           | 190 -------------
>  include/dt-bindings/pinctrl/mt6397-pinfunc.h  | 257 ------------------
>  .../power/allwinner,sun20i-d1-ppu.h           |  10 -

For this one, a node is present in the DT, but there are currently no
references to it, and thus no users of the header.

Also this chip hasn't seen a lot of interest after it was initially
brought up. None of the peripherals that have a separate power
domain have been enabled.


ChenYu

