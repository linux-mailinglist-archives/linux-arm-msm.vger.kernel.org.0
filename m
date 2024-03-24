Return-Path: <linux-arm-msm+bounces-14949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF7887F26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 22:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28B111F2154C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Mar 2024 21:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C3B19BA2;
	Sun, 24 Mar 2024 21:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lZ/VvvsJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB87535F18
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 21:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711315504; cv=none; b=MBICGHYkGZOCqb/se23ptnvdERxwww8NsG0zGkzxBCydpwzwaRxcB+mh9CppqClnzHBd26LtCxEFK1VNB3qG7LvY/8EKpDSDMvjotGSy6X1JrMmW2nFSmhEedTgsHwfBsMmYAJfIxO8M6qb9mhS3SLsI2HWYaSytLS+S8EuTe9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711315504; c=relaxed/simple;
	bh=cwb+YFRbwyYuw0AcWdz6CUnMjydvn4ln5n953mSo1/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kjz9FnXbKMaypNRNKUsSKexEwMXb0pKwmt1Pf8dbN+/fh/AqeMa+xMulc9tQf2kWbh2UvuQ01c5+EnG9FgL1iBnhSoropN2ICg3x3AWuibcodlWX4aYM6qBrRAyR7x6mHEnmXE+iIfANxohKUIT45WatPBjyuJGNZoK+21gyxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lZ/VvvsJ; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c36ecdb8cdso1860947b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Mar 2024 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711315502; x=1711920302; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JAn6z6C6kAQCNocTNhwJGXaT3ktUI5cvq1m2gw2cMlM=;
        b=lZ/VvvsJDEAAuFKZ0gmOUfq4yqK30jwFLE+hnyJls6E1AF6tC/A2jSgIwp+7MT6Z0R
         1rsqtOhvFcYpC7pFneC0gDA2To1cToOjJGCK/FYo10p+WfvLC3h7aQE+pQKVjLcX8s5O
         fiBfUR/b08U4MK0n01nOlE+uXs8G1fyVfqxzYPReUbFYYTVcBywjwxwc98aPkJa2x01E
         k9Y+2mrvjZaT+aynXA9EfoFTRE1TZd27RIlTyBOn3lJNtxxbLfnqP4TwW1nUoIZ/l5Ak
         E6AYiOVmx4EQhZN2OBxRBLvFZkrASWExS3EUJvKkFlJHcr625cYLJd4Ux8ZNoAFMaE0G
         hkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711315502; x=1711920302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JAn6z6C6kAQCNocTNhwJGXaT3ktUI5cvq1m2gw2cMlM=;
        b=tERNEU9P8kuB3KFjPy1LJfd2EMvjnvhJXcWqwWVZYAwmSn+WXsm4I1Eita23le3Km/
         /TjS4eIirlQ3IKTxPcGAsXx0Vm3TCoexsnuOEylEs0t9WXfTiYAqTRpFQlkJkPY8tGzR
         eTzIMIYAdof66Rp/nu/nvyWITCc1+wqYlSbzysWMqDUDak6uS5a6cfWQDNknx2iJh4ZR
         Rh0jPazwkywMKKBcbcN/5COSKehF+MzAs9IfRHdT1HrjNS6zrDyu38BkWVTsDuVExzzG
         wNIoE4RdjKCPH/XTAJLnGKo2r6roSndMx+4L2vqAIi9m/7XvWK8DWFY0PLojb8vnIeLk
         OqLw==
X-Forwarded-Encrypted: i=1; AJvYcCUZE1s2LgqYNpGOlKlzuK/PaL7ohaM8qquVavjkWe46HzCE0EhTyDzR1V1ICPfj310x+EJhD2c4eRms2pTbT34opT+NZzo6wnDFEeQEcA==
X-Gm-Message-State: AOJu0YwqrVE+fHkmns/yAhM3/iM26Le9J2ekJPFI+ElNbpXDxcmfwV3u
	nb2Im3+X32S1FgXPCfSaYgbRqNWjNq5bNW3ihDnQYjcTP/fcYNBPn1+F1kGw6fzvH474SF5DYH5
	/g0xEP7+xaUudN4HKN3Jvz/GKHU9ZXu6KMpn94Q==
X-Google-Smtp-Source: AGHT+IFsASaAXYhy6wMEzFscwmoJiMkAf8XUTx8af2vr4btW+ENv9jYLPxo+baqJKEZ59gDPp1vL6Dvk7ZbPq+nVlgU=
X-Received: by 2002:a05:6808:2a43:b0:3c3:7edd:bf84 with SMTP id
 fa3-20020a0568082a4300b003c37eddbf84mr5754842oib.35.1711315501982; Sun, 24
 Mar 2024 14:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324-x1e80100-display-refactor-connector-v4-0-e0ebaea66a78@linaro.org>
 <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
In-Reply-To: <20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Mar 2024 23:24:50 +0200
Message-ID: <CAA8EJppues54mPveOn7irCHYe+T4Fdv-=4ucLLpqq843NLBAfQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dp: Add support for determining the eDP/DP
 mode from DT
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 Mar 2024 at 20:57, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Instead of relying on different compatibles for eDP and DP, lookup
> the panel node in devicetree to figure out the connector type and
> then pass on that information to the PHY. External DP doesn't have
> a panel described in DT, therefore, assume it's eDP if panel node
> is present.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

