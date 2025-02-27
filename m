Return-Path: <linux-arm-msm+bounces-49614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F42A47479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DA6A188C209
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6550517A5A4;
	Thu, 27 Feb 2025 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltyeMc7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9057842065
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630733; cv=none; b=bwfgrnMY4ejw7hpZ4zKTUILZuCRR2lrG1aJ1hQCrsxwH8/TlnL1DCo5BU9MuimPmV/o+9ZTi3eSSyJQQsJYfpTsTE62kYYqpnV9HA5LmgQkJmjjcF7csIy3foyEa/cWaInuVAJyji/oEZ8kwMJyfQAm9vJopKVVckP7C11wWul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630733; c=relaxed/simple;
	bh=YfV4BiA4SU0zInqqJL/OjxsR9HNALC7jGnJwCPLDFF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lkdpnhEw25tHjyfhHItTHWQAULILgeZ5fUUHoPbwsURU+1vVSsmrZoTBEDZ+KJkTZLaYTbsAA+L6+Tw/i54b7+SoFW+8cx4Zt9dk7wksyQeSNY+FxcjbvPiTcZehd+yjuBXXylj9/U04DHQY+LAUmZRQg0enGR+2sLYedrJ3haM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltyeMc7A; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30b83290d39so4625911fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630730; x=1741235530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYkWT0rFcOGrEHleNW1VP59D6K495I1dl8pYg+JsebY=;
        b=ltyeMc7A8cRz5KiSbRzrchNDGaTrtFvs2DsZlRupM6ksETx1NkclBryT2FyS3kXQij
         vlklcHh6WjFT38+UDdmYybI9EkL4U7oQbC0Smchv4fFGFD/ySPhp6ofcmkolwiTGPtsW
         zAklejywW02feHfng+300CXFaN9zc1yCFFsTOn0yGdTqDsN36+cOuRENmVl9RmlmoSXF
         T8+RKZzh8LI/jr81KpQhEh0jfNDMqihO0YAK8BW4XYlsTTViu+yGcW+bdphICztDPdBf
         1kOE0uFdy8mIe0e3/yThkPN3PGMRi9owUSnZsNzxGHKYX4ffyiInbod20wEWoBNoX4Jx
         qVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630730; x=1741235530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYkWT0rFcOGrEHleNW1VP59D6K495I1dl8pYg+JsebY=;
        b=L471Tvn49bGAWuTdUvwX9dfln7sGKPqEdyHxFt9GGZJ/S6ce4YnRfo+CqTMal1L/Vq
         hl2himBkSlt9/Xbzv+EVDU/0i413dhO/7Z1ZMuM2rkRiYb3u7yqYdV45PTNuOQVU9p1t
         RwAbLuKsswPVsaQEB8YGkPUCUhgxJ6/iTVhpzvS+mlNnMRjSk/c4Nk+aPfI8a7xIGgOR
         bUgSm3d3FoTeobaAARelRiCC/HfOQfVMkgoZ56HdNcm868spcXyjPpE978hlgVMOw4TS
         w/JoT3XMdrM5mYObmSH4SwwColHWr4/fd/umjPeBbMpRO0sVCu30Y8DumRSi1vyN/hdR
         D0Yw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Lo7d56bDXRoi3cgnrUFiasdQEo3HQvUVJs5SGQIZ/utC011QQUiOy8YFjRHgmFLYPAu1TPPwL5IblCeP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6g/0251ZplycDR0X9rOBTuioyeEuLVKqqbu5vYIZs0VwVFBBh
	AeO3cmN/KURv9I3EXyt3HJP8S+Kykmb0S7ZtdfjXHJ5B4xhoP3b8nuissGRj81+gPxkg2Gv+cu4
	68hAGCQ==
X-Gm-Gg: ASbGncsHEAcbWZQQCzhj72PFO+h76G059SiMMbhMpjPQUkuC3qugroeCRvbsCd9ZBGD
	wS1Tev2FcOrSXZ28zCCj5qk0RXIuV2o/pWHPz4YT4Lcw+5bHliCpLdSKOxNCDKsLRP8ay8Y6SKU
	MJ7YG9c/2c5wCDWgQ5oowbTA2Po+530+qtSFGoPY/6q0eJ3tRA7/3rTFsbeuK27+NclbPPvu0B7
	Wlze741mQokWVK5ckKjCOajHlpDYqn7pLhwqYVJI/jmjKTI74a3O1FONtdkrhlnr3nbyVh7PXlR
	XPikWQqJiWqd/nQhz9jctdwXHwF2/cgfY4+iQGHvWERaGa8wjGEqQO+PCc25OVUAzJefz90vPel
	WbW8i8w==
X-Google-Smtp-Source: AGHT+IGu8Gn8w7sBp1oaXjlnkPsoH4b8PCFLUA4nbhoKRrP0ufGqMjd5q/HZTx/sI0BrTKxk7c7PMg==
X-Received: by 2002:a05:6512:3f0d:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-54838edd85fmr11347097e87.7.1740630729683;
        Wed, 26 Feb 2025 20:32:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd03dsm62596e87.244.2025.02.26.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:32:08 -0800 (PST)
Date: Thu, 27 Feb 2025 06:32:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Message-ID: <xwatlvi3xwu6q6difsd53ymh6htzebmcbyiq67mvworye6epq5@ash232dggqia>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
 <72cc2c52-1d0d-4a60-93da-14acd5947f1f@quicinc.com>
 <o53nnmt5ypuoms3b37lehtmpwloudusr7647alehvnwsiltsyo@grd6ua7mh4o2>
 <0ab2552a-3b8d-4b4f-8f9e-8b0c4f5bf6ea@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab2552a-3b8d-4b4f-8f9e-8b0c4f5bf6ea@quicinc.com>

On Thu, Feb 27, 2025 at 09:56:27AM +0530, Taniya Das wrote:
> 
> 
> On 2/27/2025 9:50 AM, Dmitry Baryshkov wrote:
> > On Thu, Feb 27, 2025 at 09:42:39AM +0530, Taniya Das wrote:
> >>
> >>
> >> On 2/26/2025 10:12 AM, Bjorn Andersson wrote:
> >>> On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
> >>>> Certain clocks are not accessible on QCM6490-IDP board,
> >>>> thus mark them as protected.
> >>>>
> >>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>> ---
> >>>> Mark few clocks as protected on IDP of QCM6490.
> >>>>
> >>>> This patchset is separated out from the series[1] to remove dependency from
> >>>> the LPASS reset.
> >>>> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++
> >>>
> >>> I merged the patch adding this board in November 2023, are you saying
> >>> that for the last 15 months no one has actually booted it!?
> >>>
> >>
> >> I am not sure, I had got request to help boot the board which was not
> >> due to these clocks.
> > 
> > So, was the original submission in November 2023 broken or was it broken
> > by a later firmware upgrade which started to protect those clocks?
> > 
> That's a fair question, probably the later broke it.

Could you please document it this way? This would have removed possible
questions by Bjorn.

-- 
With best wishes
Dmitry

