Return-Path: <linux-arm-msm+bounces-40614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DE9E5E65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 19:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F91818847CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B96229B2B;
	Thu,  5 Dec 2024 18:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJY+dzJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489718D65A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 18:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424397; cv=none; b=e6tQaps2YvLK/cM51qSD+nYfQQDc961ivpXRt4R+igDUwlTJ2+/8uhOS4BkchSMzrbFpVTpf4X0WlG+wFhuIZnwtOYLddfmTCXHWJoPbSxbHFlFwSoN5bLeXaZrsvUJqqbnFBEgRem10uRU2OyN+XzFtr43EFwK5wkTgejxLPDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424397; c=relaxed/simple;
	bh=mw5ya+TZE97IDqdDspznuPRBgrxFlbbocLsF/gQCZ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC8Ow3gjUJBZEncxJZtlidgt605ufiBzn9Kp4ww62Zs7DroT/4vtQXsM5fpJ9FD0vhfEFDoarpdQ/qSSrjTSRgdEA9FAVHYB7LMJEPg4aj2y5+H8L8dvJAzF4LLPKT41I2rNI0Q1F3yGGggCVq5Blv0QqtV60V9lkiS8aWjq97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJY+dzJq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9ec267b879so241535766b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733424394; x=1734029194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RShjWRXyPjsSoi2aNykClHuDCCUJlstTkOCBrSGQj4M=;
        b=zJY+dzJqIxlZRt0Zkt+c9hfMRfQUz2OcijUXtvDc1v7T/rFKQaeMWr1erpbK4G2N0i
         kJh9sgXGim56NlhrM4UOTZnMLkCUsEtSEUz0VyipPMwZSx4Ab2+uTU2573d/blNhhRVz
         PbahSC6WIw8iZ4KFLgSZQdK7j9OjhRoz9bfcFIubDhKpl6v5YvVDBMwoT+ezDyPw22IZ
         o3VK9H5QMWNfaOs8d1tgicqZqoYZJEwO8EgFtI3N0Qu3vx6LVFy2+yf9ijkpc2AhWH+L
         dUySdbycRW8FNvQQpfIm+TXpHBI7y4PJiQ89AjTQMEwspl99DoQ6JhqTgsGgSksYLtib
         eEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733424394; x=1734029194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RShjWRXyPjsSoi2aNykClHuDCCUJlstTkOCBrSGQj4M=;
        b=FnOtVdYHuBdLp2+g73KcNx8/DcIvOFFMUwLAm0AK7TJQaqazIe4MnW6UC0NdKIXWSa
         og5leBdBdI5qqSvMeSNKzv0fqdmmXcIjyrM10fyqTdQgMaxxQKvwV6pur4jmriiMdzkY
         GxTd57xoODMqNeZsKI7IjVDcXIbmEARAGNQWhX3Tp2jjp9uGNH+TzsL/npY/7VcRx6Bc
         9WuYHM0CEhyiR7qjFqXzDdKA9BTM+WRS2HKVHdhzH1oE3toUEMqTRE5Fm6L2vIrMelK4
         CB40E8Clo3PclV/pZ89Pp6ayKq5m0kdiy27JPRJTAAEXE1cSCgJd9vycuYDlwh1cyzM8
         dsZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYr2wDhT3KBO/I9Ht3hechI23zJaE7U08AU+rS7VqfYZ235cdZdn9CyiiT3eMVdOcmX3HtqVMPCFcXYjql@vger.kernel.org
X-Gm-Message-State: AOJu0YwszLuA1uLlR6EQYgJ5rX20MAN9Y8ipGc7UgZxeyB3RJNE9m3Sp
	UUBVZ6HssK8ky1CZHY2XlHAx5ipjFxTlOX1MzKwpqdmAUK0XeOvxvfevaTzAnLk=
X-Gm-Gg: ASbGnctOjnzjMIlT7mph4x3vyTPpmT9CbcNziBr5ltHcyDzRv6gZbuNqIDxdiaEptC1
	jxtA6f812ad1ZlEcM2/9tyxR+ZZ3HvxgLZO2duixvs5EaTmMoiyiswrpW+/xeNMwRmdezUZbHsM
	NPjhyi7ebcZy4RopCR9hH3rV9feFxgnEX1yndcRSYbF342fMoI9kVXYdP//ktn2tcbhToMGol5F
	BtI0Pfgw5LyA9lSCgfToh/NUi8dgXpW6HTN4N1K+gsTIogbtKLr1msV7wvW/Q==
