Return-Path: <linux-arm-msm+bounces-27123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF2D93DF61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 14:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B4561F21C32
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jul 2024 12:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2735712C474;
	Sat, 27 Jul 2024 12:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUbgvF9g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D06A8D2
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722084434; cv=none; b=gyeNkvS/+D9m5gV5Vbg1+CHdRiAdnRcVBld9z4QHloFZJRpATH1yIAG0PnvJXhOSLi/AM5rPsWMX4dyhQMpx5fzD4CI6/Q5AiPwhyUc8F60tDdrQowq5LSXhEpVVYPJ7dl3QnkpJAYky/haAvV6lhrA2VqYBk8IE0B2nv5Bibis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722084434; c=relaxed/simple;
	bh=4tmNfpeUgQbQUYvb8PGmYMyCd9dQP9Tt18NGCG1Bto0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UipYxcGrWKooBPDwbfdkn65Nd8pUYa6K676l7kQZ1TXXSWIrDcuDLTcbu2Tpm6MQxtiMMYV4bLmkdcFcya0iz1P/FyvO40dTOsEM7zoYtACMHsagbLMQw9ccrAAdF/L/ewuhvV4BRD0b8brJaD9OcEATxorkHOIY3b06QnpGQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUbgvF9g; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-65fe1239f12so5067537b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jul 2024 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722084430; x=1722689230; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ruf9ZndZlLo67VSTxRYzKSbRXRLxQV2q8v9gXBq+h+k=;
        b=cUbgvF9gxostbejgPz/mvShlKZ6afGTo8GIWJba/V8h7nWU/fHZVya09BTJO5SQ55d
         j/diDoLlQYO2H1FNa1n9LJrQ/lL5R5hTt4Jcyc/gJBnMwu/kIfDE/wrSdQuhQLcpW8zE
         0bafaK7jlarisbP/VP5qAGXVcfSEAvqbd1nx/u9SN20AOkaCXsEEhI8bgXCYmG3jDEN1
         oD17+za4lMuVoxEJV5AWsVNPetOb9U3IYm4dsdCLvXxhxbo5WHKozD2ar7C5q/M8CNRf
         NPcvxsswUa7lawmp0SG4dVThPNCdIyqrN+6VDUSH95LskDpDvCCQ1qtYXQ49Bpg+h0pY
         wLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722084430; x=1722689230;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruf9ZndZlLo67VSTxRYzKSbRXRLxQV2q8v9gXBq+h+k=;
        b=I8AtrRtPVULJwDpZMOjP1qarSrpN6o88Ax/NQcWgNDPA5qOqNKKMfumMLzRi70WZYq
         GAInwkMUdD9eGC6CMPeKFxmgVK+tsRV3TAXNAXK/m3KM1nQMN0goI5IlCVyyGA/p0r8v
         zr3brJ1Zh+uwJCzJ6Po9sc18/YwZJ4pN63Wmhta+th4waah/CFNlAM+WdEn0zbfWyW3T
         Oasct6hFu5G9YPrrCG3SaEVtpj4EYKC1oZwHCykgNFeqfrWWb6FwMUhCFeD3sIfsAwP8
         I5y+CUQcTCnVu/rpLK+Hd8soqJhtO0pcYjxejufCTDskIkVjNlyPnUXxIDm4U/fHf8Nw
         +ZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIduLqHBKsSCeWn4cx7kT8F7rr35+8KdQdKD6c36umBn//nbPbWGTJa43oMSAtz3EYg+Dx6C63TmpV2mewUTHWGA5rCutSaSWpNmwlkg==
X-Gm-Message-State: AOJu0Ywikh6B7g4mpFDf8yGZFRGeL76zqKq6J9EHlTANiulm6ArXqruc
	d46EQlYy6rpEhJK7NCFdnEFYrYqVfki1s6Q1NX2sVU4oqnUCjoeqibntcH/F2z+VN5Bpktaxl9N
	LZOkx+XImWWkctglz1T4Q/9qJdEb7TQUkF11lyA==
X-Google-Smtp-Source: AGHT+IFhK/Aj+oSR7J0lYtH6rQPZBzgOq9awlN5aMDE4hP6kpLKtN1cPj+5K1G7neerc+C+JBOWJXklm+962FR0VIbM=
X-Received: by 2002:a05:690c:f0c:b0:64a:f40d:5fd2 with SMTP id
 00721157ae682-67a05b95447mr29458067b3.12.1722084430178; Sat, 27 Jul 2024
 05:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220450.131245-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:46:59 +0300
Message-ID: <CAA8EJppFcPRcMzjB8hxbWK9G19J-C720DP7gukW3ds8j-Af92w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: reset the link phy params before link training
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, swboyd@chromium.org, 
	abel.vesa@linaro.org, Rob Clark <robdclark@chromium.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jul 2024 at 01:05, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Before re-starting link training reset the link phy params namely
> the pre-emphasis and voltage swing levels otherwise the next
> link training begins at the previously cached levels which can result
> in link training failures.
>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK

-- 
With best wishes
Dmitry

