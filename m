Return-Path: <linux-arm-msm+bounces-14357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5867887E596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3BE91F21B77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328BA2C1A2;
	Mon, 18 Mar 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KE7VQoLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C8126AF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710753682; cv=none; b=F4SC/lVjDO2xBlqDAPvOyFhuC9067V4xfKznzLjxDiyTIrqSP7YggFeNL9XcNfhJHh/YYLLJqiwj8nr9JJZ7oPU8m4703ut/zL7v35Frhl4oJP+EM4kRoNEy3WpTmf/ChMdpt9X1s3sFBi+6NDmulwYgImu1xWVGoqK781zqAK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710753682; c=relaxed/simple;
	bh=5+6iTQ0gzis+PQcHuNf7VDmaig60PJvYvukmbUIlpQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLHGtct0tB9aAPLKs6DJwSPxG+PTg5ov0QDboZDorlL2uaBtT1ky+UbGl+w0KoEUYsGKDejOdTKmGiJU2FhKSVngQaUxrxejIMMQtL03S7RV9ZHoi2A0KksKI+m+Rg3Pvzv/ZjeWdKiu3FRLHzocZd9EbFk4f3c/wu11r+ZPCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KE7VQoLT; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so52184221fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710753678; x=1711358478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lLj/tCGNP2MK0uv/n4AThhr2XVPFu3MQ0EBorGXinCk=;
        b=KE7VQoLTJa10MVKWUmSLpeWaO+9CicbsHGABWoeNsFmwRJFFew/NBhrsxWTbaK8ts5
         fplS68NEiXiWVFl6S0ggj5Y1+FMDZiLRwvBZJgnDoXZJi9b9pHPLS54AMXBKd+3ybNDC
         dODEDB6BN/GSBgsY9VTNVH3ikcmdAEG1USspRrtL0vr+8dxlhJNVwuBqAu+Z4u3H49hH
         BBi33+YbHBvfIjObGjS306qP59Q0l18+nt1RoluvpVr0XltIJp15D3iA8z5KqasFOwAK
         Hk9LA+28IOvIbcuLF3qSSpni1oiNJVO+io4+jv7kx8Z4b9od2rJ/Gra8f1B0eLT4coq0
         uxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710753678; x=1711358478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLj/tCGNP2MK0uv/n4AThhr2XVPFu3MQ0EBorGXinCk=;
        b=Q/pQJrVerdWU9rP1VotVp+aIalmja2SrlqALU3KkvtwIYj9DReMb5EoKJIfLmcbA7t
         5UdFlsf5HFlgqiYZaoFSWWGaJwyCA+vXby68Onsm2UanB//o8l795hPWEuvvAYdKadrV
         Vr23VnnU/j0J2Wz0LRSkKCU3QLcP7ebrCN885naRF9H5FJ+dZJ1WN6cWoDH/gCmC0Ghl
         sc9Y8b2VWB9d7gGoDUFFcUJs3n5EybreNPPy4Fl9z/w0Sa7ICoBdQGyxhc10FKIw4KUz
         16+UJv4d78mv0hpNhhZ7r00y9EUDgKmCIiJ7CHiY1u26vEe9XJEot5fMMvs5e8xqvgdr
         FYiw==
X-Forwarded-Encrypted: i=1; AJvYcCXO0tutzR98pyrvFeyOwypGmswn2KWLuSa45Agih6zg8oTJZIzcJhzo2P0nk5kJHnp7mvrNKCCYPTT5SknXQqhy7tV/165ZB7H0no3TWg==
X-Gm-Message-State: AOJu0YxOLjf/XWcQz70s3gmWJ1QLCq2SJCi3xQqq75IGee6+TrIAeaJx
	eUS8UqYrwQ8rWTIeE8F9a6Jy5l6l0hOwMAeqI9DN96HFrGUrxiSyFf/vbD5zpnceCXxNYL0dIPb
	gQ5g=
X-Google-Smtp-Source: AGHT+IEyiY99jR9sVdK1Xei3RjmIYwEQfVpGB3cJ9kv1n8zHC1PY1YHncHzoFF8Q7qYrAKzwaduuLw==
X-Received: by 2002:a2e:9357:0:b0:2d4:7455:8a02 with SMTP id m23-20020a2e9357000000b002d474558a02mr7412983ljh.21.1710753677917;
        Mon, 18 Mar 2024 02:21:17 -0700 (PDT)
Received: from [192.168.52.106] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id g11-20020a2e9ccb000000b002d34c754a9asm1366392ljj.109.2024.03.18.02.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 02:21:17 -0700 (PDT)
Message-ID: <b9724b4c-7c99-4903-aa53-19592df5695f@linaro.org>
Date: Mon, 18 Mar 2024 10:21:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc8280xp: Describe the PCIe
 SMMUv3
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 Johan Hovold <johan+linaro@kernel.org>
References: <20231219-topic-8280_smmuv3-v2-0-c67bd3226687@linaro.org>
 <20231219-topic-8280_smmuv3-v2-2-c67bd3226687@linaro.org>
 <phledylmdu23yrw6f4x7fkefntrejuwagazebsnkgyxsweodzg@pddhnc2gwexz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <phledylmdu23yrw6f4x7fkefntrejuwagazebsnkgyxsweodzg@pddhnc2gwexz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 02:31, Bjorn Andersson wrote:
> On Sat, Mar 09, 2024 at 02:31:10PM +0100, Konrad Dybcio wrote:
>> SC8280XP actually has a third SMMU, which can be seen in e.g. the IORT
>> ACPI table and is used for the PCIe hosts.
>>
>> Unfortunately though, the secure firmware seems to be configured in a
>> way such that Linux can't touch it, not even read back the ID registers.
>> It also seems like the SMMU is configured to run in some sort of bypass
>> mode, completely opaque to the OS.
>>
>> Describe it so that one can configure it when running Linux as a
>> hypervisor (e.g with [1]) and for hardware description completeness.
>>
>> [1] https://github.com/TravMurav/slbounce
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Have this information been validated? Or are you suggesting we add it
> for documentation purposes?

I confirmed the platforms boots up with this if the hypervisor is gone.

Konrad

