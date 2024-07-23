Return-Path: <linux-arm-msm+bounces-26909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A50C93A182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BC71F22D3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D077F153575;
	Tue, 23 Jul 2024 13:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZmcCcI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E020153569
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 13:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741519; cv=none; b=oz5iiIFIlnuBDd1WzV5Wq0BjNJ5w+2TliLStH6vL/IM8XwYBvZKPSuAuhVW5NHdm+kNMhGPaogyDVxHg7hBJqLj1YUntGn44l2zRdH9siahj1N6RXz/L6+JBNJVfG/eMb4alMuqwb+kaw5wExYjEjziS86L8dnmvnBTQ19r7Yb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741519; c=relaxed/simple;
	bh=zCNh2P0/DBwn/kKY0pffdHi0nOLku+i55hHluL8cx5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gN3forlCdFM8OFxf8pLvvtXZKp54aaca2QKaiM9VKyOeQrGJNy7AOnCtfIK2FZIqZ4vixAQc6zfqQHkp3q+vPj8np6WAWWkat6Wplm6FZxcGY5T9Bw61B9HLXhSU7AJqi5T6vqyZgTOL9rw7RvgqB9yV16KD5ItMKcVRNzcOG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZmcCcI1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a1fcb611baso4662775a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721741516; x=1722346316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g8nrhlbIH0Tksi46Uegy0RJi7Yrw8vhJlUCiFl/oSgs=;
        b=mZmcCcI10DmEixeMdcYIQyguQCQ6wunSVXnioK/nE8+I53+L+P2HyO275IsMPDGxVD
         Gqo15XoRY0nK49ZsxFTvW0HyaImqxxC8CJYqZDTPvhsKYnLNRluLWm/0ulX4VeMpcPBB
         vZdxh/ZSLXEbxMUerpxgDenX+CBymhrJS63/N1RVr2PqIFNNrKmUVkFp5YqUgez0Qq26
         NyxQ547zSrFDVJofzEjsjPHG77DTiM704q0ZNoilGRQUnjksGBd1TYFHPtVDvv2ENc0j
         L3jhEokiEzPen70bpf/gjopZrPFrifyukGeFlIac+8+QAnCOJoXDaDfCPAezPpLppXlb
         hTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741516; x=1722346316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8nrhlbIH0Tksi46Uegy0RJi7Yrw8vhJlUCiFl/oSgs=;
        b=MU9qcFUPV9joyB3oO53SSrV9cL7fthr46U898f2Zjlq1ZNxSOLd78SH9Dx2C7yDrMz
         NB0NtIYHvB7Ag2hRzfSwxeMendFE4zHdlAqgP/LiZTUjAatYjzYWF9UCXkQju2aRNmZ2
         DY0obvQSme7TyeFkBILGfYsSiSCAF45ZwXiBPPg8DW29YYnBviJqlLUxjQwWpgCEhIGm
         cBf1Samj4bFtmwmQQozevW/bdpoJjVYaNoMsr2LBj6sJwSLJ2VRHEj29Cv+C1R268Nux
         zr0IEiWs5r3faQW0Fgsodt+7pobuObY20fTjo1IWGe34S22iwAs3cFraAFadga0R6WNn
         DTrw==
X-Forwarded-Encrypted: i=1; AJvYcCVOFDx49o8QM3rVTtNRUhwrk1R7Y5khbdY3vwxxGPGKy4viiPz6QfgF5bL1FxOzY/WzdrQhWhQS/cw/sbs3aSCiCYaYsbGMAs0y3FZcRQ==
X-Gm-Message-State: AOJu0Ywwyl1tYtFxPTQ7s3VXNKKklVTUvXAoy77IVJzVJlpv2dHFcvOi
	61t7mQ1xOVys/glrI3Kqdy1FXX0+BwxqNpYZnQa4u4PkCuoLz33xkirE0hiwykM=
X-Google-Smtp-Source: AGHT+IEGNsf51enIuYh1jt7A5JhSN5f+kZKDQoJB+h6ulLScI7FnKYtzzx7GixXw9yc3mCNJZDOkKg==
X-Received: by 2002:a50:99dd:0:b0:5a0:e62c:61c8 with SMTP id 4fb4d7f45d1cf-5a47bd7c796mr5991436a12.29.1721741515455;
        Tue, 23 Jul 2024 06:31:55 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f8c1bsm7530029a12.60.2024.07.23.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:31:55 -0700 (PDT)
Message-ID: <5d448aeb-e57e-4203-a1d8-ef298fce097f@linaro.org>
Date: Tue, 23 Jul 2024 15:31:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-rossa: Add touchscreen
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240723131441.1764-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240723131441.1764-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 3:15 PM, Raymond Hackley wrote:
> Core Prime uses an Imagis IST3038 touchscreen that is connected to
> blsp_i2c5. Add it to the device tree.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

