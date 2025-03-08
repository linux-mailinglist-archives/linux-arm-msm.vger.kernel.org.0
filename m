Return-Path: <linux-arm-msm+bounces-50663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D79A576A7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 868823AA776
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 00:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF684A35;
	Sat,  8 Mar 2025 00:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mY4NHDD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B47A48
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741392901; cv=none; b=qDkd0Bt4utrCfrZKEbCBQe4xJj8NosUV4+0tUKaVB3Vz3DSGR4YEkFi4VyHGOfQ2Lccu3gUkeqw4M9z4kRG9jRZ2y5n94FJ4ItBW5eUW8fa1rZaQYi8YX8ROrUYXMuwa3LBT/BZfBp2XJyQdRoMJUj0qDBiTwMB2HFWEjs8VReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741392901; c=relaxed/simple;
	bh=ew/35kdLK4qgIIWfEjIh84RGMmwMswvqotUpp4L04wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5tJdHN/3b+D6CV6DcvmFbdSaoT4PETc7dLmA1T33ZVBp+mgBhVkqFxSYTWSkSpYWBFYJY45umPNxuvYtvlL4Kyxi2pgbiArn4UHvvZxePlCNWI3oiXMZ+SOn96xXOXOq99S9IZi7x/dcBcGmWBZF0dpdluk5XOB5TE/3HgZ2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mY4NHDD/; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30613802a6bso25500711fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Mar 2025 16:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741392898; x=1741997698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
        b=mY4NHDD/+iY0k/NZbgEBPCVJ7vRSQouileBGpEoGxTkNS8tin5t2lyUpuA5/ae/658
         hkOtOasz0CAcJHQDz/c41qJgNqMuM9iAMQGn5tDNF5ECchNB4JRE8W/NzNbD0zU4G0aw
         n2O1w3JpxRdYi8RUV+lWwSyWhc0Hc2k/KPp0PRgRctvrJHLS5HVosJWQlsYDhL7AGOya
         g+vqCmcCS8QGSlQhzxPmH1LY2Ba3XLzuHgTa0yMJVfEDFEJxTEJUVMt+0iACRbPsVBSW
         J5F1zZ3v4mLSc0vzGo7nQWbqhZSMS0PkprRe0AZHEQ+tR6iqmxllZji6KHjr4knqdBq/
         KelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741392898; x=1741997698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI+9sOurb7xWpdPzZDCFl9IV8OhNe2U1hJtvoJa6TD4=;
        b=iNelPli1K3SA/PqD3ROmb8GQQvnfTLY+ksOteBD/szpoH72EKDEchlpGJ1M9/Ci4Es
         h9hU3wwDPSqa2mnItmgc3zPEjTJ9AF67oAjIAZwFUQocJZYc6UySGyGiBCKr0YD72jii
         KQIvsF+aGsvViSwKowNDHu4ofcyYh8kQn494gX3XLfxt9kdADBftY9yqxtWzB2G3QPok
         66t/DhLkNclMzafabQ+eMEMf74DyxLZJdCNx6YGvnkXrfUAZGkLXSBB+0ksNha9xQW49
         XGuoJshTVoJgg9gWxoeBH4E6xvGNumhFl/LG+PW2xKp9SdsxRLg7oq9jWMbvnypAs4yP
         N+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjjPD/O5zTa8qiGPuuLYGekXDYc+3HBsy/v2+cZLWIGH6B98+ah4D9h+sjWGbCHyC8xHdSxTJG1TCZU/+O@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4386zR2fHzs3j4l+So2RZveZRx2hSmVZMa05vNdDZQ56sc0Tx
	Xz6w2UIb9+uEktfelYDLChy2+rVXa9GhAlgN8aQiunZYwPOXCXE1A7khl0nqrcA=
X-Gm-Gg: ASbGnctDW788OwsRolxs7+g+cZjDXJ+L6k4lFzMCzMMyUPWum5j6qEPD9CqQuGN73fu
	DCUYcEYBoW5/8EoTCrPDJdj+3ZuF65cUBJowxCSEEKPiO9kq76xFULAUrmsBZCSk0xOuhFOZeac
	3C4vDwmcmKEb3IwwipOmY2dGF5lY4vOEenw4cJgWSpQbRl7sfYxHYNYQ33u7d5Qc8X7ALMxYBVK
	tmDdkeftJfVvpHUsyTJ5tkEA1Ig6J9yf9GmZ9NkrkVaLbYnFZiPENeDvH30nrLREDN2JdVfcoIZ
	2pgb9NdN0bsoqeqb+ceYWqwMGqrqVaDCzPKtUznrO+m/hCIO85WZihhBbM/GRvhVb5ml9kZ+s3F
	UwhqS6pMUaIbMUkU4E2TeRaT/
X-Google-Smtp-Source: AGHT+IFbuhinx1qF4on+W3zSP7LNgSQf0IHtNKaQVFWJQ8VobeRY0aVJ73nWM+CnKCUkmpRbt4NgHA==
X-Received: by 2002:a05:6512:118a:b0:549:5b54:2c77 with SMTP id 2adb3069b0e04-54990eaa9e3mr1876943e87.32.1741392897791;
        Fri, 07 Mar 2025 16:14:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm651008e87.158.2025.03.07.16.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 16:14:56 -0800 (PST)
Date: Sat, 8 Mar 2025 02:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/msm/dpu: Fix uninitialized variable in
 dpu_crtc_kickoff_clone_mode()
Message-ID: <vvg6cvpjtcekulvjrovxhjpsd2loh7ath4eu3nya2dffoabgvw@mtcmctbmpble>
References: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ba03dc-0f90-4781-8d54-c16b3251ecb1@stanley.mountain>

On Fri, Mar 07, 2025 at 12:29:39PM +0300, Dan Carpenter wrote:
> After the loop there is a check for whether "wb_encoder" has been set
> to non-NULL, however it was never set to NULL.  Initialize it to NULL.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

