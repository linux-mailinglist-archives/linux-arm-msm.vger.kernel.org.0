Return-Path: <linux-arm-msm+bounces-34102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D855E99A52D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8626D288E4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CFB1D52B;
	Fri, 11 Oct 2024 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4WT5Mr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CDF21859C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653771; cv=none; b=JrU5PCj2ia498eWNjbdGQXZ5HBgJBO2b92hvWfGyXNd8YK0YFAqQk/b8m2pI74cdccBJ4by6B17JX2ifd+pk4y79hqth2F/XcE0WMMf/Va2DrTG2qkgaCZ4mPqjp9bmApA6dUSpNgKSIgIhPAfGllpmk4Xmq/Y40Huz6OYqsH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653771; c=relaxed/simple;
	bh=nRfF8olCfiFNmFNSB1RI4GTeLHZM3xN1vx8gcLPQHJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=payxee7dHoZzzADMEkm+cpj6LSs9L1dkHAzw44KcYXqY8mHkOUOk1V2+4LywPid+SktQJZrFjv4N/SdzdH637FKmVNRKdicWTNLaKiRDKpK9E57OmsWeeSYQN6LoCZTlT1z5GsvOc3SnsiXsXL3Uwh6GH5JtioO17IeotloqVp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m4WT5Mr1; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-537a399e06dso2375764e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653768; x=1729258568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFglGJaMwV1mZRpdQs0k/f02f0W+kbgfKvbreeuozeA=;
        b=m4WT5Mr16Jyt1M8VBVuWHs3jy2CnkFKnKnJ5nFxFS/7clTJ7jbLM+EmofrVM3NyuTS
         8HJa+Nn4pDx6HJf/MoMIjKazunK3hwQpsteyle/GuZRN7RfZF/OGtLsXvHK0vr1h5iMJ
         xUG8nQ1Wyz6RoyxgwAw/MTH4Zm6yy3pzK9NOOqMsDgw6m65dFkhQXVQZIVUhmddqMnTx
         Z+9Nig8NBFY3121TWND+OYFbPRO2RlJyBjGGLitRFzMVRgsRCPXe1df+AYSBel7pLECm
         GvxUydRx13ElBU4V8r34XYdScNsgzls0iKQs2u0UldS/haAtiR5aLqx/qcIsE9TRhxHG
         7Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653768; x=1729258568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFglGJaMwV1mZRpdQs0k/f02f0W+kbgfKvbreeuozeA=;
        b=AQkq63DRJtBsSCrKSLHADcuI2GZuqd1OqTweNH+Vc2k9i3Iy+Ttun61A+tRDXyfF1k
         +KQgn9bWgaCUK49BUTsGxSji17Ntdh8T/gt+k/rjEMNyoP7mIVu3IbzUDNWbsmAPhLJA
         aM9Aa9tN0fe1YdqdKrfDFjvcattWQRrSE+MxGWsqKj9IOt6WURJxjT5T5I8fnknYNqf4
         AVc+qQNfeiWT2gpL+Kw82b4Lshk6TELR4qLXteenPQP3VxQDwxVTzCdjUGDAzJVUulHh
         ZlPFp6i4o9b7eEJQf6g8zTaKsR4d45DfGEeD0KzRVhanEePNbI+vwMP/KcJ3CAeExT/9
         7XTg==
X-Forwarded-Encrypted: i=1; AJvYcCUv591rADF1Z/G/gpNyVupTuLSnPGWFc5z6MT3vcBc91J67P7/WhgQVKeRCp447FkgMeYJVGjmZqQYYNV41@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe0rrxmSR6HPHWjC/EqNZ6OsyoH7/2aoCDcLFKs03Vcve3Fh+7
	LbFU6ujdmO3fQ3hgIHC0MX2IdYPpLtY+d7xqS5iwYfL9bAnERszB+NlKB/mDiSM=
X-Google-Smtp-Source: AGHT+IHEv/W2XprNd46ckYBiMbUlGXS/G0A4pyWURZ0M7R+YR0Z48iFd/SiRowIDUY4FNWpmoYjoHw==
X-Received: by 2002:a05:6512:3093:b0:539:8b49:8934 with SMTP id 2adb3069b0e04-539da59bf2amr1415956e87.52.1728653768350;
        Fri, 11 Oct 2024 06:36:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2673e15sm106557e87.197.2024.10.11.06.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:36:07 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:36:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 09/10] remoteproc: qcom_q6v5_wcss: Simplify with
 dev_err_probe()
Message-ID: <gjhig3yw5loja4xbnym2lbhea6iyrgqwas6qwrjdahqottd2ns@hipkyr6wo7bl>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-9-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-9-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:17PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 92 ++++++++++++-------------------------
>  1 file changed, 30 insertions(+), 62 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

