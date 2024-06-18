Return-Path: <linux-arm-msm+bounces-23044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A606B90D323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A0C8282378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F012139C8;
	Tue, 18 Jun 2024 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mz1NFZJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F418040
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717747; cv=none; b=CuPYAgCaNaLBk7CWgaCF0LxBj50uCjkrXoPuvwMwwerMsS0xb8OxxnXCOYFUm2sAUqKtjNyLvrOpv7jxGEG7amw4nAlOUXsn5BhODdVj64t/VppFq2kO4vseH5MTyuUDDyFEhWuOJLYCezd7ayi38AzC11YSVNIwxwWc59NJGRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717747; c=relaxed/simple;
	bh=gE5K1CMg0FDplJQ5qb/JC8BlAQdTg4qg1zpQnY6aNRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSPmenHHcVkXlJHk6R4+j/vkKgDbOFnMmlc1PLTlVlxzJc2PK3JliMAqJVpbEY7iwMCvDXInyCEkSpO7a8LMiJPZ3z5XsJpMUGAXBOLUMFRO7d3tnhcd2gPtS7qPv+LO3lAIvXVkrfB4RtASrhUVpT0W3ohEI1lRweWHHFRZPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mz1NFZJW; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so56951151fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717744; x=1719322544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=mz1NFZJWpiq65eSwDWuPoDz3ZahC4Hi718IVwT7Rd41037lj1hdmSWWILaMTn7hDdg
         uT2qRfGvMeSW6UdF4YznZMJqdLbiyhSSqcHfgmKCGPgmeKqCwtQ32EFv1uohr4ejLOKO
         IqAHpl2KY+uDkHSjaLkEoxHOvqxyggCBtylxaIhvGX+zIXyEp8qAd02BR7VAGAgOjsw7
         szEv5f5sdusYFc423maXJ6ai7FE3qqmhkwVE5A7oTwiRFlHIjJL5a5epbGHfgD54cPfL
         Xt35GXl0Az2d0Ima72XD1dLgVIuh+/fEZO4z4D0wSylJxwb49eSxag//zgne/iBrojPT
         mY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717744; x=1719322544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9s5hs5ZuL2Zn53VjZAMHLo13K1X8TUCRyypHJObaGA=;
        b=CWSYBjHq4a8HRsq7Ia2x0P82oNQz0hMcfk+bccuexXrVXqRwIAG9RvXU/eJGo4fVXi
         w3rPChMN2TpgcLXUMk/lm1lvFlHEzmDcmWu2xtcu0f1wVV5sMW0Om//SIygLwDzvpFrt
         kcvclYJbfljdWiH7y3qYt8foAzVQXk+0RGzRPzfYNXGe0XPzZbC5CCMK62pRrzO6VpXD
         G3Gi8ATOFOVeZLe6nYFbXwMxX98XplJjCWhdMPoNeyxfCc22RENKFh3qYaftSER4kvDB
         IiNnW3du2akl5jr6X2LJ7+b4kUfT3vTTdEvsus78Hrb9TfamGGkVMr+8MbyKT3jnJtDY
         hF2A==
X-Forwarded-Encrypted: i=1; AJvYcCVeSjge9pCYMaf2xFMM/FScJQCbIP22g+8tZUuTCbZ/I/9IFfsQnhdfBbz2YXJF/2ejevac0mKEnsqbHv/yQENu7CUXzOyQSyWgl1CfvQ==
X-Gm-Message-State: AOJu0YxP/nnpeZNxFmt6IPU81CX9AdwDiOlpoKmNjY4rBTo7XCeUyxei
	ehXyGaLAryIimBtNx/JlMdAfsw7X3K0PNaGT0AxsIX31AZ+2rLeo7EOjlI7BVe4=
X-Google-Smtp-Source: AGHT+IEKKcmYXRZGLCQoh1/2bz9eoQuNYXaJrxW4J4yKb9lxs1Zcann/PJVH0hN3sJo50UZMHp4w5Q==
X-Received: by 2002:a05:651c:546:b0:2ec:fa4:e310 with SMTP id 38308e7fff4ca-2ec0fa4e522mr96437711fa.34.1718717743930;
        Tue, 18 Jun 2024 06:35:43 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c89ce7sm16950161fa.112.2024.06.18.06.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:35:43 -0700 (PDT)
Message-ID: <c0c30696-0d38-410e-8a59-e5ad146da7c8@linaro.org>
Date: Tue, 18 Jun 2024 15:35:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Name the
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>,
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
 <20240618-qcm6490-regulator-name-v1-1-69fa05e9f58e@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-1-69fa05e9f58e@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 15:30, Luca Weiss wrote:
> Without explicitly specifying names for the regulators they are named
> based on the DeviceTree node name. This results in multiple regulators
> with the same name, making debug prints and regulator_summary impossible
> to reason about.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

