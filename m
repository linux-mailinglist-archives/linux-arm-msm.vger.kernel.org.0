Return-Path: <linux-arm-msm+bounces-34057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AD999ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 10:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3499C2837A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C63720ADD2;
	Fri, 11 Oct 2024 08:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQ3oX4xd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D8209F32
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728634767; cv=none; b=alIUKSXE9/nNI5toNhkeQu9/vjpQPEUywY0irovF5Kd2u14uq18uYChwQ0oVM1Ib6Sn5Prgmi5iicGI/sf+NNAJvFSWU80aejNC1+yxlDGMOAeQltNRTZ1fcD1ldFiD2iUm3IEjHO6XCwiaaSfR1hu4XCFJPuu29pTcuEw7Ql6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728634767; c=relaxed/simple;
	bh=gvAocyFZCxC9vLyotH/Jkh4qPbPfSwGxlwgXJFGlyuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdzgtSuBymysGvKZQhjU1DxT1YKAKWxhXTy3gVZpb7/yHJDUCXSyAqAiufwc6IV4zDgQBrprfQSrEq3JNrvOTWhhqHqtcFvI3qWdEbHRROppE+dj5vB1mh1YF/gWfJ8mfaypp3MQWF8STZrkfMhxULgtJK5AL+Mn3Gm4y5NLURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQ3oX4xd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42cb806623eso14867145e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728634764; x=1729239564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6J+uE5iMA3/H+CWTUJR3uTJQSjnSupLoaiF+Mj5l3T0=;
        b=bQ3oX4xdcmeyiJJvMK+PEwfg0DSOGRqDvO8YbwH9yO2LDWLss8O7hVcfDMSiNgjrdE
         PVm3qfDrTR4pLAv7jQkfF2MXBEghc+HYicj9Nas6rlJ28BC/KCuiYcP3ix9tLv4BIre8
         unHjodLWCfPu8F5AZO693l7JUQrUojpFD9MoatsxwcmyQQLoyZr19wKNEhE+DJ+Ff7SW
         FmLu9ISiFrRqkHWnAS2fZoimGrj0zWU8kFtML0g4RSMCBUdTrYd/5bI0qcGZZsfJcHdp
         gpk8kwqbcCSA4he0NTF6ZmInjnxuYaYV67mXaMXi5gIIyzIr4c+I9QyTlndZ1GYeQXz+
         gdIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728634764; x=1729239564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J+uE5iMA3/H+CWTUJR3uTJQSjnSupLoaiF+Mj5l3T0=;
        b=angnqmfW19mvqGshp/o1VeAOOMCZ0SM1xAWBjsFoEZ8XY5DNdqgCIa7KwajwWMA0nE
         FsgqX5jutB8URdH9Ly5ORA6GAiAEJ9xGDSeh8JdFU1k81zH9F1jkYY1LhZ4zl80l3Jzt
         Xz2MCBGRj/x1ZDCskmU3sYzvPYRdxIwa3E0oIISDcQ3DhwaFEmtSSPERik8uRYs5X3Ru
         jv0YN0lDSW8clKZ/caZV0i63TLT6GaPNis3Pl5Tqx6Fka33mMlIdFLSIZQdicyGN+Cdv
         iGERSucvGzSbgH52iJrr/FMR7SN09kFPQB1oTNKF15AF+O2EfL2QVbU5tLeT74+wg8mK
         4Xjw==
X-Forwarded-Encrypted: i=1; AJvYcCXm4CQA7v5Y1S4ZjLfLi2ZIGHIh7fM8y2aAxfRAk58cjwmmaUbj4EXzjWAOm6O4bmr6FLje61L7w2CdS5Q0@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHn6PFfj/pR67TWfFTVYvsDdosw0qt6M4FH/47JDssCrPW4z8
	v0RUQAwkmEZh6NMj33yvg2zcXXPoledQ2So5P1+g4ARUwCoFUqRIQPUurMxOoN8=
X-Google-Smtp-Source: AGHT+IEh1qHegvlY8LqZOcJFQcPmv4Q5bDdymgLxEN3Xxvmlyb6iR2FO3wDaCT1RCr7OgyZ3OSgJ4Q==
X-Received: by 2002:adf:e908:0:b0:37c:cd0d:3437 with SMTP id ffacd0b85a97d-37d5530438bmr1300655f8f.58.1728634763634;
        Fri, 11 Oct 2024 01:19:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a87d3sm3346373f8f.11.2024.10.11.01.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 01:19:22 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:19:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
	quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
	skhan@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/msm/a6xx: Remove logically deadcode in
 a6xx_preempt.c
Message-ID: <ef752080-130f-463e-bcd4-e1a33fc962bd@stanley.mountain>
References: <20241011052315.4713-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011052315.4713-1-everestkc@everestkc.com.np>

On Thu, Oct 10, 2024 at 11:23:14PM -0600, Everest K.C. wrote:
> The ternary operator never returns -1 as `ring` will never be NULL.
> Thus, the ternary operator is not needed.
> Fix this by removing the ternary operation and only including the
> value it will return when the `ring` is not NULL.
> 
> This was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600286
> 
> Fixes: 35d36dc1692f ("drm/msm/a6xx: Add traces for preemption")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


