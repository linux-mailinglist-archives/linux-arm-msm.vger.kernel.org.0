Return-Path: <linux-arm-msm+bounces-26769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A5938CF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04BCC2828BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BF416D339;
	Mon, 22 Jul 2024 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLsUOjUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377816D330
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642527; cv=none; b=DIeLWqjAHQ3gei5hrNxW8gu1PAqWlpZYc/32MJeYaXe1GRxG9xNhb7PvMLcN1Xpqp/sJqs/QjI9y8brwQlnV2zleBgsEHihsSY0fj9Xd4i45kym3L/G4uSe/e4NRVKpdtb1n/gBV+NbQ8d0kzkTCVqMRKojHmyaI5Cp0kHlaHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642527; c=relaxed/simple;
	bh=0whNdyK5dpTJ7KdmgtCvHNvW/sU9vlihHaRji166PnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUZL0epzJRqp/RhX5/L9yRV9a7rK8NUtW2gX+UCMtJreCHFS8vA2SzC3XxTe63lXjjYF8FaNPmHQlU3OGK7Bmg9ArlFR459fDaxvHhZLtQDw8NOFq+Gg1q1iDRk6XvlhJane1cfivf78pBjjEWzXELh5krB/JJ3j1urDlrRuMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLsUOjUR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso6420541fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642524; x=1722247324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RQuPEjyITICQBVFUREtP+m5ZW/c29YWFbZTmV+jS/hI=;
        b=ZLsUOjURg7kUENS5Ewsk6+ttZ9i2N0aPvu+6BUtnPfAOTtoEJOZOo9wcDBGL1OXJsl
         4xDm/QtAnLr6ANEqkVQ39iufu+5fyVjpYzpjS28+S00qiAA01/nYs75cwHlbuZpa4jl7
         iqT20dCSORW8YPvLlGo6oufEnnNqgwwImHZnwow9cg0fyPFQIL4Eego2ayDOSw6japsy
         5P1MigqY20IykEXBn+1+6miQOZ6mzi2DLIaUfxp1Vvhs7F3BvWQrSiVrLo6QPwAfcpy2
         cWIXvkzddF6HbvibDMmtpDNiidzC1HL5WlcAI3vTdTZ+xV73RbNGlHG7uD3BivDcvs3P
         lqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642524; x=1722247324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQuPEjyITICQBVFUREtP+m5ZW/c29YWFbZTmV+jS/hI=;
        b=h4KXfrfn43RQsOzj4gnN6Djw6grGcrv1OjaUoI95K3LqxCf7mgeYyuWrGyOHKsNOwo
         9/BvP6QSsWU2aU4l/ETbVy+8zqzorj1pjGRWzAkQMzvpdNBQ6HUFABWkye54o0iXPpoB
         koxBPw5pYEi0kS4/hPC7gScq73XJRbUnWfYviYk8JxrhbcuqVj8U2HtPi1UVhF0dcefh
         GI6ppBP362sU1Z52u3pMxKB3Ig5UX7drbKDRS8PNcv1WqXybvWm2eVRlQf6872qUKgNO
         7Iy4FBYPn15+Q6mBxTQTYaMoBjb0JSjlD1aNTMYo8FfdLjGqS2/vDZiwbBAR4dxg2MsG
         y8+w==
X-Forwarded-Encrypted: i=1; AJvYcCWksa8K7RQDPSLfmmRSFCoAFZZO8i93tBR4DWiBwD7l16ixEnrfRcMGUfmIwM++PX6daKUjS/nLaljlUxs75+qqlv1jgAdNmHppJco83g==
X-Gm-Message-State: AOJu0YxTF71zfqft0C9cDJMV8H441jVTcfVp1zxsDDqAPmdsnMYzB0Id
	m8CIPmrMRHTxsjXaMz5teBiyfUN7d2VQEjUjCVB2R3XbFeewMMb8tz6vzl2OAlo=
X-Google-Smtp-Source: AGHT+IFCanFlPK/dilnYHrv6NEVa8E5OHTdJ0uaZIcf9JijUgjWQpE8ynIoj398+gvZvvZcRGahZ/g==
X-Received: by 2002:a2e:9081:0:b0:2ef:2b53:c77e with SMTP id 38308e7fff4ca-2ef2b53c9bamr23150851fa.7.1721642523781;
        Mon, 22 Jul 2024 03:02:03 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f87d1sm5917107a12.70.2024.07.22.03.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 03:02:03 -0700 (PDT)
Message-ID: <f990df94-31ad-4e20-8df1-2cd6d3572eca@linaro.org>
Date: Mon, 22 Jul 2024 12:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY
 supply
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>,
 Xilin Wu <wuxilin123@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240722095459.27437-1-johan+linaro@kernel.org>
 <20240722095459.27437-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722095459.27437-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 11:54 AM, Johan Hovold wrote:
> The PCIe4 PHY is powered by vreg_l3i (not vreg_l3j) on the CRD so assume
> the same applies to the QCP.
> 
> Fixes: f9a9c11471da ("arm64: dts: qcom: x1e80100-qcp: Enable more support")
> Cc: stable@vger.kernel.org      # 6.9
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

