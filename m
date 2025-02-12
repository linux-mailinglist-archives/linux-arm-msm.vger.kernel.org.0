Return-Path: <linux-arm-msm+bounces-47661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED8A31A18
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85ACB3A3759
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F0520459F;
	Wed, 12 Feb 2025 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vx9igdcK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16115210F65
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318416; cv=none; b=YqKDPdOoSQ1Aet7mFEbDxVXBpzY6/J4MSeMRbTCxzzkY0Lcr4sPYHHByxQ8hiT6s1hzQwnRNZHtfR/vsiYcfhXa/L1N/5xEj8TweSP3bFtLpD1oTJlys5DDIeZFRchEsC44rkRRRoIOxUFsziVUtCHzsBOLzFzmKy6lfxrifIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318416; c=relaxed/simple;
	bh=sMG/IApRfPR8ZSL4CUKV7cJ8QKGC6AJC501nGxT0gJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMVtOyTyx5/z3Ek5JAXuzuhS+oFFeTRO1BDkOKHheP9e9zvWPtJtuEMQD5YV8LNiRwJJCaAZUecC6EvIjpi2nCl2BQqExOoYfb7UDhSVSl5mWHINxerrS+KkcbxuLCbIok/4DSw6hYtbXHiQuM0pNZqxBKsOhaRx33x4+pqPg8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vx9igdcK; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-308ef06b4e1so24297191fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739318412; x=1739923212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXlqploCpAbDafi9IQYW0m2Rs5Rua9IHjaJCRpBcJDI=;
        b=vx9igdcKGgE+gtqKHhX8BvqI0xPLKF6SMj3I4piamZrqduTKwdLLvZVKQDDOFCdMbl
         /qQv55Ke3JyfJ0+tm+KWXnJQBugdTouyBv+04zp7Ap7XfZlI3FEbV1nII/GQV6SirRHn
         jFV+TD3Y48/tyPM47NLT0qNV4lGf7o8ZT3fbwU6AccCCcrtR5s3p28NxzQkqwajT3p1x
         zLSoMHs8Mwg+ajI4/gpfgFhBmemFLQJ5k2zW07948ik0DSB01dKbgtf0WoRivw7jyWHX
         V+bCT1HvBVsUWr6UUENbk8sbaXYT5Uxl/fH/sRsSUNLAW0FYU5zoaACKcjhxQ64uMn3H
         KGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318412; x=1739923212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXlqploCpAbDafi9IQYW0m2Rs5Rua9IHjaJCRpBcJDI=;
        b=C+eJMg8ByVbx1XDgADXgdcAyVWM6yNEzA1Axk+Sx1M8mIdTxflEZr69UqZLbSo0oK0
         mEOZW+NsyfecFWf76oKEin6x26a6J4BFC/FnWNlMW2w3o4QooPjWNArq9/InNzpt1yIt
         DzKnQ7CLbrMBShePIWH7mgd2zczEctkO8CSd6b1U4Tbj8p/PxYAjQzuhZ7MzNgN5oHB4
         X3qCmBiXUqyI1wedbavUguRLW8NqYjbSNqh8SSlEpTRssQFsNuHeGg6312sQIJA5r2v9
         +K1BV9bEY0VZT5XRg24anxLTOqEvSU4Nvn1PILpQhu6+eXcP6Fm9ZrQ+SB9VMLSwLbmv
         6duQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaXBKBorJgNnZouBsi6sJ2l/yjX4WYF9e6CB0vrnFFz8+t7GXqv5FstzlhZZDz5UpEM1ir6TB1y+Ppt98B@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7OqoABAyHA7UtJD3mtlVrtObyO9Y3OkQQ0RuY03PMC1gp41ax
	yz51pYligGMMz6b9nxb9cGBvIl5uw0bJxcgFKSsrT/KRpEELCLgzgW9EoHm/DU4=
X-Gm-Gg: ASbGncuucyomD7AOHa0cmkVFoddyR3h6txs4Oyy4vX/MjZsMS8c8q9cmONk9Dzlwu88
	N4NLiehq6tpkFF8tbMx0HPBMOvuAnK7O9aJfIHg4n4+61NT/w/Nm+cBXbW8qRBquHyCOAKLeeWz
	3u0CHuQv0bI3ALE0BJcOzU2eKyzB/0+hvDXgbXcWgGxtvlNXSO1ya+X/F0VXSLhKM1OOeQh92/s
	Gr7RtvY/FWmeDR+qdY/YX4eoA0bx/jP4eLKP0lFi0gkKtSaQuMcT2VKQDQ6g8JFInll7gs+ztf/
	O88i5QWIH2pvkw09pvxdMWiiZ94wXXTvN6DPioIRbMT/qBbigR4PCbkdqTQ0SpIyie8YuJ8=
X-Google-Smtp-Source: AGHT+IEtKS1j1XfkAmAx1DUeN3l7Ubdcq3ACfdQx+1tcVmJ21pVK1Fh04wiPd89wQLtVZljJuTb9ew==
X-Received: by 2002:a05:651c:19a3:b0:308:fac7:9cc3 with SMTP id 38308e7fff4ca-30903651950mr6337401fa.14.1739318412131;
        Tue, 11 Feb 2025 16:00:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308e2748fcdsm11095061fa.15.2025.02.11.16.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:00:10 -0800 (PST)
Date: Wed, 12 Feb 2025 02:00:08 +0200
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
Message-ID: <iymxe2hmjobctdimupp656xeyhctwd4yswbp2wobaneuzgxedu@cyhjb5ibkqmj>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
 <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>

On Tue, Feb 11, 2025 at 06:41:39PM +0530, Akhil P Oommen wrote:
> On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
> >> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
> >>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>>
> >>> Enable GPU for sa8775p-ride platform and provide path for zap
> >>> shader.
> >>>
> >>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> >>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
> >>>  1 file changed, 8 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> index 0c1b21def4b6..4901163df8f3 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> >>> @@ -407,6 +407,14 @@ queue3 {
> >>>  	};
> >>>  };
> >>>  
> >>> +&gpu {
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&gpu_zap_shader {
> >>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
> >>> +};
> >>> +
> >>>  &i2c11 {
> >>>  	clock-frequency = <400000>;
> >>>  	pinctrl-0 = <&qup_i2c11_default>;
> >>>
> >>
> >> Bjorn,
> >>
> >> Please ignore this patch for now. This is probably not the right
> >> platform dtsi file where gpu should be enabled. I am discussing about
> >> this internally. Will send a revision or a new patch based on the
> >> conclusion.
> > 
> > Akhil, any updates on this?
> > 
> 
> I am still waiting for the discussion about QCS9075 board dts files [1]
> to conclude.
> 
> [1]
> https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/

Why? We currently have several boards supported. We can enable GPU on
those as your patches are pretty fine. Then we can land Wasim's patches.
Not to mention that the discussion seems to be dead, last message was
sent almost a month ago.

-- 
With best wishes
Dmitry

