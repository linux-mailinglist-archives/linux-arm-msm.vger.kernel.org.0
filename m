Return-Path: <linux-arm-msm+bounces-8191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3377783BB39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 09:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DB028C5ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E936413AEA;
	Thu, 25 Jan 2024 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEz+8DxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC1613FF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706169762; cv=none; b=jmxm7qFWzNpCbC7pg3646HgcFPjnvR/4iU+GTNXk8E+Su0vLcRItkUKi+G0HcXN2UVKyjFvCRSTfJbQ8zPuTWXeRue4SK+Oik2N2wQJqbbD9r0fVYf0u2jF5KOn96fcwPSPdsoMleHTu4aef1L2bTDcMg2b52GkGaATMuIvbgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706169762; c=relaxed/simple;
	bh=ZjgtlbWQIUt0Kf9OflnIm64u6awCd40qKo9jUccnsRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE9GITps0u/WQsgWi1Zp/oFHwhpQAKfD3rrKrP5hKszjVDCN4067w296T9eLs94ZmocgGm1FLDDAHa08illxh+pQcFzkfBpqqS4mFVN31Alw8wCqjfVltDZIoDsEgS6CDsUJcEP5EwOoAfpRMta6i0Wflro7v2i0bTqX5oC1ug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEz+8DxV; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a312a8e6732so135803066b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 00:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706169759; x=1706774559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlicmP6F8Wf48jjRJ0ma2aKuzpn0a6Z3GUmH5Zw0Ra4=;
        b=KEz+8DxVm6X8f9NgmubeKNOOJQulcPYW0jtVluSmHe6Kh9zlG7GBKNglN9i6QQMZEL
         BTdMqRpTFjlW+8IYdUh9qzCQMepuconJ+/QwS46zodC+FP5LlNQ57l/eNJf0tz+z8fc4
         F9pcCGTH9xWi76Sth9y25AiJYu9ABx2Ctt8EAf/4tDs+auyEWcRKNUA2KsxPvXLZccC6
         jQhKcDG3TuHeUXh2Zz5vKNyRTbcA2FqZ5zoPNgM+NI/EjnawlnbiU10HxwOeqLlfXnUp
         unTZ/gYhA5x/HIlLHs7Q1oooiBeUMZ/uejB929QJAqrPNBr6E+qccTxMT9dOX3PolQaa
         gxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706169759; x=1706774559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlicmP6F8Wf48jjRJ0ma2aKuzpn0a6Z3GUmH5Zw0Ra4=;
        b=sJsvO+hksg8qAlpvGCXARnaxnyhDTj5c39ytRAlaCcMXjMU9sn9quqqXSssNERmCCF
         Edz84NWrfO3IyjRDRMtIAB1wH1oXgO5w9emq4SFI4ig6NdDVrfynZW/p8FGcnPBRFWxK
         oH5SDpAPPM5vwhf78qeJdIyKCiSzBBQYzOLGk/Ktuy29sjJkjqTYG0NO3lkWGzZ4+896
         ZXBSqH/Iifw1i4azG3IY4WWtotJywQ3pKVSzufIWP8UUCkzENMPluycCiPSgzS7F085o
         beNDW2tkSIgWFTG4QxS74unuJKujEQqkKbv0ISvUzTadUZWwd78wI6AQGhALpY2fvJPu
         XXPg==
X-Gm-Message-State: AOJu0YxNtJa86XThhkT+i8halehaha/CauRnhJZDO/Yj4i3Bfr5qLIVG
	iShJ31lZRKO7aK3I8vHH6nuVd0qfLjlovyd+/Q0IAdPyNdlqgePOWRPZR4CqTfE=
X-Google-Smtp-Source: AGHT+IHpiO6kaNxRTlXaNGXDNWK2YowwzefIwr4rfQuNvrLr7dQXseMCDo4cuey9q+0kWcAp8iLU5g==
X-Received: by 2002:a17:906:dd0:b0:a30:bdbf:8f99 with SMTP id p16-20020a1709060dd000b00a30bdbf8f99mr314170eji.77.1706169759417;
        Thu, 25 Jan 2024 00:02:39 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ig8-20020a1709072e0800b00a31930ffa7esm80917ejc.153.2024.01.25.00.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:02:39 -0800 (PST)
Date: Thu, 25 Jan 2024 10:02:37 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 07/11] arm64: dts: qcom: x1e80100: Add PCIe nodes
Message-ID: <ZbIVnWitwE8ehu/R@linaro.org>
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-7-072dc2f5c153@linaro.org>
 <3d029d7c-7efb-42bb-a16d-30cf965f410b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d029d7c-7efb-42bb-a16d-30cf965f410b@linaro.org>

On 24-01-23 19:20:38, Konrad Dybcio wrote:
> 
> 
> On 1/23/24 12:01, Abel Vesa wrote:
> > Add nodes for PCIe 4 and 6 controllers and their PHYs for X1E80100 platform.
> > 
> > Co-developed-by: Sibi Sankar <quic_sibis@quicinc.com>
> > Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> > Co-developed-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> [...]
> 
> > +
> > +			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "msi";
> 
> You may want to add ITS MSIs too

That will be added after we figure out the mapping.

> 
> [...]
> 
> > +
> > +			resets = <&gcc GCC_PCIE_6A_BCR>,
> > +				<&gcc GCC_PCIE_6A_LINK_DOWN_BCR>;
> 
> The second entry is misaligned
> 
> Konrad

