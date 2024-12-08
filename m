Return-Path: <linux-arm-msm+bounces-40911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2609E84CD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D6FB2816A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8CD146D59;
	Sun,  8 Dec 2024 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Om4S5805"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A84922097
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733658651; cv=none; b=ot2R2c+mzGQ4ZwiJTgTkR3jzb+/iRmU7hH4yYnCb5Ra2me6s8kWiPUsGIZmZDNkllsnpuqsboJ+IWZFO9uqoxMLqCDk05MvFIC3L+cE7dqombmPx3LieK8V9DuA/URxe8P33m7FdWT9w48XslqygAGF3LZx8hR5/1h2Con0XOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733658651; c=relaxed/simple;
	bh=x6oYuo+yS8kOPNSc4ML/rCheQeCfgbmNJ343ipQn7Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoMfx/XxVVOBnxWSTLTxs8g1DstIPtrBW2+cxnKUN9CDPRDxYC4KTkZmW+Yzfln5SJYilOk9nLP5N2P8FPY5DAnctHlKdRvBQk65UNVjNZ6G7Uz1XQ4g7EH/tQumMAJ1KQJjqIwXWiipFqx3qI6pmKe+9x9xJvh0I3U26EU6kOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Om4S5805; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53f22fd6832so866361e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733658646; x=1734263446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
        b=Om4S5805rKJ7c0ouEA8I2tzQbrrxzkz0SBxbVIYYmkKyn/Lj7ObS7vkKal6E/0fXJ0
         nRUtKaOI/Teqa+vnsXJkU+WcrdCGPlg9kVeE0D3zstsFlT/NcxwcsO45z+id48pYTwtX
         mQEP0+l1SxPib/SEIB5GYCOiIXM0Qgvtsln61xMIXJjv3DhD5nH2VULM63T9Okpzd34d
         CQqBBlLlDAW4wLBSPUqWvO24vpUI5uMihtwUColuPPsw0WeKlgHtGAz/Em7Vuj2JOR9T
         gMGgvsJtKiwl7pJDEJazky5qzQgCg/OBHrHhQgkHNwYYWito3pg5eJ3nxycaODuUAjcO
         yjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733658646; x=1734263446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oun+K+EMFqetiro2F/rNjcDe33esgYQxsDbhRp+6WB4=;
        b=gYeR5cTJ4q1Z10AiSQSTF2q938CcDlEWrrFw0Sz+rWSOR6c+2ZouJYL3b2fvV+Cffa
         1/NI2wOdg9rYdDzUCXGqWZojgqVYEQoudhEoI+jJao+BcOyw1amseaERBXL5ftnanD04
         eCvbhFrKGeHTc+NVgkybk2U0/xM4Thor8kDf5Zjb8q2u6PwDrcnbBh52tJsNEW1F/87s
         4NSlImj0NscbdmxUFvlW6zg5FQ482xq+nsxNE4XSRjdKHA5OEebModxnvYBRneAgBrUJ
         WNtvXOX8Tw4hXhI5vWaTxDlauP4HLIEo4J5XvzefU+OdcCKDCMyd892TcywEC8E+ZkzG
         vHYg==
X-Forwarded-Encrypted: i=1; AJvYcCXNi4zw545Q+WJQNaKDj7sJpggr/gdjocoeAJoOMIxDw8sGU4bSDkrgmaPH/WNOO9OscQwGBzgHJbjubz8j@vger.kernel.org
X-Gm-Message-State: AOJu0YyJO4jreAm5IKUOBKt2YOPvCk8hwp+dJL374ZV6gdZyaEfXJZNz
	v/AM85XQ/HpJ/c5wlfgmv0KzOwGd7CE684rslRYUC0g6q/mSWswmCkn/9dfNVrA=
X-Gm-Gg: ASbGncsUTBqUR/vlaOrk0iSwi4H8J5YGdYh7yAo7/B+SuF7/+KX494a3t01scDn1HZg
	MUaqvLaSx9+a0gVLBVVIgHtJmUAz1bx7tZWPPL8qamRu5Drf5+WWlNQrglwHRXn8hRbxWQ8QR1r
	yYmAkLleABQ5L/r4y6mzVlfCbHd8/eu329WclXb5R12AJc+oP5/hbMqHlo4BjtqIzun3WiJsvoL
	JeH9nPLNZLENymzVyU0+J6JqZnfFhAQjiIE1vaU02lkm6VM1cV57stzs1EQp6NNWZ82YbFFakcW
	HWT+KU/m2zTuMYsxKncZS8orIeUVtA==
X-Google-Smtp-Source: AGHT+IFON8ulrpLU68pOJOmwTjUY9DTeD7p4bAWPDsvZgnewDN7qknWszAcJ9yPWcxocxPPFC1T4OQ==
X-Received: by 2002:a05:6512:2245:b0:53e:389d:8ce6 with SMTP id 2adb3069b0e04-53e389d8e61mr2465693e87.28.1733658646469;
        Sun, 08 Dec 2024 03:50:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b8f5842sm211406e87.130.2024.12.08.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:50:45 -0800 (PST)
Date: Sun, 8 Dec 2024 13:50:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 26/45] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <7kok44t3q4dv7jsapvdq45t4lpoaxwkxe3f345ewpfyq3ndgoh@t532yskl2wys>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-26-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:57PM -0800, Abhinav Kumar wrote:
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.

Okay, this answers one of my previous questions. Swapping these two
patches might be beneficial.

For this patch: 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
>  3 files changed, 31 insertions(+), 16 deletions(-)
> 

-- 
With best wishes
Dmitry

