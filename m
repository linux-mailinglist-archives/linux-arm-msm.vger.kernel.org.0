Return-Path: <linux-arm-msm+bounces-39212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6379D9989
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 15:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA35B164AFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486401D5163;
	Tue, 26 Nov 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENF/T8Zr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40B1B87D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732630938; cv=none; b=LcnZZpWt8Cu0EnBDMclAoRefimDncDcq341ie2qOShdQ6hGqFvHSnYoFhEV6JsGlQh/2QYDm0SsalZdK1u8ZNEXLHu/OqljIAOt3aoQpX5Qz8TYJ/TagfXy/h0NxUUWXxFpAoK/GooJ62OgIcpnexFNsHjrhABcuLSYjbepDCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732630938; c=relaxed/simple;
	bh=SOSUQAOlh5dpiHg97YBtYq96KsfsNqWvdPKUV2/BcQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mm6CXYLqo2hVXyas76LwpWTmzfn5m1ZjNYnNqwBIfg5ML4cR92X/fpb4wtNK2W7cKyovkXE4Coj4kbobkfPEXfRlcAhx0it5PXPoArTACJE6lSo6eEokvnCupAv3588JPP2a9satK+kAIPWHviAZjK7mn5qdKAu8pGivwN9fiTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENF/T8Zr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso4280247e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 06:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732630935; x=1733235735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvxvLshTV6jYerFVYx7chEJSlAAM8Tt1+r2hoHp2IbE=;
        b=ENF/T8ZriMV9+IJsXkIg6O+Ipmx8gw3iirWWAsknY5Ru3zhqQuQbhjHkxFHVllaId/
         htWDD+xwBC2j/wChfkI6mR08CLZGeAp+Gwo34iYpaqsf72BkBWPLG9j/O3kShDGy2G+V
         v0EfptUH5270F7ArdKAJP48MGNKEyFA6E8ybd7cu9CHRzZiL4L7fa4nf41AVmDnZx1pE
         GWSWgWw2XfjM+PPtSPnkRUwyqhsVaqV6Z3Y1k+1vNS1IPtCpGmCxSazawawYMdHnU/mg
         RTQ28goK6oaDp0wkzGj5i3K5glou4HaS+fkOuEVD1oCwkk6S+TCMTZLdkBMGicnuIA4X
         RAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732630935; x=1733235735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvxvLshTV6jYerFVYx7chEJSlAAM8Tt1+r2hoHp2IbE=;
        b=fKtxkyWm9ge/F03341JSIWleusf6vSdIwNEw9idj9dI/mBOprtD3nRqvjkV1xRIqUf
         4avYPYm041RhXMaO5vaQJPLaUueTidDpXNQlMu3SW7vh9N5/Q2dxQer6hLhGmnKFyoAm
         C4xKhwg0us9HP8/JIH/oMcXzsJau3C+u4lAOQtpMPEUjqdtHy1p5hBCRQwVZeC+HLFXB
         dCLnMtCDs6Ezbb1w6MM3MiZDYTM9CGMf+MbaFYG+xLDHHutLa0lI3z+it18h/kkcMza8
         LxvhD11f7SNxp/stsKu23IILt7kOaOD9t/5aQaFLjiJ0cXCFp3XxagB/dfmxu6MnzrHa
         +C/A==
X-Forwarded-Encrypted: i=1; AJvYcCUkwjTUrI3mCdR+NofHXSvLz90xafYqSa4PMqbtHVeutevAceFphR0opfa/ncDEbfHpn+zv2Fn6rUS5T1SD@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhGa+1hNonUfxlT4+YPDgo0DXWzNlqj9X4M+HJWHBi9FxQM1c
	DWMOvTjqWGidGZtRy28VnxXLiKHucaX3BMliG63O8LnJ40+pwEyK++KEPRs8MCw=
X-Gm-Gg: ASbGnctQ5wTPqyMepvP08VmVcJ2NHLWE5ppjEyO7YLfp6U6Hgk2bvLJUyAgLPVNO47H
	7SH8imNqNvzxBy+TnnhyRqhdZuUJe8XMojpPp52SVBHR5bCT43qkQdvsKTbBvUpDGoTmBSwJVcO
	JB3bUuzTDQVLs5/R9mip7d0xC+LexsLEyKlYa9FL0Ykfh7jLZrcBhY7VyaN4iAAnzcLw7AMsMmB
	puJ9dBPea1s8q0UchWnRInmjwcDPtQ1Ztyw0TDXQp5wsif/MtmDvMQ1gcjS1YEYzq2ct5+e7uqh
	tWuwMEUuaJ3edB4KPXAMVhCHuXuK7A==
X-Google-Smtp-Source: AGHT+IEAl7X75IiAncEt/phKEqkFqYtoa4WMTlsSJtcMFByYuTRg6SCQ3j0BgI9MU+tyzTVAw8Jtng==
X-Received: by 2002:a05:6512:4022:b0:53d:ed70:1a74 with SMTP id 2adb3069b0e04-53ded701abamr1046438e87.34.1732630934648;
        Tue, 26 Nov 2024 06:22:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24811b0sm2054224e87.162.2024.11.26.06.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 06:22:13 -0800 (PST)
Date: Tue, 26 Nov 2024 16:22:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs615: Add gpu and gmu nodes
Message-ID: <b22n5muywlavttjo2iub7uijqbonoeifkqhrqlvfrqadiod3tl@l5mrikdtbyp6>
References: <20241126-qcs615-gpu-dt-v1-0-a87782976dad@quicinc.com>
 <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-qcs615-gpu-dt-v1-2-a87782976dad@quicinc.com>

On Tue, Nov 26, 2024 at 07:36:48PM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Add gpu and gmu nodes for qcs615 chipset.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 

Clocks might need changing to follow the schema changes. Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

