Return-Path: <linux-arm-msm+bounces-36419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3389B61DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F1D9B23416
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 11:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311731EABDD;
	Wed, 30 Oct 2024 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fy4uWG9x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649071EABB0
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287888; cv=none; b=UgRqbKV89KQE41LnOai0C0xGxXp+Z/mH/rTX0AIl2BPVA4kys8T5ERSfJWFrAv1QQKKIwIneq6EjvBCJesAQJutM6EvzVD1h3yH1UFjKDpAcXU6WYOgD1L2qfrAqIN5u2ct06rLPGz/lKGtkWcD4e6KbAVYiIC8EuaUdm7xTvuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287888; c=relaxed/simple;
	bh=sxaelGT4Idpj3BClN0eoO2elk6zpAu4e/9ginvYJ+4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVCPe7L1x3WCClpnyOjoTz26AGACIEFuKXNf4D5gJsc+kqaqF0joxNQlu3Kw8HTrPaS/t6iy2QsWtXKxPMNNUMaRZO7hsr8MT9l8B7uyT87dhRyPbaPzLmXl/SvjuX0cf09Cfiza5YXo2Iv0I3ln2mFr9u1Bea70OQq89y8ofBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fy4uWG9x; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e8607c2aso6683093e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730287883; x=1730892683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cX+ON3ydOpBhTY6o2Rbqes4QOxAe5cTgNGKeiB9S9mM=;
        b=Fy4uWG9xdnh4BLS2yJeB3ZHbBdUc0ILLrxm2OSQ/T2OmB3pkIkx+/RXDO2OaoDlv1L
         pM3c3Qd92xzHkaBBEL7J6vxc2+Q0/AdWepcit3Fqfq4ia8o6ijvRc7fwrtzz0r7ORBmn
         5hxE/w/hnXZCHB7e+2a0lZA+EKQkCgJPHq7hvnufdLR/7PN5Z6KEBUEztfASseSXPsPu
         k8TgCxXjyZGiHqZ3v6h8EY1ijmAay0stCcrq25ZvH3/hNSIfc/j5E9VelH8dHfRo5jRe
         XdjU/2FkN5FlkF+kRmnx9w2RggjEYetRjU/+2Gq37jt2axyxY/WmXUnWIQVhAhlwlx/K
         mwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730287883; x=1730892683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cX+ON3ydOpBhTY6o2Rbqes4QOxAe5cTgNGKeiB9S9mM=;
        b=aZjklz7JtsbeX1QeGshZ3nsRySAzox5UK4rXQF/+3fWiaAn0og7ihKu17e/JvZLgql
         lJqrrWSR6CUeXGY60XOcQbIdNI/KSAiOXQJoBJ4Cfo1jAA9clYaFLm9jSrSHKTb1jBic
         fQvRJs677i+gj0XLBn72OmbrAEptsVJHdNUroG14Yuv3EUDWmZfV5qwJLWaM4c8NNEF2
         WWX8bFcmukmq37tEL7ZB2Npxc82/sJSW8MGTZSYpt+ePUBGRnS7vxYCob3GYm7evGinD
         0TYJlgv9q9FkJnM/PMEUHqDJPqvSrshyVMGENr4oAq+7Gf9UBaDktro3HNYF/VMqQlGO
         GHBA==
X-Forwarded-Encrypted: i=1; AJvYcCXgFvfL6ipv8UeZ7yl0KO6qegq7h5i7abgjVgSVc//SNHqdWicO9VJj9f5baOtpfwHrXv7vyZWc+qnceiJK@vger.kernel.org
X-Gm-Message-State: AOJu0YxvjurpDLlgN1mgRQ2bqRE+aRC5UgSbiNZWS1PaZCMyJ/UzR7Jk
	SYed6Vw7m6TsXpFaFr67x+/JEJy8vdLmW/oc3qQ09h7I5NNtKRQ5AaD3LmzbP9E=
X-Google-Smtp-Source: AGHT+IEenLKvMDS8jmV4t5I3gxQ4u0flSc2k6Tm9NyWl2kHf7+zqlwDZsVHgTGFOMNvFzMYwSoNqqQ==
X-Received: by 2002:a05:6512:baa:b0:539:f1ad:b7a6 with SMTP id 2adb3069b0e04-53b3491c819mr7479539e87.37.1730287883506;
        Wed, 30 Oct 2024 04:31:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53bb8190cdasm229410e87.23.2024.10.30.04.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 04:31:23 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:31:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Stephan Gerhold <stephan@gerhold.net>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] cpuidle: qcom-spm: fix device node release in
 spm_cpuidle_register
Message-ID: <qpnqvvrv4lfmhavrt6apn2gajd3ugnd4k6ombcuejzmy2eczxq@3pgxhvac6eyv>
References: <20241030-cpuidle-qcom-spm-cleanup-v1-0-04416fcca7de@gmail.com>
 <20241030-cpuidle-qcom-spm-cleanup-v1-1-04416fcca7de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030-cpuidle-qcom-spm-cleanup-v1-1-04416fcca7de@gmail.com>

On Wed, Oct 30, 2024 at 07:38:32AM +0100, Javier Carrasco wrote:
> If of_find_device_by_node() fails, its error path does not include a
> call to of_node_put(cpu_node), which has been successfully acquired at
> this point.
> 
> Move the existing of_node_put(cpu_node) to the point where cpu_node is
> no longer required, covering all code paths and avoiding leaking the
> resource in any case.
> 
> Cc: stable@vger.kernel.org
> Fixes: 60f3692b5f0b ("cpuidle: qcom_spm: Detach state machine from main SPM handling")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/cpuidle/cpuidle-qcom-spm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

