Return-Path: <linux-arm-msm+bounces-50602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3FA56052
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD6DE1897A6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 05:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39EE199FC1;
	Fri,  7 Mar 2025 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWxqQWM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE181946A1
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 05:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741326545; cv=none; b=lVqSnoHboM5aERikjpXrKDDiCgb9q/WAgM4kzRWl8CiEJUm5JDlTp80AJw2oQe7s2vMM0qmk7xW0s113gEqvWpn1Zg3ON6Y4r+bPZF3XuMCyXWZABwrbPppCJmBQ56wqVnJO0LDoLtb2WzI8HIHxhS8SLgYi2jPkhBTcyaFRcJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741326545; c=relaxed/simple;
	bh=cqj6ewJym1miHgUZm8iH3RiovqQFuy/3bRNULbbMasU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUBhq4ev0uP2Ga91nlk1WxgTtkNolbZruP7vqO3pZfkP19Sx+YW9TdA7gL80yERGh4cArpJ2YSh+zXJCxW7u87gAyiV1fb1DKN9QOBAmhD9f9RDRPaqUwxgoQjyQUH4UqgdtSIJJo9n3BMjY8uIxktX1qu0hTxfQDjCAeO7pYbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWxqQWM6; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-307bc125e2eso15572651fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 21:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741326542; x=1741931342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
        b=NWxqQWM6YG8OVHHmKHX7IVQHC7xeBlj51ltje4EYuxLu5RzF5furpRRIWYpbCzeOmg
         9x41xRCNLY30pvK05qs9XuhqdtgWukdb8uVR6zdYPz/Il3R4zzSzzypLiIiE5zKNUxRS
         j1SyRkoExLEblfB/2WHoQe8o8b8sBmYJcy2UCdXULTEOKYLewZOqV1piigT7VrDVXZ51
         JaYJ+BnCSdhwabeuinA8y/JV0VDr1Own2VmF6/eowK9w01JxgIvffOwraixjsuE4Yx0E
         mWsfrXDscjYYvkxZsnyR9q8GE3WuNyLCxxhaI9cOmmxUF707shkEVDtbKpJUhrnevUEK
         CR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741326542; x=1741931342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddZoIefzqan5unLa1d6QbkepNMobkeXSFMsHFbEyBPg=;
        b=c94DA9jn6X/VCKsxuOVwUpwXNsiqM72G4TWhsA24QT4c6MAbGglDPJYsBOs1EuzZ5B
         pBl8Of8uFAYczrEVcgsaTuY6Wswn0Be+4i+3aS5lc4Z1ETqaftwbNJMdPhmSj2Lu7Xsq
         VKFdemhSa/XixA/7xyodq7qfhf9oWTzwBk/7ORpBehHogtchNucq/o826E0eZ7peg30A
         EwNKRbgjaKC0CiibkHBwZOJj+azDWgp4cIJ31iYv0+lO/L/fHmsGyoW3HRchfVwzeI7j
         M9PIhggWi5yydqVznziKE6sv9L2rVlthmp13sGQ0XKYYpkFkADC+YivIT1t44pW0KFsn
         zcPA==
X-Forwarded-Encrypted: i=1; AJvYcCXWr0ONWOaj0OcJ1tqXFZw56to1QkxAbsThVJISIk8R41uVHUJ5Dk5cQcbJxoxWIW/OUP+Vek2TVZt1dAEE@vger.kernel.org
X-Gm-Message-State: AOJu0YwROgKEtTpl8Nm3EBXQJPtii/i/4nmS17cHOVFJYticsLLQCnZb
	/RTOKMR3VqTHQuKG9Botr8ifK2fXDvcnUVGWD7NpXDO7ODX+ZQMDr39ALbSB5sY=
X-Gm-Gg: ASbGncvri2JRjBhSYdIBM0cFSSm/yAtIJ1D7Xld5YXFCytRSVL10++WV3+mgnVu8liE
	Phr295PO4X0+VW1dl+fv0JkPP3rL0/7gcyvYDHncgDRpbl5SdbkwwshQfVyZjNCwd5tlmJV7AiC
	BVhhwaCBxrfOZDChmlMKmaKEfhYmPjPf/xVUK3vyEZvL0onBYzCg0HV3/YqNweC86Jfdn6zV9HI
	b4IrGyQHIq2aBDWE4TuHDyV6E1rqwVtdCanizk45ov/NGrbpkk7dREkbqKVY/MmNrbZQLrlWCdR
	e57c5mFfIC7pZM5fxsg/i0ecqhCyMfspJRtB6V5YpJB8DqQM7EcTlc7g1VacQxeB0fJ64v+p/JS
	SNCrYWgi2BcKRDqiVcQv/Pt6p
X-Google-Smtp-Source: AGHT+IEQXgwPTN0zWE14o/eWd+esiKQ+JOKkgZz1V9e0jKN/Xjh/s0kS262qvqbdXkWzD17f+19+eQ==
X-Received: by 2002:a2e:b88b:0:b0:30b:cceb:1e9a with SMTP id 38308e7fff4ca-30bf451104amr5734371fa.14.1741326541966;
        Thu, 06 Mar 2025 21:49:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be98ec3f5sm4209511fa.28.2025.03.06.21.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 21:49:00 -0800 (PST)
Date: Fri, 7 Mar 2025 07:48:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Robert Foss <rfoss@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Christian Marangi <ansuelsmth@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8180x: Rename AOSS_QMP to
 power-management
Message-ID: <6fqpulpczqnzabdnpckd2rtrcdhxryydhkuou7vdhmsftquckt@wzuoxvhyep5d>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-8-0c84aceb0ef9@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 07:11:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node is currently named power-controller, which requires the device
> underneath is a power domain provider. Rename it to align with other
> SoCs and resolve this sort of warnings:
> 
> power-controller@c310000: '#power-domain-cells' is a required property
> 
> Fixes: 8575f197b077 ("arm64: dts: qcom: Introduce the SC8180x platform")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

