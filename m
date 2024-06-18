Return-Path: <linux-arm-msm+bounces-23135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2490DC25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 21:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35D01C22659
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 19:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D46615E5C9;
	Tue, 18 Jun 2024 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXwmHngq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96391BF50
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737355; cv=none; b=fpygY19cqjyp56qQY+fhADUdeq5ahi09qEPiZXovP9rCQRNw8blmiZwCT587wTDwGqTR9AsPAOZtTjY+b/G+iftmqkLS38DCsPcggOjIkdID/foQKNcWboIcVmXS8pIynAqwYPps7qS7dsmTjpSAXpnLEC40oOWY2BJvr1nGoLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737355; c=relaxed/simple;
	bh=1UkEwDwHiA9y5SGuBuTcRn+jHryc/+jQlJOnBQ+Ekow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auUvrt/DsV8PR7Ba+uvhaDu2AVnit1++rr0nxOzYJvUIlvENHs35SItqByimH6mrMSxxktB2ZTJ1gx5cCcg1CTThIW+LKOD8PjUcPsGJqij2ZIoku7j5wq/mw6/zCzGZyUuIv0kBZvN6sZ7aEBEQZTVbn/L+S6Yr2HaMHIIsRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXwmHngq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so808465e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 12:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718737352; x=1719342152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
        b=PXwmHngqP1lU19BW1s0zoBGslLBfIQXgvC9aC1pk2pFHIWh5sTM3EXf/X9yhUaZWg4
         Lr0EIW4GHXMm+BnAfI2BBIt0L6WP6EPSf9kWa85TfbZ6d0/SNjcZZy7P7UZ8/10MhPBF
         vIsNFoCSATjICMRkzjjagKnueLC0rG0QZ51IEnqNAzIeEFdLcnOW8VaNkiW9Dc00e8pd
         RBLgb/r65NDJERe73uMCAO7ufWFQughFJQkfiVO3PhiaWSwJ8QwZAklGa/C7eX7AHZUC
         DHDzFa6tBdTitXoZFtdxscXha2HZECepJZYk6aL2M8eBmeA3o1s6lPx2wBTCFizOeSyL
         ZJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718737352; x=1719342152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0nW5Lw5L1U/vXOS5IOb1o4dhA6pmFIZMeuoNJs90Ac=;
        b=OeOQk4gnwKIj9paZVcG/RM+nRUKWJIlX1wxszEPgxYkbT1aCTHgXqGZUZtXTa5Fi++
         mhTlgsTdc4VCVnoycxpwXjo2UcfMWVovLXd+SnKauahf4ygEl1Xrdc2zzH28bfRsGkKD
         3n3O9EXA4Todz8Cg3wIAB+IhvynzbqZNt3/FglAwfImRHGkeoJx8MPpq7HTtUxaKu8b0
         cQHhcHs0hk4hTuHK9yW5Qai9IGN/8+X6sSIJxB7xRnybBLD/tVLrA9RbM1As3gWh4lbb
         H7wXb9QjiKKHvNxgdzfE5SBb0YOafl+yt+tATiBjui4Eur6IZSAFWd0QQNELORNhULiz
         ey4A==
X-Gm-Message-State: AOJu0YwlULqM24gtexjxAzxd43cbhP7VSbNRB9KWkLIxRHh9tOEwblEq
	4NScQnz++h7Ofhpq3XHNXhJ53ZAaDvQBshd+lvXO51g2skp41g9wHUAeI63fg7M=
X-Google-Smtp-Source: AGHT+IG7lBWAP2S0mJtpOdeqTmDaeSfFJwS3uCXt8D79J41M/fUJYZCYbP8ihtzZVXtw5EnRrS5WtQ==
X-Received: by 2002:a05:600c:787:b0:421:8179:6127 with SMTP id 5b1f17b1804b1-42474d41065mr6543715e9.20.1718737351821;
        Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075093a3fsm15011713f8f.1.2024.06.18.12.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 12:02:31 -0700 (PDT)
Message-ID: <ecadeb37-fd12-4b63-949b-136356a42362@linaro.org>
Date: Tue, 18 Jun 2024 21:02:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240618164303.66615-1-robdclark@gmail.com>
 <20240618164303.66615-6-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240618164303.66615-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 18:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +static inline void __build_asserts(void)
> +{
> +	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
> +	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
> +	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
> +	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
> +	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
> +}
> +

patch:394: new blank line at EOF

other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

