Return-Path: <linux-arm-msm+bounces-20406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CFB8CE7D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45B251F20FC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E558912BF31;
	Fri, 24 May 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liUNCJIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223F1802B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716564342; cv=none; b=c24uWTrhOvAAr7AV/znDstpBhsGQMttTEcfc06yABlo+lr2jFHucjYqi8NJKFwGvxyUGfMXD+xHvL1o5tbMfq1ItAPgqnwJiNMTTZke3m6hce49EDgdsNHjwh4vN7OG8PxlFOh7JAbkZO7CK9ggXRyzp7nNIs/STI/scO2UvjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716564342; c=relaxed/simple;
	bh=EXBbYWDTZ5vMudbL6r3S9G6s5w07YixVypmFO+v1x98=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iT/Dsax7F7DmpHS1QY7RKVYtOUFA7oOA3eqk+TX07wvFsQt7+ktYFaf3JqKOIks8mpQSOIcixKgBKbxJB0KCTDL5Ij/91ZyIQXxdXRgsHSQysfrruXB0LNfPk39bfXMgyVYN3t7uZmdz7eNFrCS+sessW8AaiFl0zm0xpw8N5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liUNCJIf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a5d67064885so868305666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716564339; x=1717169139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRxtYgnQO5H1s1nb28f6mNffAm5rNdVhsv3KUCOVO4w=;
        b=liUNCJIfMqE/X+1lVFHeGGqyFucnStB773a7UNN+QhHc4GCCPXn1NdErpeozOKVaD3
         AVmzyZHu0ePJ0vY31mdtHd4uQZWM0zQI1X8TccXgTDvgnb5dTMGn49wmxC7y7bEdQWlK
         WiLPaj+evKRhNmZm7VWcRptzwyFv3xYX8olRb5tvs7uh3DN07sP90XJg0mLlEtN6Fh9a
         ac+TpyL3YjrP7jbJwHClGpWrE5MM5hMdcVUS1tsrvLt4SlW80RSr/8+W+QVribrNnz0k
         u8zM6Mf3XCStwZ8n9M3jOYAIxsWxhAimcXfET6oNqXxedWYz2Jtob7FjIa+QrBO3DcaI
         E51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716564339; x=1717169139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRxtYgnQO5H1s1nb28f6mNffAm5rNdVhsv3KUCOVO4w=;
        b=wY6laPgmk3A7O20fhwmIaz4jhpK1b58nnHHVO2jJjm1z3M/Nc8NHs77aUWRm7UgZsg
         fANh1nsceR8iSNhksvZeo6RQlCOBNyZhf3fFJywAyy48n8acz6D7aV6mvyJrMP+xwkJn
         FNE6xTsWtJ++qgQXJKPXU1eRKzCst9K5IqpULUfqvA9AESaY5MuFtAlTWrvm+k1PNk63
         GaOHVC7BVB7IrGc3BzyJdCSIFMdzcI1338ZjWb6W/99vL70UNgww3fpbbLqy1coARFcC
         e9W31pE3wJ2vxKd5hFsjVOIW9EYTYav9yvX7P3Luapxo52Klmzg3f0Y9Gi0ok8+mQgNU
         hbLg==
X-Forwarded-Encrypted: i=1; AJvYcCXiSUiv+upYcmGCBupKQzpjVnDjnX2ghg1ds4wlJbn8y+e495R9pTIsnfeuHrjSzs+anHXZ0X8eiaeZezRDkHt7sgCcheOqTq3+lyhshw==
X-Gm-Message-State: AOJu0YygDa1dD/3r2oAZdZx1LjYOrKIxQ5i0eAnWt5Pf9QARna0fdgYR
	iZFfUjVix6zi2AUr+Q0yMiiN7DkE1KwfIjVqm3SCrN9qZKIirSH112kjycQusHM=
X-Google-Smtp-Source: AGHT+IEpvTd4g3feQSSGBGiXoWWyO+K9DkelekEXcAtdBf8B0TYiNw1/ZOzzQJlBNE6Q+uPLEp61fQ==
X-Received: by 2002:a17:906:2343:b0:a60:c514:31d9 with SMTP id a640c23a62f3a-a62641c2e74mr263714166b.6.1716564339570;
        Fri, 24 May 2024 08:25:39 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c93b4cfsm144364966b.69.2024.05.24.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 08:25:39 -0700 (PDT)
Message-ID: <4a31fc5a-5d34-465a-84a4-1b6f2393130e@linaro.org>
Date: Fri, 24 May 2024 17:25:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom,ids: Add SoC ID for SDM670
To: Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240524012023.318965-5-mailingradian@gmail.com>
 <20240524012023.318965-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240524012023.318965-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 3:20 AM, Richard Acayan wrote:
> The socinfo driver uses SoC IDs from the device tree bindings.
> Add the SoC ID for SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

