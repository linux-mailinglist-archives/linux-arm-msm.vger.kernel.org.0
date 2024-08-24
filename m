Return-Path: <linux-arm-msm+bounces-29436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC495DDD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 14:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617892833E6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 12:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB361684AC;
	Sat, 24 Aug 2024 12:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xe4Vi/x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1484E18
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724503174; cv=none; b=GRkVndRwAOJp57dgsechlo6k25R4Vi2TYzlFLfe6d2RS49NU5aEeBsaQYezb/wU2QRLAVFHQDI/c9xLBfJn3j0iCS017FG+2PuiM8uepkCAw3p/PBL+7Bkx8NDrCmksuxhfn7n6k+hepS40hYXSBAjDfI/y/ECS21eO9f7lZlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724503174; c=relaxed/simple;
	bh=tLKhk1Dqeuga5vFcKBXlbtIF9boLPuTez0DrzUJ4LHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6y51zheamFpgOkiKMXYZJgxI3xHmQWAmDkkV+emJyCiXucBo84nVR51EPD4VqiSPMrwEguTq5EaBuwh/h2dq4fnZllYzUbMvQEqds04XjBA3ytaV9wq1BB4HDbN3mERXTUQfcdBnSlmlrb/FqN9xE1nThzGTarzZReMs/xnDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xe4Vi/x9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53341decf9aso255372e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724503171; x=1725107971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+WLovWuG5O/h+JKAhAP+8wr80DuIP20L0AXJGC3LYsE=;
        b=xe4Vi/x9rmV/Ta/j7bAWE8m7BcMDu4WU7Fd89FaLC7S+doSyplx9o48VLTx3+7G1uS
         Gb88qZyAqeDEztmnGCQdxY1vlsmc1/sTN6RZieqw5fkINYKBK6pvpuQvdURIr0N81ps6
         AxF0Aw5c6XyIQgkclNrLgYX1p6pWARuSNVW9MVt3A8R1otB6r3sJv6/PmdLYcPB5OeJN
         DiqTbYu6egotYhe2yXl/BGceDYZQ3lfraLQG9KNz/BdlO7G9hn6WZa1hqFaaiOjjZM0S
         6e1rZdzxK76zri/3RWDAx39ZxNyK+b/Px/WBAVKlIXw6zsxozlpOlR1HZSQTxsgg6JUy
         nevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724503171; x=1725107971;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+WLovWuG5O/h+JKAhAP+8wr80DuIP20L0AXJGC3LYsE=;
        b=mWdP6cZCtpbasPxqqLAGoTG+C7IsSvWcvS8NxYiBs/UrXUyiU2UzieZBgjPYj7l6aF
         saaJeWiymJoKJiljtw2Oe8eMa+6xTqhPSzqTNb+fOFt2/5uAhO9Wcd4iOSAd+OWNcXs0
         Yuq4AVpVCsArksqrVBEfbwd8fhuHhBE/4NPybHYOHj6fE62EKt9fBEILWg1unNYvFBek
         bqJZ1QgnAuT+Z1FCPRukXuc903noRRGtSrxWTezZb3G1IEfT1IOhOlbqAiUybWordnXf
         yGwetEVRbWyuWO99fjePunrpxWCviAcs1eYkHjTj3xCqP3/lNsJa0WCJbTxc++xCeucW
         5XwA==
X-Forwarded-Encrypted: i=1; AJvYcCV7nKz9TWeoM8Ax4hkOE/a8HTqCmVpuHz3OCyDZCj7jGMPvp124cQUZK3WTKzLosrzopc0K4AbSJZs7HkZU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/oAgZ0uGhk/vuJEqOEjUdtIpHwAvep5yrrMMVhm6G0Vwmgo7S
	ddl3Kf11oSCruarvbdW7LF+miYnGAdefjX93kckjN0BrWx/isjRfT4FRB1c7mfiKaSUM4Sfw1wA
	0Cas=
X-Google-Smtp-Source: AGHT+IE4GIGaXz6BRUFNUv+C4Yrnd1n3+Fx/NV7fdrXl7wd8p0uXcV/bVCCZ0xBRXLY/kqKV1HVMNg==
X-Received: by 2002:a05:6512:3195:b0:52e:93d9:8f39 with SMTP id 2adb3069b0e04-53438773ee8mr1773985e87.3.1724503170335;
        Sat, 24 Aug 2024 05:39:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334eda9a17sm825942e87.304.2024.08.24.05.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 05:39:30 -0700 (PDT)
Message-ID: <6c16ca04-2ac3-48be-ba84-579166de0369@linaro.org>
Date: Sat, 24 Aug 2024 15:39:15 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: Stop complaining about DT set clock rate
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, mailingradian@gmail.com,
 loic.poulain@linaro.org, rfoss@kernel.org
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <Zske2ptZAV12YLyf@radian>
 <20240824115900.40702-1-bryan.odonoghue@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240824115900.40702-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/24 14:59, Bryan O'Donoghue wrote:
> It is common practice in the downstream and upstream CCI dt to set CCI
> clock rates to 19.2 MHz. It appears to be fairly common for initial code to
> set the CCI clock rate to 37.5 MHz.
> 
> Applying the widely used CCI clock rates from downstream ought not to cause
> warning messages in the upstream kernel where our general policy is to
> usually copy downstream hardware clock rates across the range of Qualcomm
> drivers.
> 
> Drop the warning it is pervasive across CAMSS users but doesn't add any
> information or warrant any changes to the DT to align the DT clock rate to
> the bootloader clock rate.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

