Return-Path: <linux-arm-msm+bounces-17896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3C8AA5F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 01:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B38C2284A8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 23:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3275757E7;
	Thu, 18 Apr 2024 23:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UyXDSEpS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815362E41C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713483672; cv=none; b=oOreViztYkJUx3BacjjBWuiD6GYUWpZIcqVPC5YU1tTnrraIpTj6wNawT4zW4PhEgwJYz2TDNoOtivK0FrFxrJfJo0OTmiB2g8y6/T+pOwwAao57EIyUZhh/Lqb381EQ/E95w58Fy1rmKX6Wq/+f1eD9+thLueNj9YFeyGPWgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713483672; c=relaxed/simple;
	bh=oS4EJBOFAK9U3IsQ2hlOiJf8LGZYq2pmuC4jtH1eYZQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtZ85KqfiDsGisJUcOzWnUEa9a8iK030Sb4UXusxM3CD+apShMnE49cmLM/KfWccE4IKKUhsiLF/sUuHps+r+Ez0Xqs51oFimtOSdDr/CyNyBECicBk+PyxPmeGFGpPsYJPApIn6mPjG96jSH+O96V1Qmzm8VEp1HNZp5+jT2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UyXDSEpS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso447119b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 16:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713483671; x=1714088471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGXVJHkqXUXGowXRQlx5v2hqDJp91SY1761utJ4P5AQ=;
        b=UyXDSEpSqJqSCCSRAl2GaHpDBNkxvH9trcGXi3/OH0yaxBRuswlMapSUeJ3JhCD7EM
         Cm3EDPMlbGvSrnRRLpqjOvfr9y0cuQyuNL5j1CfZJKucz1/btGJoRGDaWYK5L8cCWr8B
         AxpLcOqkt/2osDmRdb1cBo/gwWWGeKz7qNmghOtWbQMOrvQ7di7Mf/kDhebxJivQocdV
         qjTtd/6zR379lyi37KNB+HxSl3U+HgcDF0OXhsdCcdcSpvAceA3oNHQlLVf9W41LbfHT
         JYg4ZtMaieXfPLQ6q0CROJe9GzipCz2/2/0qgnQUU5IqwA9rPeSs4r4bOkwLXzjXCkXk
         4ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713483671; x=1714088471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGXVJHkqXUXGowXRQlx5v2hqDJp91SY1761utJ4P5AQ=;
        b=mi/LvfYG0Jrl4L/MWjrUDDm5IW4QRXWZwvMxU7rb3fJg1LRdkF+av0tH7/ZMtFY9+t
         ECQpCkj71Z5pz9G+ygrJHyrFMMtg7C1a98SzyKZAOYB5794ItVgzUoPn/8jJHbLe2son
         f9T1nycLytnKL6gnYfjRqvqnhwKojfJO1D/1SurWNDQL+FR+Lr5/GqBOG8Z1R6LL9+ib
         ztpeWn25mD/jILLjQn4pm2l9Acost3zM9kda81Pb0XmLak/DAZ2aBbMUiC0iKmXssExy
         lit1kEltljWCskDGh3rioUuJVna6Y5tWHDnscxtSEaTvw6OMgspPSPu5otlDBlRMmgEK
         UVaA==
X-Forwarded-Encrypted: i=1; AJvYcCVVNgYdbwrZJFwWAXIulV2xRzLfAaCA/QrjhFW15qdenoz5cHi1DTtu0IILP0lqIWlGEIbhHmFezzBRkdDCRJuYw3BYiPSYHiPNBu61cA==
X-Gm-Message-State: AOJu0Yy3E60+DH2Y9xYAqAKJUGE5OyCix5S3nb4JMB5via6BrrdaDHsa
	f1OotRGELfUglPZyNL1+SkfoJhccATERFP7cplGGkV/WIOsUxs5G1cBLl0cFUtGrWVESW6W2FPE
	llCrmpQ==
X-Google-Smtp-Source: AGHT+IHcWz5nk/GgsJQgu1UEhUdG0EsvhhpLCyj/MsQLD2WdQKca7fsvr1cU7UdC1GmlThxMGjCUMA==
X-Received: by 2002:a05:6a00:2408:b0:6ed:416d:e9e with SMTP id z8-20020a056a00240800b006ed416d0e9emr867794pfh.16.1713483670741;
        Thu, 18 Apr 2024 16:41:10 -0700 (PDT)
Received: from [172.20.10.110] ([209.37.221.130])
        by smtp.gmail.com with ESMTPSA id ld2-20020a056a004f8200b006eaf43bbcb5sm2050444pfb.114.2024.04.18.16.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 16:41:10 -0700 (PDT)
Message-ID: <15164074-f050-49ef-8e24-f64fc417a0b4@linaro.org>
Date: Fri, 19 Apr 2024 00:41:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: typec: qcom-pmic: fix use-after-free on late
 probe errors
To: Johan Hovold <johan+linaro@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240418145730.4605-1-johan+linaro@kernel.org>
 <20240418145730.4605-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240418145730.4605-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2024 15:57, Johan Hovold wrote:
> Make sure to stop and deregister the port in case of late probe errors
> to avoid use-after-free issues when the underlying memory is released by
> devres.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index e48412cdcb0f..d3958c061a97 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -104,14 +104,18 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   
>   	ret = tcpm->port_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> -		goto fwnode_remove;
> +		goto port_unregister;
>   
>   	ret = tcpm->pdphy_start(tcpm, tcpm->tcpm_port);
>   	if (ret)
> -		goto fwnode_remove;
> +		goto port_stop;
>   
>   	return 0;
>   
> +port_stop:
> +	tcpm->port_stop(tcpm);
> +port_unregister:
> +	tcpm_unregister_port(tcpm->tcpm_port);
>   fwnode_remove:
>   	fwnode_remove_software_node(tcpm->tcpc.fwnode);
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

