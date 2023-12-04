Return-Path: <linux-arm-msm+bounces-3239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ED80323D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03B9280F19
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 12:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404712375B;
	Mon,  4 Dec 2023 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="An6Nqerw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0BBE5;
	Mon,  4 Dec 2023 04:13:10 -0800 (PST)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C0E1766022D1;
	Mon,  4 Dec 2023 12:13:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701691988;
	bh=tYd+006RlkhE3PTruMujBJkOUxyMROXE4vAkt2e6WD4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=An6NqerwwhgGfO8PGeiYcMYDkkuGon45hnJi/L5mKU/QUdg8fXvHweDyu5ouS377l
	 MKZ6u1N7V2WC5ff3OfmXddClu7wle9xb4uwQ0yBIGJ/TuJs2rZBRt5Vs3yvhbwLVll
	 K6x+zpiw3JjZkGiFIt82WgE3fbPpLsR2oN+Wzna4S+YOr805gK0P8Ky6C8jdfl3x9n
	 r+oyS8WKSetKFh7uLlkoA2V/I8OEmpjA1T7RDXZiNd+khnQDR43UO15PtIPpI4f9hy
	 7d2YQy5e/pSWd35k0m8RC2l2iw2xccJQkAGzfcDK9oNhacXJFDNCfkDdvvd3ZiSj8D
	 RDMhW/jizj9EA==
Message-ID: <d03bf5b8-d4d7-4080-9af4-17b31ef6c72b@collabora.com>
Date: Mon, 4 Dec 2023 13:13:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 03/12/23 18:46, Krzysztof Kozlowski ha scritto:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.
> 
> Cc: Andrew Davis <afd@ti.com>
> cc: Andrew Lunn <andrew@lunn.ch>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rafał Miłecki <zajec5@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Konrad Dybcio <konradybcio@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thumbs up!

