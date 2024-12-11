Return-Path: <linux-arm-msm+bounces-41485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4469ECD69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EEDE188BA29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554A42336BD;
	Wed, 11 Dec 2024 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nmvbd8Jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919E233691
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733924216; cv=none; b=Ju0sOFja4laGRk9HqrnfD1BLXYfWIW7vLemOidiR+p4xnM+0Fm5Wj2i3WL6xIXlTEDqgCj087VmBcZeyEqsfOhI8choAL2WrAJeAc+5zBAU6NWyOsU1Xh136dlF3EL0wVi8cFi+zH1t5qp68FUySAq1VfnxDgTxek+HRL8hYfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733924216; c=relaxed/simple;
	bh=fuXYp1uvXlvOHM0BGIwSdW+Neg42eTmNvggMnkhRUIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+rAmLt0gHcNfJgl0Rv7mTSrDZAby6lTnbhGKQW+YJMrkZaxKKWnTf/dNpzHcvwygFQ+kmMPQFYWG53Un7tlgHnwtfrkzP2qal/kfk+/FmR3ylRx6q1PQ0Ow3PXRCodJvJqa2MRof9zuSWf/MAFl/WwCNn+8qjA9R6EFipQJWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nmvbd8Jq; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de3ba3d39so1232275e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733924212; x=1734529012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEbwGtbe9naMX/pU7T/wl0s3YzTrymq39FJreAC4edI=;
        b=Nmvbd8JqPxpXRl9zL1BiSZxEyln59DzinMMkZxLyZwzkZc4GKyzLyMOpTSh+TsZU1u
         1J6kdV4zOpbvPaUlhO34PjLkcEI2FkuLwS8kr6pudf7Y6iOnmqHq3Xvp2hJGO0MzLbbk
         Kq7Rho+Tck/lwg2utCGAWd565sb0Mq8VajDAqS0SFBZ57aWrUjTBTpMa/oXAPGN+LP+3
         iShYI60SBdYnQKjW6wisIIwiJSZdWBY7XB5t+HGCyXqb9G+sXX172XgAmTqRhwT+C3y3
         XXTpZH+HiYS0TSc1U6Kq/hEPP4Ke6PFcpapdGQqOLPfZD4C1ykd7XpcJf3Z1WfCdg5tY
         /pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924212; x=1734529012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEbwGtbe9naMX/pU7T/wl0s3YzTrymq39FJreAC4edI=;
        b=WtcgHMQ4THXbrI7LQsANMBF0S9GxdbCNkmZa4SNX2JrwJe01Mji73H/r1ooX7RFl9p
         KEO89Qek+PbKZG2Qd2//Xk60WQRAyWcXF8JSDyWgKxeA82vsTtJpHV1XwKwdsS49d9Xx
         WvFSKId3DKJeElDJkmNvZpCzLz2hsRhOQrD4/yd9ii9GhNRDywymjyG1uZwVa8kc6vmm
         YGmlx05D696MOqk54w6Oe25f0KSJPk4YCL73FecEMIcqEzqU+JdWmO5t1gVNjpVDno/a
         gOQ8hCfKhNPeLtyT6HA622lmuKcJHFDsuug4HHn9u7+0+M+5aRIe3RlIjkao85es25JP
         NoEw==
X-Gm-Message-State: AOJu0Yw+UN+3oOXnBW7pWVJh1BrIWNr+mMebn3PoLkSzvpjij8d2qyxI
	Am1ivf0kt7d0d/p0LtB5IqX42Fa9fat+qVP526yGG6qlyPOxR32ePkwmBDkNJu0=
X-Gm-Gg: ASbGncslGZKzmHDJVU8VczqbIu/lp8VCd11jPl9Y4nBEASpOMuP1YUpVAUV4EOC8nHs
	IwscIwbCgaxPQba+ErW/IoQwBUNfZtL1lp4ORiBfZyEfSZBcsK5UjxB3mFUmgOiVFk5O8nFi7ef
	mvYCz0VterGxT+ns7xbBidrWXEK1XAUG7ZIBfvcuUlw1dlwX/ozHsZKr/sBklwDCXPJ451shCg8
	7XEjyP4ssn3ouUu5le3JMeMsSs1879lVmg7by9J13+dH+fPKWABYGWklByRtcsBGG3GZdj+So+C
	DYV0FjfGmHitvNshWu2EH1235qT7g2Lh
X-Google-Smtp-Source: AGHT+IHHGHISPWwoOfSLQHxkKBfu9jAmiwtrWrntxuCBZKz+ikghNTm/6FcJSOAcYPNYw/C/JlHI5w==
X-Received: by 2002:a05:6512:3c9c:b0:53e:df2b:df1a with SMTP id 2adb3069b0e04-5402a5e83c3mr291795e87.7.1733924212381;
        Wed, 11 Dec 2024 05:36:52 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401a3a4c24sm1264587e87.199.2024.12.11.05.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:36:50 -0800 (PST)
Message-ID: <fca39cde-b9c8-4f1d-a4d0-92a1d739b57f@linaro.org>
Date: Wed, 11 Dec 2024 15:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 12/11/24 02:27, Bryan O'Donoghue wrote:
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
>   drivers/clk/qcom/common.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..e6a024e95ab5f4b0776ffc6c7b3bebfbebb007fd 100644
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
> @@ -294,11 +295,19 @@ int qcom_cc_really_probe(struct device *dev,
>   	struct clk_regmap **rclks = desc->clks;
>   	size_t num_clk_hws = desc->num_clk_hws;
>   	struct clk_hw **clk_hws = desc->clk_hws;
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_names = 0,
> +		.num_pd_names = 0,
> +	};

Please remove the added local variable.

>   	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);

Please simplify it to

	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

> +	if (ret < 0 && ret != -EEXIST)
> +		return ret;
> +
>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

--
Best wishes,
Vladimir

