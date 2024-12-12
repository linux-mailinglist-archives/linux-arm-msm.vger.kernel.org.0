Return-Path: <linux-arm-msm+bounces-41762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411B9EEA01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB2D2854D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F3D216E3B;
	Thu, 12 Dec 2024 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rdclVWOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23228215F5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016060; cv=none; b=V9IgveyWG9//MgypAw3azBI2NGC9UMnZJZfTsZrD0KSArQ08kAaI4iVv4Vu8j4cvWgkKwXR/J3KIcCcXTDDlO7aFTsFSSGFUizwADGY1bhtMrfDfSPL9U7VBrStwClfTCtSn0komxgqVTsKVSVUBWleAt3uP6e2HgGE8LnqfFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016060; c=relaxed/simple;
	bh=sb6oG9rE63TxzWEPgvSrhTFsRmaz/BfgO/7IjyWBxkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Szi7/a8eDG/lJ89ckHHa1qI4cfrE5qmrKLyEc0ofjlNrNNv/1ro5Ix1rg4kygVumpINgNHJ99238z6vFOus49iBCP4mUGqtr+A7mPWNaeHa/6/2g6tkmszAvUP442t17H01om261bFl6ugTqlyG5vw7YOFe/32EguVy787e8HeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rdclVWOc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso95943e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016055; x=1734620855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hu3ueXOcFQnrt5GB8STLjO2WhFAqrfft1MBKmKBry90=;
        b=rdclVWOcdvOIpczrCNuPFA4OfOQ6FfGgccisZapbTvdV5eJ8tBXd4P8agQK7c9K2/C
         bXW+A4BlTNvsUxlO4isuAYB48KS6s2BECs20jYdaHq35gOgovDvP2FLu1OQusmjURXam
         VKppx/tiTCDBFMtbLl06FChtJrwdV+M0YVsznn58owshe2H4Y8nGJMFeMdNYtUH8NRK/
         NONqhaOhy9YIE5Xwc9fNE4xb/w6GVKHJ3JXOIh1fwTVXXJ5bLwVJf8M2MSuMMFB5MDRI
         xYaz6uVFQVExjns/XQGusUyW/E/QR6QCCDbqLhmrAuvkmOo4TuLu3Tmw0oKHZ1vQ6og0
         0jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016055; x=1734620855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hu3ueXOcFQnrt5GB8STLjO2WhFAqrfft1MBKmKBry90=;
        b=DW399bj+WorGnimQ3sIC6/gPEZMdnh1ayP3VqCs5jBROvTPOPCawRIJzPkhD6I6FZM
         EaKdfvNMfJ4QMayaZKqj7gxB+JhZzVSLMYvcBlYFAEUnYKJOpk1a+aTqXjqffwahGhy3
         sOBeLAWzKasRioWI2oZsDDRMnHOhf8kIpH+JO154eIQ9Qg8E8ZNb9a+6Y9TR6tQZcZ+0
         IJBO5hd9JXle2LW6+AcbND6DfcURoBUKiA8aVTh4lboJrkbcInMzAJPIeZzsuT9Fm9U6
         JsXjiK0BrtnaovrSyFD8fQXjAcs4AkYeDsUaMC+PKOwtUcRVG+LcD8Kp+5iLCLHjdk2w
         aM5A==
X-Gm-Message-State: AOJu0YzZeJvrmhZtw+q2HxAP2QZHu5wqlyFKZo6SWlNFaRzLSlNadcrM
	NzEFTTbqh55C2BXI+truyf5owFybtP/cwL1x4vOLB+SG26BRTymbMASIsdWyShc=
X-Gm-Gg: ASbGnctWWAZuU9kWQ+ym0U8XdyvFNHURahBokZS92L2ohZUshvRT9pVJthp3uDoUlgX
	muMinFCTuPoauj/US6C9g1BFe10XdFZqaLSc4P/DBihF+Q5UL1CkQxiTsz81BmY8Ys+EKFywI+p
	a2R10DcS1o9oPaHxaZ+Zbd3+FiCG5D8PqTNcTWFwWyQCLqrfarWrZ/4dPgHD6CjYD8mHsQJrMo/
	dBo195De+Zmm2n6nDfmU3epXoXRKoUnbm183C4XWSsXUAo/EYZeiV5fIB4KHZb0cSyhvnxrTvQh
	BE492aGpNKZDHN9AfRjUoC7rI2jFm+M75a0=
X-Google-Smtp-Source: AGHT+IE6zBhOzaCS4vwQvWRGk/AAchQk2VGWvcXCo7R4mu53JG2+2MgWawKgUm9kDzPXuy4dX0Katw==
X-Received: by 2002:a05:6512:2342:b0:540:1f67:68ab with SMTP id 2adb3069b0e04-54034106475mr111958e87.5.1734016055060;
        Thu, 12 Dec 2024 07:07:35 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b5ef585sm1553996e87.233.2024.12.12.07.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:07:34 -0800 (PST)
Message-ID: <14aed353-70ca-4cf3-ab8a-b4b1068af160@linaro.org>
Date: Thu, 12 Dec 2024 17:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-2-5d93cef910a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 18:54, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -22,6 +22,7 @@ struct qcom_cc {
>   	struct qcom_reset_controller reset;
>   	struct clk_regmap **rclks;
>   	size_t num_rclks;
> +	struct dev_pm_domain_list *pd_list;
>   };
>   
>   const
> @@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> +	if (ret < 0 && ret != -EEXIST)
> +		return ret;
> +
>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

Looks good, thank you for the update.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

