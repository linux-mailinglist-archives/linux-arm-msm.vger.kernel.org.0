Return-Path: <linux-arm-msm+bounces-25820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8E92D04A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 13:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A05941F2149B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9AE18FDAA;
	Wed, 10 Jul 2024 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gt4vGZ7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3824418FC90
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609948; cv=none; b=l5ZrjGsCZjsmXBEe4Gw32MzTDdMYVeaaR8+MPTj4sPs6k0SsTYBlQrjQew8vgCnDhEs30bcgCSoi38VYI0Aq/0XOo1WX8jWRw2lB3n1r7aedDf00Epwq0QYoL8HNBsROImfFkbqtQ1WCuqZVmHsG5UXMPZNxGdfXmz6r5mHeVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609948; c=relaxed/simple;
	bh=SQ9kCUdzACmuHwpugnHBMoB4qv9Vh8LB8PCdqYhcXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsaOQEqCb0f1ypUTPJe4vF9TbOkx4uLnQ/s2BsJtbIipbqphpPGqbtFh+9Ui70WXvoTpOiUo+eah7KPjd3GTh5MNk9tDCjLabzvusWPcFFgn1V1HDgUtg54FrhNiqzE5iX/+8S6YOr/ADjoAq8ocO2iEX4FCf6fNqeogCePfJJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gt4vGZ7p; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a77e392f59fso484781066b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 04:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720609945; x=1721214745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vB73kdSFUrPUhND8XfaA5GR0yZnlCfSAO/xYLehxM4g=;
        b=Gt4vGZ7p88MasGNKshAivBTMouRGis3G1cJC4lMWMTmZK/3tdREyJv81jWVVwhQSvq
         cSLkKPX0MoHpSaLEK7fCNd/axOxVGscsxz+8Hm5ln7rtTrNLOE4Si6I5l2KeX66Wi2H0
         gpg0fGGCmRnN2Bzz55ajg4dys0z950pxY0Is6A4EkZjnBnMyym2eR3/9NOUrrfuW+dMB
         w9rAgMHBP6TO+2gEHvH19zrbvq+rMK58kuo7IUEi45Wcs78SPKJthT5hm/asnXgkc8Zp
         lZOp0RovJpG6FqKANz/AGjKNLlnIeL93KuPBa2fCRHsqiGaVvE6z4yv4rMnPP1wEOQqJ
         G/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720609945; x=1721214745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vB73kdSFUrPUhND8XfaA5GR0yZnlCfSAO/xYLehxM4g=;
        b=pOSfBCq1thy11Y20og4Gyspkg9fstd6v37C0sVKb1lzAk95Ku3pa4rYMRT1JDGDYHg
         6IGWMCzp80mHtTfJz4ziswHSbR8bXzMXX++aTjlbBGZX+ZFYOCc0W32V7rTl3OWi7cfq
         Mxgfix4vfFJpCgL0OUg7BEsK6lbdQ7eITh9GIgKJh+T4iOgLQic6461T7NzafsKG8yLO
         2YbnA2G564nfunBHUCHwp1CqH26h6JL9Io5CSkzoxW1AYUmqMjnLylcOu3J4r0Bvuybz
         9QSDnahArbEOQmMA/N+QV5VLUqqjaNu30EwC/ClGy+ejQmFoKdftT5/DPsfDsiOSr1ur
         pHNA==
X-Forwarded-Encrypted: i=1; AJvYcCXrgQFCQfiQU8gLx9Vx+c9Okp2lCEIkfacupuRP3tyroCU7pG/t8H/mjn+ePxy1XEBXCknJXzfN9jNHrmgRZ95aYcuVMrz//aqpbrvHsQ==
X-Gm-Message-State: AOJu0Yy8KRlnsFViu8VJc6RV646JvPWUvzrTVqZlEiaUuT9mOf5dpTY2
	XDffxKMlDtGZFh9+lABLFcclerJPh8J0tkoqIBp11TmWeiWgmyOITU+lAbqeRLc=
X-Google-Smtp-Source: AGHT+IGHqUcDkpZ772nIx5h3EY5gdXnCfr4kq3q/jYYK+E4mE0Rnt1Tusk0df0PZl6CDki0a7+OOUw==
X-Received: by 2002:a17:907:d8a:b0:a72:7c0d:8fdc with SMTP id a640c23a62f3a-a780b68a311mr413889566b.14.1720609945265;
        Wed, 10 Jul 2024 04:12:25 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a871fd2sm147849766b.213.2024.07.10.04.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 04:12:24 -0700 (PDT)
Message-ID: <4c3ada32-1476-4d98-89d7-7b2ffa0f9a65@linaro.org>
Date: Wed, 10 Jul 2024 13:12:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] soc: qcom: cpr3: Add IPQ9574 definitions
To: Varadarajan Narayanan <quic_varada@quicinc.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org,
 rafael@kernel.org, viresh.kumar@linaro.org, ulf.hansson@linaro.org,
 quic_sibis@quicinc.com, quic_rjendra@quicinc.com, danila@jiaxyga.com,
 neil.armstrong@linaro.org, otto.pflueger@abscue.de, abel.vesa@linaro.org,
 luca@z3ntu.xyz, geert+renesas@glider.be, stephan.gerhold@kernkonzept.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20240710061102.1323550-1-quic_varada@quicinc.com>
 <20240710061102.1323550-9-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240710061102.1323550-9-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 8:11 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> * Add thread, scaling factor, CPR descriptor defines to enable
>   CPR on IPQ9574.
> 
> * Skip 'acc' usage since IPQ9574 does not have acc
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

>  
>  	/* CPRh disallows MEM-ACC access from the HLOS */
> -	if (!(data->acc_desc || desc->cpr_type == CTRL_TYPE_CPRH))
> +	if (!(data->acc_desc || desc->cpr_type == CTRL_TYPE_CPRH ||
> +	      of_device_is_compatible(dev->of_node, "qcom,ipq9574-cpr4")))
>  		return dev_err_probe(dev, -EINVAL, "Invalid ACC data\n");

This is something I'd also like to fold into v16.. perhaps 

if (data->acc_desc && desc->cpr_type == CTRL_TYPE_CPRH)

could work instead? this way we trust the programmer that
acc_desc's presence/absence is intentional and only throw and
error if it's present with type == CPRH

Konrad

