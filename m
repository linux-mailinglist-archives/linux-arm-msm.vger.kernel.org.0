Return-Path: <linux-arm-msm+bounces-23568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E2B91237E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C42F1F2698B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51BA172BDD;
	Fri, 21 Jun 2024 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UryOmKbO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35678172BDE
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969083; cv=none; b=azotHHZGQb8kHU4jqLEElMD+MeyvBHPqmY7F3HMBjD1Npz+ajQVF9zoHACrG7AR868Kwq/9a1iz8JAI3EM/ICJczpVYEBPqNbdbohvAxTpnRtlSV6lQN4FfwJr1d/a308MeXAGwC8NT7OvuPKadQ3RCQc+SiVMG9Rzc62BVG6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969083; c=relaxed/simple;
	bh=6SmldyM8LbjrmrwGeQd9OVKUpI6EzcMUULxdWwtoXOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kr+qeTxhR6FNNDQdgcUfzdnLFyEhKM1bh5ovnnFtKtP2tBobicuRef9w/rMicSosDi02CTBja5IcN2hfO4dlnbQZ5MOMq2jU/X5JVJCoWkxCyNe+BQR3/s8kzGTPaj2Sf5g9PIMtem+34PKrWCu8i/4m4E3/Kcn9aIOP9kTuI0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UryOmKbO; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ebc67365e3so69650639f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 04:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718969081; x=1719573881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+S06MNn50wcg8UPLv5wQp64pmlD3c1WFVYG/FEEEnRI=;
        b=UryOmKbObJHIfmJJ4mwK4HNNYMCS3FFXSdpyaswj99UdP5uweixzDUSxlDQtUDIkLA
         Nvff6rAQvP+T+G5r3IESsxNvk8GX4ENNZQlbZeYjmDOR4MLlZ/0JMC8w5IDYhwqlTWRZ
         GrLwxw61y1ruRWK38AYLLH1EkC3KiJUNZogq4bLtUDXqugf2Kf/zJRCRSMFjvgY34qri
         Y+ovN9gLQMsE9Z4oqdJsOdh4KJ9E+OTZtyw9QNdWyibIi4xclAI1FgDz93Q/8gWG7itt
         +76M4r85KPOl111yy6PUagV2lLaHoJUJjxSDfzg6V2H9NpvvnXJOsqksaEYM4hRwwfoD
         K8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969081; x=1719573881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S06MNn50wcg8UPLv5wQp64pmlD3c1WFVYG/FEEEnRI=;
        b=pRCWDddsBYm/FWKgw5ZT9aY1VWgDcN5oikbojVe9tp/Ua3XaZn4aVMYunRKrFkZsZu
         ALZ5GAoBy0WFNwDzk8MrvU5iuQ8wEKGg0q01kl/QeTr4eiXCwv608Fg0VP/LpMWfp++N
         YkA/3QXfb/kDS8TQMCBNGo0q6Z3cD8gfnGyN0tBkOlizTgZlD7cri+gls6dCkEhgOPEA
         0JwRFB6LVVHFJvftuNPIjT1N7KnDFlib7RILNT+wRGklls9UmtMM/2WhJ6r2LUqQx9ID
         hHLQRuvLi+GSQCnRL5IZSV5fK91qal9Ml0q4Hq3TbN7c2nZxMM848t638Gfa9IFjvnf/
         ZHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmPrBCkh52OjIafspS2yY1N6szSe5WnrXNuAWh4hDsf8oq9QjDfMHU0GaFP3H5KqnyGObcfAVllFabsMmxT6km+HzTj5ifdofnpceERQ==
X-Gm-Message-State: AOJu0Ywe0k/FkbyrcmjDMPQLY6YhlFI0VgUHs665IQzsRcTCduyZwBUc
	G1ynD65MHpsQzvgalDGfaHIsQGdUvrNq36tlwJyVu3/HPuLv5IdAdm8XHtYd9Jw=
X-Google-Smtp-Source: AGHT+IGefmpV6J+T59fS6X6SBJ+mFebCSYWultcx3leNVTbcAwyJlKZxxMjb/c9n+2WSDWc3cUTt6A==
X-Received: by 2002:a05:6602:1347:b0:7ec:4c1:14fb with SMTP id ca18e2360f4ac-7f13ede43a9mr945383139f.3.1718969081164;
        Fri, 21 Jun 2024 04:24:41 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d1110304sm308207173.62.2024.06.21.04.24.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 04:24:40 -0700 (PDT)
Message-ID: <fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org>
Date: Fri, 21 Jun 2024 12:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2024 10:40, George Chan via B4 Relay wrote:
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.

Please name these power-domains and require them in your yaml, 
remembering to add them into the DTS.

See

Commit: d89751c61279 ("media: qcom: camss: Add support for named 
power-domains")

---
bod

