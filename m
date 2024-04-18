Return-Path: <linux-arm-msm+bounces-17845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F302E8A9980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 14:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 302B11C20ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA7D15F407;
	Thu, 18 Apr 2024 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RguN3ynB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDC15AAAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 12:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713442129; cv=none; b=t3sCxYtFCTFf2AQ+S9WMgAFNDJD5CoYPWB/Y6h6GlT870nOvKGmKQdIq5cgltHgxQhVoHXrHbwulmNDC1gDE8aqp5kClme3jWHNOgGv/00udpOyqqqK9p2ylLZc67nvrz9z/UXq0FvTHnruCzb3+f7ztoMkzyZOB+ifl3OPHTwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713442129; c=relaxed/simple;
	bh=EivacNFq0/5fLlwKTYEmDnsBy7Akbb2iAEHMxkjmh9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YrpzdAdXiMInglQrffM+8QjWvzfpirhB6n/ukEWGyAKffAyyE9EHuXjKN++hWX+phj9cii43d5VL6GDPceYOsumCngtbNo6bDQSszzGsl/QcDze/Ezm8Kp6/yFnuwKWQFElnI8E9QRfThNCrbcqRmMBlawb62Rkbe1eJUbUczYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RguN3ynB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-346f4266e59so515715f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713442125; x=1714046925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IrT+pz9h242ho6h5cpwp9QuV44kTV1V8Z+LpieCcyow=;
        b=RguN3ynBfax/qkBvrCX1uyQho9papzclDb1b2QE6hQQR8mzuqxaCzoUl0PqME7l0w1
         U3iGFzx0h60XvoxSkES0lx5grKalOlDr+ex04pm6Rr9ON798mfptw1eUx7x6DU9ll9KE
         NaBkVL4Ds3abKw7zj7oud6hiouLqGVHdqKBjVcJwaY8nNU0mIiUlxJGkIUPGPZLA5pEL
         oZg+2FCFk4Xp2IrQA7zVty36vpPsWlq5P1Ba0BIU/Tm+eEYoj2JXQvjJahPDzw2pNmls
         VBYv9F+trIFySbzvg+QEVSBHvqxWhTfyeXwMvrRPqjxgy92RoaDRWMuV+BKS8Bmsh9TF
         blWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713442125; x=1714046925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrT+pz9h242ho6h5cpwp9QuV44kTV1V8Z+LpieCcyow=;
        b=uxgWpR8DVltbxygAjjIzzKJLhcsU8o/TCSNDQPqHMVqOjja3WHAnDCebBK31lUkSkb
         ZXb844djL37y8H5/TEguw/2q6RfHtaohJY83gjD45ELttlOurwRZdXwu0bJtxl210RiJ
         pqiek7t1HAPKtK7BncAPxXHzDohydyNbjUJeCNAnlT40vPibzL7Pp1Y7FE6EMRPks0Oa
         uW0hXzWoc7MPn2hR8cTjmMSbW7HTu40ncBKMK9d4PmPIVRjzxumEheCtwMHuxh0ReIXR
         IMTTy4sO0H7DEmZMomBKL7Jwi4UV00c1XjcnXbKKxJ2ZSNyXW/37t2MFP/8tWqtEWXfE
         L9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWIcooHFW6fMo+m/iTx009uxl4g2keyWpAasYYJqPcE0jQTjZVKQQJy4K79hg4Cfk3lrJJUlB9+xXHgEiAy3vGblBA6ALtI632Gs7QtKg==
X-Gm-Message-State: AOJu0YzcC/addEJ7dYcnU1ChomCfPFxwbL7uQ2VDwyaZXtvR4TL1/LdI
	RoJePgDxR+b8dCbcr3JgHDu93alJQmpWEvt5pXdWjQAcGKs9B7LnIOLjaL6cP0c=
X-Google-Smtp-Source: AGHT+IFv9y8xJmg8vyenO4cu3YWChH5bcQzke4eNsa1YJO6Z2ciuRugVmRYh32oJHG0tFBkXehpvbQ==
X-Received: by 2002:adf:e60d:0:b0:346:f830:8a5a with SMTP id p13-20020adfe60d000000b00346f8308a5amr1520817wrm.5.1713442124561;
        Thu, 18 Apr 2024 05:08:44 -0700 (PDT)
Received: from linaro.org ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d4a0a000000b0033e45930f35sm1702163wrq.6.2024.04.18.05.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:08:44 -0700 (PDT)
Date: Thu, 18 Apr 2024 15:08:42 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: Drop the reconfiguring of
 PLL0 on probe
Message-ID: <ZiENSp4nrLNHlAoZ@linaro.org>
References: <20240418-x1e80100-dispcc-drop-pll0-reconfigure-v1-1-453e4e70e940@linaro.org>
 <e5c60b6f-3cab-4265-87fc-7eeab03795ec@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5c60b6f-3cab-4265-87fc-7eeab03795ec@linaro.org>

On 24-04-18 13:33:19, Konrad Dybcio wrote:
> On 18.04.2024 12:51 PM, Abel Vesa wrote:
> > Currently, PLL0 is configured by the bootloader is the parent of the
> > mdp_clk_src. Reconfiguring it on probe leaves the PLL0 in "stand-by"
> > state (unlocked), which will trigger RCG child clocks to not update
> > their config,
> 
> Sounds like this is the problem that should be fixed instead.
> 
>  which then breaks eDP on all x1e80100 boards. So rely
> > on the bootloader for now. Drop the config values as well. Also add
> > a comment to explain why the PLL0 is not configured alongside PLL1.
> > 
> > Fixes: ee3f0739035f ("clk: qcom: Add dispcc clock driver for x1e80100")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> This works, because you have (at least) partially configured hardware, but
> we shouldn't assume this to be the case.

OK, I think we should be safe to follow trion's approach instead then.

https://lore.kernel.org/all/20211123162508.153711-1-bjorn.andersson@linaro.org/

> 
> Konrad

