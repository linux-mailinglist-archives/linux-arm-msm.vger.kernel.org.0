Return-Path: <linux-arm-msm+bounces-49419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49987A45534
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 07:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1683A968F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 06:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091E72676F6;
	Wed, 26 Feb 2025 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p3LlAIgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E38F1993B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 06:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740549637; cv=none; b=GoyTIPCckU7HL2pAwkfyzGJYEIVuiYm2f/iOYBXPcOKLA+uHYK1S7d7M/mTqv8M+7xoZKSPFso2m/fIXBeRsi2wWo5qdyWZhaPSopWkPwPxrkxPianp36YWdH0SH3KnXuu6ABbnqh3rFxdCE27EYgbismDnpWgLZzOdJ05dEHfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740549637; c=relaxed/simple;
	bh=QJvs8FXWeaOfq2m4P6J0WZ5ujUFqp1HQJvlwASUdwDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESqqMX+fEjh+MmToslW/1SCepp5X3ecj4zvzAYm8/zuPH4a14ty1IVrivDxDqlC7kT/h0yq4jeL5Mhew+fzrc4vyGOcnTPge+4YRwAT/Y1oXC72M+1RWPtmqGqQSmdqax+rAAWx3gvsS9/YCkw+1uGFrf5lRYbK9A4Ffuyk2Kwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p3LlAIgE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30a36eecb9dso66594751fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 22:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740549634; x=1741154434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
        b=p3LlAIgEvS+YQeglnDfIIlLNKF7COpzGftiNMzrRm8/S0uuWTEnFyWP0mlSHT4e/uv
         C83Cs5KXGuQAfHpUAeV65oKPT/T7ZZk/dhKD7DBQXt7KRTVUbFkr3bETG/94aRC2DIi5
         lyWQodAMf9LSizqbEZFpynXUD3c14TeyrWYpIFSfYdVAfBC3c2VonXOJTNgYx83Sa8Oy
         a6hD1WiKNbAdU+P1cBcngE97pQ4xOwxH6NAkAOr9hoz521RNb61aLzQNHUAEdhaQ74Z6
         rPGT+Dv/M9rkoLCQTGhDCj2PdGKWkpr7+0ntCDRKG0Zx+v7Zb8DjKOT/4BnFozdmZDPN
         3uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740549634; x=1741154434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buEGqdHEp7hTwf0/u89pPDhKGvHlA+V+chO24Ab2MiA=;
        b=cL+JdDH+hjf898pLaStq37IjOxejIN7jJI3Xu7E024zpxj12l5gmy0KoquzZeCBU+I
         DkydI+vTSNtpxvpjuiloLYOFGXDkyWrMid+43T8ARA9N71YgFNibS87wiTHFGp7P5kQX
         zzxB7j7s7ekvg0Iw/daF2lUxc6I5bGzKHufHJjWJjsssrdfxV9+pSwTRbGr1PSUR6+j/
         kRGsJrMoFBLEYxlATV5eyl+0rLb7xSLz7LiNn7BI8oR4A862hkGO/SI4D50Ip9/Dadru
         9b1OIAydJ4nECwUaCS4I+3esQG5ppX3CVojNLa0xo2MEC3B0HOyIdf7Qi/FgwDSrYy6O
         n6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMOxLLyYMYBHyzwgyuZ3XqIzls/jSpJe+SWoaDIl5Qd5tRgMUWFD5SQxpNqxD1R/ri1FiWR4AgBhTpYdJU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw4YS1+ZvCXLNCiFqwO3rw2SdxIDNswHTj1vamvb8A21w/uGX2
	ezonGWFq9ycoUIXIpUtuavfdWVNtmTpw5gGi/VQZgoYWYkShVVsvZDZ1iuvyGAo=
X-Gm-Gg: ASbGncs58nwd6ERfeBmUaHjCaQh9KjorkTAHltf5k4azboaIxRx3Uj9Kn/f6V7IY0XP
	au8QGm+pZgLleGX56+N6YIWax5IlXixOf2Jsg8M/B6sAS34rYSyj2T5cnsrxZMK/TtVmCigy68A
	WRRcNNy/N5NULZsfP/r+41EA1o6Ge+I+A3Il8jlELecwhosNw4PyddpR8tErCu9OHIAFaK/YjMK
	co3z0Tk1gmhx8KKQavrhNsecGHHS1swjKbOuzfyDUiVmmtWz1cV8PpuxiAtB0/rMS8k4qqSPinG
	5u0x2TVJ3iELBdFzI0bpb3DhxNH7POsG0XT43PAE8eMxgSBIp7wneVYnwYgqddps2aJuFHgJML1
	tkPGdfQ==
X-Google-Smtp-Source: AGHT+IG8CWS6G0bTARrClr5YZ5iAJEIALey0T04/2PiGrwpS70hRtWkWD+U3cdrkKaDh1s5/wDX5Bg==
X-Received: by 2002:a2e:914f:0:b0:308:eb34:1012 with SMTP id 38308e7fff4ca-30a599702fdmr79176461fa.30.1740549633801;
        Tue, 25 Feb 2025 22:00:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a819f5b2esm4247241fa.64.2025.02.25.22.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 22:00:32 -0800 (PST)
Date: Wed, 26 Feb 2025 08:00:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable
 display and GPU
Message-ID: <wohqhsuu35m2ghd7a5xgsy7ktxvqn5id7nuzox536dyllczobc@vxyzse2wrlwu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
 <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-fp3-display-v2-4-0b1f05915fae@lucaweiss.eu>

On Tue, Feb 25, 2025 at 10:14:32PM +0100, Luca Weiss wrote:
> Add the description for the display panel found on this phone.
> Unfortunately the LCDB module on PMI632 isn't yet supported upstream so
> we need to use a dummy regulator-fixed in the meantime.
> 
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8953.dtsi             |  2 +-
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 62 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

