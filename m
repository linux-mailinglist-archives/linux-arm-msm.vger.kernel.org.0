Return-Path: <linux-arm-msm+bounces-7060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA182B40D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 18:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 814192860DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 17:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF13524B5;
	Thu, 11 Jan 2024 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cmjr8Exr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5751C44
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ed10316e22so52799007b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 09:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704994056; x=1705598856; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
        b=cmjr8Exr9t4/hwhLD9gbLaTRyekJkiLl8LgvVj/EmAlJdrFul+YObDIecW6o+tWdBG
         zGCJqYIKY+FUZufT6YMWZVm4m/26pGDIbGwVD/ltT0SiZxUiv56YOLr25KKD1cCVr6qB
         6iqyEXAzHl4+mcjLO1xitkxfs779nIvk/aqatH5URs3k1sW9CTUxhw8OpxcLdsdsbZkk
         yYqegNzpaIWBMT04b0vK7/HsQlMafJKRW3UeBNy7AOz/UZAS+csXnDM8UOv8+aOdI6kx
         vG2tUTZ/KEHXxCaFAnWfBCLyDIs27fbK45CwYaoqT6C72OSgRsJSE6CFNmKCK3Lk5Oxh
         E9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704994056; x=1705598856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwX+Q8u87YRBeqp+9doFk/KRGXo5yTvV0ztJoK1gxhA=;
        b=dp+4rbil8jlPTOyxro+hIBOCEFa2kbo2UBsLgb7sJ6Qdb3z8UKQN5wwD7yJxOpY3GY
         cp0l79M5lQ7lb/U2KEz3xos/a73NtVqq8rDixlW6u57Sik6dG24D0u/rO8ecqK4HffB0
         bds+cdfBPCax4F3diPAkp1oSIiW2yNi1x1y71YkmbABm705AhKGD4TRKEo0GEn9ymvLL
         P+a30I/CCSNJcZ9X7LnI7cexaJh1VK4TnpgZUvqyDNANKqsVaZQuNnup+29UBY3viex1
         XTjDETJHPeyHIniLXgRaUkFpERliNF7lUAMUu7LrAXMN/wMjJi0rwJf3IKpd/UxbDnOe
         7c5g==
X-Gm-Message-State: AOJu0YyaNUDrTHYXsFPWcFy9wk3IheOuJlsin/EjGoYBGg7HV3vKWyjW
	lopUY+bChUpCnWcSaGUc9zEE0fGfstn5rMEy8Fn375cELjOdaw==
X-Google-Smtp-Source: AGHT+IFXacy54wlB2/avVyvlqWPg2me5MG2fUSxjyMqNRuv2t5PPokTTThra3Y7tS7jvxnp1hqWagKKX50vYF3/UjZg=
X-Received: by 2002:a81:bc12:0:b0:5e7:5cd8:92b2 with SMTP id
 a18-20020a81bc12000000b005e75cd892b2mr114924ywi.69.1704994056560; Thu, 11 Jan
 2024 09:27:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1704993255-12753-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 19:27:25 +0200
Message-ID: <CAA8EJprHVbPv8ULK3mRPXGOFbuCQ6sw+r68uhdfCe8=E5=YkAw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: remove mdss_dp_test_bit_depth_to_bpc()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
	swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
	airlied@gmail.com, agross@kernel.org, andersson@kernel.org, 
	quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jan 2024 at 19:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> mdss_dp_test_bit_depth_to_bpc() can be replace by
> mdss_dp_test_bit_depth_to_bpp() / 3. Hence remove it.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_link.h  | 23 -----------------------
>  2 files changed, 1 insertion(+), 24 deletions(-)

Thank you!

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

