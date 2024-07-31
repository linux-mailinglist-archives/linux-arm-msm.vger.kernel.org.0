Return-Path: <linux-arm-msm+bounces-27594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C47943960
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3092FB22F92
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 23:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB58516D9AA;
	Wed, 31 Jul 2024 23:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bovWnuJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A016CD0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722468491; cv=none; b=T8mD1Yo60IzJXbGfX6AGVYIPYL5bGS/vnrJFtAPr0YQyD7JOkw627FYLseCjEXAnZNMyHvTgv7DEGr+tGKlOI9QRwUw6JyJz2AzMJg+Hcv8BtYOuX9jdhxGKd1D+E4ETCB1FOTxnl3uGHRX8GRtTwd3RyT/LcBcOoFC2UNLF76Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722468491; c=relaxed/simple;
	bh=d6AdsipEk4MLXXiJKWtkXUBzwbCvfSMjpdsOlyih8do=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5qfDI5HSxA3MV31NsWvomszryYXPFD0XyPlfGhcRTqiYh4xTsYdGlw90YiVSxu5G2jdH87qHmL9t3x44ARL60xDbeNqjWbz1lUXSjUW886cIts2R3foc7KIdV/HF4FOdawWeLIrKfQ4yeSIxRZxql0hZjRQq8U/xgWT4VFQIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bovWnuJ3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f015ea784so1044120e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722468488; x=1723073288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqHZocMKxa/Ko3Sh++uN9uzIJCUlsYXXKu9+HbfCVaU=;
        b=bovWnuJ3vZyq8Ub/XiRUeIjzciYuh84UqnqVB6vo3eDAY7o5w+ZFL+M8CIV2YeSxHB
         ghbYTKSawcFzwBlCQa9bam9kyU8Ih+fkCjNpl8cFn/jJKFTf77OpaLjQZAEQr5ikl+lp
         cQmUqFjGWh8EZqoq/XJtUMrBCptcLAFAC8IojUM7raH1Yw4i+fEJieNaVtORIDHAMiz/
         pINUEjQqe2o2bi+thvm2o3JzUqVHcB+iVYcv3AnYSuPDzMzGBVBZGBfiUTkpsY0/zpKT
         R7sdfnpydgXLJH7AMG+0xyKQA3BbbQnIxlxO12coKnM/3B2IxJVAOKmE0rd228q1qGxA
         0POg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722468488; x=1723073288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqHZocMKxa/Ko3Sh++uN9uzIJCUlsYXXKu9+HbfCVaU=;
        b=XSJgbIoPGfsoeTPWAaTwQp4/p9Z5dYmDDJCbRKQ6lQhCPx3eyc3Vv3IMx/7at+AK67
         FHzLk61lxLRvQyZnAwrMn3VFFmGAWmvJn2nye1EiJoj9jCtSJFXY/XuLXNkaUITgkqCA
         m8Auw1U3OunXIO5zBJRNEdwYpSFQjAjgf7bleQw8RSRZbPL/F+DInkgy1Jf3K1rC36pD
         FyNo0nL4Ek1KAUxoc0tEbpHKgeEKC45ajURw0Hvx1jiEubq5H4u05k+TufEsh9Lcximu
         CvIT78W4xJurg6C2S8iEQC2gLL3/V59tKZ0HgIptHEkD87PEFdRhGPHWGsBdCIpg/ZvQ
         v+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVx1FjK7sMkZk7lGRSsXDMLNwbxIEyTF4mKKotFNY05TK7xcDn9Vmq726jy2QAr+hS8KB9LtBxshxPAG6Cm+KpPzN56wF3MV4N8l1MoFQ==
X-Gm-Message-State: AOJu0YzKoKWcnh0IksEMWLajivqHgcxZa7z9D3222rAC/MFhgts03B1t
	RoYC4SNHtHYohUCXO9IV0Vv2QFOaPOBzxzUqGJZF7kP/F0RTC4sxEayexrPewfA=
X-Google-Smtp-Source: AGHT+IEVnR6j3jFdtxUJKU/Jgck8FoyZtrhc91nFNQC6ya9loWcYJtZmkKE5MgCmxbWf3QzYhLwxmw==
X-Received: by 2002:a05:6512:ba3:b0:52f:e5:3765 with SMTP id 2adb3069b0e04-530b61f6825mr144386e87.6.1722468488246;
        Wed, 31 Jul 2024 16:28:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5bd12b4sm2401016e87.102.2024.07.31.16.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:28:07 -0700 (PDT)
Message-ID: <e051ad29-fc96-4d6c-9e4c-be46feb189ce@linaro.org>
Date: Thu, 1 Aug 2024 02:28:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] media: qcom: camss: csiphy-3ph: Rename struct
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-4-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240709160656.31146-4-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/24 19:06, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> The existing structure captures the configuration of CSIPHY lane registers.
> Rename to struct csiphy_lane_regs to reflect.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

