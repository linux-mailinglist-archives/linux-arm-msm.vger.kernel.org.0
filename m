Return-Path: <linux-arm-msm+bounces-26031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096F92F967
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 13:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F90A284685
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AB315FA78;
	Fri, 12 Jul 2024 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzP5KBbD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6688715EFCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720782760; cv=none; b=jYiOrLPbBcbDsZy8TSpB4hBXoHJ2mNG0AQht8fUL7DStB/7BGwnaO07gHcw5gYcz5EsTpH3qM6ZEb7RrwcgKurPw9nyK1h2GR4J9BzIpeKZME5GDORLuu0QFZ18vtFYKYU9hVCbCF4RFFUh8orMkwxJ3iYlJT9v0qU/DWvPWTOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720782760; c=relaxed/simple;
	bh=uBxeb8SCIGuI1qktrQ1/KLFpOrZUdiTh8w3D+1DKC5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ux/At55jgqaX00wpulRNrIZjrM6drc7gEgQORplowIUXVYBULdgpr1BiQ+ypJatqwtceh/HYIPNYMFDBtSupyrq3Jaaz6OvbpedPLFztQMcYU0PXCpXT/bR+gC3QlTDf5dvIqwrYWrbyxUqDlDDPD4cqQFm7h0T79BIQBT4MEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzP5KBbD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a728f74c23dso272331066b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720782757; x=1721387557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=62e7V7mt0Ze7Fntnla5Y8XTQhLTURPWG6Rtj6yZgDao=;
        b=XzP5KBbDgz2fCHSiBV2Q9Q//h56TW76gSrHSdMJKTkwbvCLHWu5b2DbPClnDEMUL0W
         Heg19lp/X5wZNW/x0nSt/mGn6fz19NYWNkBQTelQr6/juZZ9+SIsWKNPs7mCr6hFhQBR
         HOXMLRn38HGmzwmI8zrhuKzv/nHvong8dfn/MmOnD+SufVlHRvaYn88aGRYyeak0vJAk
         g4Ey9irmSABwyNWs674GViCx0LFI/D+qyAdDvS29tgxE+UGUWJg9u2pPDA0nlxBY18rT
         NAPnCLE1FYMqZldU7DH90NWyJGIVYwlQJYCoGVbOaux2yX4AMhJEbzWq7KW9DhduQVu4
         hYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720782757; x=1721387557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62e7V7mt0Ze7Fntnla5Y8XTQhLTURPWG6Rtj6yZgDao=;
        b=JFkWtiycSvsrSgJd/5VrCWZKgf7KcvGjrO+FsYVZa9OqlbR5GiVl+EOxnmh6Lfcp5t
         mwPCIoqzheLHecxKjZw8x7CjLoR+FQpvqFNCjkQoMKt1ZEwQlSZKHiFnWXHiReo2fkJH
         vvOVumW8AAaeu9xYgREOXprBumlkmgDMTrcapsxvra2dmnCKoM9+mipYzRF+uoyL/9v6
         JhuAI5RA4/xQ9x0aEIdlMQZAceQE/H+AZbB5ig51GbsoK9pe26F5bFF+sCAdYRIlQS8L
         GLR4lo21a2xcqySBk1RRrO3EN5+cTomfguLBckJSkFjmHkXaHd0aToVICWaaYk53l3hV
         n14g==
X-Forwarded-Encrypted: i=1; AJvYcCWEhtDKplXRWsA5tJjPwqAUsxP7VvA8/uTfJpe9CHt25m9xAx1tzI1giBeij6Ojd71n5pJ82mSHpUXf++B+GLy64RNP7ELrTfsIBw8yVg==
X-Gm-Message-State: AOJu0Yw3sq8QtzXgEu0FalTZtBU0F/WQ2KjrhG4RDKYPOAxfn9S/JFzF
	RKrIq+s5O996O/qciHhDq+silSVG6vY4wfb1p5ZP3431v72BEJWmJjN8mk9avXM=
X-Google-Smtp-Source: AGHT+IEtXsMAQxcf7FBG5pxwf5Mz18V3ooCYcIJOA2Bl5FQ9WLo2BG/3Eh4+wSsLh4yPZdaHyphrgA==
X-Received: by 2002:a17:906:3497:b0:a72:7b86:5bfc with SMTP id a640c23a62f3a-a780b89c98amr685240966b.64.1720782756485;
        Fri, 12 Jul 2024 04:12:36 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dfb19sm337720166b.66.2024.07.12.04.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 04:12:36 -0700 (PDT)
Message-ID: <832b2f41-4a53-4825-9877-fd80d80ee079@linaro.org>
Date: Fri, 12 Jul 2024 13:12:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: Add LID switch
To: Johan Hovold <johan@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20240710-x1e80100-crd-lid-v1-1-0156e8a62af6@linaro.org>
 <ZpEN7u0u4LSFY01p@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZpEN7u0u4LSFY01p@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 1:05 PM, Johan Hovold wrote:
> On Wed, Jul 10, 2024 at 10:18:20AM +0200, Stephan Gerhold wrote:
>> Add gpio-keys for exposing the LID switch state, similar to
>> sc8280xp-lenovo-thinkpad-x13s.dts. Only the GPIO number is different.
>>
>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> 
> Looks good, even if I can't test it currently with the debug board
> connected directly to the CRD:

You can use a large fridge magnet

Konrad

