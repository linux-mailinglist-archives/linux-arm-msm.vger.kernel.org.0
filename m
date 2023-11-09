Return-Path: <linux-arm-msm+bounces-295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E06337E6BC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 14:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94140280FDF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 13:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1581DFF1;
	Thu,  9 Nov 2023 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1GGVOLA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41131C68C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 13:55:30 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93DD272C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 05:55:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083f61312eso6178535e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Nov 2023 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699538128; x=1700142928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nijde05WkqbhViBQs1nbgHnnGBwETyD4GMcX8IQsQFo=;
        b=E1GGVOLAUGAR9vbBPBaNR6StAoSlgJ4b7byaL0Vp6ZOoRxprlfcgpYvgcEB7Q7OJcz
         9taw9uBYf8FR1zJjkCjr7xWZt5DZpNPUG3/vClNfFLquV8zG2cnRzCFF51aeJmmOMANC
         puw7MR19vvuR5jWGSxpZsY9JQ1GAM6QrWTA3RG8wIOV2BMiqii+RvDQ49vup55FOy8uE
         5fkJ1RbbFTdk8vBe53XKu8KtNyW092Coqh8dWFAlAp5+2xhTUDjsqlZZqXWtn1dHYYY2
         2uWVBLERKDEpIwCDCDtpZ/tgQ3ez+3rjHGXIT9yfysTw7VOE/xpq5PBPVUP2XCoSfx/c
         nCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699538128; x=1700142928;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nijde05WkqbhViBQs1nbgHnnGBwETyD4GMcX8IQsQFo=;
        b=YP7KrkVMbvs38SXKMJJRfgdL/Ef+gUxcK5x5zii9RUCC1guX2hyrJntVBtco3/dhlI
         ONbUEOV35bxCmEaq5k2/B1ZagSKgfpac8S98oYsqsDt0TeJ6fxZ8QX1rZvExTJIa+RCq
         yoj1eZSVV/DHcoBhX7XArlenc/F86TlcEksonCHmAOcgWlpZaR3RYGR9UCXnM/FCNDTM
         mhnXdPiewh3ozn7h/InlWGmaAL4lEu4GIUqMNrOokIRNiEm1uKVfZ8PamKfYebvy7FVV
         2YjhL9cHlPudw6JM+VUr6oQnJY18er0MScNkp6Ss1dz2YIdD1cANO1yQZD8p2P0USJSs
         UlJw==
X-Gm-Message-State: AOJu0Yx5kx8yfSFnCWiNJ8xlveWdxbsEHaV1F6B/Tw8cjwYqT4FaCWM4
	A/4ZVr2WjDyUyUtrKFDmJoZE1g==
X-Google-Smtp-Source: AGHT+IHfvspCycP8TZe/VdDrkXatAWoDo0/wlUvtSr4H0undoJQWjDko/3K9oXz2ijhJDnOSD5j/Yg==
X-Received: by 2002:adf:e781:0:b0:32d:9a8f:6245 with SMTP id n1-20020adfe781000000b0032d9a8f6245mr4308142wrm.68.1699538127950;
        Thu, 09 Nov 2023 05:55:27 -0800 (PST)
Received: from [10.66.66.2] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id u3-20020adfed43000000b003140f47224csm7411099wro.15.2023.11.09.05.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 05:55:27 -0800 (PST)
Message-ID: <0e325a57-f07d-47e6-8456-523cfa04c52b@linaro.org>
Date: Thu, 9 Nov 2023 14:55:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 two-phase MIPI CSI-2 DPHY init
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
 matti.lehtimaki@gmail.com, quic_grosikop@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231109-b4-camss-sc8280xp-v4-0-58a58bc200f9@linaro.org>
 <20231109-b4-camss-sc8280xp-v4-3-58a58bc200f9@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231109-b4-camss-sc8280xp-v4-3-58a58bc200f9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/23 12:30, Bryan O'Donoghue wrote:
> Add a PHY configuration sequence for the sc8280xp which uses a Qualcomm
> Gen 2 version 1.1 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Aside from initialization, looks like the reset seq should be more
complex:

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_1_hwreg.h?ref_type=tags#L39-45

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#L133-154

similarly for the "common regs" that seem to extend the init seq

https://git.codelinaro.org/clo/la/platform/vendor/opensource/camera-kernel/-/blob/LA.AU.1.3.7-02900-gen3_gvmgh.0/drivers/cam_sensor_module/cam_csiphy/cam_csiphy_core.c#L491-527

Konrad

