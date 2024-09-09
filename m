Return-Path: <linux-arm-msm+bounces-31372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1D972355
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 22:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 391731F244EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 20:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF2F189916;
	Mon,  9 Sep 2024 20:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9mZ4uBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4403F16EB55;
	Mon,  9 Sep 2024 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725912663; cv=none; b=KhENDP8RS7/C7ARMonLdXlJzqPZGaZENgW9vnp8oloNgqGEMr6d5Xf8t0FNVkLeJTTMPDMoFYCyIx7zj/RzQ89jf8uVynatx3jiPr/KsaRZhdys/SqO66tKEVQtvnssO89YaxKz0GKyN0ZFkolyD4sEc4uyg2flrz7S1+ZDLWP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725912663; c=relaxed/simple;
	bh=jYKgZEGbkZXT6pllpD3xTjLtu8syBVnHRlCBduQQMxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AY7eir3Cxt/gCRhlaiAvUefndO4GMzQsnFGH9+jeDaDLgut1Auz9IO/oQ+/7w2zLeuvdW0HPnY2OLbGx+MuJj+7rvKsoOVGOfVDbpDwhCCASFaAoZha12vI2uUk2TTYx6MqlTmzzE9CNneFeN5vDJBIKiVC3JZG0Y8ZwZM9YJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9mZ4uBF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED61C4CEC5;
	Mon,  9 Sep 2024 20:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725912662;
	bh=jYKgZEGbkZXT6pllpD3xTjLtu8syBVnHRlCBduQQMxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i9mZ4uBFpN6RtqH+lJbsp7kLRgiHIVmuOSn4xvvvnxKF8S67QmkpzHcd8jmr/gmpG
	 fhz2ve7zMTe+BW053AbMGLNWtCyq51Ygz9i+Hj28pIq8ws6tHmb2sQaOViUlZmwH3J
	 lL7J4yJ4f+SVVYSqBzaUDU1ki3tsVRMiy96H+bUCID9edbBbIKZH29H7s8HINZCeE7
	 MwMRaf/29ufKOTEB6Hj3b5Jj/1BhGr1/K7+37ukieLQ4eSTpTTlBjjWXsRzfxKDj4l
	 //9X1PKTojsL79+HIFsqoeA5W9NADj74jzq2S9Wd9x8LAQLo1e64v2Qw2BZ6MyfVlW
	 vzu1Xj1mgBrqw==
Message-ID: <e30dd3e9-4ccb-4da6-ba90-958ce1a6708a@kernel.org>
Date: Mon, 9 Sep 2024 22:10:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: scm: fall back to kcalloc() for no
 SCM device bound
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rudraksha Gupta <guptarud@gmail.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240909-tzmem-null-ptr-v1-2-96526c421bac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.09.2024 8:38 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Older platforms don't have an actual SCM device tied into the driver
> model and so there's no struct device which to use with the TZ Mem API.
> We need to fall-back to kcalloc() when allocating the buffer for
> additional SMC arguments on such platforms which don't even probe the SCM
> driver and never create the TZMem pool.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/<S-Del>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Considering all SoCs that would be allowed on a roller coaster by age now
are supposed not to need this patch.. perhaps this isn't a hot enough
path for static branches, but I'd say some likely() hints could be used
here..

Konrad

