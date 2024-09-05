Return-Path: <linux-arm-msm+bounces-30831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265696CD5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 05:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5087B2870EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 03:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAF0155C8A;
	Thu,  5 Sep 2024 03:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vc1i/6aN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B701547C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725507228; cv=none; b=FmNXfWvIHYL+yuxZmkdcF5iS/tWwq191m3mxDlLWAOGKepM43etnrOBrqgjzunNnh/2eO8CAOqFlYcqm0CddcdrmjUGI/1qxUVc3MRpDz43Hwlboba5yHBWGDXCpJ3LvLvwcDddfu24XsAweUY8yT73ogdKd4vkeKqoh7SiY1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725507228; c=relaxed/simple;
	bh=WXwWdAN2CjuwBCuWeEweH6BIa47rfL9ZR0rsCYG9S7E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwp4gIPPOo52+DeHv0JmBBO9sOQYso5IMbZbQOk6TevNNr1YCrdoUcUkxjqgCpSMliyMci0llMMaYwfYIWktzoNi7twq+HScIBqRUwlJ/GeVpz2rX23Ydzb0+EyQXfOhuVDfWF4VKPds86t/Fc35iAd6Cr6zAENEgOG5HDyN4ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vc1i/6aN; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53343bf5eddso222994e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 20:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725507225; x=1726112025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyUpvOqb1HnLAQIbraYek0wvreZFpF6ISG16EWHJbNQ=;
        b=Vc1i/6aN0YNl6j2UAWO9TSPvohyORCN/cTWPZRCQQb7qUm5U1Gop2kgWy8KOrTOegO
         LUXQL6VpmSaMHaCwcoxDWT3buaLztjzmd5tOmGMr6rkINV/REVVgyXeCpDR5baTdQGsm
         uz+fqPUc60daz5Zzik0aK+nQSfYdyRNp7lvNpCbodRMOc7uuBp6kyth5wPwJIK1/FJJO
         Kc/0TioZJcAD8o/i2dUn77bsyVnPFYCaJzHKgsj15Qdo5VvyAjEvexYDO/zsxnxaMNkU
         V23jnleXHfnUhlrsvdTIuVTHDtMj1NUox+0PbV+BsHoy3YQMmcj098QgWUxq1Jeo1MHx
         dobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725507225; x=1726112025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyUpvOqb1HnLAQIbraYek0wvreZFpF6ISG16EWHJbNQ=;
        b=HDpHf72pzRIuOkRlh0b1bwxW5pDzebhFLGgGlWUQpEctGWzkNkQlnP2oSJnMuHogvD
         6Snvk0nZeDf7qYu69AMTGdjEgzLGQXskYujq/O0hXFksdTvqB5UrKo/+RD9378tsD1t4
         BqiPX0TdJ/waf/ZZA40BUEfRufNf5FBwXRGdcNp4tDmDQ0U6r4hmLX1V0gXMcvIxJpl6
         +a9Xrn2VC+CmqAbzyVw32NHYDIs+O+0g1pA+PpWdpULICpolAXxAL0lp3rltKX5N3Q2n
         eXW81RNW4bAFSSQ03aIIjZsh5GMh+BHGluIaHDxvkPrueErsjnuxWShiM8uUZYRmDqTQ
         ZfHw==
X-Gm-Message-State: AOJu0Yzvf2xsToOEor9uUniKX6eI2EteCEWWHBUEcrq15xyIl2V9KRRi
	PnT6DVGEIC+EI73/c7slU8Kvjz0U7qUpywsG7AaiBw6fYNz3W2h39DBRizLr3Ma8dSEY00d0MX3
	F
X-Google-Smtp-Source: AGHT+IGL24J8npgJaD6qdH/iBLmRVEB4YeGZTdlYLtr6yfSabcuuW1+0DO4dioT58qUKhW1Yg6Av3g==
X-Received: by 2002:a05:6512:4014:b0:530:daeb:c1d4 with SMTP id 2adb3069b0e04-53546b1920fmr12600653e87.12.1725507224725;
        Wed, 04 Sep 2024 20:33:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 20:33:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	ruanjinjie@huawei.com,
	Sherry Yang <sherry.yang@oracle.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/msm: fix %s null argument error
Date: Thu,  5 Sep 2024 06:33:38 +0300
Message-Id: <172550712137.3299484.13467941827572106122.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827165337.1075904-1-sherry.yang@oracle.com>
References: <20240827165337.1075904-1-sherry.yang@oracle.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 27 Aug 2024 09:53:37 -0700, Sherry Yang wrote:
> The following build error was triggered because of NULL string argument:
> 
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c: In function 'mdp5_smp_dump':
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> BUILDSTDERR:   352 |                         drm_printf(p, "%s:%d\t%d\t%s\n",
> BUILDSTDERR:       |                                                   ^~
> BUILDSTDERR: drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c:352:51: error: '%s' directive argument is null [-Werror=format-overflow=]
> 
> [...]

Applied, thanks!

[1/1] drm/msm: fix %s null argument error
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25b85075150f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

