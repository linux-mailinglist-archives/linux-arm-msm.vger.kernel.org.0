Return-Path: <linux-arm-msm+bounces-70445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350DFB32087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 18:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4F416E0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 16:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50142877C8;
	Fri, 22 Aug 2025 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z52u08De"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823828750A
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 16:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879988; cv=none; b=WrOgxcY7WMCa0/YBVWQLh8Spp4Ne28SXzCTaNHDJvJauSbWBT4zmF7/1Kry6Wbs45VV3UQ+3bKHiJJwXrMFbpOAy9fi1e6xO5D3TGGYl08JUq05yUagRY3FkOwFr35brIJDbLDEIWdz1iJzXBESuqpkCbfAExRdcxEEFVKRrKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879988; c=relaxed/simple;
	bh=mxyLcgsxU4cWWi9F7ul8/tsDTeLFy4cOZvkdp5AASzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2ZH5PrYLh3R7RLnKfwKCqXvZ+STAmfaClU0kE5fP/GcBubZOmkcxzZXH1QmcIFYryHOA9vsQcVlB4nhzreA9TJNgPdq9oZupDmd6sSbHUc2xkLNL5oO0M3aj6KqVJmNugrx/RzLQ1TbfgPN8W8WxTWkI7nzI7mUmUsQldv5VyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z52u08De; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b065d58so18956255e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755879985; x=1756484785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P725ykDzVet6+jFt/VbB3WZRd67bIf5RvVxJA2aNQrc=;
        b=Z52u08DeZqsicJ7xNwafQT+2De6bNmStSUH8K3iB7JF43T7jxVUVQIy9bvK2K32PL1
         y89gfkGdC/3Zwz8H65//JvP4/gLtri+oIgVsGoMdDi7akKW/ij4xg/SJ8bJiH3BFIkFu
         3K2QqoMDn5nanxMUmljM9T6woqGYqJMlC5BMfapGHSuKXl3i/BV5go8MCMzMw/+XoP+a
         RRCJXbFaYA4YmqtkA+SRh241bJHsbm/FEPf1XPNxt1p6zT4Y4riOUjCL0ElgZiPYX619
         985RstA/IaQi0f1eouZflOLR5Tef5lm/WmEW3theU9B+NbFnJbJAgLc4HgFLsqQcVWBE
         5z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755879985; x=1756484785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P725ykDzVet6+jFt/VbB3WZRd67bIf5RvVxJA2aNQrc=;
        b=I69B/5ZVew9H3qugz2L5eHAI4MrBXyavAeGlJj9Dk3EXgEKO3zsehYJLvdroXkTJ4M
         QYyUx7MsbWmbINeCTvyfcVyTo/WLxNMnDVTBal1JZZbvOod+s24Y96GMXyplhrCBVy2D
         KhsWQQte7RC2Q+33AeuW/RoWAob/KLtkGj5U5fXHAmOEVkbCZXeRdUmuuxApyKMz8N3/
         Auj1uGAtV9HqlTOU0vvuO9CWiufqJJluIDdpG49ITcC1OXtHzqDt15VKnovaMfm2ifxh
         EepmSAtFmviGMC3W727Nmc0NaHm56V85suiCRyAXuCex0PEWHTqvAIIEwboaN9vnhfVW
         +A/A==
X-Forwarded-Encrypted: i=1; AJvYcCUvsxCd2YpqwtM2VU01T0zCmd7LF3s9HzUHAqI+9cCa7TZF36VT0hhiuvukFTfhCc+bkn/IrJtJUfXh+wQx@vger.kernel.org
X-Gm-Message-State: AOJu0YxfV2IZFuIMeiKCOiW7lV2QjfysHaZBeVKG3HxhOaE9Z1ESxHc9
	h7ASBORU7Juph/oWF99nf/mMZyVLZdTF4twveyfRGHhMUHEosyThr7WNuqf5aEJg0HU=
X-Gm-Gg: ASbGncseG1+tTIyZnhKBYnK/sIgz/UOi+L4Yw8x8iBf+K+JgekS2rUlTn0ZoV96DS+K
	GwQmoReDSZZaPkX6bgROhVz/iampBgdJNI7xV/B763FS1SLInyaOObDPoZSk1H5+vjHxUFnDsXR
	b3qw6we58nVQHBH572RTNCsnftsdNLu5ob2x8uBbWT6PV+JfIsnkCIOYqcNnIzWW3X+A4Cj/WfZ
	SRRwkE6evP2USJ7Gf5jS1llyso/YIHYPb0BNAMRz5UaWtMSZOVcd82EwyZlhF4Zr3BOh+g6ltn8
	0bEIxIMnp02h/GdKtS/9n1AI1y5iEgVhCLIquKAo4WtHB7GkYcd4oAY2k8NPkcIuYBC5YYcgxoY
	EG2CRVv3AHBbiU5pSEJEvOkUH5tComM0u
X-Google-Smtp-Source: AGHT+IHaMKfNGJO+VhkkDQn+ODLTdkpwVQhfV+Xh1dBzCWDIxaQTy7uymuz/hWmsYGH1xFeLJ+hrGg==
X-Received: by 2002:a05:600c:46d3:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45b517d2ab6mr30590955e9.28.1755879984629;
        Fri, 22 Aug 2025 09:26:24 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:41d7:483a:fa:b4a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5748e743sm5191305e9.17.2025.08.22.09.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 09:26:24 -0700 (PDT)
