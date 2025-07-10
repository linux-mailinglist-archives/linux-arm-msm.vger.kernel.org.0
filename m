Return-Path: <linux-arm-msm+bounces-64309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE47AFFC68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 10:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49F301651AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 08:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402FC28DB74;
	Thu, 10 Jul 2025 08:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+9AUJLY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6AE291C0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752136268; cv=none; b=mxo6/kBFeaGnPXPWZByiny7jIL+Jv5DkkAucKTwHA/eMqSH5FVftM2nYJvNWW6lW50utCx3EqctU1vrjq09rNPaixaxP6q71nSf2DuLnAvfarxDG5XItClS1bGhBUA3XjxT0+GfX2s+Ydycqe18xbElBHORdbc2a8+ATK5BTHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752136268; c=relaxed/simple;
	bh=WsQN4AVlXf6DNHQIYvtvjyCfMrCxf4ucZTnCnKQt3b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pz2ajnoITL6wMxLWa5R43stKm2+Cm1I+DroywRFdX7gAriiMokL8cCzDheGrCAtn6wiGxfyYmYAyiyt/In8yZFcWdkGYxn+CRkyXRbJF8/BxYxyWBXL1LJSpfERoAgNIW9TfaBY31uk2H/HuPiNaOidN0Ni3odrSLSvGqyte0v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+9AUJLY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1173528f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752136264; x=1752741064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5T0s6fRLYxxIaq2WBuc24+EuGA04MXZWrPntdjj62uY=;
        b=B+9AUJLYIUhnl0qNNMX55i3vni60O4/XCDQtqtVuYCjQedkG36Ms+VH+XCI+hdKffv
         +8rlRKVElXT63CyJzPOmMdgpJK6E78h64rMc5of1YmhR9U20HyFXuqseNDRu4PKcIdJE
         N2PowUeZ6tcxQU96noBm1Ay3RNASx6oIrI8JXKiC1SCTfriRlO26h3AN/bmPT2eZrHvt
         67CYR95Oh9R2VD6APhnR7QaS9dG8X4Zqqd1vqlUAfwmlGNw/z6Z1BL1X4cVarMoCNtr4
         nknxCref+kIUWqV/yF6poS6qMGM67jsINIbjgP6IeXzhXRNShwTmSpvewgVvOhFKGaGf
         pOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752136264; x=1752741064;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5T0s6fRLYxxIaq2WBuc24+EuGA04MXZWrPntdjj62uY=;
        b=LGf7Mm6ZHARuHXj2E3LZekzk3fw6nIWsl/G/b8dMuRYpriDpIDAY9d3hhXg7yniXIe
         GfzobgrKJcQdYW2exM62yDQCvH62vurGgW/2Boi6Ck2ChxhDlyo/MU4gFmTy1viGYyXf
         1vW8wcmjha+SrQsVaWAzgd4UGotNaOlqzbiF9c7LsqZlcXrNkWOCnZiCPhQfYG+NlSKp
         g4YfluAZdvXvzYflAU0b7ubVxIGoNze5YGqM99Z2591za5X/pLhX8GVK1RL/lTMUzWiY
         Qz8i+Cn72F7XPRh7kZk9FLHj3v+uTkdkK3tNvLcDdMV22bT7wFGFRmdMqPaqp5UWAN0b
         8RQA==
X-Gm-Message-State: AOJu0YyKypXLlE64VgOIuyuIgIuSgIEkZ40hc5o5EjNiTwppxuc5G3hq
	9nJyTkNAwK//lKPpt+pJyga+AOF2Bm4UehV2EUZoEsyV0i+cNlCyb1daxECn/jFK91h+V+d3WNe
	fbQK3TC4=
X-Gm-Gg: ASbGncsISL8MhRB6Ueqg6/2BvWm9ZpdvhNnhJfl9LeWgp8BelUJKZTC/AjF9uVckeaT
	IoocTl0lEReT2KkKjowAJoQrYUUO8WvykxWZw+Euxu/OIAeNJpNKeiXfcMrl2aSaUrPN6hlsv3P
	lL/hEU9Jy28VD+/IddwPZdCaHg8mnLSopIqwBU1jpb8IWOt8xQBlVDuCoVbgThTTjis+TtoYlVT
	04saYliU9E93hbrT5qOrZmP5bI5A75sc5X1ySeBL1J74KgzQMil1VSFjxkWl0yw63+iJAYMQ3IR
	FVM8S+vDUShS1C0cV4udvgOHKVqHNfWn8TskcOu3NMqsxZ89p8mpBooiQ1cVl1W7r6Z0PtIz5Ux
	khSJfLT36D0Mia0ghDYvBMM5ajI0=
X-Google-Smtp-Source: AGHT+IFU0Q1GT8CthgyTMpfXzMuRqsidgoW02v5oz+3a7iCJdRIC1Om/NLFfrvO3zbka8NSBVQRzkA==
X-Received: by 2002:a05:6000:240e:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b5e7f13a0amr1817266f8f.12.1752136264447;
        Thu, 10 Jul 2025 01:31:04 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103082sm49616575e9.29.2025.07.10.01.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 01:31:04 -0700 (PDT)
Message-ID: <102359db-8126-4379-aef0-86617d174110@linaro.org>
Date: Thu, 10 Jul 2025 09:31:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: x1-hp-x14: Commonalize HP
 Omnibook X14 device tree
To: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
 <ikWa9Ih3mm9syAlXHTPoLiEwAKXm-3TOHfErQcGGx8GwtsYean4OqEnm_gHgnAJZyejUXUY8uxRamsl7EkeY4w==@protonmail.internalid>
 <20250709-hp-x14-x1p-v6-2-f45cc186a62d@oldschoolsolutions.biz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250709-hp-x14-x1p-v6-2-f45cc186a62d@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2025 20:26, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Commonalize the HP Omnibook X14 device tree for derivation of Hamoa (x1e*/x1p6*)
> and Purwa (x1p4*/x1*) variants. Required because the device trees are not
> compatible.
> 
Commonalize is not a word, "commonize" isn't really a word either.

Any of -> "aggregate", "unify", "integrate" would do.

---
bod

