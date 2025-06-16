Return-Path: <linux-arm-msm+bounces-61390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 757F6ADAA4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3633A16942F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75CC020F088;
	Mon, 16 Jun 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXmhxWFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0CB20966B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750061354; cv=none; b=rO7abYUDJzD9NijjnZTpY5X5rdS11m50DUqcGFuY9b7aqPqnr8prhJYcC7bS9Vr1qSkwadIDF69kRxxltMwOT7mr56SBjDYOnXjK4nGChalRFuz47ssJP5wacYrzrxenlXfIJ/A2Mm98RdoEmuKFmILGLz0qtPBG9KpuLe00EJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750061354; c=relaxed/simple;
	bh=USkW9A8Y6Pc8W+vSjgDy1nhlge2z+SqxZaMzVGJgcwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsNrrkEaQgs/vT2TnvjMXd09YUapTlfPvAcVAmjOeDqbc7q60bjTUFHpziohmbEfwfZQpdhxpYtqN9Ol8QoVjiAkBzvZzuRi+QCTXhW14DpYplTP0ToKasZ9dn9007O+vp/toWoIGQlwUtuV91MVIWQHpeBqQSOEyGehJUwOcsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXmhxWFT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441ab63a415so48846045e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750061351; x=1750666151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkb40S5vLWjTYywYDHqKY1pbcd7/hgHih9SM8FtY0Q0=;
        b=zXmhxWFTtAv+E3q4kxp4BQOi3fqTepixTR2mQu70FpituiUN1HTrmyHzbkYuM3ZtNl
         eOtDrTZkvU19W5AwHDL59AUUB/fhGLxLyfzRcBE5wBrdXoT3MsI2aaRZ2KRLOu2dQonM
         43T827GJRA/qo7VQaQJIMnSzIALd9t4ZBiwjje5irGfgs9o6LDZPXPelapoG9xvTx89m
         cLMDA/fORyvEIhmNFkBhJNq/DmAtQHxjjkgs8YBMwSVoxDII/axLcURfyn5TCemEagno
         EsXv7irVBoBhHzuavL+EUzHbBuiESL0dlx2FsaAW24IVZ0VGT0c9/q2sn8Q/mTV+ivlN
         t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750061351; x=1750666151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkb40S5vLWjTYywYDHqKY1pbcd7/hgHih9SM8FtY0Q0=;
        b=cAToPS1DOu/3l6/u0Qwn2NirERigfJV2UO+CH+qokz+waBJpxTr0aII6EPgLdzapZ6
         I7Vp+ijX1iRYCBQ/cvGTHTdKPSw6CAdFSBP2v0iEZn3/61s2e+NkejObFqBhtjxq5ICV
         sgcu2GZAd/YU3FXtB/c1F83IA3YHWrq24FLqPMJMn+Elk/LEgfN/W0wAqMgweLIb0afq
         q8146M2PIrtF5MdJMO+RhscmwvrrnOuUnzVYmsdWFcIHn1P72cCC9VkVlmRUE/fgsD49
         C9FSSCWNgeG+80f7wNRVlgkAYi41/BM0AcX8EyNNOt6Zvx/DLB0d1o0y+sOINtViQH2f
         OKKA==
X-Forwarded-Encrypted: i=1; AJvYcCXBpFD5s4sJsemcnZKQtNa4xze66lls9Mm6TLk5SDbImMIVx33Ff8gOy464zwt9Cm96s9wpSzxjharzh7ee@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qKoJ9TYls1hvZf5vM2m/3/6yYpO8gau4ZWavtr80HqZlsNoY
	pqTYvbRMb4BOfOZEtD8gFgmI7BXd3lju0OxXD50/rlx6N9mYXA0rLPBBfHgXbUNMfFE=
X-Gm-Gg: ASbGncu6G1zINX6d976G3biSAF/lPsV00AJ33FhiH5jJ2oM3qOAadwZo2SUEEjQjNkL
	10zlBlWWjXWQY0RAkR3L4Uq6x0A+1Ovfojb0JMLGB9ssDQw+yEAVMHTe5FKmqMOhCSwR6GUuByQ
	g0xZDZqgPMe5nbdwwruNGrF97SnVlGvhi4j0kDmX57EHB8aSTwBq2FeLbgvyfjFtZx300kvrr4w
	ecn6tQtiOEIJb5cAoXw5JasN9XE4atQKv+r+kWxTaSXw7YdKWtcVMUMtxfbL3GumSYaF4thswtC
	D0MirkbZ8OrWyjHgp6iDGEhnpyVb28W4w31JOaU723k6hCR2yrXKevzkM7v3ivO5SurmPTgyPvI
	I9P8PzwS+75Au8iQelUR1tKYkofQ=
X-Google-Smtp-Source: AGHT+IGWcoFnYQiSRgGmqI7cH2i+fqFJCVEDio/UJeVZr62hdUsC4q6QvZkCencW6E8/jOVV2KeCYg==
X-Received: by 2002:a05:600c:8710:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4533cacb574mr90452095e9.31.1750061351057;
        Mon, 16 Jun 2025 01:09:11 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e195768sm137550265e9.0.2025.06.16.01.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:09:10 -0700 (PDT)
Message-ID: <7c850205-0c42-4e6d-bf5f-f1255367d53a@linaro.org>
Date: Mon, 16 Jun 2025 09:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-dell-xps13-9345: Disable
 PM8010
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: bjorn.andersson@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, laurentiu.tudor1@dell.com
References: <20250318-xps13-no-pm8010-v1-1-c46236d96428@oss.qualcomm.com>
 <Z9qXFLmnae86_GT9@linaro.org>
 <a7zyhmv5lqxl2l5rdg2x5g55wokm6ztwvzwrfkyeignwdromjr@afpe7zwsmkt2>
 <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d2eabc30-f1d2-47d8-82f9-86f6f7a705bb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/06/2025 19:29, Aleksandrs Vinarskis wrote:
> Hi all,
> 
> 
> Revisiting this change in context of Dell XPS 9345 and now Lenovo 
> ThinkBook 16 [1] (and upcoming Lenovo Ideapad 5) as these do not have 
> pm8010.
> 
> 
> Perhaps safest and easiest is to simply disable pm8010 in `x1e80100- 
> pmics.dtsi` as proposed and _not_ enable it on any devices, since its 
> known to not be used anywhere _yet_? As its a camera PMIC, the only 
> submitted upstream (did not land yet) change that utilizes pm8010 on X1/ 
> X1E is Bryan's CAMSS series that enables camera on CRD [2]. There are a 
> few other laptops that have patches to enable the camera (my Zenbook, 
> Bryan's branch on Gitlab for few more laptops) but those were not 
> submitted yet, so can be easily changed to explicitly enable pm8010 
> before submission. This way we could simplify this change and not have 
> to figure out which of the upstream devices do in fact have pm8010 onboard.

As a general principle, unless its used it should be disabled.

pm8010 is a camera specific PMIC and Dell has its own way of powering 
the camera sensors on XPS, Inspiron and I'd guess other models too, 
presumably as a result of reusing the x86 design with Qcom with minimal 
changes.

Disable by default. +1

---
bod

