Return-Path: <linux-arm-msm+bounces-17784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0038A8FA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 01:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F87E1C20D10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 23:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F58986642;
	Wed, 17 Apr 2024 23:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duWLWHNC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD685C62
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713397468; cv=none; b=cGV2SERxH5T3X/1R2Jfcbe7sQumhv9uUnP3JBRqW/qq+7zMLlLMuunbcaUkrxTA3kCzE3XKIxcYSjFqZCm1z9Bm+oBTWWgfuP/EdJd6YwnT53LLSTwhlJwYClq3HVyHCMX38kyeMHNXjZOOrdTB/EX8cbI5FfNro9AEXE60DsSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713397468; c=relaxed/simple;
	bh=TGvAHkA7J8vQWaG9HblmH7jzH4i/rzj9f66RDD2tQE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/WzIJCES4EHQfowvoIm6Y4jLRvJtiRpqI5xD43ABzipUq2ba9lxJrwxlndBSPhCsgwMuE0lE5Kq+ubNWCPcprHehdBKaJI3RWmXpOqYChLKOiDNxrZeZ604QxeI2SpIoFQ9jqRmUzUTZVTtRygVBTyhGJ4aqLjw/V5PJ7zbJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duWLWHNC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-518bad5f598so254814e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 16:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713397464; x=1714002264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
        b=duWLWHNCYI8NjMNjdU0FQtWzeewwK1DiodA+kH4TvTaWIfcFOI+4m+P6xGWoXwyLRn
         OuarASleYXfexzgjqI2xCmuytHAh1F0rTVF5D6Lrn9gj3jm8jqpq1J/qSYhkWXFk6lxP
         MH5h7eQhOuL4gXIn6XVfGdRRCqFn2gAJnlxfNj4wStKMEKn4pGPnWBiuOg3CQP8YuTA+
         hNf7EoS7WDZmt/4nHfl+KSDkTux7JPAvSoRG31qTGsIkvHGotNNUbtj7WSaMMAIEnGRi
         oQXGEM0qpmznGXTR+joiNyYxo6z+hu38jwlGrRgRYubbmLA8mef6Wx4sft0ty64u3Xbi
         zRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713397464; x=1714002264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgjvMPd11QKFNd88E1N26rp+tffDbeQ3uZCnSiUqKR0=;
        b=MupGQvR5Fykse5IzHMEI5ROOY/Qz+8JrYw5Tx/ImoBQzFiAZ+M69PWKNTInVREXDJO
         H1TJpxmD02iu0DjSZK5z8koac0VK4fFWSS67kJK7P78tliJQRNqjkahQFIMxx3ghuTpl
         yugsG4tkyz904uDFAw74hECXt8nPvaQEtvGbU4kDwvhl0U+dNn6Fwmghupd2vhQkSQRt
         SJ77LG1/JNNh2ZGlh1g72SlIQDMpU6VBTn5gDSS/cI8wJ2uksvZ1edsKEGaj8ODco09V
         ZIpOSfszxytW6LJGcYiByHmuKnf4P3oS1kcc4Bh5CmhDrpaCd6Ih8g7gUpSK0HVYcp4/
         XlEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9Fs+nanqDTHAFum2bFpR+joM91tI3X2xRUKJX4IL/10o2G87acDkuML/TxS4bjCvvrtHICha3F11jrnCbRW2zz9Ih3epahUiczMLDzA==
X-Gm-Message-State: AOJu0YzcaCLbYbHrUC5UdhwJvzez5iUlAxFJ3IdaDrP2VOVTQ2NtwPc5
	jUdFLUk6Ko/gic9k0SKaNpdx368OHIJoOoveVLb8vU12hyB+nYMH2CR9vSw8jkY=
X-Google-Smtp-Source: AGHT+IE8QqXZo1zRChGmPJCaEjk6MKC6Yazzz1JhVm+k0MzRJJYbY0hPM0PvHSQBF3FoHVjciaXnXw==
X-Received: by 2002:ac2:5395:0:b0:518:9da1:7afd with SMTP id g21-20020ac25395000000b005189da17afdmr386771lfh.4.1713397464535;
        Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id z5-20020ac25de5000000b005192a02c638sm36366lfq.132.2024.04.17.16.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:44:24 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:44:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/7] drm/msm/adreno: Define A530 speed bins explicitly
Message-ID: <4m53lev4flu5x7tmw3ygmyvfx6ls5zzmadrzuncbjcnvadoays@b3es63of6ujs>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>

On Wed, Apr 17, 2024 at 10:02:57PM +0200, Konrad Dybcio wrote:
> In preparation for commonizing the speedbin handling code.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

