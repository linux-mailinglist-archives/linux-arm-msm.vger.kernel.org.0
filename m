Return-Path: <linux-arm-msm+bounces-60853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA45AD40C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C1D3A7D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A4524676C;
	Tue, 10 Jun 2025 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzaB4sF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1652459C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576424; cv=none; b=EOnht6lgKnQogqSFoDJGdn+jP/8AlOvXV4mqUasu3gaYtRwqkcYD1PNQqncJRkP5SNgp0jI4jgL1z07hl7uxrGKrHsjGYocLtgLO+xX6rwIGxp1SmXYjupCZF5ZVclMzkkSaFQqHpTCzDHVYEXjHsbSVYlhZBrv9yGgLwqfy4Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576424; c=relaxed/simple;
	bh=e/oOcbUFpgTOzRmXA6CcB30uzxELMK9/+jh+TW5P4aA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bpYTmuRIIrOmV+sA4nJyPMo2hhhCcyJ6tluDil2Jz3ltmHf5xUNnzKVhhmOXKegRzpDoDjq7aiwVmaFlf4Dxok+pnD2LVyAA9NvGWrnJpxBK59e9XLPJj86W7aY8lsvTrPOxegzQgy61ya71EbwofWm99utw2johs7IggIQnK6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LzaB4sF9; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32a6a607465so2762431fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 10:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749576421; x=1750181221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BDWeNOmrP5y3qHNd9VDypMq2nedTQKGXWj49qp+NK0k=;
        b=LzaB4sF9haIM0LzicNZ/4ThZghaKYI0cF5NAs9wPmt9JcaBUtKv6OyWQOns+84K7GG
         +s1bSBE8KlG5Wm50C17O49dTdiFzFucLEdXKF9VRQ3PASw6Ovejggw+KsN3J06zQDw7i
         IghU5V/4vKffCpEphPC4BseUxC4kj9fzfyXAettpSoxQt8oSQakLWO9JCJUmtx61ihBY
         xt/k9ftdfkszdUu+mqIWsUHVhuiSh1AiCV5U5vGCKmZg6y+me7IXZIfeE7hLSWUQ/gZi
         ASHjLecWzFLA9TL8U5vA5RIoKQuIpCfLTLbNGSjXuDfst0+4mQskIl2fU9dTIO/98qf+
         uOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749576421; x=1750181221;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDWeNOmrP5y3qHNd9VDypMq2nedTQKGXWj49qp+NK0k=;
        b=LeTbYCkmPjshTr59nMg6gLgt8KLS8rR78TtZgeKHKRV2GeXGg2FzpcdlTOSCE1/x7a
         xKBir8jP+ilKepu3xvkATrbNSVQptfRkLFJt8aQJYCF7Tz5FvLv2HCWZyEU/yEqnC6Cq
         V22FVMwccokkJ5QJFifNSPtXnVgCKfDycjYKWqBx0Xix45AhwglTUyowZqhLoST4hffd
         HXynk+a+xaG28Uy6diImuTabz62Wo6eNo+4z8ygHdj1e3w621Q0HOqEd/UJ9kmbSABo/
         4IwUthU6E66HE10UdcZEzrHq3/IPyiqsYSdUTI1vFmDaBMPJBLDlC5E2h9uafeyInHoJ
         eIQg==
X-Forwarded-Encrypted: i=1; AJvYcCV0e4lnX/qN2gCHk9gVzovskue7lmZOFNiFIgIPafza4Pi2iBric7ndX46ZNI2pwgdDGwBZtrMIImJfeZQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyHOzBB6gccIB45UtQiff61TktmahheEGdM/1AY2QSWC8iDEk
	QfTjeJA82rcu9Aa/ZUEs/2o/0k3YiC0qCBky0ddcoPXZP/fco15nMLvWRKlVGC+Wfk8=
X-Gm-Gg: ASbGnctwIjE+CzKUVAA1mDsVXQBcjtFUc7xrQSfg0FiOrbF2D8I+vINbkQfGrw2N1+a
	E3MktKUp6Sseby/oCMC0JYs2YKZJyn/KFCSeJIMZT8E97bYSjWcia3m+87I9TutSdyTh0A1LNKW
	XVkUhWZldWcCIAi9/Ph0B/m4Ky+1VNY0yNeuqLPqFJrTFdDK4wqgy/PbTIZ0HIF/DMKXNxS07yG
	WEIN/5MxHqiUNSkf5RM3PNQdB22j4AYz5GW9zfksOe57C7gER/ejyBinM2KLGVMPIjBeswV/CE2
	zGr4687sBKXBKCznBAKmoKKnlAOKJkhKnjRQgwbYLnGmy9ua1FjdklqCJrQyerKGQqEZLXlZDag
	Ukk0Sx0FOZ0hCBEqRKrOfbXjGloYYbkabZhpI8DLV
X-Google-Smtp-Source: AGHT+IFWQCdk5MFKzpyZcmaS0S71xmsUSR6RTjpWEE/zEXq46zpQ6nAKr24sBfjyOfgS8C9kLowDEg==
X-Received: by 2002:a2e:bc22:0:b0:32a:739d:f78 with SMTP id 38308e7fff4ca-32ae335a47bmr15627331fa.11.1749576420634;
        Tue, 10 Jun 2025 10:27:00 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cad5c8sm15446441fa.72.2025.06.10.10.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 10:27:00 -0700 (PDT)
Message-ID: <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
Date: Tue, 10 Jun 2025 20:26:59 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Content-Language: ru-RU
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 17:23, Vladimir Zapolskiy wrote:
> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
> 
> For simplicity of continuing my reviews of CAMSS paches add myself as
> a reviewer, as well it will simplify the work of syncing and avoiding
> patch conflicts between work oin CAMSS done by others and myself.
> 
> Vladimir Zapolskiy (9):
>    media: qcom: camss: cleanup media device allocated resource on error path
>    media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>    media: qcom: camss: remove .link_entities
>    media: qcom: camss: register camss media device before subdevices
>    media: qcom: camss: unconditionally set async notifier of subdevices
>    media: qcom: camss: simplify camss_subdev_notifier_complete() function
>    media: qcom: camss: change internals of endpoint parsing to fwnode handling
>    media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() function
>    MAINTAINERS: add myself as a CAMSS patch reviewer
> 
>   MAINTAINERS                                   |   1 +
>   .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>   .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>   drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>   drivers/media/platform/qcom/camss/camss.h     |   1 -
>   5 files changed, 71 insertions(+), 119 deletions(-)
> 

The changeset is left unreviewed for 4 weeks...

May I ask linux-media maintainers to take care of the patchset?..

--
Best wishes,
Vladimir

