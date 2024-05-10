Return-Path: <linux-arm-msm+bounces-19646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD738C21D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 927E4B20BD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667BE165FCC;
	Fri, 10 May 2024 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPw4Fysd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590E161935
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715336209; cv=none; b=L29AyUYr61GXmzsPYMYb+tRUOzwRyhhVnfCBegBUDATNQXAhsfoH5Zf0stvGW2BmXqQxFxEZZDv6iPAFF3wARtaUpz/U1UQ0FpYse2nIfrSSp2ptukjA3VkYe9xTMZ0LzY4utMPH0GhqsvgDrXxiyIa2pYa2evz/FZNyNG1l1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715336209; c=relaxed/simple;
	bh=yNjxjyWHRgJNT85bQ4vAEKySQ6Ttdt82uXc6uV0lmmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUdGq+cmWlwIS/ekZCSre/MNfo3EWMZvQ1MJeXyPzuUL1cD5mJSLfEx+ICSi01n215Xi4OxikbdzMs3Jc0tUC4wNS33KFCbaHdU/vcbVGG0AE0DWoFqId0XXVvL12AI9DcqY2TZVPNbtXdjeEIw+Hc5N6wFJAkJVUPAgat5rWQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPw4Fysd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41ba1ba55e9so13810685e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 03:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715336206; x=1715941006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0zj2kv9xKmTFj3ypPKj2+zRWc3BeAYMIei8qOrVVV8=;
        b=nPw4Fysd2GSuxd1eg5SsAugpGPRhThIHAZTLY0x8TxIHn2LL7hdIhfyQUhjH2mUFO7
         YOzppDdHVhgjhG76X+xDGfRzz77+E9l0xeHuLkbCLpP7LuF8rgPtk1N4oriQczkEXnvA
         1zikjoSyWvMmUZmb6GNuemYfkK9TP+gS5epuMzw7N8OYCww0sl1BtFJ44dagGlV3jp+k
         knS5ias7um9cP9FUevyatCLMHGpyS9dN8lyee6AcWwFxK6kvV8WoCU2cHs91089joEvj
         uvo7KmzfytfNFrcirMmvk8YulB8LipE/F1WKr6LKh0VgDRufN/3sfWzplJMqc/8G4gBM
         b1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715336206; x=1715941006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0zj2kv9xKmTFj3ypPKj2+zRWc3BeAYMIei8qOrVVV8=;
        b=lKS1fM5Mlb5XAL7s1mkJYmuK6unSGt4JSD9in7eWPk0fqrZlLKKjD7lkWwHupJ3MI4
         ULbQvHYodEB1lMMKVqfgIRw+AVihjwrHY0YEy7kKX0n5gGuB3wAXE0vz9H8ap31BhwJY
         iL/00uLUSeda+Fik/kdEr5rJC5I7qhK6lY0W37MKfUDV0oxqujNkYwLQVNfk+3QNBC19
         ql7GhM67xaf0CLL27BYRx5SIfF/vZ9bxUjRECsVFkWiMzcg7BdjbbES0TUCNKdvMSfK7
         2GLnATocBwqJZzotK4WhjuPZMxHFfyMSaS2V7kx1xwgua8EQ42I0atQGYeH8Qe/4fc+h
         NH/A==
X-Gm-Message-State: AOJu0Yy4W12jgLV1nxsOcVuv/NpEwIb2y4i+be7I3EGRAkdRaaLQ+g1n
	+ePPJYi7JMrcZHIhkrXODEj5KXZjrsxiAcHyS2e9TK9LD+5WtrOSVDO2EXAA1tE=
X-Google-Smtp-Source: AGHT+IHl7GUHAFqGOWygcJoig1gLtm4nsxrusQn4yYtD2dzg/4FpCoDaYkaBz2EaAYp4mDAOsjGJGg==
X-Received: by 2002:a05:600c:1f83:b0:41a:b961:9495 with SMTP id 5b1f17b1804b1-41feac49164mr16994165e9.25.1715336206037;
        Fri, 10 May 2024 03:16:46 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce25casm58133645e9.20.2024.05.10.03.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 May 2024 03:16:45 -0700 (PDT)
Message-ID: <3938d7a7-17d0-4da6-b811-23f0eed546c3@linaro.org>
Date: Fri, 10 May 2024 11:16:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pmic_glink: Handle the return value of
 pmic_glink_init
To: Chen Ni <nichen@iscas.ac.cn>, andersson@kernel.org,
 konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240510083156.1996783-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240510083156.1996783-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/05/2024 09:31, Chen Ni wrote:
> As platform_driver_register() and register_rpmsg_driver() can return
> error numbers, it should be better to check the return value and deal
> with the exception.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/soc/qcom/pmic_glink.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 40fb09d69014..8534a9692c45 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -369,8 +369,17 @@ static struct platform_driver pmic_glink_driver = {
>   
>   static int pmic_glink_init(void)
>   {
> -	platform_driver_register(&pmic_glink_driver);
> -	register_rpmsg_driver(&pmic_glink_rpmsg_driver);
> +	int ret;
> +
> +	ret = platform_driver_register(&pmic_glink_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = register_rpmsg_driver(&pmic_glink_rpmsg_driver);
> +	if (ret < 0) {
> +		platform_driver_unregister(&pmic_glink_driver);
> +		return ret;
> +	}
>   
>   	return 0;
>   }

Please add a Fixes tag

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK 
driver")

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


