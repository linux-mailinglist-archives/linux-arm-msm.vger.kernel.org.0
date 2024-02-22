Return-Path: <linux-arm-msm+bounces-12141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007E85F39A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C555282805
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 08:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF5137168;
	Thu, 22 Feb 2024 08:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tt1SuvTc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7FA36B1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592183; cv=none; b=KK+tc9qMbKy+CkHbOQAwPFN/ek7nEBTDnWkRv8NTQeW1ZWZ54JBlkgxUerxte+byFQyZYNd2XcPn0F9NtUeaJfCzWdnCNhw92LMdq6o9IIakujQutrCJwYQZcylmZ/ZWCW0B+cy+8DyV/tUarDr0I5/0eKGg7Isti0E78SKBjdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592183; c=relaxed/simple;
	bh=PzWYmYYSNCTetX2Me8zFPVyu3GzRmF0jBDFkhc1OSIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REf6O7vIylis7QESYagjLZvp/YV9LCtYMcApxS6/OGlQfnGpVnVVDHlA3l5xTNzV1zUXUo8CuzW6WJmlFcXpDXot3GLK2ns48LsBbu4DPPclupBwmuTkab4H75TKbXxwTkSrlXKXSKCURnnIRUIig86ahuwp1TOExXTqsAsXHOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tt1SuvTc; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-512dc7b7fc2so493798e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 00:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592180; x=1709196980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rbknJKtPFhf19eCJkjQJRk7bzdoJAzars+eP6UgUck=;
        b=tt1SuvTcmhX/UCXySUqYxJbudDk948Hmzl+sIzZcSIf7A/hX0ljPaTjcSxcJU3CPvs
         cuAdC4YWEfZQxW4bJOtVE41OEpZ0i1C1QbAPtZuHp1Vv7eMTb6qEokwuFMvHA176k804
         Q3RyUZ0CeRbRFWHH0lAfk030GkeDs5nQlRBV7bknNVzAIrMIpKYo1eh8kBWlw8ArJfKW
         3gf3A3MEVvyLlq2B9HERojsq93aC2E2vx7jB5Y+Y6etVkNj49zNifBEnCRWLrzTW8gPL
         2XsoiB9+hPWh5q4jwbF/7+AwxeBC7wik+kVlOym0KIktL6lBzQhhzClJDxfMUsshsENh
         BrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592180; x=1709196980;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rbknJKtPFhf19eCJkjQJRk7bzdoJAzars+eP6UgUck=;
        b=RwNG7cVVj/qZrZgtq1z2lWqlhdr4Acbk9ipsLbO55+c4E0ywwvTQeX9Q4p2TZa4a2C
         aMNQ+88ZPH+dXOctTmH4njSHuEysZ4JdE9TEmBPM1UhE2OFuskl5OzLboaCrxhcWcDcy
         6bUm8DEEPb/vIS8Hk6I+d7N8JafYNVh67l/OT3CsJqQxSE9BVCnXfnY7uGQoAMg3xXpU
         V7fvyi+HPu9Uh4mWV+2RUS4Lwav4qGVHIuBBwm2Y8l5wcT5N5Bq1d8DJmG6CwrLlKVf4
         8IHRBSaAFIjnOClySSWqozRSC2TrwQ5AnaKNh6Zn2ArE0MUYW4IXHY3TVr/cNQ6nUFnK
         efEg==
X-Gm-Message-State: AOJu0Yx1Z9TlL99gvqC76WAhWBP6P5MjSD2hUkuFldbUWCb4DUtfs87v
	qS1ZvEbPcpf/2aWOG8G2ChY2pgplk9hEUedZfr2fFufEVwnia8VY7yTHrxUjwYU=
X-Google-Smtp-Source: AGHT+IHI8kwr2TPMWaQcsVFQfDZ5jtmRdq5MbORSZf5eQi7OWgR6bfpA0ultcao4TPa7mA7fVEj4RQ==
X-Received: by 2002:ac2:4e08:0:b0:512:b935:c542 with SMTP id e8-20020ac24e08000000b00512b935c542mr8260265lfr.59.1708592180008;
        Thu, 22 Feb 2024 00:56:20 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl. [87.246.222.6])
        by smtp.gmail.com with ESMTPSA id b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:56:19 -0800 (PST)
Message-ID: <080d8b12-ef88-4f45-860c-826c1b1b5895@linaro.org>
Date: Thu, 22 Feb 2024 09:56:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
Content-Language: en-US
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

	

On 2/22/24 00:19, Bjorn Andersson wrote:
> The max frequency listed in the DPU opp-table is 506MHz, this is not
> sufficient to drive a 4k@60 display, resulting in constant underrun.
> 
> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> fix this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

