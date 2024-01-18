Return-Path: <linux-arm-msm+bounces-7566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB59831E84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B87AB2517D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187772D043;
	Thu, 18 Jan 2024 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yW+3rUO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641292D045
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599439; cv=none; b=mVx6vk2aECFWYmBD2jne0tcTvlpntQLZUUfCOxXYdCdQwiRbkfOPOZDPnP97EC6p0digmB0Yz1OsWxiqobwceEU82/XfTYHrnP7y9/Tc/QYrr64qLdNbVl87BF9HVk8CGRgqrWHwHmYQ3CpOmcDgN4PCQJOd6mjdsoy77hjWsxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599439; c=relaxed/simple;
	bh=2jGDqLdUJOPCkNvqsu267cOv5QZ3G9DG8w19z/0/g3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type; b=FH+aqFYBu8J2vYHFEgtTIM1nQFmVkt8iHJ49J469zWrPNCA1Hs0ewQ7kW6+Q+wdSEu+tA3QjGz3Gwetr2fcBXubn58DFCAp/J5NYLJo5GVxi2Gsek1CLzWx6iAVmI/q9GwBQvmrFm32/VcwibOwixAh5/6QB8vEAgBD80cZoAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yW+3rUO0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso1621104e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705599435; x=1706204235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jGDqLdUJOPCkNvqsu267cOv5QZ3G9DG8w19z/0/g3I=;
        b=yW+3rUO0b/kWpUW8TmddzBoZD1sTIVyU15k2dRhlEG3741PdcGwmpfQrybYY8MlKcS
         hcMUEb5goyjlbcOBLbjAUJjHwvc46y2NL1iNmVLAIyk1Gq+IH0MQgp5K1BfRWIIlVsgv
         6ueu1fC9/Spwlo+5EOug9i2kNRVYh851Ai63xsgBhXmonhWgKrFRZs4rc80rfWKYhN4I
         qYP+MLwHR4da5pJi/zOQK79vulfklCitXASE3AnTFiebjy06r+aNf+9D0sHqdTYpSHz7
         h1iPRmI/XA2jWrsLXRjzDRV3TNYXvO0hrwHFoOy1rmy1zJR0IDsq3QZObW+y1e8Y0AoQ
         bMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599435; x=1706204235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jGDqLdUJOPCkNvqsu267cOv5QZ3G9DG8w19z/0/g3I=;
        b=rHtSf8gBCLq6ohMsatkBHXg2EKSJAVbaQCOVJnIrlyUeJE02n7AhA6S0Zyf9dXFSvG
         tOmsAUgOQOZHz2kpiXH5/FP6hTTYu8oXa98j5uf0dcE5cO6u/3NrioYjPofnsmUNQI07
         WmrSKTu0LCYIQAS6ezVWUCvD9EzzFK63v+IfNDX8jQ6iWSJYBr1yF0L2rRJQtVKUibCQ
         0VCzhLDWVDoMSlI47XMiZxXvtzL9JRhf+65ZpvyGsT6gVnHtAzA0gRpO1yUr6abgNPlP
         0Uj2E1jMMSX9pebr5zb2XxUy9UxETjgn+9XlOrSCbIuLqz8esp9JTvPuYcYT1Ne1h0KL
         ch7A==
X-Gm-Message-State: AOJu0Yxj0nHEu7ZHf+V0rybEPnR8PwH0HF59JGoka1e7geVfjaG+Fy++
	jQbPs6MlBbie1IO0pZHLUxVWNGx1nU1bTqcHqwW7j9B8ZjizgzxdVvPDr0Njv+U=
X-Google-Smtp-Source: AGHT+IHl+sLsbQYRyuimEpAb8RPwn8Uqmdgm1jCaA7wDjJWzDskiqJTFj2MSm5Bac+koRPGeOlZT8w==
X-Received: by 2002:a05:6512:292:b0:50e:7f0c:7915 with SMTP id j18-20020a056512029200b0050e7f0c7915mr810591lfp.136.1705599435347;
        Thu, 18 Jan 2024 09:37:15 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z6-20020a19f706000000b0050e8d5504e1sm711831lfe.294.2024.01.18.09.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:37:14 -0800 (PST)
Message-ID: <9b854728-7080-4794-bcde-131788683992@linaro.org>
Date: Thu, 18 Jan 2024 18:37:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: socinfo: rename PM2250 to PM4125
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240114-pm2250-pm4125-rename-v1-0-71a0a103c3d5@linaro.org>
 <20240114-pm2250-pm4125-rename-v1-1-71a0a103c3d5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240114-pm2250-pm4125-rename-v1-1-71a0a103c3d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/14/24 18:42, Dmitry Baryshkov wrote:
> According to all the documentation there is no such thing as PM2250, it

According to some documentation, there is such a thing.. But the vast
majority of it does in fact call it PM4125. So I'm willing to bet that
the PM2250 was just a needless rename for RB1..

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

