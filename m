Return-Path: <linux-arm-msm+bounces-25740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86792C3E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3203F1F233BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6311182A65;
	Tue,  9 Jul 2024 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tM9ouuHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8C17B056
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720553357; cv=none; b=GcVkpSnNYSsqMnIGPSGMzyB9q/pI+fn/5PDnKXUSPGhs5o9uJC6Jw0RDJzVNsi49+P4OTMVpd2uyH36nsIgWc6g+i0sT9RXUkVoC3UV3I000oJW8L7kBRL0pkskA6LjMNErb1qQSIt8SnTj1wWL3Q/uRR6AxEweqZPXyKsiZCPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720553357; c=relaxed/simple;
	bh=euDAfX44E+bzohp/qgvxP4Urd8ZWcP5tKni32VosqSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqKXngDJ8IGqOAnQgpNo3XEgUn5GQk47gp2EukQzuIcpBm/nn4L0mu/wcHnG9s0vP3v4AH0VgVHU86vvRW5IwP3tihcO5qRVzwNPNEG160aKxYW44FHMnSWQjYrmTFJWiGr3b+s/DLyjmN4KdfPSVxgwecJrfcPG/fxl6zCUg9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tM9ouuHc; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso6618769a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720553353; x=1721158153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qvD2qPO0laJ/OSl3ShKVGMpSyFV0nKDMpCM4gAwZl1A=;
        b=tM9ouuHcwrKGEhCWZwqSEicatdSl/yd0v/VJ+ZkGWLyA03whX4pHAS8uhHTl6wXJNB
         pCKxExbZ20b122+HLKnkUR+ZKhudSJcr/tBnK7Ahu/G8Lr6S9MqUS8yi531Jhwy5HUX0
         SXDj71CxpJ/W9tUz+7oj9F5j20sBJG/8dL8EnyQN+sufOQM8XNV0MAPt7T1yw5Jm5A6r
         H9dlPMa9WmQD5oy87Nh2MGDtA9LMw/9JVarIgciqNjScCYx7u5IoRPlbjWiKXZbO57EI
         aDuMDjpBxfkFx88tqRyodDajddlWy6a2ERk9QVhYs/5bqzl78gZJZ5wub+qyPxkQzWPg
         qFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553353; x=1721158153;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvD2qPO0laJ/OSl3ShKVGMpSyFV0nKDMpCM4gAwZl1A=;
        b=gJKNNNTms4gT7UVgUWcLdOscO9VGf3JyfYsuYQNbv+w1lLoe0A6CNtm1uJMA1gqNsb
         yVi4sxRbol8SPTKCwBsoht72vi9o0opRyoFsYOlI1Pfo/bfiI7VzGQmhEuLhjYresH5s
         U96ShLUUQclaPYV/EiPk02ZB3CzpMYDQZRLga8w0DMvY/KLgKxDtaOctFQEVvqrVQaOQ
         Z4WWY1ppHHw5mQbFpTQGphyCRna1U5fWeLY09B2wwzsmXmj6tH0QVDBqLD2dLY7iMnLu
         FqwV2R7JL+er+KtLbTm+DmeqN0pwVd0XeCylBcmlHsS2HPP08kbWzA5Nyl+f7A++gVxY
         ZNaA==
X-Gm-Message-State: AOJu0YzYQzWpX9TSVvlHLHo73mReUGTKm2Vgm8A9bo/M4Ext/MX9IK2l
	FPgNgB97bTBHrApaoFWvlzqBW2XFxoyQo4SLapFMzCM23FBsBKt7xWj7FhUumVc=
X-Google-Smtp-Source: AGHT+IH11mCGDZKSx6Xr4YjwT39VrW3fzZXhulb9JkmQvzRHwpYPR2yV3DbXrjePhS+oNqyf4JoqoA==
X-Received: by 2002:a17:906:c149:b0:a75:3c31:4f58 with SMTP id a640c23a62f3a-a780b6b3b67mr248170966b.32.1720553353188;
        Tue, 09 Jul 2024 12:29:13 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6de0adsm100229066b.59.2024.07.09.12.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 12:29:12 -0700 (PDT)
Message-ID: <8e6b8187-99fa-4e8b-8a00-2872ef5aee59@linaro.org>
Date: Tue, 9 Jul 2024 21:29:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Add interconnects for
 ethernet
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com
References: <20240709-icc_bw_voting_emac_dtsi-v2-1-a1e02c7099a5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240709-icc_bw_voting_emac_dtsi-v2-1-a1e02c7099a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.07.2024 8:21 PM, Sagar Cheluvegowda wrote:
> Define interconnect properties for ethernet hardware.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
> Adding interconnect dtsi properties within ethernet node of SA8775P,
> this patch is adding support for the interconnect properties defined
> in the series ->  
> https://lore.kernel.org/all/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com/
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