Date: Fri, 22 Aug 2025 18:26:19 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 11/11] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <aKiaKwkpdKHSH9YS@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
 <aKWLZwYVPJBABhRI@linaro.org>
 <20250820115659.kkngraove46wemxv@hu-mojha-hyd.qualcomm.com>
 <aKXQAoXZyR6SRPAA@linaro.org>
 <f25b6cb4-666d-e3e1-0540-b2d7fad86407@quicinc.com>
 <aKguXNGneBWqSMUe@linaro.org>
 <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822150611.ryixx2qeuhyk72u3@hu-mojha-hyd.qualcomm.com>

On Fri, Aug 22, 2025 at 08:36:11PM +0530, Mukesh Ojha wrote:
> On Fri, Aug 22, 2025 at 10:46:20AM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 09:56:49AM +0530, Vikash Garodia wrote:
> > > On 8/20/2025 7:09 PM, Stephan Gerhold wrote:
> > > >>>> +int iris_fw_init(struct iris_core *core)
> > > >>>> +{
> > > >>>> +	struct platform_device_info info;
> > > >>>> +	struct iommu_domain *iommu_dom;
> > > >>>> +	struct platform_device *pdev;
> > > >>>> +	struct device_node *np;
> > > >>>> +	int ret;
> > > >>>> +
> > > >>>> +	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
> > > >>>> +	if (!np)
> > > >>>> +		return 0;
> > > >>> You need a dt-bindings change for this as well. This is documented only
> > > >>> for Venus.
> > > >> You are right, wanted to send device tree and binding support separately.
> > > >> But if required, will add with the series in the next version.
> > > >>
> > > > You can send device tree changes separately, but dt-binding changes
> > > > always need to come before the driver changes.
> > > 
> > > Do you mean to update the examples section[1] with the firmware subnode,
> > > something similar to venus schema[2] ?
> > > 
> > 
> > Sorry, I missed the fact that the "video-firmware" subnode is already
> > documented for iris as well through qcom,venus-common.yaml (which is
> > included for qcom,sm8550-iris). I don't think it's strictly required to
> > add every possibility to the examples of the schema, since we'll also
> > have the actual DTBs later to test this part of the schema.
> > 
> > I would recommend to extend the description of the "video-firmware" node
> > in qcom,venus-common.yaml a bit. You do use the reset functionality of
> > TrustZone, so the description there doesn't fit for your use case.
> > 
> > I think we will also have to figure out how to handle the old
> > "ChromeOS"/"non_tz" use case (that resets Iris directly with the
> > registers) vs the EL2 PAS use case (that resets Iris in TZ but still
> > handles IOMMU from Linux). Simply checking for the presence of the
> > "video-firmware" node is not enough, because that doesn't tell us if the
> > PAS support is present in TZ.
> > 
> > I have been experimenting with a similar patch that copies the "non_tz"
> > code paths from Venus into Iris. We need this to upstream the Iris DT
> > patch for X1E without regressing the community-contributed x1-el2.dtso,
> > which doesn't have functional PAS when running in EL2.
> > 
> > Perhaps we could check for __qcom_scm_is_call_available() with the new
> > QCOM_SCM_PIL_PAS_GET_RSCTABLE to choose between invoking reset via PAS
> > or directly with the registers. I don't have a device with the new
> > firmware to verify if that works.
> 
> You can check QCOM_SCM_PIL_PAS_GET_RSCTABLE with __qcom_scm_is_call_available() 
> but there is a possibility that QCOM_SCM_PIL_PAS_GET_RSCTABLE SMC call will be
> used even for Gunyah. So, I believe, __qcom_scm_is_call_available() and
> video-firmware's iommu property is also important.
> 

Yeah, this sounds good.

> > 
> > I'll try to send out my patch soon, so you can better see the context.
> 
> Are you saying that you are going to send patch to support IRIS on
> x1-el2.dtso in non-secure way i.e., non-PAS way.
> 

The background is the following: I have a pending patch to add iris to
x1e80100.dtsi, but that currently breaks x1-el2.dtso. My original plan
was to disable &iris in x1-el2.dtso (because the PAS way seems to be
just broken), but then I saw that e.g. sc7180-el2.dtso does have working
Venus with the "video-firmware" node. Copy-pasting the "no_tz"(/non-PAS)
code as-is from venus into iris works just fine for x1-el2.dtso, so
disabling &iris in x1-el2.dtso just because the "no_tz" code is
currently missing in iris doesn't sound right.

As far as I understand the approach you use in this series does not work
without the TZ changes for older platforms like X1E(?), so adding that
code in iris seems to be the best way to move forward.

I started working on a patch for this a while ago, it just needs a bit
more cleanup. I'll try to finish it up and post it so we can discuss it
further. I think the IOMMU management in my patch would even work as-is
for you, you would just need to toggle a boolean to use the PAS instead
of accessing the registers directly.

Thanks,
Stephan

