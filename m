Return-Path: <linux-arm-msm+bounces-35742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CACA49AF301
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 21:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90751284D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0312219C542;
	Thu, 24 Oct 2024 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CX7HvxN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFC189F5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 19:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729799685; cv=none; b=aCj1ajoWzxiaZTJUqaf08xzllV/6mTA5hu96pjMeithdvTAFgHpFxFQeLngjeH87AA8tyLEmiKeO1ofLtAR3jyoOsfetu7QO89wPr6PKYcXqL4ihZM1NGz/f/mE/bXElfDw1rwmD53rYhrPX7ti4UKz4ZQ+tWF5dRxp+WNr1CmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729799685; c=relaxed/simple;
	bh=mBZVdaWmerYGu5zd0okFXPgWZf+reUFWzKXCr66i1i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ouMlFI4Z4W0ntKFAAk9/KDUlUZr9ZdBeuM51p1q67Zr+FWeNDorUNFsx55kDNKNwtASZkvDA5JF2ozEBGwiAn9RZ14hVshoeD3117BBUSZ0zJkLzt7JybFKbSsuQ4g1FElq3ospMqqI1Dxv3+bGV/yvCdA/DNCi4tyaDNq1Jx6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CX7HvxN1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e13375d3so1585676e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 12:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729799682; x=1730404482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
        b=CX7HvxN1Rcnb0nN5sPfcy56iFEIM4VlRSTSkuhZTs57VFQ2Nut+t1Dsg5jKVRPcdzu
         KsE0jRWpoRMUjhnq0l9wEjwUQf3YyAz4qg7s/CWsoyBBmWCmvFHVs+HqJML1OGj0nGYJ
         ctNHFbpWsBUSxKYMAEeZdydzREhyUj3LW3T3UaPrP7shvHQVlbjQsJdzztkmjqIl+fmV
         gOkdDb1ajU51BlWRnMDMvv8pwcUqMAMoJibaVzxRzoTDjrcgmRo/mgqsv9Z4Ko3VcAAC
         3miXkgnlWCnRRYKaWio3Ge9RD07iKNaPpEY2FMRiYDLIPTxqopsHeNAelStywaB8Grau
         y4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729799682; x=1730404482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zIT1YGRsvT+pkeL01RKiL9RGgd9T2ZXW6c6w2M5TMA=;
        b=KCjqtpvJyVFfKT6EuWkHPmOVKshzFWHNcNRLytx/LE+14ecb/7SNnyU72mgZsSpHzZ
         EFBDfLX0BgK6d5IO5GoCuJOQ0/nh73XaVTQWSRNJTPsRbtGOrTvKd5+46vRmXS6FBBhS
         +aIdnWZuHgwLl0G4Dh1fVRvY28oKSwJWg8I/VFRofpmUfEFD3iE8fE511xcL0a7kor90
         MbbNFShtvkiuv6mgsN//tper3MP90f+8+JklFPRvuzbUZIwKvq1sEF2QV2xxZmsDqj3N
         DHq2Njg2gkD/AEUSwQz5LibFzjpF+fszR0ocx68YbQ16uwdl7bpVCvwe/oeUs7e4sy/V
         PTUg==
X-Forwarded-Encrypted: i=1; AJvYcCWnSwey74HemiY1F33Xiij2VgyuFXGW3ZgFEU7nxbfjpdG1hAT3AMDI/x54GAC3CY75iZdT7k54Ee/v3ZuL@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4cA5kVn5LaYKN1YBryhMkC7FAomtpXabiDSXS+xlHu5zK672
	v+R3ucnPdFTrskWGKpGiR0jLVp3tuvHrK06PDEzqRbrsv0KjqB+Y3r7KDwMgrkM=
X-Google-Smtp-Source: AGHT+IFalx0QZeZZilEqjiYctekRgtIKVNVU9HQYnnJfAhQXhHZ9ry82TcwqGxCi1zyluqe8Zd8wgw==
X-Received: by 2002:a05:6512:131e:b0:539:e85c:c888 with SMTP id 2adb3069b0e04-53b1a38d185mr4425601e87.40.1729799681711;
        Thu, 24 Oct 2024 12:54:41 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224403f1sm1450014e87.282.2024.10.24.12.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 12:54:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
Date: Thu, 24 Oct 2024 22:54:38 +0300
Message-ID: <172979967003.2997922.5344167060572719601.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sat, 19 Oct 2024 00:49:11 +0300, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> As an example of the conversion, enable the flag on the DW HDMI bridge,
> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> outputs) and AUX bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/display: bridge_connector: handle ycbcr_420_allowed
      commit: 3ced1c68751299c0cdf6a1ceeafdbe77db7d4956
[2/6] drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      commit: 58e6d652d138ef163d0b6b4d19f0fc9d4e8519fa
[3/6] drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      commit: d5cd8280c52bad44d5943fa7501bf9f20718d432
[4/6] drm/bridge: aux: allow interlaced and YCbCr 420 output
      commit: c44a0faf5397134b3100c00cc8a8d72528bc422a
[5/6] drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      commit: 785324db2d7a44e866161b6309fbda9a2178d455
[6/6] drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
      commit: 8a8fed657d0427f6765a48c93152a8d86cfe613c

Best regards,
-- 
With best wishes
Dmitry


