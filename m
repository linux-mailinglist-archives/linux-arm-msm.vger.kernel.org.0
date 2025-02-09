Return-Path: <linux-arm-msm+bounces-47328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05834A2DF21
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 17:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94709164AE3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8191F1E0080;
	Sun,  9 Feb 2025 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lu/dJc34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29AA13B2BB
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118595; cv=none; b=ie879EPDNEt+qiZzcjbp7d0/l8jLOsLO+WxGIVWGeKs0qxq9yuH9pt+DgD6Mxh6EW6ZHBgXpNtbrh+AE+V0vMaOmO/sUUXatcZUMVH2/R/1VF3EMp7GLO/96fMzxiVClh6dLcx2jf0dy16ENlRWgPuNZxjWsq4IY5Ta/GUQbiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118595; c=relaxed/simple;
	bh=DtQdODobD5Mx3g14PsoAutzDTfvkFPnqEOr4yL6UY8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nenBfn6EzSDzl6tGXJ+MG0U5J+1KQebC5CurNjiYD2kIStlpk0Ms2vm3YvT2Y/pVfkTjWbPbV0CugBgZasfS93IR7BGc9nHMu2GAvAUn4nRxotoxuUVFkj25E45JzMDrp/kzihjCwBohS/yAWVvSdZmydRYJ1rNWuzhsjPdZM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lu/dJc34; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3865411e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739118591; x=1739723391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
        b=lu/dJc34nlf+tNhk5b65pDeHJahy0uc6eYaueWXMoF7Q5kmZ/bYqfGVDIiiHrQuUo1
         Sc60EKVpjPpiWjcQ05eIoxno2/iNrERr2GWkY9laSYHFxkcB3wuAV4gTG/CO9kgW/kTc
         d0FI+jpQQw64qcWYtlu5bNjsaI7vyWqtudByuf46RYi89K5tlUJXyX2kXbvjMPSHl40t
         XLIvIANt56AVNDMJfdh4wIk90/oqfsLxzhKsbxKIXrOBSm21ikQZLpwUKg8obFzJm5Bb
         ZjHA1B3AlL8v9d10mu9R2ZIWstsb6zma1pTkkXboeKty6ZzJLjQbfUvgtIxffMsaXHmg
         yV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118591; x=1739723391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBBaxSpqSP+CW1UdUykgwYZL/97FlmN6t4SFUigusvk=;
        b=EQjaRRokm6wDogBPZUT8ATMLGztY/PMBCO1eFUwWe+VjD6rRV25kgjz/SPhHQiJAQd
         9ukbHFSTG+6+cLAq5oXqbPBawhUoB8X2FK8tHINvNCNeMjBRc13ZFj5Wi8Att1maI5LK
         HOfOCI01FJCgzmJA9lgqqizyE+x0v3O+QvL3uxVzZdsPwwB8oKzKwhI/tcKr4yWQcGwC
         /VK3L6v0Ctm7CsL5qpf5MoI1fqw7yUl+muIEAKs1wZmiHVWh16H2K2e030dLWnwI2miu
         WLmv/hyOh6uurigPTLQ3CYxNfAhDTyxptHGDEozlgEgOPE/jsfiEkTyqK0zJqqk5ywkK
         adtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4PqdnJDSkAHDti6ccyp4kFq+Aq7EmnDr9exXeZWwsEPX/wRpk+JnxK6Lm7aAmASN2vdbsZcs5hQgGCb4n@vger.kernel.org
X-Gm-Message-State: AOJu0YzL5Kw5ukoOfa2AX1ZriFfhUlyDg7G/lEYXoFfWeLT1i+v6ogAA
	Nl9YyXHOy6GUznzy8vxr6pCHt086X9ua4He7pg/RZ6At02u0pmhRUkjVZM+JU4g=
X-Gm-Gg: ASbGncupfKPxKzL7132LpdyhFl62KVKhRKK84/lVbQIXWVvJEGPwhpCHsBkbmkO1Fat
	0YtZavdaWlI5XmfVB0Lu7jNBejM6XfnUZCiQIPTHOWIFKKgbFrucjJN5zZ13fs3x/jGvREuseiF
	Ab+rFi2gOJ+IJH7eJz3Wob9lVvzQj2xzb/F6HXa4siMbpzJbvGBiVwPQaj5Jd8GHime5gHUHF4p
	u4W6g3lp70DEhO5YTNlbkeQ+sWQrPjw7jhaYfJNseppg1E+IPhMR9+RBTpWrJgYOHCB0vkzYRfj
	6w6Ru8yP2BC0On6+tuhf3D0WyeMuqjGd14AKkET91VA+wRjjS4RU6B9YmqqB3sZvqe+ghV8=
X-Google-Smtp-Source: AGHT+IFzize2yKjpIdEHEa0CzVZP+PJ8P5Q3H+Z4nzXrwEuHJD8mwDugjc4mCpltXZ8b6WnzCOQMjA==
X-Received: by 2002:a05:6512:12c7:b0:545:d70:93f1 with SMTP id 2adb3069b0e04-5450d709519mr22207e87.11.1739118590771;
        Sun, 09 Feb 2025 08:29:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450a76bc6fsm182100e87.241.2025.02.09.08.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 08:29:49 -0800 (PST)
Date: Sun, 9 Feb 2025 18:29:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
Message-ID: <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>

On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> > From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > 
> > Enable GPU for sa8775p-ride platform and provide path for zap
> > shader.
> > 
> > Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index 0c1b21def4b6..4901163df8f3 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -407,6 +407,14 @@ queue3 {
> >  	};
> >  };
> >  
> > +&gpu {
> > +	status = "okay";
> > +};
> > +
> > +&gpu_zap_shader {
> > +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> > +};
> > +
> >  &i2c11 {
> >  	clock-frequency = <400000>;
> >  	pinctrl-0 = <&qup_i2c11_default>;
> > 
> 
> Bjorn,
> 
> Please ignore this patch for now. This is probably not the right
> platform dtsi file where gpu should be enabled. I am discussing about
> this internally. Will send a revision or a new patch based on the
> conclusion.

Akhil, any updates on this?

-- 
With best wishes
Dmitry

