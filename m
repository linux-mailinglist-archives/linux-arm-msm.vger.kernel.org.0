Return-Path: <linux-arm-msm+bounces-1998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C67F8DFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 20:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E16DB20FDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 19:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC24E2F86D;
	Sat, 25 Nov 2023 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="HI8sPjWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A759DA3;
	Sat, 25 Nov 2023 11:33:49 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5E2C32EF;
	Sat, 25 Nov 2023 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5E2C32EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700940828; bh=t6CfNN2Z8X5QY5A5KOdO3deQpJm61wgO3/ulw3bk6T8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HI8sPjWpWXJ+tKUEs/C/KfnLll4zPcwZBo+FLGeMzciNTwTO7K8O3z9GziJib49Tl
	 uYW3mXodk1C/2mS87I4QRWMZTXrzAhES8XZD9CLFG6rXQ4YESejjd0Oe7BYLFACboA
	 /ZSyhKd0VaY5Pnq7CaonASA88352gX5481Ldl4Lco9NiBBBpJxwzPcTzEn7zbny8Px
	 +fKOvn1NKV3myLst7a0q6xQBH2wbF2N1Bz2m/DjkMpyJtRTBDLRRVlWmjQVd2mgqbr
	 FiwwKTk5kLrpO6ROhVX50aTLOc5vNmA/1XnKWcb/8kBJmTZvzScP0VF5yBPfJgDQZ3
	 7F9SUI41fxu4Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Davis
 <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof
 Johansson <olof@lixom.net>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <zajec5@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
Date: Sat, 25 Nov 2023 12:33:47 -0700
Message-ID: <87v89p1vc4.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.

One little nit:

> diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
> new file mode 100644
> index 000000000000..e374bec0f555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst
> @@ -0,0 +1,194 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _dtscodingstyle:

There is no need to put a label at the top of a document like that, I'd
just take it out.

Thanks,

jon

