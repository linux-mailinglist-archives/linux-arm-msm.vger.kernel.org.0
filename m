Return-Path: <linux-arm-msm+bounces-25891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5946D92DB7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 00:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2581F24B49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 22:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80F7143737;
	Wed, 10 Jul 2024 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X18c6Hwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3B12F365
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 22:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648886; cv=none; b=ORfNaGYI0KZfydfQsD4WEwQMUZjq8vygpU3BxGQe/zTR+RVbBgi1fXo4zd8wFdtloeaOnySFvdeCaBtewdvZKwL63SVZYUFPtBqJWg2fVNqEo8fQsdguMI5wtYzLTt/PcadhEg0ueyNtPl0Xlk3LlcZGDMl/8IH5vdV9gwxNHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648886; c=relaxed/simple;
	bh=0/ZsPcsndPYqDvEZoLQtpd2fDcgR8R9jtx5n2cpHTfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkcdIGpb7JqsXVMbQI/GVXC3obyrZCQfL1bTYxjDNxNq9kD1vnrYzauvvPKe5wTQLqHMBfTOuP4OKb9PWL0N8wT4CK6jJVa9Ff55+7WWNE4e5yti2ienoW8K+Q8dCOtKTBtiDvNRJS1Cw97tYKfCj2zGZb8MSsNudex25D3SBR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X18c6Hwi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77baa87743so24764466b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 15:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720648883; x=1721253683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zf1pp9dOgmxGyQBYWisVbbmnW9QAhbQOazYQx/2Fl7w=;
        b=X18c6HwiMS2mTG1y5cEBR+HmUaspuqvgpt4LE0wUdIT+uVzQElF1V1uXxw1t+igwf7
         21IozNE6tT4rDoNaFa/HeqkMP4Ed3c092huPF6lRL3T2kNH8lzRMbBq0fLXSwfpspW2u
         owMBtgPXP7YlKPRxuz3Jb3EoyTELLoCHbH6w+njmNIDmCoLnNGX8QqWC7krQtbnAqnGc
         btU48lZ9Rqsh4Dr5iR+7WLEusjw5kG7IZfIdDmEjPEYXB1Ma1dgyvqW4pffMbwtbPWKn
         RN7l969qDwnqHA+Cr0p67IAqjkfJ1foDbZ3Fe4Jj30k941g3HkdtmQwN55Gea5u4khMY
         y7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720648883; x=1721253683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf1pp9dOgmxGyQBYWisVbbmnW9QAhbQOazYQx/2Fl7w=;
        b=siMeoLX7eB5Hh4rpiQUMZjnUgHAwI8zdY0M2bNW8QJrLlgWew8eZzDni6hDTj+9EdI
         Wn+SpK5HNoha5uJXiTjM8ceJIN8/EWcGJ6c/QnUiaIaMa4nknacoUuAYL5C6glfb+mXY
         ytGKWtRyZ3kuoCXyZVQJGouABpv9gapc3o3jjRlbJrPRURGwAELF+2xeOusnh0dk2Oge
         42cUw2c4RIYAz7DO17MjAZ8hykDdiHh+Fb7HeyJ0gdUUCBuct0/QuHgsr03tY5c55pBu
         VjKYi+GlEotaEdlvMmh5kGZSeS5a4pkIPfs2RAVFkcI4v6TC24EwB6pVKQ7gLHOJV9y6
         USoA==
X-Forwarded-Encrypted: i=1; AJvYcCW03x1vM9tRszQhemjiw8kSSz/wfdH0nYXLrZKudEA2UD96xdVROjMUBsKCCLzf/h88hQLq59F49I7C4khZXQuBuWRncoQTlg3nlKDUng==
X-Gm-Message-State: AOJu0Yzw1jwhfxmNhaCXF/BFR1EFZP2B0W+ob8nffqp5WfrBkBLpI28I
	5Nc/a7dnutMAc8MMsjARu43hldplt+lKPznxaMmqzXFCd7ysjYDo5+yWuv1mrMM=
X-Google-Smtp-Source: AGHT+IF4jq8yt4jQDz/VDWCfZu27ZsRCQpuF/N2TiFiwqjAXZchm3oBEIHNy84eHP2CV5+WZrCx7hg==
X-Received: by 2002:a17:907:e90:b0:a6f:4e1f:e613 with SMTP id a640c23a62f3a-a780b6feffemr629317166b.37.1720648882916;
        Wed, 10 Jul 2024 15:01:22 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a855f09sm193561366b.164.2024.07.10.15.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 15:01:22 -0700 (PDT)
Message-ID: <f4994451-9dc4-4d25-b544-49531709e76d@linaro.org>
Date: Thu, 11 Jul 2024 00:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/6] iommu/arm-smmu: add support for PRR bit setup
To: Rob Clark <robdclark@gmail.com>,
 Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
 jsnitsel@redhat.com, robh@kernel.org, krzysztof.kozlowski@linaro.org,
 quic_c_gdjako@quicinc.com, dmitry.baryshkov@linaro.org,
 iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-7-quic_bibekkum@quicinc.com>
 <CAF6AEGvroi8rJimFv95tkWmRFa5_aTpBJ7GFcRAuZpLGdSyEYQ@mail.gmail.com>
 <0650ba0a-4453-4e2d-8a76-0f396ac1999c@quicinc.com>
 <CAF6AEGv_9e-TDW1r0N4-db6pY_aV_EZFqrpNbATVS5Vy6+fs1g@mail.gmail.com>
 <4a5f54c7-120e-427d-8a0a-9fb83e13a72e@quicinc.com>
 <CAF6AEGtrtFNxDWtuADA4oOHhZJ=dJZcGaJ1XLFJt4fe4Xp=pTA@mail.gmail.com>
 <3b7c05b1-8f36-4c81-a55c-dbb467314099@quicinc.com>
 <CAF6AEGuRKU+DkL0-b3xdR1R45_MiiKQYRRXEXYz-xohu8rUaEQ@mail.gmail.com>
 <CAF6AEGtbw06-gOSvX9gAbi=SA801gmD3_8c5xkOU-G9g2qKptQ@mail.gmail.com>
 <9509f256-04a4-4907-98fc-148c5087d74d@quicinc.com>
 <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGuLwZ0yFGWMKX-O1VjQB2M57K+CsyJ=7PCKXE=b=VsSNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.07.2024 7:01 PM, Rob Clark wrote:
> On Tue, Jul 9, 2024 at 12:43 PM Bibek Kumar Patro
> <quic_bibekkum@quicinc.com> wrote:

[...]

> If there is a clean break, such as all smmu-500 have PRR and all
> smmu-v2 do not, then it would be reasonable to use the compat strings.
> If not, I think we need a different way.

if (a reserved-memory region is passed in dt) {
	init_prr()
}

Konrad

