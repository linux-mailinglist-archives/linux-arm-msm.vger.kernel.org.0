Return-Path: <linux-arm-msm+bounces-21593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E738FB1F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 14:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2F6D1F212FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921E2145B2D;
	Tue,  4 Jun 2024 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljCsdDM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D719C266A7
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717503395; cv=none; b=bqJaJKqK4/8AN8AoB1We9vbgCTXSiJrHasoGSZjODv2XvAn+gECZaGLSU7MhIRTijvHjjHUCgK+TLJlVif9yW0a/8ZHzIuHOGKQS3NKRwjbs+rllUq2MSdpF7bumtMK4I9aQ49zmWgvqHMkqoDzFiY23vmQJCU68QtnRp9OY5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717503395; c=relaxed/simple;
	bh=b8cLxRvYj1/phqQW8gDYECJAh2SrsZxNYxVUrn68cFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DI+5UliH2xg5MdYpomW6Lh6iUhsA1utWcpFkWmGdwOwZbYoJyeEeAHLzKAhLt0aOtV/i+vuXL+98P0Wn0Dp0yAljAvFHvCD+tKtmLofRRAw19KSyyWQti6zJJqevVY/bRQPxqfRPIzwPo3H5bM4ajQaF6gN1/2ldrYg/SuZ6RNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljCsdDM/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a677d3d79so3268503a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717503392; x=1718108192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dywsdci0cGCcHwgLNG5qrYK2Y3eLUZPha79pAOiUCrE=;
        b=ljCsdDM/IteQsuepkIiUGO4T1GyDj/HBUvJr3KqIEKyZUYqIHUGZUcF9h61zlecJsk
         qtFnUb2wAGzp5wat0v8aDU3pr12OtvM6zj0AqYtw4Zg3Auv3usMcFOVbph/7BEJ/SNC/
         tE6Ju/HDrEWM6duc9lj5gb6uBvjbdgoGKJicfYbHEO/5C2qRGna5PyK1pEiZX72z2Zz/
         wapEVoTl08oHHmzjqHaREXn75GvaEmuy6vo0Tba9KvWAvL6HCr7tSAy4Hlal6g1IilPr
         lM8clktESXsN2RBPlAn2WyGHSlKXUtlVlz0a5zzjV7R8uAGhVJuxspWUjSx6ddHImMXc
         +ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717503392; x=1718108192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dywsdci0cGCcHwgLNG5qrYK2Y3eLUZPha79pAOiUCrE=;
        b=lsQN01sUWMu6iwKtpWpLWippXJhp8rzNm3DEaKPG/ngC6DhsLcHxBCPS3eqrupVaDO
         XdO/aruEAGQepfft7vM9TyjU3kMQJmdGCjcMYsJjNo99KWyPJ7EmF3sCRPQ/o3riC74r
         Fy4zuS8bQipxb+7xXPWVQeNd+pbZPmA+7zOKoQ+266jLzUQr9KIw18B/ze7xkaUaHwbD
         gE94uwN5jj7VdBFge8czADRstFLEkouU6at1ZFsW17IX/1LVVoKhrUgdCv793P8iatYl
         Xf4/WATnjlPDqVLah4tBjk6+AStcPz1/FJU4bdUCIZRsnrTS0dtyXzqECyUWNUC6mzR2
         y49Q==
X-Gm-Message-State: AOJu0YyumsBo7NDxFD5PWnMUThOYccdLUSxLvh7gW6MpHdZQzngE5JXO
	lBV8skGIg9PuatVcn9Ktb++b1aQruJLLfTUx6RiSu4/dq5pCr29lRc1mab3bQyM=
X-Google-Smtp-Source: AGHT+IEFaJ0okDCNQsxvLPiGgKSQN856ez5eKhIPOn4MLW8EpFkv7n6Hde5n/wqnwaBga2SAvHqs4A==
X-Received: by 2002:a50:c04f:0:b0:574:ec3d:262a with SMTP id 4fb4d7f45d1cf-57a7a6bb20fmr2012274a12.5.1717503392064;
        Tue, 04 Jun 2024 05:16:32 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:a035:2af2:8d85:1f72? ([2a00:f41:909a:a11e:a035:2af2:8d85:1f72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31c9c0desm7358775a12.85.2024.06.04.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 05:16:31 -0700 (PDT)
Message-ID: <99967eee-da39-4a35-b80f-a78fe3c10733@linaro.org>
Date: Tue, 4 Jun 2024 14:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Skip retention level for Power
 Domains
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com
References: <20240531114148.8550-1-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240531114148.8550-1-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/31/24 13:41, Taniya Das wrote:
> In the cases where the power domain connected to logics is allowed to
> transition from a level(L)-->power collapse(0)-->retention(1) or
> vice versa retention(1)-->power collapse(0)-->level(L)  will cause the
> logic to lose the configurations. The ARC does not support retention
> to collapse transition on MxC rails.

This is not very legible. Are you saying that:

a) transitioning to/from LEVEL_RETENTION causes the resource to be powered
off internally for some short time and lose state

or

b) the linux implementation of rpmhpd handling causes that transition to
include a power collapse step that makes it lose the state

?

> 
> The targets from SM8450 onwards the PLL logics of clock controllers are
> connected to MxC rails and the recommended configurations are carried
> out during the clock controller probes. The MxC transition as mentioned
> above should be skipped to ensure the PLL settings are intact across
> clock controller power on & off.

So is this a workaround for clock controller drivers specifically, or should
MXC never enter retention, and only poweroff? (the latter sounds like it makes
more sense given MXC's purpose)

> 
> On older generation of targets which supports only Mx the logic is never
> collapsed and it is parked always at RETENTION, thus this issue is never
> observed on those targets.

"On older targets that do not split MX into MXA and MXC..."

Konrad

