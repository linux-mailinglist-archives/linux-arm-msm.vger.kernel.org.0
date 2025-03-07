Return-Path: <linux-arm-msm+bounces-50581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF25A55F03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 04:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9CD03B1B94
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 03:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E96F18DB22;
	Fri,  7 Mar 2025 03:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pOohmaxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8CF1465B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 03:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741319674; cv=none; b=iddCpR7LYcdO6R/ldg0TE/Nhgol9h/7kVw25hTLEyVse8pyaccD8giLJ86nRf6eP4hbbQODIFwTvlUoeTcOWbIc5anDgP7jjK0S5am0s6e/WFUsYp/k5Jgsa4Ft6ramgJgYGBCglxx3I7H+e4PAoocA0JhKPO5hbE/ZM8zQoGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741319674; c=relaxed/simple;
	bh=7xGLIoU49g1W69JlZQf4bb8G172hsr2mN1AezVR5wqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxwOumaVypDWfGJkD6i3jTUhrDHafoNoTBJJaxo9WDy7DKv94Z3dz1FmmIPGtsIHQzJUYjScVCDs5BNYDJgLCpBp2hiTl1tYGGYFUrLDQVYpi5iaUUYXgMg9UPsezMODHjsx/DvWNWVGwTtUA+NLZ7r6esyIiK6NnWi799pei04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pOohmaxj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54957f0c657so1625516e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 19:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741319670; x=1741924470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
        b=pOohmaxjh5r4d/TOBQuzZ//oL4g+AkTlysHk/Iwc3Y9IzOwt3bbF3GO2VcUntjpn3A
         S0B4+0JMb0ecCxd+zolUiQN5836c7LEEU3JmEfA9wfSqtF2U0e/7v3CANflnihP7gVAv
         mfvKWpakzn+lW0L4tPTpdfjpG8I5CcsMxwm7gMVB1n8+xVWF0cSBItsypqrXNXksb0HL
         nlZnupBIClddRRUJ9PDKSuUmKZ9npflzw5wsq5YajjNCjF1ylzb8MPSQbxpmH/vxw/TA
         Z8oTwQglFV2JVwGOS7VFhJ9718nu9iRZ9yMq+9r6xT1v8FVAIFVlF9J9NMuUSNaTJcz8
         wndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741319670; x=1741924470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+OWx/yorY2+66tlAZHZ/irBDPLHhMdijI7doxLhFUI=;
        b=vxYWs+BN7X1ASH31HCSgNX6ueWZiEItZxFDewho/xDHVL8auLagB7yJ6lhqvtBtd1b
         kLOYFZlC7xrWwhFdPmnxkFdoTCSlEd5sOhBV0zQD4POU73/KL6o86F78Dg6vEg381c+k
         x2PVeIl/snkkoHPJgPoRh07X17tLwCuvRZeP5CICAqNMG2om0JcZ58E5iO7vUMcOb3ML
         M+QhkFXU1moRnAyq6cOb8hse17cn4mMjlDXnWwqGtK9MYjTEpR10WelsQlKN0nxOpQOD
         +4Z/+PXOAKCsFXn22o1Mp8Sx4va08DytJh7BILBLGuM7k2Gs+u3/tmFjElKHnnW79k00
         W+Jw==
X-Forwarded-Encrypted: i=1; AJvYcCW4LfNJPm1ypPycZVAPh2amReIKZZ2DvEhgGExaIC4BBnMEZLvobX70jEaP0YmmbWrQNEiJyA2qGjRes0Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxCPSsUEHR8MIumbDMa27J4YzsELz1HynTH/X0HDbFdc6HLbP
	saabxhhhE6bM/0MAIVgqTfjeAEppQkgd8BEBslM5l/4v+TgS7ml/97Hjl2zuHDA=
X-Gm-Gg: ASbGncuDD4XJYs9riEUwrt23mJpxQORo2aErT5Cp8a+/GsbzQE2ZZI7A4vmyu7NWNaV
	cfRo7zT3qf6rCFf7l+2gYgX49h+lRZoZJTpAj8/KEodHvZzzDE3VLr3P2Pq9UR0EMDbOzcrMjg4
	8/OLJVPAzY4hnwYucdaVfRCsUyqlRkhztpTEuNHoi3suH+/yMDlhdd933DCZhn+tr908c6EmQxa
	SCQew5nsnvIFiBWyyj6zOW+N28H2lmYZgkYLjsHdH/+yATSif3RXjO4hfYFrflWHfdfq3SmGpvr
	am+B8a6hHA918BK+CQ5ik+LXNj3SjlXiRA8ZpxgEkkekVjlVuK1K26WepTsmac/rYg8njZGII6V
	HIDR930CgXhES0aJsYJkxpHTM
X-Google-Smtp-Source: AGHT+IEJgFAZPzs4rQ+GVKleLSPBx3Zx5gP9AGl5+VtS3eJ/TazNnZBeAYAWo60NeSqqg8te1ly9lQ==
X-Received: by 2002:a05:6512:ac8:b0:549:8999:8bc6 with SMTP id 2adb3069b0e04-549903f6a22mr675684e87.6.1741319669653;
        Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4623asm358766e87.49.2025.03.06.19.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 19:54:29 -0800 (PST)
Date: Fri, 7 Mar 2025 05:54:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next] drm/msm/dpu: Remove duplicate dpu_hw_cwb.h header
Message-ID: <wnqsl5clvbk3gdqlvnomsmif2zuzeuxzhmirz6wexr4ifn2e6k@yxd5fhty3vkc>
References: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307015030.86282-1-jiapeng.chong@linux.alibaba.com>

On Fri, Mar 07, 2025 at 09:50:30AM +0800, Jiapeng Chong wrote:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=19239
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202503070155.TuUngwD3-lkp@intel.com/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

