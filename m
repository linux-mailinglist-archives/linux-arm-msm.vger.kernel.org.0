Return-Path: <linux-arm-msm+bounces-28790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 517DA95481D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 13:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 868B3B22BA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 11:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A08191F83;
	Fri, 16 Aug 2024 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GunVUYqC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F06113C695
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723808065; cv=none; b=UFPrvzFotZyQofBPsWvoTmml2YQuWLOCG3tBKsg3nejLab6k64rUB7FXVlYNJBwB99n8dDlfirL/KpkChlvi8BXWhIJfx22S1GXAHmUS0N+GMcm7cb7UrqKeS7nYdjZLwVCJKMQUGTg1+2Re9Plua4ubO1RokVs4rjrTNB9jlfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723808065; c=relaxed/simple;
	bh=6R50P25VUglNb6oXZN4lyDG1RygKx2LfyxopQiWqb7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDGwMgWOVzUnc5aAAbNMKSlhK60auvlz55g8OyANLOYFByJuwUmcHkR6nUEhyjzJD0njUh7FDP9B+REayt4Du9e+rpnB+Rb43iYlP/Nhsm+fc2Loh/GV4U2fiVcaLa7FCltj0xWkAWT0VS7fejyDB0pM7obadLl4jiRV+LzwUDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GunVUYqC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3717de33d58so1100849f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723808062; x=1724412862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFzZNe7OfgMfItNDQGhaTWGUwq1aQam/TzneCKR2kpI=;
        b=GunVUYqCjNFy2O6UC5W3NC0YVF9L0W4156eszaYm52HeorFYQpwQ0WQq3hAflF1UL1
         X+zAX2VY8Jp87RBy4KucXW3xE6a9Xr+wZBeWjVlRmkVswG6TN5TkQVOCTNwBuYVGWscR
         jb6RESLB40XOoSjvA2qVhs8ypTgBdVOvqJ4it7+dePbHl0mU/1wm8eL9sXNF/vhBA3kh
         LKKUC/Ay5WoiF9+heBMAiO7DK8bqqF9n/aloBzWvcarYE+VzG+4Ppny8epvFHZx3pSvu
         qz/eKMZB1NK1rcnTjr9MkuDtC9iTIMxfJB5d+x+ocufmMrOsdvT3HxYeyxhBOLyyitYF
         KpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723808062; x=1724412862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFzZNe7OfgMfItNDQGhaTWGUwq1aQam/TzneCKR2kpI=;
        b=oa1sMR/KiU79eOoXsuCK3/952bFCaYabd8mWCNP3KiKZr7zxWzMRGC0eNG2Ycekk0W
         kSIQwKUb9HKRzzIbtJIXbZf9PfKLOIx8Ue0W4HJ6XfRhOZq7mM6dp4hFzhB1dWE9gKx4
         SfIHY14FRd3j+NvhbiUYHVIvlWhJ+2B8wBZt6j+JDllPtD4banJsoBdOmRFiXD37AN0S
         ixNkYJScLuz7ClMn10/s+X5wrJdcsmXGpEmiz4YGXlcCdOl6gWOLPv8mmSNCXF3/mes6
         VXT5AWVdcMGjdx/3ZgjMak/X5AquVZeRU/dVpR6GMp9i884isAFkB9KwA6kPR5Jnm5tE
         07Sg==
X-Gm-Message-State: AOJu0YzNKSYokLTP9zkKypqNCsT5wQXTIUdyxQYKLv3KLhz/H7foLnxY
	CMrHDV1y0S6ZHHlBg7U+quossGcwITyXWlbPswxZEA7HNXQ90XpQeEhS+Qy3jaI=
X-Google-Smtp-Source: AGHT+IGPR3fLSe1jPOcXZeD3IwyAqLhaj+Dpm02AIv35ZOc+p+G7vfooX3dSt+28S0R/vGn/23MHiA==
X-Received: by 2002:a05:6000:1112:b0:368:714e:5a5e with SMTP id ffacd0b85a97d-3719431764cmr1940797f8f.2.1723808061661;
        Fri, 16 Aug 2024 04:34:21 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b8ae2sm3469287f8f.113.2024.08.16.04.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 04:34:21 -0700 (PDT)
Message-ID: <9c254643-2d95-43c5-98c5-cc6f2866213b@linaro.org>
Date: Fri, 16 Aug 2024 12:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i;
> +
> +	/* Loop through all enabled VCs and configure stream for each */
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_top(csid);
> +			__csid_configure_rdi_stream(csid, enable, i);
> +			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +}

Just noticed this too.

You're configuring the CSID routing here for each enabled VC but, you 
should only do that once @ the top level

->


	__csid_configure_top(csid);

	/* Loop through all enabled VCs and configure stream for each */
	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
		if (csid->phy.en_vc & BIT(i)) {
			__csid_configure_rdi_stream(csid, enable, i);
			__csid_configure_rx(csid, &csid->phy, i);
			__csid_ctrl_rdi(csid, enable, i);
		}

---
bod

