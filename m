Return-Path: <linux-arm-msm+bounces-8120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8B83A946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 13:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1194B244E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEDF63501;
	Wed, 24 Jan 2024 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTdGRbzQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C173634FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706098260; cv=none; b=cMpahUz07rwSqhNXo+5BxCREHjuGWoGkt+XM0g0zV6cJgb6Wgo+FZR8b+rO33E/TKtyu2IIA32ehV+ReCjwrQeUfHOY9jCD8SvdyPd+VU1FCJIkQjJ6c5yVu3uj5A3MS3XV7LOz/rFJIM1JevopcDoqAJrOv+NvfGw6jKKQ8wd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706098260; c=relaxed/simple;
	bh=hBBe2xh59Q4+C63aRE6jewMWx0A0Jwfw4ICW1/4xxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmUanCewKsSYfT0OJ5AXFeYW87wguR4kawR1krqWFY70F2jM7sRD3ZkGjaY9M6ukj3LUSBeN9phhe0Pw4/TQ7DIVXC/KOR6Kgm8t+sce+VmukAI+aQWaRcRKs+dsCNTbmvX+pbeTNjfkRURWndpn4DWRymQytaIF++cjMY5WnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTdGRbzQ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf2e4eb85cso1080381fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 04:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706098255; x=1706703055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxqLYnJl0Q8qohdE/H5PX6zIbzKF8rVClXxhczfIt+Y=;
        b=aTdGRbzQ0IzNOcCw53gXx1ONy4dFroCtZUnBDZ/1TO01/PXtmHhwT4JlaFSPKR51Sy
         BkECo2AEkDzNhZicocNjDKZr1iTgq95p34vHI3Jgw5Ek7uTu+gpL7K6kfDwtIRNjlwoR
         jiQmEF8TevNI3MK9ehy5rF7QVzS/DtqYVCuVQ18e5q5snnh/zvUcABiD4j1zU35wdOWW
         XcFXgxcVZXeu3uyIH4MXyvjSSCKFLekxR5A/HKdZpBDlQZm8qOIprThZT8IVKLJvNDrt
         QChnb5bkk6HeAT/qBqtcOqXQ/od4HIO2g8XWWnt8C2fs6YSPMQ20SA2bM71JvjRKv/Ih
         NRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706098255; x=1706703055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxqLYnJl0Q8qohdE/H5PX6zIbzKF8rVClXxhczfIt+Y=;
        b=FTKh8ELTtlh3eD+pjddDnGetUzADL4KTAaz2k6vp7s4OZyqHWBnUhY+oe/Q3MCufF/
         yTqxE7LGUk/4BNIGHe3SVAvJ6ofCJ4TgF+7QjG+4e7Cmhr/yxi3rE3S4aW1NTLmLrV7V
         7U5J63bXN8oZvDPO1wPXFHobwQuvv/3X8w1c1sTqKG4bMOavbEpKMaMucO6BsIyUeRc5
         NMlzWccdu7/BNwkNoxnntTFEQy0Z4GVuG98iMId5Td/BGtxHsaSJQyq83IXueciaHphV
         E1tmZ6iY36QB+jM/eoxdg2KkcNk4F/0nISDHoB0AJhNc22tquZ9Nq49cFibTHH/+Czai
         7Qeg==
X-Gm-Message-State: AOJu0YxpIKI9RbzOy8P2WUNs8bsuq1+4HHzerqyqZ5HGqBbFFhICQddr
	pgZPIHt/BPOMLF2mrkv7vbS8jmsVmzXEJ5flA+SdBReo0S2fc0bNhPhVyaCP+xc=
X-Google-Smtp-Source: AGHT+IEaLmOyU1xEoCIKY6SDGgPvE9yM+XwFW3GAikfxY2Ntww+EkTI1EUX72zmAXJwNZw0kGholAw==
X-Received: by 2002:a2e:87c9:0:b0:2ce:19d:211a with SMTP id v9-20020a2e87c9000000b002ce019d211amr681590ljj.62.1706098255309;
        Wed, 24 Jan 2024 04:10:55 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c3-20020a2ea1c3000000b002ccdb771df0sm3869539ljm.108.2024.01.24.04.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:10:54 -0800 (PST)
Message-ID: <5192c3b1-46fd-455d-aa67-b05bf5c54e19@linaro.org>
Date: Wed, 24 Jan 2024 13:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-msm8953: add MDSS_BCR reset
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240123-msm8953-mdss-reset-v1-0-bb8c6d3ce897@z3ntu.xyz>
 <20240123-msm8953-mdss-reset-v1-2-bb8c6d3ce897@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-msm8953-mdss-reset-v1-2-bb8c6d3ce897@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 22:03, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add an entry in the gcc driver for the MDSS_BCR reset found on MSM8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: expand commit message, move entry]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

I found some more definitions in lk2nd

88:#define  GCC_CRYPTO_BCR                    (CLK_CTL_BASE + 0x16000)
106:#define SDCC1_BCR                          (CLK_CTL_BASE + 0x42000) /* block reset*/
125:#define SDCC2_BCR                          (CLK_CTL_BASE + 0x43000) /* block reset */
150:#define USB_HS_BCR                         (CLK_CTL_BASE + 0x41000)
155:#define GCC_QUSB2_PHY_BCR                  (CLK_CTL_BASE + 0x4103C)
168:#define USB_30_BCR                  (CLK_CTL_BASE + 0x3F070)
189:#define USB3_PHY_BCR                (CLK_CTL_BASE + 0x3F034)
190:#define USB3PHY_PHY_BCR                 (CLK_CTL_BASE + 0x3F03C)

Couldn't find this one though, did you confirm that MDSS goes off
when you assert it?

Konrad

