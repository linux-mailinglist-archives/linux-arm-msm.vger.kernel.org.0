Return-Path: <linux-arm-msm+bounces-10999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3204C854A68
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 14:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A2771C223D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 13:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFF955E61;
	Wed, 14 Feb 2024 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m6Jo1iSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9455E43
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916981; cv=none; b=uKje4oRu1L6niFPFLIj8lnEspWrw08DeaVugRTeBX1A3ckYhA7A7adSDv/QpxExiJJB0H74qrIqKPDJKGHm7TdC8wJlC2WTFEDItmsInE95Xz/1NXiClTC4Sk4ZZGSSaLwBOutJCSsXDJwTgIa1bP91oqxTZmaLwyjrbqG6NcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916981; c=relaxed/simple;
	bh=AmJiIFHLW1bUfTVm+jyhUo31jIVhADlU73008mYT8aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1azf1s6GEJ8TaB2ZUBYe2s8AZSd/1UrMBcdziPLwo36+VfoS7ZOKT1REQ9AcSB2q7Pz+b/jRF7HDCRvKNq1sh7E09eUha+eCPKb4YYEnNK2KNiZ+g+rpLjzV8FiOo3BPcv2tFOuhFcCBVWRRuo+xMqQH0+TeTB+5UUJlh2Rsok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m6Jo1iSq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101cd91017so2846122e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707916976; x=1708521776; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fRYO1F/cM8QgUE08NBZ01Gj9fzdGQ5jlSnC6Mq/YgDA=;
        b=m6Jo1iSqsCrxNI8HNEVhao1GvXmfOHS86GfPSlL+6Chtuku5svTRe/3JZ4iT5d82NZ
         fBX8P/HWYKvStw2f8iAUlbvjngPo4UH+8fKnem1oYmGHW6ZOHMm6GXq8PS+VEQgDKKeO
         OLxyd/gLQMAyxOIPS/9tOVW+tq4MbODHtKYE/RqVur2/oXJtVkOemEy3BXkJye0VVCar
         drrWVL5/2tcXt9f9hLrqM1hFsadBU+fE+sNK4CyseNQmd8FuxUuRP1Ugn1wYle8Ak79v
         GRmmb9cGl0ydnxm+K0WQc6CQJe7qri2qrTjOyROWqS0KrXvZHaQFSIVGssFIfkwaNdvD
         kEKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707916976; x=1708521776;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRYO1F/cM8QgUE08NBZ01Gj9fzdGQ5jlSnC6Mq/YgDA=;
        b=XzNgDlVYFePuAlwA5WFkU3pOlvXQDzel/MDS0nXVIYdZhuAo5xt6QON3BCcbn7IBtQ
         FIveyB5D9hd1srdm3zT2rCLLIb//wU2Ys5lmbKwbu13W3p5uaMQgWSbIJ2MKJbYWIyU/
         gsZ/MzyfA63sYH685EVNR1/LjG/pAtIjAs6VKLDlUazH2r1Lik3oW1vY44pliuWLM4CN
         p6DoavZWzTGH//oTCkmwOya2CknSJSNMqk3QCCLVwBSonz7kNMwXQllxZWrw8WUIW5t4
         LiYrD5D2oQnjaHMTCTSaA++sxoFeidJhbeiQWrVHemFcRNksup9TCio/XCDjlTKFsxI4
         39kA==
X-Forwarded-Encrypted: i=1; AJvYcCV9MtEcM3hURGHNUeMiiziYpKKXmD+Ku2RZAlupw6UZKkpcaH05yNwkoWm5Q0ccuLhoG2w78djPHnlRcy7F1Tuxb5u87EgPG9cGp7G2aA==
X-Gm-Message-State: AOJu0YwKrzpCj+erRvrWFzcwKgNf2K8n2JDsPKIacQHcaSlgzss3conH
	DbQAdRNZ9+ciurDzFa6EFpCvYAYmEMsHxxte/jDvuyinPMzjO0z7PPK1R8tqBko=
X-Google-Smtp-Source: AGHT+IFZhTyfVIIqvEvVst9FifshDLETVLsVmUnD/0a2cPbtb576eCL7mXrv8iFKTuNfB/zc8td7TA==
X-Received: by 2002:ac2:46fc:0:b0:511:970b:2cdc with SMTP id q28-20020ac246fc000000b00511970b2cdcmr1794977lfo.35.1707916976270;
        Wed, 14 Feb 2024 05:22:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAr5xqgEYAqprZPCQZAcA7Y3pVj4CTo/6gF2qv5VY2oYOsyE1J1gF2owASHgUGR7qcOFWaNHFtwz8UQiFq66ZTMPpK9YYFz7DwexdfleN6AKccIU9823N2ZfCRjtpDhG+2CHNLYhuJeB4OXCesa4nTaFsvbP18e9zRYPd0/N58/Cliz9WiQKJ/hUpKhF+XFveqVvPG3kgLrUKZZy64rwy7nHPG9iicNtvawlMw2BOjSslu/YRJl2ovHLZMZa0FX5crhCzYgPT9pb0TDR4XDG9G80WEuOWM78qhJrlJ6sJ59FlMawd344kuYQUYqYu40pyc+JAqdtISjmIV
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id fj17-20020a1709069c9100b00a3cfcd8772asm1692159ejc.155.2024.02.14.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:22:55 -0800 (PST)
Date: Wed, 14 Feb 2024 15:22:54 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: bryan.odonoghue@nexus-software.ie, andersson@kernel.org,
	konrad.dybcio@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	quic_fenglinw@quicinc.com, quic_collinsd@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum
 voltage
Message-ID: <Zcy+roPWLIVfjWs8@linaro.org>
References: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>

On 24-02-14 12:16:14, Bryan O'Donoghue wrote:
> The relevant documents and the dtsi specify the minimum value at 1.808v not
> 1.8v.
> 
> Prior to this fix we get the following error on boot:
> [    1.353540] vrej_l3m_1p8: failed to get the current voltage: -ENOTRECOVERABLE
> [    1.353544] qcom-rpmh-regulator 17500000.rsc:regulators-9: ldo3: devm_regulator_register() failed, ret=-131
> [    1.353546] qcom-rpmh-regulator: probe of 17500000.rsc:regulators-9 failed with error -131
> 
> Fixes: 2544631faa7f ("regulator: qcom-rpmh: add support for pm8010 regulators")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 80e304711345b..767a17fe0d51b 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -757,7 +757,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
>  	.regulator_type = VRM,
>  	.ops = &rpmh_regulator_vrm_ops,
>  	.voltage_ranges = (struct linear_range[]) {
> -		REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
> +		REGULATOR_LINEAR_RANGE(1808000, 0,  2,  200000),
>  		REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
>  		REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
>  		REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
> -- 
> 2.43.0
> 
> 

