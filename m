Return-Path: <linux-arm-msm+bounces-19208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3128BBB7F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 14:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32D70282BCC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 May 2024 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748694A1C;
	Sat,  4 May 2024 12:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5rBCQ7Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207681D543
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 May 2024 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714826727; cv=none; b=LGxD/EvJqQD6RBlx++HqPXPKqNAVct/rKO8+VPAQ/Gd5nohb1BLv/+Ur+xDj1TUTxw1hKtaJ8MEYXklYeKLm7z1AJmalcadpH8zQPgWczn709hegTMRCSw20VVgKOzwju8uGll0gFijQDEyXbZYUUcF8ucS6i4tdvOXW2wJLH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714826727; c=relaxed/simple;
	bh=ga4oIcPdFMozDH6CQXgueKmuB+AGJYrNPk9q8zLxDhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNr7SBQVtzGujDxAnbIs0DlKQ3OtNJEmE0NYa4AScmv64JplIYyiX/YczRDpb57KyGPcUe7HzS1V4wT7cbrQW2Tx0cKOqmrWrXgffL1dNQceXJ4ykR18oEKxcdIDb5QWluYZ3KUc1U4jeuyEUNEgZ/ZIY6/Jl42VzDRe2gzDTBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5rBCQ7Y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41b79451153so4755355e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 May 2024 05:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714826723; x=1715431523; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hQl9kri2DA7gvWk/T5ziKHmH1C/U4ARbgW6hV2wkE9w=;
        b=D5rBCQ7Yz43WYZRwpVRYpE3vZ1H2pMRCgYESHAAUGNX76kAJxC1ZV6YsM2QXwCg8bJ
         NiKz4aG/Awkc6q5j9dARygo9x9XybwrKydV8su/O6AD9b6yGkwMPmBTr/sqln7QEKFfl
         KC75QjL2KrwUbQDRzfavsIc5P2qg2Gchs/pdclK5mzT6Elpq/RJiKco7PPGE6SkEAznx
         WZSK5BpL3noxTS7mi3FmhlfSjr8HgbDrKjSI1E/VbeBnp8ye/g3gSPwnDD/yHapFS/xQ
         zC2xicSI94IPBuabnrocsUzU3/eE04a3ZecduOo8BUoYvojRBdpudk0+rqKXFLmKoFcH
         t5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714826723; x=1715431523;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQl9kri2DA7gvWk/T5ziKHmH1C/U4ARbgW6hV2wkE9w=;
        b=T7Jsfk+4auCpRCZMbH2KUp+4CkXI6oUI9HiSYmRhU8qrPYPxjPQZIvvGVAWFC53y5m
         fTNhrLydq4VSb6g2qaFIrFBzwDmaw+1aCkJNfOtKwIW1Vhh34Spum7feMG0r+cm2uhc/
         YfiquS+4KCJeqWkPHkynCtN2RdMNHFdtJEf26AmXqKK0GuV+w84cEQ2KkXaPJE6uvTw9
         KGXnJdOjggviwqzhXGKKmEH0S0HKQ1EG0Vy2j2RUvBAvS3mpYCail5xyRZvZeauSGnDs
         WQR/cgmFFEqCQmDLy2FCJJNjQj6AuI3dKfYLHl6URFadepodrzHD+Bh3zAl/zLNZgxj1
         3lmg==
X-Forwarded-Encrypted: i=1; AJvYcCUiPyW6DDX3Mm9EroAuc+rkjUd9c/0cq6xAQABXVXLk9KuxT/DhqWMrw2D7iSwl/nZVg5OaO8ONQDK5C+iSYURiCIf4AUJFpz8bKB/sEg==
X-Gm-Message-State: AOJu0YyO62quhNomZ73SJ79oXjzlcuGZzwHZWc0g4ldE+gCjE43skoTv
	Kjzt1VDxt2i6wXLhXpawa+spo0TX7z9NX/5v4ZlYylmzbUBki8jwdGDdiMnL1kU=
X-Google-Smtp-Source: AGHT+IF1k5IoLYmFSDKuAvssFR9KQYJctJn7T8iOIF8P2hYtIJ9pSdVm/FB22nVk46Us1FWNHO6XLw==
X-Received: by 2002:a05:600c:4fc3:b0:41a:ff7d:2473 with SMTP id o3-20020a05600c4fc300b0041aff7d2473mr3926844wmq.4.1714826723508;
        Sat, 04 May 2024 05:45:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b0041bbec72670sm9171961wmb.39.2024.05.04.05.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 05:45:22 -0700 (PDT)
Message-ID: <3951a7ea-b469-42dc-8240-a5c593bc536f@linaro.org>
Date: Sat, 4 May 2024 14:45:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/8] dt-bindings: clock: qcom: Fix SM8450 videocc
 incorrect header file name
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240430142757.16872-1-quic_jkona@quicinc.com>
 <20240430142757.16872-2-quic_jkona@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240430142757.16872-2-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 16:27, Jagadeesh Kona wrote:
> Fix incorrect header file name in SM8450 videocc bindings.
> 
> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index bad8f019a8d3..78a1bb5be878 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -13,7 +13,7 @@ description: |
>    Qualcomm video clock control module provides the clocks, resets and power
>    domains on SM8450.
>  
> -  See also:: include/dt-bindings/clock/qcom,videocc-sm8450.h
> +  See also:: include/dt-bindings/clock/qcom,sm8450-videocc.h

Then also s/::/:/. It was a mistake to introduce it.

Best regards,
Krzysztof


