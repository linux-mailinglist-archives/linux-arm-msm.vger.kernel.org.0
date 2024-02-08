Return-Path: <linux-arm-msm+bounces-10148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CA084DB2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 09:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 609CDB22A1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 08:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1855692FB;
	Thu,  8 Feb 2024 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5LSt42D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A98869308
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707380151; cv=none; b=nnaTTF5ZKq2egTNUlfnJRV0s6zonF5kN9g5XTtRSXRmtvL9bO04Pnqd42kT4wIOTuO9hgSEs8eaIHW0As5t5424623bG7GMUS2u22JTCYuBTNt/3aC4Shst1gkGjrASqgT7Bn2OIXW81rjIXsaTekcLNK2aEHGTEOi0guETn/Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707380151; c=relaxed/simple;
	bh=w34BqXAkC9cCZgiJT4hxTRUSpWFK3C/TIoqyI9bXHFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aibpbaPjvVgZZJtHLtbRmzSQI0fqy7D+Zp8FUM0hd2mjW3nm+gBAkRRYCH2NQ0fTQlJXB2/MEjI38IuB/M3YK5RicUCusa2qGR46+NVZoBd+RpJh2t+V/5ZgAZ+uJZNClBUZXCv01gdQu3HxSHBypIKpK8VSM6wyPC4yOqTp5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5LSt42D; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33934567777so1015968f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 00:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707380148; x=1707984948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Zve2rnpl44GQtsgnndzT9zpzr65KMlE60XiRloFy2Hs=;
        b=Q5LSt42DzjwL7GF2imDffyhyQlBqVnF6ZUtNY+6e9NrBma2snpXDWuDwstHVMwdEIc
         D1Vm3QpkiP2jLjzl9zHnAQPZZsAvOZ6KZmcAVS7QgJeGfmWL6YxbyJBUMqC+yTRjSQZe
         d/cBHTuVCUOQ46ZbF8MG+xcI2M+1CEcfvvTu8VB/zovSXkJUvYVJiH1UFPrfqHakLNms
         A29pxKE0KjjsZP2R6DdYfA02QSlLAu4yzKJot1VJxSgVmal8DMqRXMbw/Vk9zjZyzdqf
         lZq6394G+Vhd/HLDaf0otMs46ce+mIgfYgW1ys4dhudez7ByIR5wEPcTvtwE6NHlmv52
         urSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380148; x=1707984948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zve2rnpl44GQtsgnndzT9zpzr65KMlE60XiRloFy2Hs=;
        b=V5cUxEr+U8BFKT68lBKtj0doyKcvqwer4IzR2OQpFC5+aUoqWP3NVYS+KNDU263xpM
         iyNOun+o783OdULltu4oWR0ViwGcCl1a67tTqyu5L0T5YICdLGuSVUZaPNvqWH0hGcln
         pxqNeIx7SPAui8xLutw10lnjvojRWYkniIsvYZg2glVodzQATiJX5nGvL3Bv9QIcq3SA
         /BoJDv/jbo80buZgZRAByPg+wW2I+M8lCWAnun0YFs2IBkeWtpAIO6dkQuI0dCvjLwyl
         U00uOia/G27XPrtM87ri1MDrmBQldaXwlgn+ZY2nijgivDI+j4HqrGpc+rbknsjziFB1
         7nig==
X-Gm-Message-State: AOJu0Yz1cMg2thxM8Zw4hHIhXUuDhFXQteNPYPcWRntJoYg40hhv90Ur
	08IHYIdrAUvMTCNRfhNZ8Pl455Y6EHzpCfPuoTrvj8YPHi1BTPtO8H6aQ6oouuFPw8KGMMKp3R8
	j
X-Google-Smtp-Source: AGHT+IGE3Tt531RRiqcQV8fSCjHqlixSeJpAt1TqmJ3H3McEB/ddxfsvVqh9lms9cL8MLm4xekMfcQ==
X-Received: by 2002:adf:eac7:0:b0:33b:4d14:f25 with SMTP id o7-20020adfeac7000000b0033b4d140f25mr3908006wrn.44.1707380147751;
        Thu, 08 Feb 2024 00:15:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsDlzb/i0oMKoGvT8BLR0vWCtisM2RtibU9mS2d1VO6JueIHgjArZTrcAogu73FF+R59FxYxJ3Hssuisbnl+gexgH7o9kU/7aC0vsWBICFWh/FZzLw0N9IG4QZrRBv8umwPVYqo5tR5IvbvzpkDPhyvNFZ76bHGiGovKm0uV7ofBJQA+lMikZW/hEzHljVVeJyNRHTGMvE0I4tNI2JzM7VL58GIq41f1ZLrQ10c+4PJMyDlRHwNKCY/9WmhTqCXs9+pXBi2YihGot9e9fCjVbPXPlDQAjY4WYlEXI4m6iZsASVqlmT/zSi553H6WKZXuwvCd8R832/soNPb2VrT4V/tOLN6nplDYa+SkNc
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id r20-20020adfb1d4000000b00337d6f0013esm3099374wra.107.2024.02.08.00.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 00:15:47 -0800 (PST)
Message-ID: <568c26db-45c4-4a62-9504-738d78007802@linaro.org>
Date: Thu, 8 Feb 2024 09:15:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll"
 property
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-2-quic_tdas@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240208062836.19767-2-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2024 07:28, Taniya Das wrote:
> When remoteproc is used to boot the LPASS the ADSP PLL should not be
> configured from the high level OS. Thus add support for property to
> avoid configuring the LPASS PLL.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>

You nicely bypassed all my filters.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

Anyway, I don't understand point of this commit. Aren't you now
duplicating qcom,adsp-pil-mode?

Best regards,
Krzysztof


