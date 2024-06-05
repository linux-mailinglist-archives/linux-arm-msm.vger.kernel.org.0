Return-Path: <linux-arm-msm+bounces-21816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2158FD7C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A826EB21FBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E1B15F3FC;
	Wed,  5 Jun 2024 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldgo0sg2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218EB15F3E7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 20:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717620437; cv=none; b=IOvmyTqHn8bGGpHtw2r1EWeMuJdInCq7kDNwNIVq1Y0ASdGVnR32oeSsdqm3x1gHRBgUymQxSBto7HgBnSYxmsF4O3vWEVKw+HYI6R2CYtUmU9NhNIeBV1WwpgfDCFa7kzfwvXvdiGDoXWB8DTzKPD54Pf/JJKAc7rFNvMUo+ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717620437; c=relaxed/simple;
	bh=8BI41uCdKVcKWitTctRndkwa07Fn4Wlt8jerH54lAjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUxbYzjxztTiXkJJGpGkk8gjw2b5z1qnyvwG4lGehegxy2tOalYdwRa+2kyZx3JODqYyxbWQge6QEP3rcrcHnrdeVSxnRJL4CCnhdbcUcVEbEVAJx0v1yOtFIG8AYbda9znIeCzp7NRUBdusWXGe4Xc24CU/zsQuVGpmzxIfZtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldgo0sg2; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a68b41ef3f6so23253666b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717620434; x=1718225234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8NQDMCzzDNCiNLexSmAdVkOBdGVVqmgplRKL+n9YEw=;
        b=ldgo0sg2MhG3W2mS/0YanwyE9XsF9Quo/L5uHQInKlMt+7Irbql+JECQO4gDwHbNRG
         WvLdCL+gOzPvPy3QitM1fz3PbCZI4tWbo33XzvDtVPO2dtLAzQfzosTCThzSTp95/i4N
         O2ov9UHWGwrjymN3cqcRJND9dy3EswIdftE2RuXPlJ3nCOQppD30Pn2zHvX3Cwv8n1Kl
         g4yvxjHhFMvucH+f51y1YS+mXw9hXlJnYHlVC60EftzsBHa7trSSrl4wSmUTXYChnasj
         ymTB28ACzXEo0NBgFp1PdDezMXog0d1o6w+c2kVfMo+MGNo+MlwDYyeL4ssp4QrIBjrC
         UbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717620434; x=1718225234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8NQDMCzzDNCiNLexSmAdVkOBdGVVqmgplRKL+n9YEw=;
        b=NaDf3W8De7rNONwh6oe4TpLtGAROBDb/ibd1Ylc3N+WIFPd1PCNzq7oV9fC98hlsH9
         8kxjcXwiBBj/t1fN/w37lqX1kTg5bVmYQL+phy0ytiORD+za8jVw3MrYnDZvSfrVX3Cl
         gicAi6vn+9v8qOg3oMB0vz/lsjx5eOGLs4SO/0xgH6QOhQ7UpxjU8eATqD7pKZcLtnh6
         CIpQO0u3SevXI2lZHPxnvZHwvRSYvMWE98DvLQFZdNM81y1U6ptV09Pjmcg+DNrsmPRp
         mQ0FzEhnjWTnz1AmtHOPjRLMwp/IljaGSezz9angfYdMlq1XaC7SL27ASTU4AqFFio8X
         rBvQ==
X-Gm-Message-State: AOJu0YyeJ4PV+RhS+HG+Bzbo+Aulc6tiK9UX1cWvVRkMUDvFC4LaTMWr
	GB8Ih12jPstsxcxqvxgzJvvLalZ1e6y47GEbUTTZSxwgTuoaFeamKFCdxdM/rOI=
X-Google-Smtp-Source: AGHT+IGlySH+nFrMigDOjqKimRasyOeK/KWw9CMIiLvpKZ7Z5M5gTzhQ1fRxxVCMJHA8/C+CaCDIHA==
X-Received: by 2002:a17:907:3112:b0:a68:795c:8cf6 with SMTP id a640c23a62f3a-a699f87f0b1mr197933766b.38.1717620434343;
        Wed, 05 Jun 2024 13:47:14 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68ae9bf7e2sm705653466b.213.2024.06.05.13.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 13:47:13 -0700 (PDT)
Message-ID: <3470decf-de1e-45d2-a871-4b77317f9018@linaro.org>
Date: Wed, 5 Jun 2024 22:47:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650-hdk: allow more IOMMU SID for
 the first QUP instance
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240605-topic-sm8650-upstream-hdk-iommu-fix-v1-1-9fd7233725fa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.06.2024 1:43 PM, Neil Armstrong wrote:
> When triggering I2S SE DMA transfers on the 6th Serial Element, we get
> some timeouts and finally a fatal SMMU crash because the I2C6 lines
> are shared with the secure firmware in order to handle the SMB1396
> charger from the secure side.
> 
> In order to make thing work flawlessly we need to allow more SIDs
> while running our SE DMA transfers, thus add the 0x3 mark to allow
> the 0xa0 SID to trigger while we trigger an 0xa3 SID from Linux.
> 
> This crash doesn't happen on the QRD platform since the SE6 is
> configured differently, with FIFO mode disabled, thus GPI DMA
> is used and we cannot exercise SE DMA on this interface.
> 
> The crash only happens when large tranfers occurs (>32 bytes) since
> the driver is designed to use the SE DMA in this case, and there's
> no way to mark the SE DMA as disabled or mark the GPI DMA as
> preferred since the FIFO/SE DMA will be used is FIFO is not disabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

there's only 24 I2C masters on this soc, surely the board designer couldn't
have chosen another one for the charger..

Fixes: 01061441029e ("arm64: dts: qcom: sm8650: add support for the SM8650-HDK board")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

