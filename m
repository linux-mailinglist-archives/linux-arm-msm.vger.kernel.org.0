Return-Path: <linux-arm-msm+bounces-17523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 820878A5EB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 01:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C5C28502C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 23:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F00F1DA21;
	Mon, 15 Apr 2024 23:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1KR7WZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF9156979
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713224700; cv=none; b=qRmTofan+NpfhD/u7ytsH5aIxNVk+AsgVUAKW6sLiWd2L57oHICD3LDLtmBppBNBUs0RWgIUB8NEQa+8bngoKx1aWKTkPb2J+pTVcUl5nlUpscxF4Ubeo8EyTL/SCPkLRtSNJHrujUxrhG4O2r2ftnVIJvxSKkcLvwfzgHFaQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713224700; c=relaxed/simple;
	bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkFvi9yBiktDFdX8ZFakRJYycQS12LwJtNjwQavWee6guV8ffbPWy9Lwmy9CNmVbn/emXLvvZHKCgyg+Jzapjt1QzR3crHemvAso+j6Sp9FuPBYHipCfyfvlHz5u3h0sc0xR5ChIRIictbjg8Tk3J2yZbs05T7SqIIFQYt7b/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1KR7WZg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d6e23253so4145120e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713224697; x=1713829497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
        b=e1KR7WZgxSWTzDtMhhuAeYu4wD0YCTK0GcGBVqNOfCRrvJPNbuE5WC50k/cpEqrK1C
         vLVwgNmMgEvAyEZA0xN8kFcFAdCPkZ975rRLqHT0Dq2nya9FnotJNrxHe496fdtNVBYA
         8i3QnK23PYzJamlwayJlTX0ukh6fxK7dEjqoBk/43mzLuQ5sdiwQJwwwVvhMA7bcJrWz
         Sz0Ik8DtEN6bBj875VQ0Z2Oj5Vl+52nCKoQYjTCxBAAu/N28rmc2TuFeqgPaJlqezi8N
         vMPiSZnYZg1ogMH44YawnaeDElcvyTKmlMzsrCeBkm7rxSKtuGgiA/4jwZU55txiHe1D
         UGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713224697; x=1713829497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yg3OygJVyqd8LdAwF5YHyIoztUiURYJApP0WPH4qMc=;
        b=bUxQpPxw0hIqHlp6uhv2jxFcNiFIxxZrwGj9kQSis7c/eEUx9FHceFjJw38xLlkCMi
         ZIHOgymOe49+6A9jX8QmXCH7X4xBM5jDg8RFRg0dnfzanYYbI0Kv7BUZv6LgZVpRbakH
         fG7O3mU+dLMPIjgFVRzNYg4JhM4QvkYqw/k7prYYeuVl+3FKCzMPz+jIO4p0EHkORSQQ
         1GsqEbtwIdo2sdL09ubP8E19D0GnoVRPc6g93YVUfeAT5eoPRrIwlMJel/mZLX3yx2aY
         1VcWBZsK+EqToLP/RNT3aOzadizFRIHSINILfkjlUNI2+BXxH5pQlQmXEYFyEQeunr86
         nuLA==
X-Forwarded-Encrypted: i=1; AJvYcCWXunvDsanxAB16yd1GsiERZEuNDK6r23KfPAa2UMfVCNPG84ery7EBhRjBjj8rFqII1yPW/bU9qZa0MD2rbotSA8wnxQTaMJzcFmgQXw==
X-Gm-Message-State: AOJu0YwFwXRMtjWu7zDbw4YGp8OH6UTpCis0r9AibTRZQ0F2c8uEYc2z
	G4oTT4Kc3HiA/zrihcFK6qi1KAfQkvtR2btfwtNY9jYBfkE+jgZtReEK5n6b0eI=
X-Google-Smtp-Source: AGHT+IHBvH4Nm4RXQK0TC/6z2MuiS3bWVyCqwBvp8+QBi3zVVu7rpiLllbv39OJbDZlfvC4nAFlbTw==
X-Received: by 2002:ac2:5dca:0:b0:515:b164:4112 with SMTP id x10-20020ac25dca000000b00515b1644112mr7286371lfq.68.1713224696673;
        Mon, 15 Apr 2024 16:44:56 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94? ([2a00:f41:c52:73b0:74d6:fe8a:b9f:ef94])
        by smtp.gmail.com with ESMTPSA id 27-20020a170906319b00b00a4739efd7cesm6068859ejy.60.2024.04.15.16.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 16:44:56 -0700 (PDT)
Message-ID: <f4cbacca-c2e7-42e7-8ed9-dbc6bb59f1ce@linaro.org>
Date: Tue, 16 Apr 2024 01:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: i2c-qcom-geni: Add support to share an I2C SE
 from two subsystem
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, andersson@kernel.org,
 vkoul@kernel.org, andi.shyti@kernel.org, wsa@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240327101825.1142012-1-quic_msavaliy@quicinc.com>
 <ccb312aa-3c4c-41bb-a3f4-b94971edb346@linaro.org>
 <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b7125064-4b20-438e-ac1d-7107d28b1bf9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/2/24 08:21, Mukesh Kumar Savaliya wrote:
> Thanks Konrad for detailed review. For dt-bindings sending a separate patch soon, rest comments tried to address and updated patch V2.

[...]

>>> +    if (of_property_read_bool(pdev->dev.of_node, "qcom,shared-se")) {
>>> +        gi2c->is_shared = true;
>>> +        dev_info(&pdev->dev, "Multi-EE usecase with shared SE\n");
>>
>> How would this line be useful in my kernel log?
>>
> It informs that particular SE is shared between SEs from two subsystems, hence respective debug can happen accordingly in case of the issue.

This amounts to "not very useful". As an end user, I couldn't care less
about the nitty-gritty of firmware-hardware interactions, so long as the
thing works. You must not spam the kernel log with debug messages, as it
slows things down and makes actually useful messages harder to spot. If
you want to keep it, use dev_dbg.

Konrad

