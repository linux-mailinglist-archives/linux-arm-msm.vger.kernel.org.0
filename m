Return-Path: <linux-arm-msm+bounces-20410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FE8CE839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C82B41F22E4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB2C12C49F;
	Fri, 24 May 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3RI9Fpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A08624E
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716565636; cv=none; b=ATeNmjgrLjCtYdhD5hGgc8nVH4QPfVaVGt8KJBnK9JRo0Np+UB+Pql+DL5wHpINAQQV/Vfa2RzxY5U7HLIkq4nlnUdssurc1jEUuabfRwH8U7M1Ytd0AhhFBLeHWlYUgl6uJVEHjc02B89QMWralg1E4Y7F3HTO8tIqY19VSuQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716565636; c=relaxed/simple;
	bh=EnOj1qPNYm6Qp6vIdhUvtHMsFWp5es+6suCXSExwaN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUlLZFPLwL1YFIUi5yEJ77qUrxncQojlrv4r5E5tfTtbqmdjMsTKDyTcNktOeAuVzAXhkCtCZbn1c1k/juuuW6WpL4wRrrHQOuovk39v6ZjLoljNSprMVfYHQ6kKPAFlpKr/MccMel/LNJdHHIGbXCM4aFmg3f3Db3Wf3JXHWbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3RI9Fpo; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5295dadce7fso1393879e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716565633; x=1717170433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zDxQpTAQyRSkYHCAJKqE3JYlXjz0/SyGazoePb1uwk0=;
        b=I3RI9Fpo78tZMr+YU9zL6dit+eZ5wPZu6gut6FMx9gHezmnfB+OULQ6wWFuP2xTGr2
         qeOzCNEHT/V5K2JCqWFm8u73h/ynjx7cu4hxHA/tMOOHURDmPzCHyMVYkGMsKruIMeSR
         H2hAEsnnBlDaTUu3Y3BkoJedQgMlHMlbMXZGJ4LW5z17dZ+j9VsY7OlZcAhRdJdgxUtH
         Nk4yvi+Q1yhQiRwEHM68IqgSi+723r0UaPAF5Dc28bJOQaOZnazILW+6DFPtmcXyy29d
         7mNFRdVdBcH8duvg2f19gDiyU3//q9kkSaplRk4bZ0ZUCwAdMgsxwyLwi84mMLAoi7/l
         CAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716565633; x=1717170433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDxQpTAQyRSkYHCAJKqE3JYlXjz0/SyGazoePb1uwk0=;
        b=H9IBBi6HxzBBs8ynSs557UrjBHrhPnjyuMxf561rF7Q4xdVPLYNxllDnods/V4kPcg
         79Dz/GapdBEHwQfzSKybGPxWNQVR9ikVk0Ma378i/ZD4KnRKTMVwS2c42HUZTBzUIysn
         9hB2JqJvTWJmJnc7bcG+UIl5rrQPDn2K0DClv+k+o5xeXQnggss3M8K4ti6+VvXJ6YJA
         a0m5qXLaSj+JpbRzpH9C9V3jntAT/MHfXoi2WSUcBcRV0q26PJxE268xlogRVh9i222v
         QCpIJDAzjxmZmbpJFCp7dddbKqmrReHpw58oqatNAL/hz82iL+MqPgRU/TMV8qm0FYBr
         YX7A==
X-Gm-Message-State: AOJu0YyWq3rEb4kjKXck/e0mwCFmBJaSy6oLsMCx7ecyf4MGN4Xn9ooO
	6Nm2R93RbivGOdWTRnQHDYqGocG5c8TuSlMLJMUxlsR2kZIY0RwkrxYntPVQ8+A=
X-Google-Smtp-Source: AGHT+IF2879xCNFTdfdIMHlUGTagVyUpwRQhrRmyIOQrixK0gFbI5FU/znB3cEcXb5UfGWB7LXY/Sw==
X-Received: by 2002:a05:6512:2826:b0:51b:5490:1b3a with SMTP id 2adb3069b0e04-529663e625cmr2734010e87.53.1716565632760;
        Fri, 24 May 2024 08:47:12 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda8481sm146170966b.213.2024.05.24.08.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 08:47:12 -0700 (PDT)
Message-ID: <6efefca9-a147-445f-b3e2-ad7c7aa4e560@linaro.org>
Date: Fri, 24 May 2024 17:47:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: uefisecapp: Allow on X1E devices
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240523-x1e-efivarfs-v1-1-5d986265b8e4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240523-x1e-efivarfs-v1-1-5d986265b8e4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 5:28 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> As with previous platforms, qseecom and the uefisecapp provides access
> to EFI variables. Add X1E CRD and QCP devices to the allowlist.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> Only tested on CRD
> ---

The QCP is happy too

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

