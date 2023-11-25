Return-Path: <linux-arm-msm+bounces-2010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB47F8FC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 23:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93C92B20F0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 22:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5231331584;
	Sat, 25 Nov 2023 22:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqMijSsU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD6E119
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 14:24:56 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9ffef4b2741so403326866b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700951095; x=1701555895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKAE8m+7ShlD9mU1LCDDUsam3G8dOC6GVtW7kEar8Tc=;
        b=EqMijSsURen2spKnCQW1poZAicjvumegPbTHTDP6sdEZOJPeXmkbMgCVA+g3YFWxEt
         OzJ0dZaLli7bkhYiP0NDYAW3zcUBXPoSv+SQWfIunQH3CjHubnnkQvZeFElTROk6ZvlB
         8gN5wTeSjfr9KqYA/Fq7sSG5hMai67MjLxzbcfZ5NDPHz4pIrNbYrRflhGBjOK8hqaaW
         6X6L3l2JVOw+LZoyjdiNroQOKdCg+MZp0n6NWrAssb0T5aFO3u3JoLc8pNqeyv+60cIn
         giUzmyplF6WiyawmJNyY/33/Ue22NbRgH8OZW3xCJ6Y48lmC8DPuazOZQETIRIXjkwMB
         A0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700951095; x=1701555895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKAE8m+7ShlD9mU1LCDDUsam3G8dOC6GVtW7kEar8Tc=;
        b=mYrsJJMU6eUdgmBTAEuhTqKBu39UicsLIXYBXanpidg/rp0PYUu34R4OF32NoGF9Ym
         qvRxjz/AX0XF4/AkDHgPfn6saXxt29Vq7J4CXMOmDGhTpxs3nig9a6YizoTqiBcOrjAc
         MGK4xoazxL5i25fuFj8z8s0jrD0RrXc4UqbUd+N1tAcnjtumbzj+4mjjVSwEEk1J2WyY
         5FVyUP1EmGFULgTl9/Y4gR5+bpV1nKmuC9ulEwG5i70mbkBzdgTdCPCUEbMGGe/VfEVH
         om3dt28KFextrRyPgd38j8gW+2eY/a1tBAnPuxKksvOSaMBbaV2AxHZRgpOGfDATWTQY
         5s4g==
X-Gm-Message-State: AOJu0YwClGlF6v+1vEx/ZQrxp4J5+uB1e+A7q+VosUsCzPVZaIt7EGSG
	xfostYVIseh5edSJC5IOYAgHDg==
X-Google-Smtp-Source: AGHT+IHuUyOggoOV9rwZMx7Pl9mYiZWI2U1vdaXQZtSxtbz3U2UaIsaZz3GqcbY0MyoGYPyQbjFpNw==
X-Received: by 2002:a17:906:2246:b0:a0d:35d7:b14c with SMTP id 6-20020a170906224600b00a0d35d7b14cmr705313ejr.6.1700951094765;
        Sat, 25 Nov 2023 14:24:54 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906500700b00a0950451affsm2561765ejj.67.2023.11.25.14.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 14:24:54 -0800 (PST)
Message-ID: <99190f51-59b5-4326-8c02-35529c280c2e@linaro.org>
Date: Sat, 25 Nov 2023 23:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <20231125193737.GD7486@pendragon.ideasonboard.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231125193737.GD7486@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[...]
>> +
>> +3. Unit addresses shall use lowercase hex, without leading zeros (padding).
> 
> I'm curious, what's the reason for this ? I think it makes the sources
> less readable. If the rule is "just" because that's how DT sources are
> written today and it would be too complicated to change that, that's
> fine with me.
One more thing not mentioned is "no 0x prefix" (the unit address is *always*
interpreted as hex).

Lowercase hex seems to be (in my experience?) the consensus for everything
except preprocessor defines across the spectrum

No leading zeroes.. I guess it was just eye-pleasing for people that have
been doing devicetree to date, myself included.

Konrad

