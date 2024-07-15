Return-Path: <linux-arm-msm+bounces-26192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 684A99316E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98CDC1C20DB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6427518C199;
	Mon, 15 Jul 2024 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lXCp/OKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4737433B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054143; cv=none; b=bZFfkALDLFF4hzvUdF2RRfdMc9h1jrosPlg3OgXct2WaMAy9jiwKoD6326wOdBmtd9f2f9nHKbPHRG5pnErggajLC5wqmZd04C5OVODM3Cox6M7ekMJO7459t9qd5TtEY6xEkKSnCOCwY6dnKfKFPEv6804Eltw3Zc0xtOv3AjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054143; c=relaxed/simple;
	bh=kUXCHe8UzbzfYC3kpoB30f1Ed3HEH0kW0pn01sYLrhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZSqNQT03IOGaUiSvVyYWQk+Fw7a83Enh0eyvr5nv3DnmPglffCIuKK7SVWOTYoyBlKylEdwMYItRlQWbexjZSNtRI61HWGFaFMbCY/EFOdVbcHjj/l385IGNjY3ublMnkhbdJc5wvaYEHh7hbsu+rtZyJCE2GthzT56Le3wKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lXCp/OKe; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52e9c55febcso5644778e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721054140; x=1721658940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4CA0j0qYgma9RsWWWam732StHneIHgNV9F5zSymaHAA=;
        b=lXCp/OKe0nKc38w1qztoDcEMXSjv+wvABK9s//72pw3EoeldMBlVtJj+Mn98Zon8tQ
         J+MAWtwhytfv3q3hzmzfQuwiyIXy+O5BGmVv4SMsxvVn+9NEIXFkDXVTnwr+7dLHOgaw
         Pw1g2GWEa4XtHfHnaihNCAqXWesrzwS5qBkl3f3Ab37WMrxQuF/87TpU2kzaMkkNbDLT
         WMLHtkVs+zSViFGMkSqQIjGZkZn2BXSCHVqcLexNRVXeeXmKdFrPxjbMJJWECLzVI6G/
         TKeoKZ4+SKFIvpNRaeGPfs9QJLLnuSgPARd/uMHvbDhvu+ZuUx+PeU1heCSvM0YsaBPL
         K2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721054140; x=1721658940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CA0j0qYgma9RsWWWam732StHneIHgNV9F5zSymaHAA=;
        b=KaECu9w8bBXBNElvhydvmAmANBqQAChJ5pGJMi+W9fel8oXS2SMCAaDZ60af1R/dWm
         jBCXROvt0OWm8twWvSJz8wEsOO2T7r0c0wWKSSkFZwbbvXQFa6ACxtIzR7cNhx3lUl18
         bBjKUYLQvSels4FywYdtYVMkkmpO75NkFZVtfZpMwPBX7ZYZwzLF4Zk68vQ4NxkVNp6R
         FsG35Cx4uMt8ovyEpq8Ytab5EaWX6Y3gvwfvzXOIw3q9JzMUPjxyVXhEGzhne3fZyFqQ
         9DQlW8+PUkWk8iH9KUVVVoFJZwr2vrw8hEuf9ZiR7Dm4ZC2mK1lc3Qs0bYJN4UmkdCJ9
         /wBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFE+L84+4m4f1vCx71VE1b289ENf9on+TThYGCCTlNFZD4cR+jaAGGopLOyNh2orVkcvnMJpB496es9PPiRPA6guq5fwg6QX4LPkveaA==
X-Gm-Message-State: AOJu0YyfhzoFzMFdGkpq2mWEGQh8cgQktB0NFGV9v/29llONMV6oS86f
	EiGLfYtH+j8KM3VipQBxzKXZBepG5HN7AU8uBda1VMQgyH42h860sOZCqBsvErQ=
X-Google-Smtp-Source: AGHT+IEBt3FSZn+bEEmg7cFHAOhGiDVl/Yrs6OE8f3qL4sJht2Gmf/gnilyQCrhbXPJA9//YuXWhDw==
X-Received: by 2002:a05:6512:e92:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-52eb99d323bmr15414936e87.43.1721054139884;
        Mon, 15 Jul 2024 07:35:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2539b80sm863331e87.299.2024.07.15.07.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:35:39 -0700 (PDT)
Date: Mon, 15 Jul 2024 17:35:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v6 3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
Message-ID: <ai4d3hmxomr4kavhbqgpi5olsq4r6r5abttjkvhn77lrepfbmj@qq7ytgkswe2i>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
 <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-hdmi-tx-v6-3-d27f029627ad@freebox.fr>

On Mon, Jul 15, 2024 at 02:21:16PM GMT, Marc Gonzalez wrote:
> Current driver already supports the msm8998 HDMI TX.
> We just need to add the compatible string.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

