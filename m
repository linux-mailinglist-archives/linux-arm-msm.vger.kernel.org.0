Return-Path: <linux-arm-msm+bounces-16644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FBA89AD87
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 00:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E3FCB20DDD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 22:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B69A537E2;
	Sat,  6 Apr 2024 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s2fmgIr1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F715338C
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Apr 2024 22:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712441003; cv=none; b=JzgFsjlECUBowHfYPT9eqjexFaoJoc7LOpzZg5byWj+OnlGdCQ05/J71BcNa9NvhYfXHgq1Ra/FGy1bFZ/qmTFEQF0hI4NiRkbcmR/lHPIhZBIMDEY8d3lu0PKI4/dyhdn4A4bECD8HAtneuGe2X9jsNR5G/IWj7WtBY8LYdNp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712441003; c=relaxed/simple;
	bh=IMO6CD89TVo8qWq0/qdkA+3x41O1FzftCZquzI8qcsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5la23bjukP0AqSTawUuBMHEPdk6ivnEdSeRpU4tKtoTNOi7s74k8b1hCHfDVqMy78ssgDWvPOiGD1slAqFY+uAJVQLHjG6CJDD/bh7n7Dmo6PBcnLxfFLZ61S6MH6vySrXvMyBP1B/h/ug72oSR16KAe/zeNszMu6f9PyZuSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s2fmgIr1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4162b8cb3e9so27771565e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Apr 2024 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712440999; x=1713045799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cOT28vLXeenuTF9raPMx7mM8udpRFqntILqCAo6YXaA=;
        b=s2fmgIr1S6iIq++ZePr93wquCULNfp/hMSPjPHVso9WpuRJJmYKzXccCKA1R/7t7jr
         5I1gmNhKhmoos6aImsP1VUt4zQxCkuwj1gaD0N1Tx/T8wTM6FAcctaIf0NjUsKO52Eav
         UIiRb0yGJhPqeTftN8WSqc88belSSVziD+E30NDFfhWLAn4frT4bZLsAOIZYgxI/0DCA
         Y6AZhYkUrC8StaYTdjpTUHgUpoJtZJQUkXa1wM9cqvO4f/hlPzjuc52OwgELk6XOwfFK
         XM5fWie9P2fnUmW+5rhL6UInlHKj/xRplhoYggkwlOTUDpFDLzUUjD5XtjqDqGeqm7hM
         y0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712440999; x=1713045799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cOT28vLXeenuTF9raPMx7mM8udpRFqntILqCAo6YXaA=;
        b=jlN9bg/Kod2l+PrK2gqHg/aAaZlGUFapob4hCBtBamno8YNnzRwusWt5CMbkqySH/4
         FHi8uPvUBWP5sdJ2Ij5eSceI9nNVl6GZSAC4ICPLSdzfJgrKrllM/G7HW5Ot8mqrjUzA
         08qLvllGT7MgAC/bfmH3JVKP49FAH4QVo7ZvA2rlOKBa/veI2c1uDciQtlxU7F5MC+62
         u97kXI3q6DP8tcJRQREWxaklAf28AmG8F1T6WnFf5f0bYBB3vuVTfDbofjrX8ImFW/Iu
         WYvs/zUfO+bcNRzmrj70GsLS30/prG6Mqf0dKnLUaImOacTMHj8cXXa9QSHAMFi1zfoN
         T5tw==
X-Gm-Message-State: AOJu0Yz6qqH3SqQry1VWLzJjZdN7351tk8SSmo20t/7dlKMnxzm5v/7g
	fWJNdrv+DVu4hHlDW/iQF8SsxH/+mdpWdDQEMSQZ0Hulda/xNxRNQLKFp8UzIWk=
X-Google-Smtp-Source: AGHT+IEZN1L85x79gQ4xMojuOPnIGHgKi2wu24OvxCazvAYLzctdWT//NwoyqeeAEJaSlVvVP++iBQ==
X-Received: by 2002:adf:fdc9:0:b0:33e:c91a:127e with SMTP id i9-20020adffdc9000000b0033ec91a127emr4313074wrs.63.1712440999316;
        Sat, 06 Apr 2024 15:03:19 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r24-20020adfb1d8000000b00341b451a31asm5380465wra.36.2024.04.06.15.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Apr 2024 15:03:18 -0700 (PDT)
Message-ID: <c1899fae-8669-485a-95bd-0e76738a1187@linaro.org>
Date: Sat, 6 Apr 2024 23:03:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: split HPD bridge alloc and
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2024 19:11, Dmitry Baryshkov wrote:
> If a probe function returns -EPROBE_DEFER after creating another device
> there is a change of ening up in a probe deferral loop, (see commit

*ending

> fbc35b45f9f6 ("Add documentation on meaning of -EPROBE_DEFER").
> 
> In order to prevent such probe-defer loops caused by qcom-pmic-typec
> driver, use the API added by Johan Hoval and move HPD bridge

*Hovold

> registeration to the end of the probe function.

registration

> 
> Reported-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index e48412cdcb0f..96b41efae318 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -41,7 +41,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	struct device_node *np = dev->of_node;
>   	const struct pmic_typec_resources *res;
>   	struct regmap *regmap;
> -	struct device *bridge_dev;
> +	struct auxiliary_device *bridge_dev;
>   	u32 base;
>   	int ret;
>   
> @@ -92,7 +92,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (!tcpm->tcpc.fwnode)
>   		return -EINVAL;
>   
> -	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	bridge_dev = devm_drm_dp_hpd_bridge_alloc(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
>   	if (IS_ERR(bridge_dev))
>   		return PTR_ERR(bridge_dev);
>   
> @@ -110,6 +110,10 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto fwnode_remove;
>   
> +	ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
> +	if (ret)
> +		goto fwnode_remove;
> +

Is there any reason this call comes after port_start/pdphy_start ?

I think the bridge add should go before starting the typec port and 
pdphy since after the start calls IRQs are enabled.

With those minor points addressed

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

