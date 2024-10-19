Return-Path: <linux-arm-msm+bounces-35092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D439A4E1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6CFF1C22D46
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 13:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129D12263A;
	Sat, 19 Oct 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgNZPk/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C8179BC
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 13:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729343758; cv=none; b=dC2YetUYCtrvjccDXTTeeOSCwm0fTtvwsVl0FSKTvGnc69GQ3H7jzr8h/Ur5LpYGZa4aiYhKR0sAYjXAD73Ct7D1wdVLZg/cshCiCNvv826oWCUgPp5Ph3O79Ggm05b+eQ+DVOuQIssHF+XOOQTmQzGNXvVHCFsOLU7h/8P1CYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729343758; c=relaxed/simple;
	bh=wISQD/DiPmIf9nJtmm3pdMffWiKrAmYAz8lDC5keNaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrV5pGXbvy/0OmbiOEFiv6pNP2bWuJCcLfjJD58QpZdK6YE7Zl5zOrzHGMpNsg7nhrtz5IN1wnfJZAeo49ggnwWn0ejAvx1FNT1J/3bOflpI5FrEXBt777h1gzwEVC96Frez0mYtRqxP92JtQbmF0RXXv+jWz3Z7USPRL4lxDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgNZPk/A; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f7606199so3451761e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 06:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729343754; x=1729948554; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLoh5AgznUgCvu6vNVjF8MRQRk0OBbGWJlXddyz8ddc=;
        b=TgNZPk/AFrSxalV3Pmt+6FoQ4aaYZEQYLxPxIPZevJUopeuazvj1mucDc/NtRItd+t
         kWGLgKGyb8eXtrd6fk4Dha+BROIFnR2FVMABf6RS6ksn88d2YjO9es+lZpOOb+7htBRX
         WbVXK3grEMqm4WDl6y2ndz0tRnMDuF6NcdVjrq+g7no/KbD+FV3Bn1eOr0aPuJmVqLbe
         6Pivxj5JfRdzIlaLV9z+GgKN3DDiRXxvgHZ7/+3L+7XsjdtoKmcaS5xPqoQt3NDrW8gC
         TUHC+qmOTtML2l31RiBTbBNnYV3LlOrX1XeP7pWZOiVzuIOqzYva1n8vC8G7gh7phuSu
         JevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729343754; x=1729948554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLoh5AgznUgCvu6vNVjF8MRQRk0OBbGWJlXddyz8ddc=;
        b=FrKqgd8Zk8lcepo0RMjT2609tFqw0YPYFff8y5kvE8oq1pUyxMOZTEEN555DMbO1Et
         UoDMq2cRijKITmnG9PaJJmjl03bEIbrmeGjtLkB7rCNn8kI5Kb7M7Yip0hiY/U28N1c4
         GwS0hYgKlNPwg0UJdqBOV3L5pSTAo7FBzYFGaTOD6lOTw9AAkz48vqALfT7oIRWk0dNX
         A/LMlEA2WwzYnPEPcYkssBGBO8rviC++l4k2qRTt2SnJWWUhVm37h5mnY/g/rEvvmsJU
         uitPJ0BOUfgt3xy4Xoa46aZ/GiT2cltkZ1pWiPtZxm7VZ5oIjzNJPZZ+7UpCE3spY7fL
         jJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6/pkCo3yQkZv2mPyxJG+yqS3B3vCbvgHIJZnCoF9IDZIhRPYNjB5t8ipraHAmU8BG+EUG3xJeH0TDut2F@vger.kernel.org
X-Gm-Message-State: AOJu0Yze5jmDT0I3WotPEO2ACoJQyqztRH0U+UCRMEpowF3gjwEhUz5n
	OOcxM9h12dqfl8QTnJGG9ZnkU8g6gB3johWrGqsUW+E1GLfVHu0qifk16tBPcVk=
X-Google-Smtp-Source: AGHT+IEFu0zK/9TF3cCcvEBZ0sen2jyT+GhSIm6vpUBEVskQof02UdUG/LGmK+X/rDmb1iKrzkMzDg==
X-Received: by 2002:a05:6512:b92:b0:539:f922:bd4e with SMTP id 2adb3069b0e04-53a15219231mr3301905e87.23.1729343753896;
        Sat, 19 Oct 2024 06:15:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b90b5sm533532e87.88.2024.10.19.06.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 06:15:52 -0700 (PDT)
Date: Sat, 19 Oct 2024 16:15:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH RFC 04/14] pinctrl: qcom: spmi-mpp: Add PM8937 compatible
Message-ID: <bg66uzc7i7bsounvl3vrhweiwbtvsomrt4tfkpojd63zd2ynrn@2pk4pypken5g>
References: <20241019-msm8917-v1-0-f1f3ca1d88e5@mainlining.org>
 <20241019-msm8917-v1-4-f1f3ca1d88e5@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241019-msm8917-v1-4-f1f3ca1d88e5@mainlining.org>

On Sat, Oct 19, 2024 at 01:50:41PM +0200, Barnabás Czémán wrote:
> The PM8937 provides 4 MPPs.
> Add a compatible to support them.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

