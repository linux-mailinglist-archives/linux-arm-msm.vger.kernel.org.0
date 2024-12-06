Return-Path: <linux-arm-msm+bounces-40731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022E9E69CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0C2161C9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77AF81E0DEA;
	Fri,  6 Dec 2024 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pKDiHV30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40671CCB4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476257; cv=none; b=KzDQuF6mXkeU+RyOJI6BkUqPR6cKvFk7sck3dAzzv4/FBBae2irY5TlmpijubkGyw4LDtkZfJ+9R1MP4Mdgbrmsw30oH1KBiuYzhit9sklf7bW8FNiZCHhUg0hRfX9o7D/Z2mg11+dcF0dzvMEy+fOYtHd7U0px+xqk8jrDa8cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476257; c=relaxed/simple;
	bh=TwLhHmqCmT8mbikMr2K5idtH7gqvcB7QcvMt6aClul4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COeIB4Z7zB0ruakifQ8sgDRyGHEmJlh60hCDzzJJOAAOLvmqvdJEYHjocO4UCgfqEV8EzlsvxkByP5rl/BLxdQwj1K91fxt8UMf+ZMMr+CO+xS0j+BgK78XSWSLm6oNh+FKZX+tkJQ3skJQMrzydhDnEbtPQxDLmk4FO5ay8LxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pKDiHV30; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa63584e157so13693966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733476254; x=1734081054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yfIqdChuVNmxTU9TsoTw4NafbW5EbErVPJediA5XYwE=;
        b=pKDiHV30FeVWQ4Q6pVmOo1fFI4LjWAVyI9w56yEeFz2I7mZ8/mtqnCKxeRsUklFwmP
         WDNiT4lPDAlGzKaZUH1wmIrwnkkgnF0RbTqCfIAK4/vxXqdkF1ch6uw9Qc4wjxOn0fYH
         BnNFLq2s7EzyAx2tOIwpEqgVT2EAVMRMc1X4NymBMsODnkW/6yBu9FRE4BsCwpbLiy2G
         BWLlWT52ZiOVGlWrARDjL5FnbyqdOuuIJU+Gz6GiaLEe03fLkOVCgUz0tGYCujqVuiwG
         UYuloI7pW//08rlmv3yWYZ+Cc9S5oTvaaNNp5vf8mbZX/QtaSEalmY1oX45B94sUqACI
         PU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733476254; x=1734081054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfIqdChuVNmxTU9TsoTw4NafbW5EbErVPJediA5XYwE=;
        b=Seq8WV2z0PSBMge7v8cT+9eyvrjsRyC9B4Z0weQLnX1X1Py8p0eTtUetHSMfcz6EKb
         CIozoXx/+FS9PlrvNQ4By+PKqDiejtA/Xq5Nkrqmpqc6Y2MK+QyIHkFfNX7qQ5HeTaod
         UEjxuBZe6dpBwTh+PUmWV0bPSvoDjLBM5P8o+HZVhnXUzToCR4E3U641EqfYW4AdZfDi
         dhKimsqBO27fyqH4Aifjh2Ijw9ta9mJ34f7AcWnZtCD2TUrPto2q8wql+W1rFnfiBo+p
         svSoS7UO5byR/gYBcaSQ2PHCmlNidXLDbxV7v806IWtAn8joKxREK6+Uk2ovR+qGWEwA
         R1XA==
X-Gm-Message-State: AOJu0Yy7Nv2fWQjOZQDzY2KCI9chIIB92e6eQ1NK7l0cKfODJRbzsWiD
	SmvRIGM93pNHx2tdubAX6m/pXKavoNGHVMHm2KVfQDKpJwWT0We5ClOnaOlD4qw=
X-Gm-Gg: ASbGncvOuLHdyQ0NtyxZKx50z/BdSzDZcAcVVj0h04MHVMUX61JpVw8zsqs/TGAJpFi
	4l0dCzoe57NJAsuGknqREN52ucS7eDYljTd24R1pSAudl5pHKc4XZEo/eqIFms4SJrZwseWOoSR
	dtI3VNpAV62uXTsvhMwRUMdUUGV7xIiZeQ4l6G28LYpzVfd/EzxKL8aC0BT75rv5pj9dlklCjnJ
	0LlkHxiQ6fNTjNPllcU3duvt8XHVm1MIPeBs+cZUgRVvQvpmsrP8krnT8XciMNFemtMXVWVgw==
X-Google-Smtp-Source: AGHT+IFxqJUXLlMbfJtoxC5AzYLLmlMF+kGaXWc2+23SxnIMoTz+RZIR/OP34nQZqW+haBfmzAvOIQ==
X-Received: by 2002:a17:907:7247:b0:a9e:80ed:5cc6 with SMTP id a640c23a62f3a-aa63a2f34b9mr66910866b.13.1733476253920;
        Fri, 06 Dec 2024 01:10:53 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e92fe3sm210151066b.51.2024.12.06.01.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 01:10:53 -0800 (PST)
Message-ID: <8e359b6c-ee68-4606-a485-057df0b27d92@linaro.org>
Date: Fri, 6 Dec 2024 10:10:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add CDSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
 <20241122-b4-sm8750-cdsp-v1-1-9a69a889d1b7@linaro.org>
 <ba887e6a-7bb2-4170-a957-d4299012ae01@oss.qualcomm.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ba887e6a-7bb2-4170-a957-d4299012ae01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2024 18:32, Konrad Dybcio wrote:
> On 22.11.2024 4:26 PM, Krzysztof Kozlowski wrote:
>> Add nodes for the CDSP and its SMP2P.  These are compatible with earlier
>> SM8650 with difference in one more interrupt.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> [...]
> 
>> +
>> +		remoteproc_cdsp: remoteproc@32300000 {
>> +			compatible = "qcom,sm8750-cdsp-pas", "qcom,sm8650-cdsp-pas";
>> +			reg = <0x0 0x32300000 0x0 0x1400000>;
> 
> The size seems to be 0x100000
Even 0x10000 (one less 0) according to downstream DTS. 0x100000 would be
entire touring qdsp6v7 map (1 MB).

However we always - sm8450, sm8550, sm8650 - map here 20 MB for some
reason. Any ideas? Let's correct all platforms to 0x100000?

For the record, there were no differences in downstream kernel.

Best regards,
Krzysztof

