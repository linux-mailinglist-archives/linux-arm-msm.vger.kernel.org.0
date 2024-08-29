Return-Path: <linux-arm-msm+bounces-30066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32081964CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0E401F22A6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11631B6539;
	Thu, 29 Aug 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GTRwDYmV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876231B5ECA;
	Thu, 29 Aug 2024 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951317; cv=none; b=SXx9nznRk2E7zmZ/XrBSCa9qZK0OotFWYLLd4iD+2mZggc/kn6fmC4seboyPVLJn3KseYp9G7pf7MwKLGPVfqfJQSwWVGvxbqGmw09XR+pJsoUq0J4VJrjVkKslBlSMlUjKovclhtyjSu1+cplmzPdGvF8/Jn5zfM7Kg1Td19f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951317; c=relaxed/simple;
	bh=nCsfZR0DC6lf6gcln2KJvvNw1BZHYsRdAEITqq8RUd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJSVSuFXm1H2Lfwa0IL36dNxKqVuvZ/wAxXE9kA08t+ThNPL8KHHVW5BY2ti+McF1a7BS4LYSmzrTmR5SDAGpFek38K54NgByHJ6rw0cl+Ewbk0uR3SjrV79zrLee8LjfrRrox8hEcZBXRf06gkuSrhEkfrj4eBptQN9Y3D2CJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GTRwDYmV; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id jiUCsyvkeaZQfjiUCsKfCa; Thu, 29 Aug 2024 18:59:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724950746;
	bh=U0rARhUcsMEGaXLPrLb2Io5v6VQIJivXpcySQ5zqyt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GTRwDYmVWu7ZmIc/5J4OSl7GuXt7Xblb9X4HcsI+x0+SKyL48fTUgSpTx5YVyuMBE
	 J2VR0vAwQh1ZDrZSg0ZMlba+knOddlqLh3MXtYlqJJd1itWWDhlRC11LSAESVZup8d
	 Nm70Lb8SYQvYErTVKwOJScy3VEEjfZXN0q4ZzJUdrQvMFRRC6wFj3ltkL1cn6KpKLq
	 GCMEEJxVu+MdwcjK5qTEBHsDKqoB70SkjXQ8xY/959AWEmtBMFG6AUwuILcC3T3Qye
	 NKEW1xOzgHNPL7Z5dHeLuNd4SpkycbaH+5+hBDwq9lomeHalSUgK7vUiD9lgbZZ8pW
	 m7QlII75+HiXQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 29 Aug 2024 18:59:06 +0200
X-ME-IP: 90.11.132.44
Message-ID: <c2464c65-836d-4609-b40b-2e3df4012688@wanadoo.fr>
Date: Thu, 29 Aug 2024 18:59:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: Fix error checking for
 devm_clk_hw_get_clk()
To: Yan Zhen <yanzhen@vivo.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240827025252.3512746-1-yanzhen@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240827025252.3512746-1-yanzhen@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 27/08/2024 à 04:52, Yan Zhen a écrit :
> The devm_clk_hw_get_clk() function returns error pointers.
> It never returns NULL.  Update the check accordingly.
> 
> Fixes: 8737ec830ee3 ("clk: qcom: common: Add interconnect clocks support")'
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
> 
> Changes in v3:
> - Providing a "fixes" tag blaming the commit.
> 
>   drivers/clk/qcom/common.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d..5a9e653916ea 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -273,8 +273,8 @@ static int qcom_cc_icc_register(struct device *dev,
>   		icd[i].slave_id = desc->icc_hws[i].slave_id;
>   		hws = &desc->clks[desc->icc_hws[i].clk_id]->hw;
>   		icd[i].clk = devm_clk_hw_get_clk(dev, hws, "icc");
> -		if (!icd[i].clk)
> -			return dev_err_probe(dev, -ENOENT,
> +		if (IS_ERR(icd[i].clk))
> +			return dev_err_probe(dev, PTR_ERR(icd[i].clk),
>   					     "(%d) clock entry is null\n", i);

Nitpick: Maybe the message could be updated as-well?

CJ

>   		icd[i].name = clk_hw_get_name(hws);
>   	}


