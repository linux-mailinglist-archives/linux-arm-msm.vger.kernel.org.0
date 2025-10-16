Return-Path: <linux-arm-msm+bounces-77591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E15BE3C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53E6B1A67959
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FB218A6C4;
	Thu, 16 Oct 2025 13:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUeUqTY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784DF339B20
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760622203; cv=none; b=MBGv77Qxf5tcDxrPBAUvcJ9+e712PoirOm2Ay8Zcz/CURJKSQgomyI5ywk7lWfKaTpUdG45v/sEN3wYQFjq6RDez4J9jj8LjMqGadIXf9tvRfu6BR3QV7ASa8a5xVdrjhlgkAqvmkJiPFiXyBxZmaTJwZJOJD7JhksMymUaGY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760622203; c=relaxed/simple;
	bh=jDp9/QBfldp4RgNCkyVTB+rWmBU/cFzzvTwjjiiKsD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeuKZIEI/zq3+seU52L3LJUEUPmhHD9ehVh1B1ebrSI6SaAW/iG0gRMg77Lggn/BdAWAk775dhYna0pzLAF0PbbLo2QUcdzEg7UCD5mpCNrAqsCdvjeCkD0XhjuT4A+N2GZU2iH3+IjPRMDWHfxsKLUpq5azOiK4RDaRAc/lVL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUeUqTY3; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c7a913afso96312e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760622198; x=1761226998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPa1I3Sb/NK9EofjdAp6afiIJMKd5znl9EBjNEXePg8=;
        b=uUeUqTY3M0yVdJekd+rbaKKgBhgIQ/FbtquqJ8k83WXKo07FS3iLkIieZOXgBnYfwt
         FJMYk44HwpdnDZcaiNnUJR6TihDMKRKTWz+nATgR4WHyEsDR42H72kQN9strCDyAne7C
         RmWPKC1mdrIk+2JmHd/F1MiMjFcLPwSq96n2V6oDf+xGSruWsH+3AvqHulpfGalEaJv9
         rKqLAMxABbbzr34e4AVSEAw11rw2JQtJrsW7pQnVNZ4Q4tGuS295DUx0W/o8CeF2Dv6W
         0vPMJ9WCyN2WDeie6X7Oapr68a7iidDrUhrdLEjKbTGHwY4v36rel0G+cOVX0w4fJhFm
         1XuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760622198; x=1761226998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VPa1I3Sb/NK9EofjdAp6afiIJMKd5znl9EBjNEXePg8=;
        b=Nkx2/oct/mtvDvPD2CQIFDR/gAoG5im4XOrQPS0KJ+eI1h2J3EI2BJ2I5b4vdiXLMa
         k3beXrgZanlYZ94zMxzFZa29bI+f3FRpuf4pkdJvfYIhzC6qCoRFbpFFHkZ1jrARSlmn
         fTdd3mE3blvFaMW4FoUpEbyp/YTr0cQG8a+hl2yJGa1IBLDDz8cUlzQD91lG2hnRacoo
         /Pw+JtEyDBZv1NpONVd9z9YrjiB7OGuySFyAdaqYL1GcxH2AOaTOEV0jkkBCqsLd07Jl
         A3NUC90rvq98+Bz3Hxj2be3+Yw5XCtVpQoA9/cRbXSZKaKFnLXgrgSdVdRQGvIYeLX/O
         Uxrg==
X-Forwarded-Encrypted: i=1; AJvYcCVou4glCaCeIsjSLnbZa+mhBYl+H9Rnl7ne3rfaG8m8ZX5nHLwORM7QyyYqrbwAAHxRBcBEC2h+0WYSuNPg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz64zJ/tbuqOWZB1mjqyZUGKXqXw/AnMN3h2DkwXSwhE4/+pe8
	lKmIQuNaeGBmMe0W56K0v0ANVL/R2hTAyWrcQ08NkzYfRh94RDSaOaED4vq2xJ7/bBA=
X-Gm-Gg: ASbGncvhbVo/wGnl+uz+M4V2m5Wc2UrGjjmE0OUgpQOibf1+k9AD8zO643sw1I2O73C
	Spo/CB/CJhV3k7FkiN36VYI3YCIrKRjU9rlsdbV77QrDXSuRagACZ0Ohu/dqKpNuPkYxGqMZWI1
	FUnAavavigu8ynLUOP27RsyO0V34ugoCUHXj7GJKrc39UCcxuPOtWkoOH7GX0YqF/WAB8GfFC10
	pi6x/XF3h0YVEg9RDqTMUQv7oNAB+rVoI28jLzxeFJT8EMher0maOxO/Ys8lzrCqHr/lbsimMP3
	7Bla0e6sKIliSqDByyJ/PsvZgcB4D23+LR0Bd7wzIy2AiL9b9VlpjC6TE+KKAp5GKnGvpN162Tn
	oxnSDMU3hhM/M6YstgKbEQ+QP1BgKGeN21DM4NgX8pi3U7Dyw3mvw88/IrEU2tSoRxStpoVv8ty
	iezdlydpmprSO4fv5tlIKwESTM1WLj3z9gFH4I52sm0qdZX8feXt/PLJFiCiY=
X-Google-Smtp-Source: AGHT+IEsA6UFmX5BTWpr/DOMf7GtkUjTzhwEWEKu2is2k952LHuOq+Rngn7xDEvuu7cdwPIaQxIv2g==
X-Received: by 2002:a05:6512:2347:b0:582:512:f4bd with SMTP id 2adb3069b0e04-591d877125amr3346e87.9.1760622198485;
        Thu, 16 Oct 2025 06:43:18 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fdfd8sm7032230e87.52.2025.10.16.06.43.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 06:43:18 -0700 (PDT)
Message-ID: <cf1311b4-4190-4557-a958-55699df495e8@linaro.org>
Date: Thu, 16 Oct 2025 16:43:17 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: add support for SM6150 camss
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251016-sm6150-camss-v1-0-e7f64ac32370@oss.qualcomm.com>
 <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251016-sm6150-camss-v1-2-e7f64ac32370@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/25 13:22, Wenmeng Liu wrote:
> The camera subsystem for SM6150 which is based on Spectra 230.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

<snip>

>   
> +static const struct camss_subdev_resources csiphy_res_6150[] = {

For the names of resource arrays please use a valid SoC name like it's
been done for x1e80100, here it would be good to have sm6150 suffix.

> +	/* CSIPHY0 */
> +	{
> +		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
> +		.clock = { "csiphy0", "csiphy0_timer" },
> +		.clock_rate = { { 269333333, 384000000 },
> +				{ 269333333 } },
> +		.reg = { "csiphy0" },
> +		.interrupt = { "csiphy0" },
> +		.csiphy = {

You shall add .id field to all .csiphy structs.

> +			.hw_ops = &csiphy_ops_3ph_1_0,
> +			.formats = &csiphy_formats_sdm845
> +		}
> +	},

In general the change looks good, after the fix please feel free
to add a tag from me:

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

