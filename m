Return-Path: <linux-arm-msm+bounces-60468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE0AD00CB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB11189AD7D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C565286D4B;
	Fri,  6 Jun 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QSK2lApD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AD2853E5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207130; cv=none; b=cYtkdUoCLw8Ly7FDRqCTmAv99ajof4ufZA6qal7VttvIT0dti1aO/fipuRQ47FCWdDkP+q7vdkAoSaPu77SYMrrQPoy0qeiQ4Epxiy8gkYfc/j2hifwQ6u/UM+Fy0qWlUZVLT6uzi7V59aXAcfRl1wi/PwSebvmkjRh52P8R/K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207130; c=relaxed/simple;
	bh=dCV89BzZq6Q6ZmLswE/QDhu0SpE6z0dhIXVsXThcLaA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FYRy2N2JTXEUFTr85fKwludnm5MJQZG/FP3FBZG71Ry32GYsYOpR+BEs4tvvBrkq7hNXUrOGhqo16+pRSpn2ty1NWeFe88nCqF6ZgsPDu8gybyDgBkSwmVI7CBrMoWtcIgpf7ry+M9LTaNFVp1ujawtNC3NmZzHEZCqlDAl9znc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QSK2lApD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55329e42551so251769e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749207126; x=1749811926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDQlZ14CIljDyLnJNEF0jBU1r5V6b2tN4fhdULFPL+A=;
        b=QSK2lApDJ/tfw/5SnIC+RW0Itd/vqOFfayy9C46/98NvzOjmlPJq4+busf5zPdu6vf
         qCNJV96AXxNza1nNSHhR1LNKJBMpGYXt1kVzN1OeSQUWTpqE7cGd/Y8NxoTTC7+C/eHr
         oFPWVqJPcQPBgO266vI8V6Nc8jKWIn2KhG+gmTFU0AZw+Up7OvBB/FDtIgdKi97HBFDB
         dvK54OVrJF6N4vawxBEJ8s+1mH0S1z+n93UlelxpjktC7ewgWuEERNU4Qvns5SXQ1KoC
         JjgeLvB6UAdeIJVQlq4gjGupMEPBz849EswXUNIhRwK9hKsjIWM7gDCuSc1NIfe9hBRR
         bfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749207126; x=1749811926;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDQlZ14CIljDyLnJNEF0jBU1r5V6b2tN4fhdULFPL+A=;
        b=eHyrOiDoHEeAKAjjC9ij238Ts/AXF+zdrk4Bh+Byyp5/Qw3Fn4lf9KKAQyjq3LzTWQ
         n8DwOpQZVPt0QeqqjP0kVa82qUysSBryRBcbJ3BGDc1AoreWPjAgXD3OAR3AhIRWyJJ8
         K8x9/TsjSgI9KdoYkVBkZInlOXiMQFTZXVzvVzA7uSKO4LtJFizQR/BRUO0RceBqoAks
         BEaAwE8+ViuwpM/ufB5i2JVirysshiIHKPp6Rdp7lHuk5BA5iGHGEsd96bImXHl+acEr
         SExUQ7yosW1V/qYq1KPB3skBT2VdjKbdI+ajeLJXCiMd8hd0SeQz8zczv0WiiBm6+Fvk
         Uuxw==
X-Forwarded-Encrypted: i=1; AJvYcCUrxVzIla1b7pHtwaY+VZbs+PLWhyHSIeotejwYzrV5jZp3O4ua+zUbhpPaUZyxgej4uxGPnc6VL6aMjdD9@vger.kernel.org
X-Gm-Message-State: AOJu0YxcV/9Qud9BEigsQzzn2lSwjDqYJAcs6Q075uZR1ngtyhF6UhY8
	TaoPCQBzSEj6yaX3B6nhWnxHAskbEAx/4P2Bq8+QFkrI+cUmtQBsFQGsGhUkLk8VwVY=
X-Gm-Gg: ASbGncvfadrhtNte0djYkD9nyhzm5xNve3sUWVP4FrHP6GUk6nDOPC/R+x0qY22wttY
	/S8X4+RI65Ky/PQQzdz9Lb5lA/W5n4HL5CVCxSRz7wlsXT5cOluv6iiRJRIf4rnSP4hAI8DQ5Ud
	GQ2iJJULe60wt28y3ZJSrJiuIlkLVwrNEDpgQGAe4eYNAex75yeVt3EoVbXvhThlVivKi//JYdM
	ltuHpaU3UiRIUEyCbq4hbvfTUr4iT+X5Z5400CHt5LLhRyN9Js7duwiXBexl+KFT/hYpkv61zWQ
	Yj/R7D2uvXSmT6jfPGi6dYZuLgsAcLkgQBA8izk7N1+s0H7ZS3CdWLMsc/xRp+Ujy9VhsiSMynL
	SlKgY/1eZ40BYOjivFkMLqbCcnL/NMv2ZyrxJIMwz
X-Google-Smtp-Source: AGHT+IGxLt9Z+N/1x0tncIX7jlR/e9bVGJ2gA9tLXg0h7whncbamIa81lMzDHp3MQY/PXi3EBWG4Cg==
X-Received: by 2002:a05:6512:3da2:b0:553:35f5:7aa5 with SMTP id 2adb3069b0e04-55368797208mr189213e87.9.1749207125759;
        Fri, 06 Jun 2025 03:52:05 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367722237sm146841e87.113.2025.06.06.03.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 03:52:05 -0700 (PDT)
Message-ID: <69eac7dc-16e0-4dec-8e41-4d99d8bffff4@linaro.org>
Date: Fri, 6 Jun 2025 13:52:04 +0300
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
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bryan, Robert, Todor.

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

Let me kindly remind about this unreviewed patchset, the support of new
platforms like MSM8939 in CAMSS comes later and now with merge conflicts.

--
Best wishes,
Vladimir

