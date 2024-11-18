Return-Path: <linux-arm-msm+bounces-38258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C19D1B01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 23:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEC3E1F22164
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 22:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A7B1E5711;
	Mon, 18 Nov 2024 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcp8S/pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411551E5730
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 22:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968243; cv=none; b=WuyeMpRsaXdPZuO1dq2pc+YN8Qn16kssLh2iKgC2qmrA7IH/tXICZ7IX59/ePEZjUhK8EJQZUEcP2HCunQ8/5jT7oAWC/c39WijE85flP8JJQy8hznnlk+KZLuYZnH97KBlnqx3HLkMOXwM5zxeEQ/glg1C+OVZyJz9wtS5RiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968243; c=relaxed/simple;
	bh=hZIvMyXtZWni8q5+iCDoHqgTW0z1eP+nNGIo28NDmRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtxj3Um9bs49mhGvPbngg1vcIry2yCkBCOC4+5NYqgANrhoRyNi4FKOUnqqmdQRKLW/I2aO3uGD3NawA8cLNWRM1SHkQD33+IqFG81Y8wH2OGihCMf5kb892RAqPjZvbjpgf99GrFjlPRaIQbU3aInTSC9YgR4+eGIMeiVc/aXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcp8S/pc; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e83daa12so692913e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 14:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731968239; x=1732573039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4J2lS2YmBPhVneBwHBuX6J9t5XJoyMza4FciI9dZ0VI=;
        b=hcp8S/pctrgE4OmEV+M6xkDxoMo4Y0PMgJ+U0IoD8UY5Bw9IVM19ORZn1vMLNuGCKN
         PsXR1yGDoYwlF8HcZb9m4HvEkjZT1lQfol24cUYzaqKhugkteskA2/CDusf6k4OF8ptR
         4KoAByn1iL6oIwfEnl5UJehtF+MDVdVRG/vOWCh4XwobZu27feA13rQtmuYA7W94+rD3
         ywwt8qtGyT2QmbmAuKdc3X4L821xUBmLPdbrCyP7FUsMDC+3WIk38u8QQv8siEVgfgNG
         fQAvlo1X2TPzdv8XxtjjP+ienhQjrmuDQ3+ydRi0d7/NB0rVYM05LJXIi9/PQcWXNZvJ
         IuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968239; x=1732573039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4J2lS2YmBPhVneBwHBuX6J9t5XJoyMza4FciI9dZ0VI=;
        b=mlCsIJFoddAwqogq6qOk9K9vBm76tNKKFudulaRvIfHT939sKmNNqtU5/U+p0g99Yo
         6q2Ef1urP/GNwjrWvG55ZAwsp8eBRo8wZ9w14ybZGUZVk+JFiNOp+ADwOp8geomCyGhe
         DPrNFENEZVD8CqBNDUebnITWl+YhoSEKBodF8W0ogNoQa+xLuYARg6qxnsANfSqPBQGN
         y+SBUFvjUAEb7Y6VCmxIOZlw/yS3lbKmkAPB/qRrZY6V8NgyJj0RsqAvvMGSBTSWAJ0V
         rjdDv3P96rB32JQHQ3f/aSGKSTOiifp+ccw3iE0e1on4xihB2idBEwNFuUbaZ0V3PiTb
         7oNA==
X-Gm-Message-State: AOJu0Yy2kV1YsUexGS6LLUrq2obmlAv/oeTa7BlhatRKfpeqGuPKnziJ
	PoN1p+jRv21a7HDxlMs+R7BykFC/wxfOfjIkGwB7U2NRtNQ5GDVgS/pvxq/Zfbg=
X-Gm-Gg: ASbGncvy6OCA7ErGOVO3ZyIHRbnXNEsD2ZX+zAJvLsrSZkmsplw+MzL82myQLX34DLX
	qv8dlcKhbJYE1AIT1h9Tt0KCwASPLQIT5wE+3ur2MMNZJjLaJR/IN0NCmnyu4DEe04xAwtokcjd
	Gw8oQ3Kd801cc6Lzi2iC8Oogw15BHuNQY8dXcBVoPK/qyHcm+fqtrmNAuNcHr3veczeAznVuBbm
	QYPkwpcldqGGzcv2z2VCW3UdCqzpHiU4d5svP3KjGUzDy4/sx8dK2I4Tq3x7KbZ8x0VbhOMKRmQ
	ZC+pwpo3yussjwMyZiD0QhWocXJK
X-Google-Smtp-Source: AGHT+IH7yutk9OuFHF7vFU1p9lx+sgBcPdw4/+MxXchsSnYtkuyHmZwIoY0dub0Kym16dEsIApX+Dw==
X-Received: by 2002:a2e:b8c1:0:b0:2fb:55b0:8293 with SMTP id 38308e7fff4ca-2ff60668453mr11518611fa.5.1731968239323;
        Mon, 18 Nov 2024 14:17:19 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff6985118fsm10566341fa.2.2024.11.18.14.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:17:17 -0800 (PST)
Message-ID: <8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org>
Date: Tue, 19 Nov 2024 00:17:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/24 04:24, Bryan O'Donoghue wrote:
> Right now we have a plethora of singleton power-domains which power clock
> controllers. These singletons are switched on by core logic when we probe
> the clocks.
> 
> However when multiple power-domains are attached to a clock controller that
> list of power-domains needs to be managed outside of core logic.
> 
> Use dev_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock being registered in
> qcom_cc_really_probe().
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 33cc1f73c69d1f875a193aea0552902268dc8716..b4377fa09f7c0ec8d3c63dfc97d04fbb8cd6e10b 100644
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
> @@ -283,6 +284,25 @@ static int qcom_cc_icc_register(struct device *dev,
>   						     desc->num_icc_hws, icd);
>   }
>   
> +static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
> +{
> +	struct dev_pm_domain_attach_data pd_data = {
> +		.pd_names = 0,
> +		.num_pd_names = 0,
> +	};
> +	int ret;
> +
> +	/* Only one power-domain platform framework will hook it up */
> +	if (dev->pm_domain)
> +		return 0;
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   int qcom_cc_really_probe(struct device *dev,
>   			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>   {
> @@ -299,6 +319,10 @@ int qcom_cc_really_probe(struct device *dev,
>   	if (!cc)
>   		return -ENOMEM;
>   
> +	ret = qcom_cc_pds_attach(dev, cc);
> +	if (ret)
> +		return ret;
> +

	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
	if (ret < 0 && ret != -EEXIST)
		return ret;

That's it. No need to introduce a new function, not saying about 20 LoC off.

Next, you have to call dev_pm_domain_detach_list() in your version of the
change on the error paths etc., fortunately this can be easily avoided,
if the resource management flavour of the same function is in use.

>   	reset = &cc->reset;
>   	reset->rcdev.of_node = dev->of_node;
>   	reset->rcdev.ops = &qcom_reset_ops;
> 

--
Best wishes,
Vladimir

