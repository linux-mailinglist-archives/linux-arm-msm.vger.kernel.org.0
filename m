Return-Path: <linux-arm-msm+bounces-34904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E29A38B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F027B215F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 08:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA318EFF6;
	Fri, 18 Oct 2024 08:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VS6B8UE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CB18EFDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240721; cv=none; b=IDfoOjk5qQGTpxjl9MVpQChuiy0IkILtfMv8bn9oKk/t19eCDkto5ZkgfPAiFJ7YdcBxSVK5GVqKJBzDKvs+Lh0PJ9SRdVGOxEsOy3oHSSEuVnxiABnKM7GwvQP7sUZdWXjQ/cD9rdkwF6NuBOEmiAYFt252z9qfj6zKhRL8AVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240721; c=relaxed/simple;
	bh=wB6rJgDXWyQmAI2cPIO2Bs8AyLymaUBqEb0titk5ToI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6fQqFw43avuiKbqofQrIM5qZHePSzJ2w76clSLun2mczgqwTtkzVO2nTnjXN1f1peKgmMLNEgY7L8PzVD4NreCbMkovxMSmn5kALIRsjCoGohQZCZJl1WtXQc7g/5ryKiAr+8UOV+JImP3S5RxzS3XuejE4uRpAk2QwS/F5Ncw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VS6B8UE2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbbadf83so2409031e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729240717; x=1729845517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9UrD9uUISUicyV77FCZtIHadfgQC6lKYurkwJjq1HNE=;
        b=VS6B8UE2yJQB/j770cxZNF3J9A0Rijdbo55TMaEzF9kjxOzRL2fJB5dkyjv41n63v8
         yehFP+wA3UWXqKbqQBeg2n5i2HN9fOPSNmF5qia3CH7EOdotkgs92v15zctn9vV1RicM
         dDK/H5V3ZQk1bWeTLZnw9ji6FFaGglcx1kzF+pEinf/HDeItXGmZeiMQUEsAE2EzCjpA
         gUOp6+09GrkAUUaWr9P7w68WYWz0fVvXfSunMTDQJXquI4juCpWZTN8uZo5kblSd5pli
         Q7swVZpItnfTv+uJiKBGyIUDSrtwpRZKJcG1VYsIAzEp/yI42KJFCu9/EogprbTfbhC5
         usLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240717; x=1729845517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UrD9uUISUicyV77FCZtIHadfgQC6lKYurkwJjq1HNE=;
        b=Kw3Tppzqn7bW7/VxuAmwoEEi4yKfP9IaD3tweKuQ91A0wWsOlKLhd0ZqBvyQXZjVJr
         WObxQYbX4D3xKP2jTOxRD2V3oLLrRqn/dtruAg4QWetr8/41A3H3g3vuxW4QJhZ+IfqG
         Bw2VyNcJyJdJQah3wQbqQi1LmUo7So2wXfijVtybjjN5xz3r98waHF7vSVHXiGMri6FW
         gg1PYfK8ctzp720v7CoZoSiMWOfJACqx6WrohKntPNTv8hCPmJ6sELywpfIF7VdPsTF7
         tbeslvQKPipn4FqqHlc9lNFMpeTfuKodqQGA5WoWtHw8FOkaMt3O+IYZHBu36WGrnkAU
         tUKA==
X-Forwarded-Encrypted: i=1; AJvYcCVujn9uvtPznziCVUA/zYO1Yd4mMd2bDbnj30JSZh20L1a6mvLcEjmth1cTVS2rZWa6qGixBYVwawPXd8d+@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfdRCIN3ThifaOuheFXI8fyKrWlEbFGnWwOUwWzOKpkJLiULt
	lpGnMNVHLnnSka33kRkQY2aMYfVENJGHfLAfiZQuwqyl86T1s8bgEN1twWZSqH4=
X-Google-Smtp-Source: AGHT+IGmgQ9MMDeNrBBU/z3b8S19gtWOFXt5jhyrSbyAR1fhQxWW9GPqe1/RawVBBM8MqhrGoQEi4A==
X-Received: by 2002:a05:6512:12d6:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53a154f9c46mr819940e87.54.1729240717149;
        Fri, 18 Oct 2024 01:38:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0c7csm158587e87.173.2024.10.18.01.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:38:36 -0700 (PDT)
Date: Fri, 18 Oct 2024 11:38:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl : qcom: document SAR2130P TLMM
Message-ID: <ecdp4bkbpkdprzfvrve4jlpirc63ruejr5cfm5tkqkq736p7wh@ibqjbq22nvve>
References: <20241017-sar2130p-tlmm-v1-0-8d8f0bd6f19a@linaro.org>
 <20241017-sar2130p-tlmm-v1-1-8d8f0bd6f19a@linaro.org>
 <u2yel7ych7esqlr732x6x424rxcolb22k6fgw5t6yyuurgneyf@5hnqyc3iqdvv>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <u2yel7ych7esqlr732x6x424rxcolb22k6fgw5t6yyuurgneyf@5hnqyc3iqdvv>

On Fri, Oct 18, 2024 at 08:49:09AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 07:15:45PM +0300, Dmitry Baryshkov wrote:
> > Add bindings for the pin controller (TLMM) present on the
> > Qualcomm SAR2130P platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/pinctrl/qcom,sar2130p-tlmm.yaml       | 138 +++++++++++++++++++++
> >  1 file changed, 138 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a8daa96936599e459c801b6685a42659271604ee
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
> > @@ -0,0 +1,138 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,sar2130p-tlmm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. SAR2130P TLMM block
> > +
> > +maintainers:
> > +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > +
> > +description:
> > +  Top Level Mode Multiplexer pin controller in Qualcomm SAR2130P SoC.
> > +
> > +allOf:
> > +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sar2130p-tlmm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    minItems: 1
> > +    maxItems: 105
> > +
> > +  gpio-line-names:
> > +    maxItems: 156
> 
> Don't you have 210 GPIOs? At least reserved-ranges and pins pattern
> suggest it.

No. I will fix the pins pattern.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

