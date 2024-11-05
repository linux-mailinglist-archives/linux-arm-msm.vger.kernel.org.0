Return-Path: <linux-arm-msm+bounces-37063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279939BCE61
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 14:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5280C1C21A86
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A151D6DBB;
	Tue,  5 Nov 2024 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eqCYQvXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F91D6DB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814919; cv=none; b=SymeNR5GqGg4zPcxmdqku5eCZQAXHLp1E18njxJcT6Xaoyid6PRBY8AHsZ+Gd/A6RSk97bTCg9HQrDANvoIjhwNF7A/rt4iQy4+CCeeNAbsEQQCosT33gDSFLXHhBSOYvDAm9nClFZODCfIOgcHta1Ib7y1mpSMJQWoC5rg5voU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814919; c=relaxed/simple;
	bh=q3GUUlKx9/4DSdIfudTo/BHl0hN1/E6WoZ6HBZQcFBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rqtg09AKBtVF20WT0D8TjwTJQTU+HXBTEbicDa9Li8LDj9NQqkHLrWh4MAtXVoqrD4wATQqmb6dfiysU88ZsDRqMUYG+Hr8XkoVlvaQG7B5G2akYcjRDwbfQSlN6t4XZzwsJvnfB199skWT7+apB5yjzvNSHXiNueJ1HBc/hAfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eqCYQvXe; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e7e73740so2857874e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730814915; x=1731419715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JYPfDLl1JujNUnzUwabCMz6D5QPnpcJrxkCJPH1YFNY=;
        b=eqCYQvXeHRGvRxdW7FlF+UFkmDn712x9y6/xZvjDPZW18kfuCoG1q4XMpfFuowGLJ3
         F4XDD296dEQCO/C/iuKCwkPKErI9dBWhJeMFx7P1OgKY4ATUg2TphS3tzP4HaH1R8Wnv
         NdDQpfhFnhQGsUmSUoENwpWmdBVFvf/Cy21ouNt4UfIBGfjWOkJQurqz1KdkNA9XjcD9
         jaxq+uQ7keCMJb0qOYRURV/lqe50825ln2WjFyt9LUz93wFMC68s2UrY/OAb6F0zqxqX
         WpvT0uTiRiHZjPBGrS+HytlrzdSBsJONgCnfOZ2PqtenqX+8PEqIpUkS6MofwR0bGT0R
         2H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730814915; x=1731419715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYPfDLl1JujNUnzUwabCMz6D5QPnpcJrxkCJPH1YFNY=;
        b=rWYSWO5vcXYR5iz7Fp43VnL/aKc1q/5eXsfm/7IXrE6yqCA5s02cqy76/Loltgbj1P
         LPiCJLp4Y2JgCHYKlurnwKBEC0EYVysANRd43jXHFZ5Z/0chJe7UuQvj2epLECepqqZO
         PVIg8SZbuKgIHMTNtPt1uNsy2GKOkRVA5zbRQCfQ/N6Cz49VVrj0c9QuuX5w5uZcqLBF
         NtsA41Yn2FG4/v6TTmXErzJdnPM4GMcrbh7W4avNzrSJxbSXV8mTbye195RKUjHkykva
         zSyKoB1M9ZU5rxBVAGSpWj2poZ6ZvG+iywSm/SVTVFpQo63StRYaqMn0UZM/pTltJMl3
         SqCw==
X-Forwarded-Encrypted: i=1; AJvYcCURCLch3tShQiDZldpVEVaAYj5+owV24EsioRXR+pJiZpLVmRgXNs0yCqs4FsDHC6BkQfqI5BboPMs+oqMs@vger.kernel.org
X-Gm-Message-State: AOJu0YwAS7tAwCURw3EF6WiYIrN4aFxgVbXdurWfrgA1GT7zpbJNFZdO
	sHXqhi3mmJySEoVu18kFvfqMH82ccgwrEsBAR+NOQF3SpM7WT4e/jtryz3ezO/w=
X-Google-Smtp-Source: AGHT+IEpdU8rDqLX+DIyNpSfiPybyrFjFo19IbFA9Zw/IdLK8a2VdSMO8JD0bOCCp6sr0LFzmU0S1w==
X-Received: by 2002:a05:6512:e9b:b0:539:fbfd:fc74 with SMTP id 2adb3069b0e04-53b7ed185a8mr13160964e87.40.1730814914500;
        Tue, 05 Nov 2024 05:55:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bdcbfa6sm2103558e87.208.2024.11.05.05.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 05:55:13 -0800 (PST)
Date: Tue, 5 Nov 2024 15:55:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/4] media: venus: hfi_parser: add check to avoid out of
 bound access
Message-ID: <b2yvyaycylsxo2bmynlrqp3pzhge2tjvtvzhmpvon2lzyx3bb4@747g3erapcro>
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105-venus_oob-v1-1-8d4feedfe2bb@quicinc.com>

On Tue, Nov 05, 2024 at 02:24:54PM +0530, Vikash Garodia wrote:
> There is a possibility that init_codecs is invoked multiple times during
> manipulated payload from video firmware. In such case, if codecs_count
> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
> access. Keep a check for max accessible memory before accessing it.

No. Please make sure that init_codecs() does a correct thing, so that
core->codecs_count isn't incremented that much (or even better that
init_codecs() doesn't do anything if it is executed second time).

> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_parser.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..27d0172294d5154f4839e8cef172f9a619dfa305 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -23,6 +23,8 @@ static void init_codecs(struct venus_core *core)
>  		return;
>  
>  	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>  		cap = &caps[core->codecs_count++];
>  		cap->codec = BIT(bit);
>  		cap->domain = VIDC_SESSION_TYPE_DEC;
> @@ -30,6 +32,8 @@ static void init_codecs(struct venus_core *core)
>  	}
>  
>  	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
> +		if (core->codecs_count >= MAX_CODEC_NUM)
> +			return;
>  		cap = &caps[core->codecs_count++];
>  		cap->codec = BIT(bit);
>  		cap->domain = VIDC_SESSION_TYPE_ENC;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

