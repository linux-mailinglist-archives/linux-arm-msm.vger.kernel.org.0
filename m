Return-Path: <linux-arm-msm+bounces-40114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3615F9E219A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2BCB16765C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F3F1F6698;
	Tue,  3 Dec 2024 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NrE3L91t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F241F756A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733238556; cv=none; b=rhVI1WtfkrOjk6bShdpqD5UbBChNyWoGQfpGdACLyAc8r8yEh3hh81B2OgIknXD8zRY4HQxtsiJRbb4/uH0eodcxHcCgSNdhYn3RuvqS+WdLcjCgSpdMlcoKmRMJiuKSzskVS7wTf5ppQ5dK56bpOthL+a+xfRwBB0m6iMTB8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733238556; c=relaxed/simple;
	bh=hClaAh2hG+fl4q8Wxap5/MCIGXH/gdtXL08wBlBbQhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXkftEjvX+OuH+relCjWEW8i8BgiiFXIDrGmFO6z5zv4NgCNI9m+qA2BiLAY/c4Z2AhsTdmDW5JpfRQit9bIfx2K+DXJk940+7Ny76nJOblzEBiap0Z0Xw112JBkJGZ+ueCKBjNQQMvLWIkXiDjBTnP/GUSqF1K3mK0A2PH8anU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NrE3L91t; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df1e063d8so7346225e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733238553; x=1733843353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
        b=NrE3L91t8V8conzf5PkSEnRNofaruFQ8NmqocNBolhmf1uWETKwiBoQ63rt2AxQuIe
         SRON2M5jhoZiGqFdDwIUBShrk2NeXLGUH0GFp2GPtb9i9HZ/ou3gk78eyr7bPeHSdBvX
         hE1T9AgbewN3aDNOP2XZltpfJuBxuFZCVQfGGvXXAGmOP6t5Ozxb0BDnVseds09eDChB
         NraIX7TvDZnDawgrQsza1eTvnA5uhkFWEecZbh4oWvOct57i+sNAr6ozLcuwOJAKtvqr
         IUxBcKsbkOz2bGjObpz1jV4s2nQ6gilGIezTn07hjfWA8YBaHqp9IpffBZs1ivSt1NfX
         6g4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733238553; x=1733843353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8QM3peqYBpltbi1DIHb+zoz79Kj1Hf/KKrtdC4QJc4=;
        b=sJR0bqjC/priCfbKIIhbQN/fnmtogid099qHmVDL8+FnPqTTK69bGC6fNLiwF5p+eB
         N8wTKVRUpiAl/EflUQolKROLV0AbnLhfDBAsIgRYi7/oTrsEwX1d4+43DG4zwsq1G+hD
         1bWugno+uMq+SFbFpLHJUqj5DZP4eN4mV4mL/hQD0e4SrfTTwXUfzUVst36ltq+V3iiT
         OtT+lcOWM8afjJfsSXNYZU26pJNjEQPKYBf6HlbEPsVvUONldneB6bR8CN2E5XrkZV34
         ffaHBFeEEA4YUxljot5QHifRa+sFUqoEHltbgzF1NXk9RkDmZfCs/7ZM2sRbAnAMpLUR
         nBcw==
X-Forwarded-Encrypted: i=1; AJvYcCU/eZQpL2HNS4dhbkykW99gdWnvY4dl0Q0Glitx3sI1/Ld025tDcf2nUxQUcybqqqLW3IQztenXMqtm5XQM@vger.kernel.org
X-Gm-Message-State: AOJu0YzGGBSAE0s8+Cfaf/9WCIsZ3bc6+cJItHB5KulTpj9gNW2xOHx5
	tvoAiXfBgBbA7bvihEAfHXT5zZbVF6eXxfaHlgSgzBRnrIJDfkNTHVBoLBO4sO4=
X-Gm-Gg: ASbGnctZwlH3QPTXTsSQUTEPGElHgzoBo4zr4LygwQaeK0GceyAzg6rQ2g6pk+GbLMA
	5+Z4umKQJeHUyIn5XMdbJi3DNPqIrt6Ygw5sDVWT4rpMXgIzDY4lFaIpCZCp9tkloqAXTCyMbsm
	dcDnoUPvgXkESfQINTmlXtp7DFdWvEvHnSO0rL4InSgWrS5My8puiuxgsbx1rZFJCiKjLCpAcdA
	cnbc77N9rwOjaoScphte69tNkHpAmcaHN+GDoGrDALvzmP4FUQT9UgSXbXMY58LxHOhd6rAbnpB
	p8vmr1Iv5o5ryVhNVLhCV4KlpXeZxA==
X-Google-Smtp-Source: AGHT+IEjlfUflJI02ZJGU+Y+a8G3HUQsKv6NYL+aTiOcebMKzBeRoE8K/ZaRgeCLnat3VtUDppoaYQ==
X-Received: by 2002:a05:6512:31ca:b0:53e:1b79:ada3 with SMTP id 2adb3069b0e04-53e1b79aea5mr687508e87.6.1733238551539;
        Tue, 03 Dec 2024 07:09:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f08csm1852548e87.164.2024.12.03.07.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:09:10 -0800 (PST)
Date: Tue, 3 Dec 2024 17:09:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for
 tpg
Message-ID: <fieuuhtisu6ztpuzks32rvnjdfnusywmmcyj2oz7rg36ablo6l@thq5p2xha6jx>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>

On Mon, Dec 02, 2024 at 12:41:59PM -0800, Abhinav Kumar wrote:
> MMSS_DP_INTF_CONFIG has already been setup by the main datapath
> for DP to account for widebus to be used/unused etc.
> 
> In current implementation, TPG only switches the DP controller
> to use the main datapath stream OR use the test pattern but expects
> the rest of the controller to be already setup.
> 
> Keeping the same behavior intact, drop the clearing of MMSS_DP_INTF_CONFIG
> from the msm_dp_catalog_panel_tpg_enable() API.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

