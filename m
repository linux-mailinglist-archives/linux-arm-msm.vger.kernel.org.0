Return-Path: <linux-arm-msm+bounces-27597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 412AC9439A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72C631C217A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 23:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D73116E872;
	Wed, 31 Jul 2024 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LAxUHptm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A316DC20
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722470131; cv=none; b=Tc8m6rklndYjp+sQpwkktL4Ut4s/bwXPiwKylssSjp0qHc/akzqcMY2Ey/Fpb511akCCaaT/cFehsoPWVOGsiwdCcTv9UV5VZ3cCMilFHqXHyvKJoglHdAmNdr8zXH/k122qpV3jBMq27KwI2mdLcthMaBJO7IC33XhWJ+H7Cn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722470131; c=relaxed/simple;
	bh=xa90za8ap4kZtbgIb/vEkrdsRq3O8fT5kqQZJ5RcLas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrinbnzt1GLGnjqvnpdrlRSV2HLGb5bNx5YQ+yZlk4ZugxBrkwamAmVMwikERFEjDKS+PgKmxWmLdYmrGJdJ+Mejs9jpWonuwB8J/Fz6qR6x7rUu6wCU7sFcNexUdLnpiiYqkFJ9mnftP5VgOxOYWcSSgkxLJxmNuspEDFOuv7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LAxUHptm; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ef20c3821cso12338481fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722470126; x=1723074926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ3NULCzkwiCC2Hepk8G5amN9VNikpjxRbG+tpF7zHA=;
        b=LAxUHptmt5CamYLjVrrFNpWTfJYyk3PDEUwx/W4A6UKHR2p+HmROfqmG6UFxat5TlW
         IgC8W1sUXsi8qrepOERtZen6L8PBj+bMCrljeYbucN1m/22FLKstUIt2pwst24wvqFC+
         f1futCWS4Klia8spOBy4vO1/0bzVEgNZjiBrgG6/9bglCmSfX5jKXkejMHGN21eME2sO
         364x/NIirD3rSn3Qo7McU1eg3rZi4CF2P2qARNflC4gA/YTA/ZeXwani9OkIHBUzTxjZ
         uqBFz3oLkFX/r0gz2gWyhPlDqO1dcl0wDd6vGh+Bd2EJe39gYbdjU8TG+Gd5UiMa3ntQ
         OhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722470126; x=1723074926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ3NULCzkwiCC2Hepk8G5amN9VNikpjxRbG+tpF7zHA=;
        b=w9wbGTtEAVgznXiqLkQHyGXhImOpim5Q01s5dR9fCMfXmMVNhwLNqDgIQxRK+7YBcR
         +1+5EECgRcLvoU544cEX7UV6uyF7dCHkDyt7cWrpIbgngia+t7Bgv9BiruuNzYKqEBxh
         zDGDa8U09tRD5YaLpMblFmp4TdVRLPGNxzCN3RRgj45dPaxj5wEYRr8ErUkiWPQgo70W
         EELjbC0v+QSxJ9ItpXBnt6TETb2IXf+Au0VLSdXf7uKP6u+txE5ZtkqpYqcupo6MjGtc
         oQAjZOUjsUKyffTBc5T9Gv+4WGP7wnnXG+QQlgorcqfebMeIL6NF7zyGbvdGZkThBZP/
         q1kw==
X-Forwarded-Encrypted: i=1; AJvYcCVSZixfjutvmbEeT7O+Zj2H+IRTuUD/ixXNX2aCYRf8l1C1Ag4ZikQkCgPhDmah4sIFZz6yEM22hMVXDDMhOD6NTt/XQf5Zpv8RVMihVQ==
X-Gm-Message-State: AOJu0Yz5Bc0f/g1CYcD7b6WU1UmBh/rytrm9aYbtwggYvUkQE7uw/Hx5
	uuGmrE6qE1VhdCpq2DCY9t5Q9HWv4Hj7+gb/fRZHmrA5ve3FiPhTDBLpViRQn8E=
X-Google-Smtp-Source: AGHT+IF6eRxek4PxWOHk6Y7e1bIUu6GosnxevnqznvnaV3O3UEpj3faiBC9UP/AMMW67lO/QHf44xg==
X-Received: by 2002:a2e:a7c7:0:b0:2ef:17df:62f9 with SMTP id 38308e7fff4ca-2f15329fdbcmr3852471fa.7.1722470126358;
        Wed, 31 Jul 2024 16:55:26 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f03cf3020esm20778791fa.33.2024.07.31.16.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:55:25 -0700 (PDT)
Message-ID: <4fdf4f1c-fac0-4c85-8154-45f797c6acfd@linaro.org>
Date: Thu, 1 Aug 2024 02:55:24 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] media: qcom: camss: csiphy-3ph: Move CSIPHY
 variables to data field inside csiphy struct
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240709160656.31146-1-quic_depengs@quicinc.com>
 <20240709160656.31146-6-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240709160656.31146-6-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 7/9/24 19:06, Depeng Shao wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> A .data field in the csiphy device structure allows us to extend out the
> register layout of the three phase capable CSIPHY layer.
> 
> Move the existing lane configuration structure to an encapsulating
> structure -> struct csiphy_device_regs which is derived from the .data
> field populated at PHY init time, as opposed to calculated at lane
> configuration.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

in my opinion the change is good, still it might be reasonable to rename
.init to something else and/or get it out of hw_ops.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