X-Google-Smtp-Source: AGHT+IGzd6heZAKAAVHxaXzPf9aJkBu34bgp4dHC6NXemZyJuMbEgT5dP0Jie6o8Plmw+n7+8oGQ7w==
X-Received: by 2002:a17:906:1da9:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-aa5f7f244demr1043101266b.39.1733424393656;
        Thu, 05 Dec 2024 10:46:33 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef80:4344:b4ab:9e07:6514])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608c8eesm126014666b.140.2024.12.05.10.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:46:33 -0800 (PST)
Date: Thu, 5 Dec 2024 19:46:28 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
Message-ID: <Z1H1BHAeO-0832Ea@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>

On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
> On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
> > On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
> >> On 03/12/2024 18:44, Stephan Gerhold wrote:
> >>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> >>>
> >>>  - "MIC BIASn" enables an internal regulator to generate the output
> >>>    with a configurable voltage (qcom,micbiasN-microvolt).
> >>>
> >>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
> >>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
> >>>    This is intended for low-power VA (voice activation) use cases.
> >>>
> >>> The audio-routing setup for the X1E80100 CRD currently specifies both
> >>> as power supplies for the DMICs, but only one of them can be active
> >>> at the same time. In practice, only the internal regulator is used
> >>> with the current setup because the driver prefers it over pull-up mode.
> >>>
> >>> Make this more clear by dropping the redundant routes to the pull-up
> >>> "VA MIC BIASn" supply. There is no functional difference except that we
> >>> skip briefly switching to pull-up mode when shutting down the microphone.
> >>>
> >>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
> >>
> >> If there is no functional difference and this is just redundant, then
> >> there is nothing to fix, so drop the tag. But the point is that users
> >> might want the low-power VA. You claim they don't want... sure, I am
> >> fine with that but there is nothing to fix in such case.
> >>
> > 
> > The fix here is that two mutually exclusive power supplies for the DMIC
> > are specified in the device tree. You can only have one of them active
> > at the same time. The Linux driver handles that gracefully, but the
> > device tree is still wrong and IMO deserves a fixes tag.
> > 
> > The functional difference is that we skip briefly switching to pull-up
> > mode when shutting down the microphone. Users won't notice that, but
> > it's not the intended behavior.
> > 
> > I don't claim that users don't want to switch to the low-power pull-up
> > mode (VA MIC BIASn). However, we would need a different mechanism to
> > give them the option to switch at runtime. "audio-routing" just
> > specifies static routes, so the current description does not allow
> > switching between the two modes either.
> 
> Is there no existing mechanism to alter this at runtime?
> 

I don't think so... Since it's currently exposed as two separate DAPM
supplies (instead of a mux or similar) you can only choose between one
of them in the static routes specified by "audio-routing" in the DT.

I tried looking at how downstream handles this, but this left me even
more confused than I was before. :-) On CRD we currently have the
following routes in DT:

	"VA DMIC0", "MIC BIAS3",
	"VA DMIC1", "MIC BIAS3",
	"VA DMIC2", "MIC BIAS1",
	"VA DMIC3", "MIC BIAS1",
	"VA DMIC0", "VA MIC BIAS3",
	"VA DMIC1", "VA MIC BIAS3",
	"VA DMIC2", "VA MIC BIAS1",
	"VA DMIC3", "VA MIC BIAS1",

MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
But if you look at e.g. SM8550 downstream they have:

	"TX DMIC0", "MIC BIAS3",
	"TX DMIC1", "MIC BIAS3",
	"TX DMIC2", "MIC BIAS1",
	"TX DMIC3", "MIC BIAS1",
	"VA DMIC0", "VA MIC BIAS3",
	"VA DMIC1", "VA MIC BIAS3",
	"VA DMIC2", "VA MIC BIAS1",
	"VA DMIC3", "VA MIC BIAS1";

Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
TX macro DMIC, and the low-power one for the VA macro DMIC. That would
be fine.

Now the question is: If we can use the DMIC through both the TX and the
VA macro, and we're not doing voice activation, why are we using the VA
macro in the first place?

@Srini: Do you remember why?

Thanks,
Stephan

