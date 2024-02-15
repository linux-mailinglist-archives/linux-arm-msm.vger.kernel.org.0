Return-Path: <linux-arm-msm+bounces-11166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B20CD855E8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 10:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 236CC1F227BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 09:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192756350C;
	Thu, 15 Feb 2024 09:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJgc2Tbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051963129
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707990859; cv=none; b=I8PGDEPtzJgs/YbOVNMMq4bkHbjMWVULVRKYr4ko66gughYs2cUdIQN+LiukGkfY0+JwKrZ67hND8LUTd8qVwCRuyY8zd3blbxVhMdlqby2uRDtQInWwniJkYwgvcuKwinF2uOO7w53bpLevYUGQbCPIJURMBjWGsW5hwXQmY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707990859; c=relaxed/simple;
	bh=RDermMOwjU0hSEbzDyhZXl/PV9/3fOBTVHLpiPyZcZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ewr44+Qp6rV8wrrHJ0ex8MSkCyG5D6a4YFeKUWMh4sAGjzy33VML+zwWPmnfKBgEcYHdf8s+o/fp5qufCtfC/iVtr1FKLCd3w6/LS2KcVoyjULNH17SkccBAwbVFTMTpON/5w3KPUAAD83hlH0d3oPOanmKRDIiX9KBdojAfE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJgc2Tbx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a28a6cef709so79264166b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707990855; x=1708595655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o4gzvQT6rinNU989ggUwoCCFsyBWu2VUPJ8AnDsaF3w=;
        b=HJgc2TbxoJT9tlWepi1O1TEgrKH6/o23k8zZtLqACE7WPVGn9bIGaDcRF/a5OQQB1G
         Zah/9MeFDJ28lJfs+ajdMeX0SCj73ww71FBe+XD9yJlY8v3MRw2ZL7s1DB+mXw0jX9JJ
         fkSJ59+EUszl3s/QA+Qr2tgUaLGpP4EPdg8w0kPTMlMfWDkCbR/JjlETX93T6Ajc29yk
         1TZWs2UUw/IbvdwPMdyde4fMomDFknJUER/p8P+LxH6jqvpOGR8YIcTQlUlBwrkq1mk9
         +/p5OVYwzzNhbGcYdpVIF2GThemHeoAtUU+vB959iuhkL3SkXldci7BWQJL2Xr/zDCNY
         AYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707990855; x=1708595655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4gzvQT6rinNU989ggUwoCCFsyBWu2VUPJ8AnDsaF3w=;
        b=ZKMNHcZw4AkkD6GzTGY2jv4yM41+18+ikNFGewdIzrlfHmIjoyhUPj3iSu/FVINNaK
         CzYyKqimRJ7OZwsZ3ICQ4WayYBMdKb/9ojXaTqDaDBFA1H7k+Miziiei1Lh5Rgp0dcVc
         GoH6n9AdQuCZAsmC+kMdSSTgu/sKTol0KsKOA3OgrdxQksVQynPPuKAKijVbYxUrv+He
         cmNqGoLmIqnlbDPiyv5Xju6hjgUSqU4BQuYQz11IwqfKigAlRgqR6ACgm2excPO0KUxE
         M4LM7XeK/P99/iJmRGKymXap7NDIUebXwrsG/L45TBloPcQGUt4Wu9Al4fT1dDhffRgh
         zYPg==
X-Gm-Message-State: AOJu0YyXPObkgcIS8LPA7d/fYa+eNvulWeiT5SYUz8AF6oY+8pnqZaVd
	WNC/oxc+LSw4wMJB9BWTuYP+UMkkFEPgklDnAYgutvGBxQWvug6MqXoerkECi/tHuF1zqoUKYrj
	J
X-Google-Smtp-Source: AGHT+IHypfPQL4QtrNKgkS1r7FwLkazgfz51LrfjdCsi1DNT/1MhpapKXuoQ7qM0O2+sGk5Fc5XFJQ==
X-Received: by 2002:a17:906:c8ce:b0:a3d:1df3:4a55 with SMTP id gc14-20020a170906c8ce00b00a3d1df34a55mr913748ejb.9.1707990855344;
        Thu, 15 Feb 2024 01:54:15 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id vu2-20020a170907a64200b00a3d9df811b6sm260997ejc.87.2024.02.15.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 01:54:14 -0800 (PST)
Message-ID: <6ffa3094-ccbb-4947-9f28-e1437c9f500c@linaro.org>
Date: Thu, 15 Feb 2024 10:54:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add DSPs and apss subsystem stats
To: Maulik Shah <quic_mkshah@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240215-qcom_stats-v1-1-4a2cf83d0bdd@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240215-qcom_stats-v1-1-4a2cf83d0bdd@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 10:23, Maulik Shah wrote:
> Add SMEM items for compute, general purpose DSPs and application processor
> subsystem stats.
> 
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---
>  drivers/soc/qcom/qcom_stats.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
> index 0216fc24f2ca..c429d5154aae 100644
> --- a/drivers/soc/qcom/qcom_stats.c
> +++ b/drivers/soc/qcom/qcom_stats.c
> @@ -35,11 +35,15 @@ static const struct subsystem_data subsystems[] = {
>  	{ "wpss", 605, 13 },
>  	{ "adsp", 606, 2 },
>  	{ "cdsp", 607, 5 },
> +	{ "cdsp1", 607, 12 },
> +	{ "gpdsp0", 607, 17 },
> +	{ "gpdsp1", 607, 18 },
>  	{ "slpi", 608, 3 },
>  	{ "gpu", 609, 0 },
>  	{ "display", 610, 0 },
>  	{ "adsp_island", 613, 2 },
>  	{ "slpi_island", 613, 3 },
> +	{ "apss", 631, QCOM_SMEM_HOST_ANY },

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Although, giving it a spin on 8280, it's not there.. It is there
on 8450, but the reported count seems to coincide with cpuidle..
roughly min{/sys/bus/cpu/devices/cpu*/cpuidle/state0/usage).

Konrad

