Return-Path: <linux-arm-msm+bounces-26104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C0930C1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 01:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8394A1F21068
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jul 2024 23:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B0613D502;
	Sun, 14 Jul 2024 23:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMIdFc4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9AF27452
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 23:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998496; cv=none; b=t8Tbtvz/8cvcudMdJMrBFo4ucUVbt6vkdG8E2TaDR57fxSxt8r1yLqjm3vpq0n5kuV+VK6p8M3R71heDeLQ/TTgwgAvVKcGp2tdaTUew3InLmZxWUhbVOyNdHMLF1ldv/xuAFPc2WQMODZ9WMqxtynDHJpjcBCBnyxIqz6ikdp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998496; c=relaxed/simple;
	bh=OMkN5np2QtCs1JNvE31sSeSC1J+h0T2xqETYrtz/Jvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yn1+mafFwzmiZeNLlEZL/Lgo0oED6zVd8lnB8jM9bllNIIZdzEKVoTySnSV8YZW0wlBjUmVR99oQmfZEeqpJ1LJlgfGjzJadA+p6kz0ehwu6xrJyC29eo2zgo3YUzC4jRSwpF9Dc0kFM8oI4/1dcsSxye6aH1wsx4CysyeHjwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IMIdFc4M; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42662d80138so23210655e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jul 2024 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720998493; x=1721603293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giOaqGkW3gh78EAsAQJqHIlxqObHcBjMGF7SPoyrBgw=;
        b=IMIdFc4MW2Yg6OPSpUgXBa4MZbS6twZtslBhTsBJ/IK001rWc78GjXZPPWUOeHMfem
         NRTkTmWSWoTKQoznW7tU+fXPkOnQPuQzCu/WbSOg71unlJYQo+mcFADiKCfGX5vv6qwi
         gmiFfLImakLREO9JdXat5GPOOPSyrOQkFQVy4WRbDCBkrE2s/4VKmLp9U3cCWYXBM//E
         DHFY3FAAN2d13PTOmtvWc3b+AgUkAtfuO/f7+FZCbX8ouqDizj7YZHVwvO3MUnBnIxm6
         1CXBX/53qgkJAGhy8gq1OXN+Wd9P/wMTBKHgURf2+QbCEvS3ROKrhD3ZqF3BK6lf2r0o
         3PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720998493; x=1721603293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=giOaqGkW3gh78EAsAQJqHIlxqObHcBjMGF7SPoyrBgw=;
        b=pwqzUr/v5W4kkT359WSPOcM0vi2zGDpfmhjTnZHp623gZ8TQuBFPnUuRIVKUcWlObi
         UF9Btg/ISOcZQ4OFe3dX5Ei89H2wQ0FQxCJJJA8iOqjIJcH35j7uB6vSn8F4v3EHq8Bi
         dsNYRN0IBGQncbjJ3iRfOIg6zAL545PWTzj7w3pJ2DqFLHEktP7iqcu1a7Ns60zLP4O+
         dO9AWPPjrygnAXyyOBYjdaLoACUDx24YIWcMpxNsfBLEv47izIZiBYbyG37qABmJsAO4
         AG1Si/ktA3UeEtI/l9xmKJY0//16XECm6u6Zy2+jEmrYxJuGGjsSa1uQnayWf4quvQOE
         gHYg==
X-Forwarded-Encrypted: i=1; AJvYcCX1KfrF3hBKE+31BiQj71C7aT0ohOEltqmlgHLDCSclX4/xSc0dZzydkW3WXLWdKCAuruUBwfOGK7j4goUBRxGut+txLH8RDF4I0l1Cfw==
X-Gm-Message-State: AOJu0Yy9QdK8vmB8IROxoW+Y2cK5pWnHlKjvLp9PCi9D/wJB7lUZM3LC
	fGXUmfLHU4evExrpjNmCetPwnA+1O/8R/8d1fZygoTm7R2A6yPVIEfHl26Hf8cE=
X-Google-Smtp-Source: AGHT+IHEJtdJ8gx7OOIcLqOTFIx9I0LKxCSaI1ZsOORagte27E0UhFbA3bxbSv/hBaM4nMePlTVBRg==
X-Received: by 2002:a5d:6a52:0:b0:367:8909:197b with SMTP id ffacd0b85a97d-367cead94b9mr10738905f8f.61.1720998493213;
        Sun, 14 Jul 2024 16:08:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccc55sm4807421f8f.50.2024.07.14.16.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 16:08:12 -0700 (PDT)
Message-ID: <dfe6be96-9ec1-4f49-b561-19865bc313c9@linaro.org>
Date: Mon, 15 Jul 2024 00:08:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PM: domains: add device managed version of
 dev_pm_domain_attach|detach_list()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
 <1720763312-13018-2-git-send-email-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1720763312-13018-2-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2024 06:48, Dikshita Agarwal wrote:
> This patch adds the devres-enabled version of dev_pm_domain_attach|detach_list.
> If client drivers use devm_pm_domain_attach_list() to attach the PM domains,
> devm_pm_domain_detach_list() will be invoked implicitly during remove phase.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---

> +	num_pds = dev_pm_domain_attach_list(dev, data, list);
> +
> +	ret = devm_add_action_or_reset(dev, devm_pm_domain_detach_list, (void *)list);

Fairly sure that cast isn't necessary eg

drivers/input/touchscreen/ili210x.c::ili210x_i2c_probe()
drivers/power/supply/axp288_fuel_gauge.c::axp288_fuel_gauge_probe()

---
bod

