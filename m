Return-Path: <linux-arm-msm+bounces-9769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E938494F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 09:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4491F20CD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 08:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F8B1118A;
	Mon,  5 Feb 2024 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e0qntcNY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05AA11183
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707120002; cv=none; b=FDJXgi+4ClAFvsQw1Ug+6qVT4l8K28UOeF5sCa2xPS0OygqwYJxhp2Yb7P42iqhKhjrDPOyTpsvM8EChnKEQK0i7NM5/oNsCoYl+BbeEz+jQgpD9uvhSZorRq1QkASu2f5FKRlisK6akCJyzWDjLCZdi+Bi/ia2JMzdPELSOeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707120002; c=relaxed/simple;
	bh=vA+jSCoZU+VqBlVp4U8wGurEoV22jXLUxLuUXor72P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4ycd0ciRFuGM12O+x6Vnry7rEKkmmDlrGENW3o8FPdngIIselNoaYjY/ycKWvdaHTSAEpOdhxJbb4jT8YhcHUqqO19W8ZQvKPraEYR2+O+tKoN6YHAgcR4Xv//MVbbQZwyDDFgQ1iOimjh0w/SrHk6BPhxvnAnAX59ZDfjLXjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e0qntcNY; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a271a28aeb4so577662166b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707119999; x=1707724799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBmvdFZpGE6Z8DAOOutPANi96CHpIUPy6LfT77RAAyI=;
        b=e0qntcNY+RpxhwVOepPwOF5lcenDrOwVxRt9Tu4mYoU5AGSyjJlbGJsc+YddTixknK
         BToAxtuu/cStZAMuoFpM4Z3yFcde9DlIJp/OHzt4LBqrg+Mvj+GeMd7Zo8q37xP1ChDp
         P38dPA3lICfOSMQ0nQASJLgVYyUAF5gI8vDSJkUbe7hG1F2w8vsztB29mKW2DSRTtni2
         mey9fsCx1KTbns1BwiBi+Hch00djE1CcU/BYGRfyh0BUSoakaRmt+uOJDD+adQz3YNlo
         8NiK2vjPaK3kO8WIHu4UVL6VXxwbS3Zvso7I0u+1OT6xRCqUtdPiGmNpCgkzMuSg/PEs
         UcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707119999; x=1707724799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBmvdFZpGE6Z8DAOOutPANi96CHpIUPy6LfT77RAAyI=;
        b=vCuE2cGrfpQWlqnHYYZ8C7FbQfS2v4tt2TLoTKOWmy0GoWv09DOXDp4FJIuGJijax4
         9v2IBwwYrgzWbAPmSjMzHXEudihSXtALVFLu1Is1YrV90363bnCQZrSpb9UIzK6SNj/V
         jq0536LB/1a5e6cjG3p5CVCslVNiTdLOQLCbYGqLLmvS6Iol9DedgX8USm6k8rPta3Il
         EHYxo3jBCYDS07wJNDzjKBtxPv7lMwM96k9kMDr7TSHh5/3b3ZkMuOVZQliZaL7J4gmS
         oRjML+SedWAGXlTYTDsJDMcOqhg5AlQT+w01yw0h3Av4fU0cH+kq7oVihIZEnmJhrrHG
         0JHA==
X-Gm-Message-State: AOJu0YyagIn2Qo8bR5+kHxrJguZvCA3h2Cp5lHGf0xdj06w1FhBsAWpF
	nFfTQwGuOPA1iK+fFE68RShpiq1n+qS7h5b+CN/+8nmof++IN0JggHyTYqjiB62FXZvbXmxmhps
	BErE=
X-Google-Smtp-Source: AGHT+IElREor+vq3eUoYH25GchFaKL3DDV7+AJarfuPfJIPGC46f5L1GJ8JnXdri8kuqTiDplA+TTg==
X-Received: by 2002:a17:906:c450:b0:a27:5446:27d9 with SMTP id ck16-20020a170906c45000b00a27544627d9mr6141337ejb.5.1707119999038;
        Sun, 04 Feb 2024 23:59:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXIOrm0TMFKLUgnJ6e8OW7224oBeQoOoq4PNDa7y4VVjUr1PI7PC7jicflMZlm+ZMGTS6IXPD6oRrDUDrIyw0dc+9Vv4KQsZSm3Tyoq1yVoQ5sNKOcN/FbSI9lfVYwpOCm+foq5umsKxBd+G/kwzN03IWeVB4QEYnaxbbXfHeO5UCjLNh+CGj9C2CdEDqRjmfMelNG8wuKFxy1C876KXAgxDK/v6o0whqrPu7hoCo6aT1Dy8FBeO0u1yt2ucWkP/vvbivrO6VrIw+gAIsM8xEBpXk+lLlg=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id h8-20020a1709063b4800b00a369b47996esm4023517ejf.80.2024.02.04.23.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 23:59:58 -0800 (PST)
Message-ID: <c9420b57-5ac4-41f0-a68f-0b8aff3d0a3b@linaro.org>
Date: Mon, 5 Feb 2024 08:59:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom: drop the superfluous device
 compatibility schema
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240204-qcom-drop-compat-v1-1-69d6cd92aa0e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2024 17:56, Dmitry Baryshkov wrote:
> The idea impressed in the commit b32e592d3c28 ("devicetree: bindings:
> Document qcom board compatible format") never got actually adopted. As
> can be seen from the existing board DT files, no device actually used
> the PMIC / foundry / version parts of the compatible string. Drop this
> compatibility string description to avoid possible confusion and keep
> just the generic terms and the SoC list.
> 
> Fixes: b32e592d3c28 ("devicetree: bindings: Document qcom board compatible format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 51 +++----------------------
>  1 file changed, 5 insertions(+), 46 deletions(-)
> 

Maybe not necessarily fix, but anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


