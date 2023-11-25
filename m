Return-Path: <linux-arm-msm+bounces-1948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 615E77F8A91
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 13:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90B841C20B4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DD0F9D2;
	Sat, 25 Nov 2023 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lOnznw1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98120D6
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 04:09:24 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00f67f120aso374404566b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Nov 2023 04:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700914163; x=1701518963; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgispGlB/Vogj3O2jRA/99ot46yAJSqn7bnbdiR7nmw=;
        b=lOnznw1Ghyep38crzua4Z9kh2vwjgL2zc/f5Ii9Db7+yRe2c7Z+p9No5U4lBNkf2Hb
         93WDVBfB5mMdEBfv+WHXWjtD5R8W+rM+ogrf7mIIAHB/s+DIV972DRKklO6pyuJ12Wh7
         4AawvzdKy3C2jQyQvndMgbGdtP43D1leicXEFwMAq9FNLtABIICnWk9VLt+ZFcuJU8Ga
         hLrUePE4jZW44ZytIR11pxBvq0j6kmEEFwBDlrt11v/+CP9a+fhOZUTThtujjFh9KHXi
         1sQLtQ7UeQ+ZIH6tlvnWAutXg9bbaYjTcJyl+oHuKw8lDWRaPSrDi8SdFGzAoxMbFJrL
         Qegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700914163; x=1701518963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgispGlB/Vogj3O2jRA/99ot46yAJSqn7bnbdiR7nmw=;
        b=PO20mEWPcZDasiiRC4pBd1eTvyH78Mtqoxh7RtoRbQ6Gn6uDNuUgsjR/ecocUeJXH/
         /NRS9sxKWGadvLPF1PMBcs8rNyHkEMUOhySEauT2ORGVGbohasx/eUA0UpPfRLCVe+jy
         zmMtujx5GT1AmHbE1i+poLumOxnVI5AqEa7QBNrw0QWxIWW4jZNWVNqX4Wg//ZuwxmbA
         +cpQuVIYeRV94QOHzF+W09QFFkEg2wcmhzNXxnWo2U8eB9DmXp5gYExcDlJuKLwb+/oL
         7YWuMUylb4QJdek8iAipPEPftWn7ZQ1SX7lu06/I0HmF+yGlxCed1xXHzibAYlr2J3dr
         8nRg==
X-Gm-Message-State: AOJu0YxkqIVRJ0SiGRchZmGqnh+NCsgnBjLnb2lYsHNu+OvBEnCHIq8q
	yk7U4pvjX3an1i2PfRQrtsqFew==
X-Google-Smtp-Source: AGHT+IGEK5umheP6JPfzRi9HgIdCTuo3lZLa9hajwZqnEDRbtozQjh9YQQAf4l7Q4ZpR0YTAUnrzJA==
X-Received: by 2002:a17:906:2c4d:b0:9d4:84b6:8715 with SMTP id f13-20020a1709062c4d00b009d484b68715mr4095357ejh.52.1700914163075;
        Sat, 25 Nov 2023 04:09:23 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id gw4-20020a170906f14400b009e6af2efd77sm3347884ejb.45.2023.11.25.04.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 04:09:22 -0800 (PST)
Message-ID: <0f7e96c9-de56-415b-bd26-86c7a612dd46@linaro.org>
Date: Sat, 25 Nov 2023 13:09:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] Add a compatible for Xiaomi Pad 6.
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, Luka Panio <lukapanio@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <keescook@chromium.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231124212732.731419-1-lukapanio@gmail.com>
 <2023112529-fetch-unwritten-bdbd@gregkh>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2023112529-fetch-unwritten-bdbd@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2023 07:53, Greg KH wrote:
> On Fri, Nov 24, 2023 at 10:27:31PM +0100, Luka Panio wrote:
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Luka Panio <lukapanio@gmail.com>
>>
>> ---
>> v2:
>> Update commit message
> 
> What commit message?  I know I can't take patches without any changelog
> text, maybe other maintainers are more loose?
It was there the last time around, sounds like whatever was used to
generate the patch files got a bit drunk

https://lore.kernel.org/linux-arm-msm/20231024063740.4975-1-lukapanio@gmail.com/

Konrad

