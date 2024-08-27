Return-Path: <linux-arm-msm+bounces-29639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CE960D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 16:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25CA51F217E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A9F1C6891;
	Tue, 27 Aug 2024 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JTcXAHYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE71C688E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 14:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767688; cv=none; b=cnp/0ZuGnF/dZVEXzgquMn/S8abUMdDu8wcrSEqTSFSWMEwGd3SdnA+cexim5KHZop3K4RzFOl1cKvNV0gv8baXE7xIrCXhQQ3ajkUXPeOUmlIMhwAb2Al2Tfz1K3FrDvYOjEbQQjUnyZBwuFRr/k7+dyVboBt2h+D7N1PJUIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767688; c=relaxed/simple;
	bh=ZBUTCv3zmcq8wCzDWDN1pjb0U21sMh9Mda4jt580So0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPb920vP3B2tOGgxExsw1zLaoO5IMxB9QCJ6LbPUd7x1Ge2aF/swwm+sK1+1fRyh5uOwr0bKJEB3cZ2/AOfwzGGK/jJF93fxP93SqR66Uk46tco23wwoKWwaLXIE68zSdLU8UKF1oyjlX64I7dKQw6CSTLK4vitbFxC+CWbMMBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JTcXAHYx; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8684c31c60so668359566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2024 07:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724767685; x=1725372485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpeTd/yl72bFm2R7iWr/Y3ABLQEY7ujZ2y0DqdcJWHA=;
        b=JTcXAHYxTLz3YI7TiGWxx3JlWzqk2K/lCs/y3pWVUZtkC07eIGNHcLarh8hehR/546
         4lUJEtKWmLfFsbWvD5OwT6NbH/lRCf572aauykAh38xCP0cXCiupNjohFcGgZwX/WT7s
         W8GdCWwmjyAbnloWS8Y7DqoEp4VbyrE/YM0g4HGMD9+hnj+c7KFrVwA/jwVKcsj0UHaK
         Zb5mO/gs+VF1Jwxg01dOgjBYkiFEhwtPxqGya+t5+uoZngJ5ziDp0pcHTNuk5gpWaZ8S
         cacDSmp7uQ4smnSeoQdjjBTQDXpZMH5cvMA0IyBotW+pTbOM8u3GYkJ95ZXRthzPm9zo
         Ookw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724767685; x=1725372485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpeTd/yl72bFm2R7iWr/Y3ABLQEY7ujZ2y0DqdcJWHA=;
        b=uA3EmUGbTbNNY37+O5dCZqeYoNHyo/iSZVNkJz6Zv/qaltBNRuSYAMJWae38+VJJjK
         bW5JF+aFbky/oebADFgqc6JOl6VhnfxIJjnc66frqiYkHrYLceGS825LK7MII8ThcWIQ
         vfI2GcflOD+MCH5tW+e7Vu1eYzE1x5FhuhrlG9MZFKMd2hW8pMpiTBe8lu3+zItnHfmv
         qFrvffvHR0NjBLPmUCz8fDauBBQ4mQodA0SE0jv5npAdH9nd17IngTtTzQoiPTQMgK+K
         y9u/huUFqglm7RX27Zwtln9DK3ROUqgHt2gBtDQn+LHZ22bvEmuZoUkSb3d1NMAbr84d
         C85Q==
X-Forwarded-Encrypted: i=1; AJvYcCXSX3IKbDqykxHTk6sOVTdh1E6SxEk/DnJHjxBmIHrS2JTQYCW2ROAPUHIrDEZj3w6gkeoTAlVwDYRDXxqt@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzaRgw4P8LZH87NaDY7WzsFQyXTMpP9HZtN4jn1u26wbqQ35F
	asLl2YJDlyqQiuiR4jxHO4AM4Ni/rMKhc/bvJth23lPdwNzhpkFfywsfrMKWaBA=
X-Google-Smtp-Source: AGHT+IFnXxZ6TInJiGYBFSrV4NvTQ5kX2P4kKzBITbVc2Gps66StZ4WmlWBUcCNAhc9WsjoqwzWKiA==
X-Received: by 2002:a17:906:d7c8:b0:a86:812a:d2ca with SMTP id a640c23a62f3a-a86a52b7413mr988954466b.25.1724767684873;
        Tue, 27 Aug 2024 07:08:04 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878455sm114015066b.160.2024.08.27.07.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 07:08:04 -0700 (PDT)
Message-ID: <74126160-57f9-4abf-a26c-3491c8f3dd78@linaro.org>
Date: Tue, 27 Aug 2024 15:08:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/29] media: iris: add platform driver for iris video
 device
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-3-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> +static const struct of_device_id iris_dt_match[] = {
> +	{ .compatible = "qcom,sm8550-iris", },
> +	{ .compatible = "qcom,sm8250-venus", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, iris_dt_match);

The enabling patch for the compat strings should come last - if its 
first then the time between the compat add and the last patch is a dead 
zone where things are bound to break on a booting board.

---
bod

