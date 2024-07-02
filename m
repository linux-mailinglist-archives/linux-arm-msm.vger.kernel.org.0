Return-Path: <linux-arm-msm+bounces-24858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE6591EEF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 08:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECB942824F0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 06:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806F774047;
	Tue,  2 Jul 2024 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWpldvQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE774297
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719901618; cv=none; b=SqUMEdDV462WOaJ7+UYI73pJYQ7maXWhI1Qs9/QG4Eeuiw9AiII/R8D4Nw/YX4Bhs9a20SofkIKqSpJ4mJGNn4qpzBhVttVAwazPhsabr9imhEyaMrChLv+Bpbd1L3An9Jm+v8Qt5Y1G7kE/14lt8Fd+QV+BNhtixzQzpRljQTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719901618; c=relaxed/simple;
	bh=z8dhfmBSjmoLou/vJnZ1Eq316Ett29RsRhpUg0m+j6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNcmHxRoavLrcc3HfSTDyre8Jlr16ZFfBJhxDkDNHfOfRl7XZ9AL1Csekm9HPgqa/n9JR7up6BB5BzmWsL1oJxD8yPrW2pqXDiw6t4nbpECINCo1k9x/l99IGkooLMYZOBJismu3NRfAvcvpkpmMTlrb5F0KF7Vk0ACAAXMPx0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWpldvQD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52e7145c63cso4203248e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 23:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719901615; x=1720506415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
        b=mWpldvQDW4fgnqhkFIf3goKIpDCIYA/m8xAY0ldIYov1+dYQjjiF1Kk1aCq7VFJQBj
         MxpLRNsGCGk5q70zfr+Iz5+RxIx0/yuUq0dU6x9KM5zwKoybmGNKchEhMmVrVcwlP7H2
         BepNYXa91HsA+FbHSShK+GTi2ne7PddWtUmHhiBPyvxVDZxa8tmpaTMUniXZmLYFkriJ
         nPH8hR/4Agv49nKrlD7Tgr8efRaGTXUi3jVRw7qQkCS7beN7sGrCrIAXnCQaezH4QPNV
         Q3tb2kJN8Kq/aMz7bdgylW9bf2im+C9YP1rBMO7kNyVIfYQByBIc8I+H0FWVgIZngyhh
         m9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719901615; x=1720506415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ff4Ris1lJRxR6e0xGu/YQpNzFw2f0z8KnYBgggSnQY=;
        b=Qiy83NCxp+vYhamSXazqeNhkEiEm7yBEhREhVeGCZuky0kirw7ZIX5ktHAF6u3Dj25
         w9GBfq5LQopQm1pK3xaYuE7PZrcxROoUfdK4WJwQCMhdIsdTA3jqUdaHOACzP34zz17a
         nf1Fb/MxVELgcg7aDVq9SfZiRpKoq3fi0EhHqblkqA9+3SfkkXxao922QXNr8/aWn4Jy
         A7GPGuqhN/zn2KU7ma/08UPK9/7qHzRIK3vkMWHwAQfXBOWLibJJeBxwC26UmmMdn3e4
         IqhuyaU52gryV4jE53ArhJ7ZFUsQCGu8nnZynvNBAdEI7FqX1ZWPhU8IzR/vpvFwCzUv
         pHyA==
X-Forwarded-Encrypted: i=1; AJvYcCUdzUTCYWloHUad6rBjviHBMEtu/+s2NTGUuTWhPc4X3UN+Ze9n/JnoOEpzvVxIiIj/RbtcZ78/fe1xvQVJE3hFKe9bOBHnxngUpDiXtw==
X-Gm-Message-State: AOJu0YyHWc+2/jFqQ6CVhvA9QPRdmEQ985UQH1oG/TeF6MPfhdQyh4lY
	OI4N5usJXZSLLkjZBJEH8SG8BpRBhl72yKlzFgCpm69Pa5J8YUVcyFU8p7MnoPViuH2lSIw0EEv
	4akI=
X-Google-Smtp-Source: AGHT+IGTfSdpdThJDoiFSVsTbt1wJIsaM88cMQegT3fVR+tIB61p9i1DpXSZ416qGf5KdbnNaDBD+w==
X-Received: by 2002:ac2:5f6e:0:b0:52c:7fc8:8658 with SMTP id 2adb3069b0e04-52e7b92f94dmr2534884e87.34.1719901615025;
        Mon, 01 Jul 2024 23:26:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0bc5fsm1642862e87.49.2024.07.01.23.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:26:54 -0700 (PDT)
Date: Tue, 2 Jul 2024 09:26:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
	kernel test robot <lkp@intel.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Add missing __always_unused
Message-ID: <i46daa63dnz5an5y4463airqi57homwitfetepg6voxard3wgd@xds6h6grlpou>
References: <20240701212330.426399-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701212330.426399-1-robdclark@gmail.com>

On Mon, Jul 01, 2024 at 02:23:29PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The __build_asserts() function only exists to have a place to put
> build-time asserts.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407010401.rfunrBSx-lkp@intel.com/
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

