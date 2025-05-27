Return-Path: <linux-arm-msm+bounces-59546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FF6AC4E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 14:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 499513A3C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 12:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C9325E838;
	Tue, 27 May 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyP5NI3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03671DEFDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 12:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348268; cv=none; b=nP3R0teynPSG/7UFsqbF9m1V+iZ4zdz/77vzUMM6N/Dh8jzoaMebeTSUdNz1TcN8HkIATu1f//bhGarvmTunEgiwleOEHfk+2WfAuYEqpRz5/NQA24qkaLHkWB+Sysinxcspw5acCZmg/k+vUk15j7PAB7h9+TuORt9UvM05FRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348268; c=relaxed/simple;
	bh=Ylm9TZJ9JkndLpjMw52ERgTwWR226WeENwt4n1DE02o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P0BlmNgco6DTpA59N8DrHzTB9X4DVsucDbLtdk3PVmrBJJdHJYuJPBZZGU32XoC57bzJoc0wZFlPL+VSZM1kpFfxrmV6VTtgTEK12kA6zbr5THZhg1UpLRqqhrSEnpBYtQyRQyKE6WBcFAndYXjuomUbgAemSzkhDUaJELanIVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyP5NI3y; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553279c552cso118852e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 05:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748348264; x=1748953064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UU3gcdYYcPnZcFhSfcjGqd1s2zKjYa70cKw5uOmkCvo=;
        b=dyP5NI3y3fcEvJaivVYiK6RFXsv0TC+rfMOGtJfiilGPObqL5j42PLrze7re5kj78I
         SQP+lLqeYbq0xEPSgp3SHa4QTcvPblopDpR7b9L7eAZSHqy11uwKIdDHl1xwrtKZMPeK
         5LdoUatKDT5lJKqaVQBoTve9wi+GwF6lkr9kiHaG1mc1+mq4hYPonyGDiV2aL+PTiSid
         D9NnETvUgqWylTdW/T6SuEo29ixyRYqrrLr4g4vCwvH9dHcb8FaKAP/CIT2HOUQpVTPR
         4G6F2YSJ/ZhIpRA9EW6Q+b+Qq95pcZFX3vtItYtZIIiE+QK3Q2+IgN9zhxmrs0FxmYWJ
         lr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748348264; x=1748953064;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UU3gcdYYcPnZcFhSfcjGqd1s2zKjYa70cKw5uOmkCvo=;
        b=QzNL+I0X/rNnBzTovk00/utcrLG3AxxcsS5Sk1F30CUheXwzuZ+1rpKYH2+fm8W+0L
         WZkwSP0uB/UqRMDgQFzL4D8MNcaBS6esZTQT0Pls4/NM6fvZfAKOynp9QNoZSFcbsVxY
         /LCoVV369d3RcUnUwGg/pS8Zz/gCLskPX1UmJygfpBGySdrdOqVTyifzA7WWln2uB+9U
         GVT4zXK9v6bi3o3ivbokyXhQabCxCikTCif9wTFSBAcAB/IPnn0FqiOtC1bP5nIkLCzI
         8K8I1SysNuhcJmA71OHFY22by5+uDWNWRO74Qtr037buoIzRIZAsoOPN4J5mEGU+iqF4
         VL0Q==
X-Gm-Message-State: AOJu0YzP9hWKX8FKO8oEjPTzc45Uiv5NyywdVpUByw04ud7Xxrx/DU/j
	bmy3FOuqIcd/tKeYIGyXYbgaIdfuZTpvVoTK9HqtYaVpnkkh/eJeeDFSk6SinWV0krY=
X-Gm-Gg: ASbGncvx9XLvC15U1djlFcNa5Hbd2Bw3OkAhUus1klH/iDXGKuFJGpyBeZBdE0DtXA8
	tX7y7bZm1kAd7sh8A6AGhmPs/l4E/TiSHVMgkcFYxupo/KR9fDekayY9BzMNqecsenq73+sNkxS
	8v55WyUC7Z0YvuZimH+71LvKURmNCg+UJ+2oa9K4N110zlQlyNtm/gmDfVhy8heWjC1pMUuDlZn
	RQDo1wjyNLwSV1ycfYObG7SPb0r+YhNEQvzX1pz8jJ2X/6/yt4NsGgSd0YVDm9/baSUoxvQh6rJ
	wIc2FMsXhWzI3QT2TAFZp4trw5UBB2DtgXUy/bX9IsaZI+fPzl3+/SnCMF+RJnEILhk=
X-Google-Smtp-Source: AGHT+IF0yMInE3RYqpl2vNeTub6vt1aTbzbYIVRNV0IdfEePqEXTaxqSLxxOXpwZobi0Wf7bZQrPQQ==
X-Received: by 2002:a05:6512:2c8c:b0:552:2081:bdc0 with SMTP id 2adb3069b0e04-5522081bf9cmr1050281e87.6.1748348263804;
        Tue, 27 May 2025 05:17:43 -0700 (PDT)
Received: from [192.168.1.106] ([91.247.148.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532662f751sm461418e87.54.2025.05.27.05.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 05:17:43 -0700 (PDT)
Message-ID: <538a65e9-85ac-4ae7-a567-97343122c547@linaro.org>
Date: Tue, 27 May 2025 15:17:35 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: qcom,x1e80100-camss: Tighten the
 property regex pattern
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502204142.2064496-1-vladimir.zapolskiy@linaro.org>
 <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250502204142.2064496-2-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 5/2/25 23:41, Vladimir Zapolskiy wrote:
> There are 4 CSIPHY ports on X1E80100, it'd be preferred to tinker a too
> loose the regexp, which covers all these port names.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml          | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 113565cf2a99..680f3f514132 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -133,7 +133,7 @@ properties:
>         CSI input ports.
>   
>       patternProperties:
> -      "^port@[0-3]+$":
> +      "^port@[0-3]$":
>           $ref: /schemas/graph.yaml#/$defs/port-base
>           unevaluatedProperties: false
>   

I kindly ask to review this trivial change.

--
Best wishes,
Vladimir

