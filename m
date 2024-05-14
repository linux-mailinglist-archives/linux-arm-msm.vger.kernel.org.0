Return-Path: <linux-arm-msm+bounces-19855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA678C5D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 00:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 878A3282B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 22:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29F4181D11;
	Tue, 14 May 2024 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zkaXSBLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4E182C8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 22:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715725050; cv=none; b=UZda3wp9jkGBQB/SldQtg7p2EyVpVbTja2ECDkB9m4gI9TDkFgbc84Cyi96FvWX/FH3mxtieQex33BMFB0FTWd88lO65+/MbCA0kihAheyC/ZREatZkv3kA2ZkC7ZLE+mRLrqY+JaF32mSJkmn3WdfrGmTG5Vvf3otp4Sw+kE/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715725050; c=relaxed/simple;
	bh=dICNG5Mavyv9DTbDSfwvDK8paf3rfuTwOCDV2Erf3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfOwGFK5PcLL3hVqXSVyHwyZhczHYEPyUt7Od+DdoSM6AALNdTth5NGH7+qJX+lD9ngMAEg36EWZwtqoaW0BR3INIAXm7I7ks+UdxEEd4D6JPqr5mKzOxpQo9NCQ5Qm+tk4HCCIjBcozT5n7gO9X5ExBAulH+xVSpAY2rWSiVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zkaXSBLI; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2db17e8767cso87506891fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715725046; x=1716329846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
        b=zkaXSBLIUnD8U7ObTsDadbZlAotEyI1mbBIwabuOwB/HOSa04hu8uH1+dkn2SW7vsJ
         IOb672YvuNKDrwvB9TEt+qHAL+vm9T93Xi0eGUhlTHOKpy3Q6vRWHjYU36vaQ3OTzICP
         AwVJwNBso1Q14Y65BXJetRXj4GtPHoX7vNZxeLxtWzTW3uhO62o9dSZFg7UrWtzI88xN
         SLP2YwQyPPLORbGNmwdM1Jf6W2ENOBwKevw5TJH7+51pzDiMsgrhj/S/qS99X2oc3kaK
         3v/Kor2WhfFSIlSeDjHbr1YFYs7uyh8iPizmSz7KFlZYs7zIYJ0ipSX+Rssvdx0LtzrL
         W44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715725046; x=1716329846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtFt7wDddzxzOujkRVGAoAf/dJUoMvePNiVnCCaevzU=;
        b=ooBqSCKaFLxyzD2Nl/HC+NAp0MeC8qN5uuJN279ochNZ46R6d91N/Xd8/Zsz3UV0Sk
         untxzn1LCHCcEOgskGetCpvDkVZrlgFdRzc/3cAIJf6Z508GdpqXEotkRKDWhm7eU4YP
         nhk2SHxKzpFfKG7s64jygz2Hg8XiwFQIWtmRFAN6wMSmbWv9gkl5AvaQYTLvgkthjjWb
         Kr75jMasf8p8+PM+4V+xvqbCSrauRXzxFzKNutBPIjJHtG0wGKwuT/hL4kCtU4GeYSg+
         8XwZKxE2V1DtJWUfcCpnGseX98w7x6ApKM7y0jUSCgz6jOVBMfaWhP+1xUl7ibe2lEct
         5nmQ==
X-Gm-Message-State: AOJu0YyhWvS3RpOpNQlHIEpvjHbFNnwjc/8kUOQB0u2cU481lTzGQV0y
	CppDQ8jgM+LPI4gtNjOdq53V/GD0p+Qs9u5h+NO17mRJH5bW4ZwwGEo3H0XIChs=
X-Google-Smtp-Source: AGHT+IHufBornj75MaM0CaFqK+fsJscVVdOQ/IMTS+dnU8UXQa2+ajhmTfkTpNSwPpVz1LgRs/Djzg==
X-Received: by 2002:a2e:460a:0:b0:2e6:f710:6061 with SMTP id 38308e7fff4ca-2e6f710617fmr340141fa.17.1715725045977;
        Tue, 14 May 2024 15:17:25 -0700 (PDT)
Received: from [10.1.2.16] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41ff063d8cesm175234525e9.46.2024.05.14.15.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 15:17:25 -0700 (PDT)
Message-ID: <0ba6af4b-1d69-454b-85cf-a83b64431496@linaro.org>
Date: Wed, 15 May 2024 00:17:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Add obj flags to gpu devcoredump
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20240513155150.166924-1-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240513155150.166924-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/24 17:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> When debugging faults, it is useful to know how the BO is mapped (cached
> vs WC, gpu readonly, etc).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

