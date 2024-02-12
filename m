Return-Path: <linux-arm-msm+bounces-10609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7428511DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 12:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82CC0280D5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665AC39863;
	Mon, 12 Feb 2024 11:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ktP7c8sV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18539843
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736148; cv=none; b=YuTki3pumYY6+4rFZFyia9mrpDRJR8BGF9mjUf85I0HnvFk4KEH6sRhSqIrIckXjCyNXDTJ6hTl14Uvb7flFJpYSN7gmqiisBD3pHg4cPi8NQvF2M4ncQPWsKEVTynZEUxQt6ykKe6jMkSdNI7UuOZZrK/EOJ0ikqcVpYGPDMyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736148; c=relaxed/simple;
	bh=QcaaWn7ao0nGAqzvx7AVdbzxBzIDM1ngs8MULO6DHNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eY3pB410OwToqRuya5ZdxQOtwwcboPYbZnvQ5756Pc8TtCppdLK9hdBda3eg7M9iK19744YDAi3zrG4npwj/SFgPcWaH1sFQPKhiVRKSiFIfkADNReLzaoSn5O18kTbWGz+tSbuAciUE0xGFpeqxpRmxMkw+lFRHgKTnrrlUJn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ktP7c8sV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3c1a6c10bbso198688566b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 03:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707736145; x=1708340945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52KWy+bb78uHnWfB2NXdI0P9az7MtRNqaFgDu3k1CH0=;
        b=ktP7c8sVmSp73PU3cSy6NmRz/gBYDorogxKT+4NPFFhIFqauNSWV3GKJc+2L96paku
         P2tTa5RitV7v7alp2IGreJbGcn2CF/axEpAsYVaQKsf5RCFbdGCyHZx3WhOtOqDNbeoX
         ChlBSkDlOf9WERfxqFjCi3zJvrrzkfxIdD4EBg/1QOiM3DdKsank4N8Ano1pVne6tRro
         ksRqxxsN7wT8MFI1CyUXXr9Gi3xB9J/DxmtLE2ZORUsQ3Zm2bPhrMdVOmd/rFUejscKp
         k42jwJJopeHvgOa1qd8TeyepGe8+mMz4L3t008BOdztdCAZZDfwUtsqgrvSCu8WxdZz+
         HgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736145; x=1708340945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52KWy+bb78uHnWfB2NXdI0P9az7MtRNqaFgDu3k1CH0=;
        b=ADAWnHxqceOlnemGOcBI1+I4FQYOW5La5oUeak7NYf/+PUfNSgK0BuOZZ96b/BzIN8
         3SYsVls1Hs/Djd17Cwih1KwdtFuV0OrtMl2mVZHAWQGJLg11CNWDBInX4S0U7riSAXbS
         liXxhO+yanFGc6A/w7PNB0yVuv26oy4ViGKc2yk4JDpXVV7RNlea1RoXxQh4Ma7i2QvO
         Nms+yqhGVElsYhFhpxzamFHGzYbcuiJlp8gmaIyPwJVAALnJTYzxPPOohYeqlPYf9RXG
         exetNALpIVLUaOTzOCBoDU3qLymEYPx5hIoXL3Mxl9LAvS0SYwZdDZAbjD3pcNC8JdcK
         KABA==
X-Gm-Message-State: AOJu0YySsRKWc9PsYEsOZLZViY+buDZYz/BeDEO54hq6jZ2l/1lRhwHb
	9bH8oOlMXmE59GzkUE/3M2VD8ybUweJSAFPhQ5ludaNqvJPqHM6zBO33SjyzKT0=
X-Google-Smtp-Source: AGHT+IEskGmX+804BcBVbpo8ffo4bhmGESpAvFuXer9Um/vaWMy68af/ORlyDfj6rHKpEpGZ3v1eMQ==
X-Received: by 2002:a17:906:130b:b0:a37:aad2:1cff with SMTP id w11-20020a170906130b00b00a37aad21cffmr4957710ejb.63.1707736144853;
        Mon, 12 Feb 2024 03:09:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWFntPaCTWqTGhfCL3C1y3zgS9LTagejUbOuWu98JQ6lRcsgjXYnNO4oDoMjcr9KrT+MQUtcSM6cZMqSQY1GLHQkaA7AapPbZv26anfHES/67YqaJA2Y3uJsc14ZZPUgqtsG9bqhxp5Vs3FBEtaRR9C0uFuZUtUOylGeYv9dYDwk9c41cjLXXMQ8Thxrj+15mJ8ddxFX4iezZlPXAXjdPlWk+6naa+tcFAvFPe2VgI4tYUBYiiXw3mlWQOz6aABTirxMfA7XLq4REM0rwelBBoRQYj4mu0zSOZwj/Rfq9deJ1LMxybKhcB3jXyfeYapAkFBZguZDd7iycS+V/4
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id z11-20020a170906074b00b00a3a40b7ecdbsm99569ejb.69.2024.02.12.03.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 03:09:04 -0800 (PST)
Message-ID: <254c1d14-25e3-4f4c-9e79-4ef7cec4d22f@linaro.org>
Date: Mon, 12 Feb 2024 12:09:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Compute callbacks can
 be DMA coherent
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212110827.59302-1-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212110827.59302-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 12:08, Krzysztof Kozlowski wrote:
> Apparently on Qualcomm SM8550 and SM8650 the FastRPC compute callbacks
> are DMA coherent:
> 
>   sm8650-qrd.dtb: fastrpc: compute-cb@2: 'dma-coherent' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

