Return-Path: <linux-arm-msm+bounces-14277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1D87D4A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 20:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658021F226DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 19:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA5B5337B;
	Fri, 15 Mar 2024 19:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5As7fuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD25336D
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710532338; cv=none; b=iiZmaqJQNXFvJVJrDp9ge1e9J54piavycXghAwMf6IrhJi6m4gFKpd1SNcJjbO0jrYMugU2U+DI3IicOEaP6zecc9iVa+Asd/VlzAtR66W2sbv6MmVG7NMCH6nvKxpVkPZ8EbSGgY0p0mrb5rZaajbc0k7Vpw8E20tgOR6bjeGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710532338; c=relaxed/simple;
	bh=Oa9QWweedRF6jpfo/nRk+i60JCiExm98a5CdcH2Mr+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QzN7uOXWVxXqcca6F/CemOhsM5UiscOUEgBcqmu/KJ0/nviMeA/c4kJNM0ly8ziV1i/kE3MVxxB9EvFLCI8TXbzoJSENj9cTre2fBX8rMBJj+lIZGXDBRqCMX/eQCyg0eH83QRb/QYEvxj8Oces5tsPONR1FoGxPmXtDPLNYjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5As7fuD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51331634948so3309582e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 12:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710532332; x=1711137132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LvSepV5Zd+55lgwXRxtPp7+i7xc6kKJVG1QWydHr3/0=;
        b=B5As7fuDJ6/8iT852LsiNE5jsCyNggMIsyJrKV0+WANOtPaO1cX7/J0jsD21xRiYtu
         m2XGH/UdlCCwrQ6U2t1Xl2qA+VCjekq9T63QNh6HFb11CHRDyNgOcTx0nG2htCe+lD3c
         oymJ2H9aVECqy7T+XnMoXtG57JN879R1YJ/hGyROMP5nmHseVFcLxKCM6cGGzNoIhzli
         AIO3hex1cCpB3n16Frs5hXleHiwC/8I2PPq0hExJiHfNVB+5WijdGf94vf5wy84mTUGb
         p9y+4pU3ru8WRrgTDt7YIj/GyPgrvtsklnjQz/UCM9cZeYBlrYpCyoWmMF4nbTPhUDJA
         Hf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710532332; x=1711137132;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvSepV5Zd+55lgwXRxtPp7+i7xc6kKJVG1QWydHr3/0=;
        b=wm7a04z4a/6AY3JOJ63nDw4zCgjcN/04i7K8Pd1729TRdwTbqEBv2615Z4qFdE8ERo
         a0gvRQaBmBEElhkvr6Mhi2O+QBLwcVQZJvpJwjlOXpnHIvnpxWHRk3/JCcYBuc2DzqyP
         3e+mYZyZB2FNCiXMXa5utTRJgO5zA+waRehYKMAT6AdhoyKTQGfm5lZsXE8DRaIqg1AO
         8O0llmasyvzCaB9YajI1QMsFPqe6MmauCjG7YNv0CVgpikYx7MOjjj6vj87/JenmX/Si
         4XOKFwGRD/eNE6lyDBytOLd3lnmTm9q9lp/5EWKoJbR6IqyMLeKx4G4EcBTlJfYrWX5C
         DdbQ==
X-Gm-Message-State: AOJu0YxsNekYwtu5dnHZIKeALFryB3RSMYgXXnyoES/Nb6hArohizaox
	JJTd2AayofWKDplIRd6TjkQGSJVWOKioO4+xiBV0LZBYugNygxajpbrjwtlpDc0=
X-Google-Smtp-Source: AGHT+IE+9ZShxgEICTEsvSGunqK7oZPfU2+fKgKDLr/Z88m6fSC8xKsuOyAOJBFcl64gaHm6wxt0Uw==
X-Received: by 2002:a19:2d02:0:b0:513:dfac:b29e with SMTP id k2-20020a192d02000000b00513dfacb29emr86198lfj.26.1710532332046;
        Fri, 15 Mar 2024 12:52:12 -0700 (PDT)
Received: from [192.168.223.169] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id v27-20020a05651203bb00b00513d595f775sm477121lfp.101.2024.03.15.12.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 12:52:11 -0700 (PDT)
Message-ID: <82d2249a-2854-46e3-ac86-7b5415ce3590@linaro.org>
Date: Fri, 15 Mar 2024 20:52:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: qcom: Add Sony Xperia Z3 smartphone
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240314-shinano-common-v2-0-a0fce1c72c74@z3ntu.xyz>
 <20240314-shinano-common-v2-3-a0fce1c72c74@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240314-shinano-common-v2-3-a0fce1c72c74@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 19:56, Luca Weiss wrote:
> Add the dts for the Xperia Z3 smartphone which is based on Sony's
> shinano platform, so at the moment there's little device-specific dts to
> add on top of the common parts.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

[...]

> +
> +&smbb {
> +	usb-charge-current-limit = <1500000>;
> +	qcom,fast-charge-safe-current = <3000000>;
> +	qcom,fast-charge-current-limit = <2150000>;
> +	qcom,fast-charge-safe-voltage = <4400000>;
> +	qcom,fast-charge-high-threshold-voltage = <4350000>;
> +	qcom,auto-recharge-threshold-voltage = <4280000>;
> +	qcom,minimum-input-voltage = <4200000>;

I took a quick look and without going deep into downstream code,
these values look sane, so

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

