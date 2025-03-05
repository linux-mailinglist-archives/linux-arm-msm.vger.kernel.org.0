Return-Path: <linux-arm-msm+bounces-50411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B883A50CB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 21:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C533AC50F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4F2254B10;
	Wed,  5 Mar 2025 20:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cas72uP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B273E254AEC
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 20:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741207459; cv=none; b=MR08feWaArTZctQkIJrjm6rtuwzpXsPwzJzmfpgL1PgXS2A7vHQPqgv6IxODsc96/cGgM+2T8tljZDTnyHUXJ6GwYcmvwIwXl7YO9N2MipMl2Cb75F+AoHiczp2fBfjLsjT6/DKPABfLR0CZdLWe//R2jSOXtk8PaNmy5/y+h9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741207459; c=relaxed/simple;
	bh=uBiu/q+tZsa0gP4L7tZmIGYWrBiby7aTZSxyh/yRlQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJNydIFQMJcqzw9YXxo9JogqDPrbk8o9QZ4IliHJXBzM/gdOYX4OHNXPANrJN7kFqYhT1Zyzuc6dy145MG6jrZDN9YKKLQWii2bI+D3oEZy1U4jf7FhRy7RUXDVdgA6HgJi/oeXRhCWRapazvbXG25C5LvDY+jXzFllAHxcL5uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cas72uP4; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30ba563a6d1so14736711fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 12:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741207456; x=1741812256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNdiW6NwgPN019oEVN4C32QrEjKTlign/S0WBpecrZc=;
        b=cas72uP47srT3rT/xE/UP1wwgiw4uBleT9VzbILnEtYmFx37KrEtEDI3PTojoJdrM3
         GBlESaiaUh1Cre7NdDMa5rhkiczA6jWJwtWeJxxIA+MaHQptyYmR7WutZM4fhJK3auow
         BU/gWu5NawElIEbamBuZcDyvYyMZPyMnmEcVt/vFBVEO9vYMc1gOi/OjoXrGX9C9eDG9
         IBJJlG4eOi35pRCS2qIIxsY/ISLob3ZM4KsRY44gXRI4R/7Ayroz8LuPebgudEEu4yFx
         h6fujTRLlnGkcDENsaaqFCwvkT1pGeSF/XGSX3OAxl5VpbUFWvEloveizyIlQFMoS+6q
         gOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741207456; x=1741812256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNdiW6NwgPN019oEVN4C32QrEjKTlign/S0WBpecrZc=;
        b=Fp6H+Z0lvErvhUm2Bf/YXPj3FgNCTcNWq3WcFk7aA3ndq7TDPIJpul6nz6OjlPhTtl
         5zkVHBMJbA3kOfGXRJ/ce8qzcPzKm4ywiScOlyHQVNT1PEaDCK1TOY/U1QPG03fMPJy9
         nFeQOVNmN1VhifTtxlLzWru7l8OciR+Ffm1JY/69gYd7SeUrIfvXl0qP/9a4rYMXDrhY
         KauQg+M79qopBeImtSbJYWD7x7mjI+xwlgU51taO9yLS4zDdgFZYiInvQADtykpWs+t9
         nVQdrncLQBXQ8GQOMHTTzvsLAhhLD8HhOv2muvPnrWSeloRR/TLlDPXnJHevjpLJDmqd
         98lA==
X-Forwarded-Encrypted: i=1; AJvYcCVO1DUs3A//xLJAgR5HBFmCov/w4C/McwpOpAva6XV16pp/uRvs0fTPoh2qrk4dJUdHXqoQkK8nPTbTrJGa@vger.kernel.org
X-Gm-Message-State: AOJu0YzsNNl8+xuMBV9RUBffBJk8NM0CxjN/h2b3ihHh0SpBr407AQXh
	cAZFFxdg8Db2Jl/huG/fFT0AXU8kTqiE4eNdC2lxLvbI/2IesEupMRwQh9EvhwhFu3wb0lJAW/I
	zh6g=
X-Gm-Gg: ASbGncvj6XDgfz44g9uG5YZSMat5VXxTVCpMy5JikW6WV/2JUCUwLLJUojMabETngpO
	CbhS3dLhNtdqBymMSZSpj2Jy5Gou7V6Ac+JHKtKUKOTlOHp9eEalViiu0KJvp2kWv13dMGzqN2j
	WwbE75BHb6OJsgm66gn6Yj6EU9t1T+Ez/x1CjUvibMYKppN66qwLgGmburlctwBQGO1hWPBf64+
	zP/qJcZQuQUybWrr3UvX1tmBm21Up9q+WAUy7iCzEzbvMooLk7dFLL4lsOnLXnw4JKhlKEXqDbk
	utI0v8rAzxc0aM8Gw5KMCwGbUDKdffAZs9JRd06puagJ/mxSDqFW9qEHFb+qooh9deUilgc/1tn
	dFXuG4dLpzOpQTHhStWYlgu4G
X-Google-Smtp-Source: AGHT+IFczkI3MTzyRZfvWgh/m7rUtd4PnjEbD7z5Jr0gFGe3Qx3ssOoX6oc3c7cd0UiybO63WkVYGQ==
X-Received: by 2002:a2e:bea1:0:b0:30b:c608:22bf with SMTP id 38308e7fff4ca-30be341a1e8mr3100481fa.9.1741207455704;
        Wed, 05 Mar 2025 12:44:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b867ca1dfsm20636091fa.58.2025.03.05.12.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 12:44:14 -0800 (PST)
Date: Wed, 5 Mar 2025 22:44:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: quic_vgarodia@quicinc.com, quic_abhinavk@quicinc.com, 
	mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 05/12] media: iris: Skip destroying internal buffer
 if not dequeued
Message-ID: <aevtzaqo3pqi5kwufdwciocybibuketxlfy6revxc6r6bzxdai@njgt56fev2vq>
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-6-quic_dikshita@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305104335.3629945-6-quic_dikshita@quicinc.com>

On Wed, Mar 05, 2025 at 04:13:28PM +0530, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

Please add FIxes tag and move closer to the top.

> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index 8c9d5b7fe75c..305b630ca269 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -399,6 +399,13 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>  	for (i = 0; i < len; i++) {
>  		buffers = &inst->buffers[internal_buf_type[i]];
>  		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * skip destroying internal(DPB) buffer if firmware
> +			 * did not return it.
> +			 */
> +			if (buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>  			ret = iris_destroy_internal_buffer(inst, buf);
>  			if (ret)
>  				return ret;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

