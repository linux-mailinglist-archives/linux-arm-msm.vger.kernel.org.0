Return-Path: <linux-arm-msm+bounces-30964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE496DCC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9191F2217B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F3719CD18;
	Thu,  5 Sep 2024 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgN8GSJQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE57344C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725548090; cv=none; b=MkDeYdfD0yKXsrhWUXJeZKOZUS2hzQ3Z6iJtLMgk6zgDaWJkwcxBSIBAcayROkIuK6rafCehL22BN8ZRwu7mbaH6hj4U5oR/P2oZeHz02J3dUoAa84W0OmWUm4tXuGaBwk4P5VGhEM5v60gEhPZqymGNIcPSHchNzzxxdQKLGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725548090; c=relaxed/simple;
	bh=tOnyJWreV7XtwFVhcFtNxD7Tqs1oW5u/vVn7bF4Xiic=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z9NsnzN2wEyVQn23gje4hbgbVlwl5LKsAaZEnlXFksYAsfCwxoOwHf08/uZPaAfqdHX3Cc9rUqJehv08xJBeJjW4REEEe2S/mtqEMPBG+/W5kXsp8U32fAPTpKBDS3JG1YClUcsCblMjakbAIE4vSKzAToj4ASRXw4a26VQhdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgN8GSJQ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f3fd60259dso1045121fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725548087; x=1726152887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zElmk3sfGwQ+m2XSD0HQH0KyA41c/pIdozqVm+yLhAo=;
        b=dgN8GSJQa9vTodxKnRqt6vzR6qVQm/ZM72M51t2nzLFrkm56ceM9XDCWJstSn0Lfv/
         bQ4W4qZ9fHUzgUzsLg519pnMkxYLZuIBvHse2W9cNTO05e930Ta09uHC4uNfq+iu1r18
         fguKsJ29/iLCg1b8MNDl8hz9N1pl0he13iyU62rIGSwHa24jAhzNtLA5UrjxtJcDuGul
         DfR1nd6KV7vCoGXEhRf5MYY3LVr/XxNa3TJlue7u6d0d3JMkgDM+3a5SAlyxnOXfdxY5
         fD8L1061NxFU9u8sbmDX6/4+qSFHvHrbMdI4PL1iVjig5qXUngQp76N/ZgJc5cAkD3xD
         Zogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725548087; x=1726152887;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zElmk3sfGwQ+m2XSD0HQH0KyA41c/pIdozqVm+yLhAo=;
        b=VzZiqB40zaTYEuvuRoBvNbQOZOxZVZ1GCBFTjU2Kijk8/gd47BeYiC3ypUXfTj/ZzU
         /4b3BlnzpBFT6nv8IzAohGErT9NZFoQJYhnkhV3TsGgSMpxpSSPKmGqO4YJbRAUHHCUX
         5ji98qiQ1BEzRWivkvRgFRlFy6J/5AEzTQPlwxgcTmwHI5nezjeU8hBlS6MQFqy+hi7H
         aIHbpcI4voUR8E6T7lAtG50oXaa94ZnsNvmhWGTPirTRy0gidDHonqFanUCz1lf0rjWD
         W4uG90DO8bfmaymAcFm/gMP90Sbhds//WsM1WMGy2GhBDLZtl18dZvgOxcEcwuFStFvb
         uS8A==
X-Forwarded-Encrypted: i=1; AJvYcCUIrEwYdtoYu/9Okqm7hYvGaC/NaLvXp9FZA2P8ebzmN54xw8eRF7mnhLPtZc+8GWl/FezoCq9F9MYynHGq@vger.kernel.org
X-Gm-Message-State: AOJu0YxOcw8UUEWgQupZjlTPK2UJ26Sl2ISulS+0RB0Wm7SQ17M2r/3p
	YWZ6GrWlVFq5JdQbvvRl7JY3BH0FugrRMyftlftZkqXcjuixEhZGq9F+nMBHgCY=
X-Google-Smtp-Source: AGHT+IE9ZOX27DWxEVj62bPqXJGKaQ29pm3tZgytTzwuMo7b4S7gCbQ5DtOrO5L9VMNnFFtkYI2SoA==
X-Received: by 2002:a2e:b8d6:0:b0:2ef:23af:f1f2 with SMTP id 38308e7fff4ca-2f61e0c72e8mr84626971fa.9.1725548086403;
        Thu, 05 Sep 2024 07:54:46 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f615171d51sm28554161fa.82.2024.09.05.07.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 07:54:46 -0700 (PDT)
Message-ID: <c9e0a76c-b306-44ff-9227-9e471bd887a3@linaro.org>
Date: Thu, 5 Sep 2024 17:54:45 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] dt-bindings: media: camss: Add qcom,sdm670-camss
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-media@vger.kernel.org
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <20240904020448.52035-13-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240904020448.52035-13-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Richard.

On 9/4/24 05:04, Richard Acayan wrote:
> As found in the Pixel 3a, the Snapdragon 670 has a camera subsystem with
> 3 CSIDs and 3 VFEs (including 1 VFE lite). Add this camera subsystem to
> the bindings.
> 
> Adapted from SC8280XP camera subsystem.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

<snip>

> +
> +            interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;

I suppose it should be IRQ_TYPE_EDGE_RISING type for all interrupts,
please correct it here and in the dts change.

Here I rely on the interrupt type requested in the camss driver.

> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe_lite";

--
Best wishes,
Vladimir

