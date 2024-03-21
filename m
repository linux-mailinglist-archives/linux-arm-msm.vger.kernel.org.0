Return-Path: <linux-arm-msm+bounces-14764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D20885F5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 18:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9BAF1C211DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 17:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B8312B70;
	Thu, 21 Mar 2024 17:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJ7ErXh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1981C2E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711041220; cv=none; b=ES3NtEcmNVBGpOooa1ZZv0s4jjOQkUwY2PTW4CZfh7JA6JdySnc8oAXBSa6LQVi7YC1LtLcAka0i0jV8RzrVsEASZWb/g8VE9qPh5uIFSF/eMNKGrUn0gMEju//EjJBKG0H6xMKCaGeN7hJ7qR4+MlMEmxIpGNsTiriC3bp8lmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711041220; c=relaxed/simple;
	bh=nbLcX62cPthMQX4Qi4FmqBnPbdHTCG4g5NU9t5wEUeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nGu1GZgFzi8jOGAM6ta+V7iGaRoEJ0+JiMlJ7KuM/FuALeM3GrAFWN3KLwPeIxY5DVEBw7AP/bfrAZ98ufPlDewPZNqTvimawOIw1ltqesaqc2nulOJx5bl9kV9yL8ZMx7w+1w7FF8xqd6BI4l2rkPKq7vAt9+eInLsimxfwx8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJ7ErXh6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4146a1ac117so7771515e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711041217; x=1711646017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAz3OstpG6j9xCZCUuIzQog7xNqfGHCkZ9dDarEe+q0=;
        b=AJ7ErXh6cSJIYH8Yr0OqwxsjlbmfuG4C1SqbkpwdemXscpFLLPoDRUTkzjrdax/3RG
         fJd8aQzyk08uLY/zZB1OpU3235R2KhPdmr6MgDA2zTg9LjOuvdnDdn+sbbFlOZzktLuH
         dingCteuY6BEdKqaq8bMe2q3p2z/G633fCOXYo7qauhubHbZ6s8aK6/hRyhs8K7yWk4m
         HK64c/297leBYCeo7wN/WBQKf4hdskzzMU6R4L6gG0u7REuimOk+ed7XwD1WEENEMmuA
         3wGvkvwjOixHsD0YxoSNVM7OdyudFz1muwqq4HsBJzi8C75yHZIKLB3FHgQzKdExV16J
         QCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711041217; x=1711646017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAz3OstpG6j9xCZCUuIzQog7xNqfGHCkZ9dDarEe+q0=;
        b=Kph2ao3KJsc5fVKIhyJ57Q2VE3RxyiDZQcr7mymP8y0Jm9A1HHRzRtE1zAV8+sAvvq
         kodRJ3hN7dgsoLOjyRtdtu4x9atzN0TEQRlq7tSKnU7Yq/EK168kPqwiRNKfxV9gYaWw
         EqmUes8CsZlSVCiVTsLpe6qfaErwxH4Sv/uag7lTk3ZP7MKbgDZk/7H6BSkhG2YjFN3+
         ATVgh+vacvyYyKJgbQnp/jmsH+Qmf6Y6gZeBE8SdVxjtNI7bmaKJan/C3ABTke8gX78N
         XTOAxud5aki7eibpQWzzah29Bl8Ynm+/2mWc2jJUdIXi/wyx/7epMZw18T/Xi/FmfUG2
         dj7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKOZSkJG+cFhJ/TLyUFhlOuVLPl88vPASnpA3y5cenz/Wd+TLFAdCshiRGVMjEBXXgg5z4ekxhNyUA+n7diSQ7zcDNV3Q85jlz/bnLkA==
X-Gm-Message-State: AOJu0YxYLQam0EGQFXP7tPhDqqHdV/nL9TqUO2qpLmppU67q9tGXmzBc
	kVAfmDfVww4fG+8uVKQf+3F1g+mZ9Ro8ySus6ef8+Nmcbme91GK0xj+IwC/a9Z4=
X-Google-Smtp-Source: AGHT+IHGLNLL349BXnrL+pVbNZJoZvK0Ey2jr8uASOGhJYzP7p+CqXSref151LDcL3zidgrF3XTzLw==
X-Received: by 2002:a05:600c:4f84:b0:414:61d9:d1f5 with SMTP id n4-20020a05600c4f8400b0041461d9d1f5mr152054wmq.10.1711041216934;
        Thu, 21 Mar 2024 10:13:36 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v9-20020a05600c470900b0041409db0349sm333276wmo.48.2024.03.21.10.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 10:13:36 -0700 (PDT)
Message-ID: <9d9fbf45-296c-4571-8c13-6b9b1cc37d14@linaro.org>
Date: Thu, 21 Mar 2024 18:13:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: lmh: Add QCM2290 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thara Gopinath
 <thara.gopinath@gmail.com>, Amit Kucheria <amitk@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240308-topic-rb1_lmh-v2-0-bac3914b0fe3@linaro.org>
 <20240308-topic-rb1_lmh-v2-1-bac3914b0fe3@linaro.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240308-topic-rb1_lmh-v2-1-bac3914b0fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/03/2024 14:15, Konrad Dybcio wrote:
> Document the QCM2290 LMH.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


