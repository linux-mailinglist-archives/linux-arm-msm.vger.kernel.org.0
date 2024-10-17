Return-Path: <linux-arm-msm+bounces-34827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366E9A30B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 00:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648DA1C20C26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 22:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4437B1D79B0;
	Thu, 17 Oct 2024 22:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBBUYmBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15331D7999
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729204173; cv=none; b=GlRZpZSLKt9V4aRRvzTbeKMcamx7bG2a0Oj8Yd3v2hRIoDYUdt/5Q3/Zdp3wlMI8TkAgQPtU3eLeJ4DA957xbH26x4HNbuUI4KmPxDcUGfc99jOuHDcBqt4VJMql4dQwtUcoUpTKzw/xUEQIGw3iNXixorK06AIfpJWPnfHTebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729204173; c=relaxed/simple;
	bh=UWbAI5f7NCyJYHnBUnwGT71W6lN34o+CeWH8Q7CnJhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2KOBKV7Y5gMudr9wYCEWeH7jXN4rA+ClN0gGJUHATSlOxENSbU+AtOQMiKYcn3jR6dPchAY/VslMwMNsTn2VEv4KJw/MSofzGfjJYqNpaF85MEXYqpz3kMBcH1hVuhdBpaYULy2Mw1x/AwLrWS7S/jkgwoaaG95Qpi5nXtCMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBBUYmBA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1904586e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 15:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729204166; x=1729808966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Om7JKcGAWZ68u827J2NuJiVucAUsfrDVJWjUlubbu3U=;
        b=iBBUYmBA9bC8ZgUPGUTKiJklakSlOY4it2/aRzFKY5UT5/prL/u82BSLq8kVYhNSaM
         9RcNGcb4mz+9DAXuuL1WShGld03UrE2BT4/+EtzH2Ioq6OlpOKh+hYWGRiLhRAjpiHZJ
         Kvg1ySBtJn6roWVPu3549rpW1Q7zPbpeO0n+azwoV4+FaqT4F9JHHNQ2QnPglbUzW0G5
         cYI3dZQYK6cHTr2kQVBHvqVi7fLEwDUVsKTNComAMm7k/HxuMSiiCVZcKqAzKKOpQpob
         aHZDQsrDyoWiuBiiFRnn/8OnHJKPN9WZ4aX6iVqXAg8zseLpq+Lq4z3Z3ryed7XtGAiG
         BY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729204166; x=1729808966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Om7JKcGAWZ68u827J2NuJiVucAUsfrDVJWjUlubbu3U=;
        b=jGWPbgGqmVb1LaCtAswiyCOq7m2luNsN9vrOFi9r8EVVyRawTyeo9FyeheoAb1uwSF
         sYdh50m93d90M4jYcF6bNShJXFoNEN7nG2sIdxgjNZNbImmKQAQPz/bs3DeQf3Jlgvs6
         Ixc0jwlp1mp0oIeXckcPkepRVnGW//JxEzM+V/iijRsHDmyik7fiZOdB01kV+PuJfAtt
         tV5/L0xnUx8MslfguGF0TMOULqN2QBS0Pg936QhY2zAJB7BJeJ59gF9nLZQOL1FtF6m3
         xPIG2bCgiF5buQuBTOESPIDS4R+YgAmafpODSvoRijxUUQk1mHxEtNy8W5M+tM2/o0ES
         mIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwvzyL7SE9OK+Vw9/3oNzyiJNRu2H/07oJIZVWgrMmXHxwZbOEiMy/cgV8RKgT20KqN6O36rSyf4TVjtTt@vger.kernel.org
X-Gm-Message-State: AOJu0YzLQoEQmuYnWIMfhaom8vv9VgxU7ceAfaF9ZngOIJOsuRJq+cuJ
	TvFCpDSnxe7ZDEV4WwWH2P9X1zeg104aI7MxKrLH5FmdA4UtvBfIUHGb+KbVgfA=
X-Google-Smtp-Source: AGHT+IFsxCgdKdVcgcoZD4gFCmbJZFyg3QiNCRkJLlIo3r8WemXMba9iczdeWP260u66TYNvUvXXow==
X-Received: by 2002:a05:6512:3d20:b0:539:e761:c21a with SMTP id 2adb3069b0e04-53a1544629amr276391e87.48.1729204165954;
        Thu, 17 Oct 2024 15:29:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b9343sm46886e87.85.2024.10.17.15.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:29:24 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:29:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ath11k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
Message-ID: <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2>
References: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>

On Wed, Oct 16, 2024 at 07:24:09PM +0530, Balaji Pothunoori wrote:
> auto_boot flag ensures to take the firmware and boots it
> up during the wpss remoteproc start.
> wpss host driver would like to control the load and unload
> of the firmware during the load and unload of the driver.
> Hence, disable the "auto boot" for wpss.

Which driver? What is the reason for manual control?
The board seems to function properly with the ath11k driver, which
doesn't seem to require manual control.

> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> ---
> Cc: ath11k@lists.infradead.org
> Cc: Kalle Valo <kvalo@kernel.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..05963d7924df 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1344,7 +1344,7 @@ static const struct adsp_data sc7280_wpss_resource = {
>  	.crash_reason_smem = 626,
>  	.firmware_name = "wpss.mdt",
>  	.pas_id = 6,
> -	.auto_boot = true,
> +	.auto_boot = false,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
>  		"mx",
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

