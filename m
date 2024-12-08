Return-Path: <linux-arm-msm+bounces-40932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313879E8728
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 18:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D12E9281ACE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 17:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DB6189BB8;
	Sun,  8 Dec 2024 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwE5ETXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86239178388
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733680218; cv=none; b=CkGEjpE33mFJWHGFwwvKcLPOMdJfrUq+RDbtQ9GzvC5MU06sfpmQtqwnb2r6EB/tWNwyilbZZO8zDO7pWc6CsSMjbC4QbbvPMgL3pRDxAIl+Paa8i45NBVUCVc2W+pYylOW56izZqtcthYyLIQmxn1CyjgMC3fmn96pFKpbO988=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733680218; c=relaxed/simple;
	bh=NMYKVwOZ9ghfzC4m+4A/KuTL24A3wsDJ9KyStazQPDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPwGSW0ShnSW2j/KxDWyUSyldzHXUzk//bNJJd5XQVWmdjNSG0AFSV+sW9vkqPR6bkcQJABBMHQGQdFL+cQcuSRcH80LltY/JUvDwv3+jP91BncK4N3oceWTdOiThqHFyx6im7FyZmZqhvt2oSlAUOj/ZjBJ2P89vApkWhL/Lno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwE5ETXL; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so848607e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733680215; x=1734285015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
        b=YwE5ETXL45dR3NiDyBkaiLAjde/o6JdC74ASIRrZBPm1RgSPgIyfbdLhnybLP5P0ze
         6GhaIVanz6olFKz0KjT9lJb/zH1IFNy/zgtF8Q82XvlltCB/IYqfwwwbyBMg/5QQZ+Rr
         V/X2nyLkybPWPD4wJdCaL2k6axem1qYEzMU9wBb3/a9NpDgfkPPUrVjp+Zsoe+CPIoQG
         8RL3EgJPbualIL+ZocEqCpOfTsOSV8YLGnKtybFQTrLCrTPhg4h073nKPFk3NyIq9lTn
         fcTdK4ZZRX1UC+PlO5xTb1rvLd8X+K6cye4mO8zu6qjJzOy7aPtPUB/h96p40g7tRp6+
         f71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733680215; x=1734285015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u+YWQpYadE0OMjiReHLCH4W+mWwJz1CAGoagd9qERs=;
        b=GFf+wSgG5lv4dOKDX3kpD52GTMlEakv0Thdn7ERS6cCrHmjr8+j9TbKx3Zxfq5/YSc
         8OYQxdrjTDACEa0m34ar1LDF9ht1S/SbuCq8JYZtAUIYXZ4ewpdQTmG2dWMzl2op7P87
         CSLbM05c6JtnjwJsnb+PmIGtNO8EYtu/CgHWYrPod2eDCngygHjZRjWbuI/xjJorCjAG
         ybyUJrdRfwLh5baVena7g97F7P6qzSW5m0d7W6Rmgz9nHDss2cpvJ3cxdZ9DykcI7e5G
         kZfpLtA6ElWkvGd0bTgGSg9Pje2fMqBXciHz53tpec+lcyHqnpzGPKMHorukxUDtYsW3
         jrZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhrEI6HnfXvFvC9MlF/CMYAG35bxeEwq3qU1/EhfOm25qXzYnV6m9SWCOXctZetYOBzkw9BsZkdrrPkG6J@vger.kernel.org
X-Gm-Message-State: AOJu0YzHoq4g+uYZ92iHIP0bpMA30KXwPb/P4GoZlZeOkViFR9CYbPZu
	KPeFE2J67srU8VZG/R+fsQFkt+Zs5id9h4ffB3eac6PjdQ596Fb5LEFVZ1tkq4Y=
X-Gm-Gg: ASbGncs869DRI2NVxiz13eCFTZkcj1DpQG9bSmRCdO9fgbSwG8u8x3dnOSU3QWkkdZ+
	Cx25Uy7ryT9YD0FaDs4WZTDL0y+hX2XKadJDLbTiB4nHVWGoL78ecY/0w+jPbCP/LIAJWOJvyLT
	80gnjHzWi4O3rgdQYyPZbWFvZ4W23R6DahQ3ZXx56SX2++Q1UG3/9nfFZkwn0H11Pd7wn9hTaVN
	/aQHAwq5lggjQflORputriYRR+UsnHdHhIBnNf57Env1Lz5ar1CM4ml/Prf9wssuHrLx3Abj8g9
	7grG6vLWwK5DZkPg2oLqlihRPxyojA==
X-Google-Smtp-Source: AGHT+IEVJLXOPnyFmKaPz9KPMKbv70YRlg73dziKIo45JVQh26G1HQVfDj7ebpdmC8hy5ZJT275q6A==
X-Received: by 2002:a05:6512:33d0:b0:53d:cfdb:c65c with SMTP id 2adb3069b0e04-53e2c504c25mr3188513e87.52.1733680214661;
        Sun, 08 Dec 2024 09:50:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3968850dsm659447e87.31.2024.12.08.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 09:50:13 -0800 (PST)
Date: Sun, 8 Dec 2024 19:50:10 +0200
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
Subject: Re: [PATCH 01/45] drm/msm/dp: dont call
 dp_catalog_ctrl_mainlink_ctrl in dp_ctrl_configure_source_params()
Message-ID: <vemardbn3siohtg74hgjsnugkm4adqw6ekc4xhvjq3fty2rfov@5yhhsvjsnp6z>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-1-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:32PM -0800, Abhinav Kumar wrote:
> Once the link has already been setup there is no need to call
> dp_catalog_ctrl_mainlink_ctrl() as this does a reset on the mainlink
> thereby tearing down the link briefly.
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

