Return-Path: <linux-arm-msm+bounces-45747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DDEA18871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE9443A6EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 23:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AA21F8F19;
	Tue, 21 Jan 2025 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCwquUhQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8271F1515
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737502737; cv=none; b=LFezVoKHWBm+ljqO9gco+dP13xCyh1MfABRrcLk5OwTODupg7UOSN1O6/X7ejYJqTOImWggGPM8ChBe6mBSDyYqfH8Mq+d4t6sK6gc/csqK38sICCDHoC1eKt5xvRQ7bY7kR9KlT7qT7DCZTjf2KliTcVzPPNV7xAkE6rV4gxPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737502737; c=relaxed/simple;
	bh=uP0BswBeoqMFT39VgZoZVsIFI11gL2q+m7G5kecEjiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dLgcuAU/Epp1cfxGFqYZ9Kpk7Gyb9FIdYZtSxuAndaLl2+rBJ8NhBjiMwbSvVlideC48Av0CwFQ/qRe+QRTUE7u8Ere7H9XwYi+LInH0ZYISGFy6gQyQtRtnkmLU2/7ipAd3g9GvQaYT3+IgtTTWESab9fwdA/qRJtO0k+WKBAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCwquUhQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3021ab1f26cso3369751fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 15:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737502732; x=1738107532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=auGaFGS45UkLAlxjJAKbb2IZBDBtcKd32rJyiapnu9c=;
        b=mCwquUhQEZdDBYmNUYZAFFz86wkwnwDtAS3ND+u4UYun8rac7eAhyacMM4MHeIauHg
         1LnF8esly5MeqpvRHjlFr3Hjly6U9xQsNDn+FkVfIxhf3Vzrh1l9F9yY/EB/ltKdrYDF
         XSgKktx1P1mioZiMg3vRc6itG8rx0f/nJSbBBfIcPCA+nu9csL8CudkYxxRXZTVmO+O4
         oo8E5RlTwO4D863n9SoWOLMswkFHc967vGduWgt8sO21Wy/wVNtqNRVs2uzKVYcgXknK
         F5FuvdG2ZgSRCBzBg7EYANp3B/VHF/Abr3TBSMUvM3nKYKryl5dip5C0PEUjgICchGX2
         9Hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737502732; x=1738107532;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=auGaFGS45UkLAlxjJAKbb2IZBDBtcKd32rJyiapnu9c=;
        b=UdQo+kg1apJ8FyuORxMuKpxNlMLzbEpxW8bkOXcTrxk6mT+Fd35XquZEoF4VdB08wK
         44HJga5jmIA0SK87AtGFKDT6Q7EpYOv8eJCOtPQWzDPRtvFq7Fzmo7uaKIAi1tzMFvBT
         /HUHplavViYPV2x3+FsFTsmcT1AjuEBKbPBYJ1wWEe5dpL/tIX4awMbpca8xR1s+lP2W
         wleboSVT9riTqMcTg4nHDbz2czArFI9jsO59BeHKTSlNOhXrLJ7Z66VWK3l+2vdwKKwY
         /URoYvW9uHNhdcsfURt/aJMwm/QUNrRYJIIrQckEoukhUTZQLDwtILkqKI2Sksg8ATHI
         /RZg==
X-Forwarded-Encrypted: i=1; AJvYcCURZgg8Znxk8oNuKrdOUviixpBh3VXTWYcZUJ8xzAdQNY+YZXHCxlZKxCV0eh6VaNcbWzONbLZ4CEUzqYxO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78PclhUeVRTtJe7MYLYdx0zupXsB7oJS67Fy/7HEi2PukyGpt
	LeCqpLdzgMDAcf5ZhDVOTiO1tsQHgDunjSV7r9pc6sjEa/ENQq3uRPFSfNQvINM=
X-Gm-Gg: ASbGncvifZ3E4YgxXXq1xvSOlsYioPg2wbyyaOzhhm74lTv4vD4woiSTLPp09W5mzjq
	hq3apD3dUqOUAuIa8xoOgR/1eSKjvePbL/MxQlOUnOlkja4L0kV4ohJaQokKtBGGiRkG7rekXl3
	iC9gzscftOegDAl85sUc6hdZXiaAOkDglF+3IU3I0vAO0ZrAE2gKCjRCfBaDKpNBkjcsSchaOFw
	uBJFNTD4y23NGpO9zZ2tUArGWk0md0jRSwtboZ3cf8vcQhFOlWLG6Hq3bggYzI0gF0hRTW2D45j
	/L4bKkTl91kb61A1GonPEqk9tCDdt/b6BgjhosgbmQXmmEsl
X-Google-Smtp-Source: AGHT+IFMHChgrg3sylYfBZUTmtf52BjnEer874RN5zESRym28B6F1z+CFKsgNj+PMogdISz3Y3pp5A==
X-Received: by 2002:a05:6512:691:b0:53e:349c:45b3 with SMTP id 2adb3069b0e04-5439c246d95mr2071030e87.5.1737502732073;
        Tue, 21 Jan 2025 15:38:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07390sm2058674e87.22.2025.01.21.15.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 15:38:50 -0800 (PST)
Message-ID: <c6087d61-325d-4080-a63d-e735ad6640d3@linaro.org>
Date: Wed, 22 Jan 2025 01:38:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] media: qcom: camss: Add an id property to struct
 resources
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-1-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-1-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:46, Bryan O'Donoghue wrote:
> In various places in CAMSS we assume a linear set of declared devices
> {csiphy0, csiphy1, csiphy2} which currently works for upstream SoCs but for
> upcoming SoCs some of the SoC resources will result in a set such as
> {csiphy0, csiphy2} which will break the naive for() loops we have.
> 
> Introduce an identity property which resource declarations can populate
> hence facilitating non-linear resource naming.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

