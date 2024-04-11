Return-Path: <linux-arm-msm+bounces-17289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8CB8A201D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 22:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F158B2352A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD8E18030;
	Thu, 11 Apr 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HEPP92Ch"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CA17C7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 20:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712867054; cv=none; b=T+Nv9Ks7TVDoERzgyBFCfX2c00O+eaNr0UM4g33VllQ8WWvS4bFuZLp4uavuJ+9H6C9Guo1KAf1SvS30p4YjgKbyBQkR7w+27kkYVv9ieaE78ROUdlyWXSo43SVmCCuyJ80TZ6VJ6uUzbV/SOxywX/+DMz7OdQwhFHL/9/N2uRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712867054; c=relaxed/simple;
	bh=QqxmKREBd98R95lxy1BDt4/C4X/1ZCgWeLkeabMbOEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GD1TMsJX2tSKYeT75qvmrxvf0ZswmRdJw0hj5wkLlRF9D1DLuzluecsEYCzvLGZ7gu0RnHJf0myLgxUXkHPLzLMJE/NbbMj4O+qnyvlQ0641NsdqtS+NSRe2uWPB4Pc/J5E4ETGvBhkXgvYo+83+yxnXkEkYtBJ8/RCjDGEr3i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HEPP92Ch; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d82713f473so2647601fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712867051; x=1713471851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OkivZAy8vHp+8K7Um26GAxu/l7QEtqH2ogeAPyc9feU=;
        b=HEPP92ChPg4pOcong9yW0dsFZyHT0Pau2psj7nyeyyH7dnFsQGY4Y0h8klNpaIPMFr
         uB1oCbuOnyZ/QQu4ltfgALX6pNC/G7Sh7z4twNAlZx5wIuoBbSrdqdKIvmQhq9z2R/MR
         +FdaocwAISbH14MZQHBHxIID+chGKo2W6UFwVVXucOu/C0yWXPd6Tj7d5i2BiTvRC4KB
         IoZDWRlpLYoB0ofPYmPPsq1I4GdWCbBCjy6ks9KT9nC/gLQLaIxMvfJ8GIC4L6GNC5fe
         SLIDs3RhnrOGijK63uTkIC1GZDTBu8UFn+Chy0WQaEBxiXSZnTzCpUSL5RZMFni0CcYG
         h9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712867051; x=1713471851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkivZAy8vHp+8K7Um26GAxu/l7QEtqH2ogeAPyc9feU=;
        b=r5GcVR/xIzH/s1yfiN5xowogCc0yiEA4NF+ZTMWeBdFEs9nsJV/hbFfMzMuc3+1Gyr
         qdiWestjZKmfLsRYQv8ofv3gyXnJFUIC8/1KX5CAdPVooEijlL9aqnOQ/fdlhDZntU0o
         auyWXtMsLRQT6Ax883A3KbZ5UGXNLgJF1wYHk6gyDro1S6awtiD7B6pyu6vZ6Y6DxVHj
         OcbrJborXaa3zU5EmLsHE5QuwjC7/xX8+/+XEywRfjMaSTJuXFleFqlu5b1ZvvOA1KlR
         xreeJHs/ybz29mnnJ+QIDzMfsSxs2GoQ4rB5xBw+FHEjyV1HLERhFlImHWnc8g06/1Io
         SR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/AqGupe7+DN36JHdu6Ymf9Wkl0vlI2WC7SqU4S8039e/DkWspR1EaWk9zZhNEXEDM0jEPuACyk/VsbIvx/yPJrSci2E/DqlBov/QePg==
X-Gm-Message-State: AOJu0Yy1LRoFA02hH11202nJ2jKndYX2ALAiJHQidGlrGR3fF53XxDws
	V7xO1CNhUVWSHmt0pqaYuEbUSBP+bjEXAxF7yuQWs0JYCJQSRYQMF+KgU/jadqo=
X-Google-Smtp-Source: AGHT+IFmKV1cZUNf2RDPXfgrp5jM/80Z18N3yhtpLtRxKHZ1VDKWNvDrx521CSjJRJIGHFCmxXfoWA==
X-Received: by 2002:a2e:7d15:0:b0:2d4:49d1:38e with SMTP id y21-20020a2e7d15000000b002d449d1038emr508466ljc.28.1712867050958;
        Thu, 11 Apr 2024 13:24:10 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f24-20020a2e6a18000000b002d4295d8563sm291115ljc.62.2024.04.11.13.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 13:24:10 -0700 (PDT)
Message-ID: <bbec514f-9672-4e5a-bd83-20ab59b3dcd9@linaro.org>
Date: Thu, 11 Apr 2024 22:24:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
 <20240410132510649-0700.eberman@hu-eberman-lv.qualcomm.com>
 <2c2bca6c-b429-4cef-b63a-ee3bd6c9eecb@linaro.org>
 <20240411130802689-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240411130802689-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/11/24 22:09, Elliot Berman wrote:
> On Thu, Apr 11, 2024 at 10:05:30PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/11/24 20:55, Elliot Berman wrote:
>>> On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
>>>> In preparation for parsing the chip "feature code" (FC) and "product
>>>> code" (PC) (essentially the parameters that let us conclusively
>>>> characterize the sillicon we're running on, including various speed
>>>> bins), move the socinfo version defines to the public header and
>>>> include some more FC/PC defines.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---

[...]

> 
> 0xf is the last one.

One more question, are the "internal/external feature codes" referring to
internality/externality of the chips (i.e. "are they QC-lab-only engineering
samples), or what else does that represent?

Konrad

