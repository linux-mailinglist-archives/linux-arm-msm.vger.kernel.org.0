Return-Path: <linux-arm-msm+bounces-24724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D108B91CCFB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 15:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862B82833EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 13:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861187EEF5;
	Sat, 29 Jun 2024 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6Nntv9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4077107
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666492; cv=none; b=Asa7x20agh+Gn+7J3J14FSzj6yzaJrrrQ/gq4ElKTc/Vyd0/W1kBcAQO2rAba+213Ai/xSCX9Njm6/tAQHf5yui7JPRXqxhaGSeczbYGcP2+XFH1mH4zPcp0p1Ov1wIl0daugxbvz846oOwlEAenUmObb9btEQDvkUDnuqgXXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666492; c=relaxed/simple;
	bh=a1z4svd2KApMipvOvkQdNF3dMOWZXDLZT9xmYSRM1s4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fojcD0wZ8afWJKn67j/IZgJsiuZyYGKyN3ZG2kAS0gZU4fzr50zwy3dzeqKLQxZFdncsrr7y2z3dDWP3Ni8n+B1Vbs0UrNnKw/KPnx865lSf+rMk2grP9uX4O4cIiF1mH/i+Tuse98wRTUlROTGsfkyU3yRyqlhxuP/cgm4+m7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6Nntv9l; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e829086f3so408812e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666489; x=1720271289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2+DlWBOIGOUot1NB7lncX8FvlbhuGpLLPEzsuaElYVU=;
        b=w6Nntv9lIV+0hgYE+o5e+17gH5asqSGXQJHWrHZ4KyGD+7FfizHkvWc7A7RnVLYyLm
         tCqsH24VX4KpCvkWxsb+Ko+QKm16ulQr6V7nLL9NaKqW93E9Tw/cckI7hzEXhj+Y+GPd
         Bh3QNemjRhNN9A1k+qxgoTno/XuqTr0x7M2kyUi2+WDQOwHS8+qqWhIGTTcoTmDDXiji
         Wwv30b0rREM2vU12g8dSEGrrmEed+fmXEtgrCngS/lg4nYGkxMbvzvN9jYEFm5z0eY0J
         HUqNASNuQuWr5NIV9JLVqVVArlmZVWTjBPZABnaP8/3nchqMs2LszW+QKVElAQXZNsPj
         /j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666489; x=1720271289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+DlWBOIGOUot1NB7lncX8FvlbhuGpLLPEzsuaElYVU=;
        b=thgwWOFlNpiuEfl1M6+cdoPQVVxkmhcr7/mj6t3KfQY6wR+Q7xALKWKgFP/Svq99V3
         OfqOPY6iKDb4pOcL1utr3CNjKrsEp7nsnl3+gi0MX4bLO743pnp6fe3zwYM3VJrxfnoa
         KPfgBwrXvewfmmS453TzdZu7dsPy74ev6LGSpNqP2IHQvvtM71u/sqvU1fjGf5adfIz6
         N96KEQofqF3a6WfE+EAlbPsZqM8VyJYYQcZ77aNnUG4UzTuwRcSke8OD/rbQLdxJ31uq
         S7ynbK4AEaAmbSYVrxjTq6NFxvhSiN4SnYprmTb5fONmjrl2qnN6TcxgZz9Y1TiZolWq
         pgHw==
X-Forwarded-Encrypted: i=1; AJvYcCVl0TluVmsrSA2KB30auML7uVEjJLsinjx8tG5LsqhiKdOeVsVud3gLzw2cwwgriCO67aMMvkCYI5/nnM8vo2x6GNGXzQpQz10PbTdzHA==
X-Gm-Message-State: AOJu0YzFKAmHOtpgfzPo5uwJCikdxl4CzYZuAkPflFSns2k5GNeKELBQ
	c1tEX3Dd3TXsDNU9gc1oWx64VT1L0ExVFr2QpWoQk/GbGXUbV/tkCapgRBPp9KM=
X-Google-Smtp-Source: AGHT+IGgDIGbbm3HJUo2dpldGiFw1eLh015QSIEQxsu0mz0rkCkOtS5vgeq/aUnP86xu2Op3wTOwhA==
X-Received: by 2002:a05:6512:2254:b0:52e:74d5:4bf9 with SMTP id 2adb3069b0e04-52e826f7297mr816048e87.54.1719666488789;
        Sat, 29 Jun 2024 06:08:08 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2780asm596854e87.178.2024.06.29.06.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:08:08 -0700 (PDT)
Message-ID: <6feb2192-7f0e-4813-851d-207b2b9918ee@linaro.org>
Date: Sat, 29 Jun 2024 15:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix USB HS PHY 0.8V supply
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rajendra Nayak
 <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240629-x1e80100-dts-fix-hsphy-0-8v-supplies-v1-1-de99ee030b27@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240629-x1e80100-dts-fix-hsphy-0-8v-supplies-v1-1-de99ee030b27@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.06.2024 8:29 AM, Abel Vesa wrote:
> According to the power grid documentation, the 0.8v HS PHY shared
> regulator is actually LDO3 from PM8550ve id J. Fix both CRD and QCP
> boards.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

