Return-Path: <linux-arm-msm+bounces-50444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5CA5430A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 07:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3836D3A5A72
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 06:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C901A01B9;
	Thu,  6 Mar 2025 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sn3E1FUK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3124433D1
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243694; cv=none; b=TbjfHR/bigAxkZOEO/LMG7O+OAJ7TkjelqqwvS7kzllsyDIHQLTI2oCFAlm0iHQQcru688PnF08sAv35He79xDv7S9Qc6birEzCTJ/oeWOPr38FQ8YesDrppS0KP7ku9v4EBZkk5QcKonFHMge7sXbgkcMDNZwVEC4TH4H5bw4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243694; c=relaxed/simple;
	bh=AM02XnomQklMx6e1fGoQGHO6cpbF8P9ZM0XUOMIR8WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLeeBTOtnnnSvK/5BIotG79LZ/sqVnN2qkbbiS6hYFYX3BkWJlpYziKddRDIgnULMCv/QDDf30I+kS6gCO8K6QydrQeNnz4mL+71qbEVldXoqyM5OmBrFHPxQ6penHANUWmtGMJiGEw1brgiuIOnSkWABxRYsFOW9lOE6mx2WiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sn3E1FUK; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30ba92c846eso2913811fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741243690; x=1741848490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
        b=sn3E1FUKKcVhgMVXsIF56K5L0YxDvI9VGK67nk9itRahhXxBjZ3/nJxA2DnBc9M04T
         w92FOsFCRZ9vzifdsq6iT2GIsLbCsBsDQeU07/KDIAR5Wv71xCyVBS21cv7m7mX5xgji
         1XbEup8l7tIODyYAz9HoZCMyCeOhWdJPLc4GcgMsqaxuzhQXh3tpzC8TqqAX1h2hPqwY
         zqyspMn5r/5LiF25a/D9uD8hUMsrJmubybOkoS7WnuaRhv5eHkgo9ZevU1GNAY9nejUY
         2PkeUqowsy4iwAwITlmTfm+Fxe3uKlayU4wTEXvT1OhyZAJTWNRSOKH15lezqIJ9Il9W
         LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243690; x=1741848490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHCquTSEunjfj+1YUVoUpApaUr1w2znED2tG1DEgAQk=;
        b=JlOCSfvOC00ceJXrNMwjzm3opjrGZWCxhMLW3gwisQKNq4xRLd5FCe0Ag5Z7VrLZUb
         KulHDJyn6GeSGTkNLGiuqA9oFJRSKz2/SLIKw8wpozPlrSm983vqndWxsu1fCnXB3kSJ
         lLhqhVXZy6f4mlcEZ7YVpV9FFzw+RnHHaOlu+KkgxfFabmN3JLof6boLsWkOz0AEofzC
         Dg3xjQZdk+SHAchX/Nj30s5yKVEIXZ2uCxKHISPEpdQPL8cYgWqMdOV7Wmmxe74/J02n
         AQI7PgBjdT65gA64QgGjMiGHmx/dteEDGTZX54FKOL9m+CWinQrg4axQjwkh8Mv801ok
         m++A==
X-Forwarded-Encrypted: i=1; AJvYcCUJM3Hdr10Khulev3WPHkGCDT69wZCk3quHN+rrw5xDEerbeEdq+hpbT86bu4e8o52LQ3EHnBVW27BXhoaF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/9mU7mEuWqK/tmxVCk7+cTZIQvCNmgRPhVHeDQJbzN4os2n3s
	veguOSkx6PC6vCbu86lBJLn2ArlOlGSWuuFOTJ5Sk7p4CX2L/0UDYTswl8KOmpY=
X-Gm-Gg: ASbGnctdGHg9TU3+aFL/TlHHWY8ngwocVfLcLM5HpYxOmGu1szWJYaiUAhe8x+SySqC
	U+f7dUidFSFOcIs5zCe+CMEsc5dQysrEmVK6C6f6fSdDIHlzEna7V7OszJ+Pihh5CvfClp04Uzt
	es1tOnHNseDrWUUn66hdifvdmbKiJl52EKLawtjZP9nPwRzjDcL/98aDFoVYjwc9JnP1eW0pEhz
	exNvgXxxHzSrD4zZMzmRv9IcybQnxNFNI1NPhyAYzI2vB+SYZHzSDn6Ugq8TeEhwk18q0Yt66cz
	7GSotJQsLsRtbD2rIGCcFJm67GRZGr61MxklUZTrQ+8lrPJjIoNG7jruec4BSmeRP7M3G3WB6Pd
	XbhOvLEtuLfGk41ka0aUTwDn4
X-Google-Smtp-Source: AGHT+IEt5G9y3ap+/DKUieOPRr2JaSqOwkMlnv51oikQmKDmuT5f9uColn4O0tNHRZ5UaMTYsN27/Q==
X-Received: by 2002:a05:6512:2827:b0:549:4e7b:dcf7 with SMTP id 2adb3069b0e04-5497d331b17mr2846180e87.3.1741243690579;
        Wed, 05 Mar 2025 22:48:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae58079sm83858e87.68.2025.03.05.22.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:48:09 -0800 (PST)
Date: Thu, 6 Mar 2025 08:48:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Support YUV formats on writeback for DPU
 5.x+
Message-ID: <jwvctczoypux3pdjzb7ozslqc566nmvb7kfeujjhyqhr3bbbcv@sgiaeqowzb5b>
References: <20250305-cdm-yuv-fix-v1-1-5f1dd8ecf76c@quicinc.com>
 <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1162f8d-5977-42f6-931b-266a2f25049f@quicinc.com>

On Wed, Mar 05, 2025 at 09:06:08PM -0800, Abhinav Kumar wrote:
> 
> 
> On 3/5/2025 7:15 PM, Jessica Zhang wrote:
> > Now that CDM_0 has been enabled for DPU 5.x+, add support for YUV formats
> > on writeback
> > 
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
> >   12 files changed, 24 insertions(+), 24 deletions(-)
> > 
> 
> Good catch!
> 
> Fixes: 15f2825defeb ("drm/msm/dpu: enable CDM_0 for DPUs 5.x+")

Again, this adds new feature, it's not a fix. There is nothing wrong
with the current tree.

For the patch:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

