Return-Path: <linux-arm-msm+bounces-38460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0309D3940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64A6B23ED5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E9A19D894;
	Wed, 20 Nov 2024 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xh6euSmW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3A919CCEC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101239; cv=none; b=HrpBLsmMsSCesOioJzHnHQk9Gbs2Rk+SthtuujAGvB12xt9j71uWs2o5gN2pj+B1ACYWc2OD2zbuN+cgtNoLzmiATYZdOvY2jzAPzyKEyRFf1rLhwy06A8k2kCc58EtP9FJE4QiE3DbFtBKIOt0oF+E++IF7PcgbwCJ+Z/W9vg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101239; c=relaxed/simple;
	bh=2R7MrlSbXdsIoKmQ8B225gvAC/SXbSoY+2vtlQPNGnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxunsG7lGMieyAPIA0j/z5IsWj60ihtAqGQgaJqa+uOK8d8ZC3QB6vrnk2RGsh1wBGEtKQZj3XjpvK2erHnOK0dXoY6Y7WF7N8Vbux5pjTs4p6hhDAWEEHnv6dIBbnsTLacWv9Jje3531lSDqpi8K6Ul4fDPiZAgjHTGmcQIQ1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xh6euSmW; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53da5511f3cso6630398e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101235; x=1732706035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSBDmYSFXuA2s69SSkdK3qaRDlUBpjefVOog6k4GCqA=;
        b=Xh6euSmWSI183aFHWmbJUcgYbM7Z4O1/VFPWRSHd8I1nkw3etu3zRfaJ2RchUv7p1/
         m+QoQF9GilXji8STASehIi4MlaijBwdVrp99EiVv3xG804YAbKob7YH8bcX6G3V/33DX
         je8TVUVDamfu1ouKGm6Lm9iTNhl9oidfrVKHJLwHXjq/QxOb9blKdd58E2pzF5cqdjiV
         LzrVy9Xav5Nu7+tadoxM6AzXe1OMfYrQWt1pVquVt3PDR6oRbKrHJnQWR4bEdvh2dlR8
         0REDI7bohd3lUIi9FnayMGAQKgRjdEdAGjw+3qeESX+19wTqcmEdWobXbtjBGJ3B5N+A
         m4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101235; x=1732706035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSBDmYSFXuA2s69SSkdK3qaRDlUBpjefVOog6k4GCqA=;
        b=aS5dWM+HbUHNo4aLn77uQLF0GDy1MsQOGaXVKXew+mTPFvLdwAuSywhvpN1dUstrdU
         TEh+/N1oK+bvw5Clpq8LU2wqbPgG7g1kELgZ+3eE6O/u3Sa8/ibHV199diXZJHOuPDOi
         Ot7xVgGaB8aCEO9ld2RPHYntXJBsI6vM2eW2qK6zYnkPesCcTT9tvNcdYFzDRT6PFDqN
         yTi6fQ4xifLpUi4xC1kub4N/zU88XwGJcuODeaSqAVQJymk+I6Bi44qJQ799Pv+qf5tH
         l0QelQz2YL5QFvCJHE7gbMA2RUDqa6IODIN73HNhKcysWsmHbbwK0lXczWarocM+KRAH
         ZUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIht4hDdm1UNo3WhWafO1S/bWL0kr1ysjmnt/bEIB1Q5vmWBTElK6F8Cut/qQFMIC97h4krd97Baf7EUa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbrl3+nGWozuYYUQV0fb0L92RXAwbETJbjpelP82ppDcUXU4Pj
	WfySW4OjwvEY7V2WXYHpGBZ6LmVk38b/Zs1IK6BGGzt7F/FMYrF6bPdTEcDOTlU=
X-Google-Smtp-Source: AGHT+IGYdVlXPyYW57Sact665A1h86qBYlsDUr8EZ6uXwnZYrcEpnGp/EwmAPkJR1t4j3+9iwpyGLg==
X-Received: by 2002:a05:6512:b0d:b0:539:e3d8:fa33 with SMTP id 2adb3069b0e04-53dc13742c2mr907280e87.54.1732101235338;
        Wed, 20 Nov 2024 03:13:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd3edcd5sm597600e87.44.2024.11.20.03.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:13:53 -0800 (PST)
Date: Wed, 20 Nov 2024 13:13:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Kuldeep Singh <quic_kuldsing@quicinc.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 0/6] firmware: qcom: scm: Fixes for concurrency
Message-ID: <vr64bidkdzoebqmkq3f5jnpqf2hqcf2nvqc27vhu53ave3bced@3ffd2wqtxrvd>
References: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-v1-0-7056127007a7@linaro.org>

On Tue, Nov 19, 2024 at 07:33:16PM +0100, Krzysztof Kozlowski wrote:
> SCM driver looks messy in terms of handling concurrency of probe.  The
> driver exports interface which is guarded by global '__scm' variable
> but:
> 1. Lacks proper read barrier (commit adding write barriers mixed up
>    READ_ONCE with a read barrier).
> 2. Lacks barriers or checks for '__scm' in multiple places.
> 3. Lacks probe error cleanup.
> 
> I fixed here few visible things, but this was not tested extensively.  I
> tried only SM8450.
> 
> ARM32 and SC8280xp/X1E platforms would be useful for testing as well.

ARM32 devices are present in the lab.

> 
> All the issues here are non-urgent, IOW, they were here for some time
> (v6.10-rc1 and earlier).
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (6):
>       firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
>       firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
>       firmware: qcom: scm: Handle various probe ordering for qcom_scm_assign_mem()
>       [RFC/RFT] firmware: qcom: scm: Cleanup global '__scm' on probe failures
>       firmware: qcom: scm: smc: Handle missing SCM device
>       firmware: qcom: scm: smc: Narrow 'mempool' variable scope
> 
>  drivers/firmware/qcom/qcom_scm-smc.c |  6 +++-
>  drivers/firmware/qcom/qcom_scm.c     | 55 +++++++++++++++++++++++++-----------
>  2 files changed, 44 insertions(+), 17 deletions(-)
> ---
> base-commit: 414c97c966b69e4a6ea7b32970fa166b2f9b9ef0
> change-id: 20241119-qcom-scm-missing-barriers-and-all-sort-of-srap-a25d59074882
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

-- 
With best wishes
Dmitry

