Return-Path: <linux-arm-msm+bounces-79354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFE6C18CBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B404630FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 07:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A36B731A818;
	Wed, 29 Oct 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zy4ci/sX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22B3311964
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761723914; cv=none; b=gzRD/hm8m53zrFtm7RCw/Fii245n8R8rw8jSt+/c9GmtLdRGEs2itUXuohz5X8VffBhxd20D0agQ7kQfEgxxmAwHgMDY4+iSegdTGbTk9HYh4hcvWQfc9JzIhMzn4AhQWLtHJLSZo4Zbqr1UGmBAoC6V37qQrj3eYFfu/yUBmSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761723914; c=relaxed/simple;
	bh=nupMpTFNJdrOKFXcnzX4Ka6UC6P0ZafbVuM4eL0r1zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrKDYStVGTZL/vx/tHc3nAPkQNv4bYxtAZqzpsXxucdGCQ/dwkCJAoz2FwLT03NUXqn8kVqm+RO2cUED1sXFw8VXnkAO+DaFJyIuAtJrh6dV5kW93QGdmtX/XpCkxGJq4dvfpqJ3tnPP8fNQ+8s+Tk27GHMimdVC60fAQbCR1SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zy4ci/sX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4285645fdfbso904932f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761723911; x=1762328711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yJv7mp1wZUS03IAanLVQjgY4bE3/XwXpGLcEtczECl4=;
        b=Zy4ci/sXWfNKU8+aMTeKnNmJ/JtUJP+01yQuxdy4ceH8ajeR/5I10M0OpreyJO1dBh
         QdcLK+75kAcSjFMNEM3gt3SVU0/01GUM/z5/Em/xLW8eQr/3lRMgxexIOdRkDROxRyJG
         vSBAfz7jxSTMlY7p6XzpO96gFs9yryjJn9tMu1U/0BQt1fUNu5ko2aKTw023cbq+12bX
         NeaYpyDBQ8OlDw4HXmdchwbx93Dp9ifQtOK/X3pidITAL2UiFC0CdqTgh4+yBmEkSXEV
         mMlyung3yDYK8ENxWlujbOI18BiFOeYHtry2imo3WKcIz8ddIqcVjok+PX+RkStA6ule
         zsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761723911; x=1762328711;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJv7mp1wZUS03IAanLVQjgY4bE3/XwXpGLcEtczECl4=;
        b=XzxOBfACxTVPSO9y1Wqj0keeYG4EF8YTLeZra02Zh+lgDWyJRfJDFdS5VwQvecrnG2
         hQ+n7vn1+3hPWFT0YAmMj64FcIbGzmyFNzwVph2aGFXPdc9qjEMM6KnkATxiwe07xD8+
         Pkhz5Rt7b2Xr1mpvvlI91YPcvkhqfh3B7YQSrT/+kbcMPA4PJv2ybH8S4I+1n+NlfHd7
         5GGpIOlErK9nkyAzmTncJcLOTSOZtkfAyEAOV4fCEUVLZdS815qLQl/BER8hYWVPZrN0
         Zw7SHH3gWLb4IjNKnluEMm0Gwv6XnnY6s2ZPNb/atW++AUnsz3nY4LLUuc5lv1XwE4pZ
         u6PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC2q30nGNYiaviCeOeS7ktoxtSSAzy4nCxxfHUKqwrW0JGTM3ANsrx8O33Ojpb1N5jykUIyy8uwPJ9NRUp@vger.kernel.org
X-Gm-Message-State: AOJu0YwWsuznCxKGnbAXIsn2KpaN96JCFDUfNhyWh95LsieWhYDSyAVt
	9rZAL31ZluWo0mlkXxWguFIR9we2CEy8OaBbo49JXnoceDdbonOHdvgAw6ZHRTyNXrs=
X-Gm-Gg: ASbGncvjWb6q59TAIlLMdMIgvvXYHruxjXcPLh9RCGeBgMrsJrVJoFemckdZbkKsh2L
	1WTX7gHfzKiCeNzswjVRaZkCLR8njF5Cu6PDhfYS4tDKajlcRT0wPRhWY85b3QN0tJkibZP/3NG
	plVZPxkGxvyJQnzRMnoyTJ+YNESZQgU+vuNL5Fm+jwRjBCT+A0CIeZmn72HI8lGqIzGCPqICifm
	yOYdplMBpzGCaPHNeVPSwj2He6qoMKYO7AatcK8dkTfaTEu+G67tqSQ4TEdBLWkFpe4Q4IFOu4T
	boJoQcRUUgaCc1VaubKsV4OFHYkCZv2js2Ykf9NOF2k+OWXx34A81B3p1+TxmSPV6HRxR5pJjrl
	EkNPWDNDsWDhHoXz0vXWp2rs6A3LlrY9VBvpU48P4q8lczsn1SLEYEFn1du2uOIG8WvPrHkbESs
	dOQOY9Tl+qfkJccXThPo2f
X-Google-Smtp-Source: AGHT+IHLOaU9p+zg4Ic0wTFLQbsuw2vHNf/XZJ+1t79FATXoY+Zp0zdszPcD39UPCYJgFJS8ah5ceQ==
X-Received: by 2002:a05:600c:4f81:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-4771e1744e7mr10248755e9.2.1761723911144;
        Wed, 29 Oct 2025 00:45:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47718b66df1sm40196535e9.0.2025.10.29.00.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 00:45:10 -0700 (PDT)
Message-ID: <f2117bbe-89d4-49a8-9e5f-5dc975f9bc13@linaro.org>
Date: Wed, 29 Oct 2025 08:45:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <jesszhan@quicinc.com>,
 Abhinav Kumar <abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
 <nwyrhupbrqrh6q5yvk6egtm3whi5h6xslhzio4g7f7l7yjx7c3@atl4bbk5f4vb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <nwyrhupbrqrh6q5yvk6egtm3whi5h6xslhzio4g7f7l7yjx7c3@atl4bbk5f4vb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2025 08:40, Abel Vesa wrote:
> On 25-04-24 15:04:25, Krzysztof Kozlowski wrote:

That's April

...

>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> 
> No PIXEL1_CLK ?
Why are you reviewing this one?

Best regards,
Krzysztof

