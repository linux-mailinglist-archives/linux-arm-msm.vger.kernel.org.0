Return-Path: <linux-arm-msm+bounces-23967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F13914F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4867B22FFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1448820330;
	Mon, 24 Jun 2024 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gf0iBIU3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49646142625
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238240; cv=none; b=VCfykQHrWlxqgJEWp323VeAvyA8P5MJH9nOV2VbLtRSNQoTHBnj8rCl2G9Kn+d/SIY59wupfk1zjb+EyLc1h3qQ8C3yPooJ5uCdZu92YJUT39KMQeh9WYXtVYS51gKsFvi7mSVfvg66a2WQMOEk6ORevfe8H6DcbzBJ0MiU8/u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238240; c=relaxed/simple;
	bh=BBrLRB5gsy+422fzSXvTG3RqVCqJ+AGT/9QmfTzAQLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mjNgr/0PPErCKgcz1an7eBpLXt5IeFKfJ710jEC8HUN5/Z6V5Hgg7VD67VyJ+qfHhTsjVAmq0UiQjz/CnuXWBRsCtbVmglqap8c5V7z260poDjU+doSYVV/iweRkdCFSKRHwTM4s3rnUhACjlfkzLBOeAGTU8uWf90pl7bIFpcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gf0iBIU3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so36385775e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719238237; x=1719843037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E8GjbnArtzcXTb1C9DntYoJt85hKS9SMOHMtqTa9J18=;
        b=gf0iBIU3Wdjj3O8uZaNjFTea0WRD5JnIP5puqVZhxWAhOV9DUwlyQ+GjlMAnWS6HVL
         OuuQZghA4AT6xuxCW/f0QkX0AsNhvEi8DAwFz65+rT9WuQtuqZ8H5cFDBnv4eF38GRKY
         DV3Vy0WCoSsNPTaM6pp7IWMZafrZ6J91oGlxUDTJRvmFVYo4rp8ngXDe9BEAPzjZyn8Y
         TDzVqJGnB0U1o4bKWObWx40LZ7AAIjZu+7NuFAyLHxQbE4wMqrC8fcA11VmKubrLx6tF
         OMkGEG2YS3EhnI0VPbhkdE/TZsat/n857aCLJ3HHt14cOfs1nmfm2xNVDg7jRguAeZKG
         X+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238237; x=1719843037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8GjbnArtzcXTb1C9DntYoJt85hKS9SMOHMtqTa9J18=;
        b=v6WE6sHpvGDSVcBwAv/lXQlLLGNW0QsaAGt8OcwhZxVi7+oOFFv1RPd8o6KRshTp/M
         GFTR7rH1xwcTJehRcWJYLkxrZa0NeYhrgG5V1HrKEwHvIvm1/d0dlckmxl8TYvfXlvQg
         d++8fE6bNlORj+21NPECNDWeXVCU59kIFreDcwfYeLDGGSQc9NF+ygetJjYZIXNAflZw
         aFLYuPOpvyMLO9KfXegz6c+WFKXzRg7VLAZ+oH+l1HBbmkmMfxn1kQCgckB+ijcwNWUL
         odLpMg1wcLBonpup2x3A5hQR/9HEtwrOupvtA36r1aik/XI7lkWFZH1ELh+f5MI3nkN2
         WK4w==
X-Forwarded-Encrypted: i=1; AJvYcCVwS+ly2wPcnKyhP6u0va0wzPjABAiCdTt/rCM91kjRAhorskxNV6jjG9vyv929hnnhBwXcHCYHaJJMKXxtFa/NW6qlOM7gAlRdxOyd6A==
X-Gm-Message-State: AOJu0YzaXdpYyQBFhqHDqlKldPRVDs9qJGXCr9MB4x/ucpl0ueGGXD+R
	qnAobLSGIFYSu+hZpTPZX6N03z33n9LVMYOgCNtxZO8BNpZbqQE9zFIL0rloTbA=
X-Google-Smtp-Source: AGHT+IESDABTj23fO1VFJNm6YVo9BnwgyxRpAakWsPJglRjVJ4FVLY/00S2WBar0cwN81hd8mf3mKA==
X-Received: by 2002:a7b:c8ca:0:b0:420:173f:e1e9 with SMTP id 5b1f17b1804b1-4248cc34c77mr31102345e9.21.1719238236677;
        Mon, 24 Jun 2024 07:10:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d21226asm176878425e9.47.2024.06.24.07.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:10:35 -0700 (PDT)
Message-ID: <5bbb52b1-2fd9-4738-867d-84d1a0b75fae@linaro.org>
Date: Mon, 24 Jun 2024 16:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/adreno: allow headless setup on SM8150 MTP
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
 <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ffdfa775-b84f-4c20-9852-b210d42dc8d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/06/2024 16:06, Konrad Dybcio wrote:
> 
> 
> On 6/23/24 21:34, Krzysztof Kozlowski wrote:
>> Commit f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes") re-used
>> amd,imageon compatible for the SM8150 just to enable headless mode due
>> to missing display controller nodes.  This work-around was later
>> narrowed to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts:
>> qcom: sm8150: Don't start Adreno in headless mode").
>>
>> This was not a correct solution, because the Qualcomm SM8150 SoC does
>> not have an AMD GPU and the SM8150 MTP board does not have magically
>> different GPU than SM8150 SoC.
>>
>> Rely on board compatible to achieve the same in a Devicetree-correct
>> way.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
> Let's just forget this exists, this was a hack from the start and not
> a very necessary one given display bringup followed soon..
> 

This will affect SM8150-MTP, but I don't mind. This patch can be just
ignored and only the second patch - DTS - picked up via Qcom soc.

Best regards,
Krzysztof


