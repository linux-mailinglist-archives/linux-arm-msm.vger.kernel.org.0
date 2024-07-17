Return-Path: <linux-arm-msm+bounces-26432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117D933A68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 344CC1C213C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD99B17E8F9;
	Wed, 17 Jul 2024 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WQwmwnoO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31EC17E8E6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210014; cv=none; b=HEYUT+vqHkedr39EvqoYc6bViLnCmLaepDQdjSS588O9xmCuXF7sURTJLzDT2KN8kppBiZei+4sW+jy4TjYo5YRiZzhYgi0gmqhRCjedy6QfQV2j6nXn+y96JtjMYvV4NgRIL/RJnen9KCny08+YqrzZHRk4gwbSFvgxJgznxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210014; c=relaxed/simple;
	bh=7ZyXDNq9KWanzvanAgCxLyG17yS/FhI9o4qiulmtvYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOWvSj2eguAvW76dbtKcZ7jAJpSSZEhhMx8ak8nmupdTW8JhBQTZXl3uyb/sWy9G2MezohsHcs+DwL5r/gfDZ/qdkbfiNknxjr1kmiufdSMIvCo03XHe61ijA3JrcBVjU/fyVvVnTB1a+WVln5oTYsCet0mDNYVVqwS8IK/gII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WQwmwnoO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea0f18500so6742773e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 02:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210011; x=1721814811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZkySvyK6qYwlqNWqM/sZp4YZ3od9XgeG4Qp5/7l5ds=;
        b=WQwmwnoOEyktp/Z5ovxDDpNoCm15eKgr2yIQQ4L1ZrWQ9hQ7UeqgqH+dnJ8r1i6odp
         wgX2b4MrihKmqjo6JAZup7vY0xc1/HJ6BRadlUoMfkFa/QyHZdbyk6cB3Bdqq1tbxyZW
         h4mxXEaE5TUJ7q+7H5Qo6wbWVcpYsYifV77B0GgK8i7MHbaD7PR287RyTDocm8MmXC7k
         IdOzQVVzfODkG9okKPAlseQIYXQ5Pydl918g442YSQ313A0AMYv9TjdDgbffsFGBNIa+
         X0OOhPdzrBccLKy/IdYxA/IIgD9bXFn6vFaYWDGnSs8r4piVaR4jFLUdpFfL5eF1HUx+
         /UlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210011; x=1721814811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZkySvyK6qYwlqNWqM/sZp4YZ3od9XgeG4Qp5/7l5ds=;
        b=n2TzJGpREIM1UZlWxLOrT70fDqjjaxxbEVKJxl6+DMbsMWgfw4OwzA3HoiBBdvwSHL
         K9SQp71EPM5oH5vqWNOHGEbcwoykTF3w3Et/AG+K8RCs0CtUgtlwNCrszgGTtV4+X5sU
         fr98/lqbh3eKpx/rCVLBT0Cbt2uSXNLHkxnjGeXJpZIZe2N2SKT/PoK2wkDzIXgtPYLH
         SnkyZ8Do9/8vAAXAQYAPWuYC5qtlUkg7atvnArv5vi5hGoCqX6Nh3WQUwNcZduzd9FTV
         BYNpSvysZX9T3zdA7ibQgQkN9xY6MUi8H1YcAx6q+djqh5vjcvEEJxkk98JfVUnFLbvy
         acKg==
X-Gm-Message-State: AOJu0YyqeCwRMdWnTmpJ9U7UlHPQvL5yWgcaidzy8WhSSfJwwbEntPUk
	m4DR7s9Emr2ng2pn/fhyxb6M7jgrjNO6bJbqDC69EiZrAQQt/unAN0104hvcbQA=
X-Google-Smtp-Source: AGHT+IF22tdvL5DIDFo7fAwuM1FV2XYrSld4EkifI7xKFrLO7C09K5s6vjMV+50HjAxQ5EguOldxqw==
X-Received: by 2002:a05:6512:1249:b0:52c:9d31:3f25 with SMTP id 2adb3069b0e04-52ee542781fmr819660e87.43.1721210010651;
        Wed, 17 Jul 2024 02:53:30 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff87dsm424994066b.150.2024.07.17.02.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 02:53:30 -0700 (PDT)
Message-ID: <c84257e3-6081-4f36-b83b-63959a9e7695@linaro.org>
Date: Wed, 17 Jul 2024 11:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] dt-bindings: clock: qcom,sm8650-dispcc: replace with
 symlink
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-7-efb4d927dc9a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-7-efb4d927dc9a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2024 11:13 PM, Dmitry Baryshkov wrote:
> The display clock controller indices for SM8650 and SM8550 are
> completely equal. Replace the header file for qcom,sm8650-dispcc with
> the symlink to the qcom,sm8550-dispcc header file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8550.c               |   2 +-
>  include/dt-bindings/clock/qcom,sm8650-dispcc.h | 103 +------------------------
>  2 files changed, 2 insertions(+), 103 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> index 78e11eade2ea..9ffcd9eb9283 100644
> --- a/drivers/clk/qcom/dispcc-sm8550.c
> +++ b/drivers/clk/qcom/dispcc-sm8550.c
> @@ -1776,7 +1776,7 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
>  	}
>  
>  	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-dispcc")) {
> -		lucid_ole_vco.max_freq = 2100000000;
> +		lucid_ole_vco[0].max_freq = 2100000000;
>  		disp_cc_mdss_mdp_clk_src.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src_sm8650;

Remember to also account for the review comments from Neil regarding
parents


Konrad

