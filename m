Return-Path: <linux-arm-msm+bounces-47662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C95A31A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:01:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E37361887BD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA4310E0;
	Wed, 12 Feb 2025 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ezePk9VH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB2A31
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318475; cv=none; b=CYNcMchuQKALpmmhQ/iWoezqjmQTcroIgZi6gduiA4taPTMeL+PCm2Pb5P5xXs7nliDybel/TyPJzDGiy5YjpimrAlqzZAhw15pN8w+KY3mz5DLQKSFWD0HzZ1yNEQ4QE7SLsPpbA8rKnBqtRQ9UvRNAb2hp8LL+v5MZV/84WUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318475; c=relaxed/simple;
	bh=sfiqhyC5KXkrQ7bt1jRVA16NcrjK/IIwrOgJPjQeFYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwLyc1bK0w3op/bKSzXfh411qBMLto1jaE2aIyNNPUm8LIuJCJboRsuJJPrYAIqCkqSS/WVk9dON4nDg0hCXyxrid8tJdiZ0pgegNJugR34TiUJM+uLxxNRyiIPG3muB05WwsmHDRpZVmGcOeVMgxfWsbvNFcb3DeCRfpv1QjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ezePk9VH; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308dfea77e4so3036171fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739318472; x=1739923272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=95tLd2a65K3uyAvTy76sH7lTP+WAFAT2AWBj4Cp36Os=;
        b=ezePk9VHq8LpqZ6MY/4cPEr1y834J4pYPPrudlONA8uOcHwuEbVSPbU5bVLmX5yr2n
         irPNvogQjdlVdhO4+KcC2pRAfe/eiGh5chAuIjq9kmArMfcmjE4pkdDluZB2Tku526LS
         +eZzMMaTBpT0LM/MfnnWu0bnuXepNDLs94/ffc5vOIyARoriJq1xxhRu2TKusBg6Yjfv
         QPh9fLbtoyKsC8sFFPHb1+JVqP9HMT27O9FtZrmkoxzPNeDMlxmQJnJPh3hm49tkxKSV
         nqbvxpHN4RfP85pCFKU2aCngarg1XW8FlMaQUEfg+z/6ZpOMKeWgfhZCAJUubSkS0uup
         MUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739318472; x=1739923272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95tLd2a65K3uyAvTy76sH7lTP+WAFAT2AWBj4Cp36Os=;
        b=m81cMAVeDUcpQhSbqqO7Kdno0dKzDGtZ+sxAPmjweMe31ObenW9WFZ5l12+cR7w9R9
         RIicidqr/Ws1h/av2ZYjyeT5Tnyu1FSuW5JAdPg+LWPnHL8CFAsn7lEaNlbGM8cshcxz
         2dZtnnP9PAMeEHj/mvdtnQJh/cXjLg9j3yD13YO5u0jPQu/R/RDh3GFHm51Th9EeFeUK
         llxMiraMmhBSazSsFqJ7MhxK/UZF8eG0WxKWUXMh3o9pznQeYIAUu/AVfjfSPym4BH3C
         edxk4t0DFCAIYs91x2X4GFbYnVDb58g82W4Tn5E1rUP9P4d+i5C6EzhRmuoaoYFAbqcJ
         lk2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTit1dfrL26yhMpTJ/w6yBlAiXVAzFZjWqQABQSD+KiitBJ8DWb4MnGdBbmHwNZc0mzffdMhDjH59cYEuM@vger.kernel.org
X-Gm-Message-State: AOJu0YwxfCWgN9wMYd+J22KW/oTzb3klVU32ils5DQSyR5Mdt23Wo1CU
	B+6j6/Z2vLqTSRDtm67IsMT4cLArFuGh6kmKh83OdhXunLL2cavuuRVoAYTfKkk=
X-Gm-Gg: ASbGncvIMpAP+TW3dVKW8wFoLF5llKABS28ZG4BDAz4EtIL8L1x10NwIniolOwlqByD
	CG95LJjIBSIVpPTqnUMuxOI51kaghd014zOoR0o/e+RWnhH3mv8zzUyysKOx9zpHquX4P7/HRIa
	g2FmNrw28YaoT3JOWZt0+eZlyWvuf869k3xCzV0syymepdgig1pzqYZVXr044cXgfEMZGdLXz5M
	q6FeDrjphUU1NhpX4OG2hNqhD1j0nh/ZeNwAAGmiCnMoMwgYuq88UrbrUlqWPYKrc1pvvIeQy9O
	k02HMiaTMAk/QriB32lcQ/f5mNHEOIdT2ALo3MJRq7wBd/gJ7ZMlm4ZG871gHChKh8aEvH8=
X-Google-Smtp-Source: AGHT+IH/ZusE/nmTKQwFY64ppd0MMt5jL1ccy9acwns9FM9u2M/3kJwIx3fnSmtuKJScor3EBvhJ1g==
X-Received: by 2002:a2e:965a:0:b0:308:eb31:df9c with SMTP id 38308e7fff4ca-308f90eb27fmr16259151fa.1.1739318472098;
        Tue, 11 Feb 2025 16:01:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ed7e8621sm8024891fa.87.2025.02.11.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:01:10 -0800 (PST)
Date: Wed, 12 Feb 2025 02:01:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <ysk2lewb6qjhmrznt7xc7i3u7kczqliph2dzfg566aoj5cowks@qlbyk6nqakp4>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
 <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>

On Tue, Feb 11, 2025 at 10:07:07AM +0100, Neil Armstrong wrote:
> On 10/02/2025 17:32, Konrad Dybcio wrote:
> > On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> > > The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> > > add the missing cpu-cfg path to fix the dtbs check error.
> > > 
> > > Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
> > >   			power-domains = <&dispcc MDSS_GDSC>;
> > > -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
> > > -			interconnect-names = "mdp0-mem";
> > > +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
> > 
> > QCOM_ICC_TAG_ALWAYS
> > 
> > > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> > 
> > QCOM_ICC_TAG_ACTIVE_ONLY
> > 
> > w that
> 
> So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/
> 
> I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

It works, it's just that the backporter would need to be slightly more
careful.

> 
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry

