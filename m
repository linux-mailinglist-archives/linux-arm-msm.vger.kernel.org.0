Return-Path: <linux-arm-msm+bounces-29452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631795E7E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 07:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8EC42814B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 05:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EEA46E2BE;
	Mon, 26 Aug 2024 05:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="k9UQyLkc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A810E9;
	Mon, 26 Aug 2024 05:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724649901; cv=none; b=VmmSFx4E9hkXrD3e/A0b/7zUrwSKLxeyNVQ4uWoC1fuF6BaFlOaqFXjLGtFiPL4dWMoH4Llq3jI3ZOvTgLKqAd5zZQ+XvCIfYlWDPmdV3HPgJPsrJhbEze3WG+D5O1IOloBzjmau/+ET9txP/ji/vbzBusQsjC3NAPpgV7GZX+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724649901; c=relaxed/simple;
	bh=xT+b3mCpR2IWOUUyoU1Bc9MeTR1a2OyiTPVdNCp/4zQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8/VmX/oso1Ntk3/yQkqPpSogeMTpba6PjZfnfurC8Ah5WmkM4vdGZvWI4hCmgDCv94Qt88fuoAwOaQncjdVepCfr+SkWqRjm7pNzZ5Q0mMCt5mR9WqTlpAyo7Fxvfj2tBN2jtA3byst+5SjjtOMYY20jvSplywgVuLASCJXM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=k9UQyLkc; arc=none smtp.client-ip=80.12.242.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id iSDhsw5otCul1iSDisTV96; Mon, 26 Aug 2024 07:24:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724649890;
	bh=h9w9rRHEzPHjSN1CJVFyuc/CJJavKryjn1+BVvWjM7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=k9UQyLkcwTX0tj0VuWT+ylcO+oQqeHt7wjc4AkT19lX7OsfdEHZFWqamUp9xkfhos
	 mev2jd5WQ4nYxM3UuEUT8gzh/UIOtQzp/jKcYAslR7jWRRQDFc8iKOkxT/93VN2FoF
	 uRqpGcQRJm5X9JCNJBYS05y9wSWIeYqfgVXCWDkctRgcKU6l0nIPMCHQ0uft+2L/61
	 gl4JO6CME9nB/DKxDtluQB8iBzfLzZEraP7zaJK/5ycdOlLKjgj1c9cri8kG6La0SI
	 tMKgv1NCNCgeKFoGjw0XWaFNdLOnfdBoEuR2FNsZzXJQEzLET8zWEbsFD8tkSJEqFK
	 dKIGdT1rAyTIg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 26 Aug 2024 07:24:50 +0200
X-ME-IP: 90.11.132.44
Message-ID: <98406a86-5f25-45e0-8b19-f3f3cfdb5e0b@wanadoo.fr>
Date: Mon, 26 Aug 2024 07:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
To: Yan Zhen <yanzhen@vivo.com>, mturquette@baylibre.com, sboyd@kernel.org,
 andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensoure.kernel@vivo.com
References: <20240826051233.1937767-1-yanzhen@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240826051233.1937767-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/08/2024 à 07:12, Yan Zhen a écrit :
> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
>   drivers/clk/qcom/common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d..69c7876fac23 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -273,7 +273,7 @@ static int qcom_cc_icc_register(struct device *dev,
>   		icd[i].slave_id = desc->icc_hws[i].slave_id;
>   		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
>   		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
> -		if (!icd[i].clk)
> +		if (IS_ERR(icd[i].clk))
>   			return dev_err_probe(dev, -ENOENT,

Maybe return PTR_ERR(icd[i].clk) instead of -ENOENT?

CJ

>   					     "(%d) clock entry is null\n", i);
>   		icd[i].name = clk_hw_get_name(hws);


