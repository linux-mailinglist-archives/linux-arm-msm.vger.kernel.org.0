Return-Path: <linux-arm-msm+bounces-12664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F04868D14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:12:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141721F24962
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 10:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2E56137C5F;
	Tue, 27 Feb 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kB89Gxti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51C137C2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 10:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709028766; cv=none; b=DpUBiH8nG9+cW+vSZV8EYXfOk/7z/Vpu8tvJfisuNa83wR3mJ3BYeWJoPVOIw5NmQH0hOfbhkA1aID/jLpYEmLvKEWgd+LsbbjipmNCXZ8sThwOG90tLeCDLc5Z+ITq9oic6Dijcdkg/uNjwv9tQ5GvUW7BV125MEOr5qJy4ku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709028766; c=relaxed/simple;
	bh=RPCuL5Zw1DFBhHuejMGcZGxtCQR3v1sWQkrzuFlOItw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQD5+qM1Lj3D//0Za64tf5ZlhlksBZht0YH+zbDP5bWk4RL9MNs3N4aPGTxjof/m9JBxc0FwKZpcabe9xCfcjMzqMRysMIZkBEcWfnxHOBVdwIpAUgwW2lbNJTaADfEHFxBQhqN2cpC2vCX0I6dSFQOxXr+pZ205Br0c9P6CclU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kB89Gxti; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512fe342841so1598516e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 02:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709028763; x=1709633563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdcTuKOvy0EUhMzr/avSzwKVXZwTIOQgOR4V6+G/+Rk=;
        b=kB89Gxtic681XuWzwVRiaaSR5JV8/Qh2YIUtDwLeVvGUBCgYgCZ//l9iHV28/FaGyK
         wlLB61x0NGBDbnOaDyRd486jCLFfRX4cxHpsgt6qzC+MttknQMEUbY91AFLtbikTOrYI
         EXXldOwRk67Jj4PTBp7vd1VMNrmqmGyy6BwGdWxqDaLogzQXlDyFvKlbQ8HqVL9Xg6N+
         5QUesUgq7ycp6M3gKV5CrKzNuTmNXc40J8AGdjBd3KgY4RuVVk/J2HlRIolpPLpu/a9/
         OWvAZRdEn6lP/7M8C4syQV9AJ7a/dS/PJW3tC4MYfV6EXK2x/O7zktC2EQCA7hNIQbYO
         86xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709028763; x=1709633563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdcTuKOvy0EUhMzr/avSzwKVXZwTIOQgOR4V6+G/+Rk=;
        b=BWY9rKpM2bgALpdb93vWkMKxox1csjV5T79Lub3bEQ6Z6AnfY3VCoaYEeeGGZ5ILCh
         xbtWYw9GzO3N+pk1bB9ui9yYN+QzI+YOMwrhOGqcTcXA5ifW7XpqzKFr1WIqxAP5oBYm
         uZOzgNtuUo5rha/V1OMLB7TLWNHzPDRpXQwTOzPttxullDXD0sEuiDN8+TrFr7xkjW1D
         rRdTwmhN/i0WzqzttM5T0WuPF/YC2DU/5KRKM/KkZgSgBbptFHUk0ynVRHt7ht0/thyh
         rRJ4B6jxobWtYn38GX+48gSPgqsC2m5MkUyvBxGfSiDBS5szLyYgNwhOwdOT7TBed4ZE
         zBJw==
X-Forwarded-Encrypted: i=1; AJvYcCWh4WWiVufsFHSmlJ+eT8mQPEfp4MmN8NczDQ9xmI/RAMi8BDoKNvY3Avl+1tUGK+vMSo52cTlag99y0qTphq4GlQuuhRGAKUUKSvzgPg==
X-Gm-Message-State: AOJu0YzeeJLRFkVHVlCKHJdBw/wtL7thsJ3Pd9pxZNQvv+qEHohiZQMW
	qpGpb3JPPNWQWZSOKcNuRI43zPwyHOxCZ9DV0yoLRKKzC/gbxr3eH7DWqKNdlu8=
X-Google-Smtp-Source: AGHT+IEuX+LAvgGR0dujrY6Se1xlvX+40UrwavICTj8b1/cNQL1xPoiOn1bdI5jJdrL4sEXbMeapyQ==
X-Received: by 2002:a05:6512:11cf:b0:512:f389:d6e0 with SMTP id h15-20020a05651211cf00b00512f389d6e0mr2702097lfr.4.1709028763072;
        Tue, 27 Feb 2024 02:12:43 -0800 (PST)
Received: from [172.30.204.241] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x18-20020ac24892000000b005128d0e2a07sm1136919lfc.308.2024.02.27.02.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:12:42 -0800 (PST)
Message-ID: <f5b373cf-79fb-4d62-9d3f-9a9ffbfb5d8a@linaro.org>
Date: Tue, 27 Feb 2024 11:12:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] A702 support
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240227101055.GA13753@willie-the-truck>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240227101055.GA13753@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/27/24 11:10, Will Deacon wrote:
> On Fri, Feb 23, 2024 at 10:21:36PM +0100, Konrad Dybcio wrote:
>> Bit of a megaseries, bunched together for your testing convenience..
>> Needs mesa!27665 [1] on the userland part, kmscube happily spins.
>>
>> I'm feeling quite lukewarm about the memory barriers in patch 3..
>>
>> Patch 1 for Will/smmu, 5-6 for drm/msm, rest for qcom
> 
> I'm guessing you don't really expect me to take the clock bindings?!

Sorry, I didn't remove this hunk from v1 (where it was smmu changes
that you already took)!

Konrad

