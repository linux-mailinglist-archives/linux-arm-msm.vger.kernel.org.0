Return-Path: <linux-arm-msm+bounces-8171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3B83B59C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 00:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CCB91C2321F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 23:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C943136664;
	Wed, 24 Jan 2024 23:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hzuOPRo4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD1C86157
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706139326; cv=none; b=FYeX9kzs4IUKDoz7jFdR3Fpzx+sWPLtZxhYQpfCKfL3nz+K6i2pSmBAi8oMFG+0BISDXueTcOgpJdGYrw3XSgkY1ur1OouiapbMEVwXb+FirjEhhuIHFcjqZpZptnmFUZsAbqYhckv8S7oiKAnFHlW2T4YP5dAT8TaN+WsqN+20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706139326; c=relaxed/simple;
	bh=pLOxL3uGdu3PEt3PgpGpSLPDrGG85JqWleyeZmTGcXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ue7PrwbuK3wwQUWQiX3nZ2XmliNErga2ubYWdicdaAmJyd9tF3/HrqwUrp00QnomOlfzZM7E3UCmo12NgCX0N39UkQuaKLQMthOk5azF0Ol6dJb8ZCx/gEQMvMN6xvEuZBKhwQVaEnMRtlQwa3IFd1mt/KoaOlSXnb1Kxo5Jdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hzuOPRo4; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cf1c3b23aeso1861921fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 15:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706139322; x=1706744122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qe/DnSocfVSs8fWiqOrlmqzT+M3JYs+S/nJyZuNxraM=;
        b=hzuOPRo4I9F89b35ypvRbHQWNiHyq46re6KUhwZuYQNG34EfYxX71MEPCpt1WXD2QD
         5nQgQM0oRmCevc2vQPmCvSo4XNXGj6qMpHxUVuVzq1ljsggzUDg+6Aq0MJZyZh2p2F3S
         xJDMN2RSOSwo8uAWU01Wftn0OqyuQSDq0JXu0teEqLDfMTWkTqRxxwsCkFSZWXyEIoES
         U8HE1OE4gB+7bstLTL90anQW9Fy4giNFkCrA4ZXZ0d9PSn0ncvl8m/E7kuAYawsYO8zX
         tztNXcCUR4tabCJm/G/JwJEe4SpudREo0M0j1YcNtjM4fGput/J9IVIetfUutP3RKXuz
         iytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706139322; x=1706744122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe/DnSocfVSs8fWiqOrlmqzT+M3JYs+S/nJyZuNxraM=;
        b=SMVEnzXasfbOYqf/X+p4Fxnjpwy7h3BmrBmQ5FYoSPxYcVThZ0tIVyZGC+41hMrYcy
         hEhoMxQdUXxAzDbGFq2tj9l6t6xbufRnAlR//PICEAHym33ljmMyQeof/uM91HB/cDoh
         aHW+5SWA6r7DdE5VhmAYHiLegzbPsJXsCfIBe+85d0SD0GZ8DO3LS9iBuquJImp57SjC
         Pj9ARpIkSfz82l7BxtLX4Lw30QPRZCWX/TQXuGsKs9zGaiqIDN4lV6mm2LLcirWqgEjM
         R4hjkU8Abub6VdnHRIiklcNgJCThjSF4IqTlH5Fi9C+/4TGdyQbGwpWYNJOvePIPn1Fx
         nwQA==
X-Gm-Message-State: AOJu0YwNvZL0NKyHXkZNzvMyTF+9+tiF+GxRUdn+I24Zy0ff1BEtyof0
	5f4SMcEujjPEKBl6t2M4pGFi5f1Er/ushHTWplXUBz8inuV6AC8PpFLLkv8XWqc=
X-Google-Smtp-Source: AGHT+IF45ww99YyzdSWE+qA57c4PFAaCgYeKd2Czeg2UE2VYoSBeUmQAX31VZC9Jt73KkYa45836oA==
X-Received: by 2002:a05:651c:169b:b0:2cf:1b2b:6a73 with SMTP id bd27-20020a05651c169b00b002cf1b2b6a73mr38987ljb.19.1706139322326;
        Wed, 24 Jan 2024 15:35:22 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t6-20020a2e9546000000b002cf15a1d917sm104841ljh.105.2024.01.24.15.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 15:35:21 -0800 (PST)
Message-ID: <e7457703-fcd1-448a-bcb1-d5aa31bbb1fc@linaro.org>
Date: Thu, 25 Jan 2024 00:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "power: supply: qcom_battmgr: Register the power
 supplies after PDR is up"
To: Johan Hovold <johan+linaro@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Xilin Wu <wuxilin123@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240123160053.18331-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123160053.18331-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 17:00, Johan Hovold wrote:
> This reverts commit b43f7ddc2b7a5a90447d96cb4d3c6d142dd4a810.
> 
> The offending commit deferred power-supply class device registration
> until the service-started notification is received.
> 
> This triggers a NULL pointer dereference during boot of the Lenovo
> ThinkPad X13s and SC8280XP CRD as battery status notifications can be
> received before the service-start notification:
> 
> 	Unable to handle kernel NULL pointer dereference at virtual address 00000000000005c0
> 	...
> 	Call trace:
> 	 _acquire+0x338/0x2064
> 	 acquire+0x1e8/0x318
> 	 spin_lock_irqsave+0x60/0x88
> 	 _supply_changed+0x2c/0xa4
> 	 battmgr_callback+0x1d4/0x60c [qcom_battmgr]
> 	 pmic_glink_rpmsg_callback+0x5c/0xa4 [pmic_glink]
> 	 qcom_glink_native_rx+0x58c/0x7e8
> 	 qcom_glink_smem_intr+0x14/0x24 [qcom_glink_smem]
> 	 __handle_irq_event_percpu+0xb0/0x2d4
> 	 handle_irq_event+0x4c/0xb8
> 
> As trying to serialise this is non-trivial and risks missing
> notifications, let's revert to registration during probe so that the
> driver data is all set up once the service goes live.
> 
> The warning message during resume in case the aDSP firmware is not
> running that motivated the change can be considered a feature and should
> not be suppressed.
> 
> Fixes: b43f7ddc2b7a ("power: supply: qcom_battmgr: Register the power supplies after PDR is up")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Johan and I talked off-list and decided reverting this is the best
way to go forward for now, the problem that my original commit
solved (or well, tried to, anyway) is only an issue with a
configuration that's not quite supported (i.e. missing all
pieces of the puzzle for a functional battmgr) and more work would
need to be put into supporting that. I *may* do it in the future,
but for now both of us need to work on different things.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

