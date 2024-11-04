Return-Path: <linux-arm-msm+bounces-36909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E20789BB1F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64FE7B23333
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8316C1D1E75;
	Mon,  4 Nov 2024 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZ3kVd6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734311D1748
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717576; cv=none; b=WtQGQDCIFG6XUiFmMVaHy/iCAkol498mRLygXki/keSMunypRyWK8jujQkKA/maC7DOF/hVm3W38Ni1fBz9KUvmUvClnPOUAqqqBx/Aa5X5qqtlIRj/AFA+03AD2u0FcDZbNf1JWZEOLT9k7NsmvRD05FZDt0LEVx9picMS/0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717576; c=relaxed/simple;
	bh=vKAr9hmyTddgF/WSN6iuJQ5BAfSJsnCK8GkT+tZfH0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLEz29UQrE4EViHqGe70LkgQ2DJQc76Dbj9/ibovkTPG+BndMUu4g7fhC05nrg7PFiIaetT/2P5+2KsJeiNhq6DpoJw4hkv7imAg+S8dJI9SbRTWt4cNXn6lzy1gnejms72WMTHT2rd0oNlImf/iWzoijbDx0xk5bT+s0EpIggo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZ3kVd6p; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb5111747cso37262391fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717572; x=1731322372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwsIeL6KJEG07y8wl1qOjDdqNT8K9HlcyWy1sRLVSGg=;
        b=NZ3kVd6pxU81ohNXiM8TrKnboqB8NS57DV+9kCuy0DO4k9utYuKLdpYLg4msHmqaPt
         9nHOsl3dRq5USjDtg1D4xLj4Jz9aFQxWt+hirM8E9F8n4ctyHzO5oInE5mP8inKNnJrd
         13efpAvjHN4ogaIgx75MwlSCMlZwN88pzXLDaXrnInenZiJOZtuR2Ep0E9wDyaSXHd/u
         YF5CxZrWjFJxGqjcYeux2oQ1okdqycVc5jiXqAkvhYi2kx/Ye5QJYC3cH+fwhC1aEIC2
         0AXpRancvluAdNGj0SPDF9+kV4svQ53B4GiQdl66c+CfW3CWTJxwsLZBRJkvU6om/ZJj
         DFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717572; x=1731322372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwsIeL6KJEG07y8wl1qOjDdqNT8K9HlcyWy1sRLVSGg=;
        b=TDjlOM5pv/EBX+1tYgEFWBOqSZUqy0X1AJ0xkFSVkCxo54Am6cPdsRXkSNqswngWYT
         jhBFQRKMVjIAKhKhgKpVaIJZTcd7/bLKdm5cvdyrc/eNOwpIFe1aMU7ydOGOxZKoIuJs
         bBGBEkY2tHDkAukvq1Ca5yqwktGUH4wNpTY+pP367Az78ACo13nzjobMxLeouP1UCJd8
         iLXNIFwzLNyuSMe1Smk5YYaqp58hNk+IVuTBAVhmSsuts2U75pv/NC4GelN6cXGu1TGz
         wMYXSSxYzHfdAI6VoRbxhtO5xd0PIFwkS8KoUtHtGXoxuRn1jXaMa0ciyTNsW0dztmay
         haXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhfAgLa41jcL8nW3XoINBZCAg1daBHLGOGlFtRIAZZg/0WcgEfoZDSgaZnWIq42VQTvu7pvHT6yfiLyaIL@vger.kernel.org
X-Gm-Message-State: AOJu0YwHASx+/YaFvt6TylxIAi09NrAGt60HXgzuGyqS/uKBGEjBZiej
	TopqH/nnU4y8yeH2FJFWSwTo1EleWaNFQl6+cUFWMi22t2JD+pjh6PZ8RBpuW1w=
X-Google-Smtp-Source: AGHT+IGA/AaC//7xRg1rvQ3Pdaj8tMAcvK/iweU+LcWcYnfbkwdRORCk/zzuaDqXc0ND2sX86ZzRlg==
X-Received: by 2002:a2e:1319:0:b0:2fb:4f0c:e3d8 with SMTP id 38308e7fff4ca-2fdec88b40amr51037091fa.27.1730717572530;
        Mon, 04 Nov 2024 02:52:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a62c0sm16317631fa.75.2024.11.04.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:52:51 -0800 (PST)
Date: Mon, 4 Nov 2024 12:52:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Melody Olvera <quic_molvera@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and
 ADSP
Message-ID: <kxpokionrgollof5yptnqnxgsi4v3g24iwdb67mznljzjzpxab@dnts7qgvu4vo>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
 <20241101-sm8750-audio-v1-1-730aec176459@linaro.org>
 <0782c956-361b-4109-a8a1-58b8ad396e0b@quicinc.com>
 <649f43d5-2d75-45eb-b13c-31fe88d99c8f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <649f43d5-2d75-45eb-b13c-31fe88d99c8f@linaro.org>

On Mon, Nov 04, 2024 at 09:36:46AM +0100, Krzysztof Kozlowski wrote:
> On 01/11/2024 19:14, Melody Olvera wrote:
> > 
> > 
> > On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
> >> Add nodes for IPCC mailbox, SMP2P for ADSP, AOSS and the ADSP remoteproc
> >> PAS loader (compatible with SM8550).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 140 +++++++++++++++++++++++++++++++++++
> >>   1 file changed, 140 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> index 98ab82caa007ee63c395a3ce0f517e2bbeb0aecb..eb826b154dcb2d8165426ba2225548efd7547da8 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > [...]
> >>   
> >> @@ -538,6 +566,17 @@ gcc: clock-controller@100000 {
> >>   			#power-domain-cells = <1>;
> >>   		};
> >>   
> >> +		ipcc: mailbox@406000 {
> >> +			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
> >> +			reg = <0 0x00406000 0 0x1000>;
> > 
> > nit: unsure, but should thse be 0x0?
> 
> No, all recent upstream DTSI files nodes use simplified 0, because it is
> shorter. Maybe except few cases, but then these could be corrected instead.

I think most of the files (including x1e80100.dtsi) use a mixture of 0x0
and 0 here. I have been told several times to use 0x0 all the time.

-- 
With best wishes
Dmitry

