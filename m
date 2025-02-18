Return-Path: <linux-arm-msm+bounces-48333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FEA3980C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81929165AE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867B31474D3;
	Tue, 18 Feb 2025 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udnJrxeM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C56198E81
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739873016; cv=none; b=BvZ5d9s1zN/N1haXo0pybJN0GVmfI195NHEXNFPdRrsuVN/0ZpWL71LOYqNZMe60DtWspGQ8Gk9UFrCvz5WixuuQ+pj36reZUCIfn5YX4kVw0IQZl316iK4Z/mgkp4l10YH8zeTajKDIBgEPmh04RdNYbN/SKs98Jb1UIu3R/nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739873016; c=relaxed/simple;
	bh=tG01GpOvm5kiLC9H8cAk72hOolKmbeeUhqUVNNOh5WM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVDF+pBjMdYT0E/5LR7cZrzoJBJuunQM4Ut8mxqoLli9dDGm0xzD3EZG4PzGRr5VrYLm0KDL97qQEp6A3DZsJgT07mHTe6WpNWNwnkqFNh4yok8fpoqf2lZMrRKtDH9HHV88NJl+7Ls8CqQODTfvIFJs3Q9MDpTCmk61Pd24Zxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udnJrxeM; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f22fe889aso4114248f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739873012; x=1740477812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
        b=udnJrxeMP6hBIsnGNR0uKmY9EXC62slG/fHDWQDz6lKgF/qyGzN1S1OsizPO2zXQ+f
         OIKfnBlhMFN1seChZMO6ICkpMnmVj6VOIDuajXzGP3cPjMBajuOEG3qsPTc+Vf3KOXkg
         VqALC1vSjqbsRKvsE6i8FX7pJH0ca+l3ivebQi7m7Ag5T0QFWrfmz5tD5WkWgMldrjZz
         ZdrgJqISpv+NRFFYGIH58d4YsSc7/MZ9coj5Bh9FowA2YPwh/IyJQbRuIWM+nDEmlrof
         a2UhYkDkyBkvwsUFSOFbFAy7/l8G2hpkyNhy3UN/7JbG72tr1zN3P0zjHoLA2p6yozsl
         ZA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739873012; x=1740477812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0839DbdluWzWpmaiM9EB2MAfOdwxjWy1MJ5estDULzs=;
        b=D1gxoPXMfgg8FTSItPoaKrL/eQaKz9EYfevDkihl0Plg0cQVBTTSCK7nKdgnzsiGap
         tD0ET5PgcO+pi6JmMQHM5dt59QxkprZEetB/GDaRau0i+VxanNSvfxCpIxCKkEpdHvF+
         pPp17kDsADQy6El4rgdtXXdX8d3xipvSsDNyEE93rSTtus2sLN8gCpKRjdoSm/Uo0uwI
         1rRbBLOsFwfLbFJJoPpsTUa9ZclF9Bi3q6zrksf9dnO2PidcHQ+N34NxuXfYtCwMop//
         utp+rOYJKXWvD2QB1gWfcZ5PVaC3u0Ea5tYC46iNKgpFyGeV/jC+VAOLPSA8VXofKtOL
         Y1Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUPnDoBW7uNy4XYb1s+m3PPWndSiu9nXh/8mNrVWrmmSHU3bLZ9Thp4KFlBnyBXLDBiY7YayOssSjHML9Of@vger.kernel.org
X-Gm-Message-State: AOJu0YzvAudrerKiR5kWUnt8+i2R3kjUfMDZ+L+M6gYICuGAgU1JbglB
	YVkdoNAwE22uBFmSdx8wTpOcZOvE4C7OwCAPVeNhOuRwCCm14jnfY55lT/G7KgM=
X-Gm-Gg: ASbGncutw26gMTrbF45DrDt7jtyUQf3bdZ4eKJ4qiHIBYPJn32EFAJcPB303wZPGnFD
	W9wCnVLWvX4xGiNJfW7E3v4Atf4uywOlftMNTA6pjpY6PEnr7jiTHBeSCFjJgkc+KMeXbylayiZ
	bGppsWARkNDMTo3kO9OEGcdJTc2oA5rrztYzZDVKr+J6RaGV7ZrYxyaskEgrJlVVnfP0h/+VJeP
	zd8BtyDj0p4Oeg0dBvg5rRl9xNFD99hmDWRZPmh8hvZKA4v+TS3ocerhyFJ4yaaPg/jvUtXeffi
	KQDlqrlvDs5t/ReWAJojbGnt+w==
X-Google-Smtp-Source: AGHT+IGWbXagYwqDWRSF8X9rCootz68CXEnP/Ij/n5wLMpuiaoorUGPClGjqgWRNOLdoR1bU27EBOQ==
X-Received: by 2002:a5d:64cc:0:b0:38f:4fcf:d295 with SMTP id ffacd0b85a97d-38f4fcfd742mr3216642f8f.29.1739873012294;
        Tue, 18 Feb 2025 02:03:32 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbe0sm14730522f8f.39.2025.02.18.02.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 02:03:31 -0800 (PST)
Message-ID: <9adf9f13-128d-4ef0-ae31-4db4d295e2fe@linaro.org>
Date: Tue, 18 Feb 2025 10:03:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/7] Coresight: Use coresight_etm_get_trace_id() in
 traceid_show()
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
 <20250217093024.1133096-4-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250217093024.1133096-4-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/02/2025 9:30 am, Jie Gan wrote:
> From: James Clark <james.clark@linaro.org>
> 
> Use the new API, coresight_etm_get_trace_id, to read the traceid of the ETM
> device when call traceid_show via sysfs node.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 3 +--
>   drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> index 68c644be9813..b9006451f515 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
> @@ -1190,10 +1190,9 @@ static DEVICE_ATTR_RO(cpu);
>   static ssize_t traceid_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {
> -	int trace_id;
>   	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index c767f8ae4cf1..e5216c0f60da 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -4,6 +4,7 @@
>    * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
>    */
>   
> +#include <linux/coresight.h>
>   #include <linux/pid_namespace.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/sysfs.h>
> @@ -2402,10 +2403,9 @@ static ssize_t trctraceid_show(struct device *dev,
>   			       struct device_attribute *attr,
>   			       char *buf)
>   {
> -	int trace_id;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
>   
> -	trace_id = etm4_read_alloc_trace_id(drvdata);
>   	if (trace_id < 0)
>   		return trace_id;
>   

Reviewed-by: James Clark <james.clark@linaro.org>


