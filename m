Return-Path: <linux-arm-msm+bounces-1676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E67F5DEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5B1A1C20D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E7422F1A;
	Thu, 23 Nov 2023 11:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RquwW1Ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406591BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:37:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507f1c29f25so998510e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Nov 2023 03:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700739457; x=1701344257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
        b=RquwW1Ye3p1aVNFGsir4oDfm3BgrCV8QmxTC8hJ1RH3pT1kGkQIA5tz0WbYMvLcUAu
         TaaVgbysVT7zCe4i3Xp16pwNQk/BwdjWBeHz/jRQswjTlU8YDbzrjs7P83tBiW2JO2Qv
         dF8BC/q4sLVB1lQlbf5teKrUnUU+8hZ2s+kgCBcCy7Y9PNASAF0YC9+eh3XiyRdyvCzR
         qEH1ncyKsD/u/eXS9mO05PLVxAcp763+iC/e2pOQbdb9ZSMYKLohkvWkhGp2tlKHUpJg
         vih/ZNjVW2ATJuGPCup1pXii+/Eo0G6+SgloAYzwXJ8rDF/Saa9hkhZhBHs1pZSyvt+m
         U7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700739457; x=1701344257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm0hbEIAX6bA2MYwiGpkCXzOiz2e3i3AxzXDyzNcE4Q=;
        b=GpynFVS3Tq0AMc6sVmDtcmPXl5DZZ34rXV70RlsbGd2BYuCIvUdBhk/NXgmTkoiH7R
         +7TOmJmxNJb1zWcGBDfqkM4A+NmGESr/9wzoHOheCgGJjlw2JJArujAvgEB4Y3HWhymS
         O2M0QcCjgD+QEXUtqrAhMKcFtL8YPHg+2Zq14/aHgkBJnNZhmGmfG2OLGJjAMRQVNV5U
         EouPfdKPvSfX/Hw/ozvWTKCOox1dxZfnmmTTo93js7LfllYL0PHHE7oF5CxEJy9qkpFR
         uDPT2tCzYpYAIFbpYraJfwo9boWrVwmhaOyiKURjyNpUmIH4WhecbkJbBcqcfA4XNsaU
         kVRQ==
X-Gm-Message-State: AOJu0YxA+pSuvCe2HdOhJR/FnGgkjZNhchuR6KZBENSPZ1J6+BfRvUSQ
	MMGmFCNW1BYigiO3cZy94PKQfg==
X-Google-Smtp-Source: AGHT+IGVn/cRKB4SR5kspsiZK5lcGwtL1/UJAwGrszDITZYjaYkgwg7kZEfFdYmBBnxpyjbBVu+e8A==
X-Received: by 2002:ac2:43a5:0:b0:500:daec:2817 with SMTP id t5-20020ac243a5000000b00500daec2817mr3796344lfl.54.1700739457263;
        Thu, 23 Nov 2023 03:37:37 -0800 (PST)
Received: from [172.30.204.221] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x15-20020a056512078f00b00507a96d17b3sm167232lfr.237.2023.11.23.03.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 03:37:36 -0800 (PST)
Message-ID: <70836806-5228-4b32-be97-f00a476bbe47@linaro.org>
Date: Thu, 23 Nov 2023 12:37:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/gpu: Fix null-pointer dereference in
 zap_shader_load_mdt
To: Kunwu Chan <chentao@kylinos.cn>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 jordan@cosmicpenguin.net
Cc: kunwu.chan@hotmail.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231123033329.27477-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/23/23 04:33, Kunwu Chan wrote:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Fixes: a9e2559c931d ("drm/msm/gpu: Move zap shader loading to adreno")
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

