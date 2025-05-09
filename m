Return-Path: <linux-arm-msm+bounces-57355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF1AB0A81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 08:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 125553BB057
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 06:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5310F26983B;
	Fri,  9 May 2025 06:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="OZgC/Hn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-73.smtpout.orange.fr [80.12.242.73])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7B422D9F2;
	Fri,  9 May 2025 06:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771713; cv=none; b=XmqcoWInYZLBolIohQszGz8JAWMvXG+MZIGv30Ffsl3dhzskTh13p1IBwVyp+3SWjL5wRoli4K7zfFxuQuRP0tgYYXcFD5ucA9psSmNW8uYRLSSe2Z6iKmbx5rT577bOoK0XqeZTwHKqpLKEyAlxvk2Lry0fTb0fz2uilgu5alI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771713; c=relaxed/simple;
	bh=eMIbIZO2LNu1ba9vmPFWelJExTJoxfAefdLcbQm2tMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYHieh6S85onfy6MSIIn8m8/xZ5YKg3c3G2j13k/Z5+7FwDxtQVI5KPpXUZ4/+NqLqrOW9/ppcphzj70pW2LpKheYi9vsafquwC7kQGpMfaK80Oc7MGRbEPm8knS2L4efMfCl37aTSswP6aM2kYuBEm4Mft9Nqv3eEbvaC3JdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=OZgC/Hn3; arc=none smtp.client-ip=80.12.242.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DH65uEvkuKbq8DH65ukVB8; Fri, 09 May 2025 08:20:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746771640;
	bh=5JKgoLO4kNRuFom4Pfd5tvVV/+IdX7PZ3xj8Bm8rDJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=OZgC/Hn39/X/p3DbTI7Cq+n2Y/vEEOgufGvGfZqQElJWXBfGse5SlpmHRJPJobTAJ
	 37GBaRuT2m+7oaNc2wd5dti3Ns9WxmDBa2oHYrpkFU5Bi11qmn7pFFp0LMk5SO7y2q
	 urSQggVgZZa/N/JnuyouFN422hV6vQJzEk6Hue9Q8Eur0xiIPbfcOkMfdI8nrn/qOQ
	 QOBrNwaptoHxFvPEYYigXJrz5Pi0LS86S9RA1xR2WxZRaTaNkg6ySP0tCRar9ZtAL0
	 wRW02YKUKUrJ2U3Xy5Mod18zXDsLHHvNbeeH6CQirxea0GP50MbULn6IzY/4i4Hp4m
	 GKb/CikKi5CVQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 09 May 2025 08:20:40 +0200
X-ME-IP: 90.11.132.44
Message-ID: <22aaebb7-553b-4571-8a43-58a523241082@wanadoo.fr>
Date: Fri, 9 May 2025 08:20:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] extcon: adc-jack: Fix wakeup source leaks on
 device unbind
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
 <20250501-device-wakeup-leak-extcon-v2-1-7af77802cbea@linaro.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250501-device-wakeup-leak-extcon-v2-1-7af77802cbea@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 01/05/2025 à 16:33, Krzysztof Kozlowski a écrit :
> Device can be unbound, so driver must also release memory for the wakeup
> source.  Do not use devm interface, because it would change the order of
> cleanup.
> 
> Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/extcon/extcon-adc-jack.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
> index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..557930394abd25771799733a22121d1f8e254918 100644
> --- a/drivers/extcon/extcon-adc-jack.c
> +++ b/drivers/extcon/extcon-adc-jack.c
> @@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
>   {
>   	struct adc_jack_data *data = platform_get_drvdata(pdev);
>   
> +	device_init_wakeup(&pdev->dev, false);

Hi,

Shouldn't this be:

	if (data->wakeup_source)
		device_init_wakeup(&pdev->dev, false);

to match how things are done in the probe?

CJ

>   	free_irq(data->irq, data);
>   	cancel_work_sync(&data->handler.work);
>   }
> 


