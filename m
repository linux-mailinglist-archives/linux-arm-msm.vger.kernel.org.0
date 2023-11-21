Return-Path: <linux-arm-msm+bounces-1309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E687F279E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 09:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55281C21880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 08:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17E11CA95;
	Tue, 21 Nov 2023 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZAa0zWn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0F4D10C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 00:37:25 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso23184985e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700555844; x=1701160644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z790m+3SwlbSCiaOH+BvTtx4PQ5yguF5fZQZ5wj8mgY=;
        b=ZAa0zWn9SSq2EbOweeniQSF6gOCF1RRfI5MHCLpzNwMzAxMZ1Nn4qz00ae3SiCWkSP
         tTn5bh91c9Pz83fAUXzrMCVelbMt4jK8oUFQUszOJrZBL8SSPkgkYv7dhUzEQkrI0dZh
         o1RIK4GzMyf4cjKnZpyCEaTRBljzOZGLT57YitQP4GgK7mHJYFGYiDdnVHLvgXbkxZU/
         uMushnVj9/POzAVdnkpa4hvJtGAQmXnpMfg4sKN2DOmE1v3PEvvezC7KzLngmzRwvYWA
         0gitZC2Si7DQrvYAWywZKEWtQFKM89O8YgORZ001Qqe53o6rzsPCIEaV0nz/CO8Ad4BW
         uAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700555844; x=1701160644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z790m+3SwlbSCiaOH+BvTtx4PQ5yguF5fZQZ5wj8mgY=;
        b=WioueurxN4iUiY+tseHTEZZcjMM3EXmAzXG8qXMWBVUGUK2b0Hq8D9jzZja3akUsl1
         R5YOrQe22Z+uN6bmkL2cyS3/QZZTndxPeA2h1Jj7KgkU5BAl/FHx3RFXI8gKF6jYWhXg
         tZdShJZzmrRrcOBQuXISquD6nqbOvI/Nak2Sr9l7OIkgox4vWm1vTcFV02W28M/V7OGR
         H89fCEVjmkEDQ0MUFKBCtYATtYX8MJoKNfIPL26TZ4e+wP71DCvyaYyRCGd0q5OJllGA
         /3mmknZmBSLD6TzyjRpyZscIGv0/Ee6TyyeUzf1zc57CMhsN+b0WBWWDmjQ2n/dj/+PG
         1XzQ==
X-Gm-Message-State: AOJu0Yxoxxd8l/SFcAGDuizgo6pKU3QWHDYTQ2RKnXM4zkOnJjp/oeP/
	h8ySlpv0uppNfaZhIpECx/BKew==
X-Google-Smtp-Source: AGHT+IGTBsd87x4sENU/2iwu6uDUJ+64QftToSw0vKAzDaIgWipBD48orJGrEkADIBRkLMNZ/WL5Yw==
X-Received: by 2002:a05:6000:1566:b0:332:cfbc:cb56 with SMTP id 6-20020a056000156600b00332cfbccb56mr121185wrz.5.1700555844116;
        Tue, 21 Nov 2023 00:37:24 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id d19-20020adf9b93000000b003316eb9db40sm11535730wrc.51.2023.11.21.00.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 00:37:23 -0800 (PST)
Message-ID: <ec901578-95b6-4fcc-a8dd-e927b7f77ece@linaro.org>
Date: Tue, 21 Nov 2023 09:37:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <19358871-009d-4498-9c13-90d5338b1e9f@amd.com>
 <76fa8f61-fe31-4040-a38d-cc05be3f4f17@linaro.org>
 <CAMuHMdW4WPJT0Km7w8RWrGJaztk6QDGoFAn0bdGbrEsw81R1FA@mail.gmail.com>
 <acfdce81-f117-4a1a-a9fe-e2b4b8922adb@linaro.org>
 <bd49f17c-7ebf-4e19-b77b-b5ec95375f7d@amd.com>
 <b48293f3-16e3-4980-b900-add0cb7d69f6@linaro.org>
 <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdV_gqmf2=cXmZmYgE3aLxvPBr1DVp0cz0C+YrfBVG-8mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/11/2023 09:08, Geert Uytterhoeven wrote:
>>>>> I guess there are (many) other examples...
>>>>
>>>> OK, I never had such in my hands. Anyway, the SoM which can run
>>>> standalone  has a meaning of a board, so how exactly you want to
>>>> rephrase the paragraph?
>>>
>>> What about?
>>>
>>> 2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
>>> entire System-on-Module). DTS if runs standalone.
>>
>> OK, but then it's duplicating the option 3. It also suggests that SoM
>> should be a DTS, which is not what we want for such case. Such SoMs must
>> have DTSI+DTS.
> 
> So you want us to have a one-line <SoM>.dts, which just includes <SoM>.dtsi?
> IMHO that adds more files for no much gain.

Yes, if this is a real SoM, then yes. There is much gain - it clearly
represents the hardware like we in general expect. It allows re-usage by
in- and out-tree users, while documenting this possibility.

We structure DTS according to main components of the hardware, which
serves as self-documenting, re-usable and easy to grasp solution.

> Users of a SoM can easily include <SoM>.dts.

Which is confusing during review and not a welcomed pattern.

> 'git grep "#include .*dts\>"' tells you we have plenty of users of that scheme.

Yeah, you can put C functions inside header (included only once). You
can include C file in other C file. But just because you can do it, it
does not mean you should do it. It's not the way we want to make code
organized.


Best regards,
Krzysztof


