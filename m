Return-Path: <linux-arm-msm+bounces-10538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBE8505A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 18:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BE21F25514
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ACC5CDF9;
	Sat, 10 Feb 2024 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrrsYBxb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB19F5CDCC
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 17:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707585527; cv=none; b=iawK/UosiXzht3mGLOc7+RKaC5ortzP4uu8yb3illMqx2qHoWQb4Cke0/HfW8gXvf8E1KIWYo50syIE49hqY9nhbtqUbUyYxqtpiWyquZPK1GPYpICZqoC9T96ci1r+xkSCk/MZRTXCyZUBFSi1UVGqlqwc0ykE3w9iQEtf4rLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707585527; c=relaxed/simple;
	bh=JAYmqqUlV+QxewweztualGgfV2rRkfEND0wL/UjZvvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PChh5194+RVyTilJtbSw/wDIuotCbDQnh5OQgInogNwPOAxMYS5YmMa4VT3grzuOcxZxFzKt0Ac4GfQPfntBJUvRI0FX/LSuWoKIJYUS7WF17lySSP8qGLEy9C6iS4Fokx7XVwmiYkEjNslpRBEMWCRs3nCKVszfkowNeG8F0AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrrsYBxb; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so261551966b.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 09:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707585522; x=1708190322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TfZD70FpittmkoFLQlNJ0pZDsjHQjPXPSTMtZpBQCew=;
        b=mrrsYBxbUmZUr/35qjlvCYV0b+B63C1zZLfCBe1bafCQr5abzxvLDD90Wu0cbQUwfy
         1lz5oc6VhOIjmNF46LTLPS8QqYE/fvfqE+beT1l+OdH71dX5thAoEzRO0moKJ4hLg1gS
         7CJP9+RzCejEXWBoPaLaJfoSbOFa8/tsIMbrpakKAe4c6do2pNiWMqVMzgznAflq+9NT
         C3i5DKtwoR69nawmKeGi3RHPQca3cVRif9pr7TUAZVPd1GtVUysA4zCMpqqwOjBA0jp5
         84ZhtuJEUgIwgt3JrOKG+/vU9rfvvU8u6hQsTSq/hsHOUuUZBRtVyAN5k7X5Ur221y0H
         uQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707585522; x=1708190322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TfZD70FpittmkoFLQlNJ0pZDsjHQjPXPSTMtZpBQCew=;
        b=RvioO8x8deoZe5ldcZ6XK8LV2X8xiSL8HTGUkxTMcDFLrwfrfB/hExlU1XS9kHitiz
         NXoTiUjF+9tT29xg7SQyHnNDYUXpaZaBPN77PDuCHvSzu3nCMCY49mkbNDiMxV1qsU+f
         uPj5QJjpWQpCEx+vEMvBmokbvPqlyNrfFDfgV0/BJ25ridvvJ9tABmdquBMYXBh9NSVy
         6/H/XL5yljyNSxyxc20GNGlFOz/QJhYAmH9jDDSutggwjBBh1eNHKLSrp2lkx85fAivg
         Wk43HaGVom4g4K3e/WNGBE1P45ljyTciP+x2cgzJZsnEedfdR0/ekA9xY8lWPNpxt8S2
         czRg==
X-Gm-Message-State: AOJu0YxgZcjgDExqKJxGji1rpI/Xn0LXi3rVntesMFY3kdZ48dJJ8Yd1
	yvK4Jhk219LIBUppBF+m9uN8Tgz+B65BsupWDHIG8/TEjTx2GD4wBLJdUIktr4Q=
X-Google-Smtp-Source: AGHT+IFGCtx04RXUILQm7OmnXO1o8h2vqVbwopH3Thr5IsJ5weeyaLzUa+uyPyFkHIzSofuPXgkRIA==
X-Received: by 2002:a17:906:4899:b0:a3c:3a84:8348 with SMTP id v25-20020a170906489900b00a3c3a848348mr974528ejq.16.1707585522040;
        Sat, 10 Feb 2024 09:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfNt4OjoeCRiRBfOyYy4qALpepYWHWTm79uHyfBBocjJdDgeGhFf5DJugPG04ycOPMvWQ+WCctKTjBZiesbNfnpJO+4s33CthifrIZ6BeKNB2eZz9BskqdRQgBBCMqXPB5ywVnhJREPyigvAFF/7DvTjGlDAbCLlgppouNo42+6C+J2jT1UosOLwtCWo5jKV3wKkbqDfIQUTM0AG1bqYVR8fxnxxWJOQYbm5aVgfxo/orfbYnVpsaS8mzJsIZ/r/CRwcA8aEOk1H9eCv3U+oyr+mhvpKuzNaf03itIXOUiLNi5aKri/1bLPWgeAo/2m2V0aCE+ySdvpPfTsSbWseLE2y5eBbPe7soOQOviA17YDNZzwqa2RKGpDrm791T9iz5MTrtw//COrksRJLdd8VhOaASNWESUH2E7SkPJ+4zsISkTzqXBkYSGbnGWPBDYqbirOw434CzLK+HlMOISWPn7tVV5EoaUfs0ZPnmLjE3Xrg==
Received: from [192.168.1.116] (abyl12.neoplus.adsl.tpnet.pl. [83.9.31.12])
        by smtp.gmail.com with ESMTPSA id ps7-20020a170906bf4700b00a3c5fa1052csm64186ejb.138.2024.02.10.09.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Feb 2024 09:18:41 -0800 (PST)
Message-ID: <a50913dd-44ec-4001-a1c9-11191f1ac5ec@linaro.org>
Date: Sat, 10 Feb 2024 18:18:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pmdomain: qcom: rpmpd: Add MSM8974+PM8841 power
 domains
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240210-msm8974-rpmpd-v2-0-595e2ff80ea1@z3ntu.xyz>
 <20240210-msm8974-rpmpd-v2-2-595e2ff80ea1@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240210-msm8974-rpmpd-v2-2-595e2ff80ea1@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/24 17:38, Luca Weiss wrote:
> Add the power domains CX & GFX found on devices with MSM8974 and PM8841.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

