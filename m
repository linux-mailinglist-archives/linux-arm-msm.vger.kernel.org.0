Return-Path: <linux-arm-msm+bounces-9189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D138438D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 09:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DEC01F24DD8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 08:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038A35731A;
	Wed, 31 Jan 2024 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZCCnenn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41874605CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689449; cv=none; b=vE+dx+ijKu/BzB2UqcaxSYHYpN3QagHTiFbTIaWZdSiEtnciubkO88kYqRMXRvuC90UhcwmGpjyAwiad3mjZUqI0lrnzl6rn9pTR/7Hk+GkvERo/Edb1W2iZo+CVuMuHY8HWF9frFayv9n94wIryu2bK56qdpxjRdtUQmRcAunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689449; c=relaxed/simple;
	bh=75sndIUTzUtNxWCnrPju/oHTNE9Ss3F02UXpkvMgVpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmoEhTfdntQR3z4usAdMZxmIVjR7NC1qxj2GIM9mdumMCa/tyVmjZd6As+js6IESoJl+jvlY2XQYUX6MVZYHTunjq3Lca/Rsa4gszxUX8+/AwH4Tt/JCfmGyj13K4qKxO7wiGI9lcEIZ6WUun4YE2UV+iv9roOosrT9qQAPIGwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZCCnenn; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2cf4d2175b2so47527431fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 00:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706689446; x=1707294246; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UA1+kfqAYrYssLlYO/X/3vKAYthAW3kRn3f+bCv9/OY=;
        b=pZCCnennLPF8UoKBTODQ4+6sQY6Nra8FaOtrEaixZeu/8mv56WZgTfCpoaF1YHKF0b
         5DXTTFy79TIwLI77yptebjTMvSzj7xc+yCXK7/PDr66ZpKkY3TbnOu+1U1sYziwyHhM+
         NY+karDs9VxdZ5aFT3oaSp2YwQVj7q9Cy2Q+Gb81xklRrxoTLQUwYiU13bwHWY+MFw6a
         srPPK/iZhrt3yK3EmfI1v+nXI6X6P5PzAOHXdpscZAHsQB2+OnTFePEzPJJvTjq/TxlO
         QL9kxYsGJHLJV4HyZlouedHdRtlmakNP2EOlOgyoduR3y/+I7pKQVqHBvYoBmVNN9HZe
         OpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706689446; x=1707294246;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UA1+kfqAYrYssLlYO/X/3vKAYthAW3kRn3f+bCv9/OY=;
        b=EsdRBjtWbD+aJdSmU/ZXXtnHKr0c6w/ZwGe2BKBBm+0Gt20O9sy6ZmKM+wk3q1cPPi
         8LTjpd+++Q0aNaDqUVemECuUqx6EfiO2usVgEYBukdJWt5K9fhSzIBYaXqz0+8yW1B94
         ZfyUluwBA70hl5n5K3wmRQpO9jV0murlqRvA12hrOMqSjWBkAe4V5OJC0xhteeTJuSln
         nu0doaLtkcD5s8XYGzZFCXsoU4VIz4xBIqVu0bh4dIsCVtuaZfyR6M6vVnxybmozRtUQ
         86OeBRvTOdTvo9AsGEkcVDVTtFfEfINsRIEfRGFsBQ79q1VidYib1LqS+SqfeJIYYM/B
         QYAQ==
X-Gm-Message-State: AOJu0Yyefb3akFHTOCC/tWgOORvM0MFsv3Rg7DMpjlOn4x0UAn4Bm1Fu
	gZRWGgXZ+AaKJO08ivsuZvy5nhQbMswaLi0IS0jCK4ZiOVB2EfK9mmaPS3MuvL8=
X-Google-Smtp-Source: AGHT+IFQAHART1Odf6V/kTsGzEXgmmHw3CfghOQEtZ0wKJDEyS6lfV6ozwRbodzcjblTL4Y+dvKBoA==
X-Received: by 2002:a2e:a717:0:b0:2cf:3455:2340 with SMTP id s23-20020a2ea717000000b002cf34552340mr665224lje.20.1706689446272;
        Wed, 31 Jan 2024 00:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVe5m/55aIvBoysbc/G7Kqhg0rC0K2JlxaZQup3W3XcKH3XVsdStb9GWU5Ze15BOyrUpdtsqUr7ASxrrqJHKvdB6Pjk3jZIVkzS7DGyrPmqc2OYGa1HxNOhc8tbO+iktIYp8QilyHoaLFSF5flRpqa3DXWugsepv03cO6vEzbCWzYudjGCBk0zwZotgeJ/LPaJ1tsajomx4L6JTUFcDrDZHx6kePPS5eZ61CmVKuKMJApCZ1Omiix0unjNKitiBsLGVHjX48N3WaUBJkE2zT28dEuGWtk6AK+Jas8GZjuvl/g/ghsBe0Y7lagoxZvrK0Don9zF1Lhb8yUaDbk0804QaRrkLBM0eHeYVYIf7cr/qLaugMc6mcEZO8fAy/g/v/ZKHXfu1CxNgQWzsAqIUsqQC/qpIARwSsNh3syWdDVqYTq/qrzyImyEcF4OrxtDMaWkv2Hp+k6vAxfvCwg==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id en26-20020a056402529a00b0055823c2ae17sm5530662edb.64.2024.01.31.00.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 00:24:05 -0800 (PST)
Message-ID: <37cbc53e-9eb8-4e1c-9bc9-62d8861e3d24@linaro.org>
Date: Wed, 31 Jan 2024 09:24:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 support for PM4125
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240130-pm4125-typec-v1-0-e8d0097e2991@linaro.org>
 <20240130-pm4125-typec-v1-1-e8d0097e2991@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240130-pm4125-typec-v1-1-e8d0097e2991@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/01/2024 20:42, Dmitry Baryshkov wrote:
> The VBUS register block on the PM4125 PMIC shares the design with the
> PM8150B one. Define corresponding compatible string, having the
> qcom,pm8150b-vbus-reg as a fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


