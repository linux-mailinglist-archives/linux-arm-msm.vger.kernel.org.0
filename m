Return-Path: <linux-arm-msm+bounces-21729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C756F8FC62A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D46BB22443
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE63190051;
	Wed,  5 Jun 2024 08:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4IaQfkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823EA19004F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575618; cv=none; b=T3gGO7PD9K/fAJMgdxB7TvxgkR9P3pIuGXCuGuxcqSxGcLbqfdBXz8qQQWi1FV8TiVrTMEWgkOaL6q0eucvrtkhIBKnV9B0m40wv/0G6PyJOzfAogkWCsUsc+h/zAQLGqNep+x35x6wRLyrepLPkQvgTmgJKMq7QJpLhCIau7Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575618; c=relaxed/simple;
	bh=+OFnrtct+6Jh1m3HUOU1dJvIRQW+Zy16YnzZISP0e20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdGcyXAXwonEWD7asjoZFL59eLfZu8UiaDV6UV6DG23vtm1ih0GjVv9J3VPOY/qLjDofaXOul15aZzpUy57QwVwj0ntkjWr5QYawdUeoKw2PusAIU1nYOw2DTm88xlkFOMqTDYAuIyHMtE5+wVBc+2eIbexbqgAnFvRuSPyFezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4IaQfkB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4214aa43a66so16638815e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575615; x=1718180415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t/ukQ7pNwhkOnaJKJ/7vc4Ysf3b6tU3d9oPac9GH6KU=;
        b=c4IaQfkBnRRUZOeYapSrD7FzOv8Fo66G7vKjNVzwSU3/Ggd8w8l1Pbc3v23e9P4ti9
         +uLx84HERKFQhr+6PwAJJhMeOkP84fmB6hlcy+HXHICdk4RLzLSz6ZSQMZd2IY/l/nOm
         w069YuY8DqxZTnoR5DDXAc4lBpS6oEvELYLc2dVO2xCFhrn51qqQe2MRqZJzsdVCQANt
         0CxSxii4pwwhP7ZFw6uDbFVnezRZaavLKV2J2Qcxo2oZ9+VBy92atVnNJ+VfTx2eqkNf
         +E49kchJyb13+PoOBDR3ra9oQalKm/uES2ZPbuMAFIZhGvxZYNpAvXuY1+cfPGLZJ+rQ
         0x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575615; x=1718180415;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/ukQ7pNwhkOnaJKJ/7vc4Ysf3b6tU3d9oPac9GH6KU=;
        b=Y66aWf3C5pk1O8BBXXaWsK/jGRHZbDP3SY5bm15ZWL+EEfMSEcYbKBHSPRrYeUXKql
         q0st3g5vWjiQ1fL62jB5NOL2cuA1aA5qflQODmn52NPpl9RIziR+wlCur/FauzrAgNDY
         /gAKm3KLBrKa9RYdU29pQWLl0Cx46XvTizyC9kT72KArSWmaRk/dNaygsa896tYV8Lm9
         tCYtgrb3CsrH9pmaAo8HeMFPKurxa0hG9wyI3z5Ejw8L29HldxqVzVrXkz4qHYaz6dWw
         0fGAZSJR4M8q8NO2fgKsNjTrFGcP67+NLfZ4Ecx89UQ77e9/cFdWBH6icCqB6EOB7qzX
         sXQA==
X-Forwarded-Encrypted: i=1; AJvYcCU/D3q+5hBV9eG/NsMhwIgKRMO2noO7YAr6faBRDPYr+nRnLyvZz7b5vNS0xn5XKetJUrUfCWo6YjgJLUZg6NkFo/kra1qctyFbJUHM3Q==
X-Gm-Message-State: AOJu0YycwEm2tgzTsW/DNBGyc3xB9lK7GLuCAzkkT3Rxu664GVeprZKs
	pl8XYBdReYpkdXuSWd7Yydab1UFRlTpm9VcIBUbZcLCYpjK7+3ZKJ7+GL82KrVw=
X-Google-Smtp-Source: AGHT+IE9Xk+c7bpN1C5GhN6JB4vjSC6gsPpzByJkJO7AW72MkIBmGroCsjgw65bD+gxG0lJQdVtzJQ==
X-Received: by 2002:a05:600c:3b1d:b0:421:2b33:2522 with SMTP id 5b1f17b1804b1-421563388bdmr13924625e9.34.1717575614896;
        Wed, 05 Jun 2024 01:20:14 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f47sm13647749f8f.8.2024.06.05.01.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 01:20:14 -0700 (PDT)
Message-ID: <72f12c41-1d35-4600-ba66-6404896fa502@linaro.org>
Date: Wed, 5 Jun 2024 10:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 8/9] arm64: boot: dts: qcom: sm8550: Split into
 overlays
To: Elliot Berman <quic_eberman@quicinc.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Amrit Anand <quic_amrianan@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 "Humphreys, Jonathan" <j-humphreys@ti.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Hunter <jonathanh@nvidia.org>,
 Michal Simek <michal.simek@amd.com>, boot-architecture@lists.linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-8-e6c71d05f4d2@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240521-board-ids-v3-8-e6c71d05f4d2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 20:38, Elliot Berman wrote:
>  
> +/dts-v1/;
> +
> +#include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
>  #include <dt-bindings/clock/qcom,sm8550-camcc.h>
> @@ -32,6 +35,11 @@ / {
>  
>  	chosen { };
>  
> +	board_id: board-id {
> +		qcom,soc-version = <QCOM_ID_SM8550 QCOM_SOC_REVISION(1)>,
> +				   <QCOM_ID_SM8550 QCOM_SOC_REVISION(2)>;
> +	};


I don't see how does it help to understand usage of board-id. You list
all possible revisions, right? So this is entirely redundant.

Best regards,
Krzysztof


