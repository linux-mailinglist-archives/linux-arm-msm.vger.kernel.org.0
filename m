Return-Path: <linux-arm-msm+bounces-1049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5815E7EFF3A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 12:21:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD711B209D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 11:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03E31097D;
	Sat, 18 Nov 2023 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EqcpG5e3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B502D71
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Nov 2023 03:21:15 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id ffacd0b85a97d-32fa7d15f4eso2083032f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Nov 2023 03:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700306474; x=1700911274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPUyKTXXSta6O2fovS/Sd+lPKUPKukl6VDR0zfaqpOc=;
        b=EqcpG5e3AgyxxGbrAqhoABqyQQf23sBgO6d/56Jdbai2pAc/mD3+olAcmhtlF2jt7l
         0xg8TVOuqVsNLnXTeU9EyLRkaTfbb3TgqlX42ft30zomvUxmTEDtMXpK6VzYMNZpP8dy
         OVGsV9v7bO2zO7yZ5Um4UHv9CZmLDzCQVJB1WCPYZ/kw/e9rTU83yfIyo/pcu3o4Auyp
         8fmQoSLoyZfAZlHzHfG7zXHW0o0F1iH/N/8nPLoCZWexutXwGhAFdx/yEN346Ph05ZQ+
         9SsqV6B1KShUBMAX2mwFzpmpTlg5sctMNI+E/QUIVj7Lf+r+Ky+7ZzLoS/NnYqsLJMEG
         bjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700306474; x=1700911274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPUyKTXXSta6O2fovS/Sd+lPKUPKukl6VDR0zfaqpOc=;
        b=AODugk7onGAja4yyxARwVdrVzQt+9nPAFlKCNvBX2RAKfufljG/rTC6I2f2Jqu4SX6
         Ia8gu/htSpvXUpI0vAbDxonuljAv17BPUIFkaYYgU+Zug/7h2eSeuMul0KSlMGFBBKqI
         rk8ZD2x8vtbbjeA8YPww92dnj8jKrngrOp7QlC4/zc2VURcEqIQRHLXUtkE3/Q5rWS8B
         GkBCQutVsfpELd8Xr6IcngrolkYhbZ7IxqxJMeZPRKAvf30nxJwwi2ot0p6otXr7iPQB
         C+peQ6pC3aefv5SoWV3nhC7Bb8AD4C7lXlBjz/d7qq2wKNjmOmz7qtvPQYooBjF1ZSb/
         WFXg==
X-Gm-Message-State: AOJu0YzUIUZRF57L9WYzrANrW/LWAMBf0U0jdOHZynqaS4hmZOcJneCr
	gkiyJ6wMunVIPQP2C6YgSLcHtw==
X-Google-Smtp-Source: AGHT+IGlRDKm9rqnOd1dR8K6pxIjfQMraB1ziQN/o0o+0J4lvPN9D0qU3XUhj/DS3Uy0+DQDIsEarA==
X-Received: by 2002:a5d:64ee:0:b0:32d:aa56:c0c7 with SMTP id g14-20020a5d64ee000000b0032daa56c0c7mr1242475wri.54.1700306473449;
        Sat, 18 Nov 2023 03:21:13 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d68c6000000b0032fdcbfb093sm5109586wrw.81.2023.11.18.03.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Nov 2023 03:21:12 -0800 (PST)
Message-ID: <fe74b1ab-078d-4c53-9133-cf7ab00a656d@linaro.org>
Date: Sat, 18 Nov 2023 11:21:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add support for Translation Buffer Units
Content-Language: en-US
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org
Cc: devicetree@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com,
 quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com,
 djakov@kernel.org
References: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20231118042730.2799-1-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2023 04:27, Georgi Djakov wrote:
> The TCUs (Translation Control Units) and TBUs (Translation Buffer
> Units) are key components of the MMU-500. Multiple TBUs are connected
> to a single TCU over an interconnect. Each TBU contains a TLB that
> caches page tables. The MMU-500 implements a TBU for each connected
> master, and the TBU is designed, so that it is local to the master.
> 
> The Qualcomm SDM845 platform has an implementation of the SMMU-500,
> that has multiple TBUs. A DT schema is added to describe the resources
> for each TBU (register space, power-domains, interconnects and clocks).
> 
> The TBU driver will manage the resources and allow the system to
> operate the TBUs during a context fault to obtain details by doing
> s1 inv, software + hardware page table walks etc. This is implemented
> with ATOS/eCATs as the ATS feature is not supported. Being able to
> query the TBUs is useful for debugging various hardware/software
> issues on these platforms.
> 
> v2:
> - Improve DT binding description, add full example. (Konrad)
> - Drop Qcom specific stuff from the generic binding. (Rob)
> - Unconditionally try to populate subnodes. (Konrad)
> - Improve TBU driver commit text, remove memory barriers. (Bjorn)
> - Move TBU stuff into separate file. Make the driver builtin.
> - TODO: Evaluate whether to keep TBU support as a separate driver
>    or just instantiate things from qcom_smmu_impl_init()
> 
> v1: https://lore.kernel.org/r/20231019021923.13939-1-quic_c_gdjako@quicinc.com

What is your suggested way to test this series ?

---
bod


