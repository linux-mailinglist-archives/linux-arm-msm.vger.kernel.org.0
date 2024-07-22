Return-Path: <linux-arm-msm+bounces-26803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FC6938EF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FDF61C21228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A25516D4D1;
	Mon, 22 Jul 2024 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HKr06lu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709DC16CD3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 12:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721650332; cv=none; b=Fq+6uOrz9R5/3Z57F580CnvK/3Xt+6sVr4f7VQpgGl8ZgkVeJcX4xSOHgdq7nnO3BX4ARIr7bvZh3vYHfKX8Phxr5FDbi0/ngOl2KnAYQTQYB8odIFF/nhARB1ZWfShxAFU26OZ7Lrp6AfEcBRupZtxCifL63vjkyxvu2+nKTgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721650332; c=relaxed/simple;
	bh=ymDHi15Wil0W5xbGoLtGCVSMFJ5LMYedoT78zWjurnA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=calHi3mhzaXmHNy0lnzt+OQqG5RSDJcXX1PT41ASHHOjLaA0r1lCQ+IevjaAkjwNp9yncdh6Stc3zSfSvC6Dj2VHF/dV6OMpop7GibcN7tflDSQ0Xr38UJIBhFAfDCHF+Gemf7NG13SaCZvCTEJR6J6TH1MfVCbDwQ/7jUubX+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HKr06lu7; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso7752461fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 05:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721650329; x=1722255129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GF4uprXlfxLLmYcxs700jeX5OUVC5m3lA+uEi1iNqsc=;
        b=HKr06lu7BdBg+sbnvqGoZvhvJpNpP6ZimZBXUxfOwVKCwHqM84RZE7iJpNIXc8ctaZ
         OwxcdfWtef/LPKSnpFF+lhZns9cgNbWNAoLpqhM2PmFS0BoloOWXMviaBXxjyeSPPtoS
         OZMhTSNJTZtlu+9ZFBtfA7QXU4ZKcrOZ4B8MZdN7xXhQs8gsPIjkqc6LFK9/qNqm+225
         rsrLf4CSsYElZQgXZv3jrBV4rzwrqxepyRuR/qnXHUbdcDSVa0/hTnhYeKM0bSxmw5X5
         avk4cOTseqfXbVQiObVDi18oEerkI1CdpPWPtFnojVBX78Wx/46v20VWxU6yhiZn4eJ3
         8JmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721650329; x=1722255129;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF4uprXlfxLLmYcxs700jeX5OUVC5m3lA+uEi1iNqsc=;
        b=eqkgMU64CWyPFPr1RFPTtcsI7czP5b8bZIXFr8FVHvIdhoutU7N9dZPQKakxa3vF3O
         HQ1iVZ1LtRH3Nkb4wU7UEYfLsVkIQmbMRFojIMDWbX4LSNFZrN15plfEiTSbY6YnJv45
         6ktWgwzUal3VBYV1FPIpkQOIT1d8a618G4F716s+FXv1GfITKF/K8FTWSyL5ze3TPbwW
         kvO41xf/ze1icfhpphisaCjft3sgpk2hi5aQatGUcEM/3AXXGtUOVUV9NO2zk+JgIL/t
         bpKG05Hn1cASel9cBZQU58/vxl5dDhJoenr2DZBncS/hY/bPeP2shw1QrJdlYYMyQ+sg
         FEzg==
X-Forwarded-Encrypted: i=1; AJvYcCUt4r4zEZMVL9dsrB9RtIYVtrTHNaKMaBChBlstZb+jxc1nAn844Q4vo9zw5BF0ACLBgXozO96xYidDunyuiRa4xOYPteqAodVtvEhOTA==
X-Gm-Message-State: AOJu0YwTc9bsJ74QjYKWhpE7LxfRLliEdhKYUhq369YGG7H9hvvFJNyW
	puS9N1UoGmvt4ADvyamGdVI6i0AjALxH6FxM3YCN8vJTqSnup52TyN468/1jySQ=
X-Google-Smtp-Source: AGHT+IGSBu81Z24jwqkRzF3oc/1vtM8xQX2VUlcZIHbS9NfH5AVfWQTya2tLqgzcqHvOTMYh50++aA==
X-Received: by 2002:a05:651c:19a9:b0:2ef:3250:d0d4 with SMTP id 38308e7fff4ca-2ef3250d296mr18933481fa.48.1721650328419;
        Mon, 22 Jul 2024 05:12:08 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f8645sm6008186a12.72.2024.07.22.05.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:12:07 -0700 (PDT)
Message-ID: <ef5cd913-b79f-4e71-9de9-7e115ca6ac72@linaro.org>
Date: Mon, 22 Jul 2024 14:12:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 5/5] arm64: dts: qcom: x1e80100: Enable cpufreq
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
 cristian.marussi@arm.com, andersson@kernel.org, jassisinghbrar@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dmitry.baryshkov@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_rgottimu@quicinc.com,
 quic_kshivnan@quicinc.com, conor+dt@kernel.org, quic_nkela@quicinc.com,
 quic_psodagud@quicinc.com, abel.vesa@linaro.org
References: <20240612124056.39230-1-quic_sibis@quicinc.com>
 <20240612124056.39230-6-quic_sibis@quicinc.com>
 <3335d95d-d5eb-41cf-b18f-90894967d713@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <3335d95d-d5eb-41cf-b18f-90894967d713@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 12:45 PM, Konrad Dybcio wrote:
> On 12.06.2024 2:40 PM, Sibi Sankar wrote:
>> Enable cpufreq on X1E80100 SoCs through the SCMI perf protocol node.
>>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Taking this back.. forgot about <ZoQjAWse2YxwyRJv@hovoldconsulting.com>

Konrad

