Return-Path: <linux-arm-msm+bounces-12428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EF861F03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 22:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C181F25F76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73AB111A9;
	Fri, 23 Feb 2024 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HpS1Wodt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D61493A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708723564; cv=none; b=p+m7kKE/8k0C79uE0maW9RG3iCcmd8nDTPYcnX7FHK0HJKgBTnyluF0duQTZr9I65wqVQD1Ct5GzimLS74xE/7aa+6AuS3xXhblu/HrDscwEVsv8TwnYqOf3EU3I5XKx6KP/Z3w/sl7A/D2kUc8PR5kQavD7pwJejCb+BgCIUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708723564; c=relaxed/simple;
	bh=Fjsaq0/zm7p9DGpDTFVZigAn4TZsyY8nqWWzMK8GrSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oC95gpogMLTnbE1AFAIPLDUP368GK3JM8lV8v+xhp8diF99WZGoCEGzbM9559LqPh6uGOy4WqYQ1P4D4RsQrjuB7UmWp2aesxdQSwnZZ6Y+cDpR9Mn+/Di6iR5VXEkNhQT1eL0MidflMEfp5OKNIuhGCcr8thkcebCcQgzHW350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HpS1Wodt; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3e7ce7dac9so163242566b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708723560; x=1709328360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLSzs3FTcuEY5t38t/V56bwc1PFgOdBSCZw21m1qF8I=;
        b=HpS1Wodtq0lspQXrqokaLnVzbVi9JgR7GWz3pQzlwcZSUqjnYmN0PKws1Gl5IdTxvl
         gYs5ssK+ESeb8vLQ0DxkDi4KyA3w0NLCplivMmZY4pn7n798XS50kN5mBtdyLYTVMP/P
         pwGTJOZZQMjWP+6mjvTLdXHKkwdbUl6xRugaacDZxM1q0WnAT6NeMPf28Nlhyr4CH1zq
         Avq9krCwuGcPw71A4GlDbPEwN6GuS5vZ+fBKJOWSiTo3ctVR0z4x/1aOwIJ0WJOWbpZV
         nmBpvlMCHR/rkGAUAMfzX/Aw/XKXmWYwAkuP07+Cxs6RpF5BYZ8K6Rc0v+cR8MOCjq+G
         H8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708723560; x=1709328360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLSzs3FTcuEY5t38t/V56bwc1PFgOdBSCZw21m1qF8I=;
        b=N43pEqKN26Zxao1LUsdjPAM5gszJRxw/HyF0CBXuoTXGf87e0NLKtexRVaLQGm1F2+
         PBvcuypZJeD7EAvIqDoL/Pe5N54u2hiEdJQpYjysC1r4h94W5odmyFtsBeJF/0FJ/cGI
         rGR8wP3hXvYUkMmlRbNsm3P9h1ugCpkWg1i9lZRp9+TcvBWn5SWRMSTukG9rJ4xv+ic+
         3agkq3MOcGJ/nhHOhULB0I0uFZ8+1XKD7+IbwfFs9t48APHLYWuwBPTQAmdlHkqiHy65
         gsoXIwON5w+N5aqgayIiqxOUGXjNqmbnXhd3uE9qN7b6lhOYrL4X5lsWL0iLM1Lcte/M
         itVg==
X-Forwarded-Encrypted: i=1; AJvYcCW3ZLvF4vnZS0Oa49j3omYPjbrvs3TQoeeyyMRGGNu4sUgo3lXNQj4xmH5MmloW/F9qWFftB1upQIIl56DSIv9/CUV8U6x/nKTDF+nPTA==
X-Gm-Message-State: AOJu0YweoiaaxfPqKCmen0QmLv2qed6XcDwK7WftbYsAX3gk2YSpLK4i
	BkKTeonRo8Q0lO7PYaKc5LUYqISLHam6qexUCuYlKtyDIETkPu4kQe+3EpJcbUk=
X-Google-Smtp-Source: AGHT+IGB3sLWmREenGlJy16NLBUXNgf5aOXR9ELe+WF8XNoniAUPy+HzYUZMMj8N1J5rkLgmX37aLQ==
X-Received: by 2002:a17:906:f894:b0:a3e:72ca:700d with SMTP id lg20-20020a170906f89400b00a3e72ca700dmr583283ejb.45.1708723560684;
        Fri, 23 Feb 2024 13:26:00 -0800 (PST)
Received: from [192.168.179.2] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id pv14-20020a170907208e00b00a3f45b80559sm2738150ejb.139.2024.02.23.13.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 13:26:00 -0800 (PST)
Message-ID: <f3c86b3f-d78c-463a-aceb-660828b9cd21@linaro.org>
Date: Fri, 23 Feb 2024 22:25:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm64: dts: qcom: sc8280xp-crd: disable ASPM L0s
 for NVMe
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240223152124.20042-1-johan+linaro@kernel.org>
 <20240223152124.20042-9-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240223152124.20042-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 16:21, Johan Hovold wrote:
> Enabling ASPM L0s on the CRD results in a large amount of Correctable
> Errors (Timeout) when accessing the NVMe controller so disable it for
> now.
> 
> Fixes: 9f4f3dfad8cf ("PCI: qcom: Enable ASPM for platforms supporting 1.9.0 ops")
> Cc: stable@vger.kernel.org      # 6.7
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

