Return-Path: <linux-arm-msm+bounces-18726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F1C8B464C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 14:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED2828208D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 12:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E313C0D;
	Sat, 27 Apr 2024 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="giuNdlYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C638DD3
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714219469; cv=none; b=nV2eeQ81rv0eYuuulWFxbpZ6i2c01XfjL/VzO3ZL7HoAU3x1DkbXaXkBqUXumywYI4HQ1C36LaePcE3BXPPLJXpUrnbbqEPPAeui9Vftt5ciBHensrt7hz0KN9+AaXXiYhqxTRMMnR7/bLPTn81BHSLzushaX4bRDsYHZk03Us4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714219469; c=relaxed/simple;
	bh=Qx77eECX6fGK3s5WuyBlmq41aaHW8MGDy0OjhYwrv4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YCZljmsxqFpng+kiE07WzJI0zEDsikJzUz6t8Jk/ar6fTL72Ij10CXiM0AOLI/Iwix14Z1+nDvmWG5MTMqvujETEwB9IFL/OjXIX4Wq+2cRbrdPkkLYoAC3nG2L+Id7c4xO5Yl/rUu0wu4oOl6X4oWYYljn8J4Crawum99De5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=giuNdlYV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51ca95db667so2094593e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714219466; x=1714824266; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M4KxbMOPobKw+zVu4l+AkGDBH5YIiQ/czS+4EyOwms4=;
        b=giuNdlYVYVjFLpqYxoBnM1INZ5GDDFGqxWugHQzYagxWyv+wZriClYocwQcQswaOLL
         ug8rAd+uGOu+To1ZnEVbh1OBmNiTZyR1idovSC3k+UGoC88fthAQM5fn6dlq1RCaa/km
         2bAUadQIsiab/cuLeS7dxpsiBuMmaBCAr+1+91eQVUOe1qphYsNRrHylOSoim6sFc0hw
         JjuPhynmvo1xvwWyyx6nFp0mraaq1ThNM1bb4spi+LqF4D+YhUCVSwVoVtUdhsb3hPVD
         IMPl7yvmjThgOiu/2Y2HCA0V80lNe8aGtkYct3sJiVt/bnenIeAz5npv+nxkzdunfRvU
         jzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714219466; x=1714824266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4KxbMOPobKw+zVu4l+AkGDBH5YIiQ/czS+4EyOwms4=;
        b=m4ygY9sE85EZXhXJ/bfM6Uti0mqDy4nBH7lrGN5NISUoISdj5mV1+OPj5E/SdxH16W
         lZo24Ta/EnTeN6dWH4zje5wfD1y77Ps5tnn+imtToST2fIeJoaAnwQy0Bd150iwv1ZmI
         bvcdRsmJFSK0wWnzfA3em6IJ7IUQ3wqUPQ8CCPQq7yySAHHXexs25DZtKd5jWMeZOurU
         LP36Wumzg6zhLggLH7UXfwwdvepcsAVtumIDCnE6E09gGTc0W/1Pw707a6Rq6SFvdmcX
         fTW8XGsIq1vMG1JyFzEsaieVB2nvVnTBmYD4DIEkOOWCq8LNsa08srFr1fosx9BskvhW
         7i9A==
X-Gm-Message-State: AOJu0Ywx9cdLrX55z5TmmIMxPXu7qX4VF1GRcxQX2qMexlWAVDCu80do
	JiMFJrefSj4OrmmHwGz3qaCjjyQQGooq1qPCDCCIcb/cS2V7uVlnqsEWplbQHncp//4ggBg4OB4
	O
X-Google-Smtp-Source: AGHT+IEytJFGQjtwOxzIenWUWdx9Erl3wSRSnG9KvGAsEhPAFwre3TbJM0qJUskI40ZTRdqS9feVLg==
X-Received: by 2002:ac2:4ec7:0:b0:516:b07a:5b62 with SMTP id p7-20020ac24ec7000000b00516b07a5b62mr3657405lfr.54.1714219466162;
        Sat, 27 Apr 2024 05:04:26 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id d42-20020a056402402a00b00571d5c4a220sm9600710eda.7.2024.04.27.05.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Apr 2024 05:04:25 -0700 (PDT)
Message-ID: <e8f08fb2-2ad7-4078-8db3-6acb6569497d@linaro.org>
Date: Sat, 27 Apr 2024 14:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sm8650: Fix GPU cx_mem size
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240426-a750-raytracing-v2-1-562ac9866d63@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 8:33 PM, Connor Abbott wrote:
> This is doubled compared to previous GPUs. We can't access the new
> SW_FUSE_VALUE register without this.
> 
> Fixes: db33633b05c0 ("arm64: dts: qcom: sm8650: add GPU nodes")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

