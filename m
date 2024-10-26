Return-Path: <linux-arm-msm+bounces-36032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE99B19AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 17:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81AB0B20C6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 15:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7608270826;
	Sat, 26 Oct 2024 15:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXkSypwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696E2B676
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729958293; cv=none; b=tQt3lYJxWyY51/YZ2AY/4YDVaPzliNJ7j6Sc5r+xRaTGDaHS5de//eILjuLtjQVYXtasXOM9jnYSIYX3HixqnFYv5tYUfVBy/A1elefcGdo8I2VuW3WhvqGEhIlTDa8wJba79ehdLE/Bybmsimd8q6updqgRn2QAtesJ73UIPmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729958293; c=relaxed/simple;
	bh=0Yy5KhAotvtG1MeuOHu2YrvJdVMziOmFkmayVc04OFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1kcW5aLdd0LsUqPsCZipm9pkc2fIHp+KRwsL09ToMvAOnPMD0XLPKGtyI1T7GPSvtholJLRdsBwwVlTu/+VQK8vCHZLfVCrroj+3fO3EiYroKMyh1S3AyuKZtJOH42iHwyjfAWc0bZUgrCLXlis8zX14v52uoz2XYWFCyEFM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXkSypwb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so4775243e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729958290; x=1730563090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nObd6q39hTr2YQsRyrzp9HSXK/DdhwTjCY0y0mR1PXE=;
        b=XXkSypwbefLI1ucXwsxkBoLbHfLkpdSjUDOFrggHOoOw8a4brYtrZv4J0JQeCT61B4
         kNvx33ZGiz930P+c8KF9CHWnpFKK0jBSg7Nu8Dfg4gxchu1gSZnCvlBh5M6RUPJGj3r9
         qCr1O8fXNbD3NKP2cJx9rs3MQWAUdulJ/zVk0Tp0PLFDuz6Pjo6OOOA5L4ZURDZsMkgH
         Geqo9KO5un+VWAONwsx63NOgykBuBL4o3nVGoy8HKnlaFr9n8W0GUYOaE0sMOZ/+NflY
         5tgmuvpKEiquy5Sk2LZAJoKNURoFpDgNWei1VwOpS0OHR9VIrdqqX8aCoIJoIE1seXga
         /nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729958290; x=1730563090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nObd6q39hTr2YQsRyrzp9HSXK/DdhwTjCY0y0mR1PXE=;
        b=Po14h9ym92RB/QoyKfWYkxd3NpuTmy3ANYVkIECIV2uPlAK016rhb1wpiNe1qP849B
         /Je3yFO/WbbPzjYxYKaIp7LlRWMjLD5IKjIBdd2Ll3wV+Ls3fLEBt8EgA+qOLYs1SXJ4
         sQp8AsVbERUIbRxG0mlqYXo6oxc/MHA7mtDuITObvrHi4RFFtvQFRXh+pk/CiTwuDDwW
         nczZOl7gBjzXcI+mCVg6ah6YTx9htO57J/JThYF497G3nVMa0Qdcz94ElM5YF7VXMnuV
         ugO8reGwl+JWg3cYn09GA/qTnwCKoxIYdTcr5HiYtd/kajyYEj5Iti1hj7POte3NFpsS
         sBRg==
X-Forwarded-Encrypted: i=1; AJvYcCXUQ12OIR8JGeMtTq4ifsWEpza9MuBnW5my7Zi9PlbLPXALS0dtD+SS2pTlT+sRGsP3knudP92jQNss/QO2@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCxLl3YOet2hIo2z0n9QZo0KpISectGsRAGbn766NKuYpNOxr
	//QULgBsoKTJmi4S+DYa/2BRtAWcxf/IaGMdj9HpRl2rIE/s5a1ULbIiLbQLekE=
X-Google-Smtp-Source: AGHT+IEx8yd6r3JxxjdHBLUNhzq0EwSMwjb+YKGZtWbWQxHCWYkq8/n17PU3q4sZPj03cet79QZFJA==
X-Received: by 2002:a05:6512:3e18:b0:536:55cc:963e with SMTP id 2adb3069b0e04-53b3491e254mr1810034e87.44.1729958289546;
        Sat, 26 Oct 2024 08:58:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1d5a62sm543900e87.233.2024.10.26.08.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:58:09 -0700 (PDT)
Date: Sat, 26 Oct 2024 18:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add
 SAR2130P compatible
Message-ID: <6p6uxa7ym5nqieenwcyt5ozqxdxojksh3ws25w2tmeinmxk3ga@lasczijp4iho>
References: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>
 <offdcgni7pr433jozldgvzkubr6gvb635odlopgrweitiynaky@kvbgg4xd7g5k>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <offdcgni7pr433jozldgvzkubr6gvb635odlopgrweitiynaky@kvbgg4xd7g5k>

On Fri, Oct 18, 2024 at 09:19:41AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Oct 17, 2024 at 09:13:01PM +0300, Dmitry Baryshkov wrote:
> > Document compatible for PDC interrupt controller on SAR2130P platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> This will be picked up by Bjorn, so should be part of patchset
> targetting SoC (just like few others, e.g. firmware). Please target same
> maintainer tree/subsystem within one patchset.

For the reference. Git history of this file shows that all patches for
this file were comitted by Rob Herring.

-- 
With best wishes
Dmitry

