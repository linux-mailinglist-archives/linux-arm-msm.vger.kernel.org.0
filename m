Return-Path: <linux-arm-msm+bounces-47668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1225DA31A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91913A27D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C161367;
	Wed, 12 Feb 2025 00:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQfYLtYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C625179F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319374; cv=none; b=CR3Qw/B59pQOByP9M/CUDAaJ6bb+dI8gZrHySpp0Tcbm4EHBk3fEl5EBKP5tz9+7Ehar0onmaLrEmz7kMKx72NnX0eYBUx2CqV2SjBt0LoKvdTb80m2EI6APDHviIIjPzDnfgAL1/Xq/CjN2sbh07r4JVpZxp4zaCdDmdBi4aAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319374; c=relaxed/simple;
	bh=Fnjc85tFo+DRqushjTLDrAr2YQG02n0rclwpTAv2Swo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsq8yiCRk/jIuO5i/B0T616Tn8ZUdFn9TZzq6FzzL3ZNWfHL9Eie0A1mzw+rQO2A0vcAi3lA8soXeS13fhgo9CX4lB7+DJHzoYRxa/uPsqYFFLjOR/s5fpWjfNoF3l0dWcYcwBVNByYY3skygGAma/5ssN0P/smI6qaWWxSM1iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQfYLtYd; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5450cf0cb07so2281280e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739319371; x=1739924171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
        b=RQfYLtYdxr2g0RDE37LwdJH2jRiDZmakJ7p8zlyRwxTyxL7SDEFyHjuCVtFOp+Hl65
         V6TU1Wo9MkNMDs0Wuife11Nwv3jL29vGCcmRNk/VjvznIWKU04vSWzCE4bbidN9IK7Sr
         /oR40yfveV5qNYhWMXbjiTi1782y3o3C03i+8xk1iJCoqLvKuaKq2Yk5K0Gk6QvwH8YD
         TwMm1uXfyiB2kPGeFf8QC6d8zlfN91SQJFVGL1Q4oP70UW5wPuhKiLa/DcPWT26a3PgQ
         xyxcNVkrF+rmlnUwey09ZGmdaCo7W+07gW/s0fAi9B6yVqAXTAz3YGk7ihX5KACSoSDv
         Oslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319371; x=1739924171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdffwztOvMIrK2jjolf4o8Wr6ci4Bs53P61Nbn3lItg=;
        b=PVlsLcbIkns5LrQV31ALyazpd1kz7LohazhhGq5gVyFPXE2lCzJQTMt1VNkv5vSJ9b
         vl92/XGllPaBAn3UMKlSpXh1aVjMB+rIioMyzrDrIbZz9q2liRX26jvCDheq4gNAHb3H
         lDUl5enBnU2IbasJAB3jHaMB+SXKhE3DPtqD/Yl2VxUocatk2oC/P4XsFdoDvHUb5RC+
         P/ALBgU0WHIV4uKRBqekjY4BeCB8wmP+tYAVPXNxt+DOuKlzz8RHvrBsQDsENGpRo4iU
         e5Ly+DBEGJOLB4nAosVC8h14LAbIjzZPtYegZcRDGcx9WCm+wAvUkkOLK7n0/2BMMpww
         vDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhiJz76QH66qRBvpOEMbgRVNsiaaoW84M5vUEYahukpjBkjzyWshf6KM0SnNDPrLuzWoGmyiTrkm2/DG73@vger.kernel.org
X-Gm-Message-State: AOJu0YxeY3XW4hk98GBIfubSMltLnkz5CgUwplNYrw4xuCitmqFInhPl
	wqecQHfJwTo3KUtmLLkBvGoSE03S7wRj/15lRroVCTtRBngOoZ1TTVZu/800QA4=
X-Gm-Gg: ASbGncuHftpmT7yXrKuXIw1KlzojsovFB955qAE2E873Is9Tc8w+/kD8k4pJY9dAf1L
	EV3aZ3wTNgq6aOkqqLr2fPexuKjAxYEeRlQDcji7q7yGPbKnu51cnK5BPuqU0uc5Q1q8XF73MX8
	JACUZQYXX4MGmkN+DGBPiLEj+WquTn8G3NaU9bQ/xUUULljjV7ZZAPZXGD769XWSSFX7p/Y/ixa
	N2VAjg/NvoyuE+X0f1lnmZ56U4wBSr0EBJA6GFVF1ObK1e8s34+uxGyOhU+RzUPrW1fFnIIRdzc
	tpFUl3b+HcvYC4Ml9W8UuprEiG3Ibyuv5dyOwHIDu+ag0B+cdve3spKtf0sYyFiBr8SOevA=
X-Google-Smtp-Source: AGHT+IHy0V/tdcXjGNazvy2Zt+CkmxrEZA7UjXkUXMZVFafXjdfWax/sQBr8F95GBvsvHUv1FZm7oQ==
X-Received: by 2002:a05:6512:3e1e:b0:545:c89:2bc3 with SMTP id 2adb3069b0e04-54518178d4cmr243784e87.33.1739319370883;
        Tue, 11 Feb 2025 16:16:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506ef1733sm1053658e87.1.2025.02.11.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:16:09 -0800 (PST)
Date: Wed, 12 Feb 2025 02:16:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/16] dt-bindings: display/msm: hdmi: drop hpd-gpios
Message-ID: <ma7ur32qudbxaqt7fejgxiqf4vqvsd2o2oki6cz5enwchdli4n@xk5dptvjbkw2>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
 <20250209-fd-hdmi-hpd-v4-2-6224568ed87f@linaro.org>
 <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-fuzzy-piculet-from-eldorado-6dce4e@krzk-bin>

On Tue, Feb 11, 2025 at 09:26:31AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Feb 09, 2025 at 07:04:46AM +0200, Dmitry Baryshkov wrote:
> > Supporting simultaneous check of native HPD and the external GPIO proved
> > to be less stable than just native HPD. Drop the hpd-gpios from the
> > bindings. This is not a breaking change, since the HDMI block has been
> > using both GPIO _and_ internal HPD anyway. In case the native HPD
> > doesn't work users are urged to switch to specifying the hpd-gpios
> > property to the hdmi-connector device.
> 
> In that case users would need to update their DTS/DTB, so that's an ABI
> break.
> 
> Please deprecate the property here (deprecated: true) and keep support
> in the driver.

I will expand the explanation for the need of the ABI break. Yes, it's a
bad idea. No, it doesn't prevent the board from working. Yes, it needs
to be done.

-- 
With best wishes
Dmitry

