Return-Path: <linux-arm-msm+bounces-38712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5839C9D5515
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02035281E49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 21:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9211D79A6;
	Thu, 21 Nov 2024 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nG75BV9l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F1E1AAE06
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732226396; cv=none; b=QkX4yXQmiJ45EPBG23bUGRZcuj5Kj+6wAP4gY7FkAFwfKtUn5QsbtAEPRvxaAJxcoAiU0hXZLKysQ4NJR+jEuzp+xIIR/TC1NV8Y3UR8hlLc7y1l5JHh44IQ5FGVl0Q13dZcbGuj0WITXQTxfc7uRP3FVDjIalL9lykHed4+7yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732226396; c=relaxed/simple;
	bh=Z9hBdIRlSlIOJt5RlJxNQ+/7oHtkA0DlqGr9R4P4wWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7IscckicqRT5/ShoJOKyfyRkrAIcDk6vPteV6v8kBLbQ5sjDaLuB78npzZpyAgByb9DUFQzYfeqMgtHPUe0A+SERHcgkLMpaOy9i0SXG6FpUMdXvwOicSzwodtjPaQYj9vnxt1JEDyq0DJ6PJB0ljbJS4r4gO6aRUIzY3Q0voY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nG75BV9l; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5111747cso16761071fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 13:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732226393; x=1732831193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWJdS00cJ4rOlNcmR7aH9AGornPg9zKM2yab94TA0Ik=;
        b=nG75BV9ll6f8M9nCyA2rtIYkr6oTFQnnZQfsVFdZstFylyRqzsThIm4TIEWxp1OsOB
         ZnXj1b9FHHLdITKiswho7JrtFg+TNK/kYlq43Edh3krCavycojczVYIYpuVXuBtHbWSr
         3GlXbjnL0capucBiV3iRfLZDnQrVQNyjQSEAqps80F8LxAhd8GETSqNQdwys3fa+mfb/
         fLLMJnSnEE4aeUbpCfF5eB/VLQIXVTbggtF8UIN3+NaSMTamtS+UaMIbKmvO57P22CXg
         ly+MdoTbZo47Zc05Q6+Jg2qPZUHHfLXBmZcIxiXyFZwgWtpGkYtlq4aDKzSExxYqxqfD
         fmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226393; x=1732831193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWJdS00cJ4rOlNcmR7aH9AGornPg9zKM2yab94TA0Ik=;
        b=c5/kj0V+zCkQ2gRFxgUPA62Ofp+muNdRhI+cUUY/l7hMdR+vZuqop7wFARsN4rnTLa
         diWq1FtGkdZvW4ZGd7rZiRjh+gJ0oa9XRC/U96S/OluL1PBf9YLAbUq5HqKK5+pMEitZ
         pmtz7vqOrkWSNVQwK7shs78vX9cnff7NCfAw/d/4DyrWtHFpJyzIVeL9f+UhZ2bIxyUA
         ds75GBWeboO/MetDbRjEq4d6uC6wRBt1PmwnIqTLFpaivkND9Sccwhmnz1nZFzOaxYm6
         MtgjaInXClwH9jL5dkHZfJMsFzyuuIkQtZKigLpLXxl7IeIqttfI+kyadJFfqQ2SJE0t
         yfyw==
X-Forwarded-Encrypted: i=1; AJvYcCWMlbcfEyiUmAAzjBcHH66uEgqKAiMrH4iO1vqAXT1/vIDLYOm8/Yr3FihIDqHBdk6fovoFqdGrwxWoRKhW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9J+95usEFkDAlXHBLIX8yg70n2RNUnCsz1YMHDDQ359GN/P0R
	jBcgUM8zTqjMXFnuwfMGCCksMyykhkXt1SmMgEoXBcmI3rT13cJJtjXJIBo5dhU77CAIfb5yOR3
	p
X-Gm-Gg: ASbGncs6pp/8VIKZZDFkKYobDFufOgHGQAANy3LRoxuCv9vrwHEBsUycU8tOke03qfn
	L3y/NX04X3ZWzS4XaLJE+S8Oe4TXRA2KpgS2vG9wybErwmf667tYCLaiq0PMOd7/jVlQ9yol2eL
	k6pkxmj6EiYiKLmYxbJY0gtSvw85OhWKem+yoUwIJOCeRlf3ikIZIXnHDVwVCpoyDtAbEpVsp70
	420Pawjno2qBdPiORoWsGKVrAEoLR9QCeysGSR/n8OWEtg9+n9sKt9q6+Fe0MovkHUIN+QSjUzU
	ABajqWE2cltS13vCCJ4KK1L93Ve//w==
X-Google-Smtp-Source: AGHT+IHBwuG5kencpPo4m09q691DHgtw2tL/t0BfxRPekGjk62eEZPhMHiR1SRxKJAeR+W+b3uNZ+A==
X-Received: by 2002:a05:651c:1148:b0:2ff:5f94:e649 with SMTP id 38308e7fff4ca-2ffa7125e84mr1424491fa.16.1732226392942;
        Thu, 21 Nov 2024 13:59:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538ea19sm652441fa.95.2024.11.21.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:59:51 -0800 (PST)
Date: Thu, 21 Nov 2024 23:59:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Message-ID: <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
 <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>

On Wed, Nov 20, 2024 at 04:49:04PM +0000, Bryan O'Donoghue wrote:
> On 19/11/2024 15:41, Bjorn Andersson wrote:
> audience what exactly you mean with "singleton" and "core logic".
> > 
> > > Use dev_pm_domain_attach_list() to automatically hook the list of given
> > > power-domains in the dtsi for the clock being registered in
> > > qcom_cc_really_probe().
> > > 
> > Do we need to power on/off all the associated power-domains every time
> > we access registers in the clock controller etc, or only in relation to
> > operating these GDSCs?
> 
> Its a good question.
> 
> No I don't believe these PDs are required for the regs themselves i.e. we
> can write and read - I checked the regs in the clock's probe with the GDSCs
> off
> 
>         /* Keep clocks always enabled */
>         qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>         qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> 
> only inside the probe where we actually try to switch the clock on, do we
> need the PD.
> 
>         ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc,
> regmap);
>
> Which means the registers themselves don't need the PD. The clock remains
> "stuck" unless the GDSC is on which to me means that the PLL isn't powered
> until the GDSC is switched on.
> 
> So no, the regs are fine but the PLL won't budge without juice from the PD.

Is it for the MMCX or for MXC domain? If my memory doesn't play tricks
on me (it can) I think that on sm8250 I had to keep MMCX up to access
registers. But it also well might be that I didn't run the fine-grained
test and the MMCX was really required to power up the PLLs rather than
registers.


-- 
With best wishes
Dmitry

