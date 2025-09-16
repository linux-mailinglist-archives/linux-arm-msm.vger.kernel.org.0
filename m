Return-Path: <linux-arm-msm+bounces-73723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C659BB59931
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 16:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7979C1886285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 14:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8388129E6E;
	Tue, 16 Sep 2025 14:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOCGnvwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16B425F7BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758031944; cv=none; b=TYge9y8Ks+OHygDypxtxYPNspcc/1BFawRVimWu13Ui7KWV/pjtkYJkBx7NVxvZt+wBVyg9IkcuoVqcy0vmai2euBK8BXh1Ltk/WZYSAoj4ZqL3v00F4T8GNx706H/ceZHc0WfGzzbqvWYYcrUA+C3AhfEbBrCX+RPdrz1FGKOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758031944; c=relaxed/simple;
	bh=fVduY9ChM+XTiJ/WxOZb5vLjE0k0RtwqZkyUiEW8pZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QoB6YuhvL/xprn+TGQlqY80B61moraAgO6dALWe3+yWyXsEfaIpRmj4opz9T+z8+iARgjXfl0GTFd3QTEdUftIV94qGQEnNbjsgPS3I0xYERjY1HfmUiJiShM4zFll8usniiFdPz4VgIFspWHZm8JCE9r6NvtxglWWdHox1xU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOCGnvwg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dcfecdc0fso55337715e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758031941; x=1758636741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ihTrH7t7gLzKRumooOOczb4IBjokkGyHJ2+QxNRMxY=;
        b=mOCGnvwgcrU5KMtGEYRdZSbfkuz1xSxEYBDr0cn6QPZPfHN3Ekbdo2d4sqORAIe5Md
         BWG3CUqFvXoePD6D2vMNjzRJMlxt/DDkXlXbSKT3p5XRGysYXw98oGzaUSF5L6m8FEMr
         OzIjEKCneuEMM6RXtPw1JcA8qF/6eUN6Rax4+x3DVn4TB+Lpx5JbC0Tz1QpCl9QGDrlJ
         jreFR6TE2YU7/XEPu0u7ag1n+bpDl5msFmnjdxhllhSaZT2vxM2Xl6QklzlghUipVSZC
         HGZ2Ad3FDOmHkSwgdSdNuh0hpoJSHa5xvXNmLqPaVA+zLmlYR1hEyGuK9VPacYtdSF2M
         K09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031941; x=1758636741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ihTrH7t7gLzKRumooOOczb4IBjokkGyHJ2+QxNRMxY=;
        b=HViVzGiA3JbgFuLV1kNdNWx1A2GyEkSMOT3UNCXGCj/mChVX+GPIGWsucdWAgWC9QJ
         TR3m6Q3oyDPA22cvogr+EO+fg0cYX4cq9l0QXPIsdrAOkXfUkiJu+A34b8sOtJxyPqiI
         4h42rwR+BUU4giG2VTvyLjYyNJUUKOQNfuUSRPCgZXU1FmFWvrN6XhL2WqXQJBGwixm7
         +xdF+mcO/QERf7GIRbhmxsL+HQOeOwOHX6m81cpxfPE84prNGDbGPUY/DDFbb9KQQaSt
         5CA4FUOJlZh6osCkqOADPtg64HgS3HaMCx3ayn8wd7o5TDxMMZaRPWpaj7t0Q6nDM+My
         Y78w==
X-Forwarded-Encrypted: i=1; AJvYcCW/sH37IXto7ROKBSTs3lXQgzgNx0Ott68BA9TobFEdfWBUyaShNspfoq6YG3/XoRaiaoKX3pOsIr47zKDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqf1ocPkJZZG+FkkJnncR1gX4TotBG/DA1mS1JWSuwN9hc1i28
	dDPV9D6TmUOqkkHL9ovkXqik8sYvvUklos+XSVWHGTkZ8AUZVuthpmJuoNEpOdKSVR0=
X-Gm-Gg: ASbGncu1zMA57F3jKUnwGinuIBRcyXWwYzAWieyGyJG+BxMmQTr5Cl4n4MvjStufwy9
	RSOZEsAWAUHb+0tNjv+N1+EfMcY+44UiBOARrwBRBrwzym5hJcgEsCQANqChsGPtSFFSFwhtKj+
	ASNs21syonug9SVQDuEC/sA8vYRCWwpRNzQHLcSdSODS8YrseFX8D4Cig2Zt01hJgsJRuYV9+Id
	gKqvcPdh/TStDa/F0FOy1fklK69jbOQNETnufV7pRRoOi7qsihkww55mtX3O+Zvip17Gs+fX7kD
	BZhItOY9IWtJ2WL7IduMuT3WGEeTcU1ITvklVZDQUUs8cFuMwcuEtm4LYkYevRi5/qIz575ubxk
	2qWjEWDrj51C+pLKIrcMkG1wO9A4Hrwo8SbKAuwkDXxkQDH85/cCQ4qyMfkkge8PXPR6XaXsg+a
	XJVo9irzNcdIVvaJabDvI=
X-Google-Smtp-Source: AGHT+IGmb1kHFNHQ4frPlib14MxI7w4SRTDLbyi2XJON83MQa2TxlNaD5uBHUokreLL+hCdD46cN6Q==
X-Received: by 2002:a05:600c:1546:b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-45f211c4c03mr137113085e9.2.1758031941271;
        Tue, 16 Sep 2025 07:12:21 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e8c7375fb7sm14091558f8f.14.2025.09.16.07.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 07:12:20 -0700 (PDT)
Message-ID: <ca511d42-0381-41d1-bea0-0d766e04f9f4@linaro.org>
Date: Tue, 16 Sep 2025 15:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tty: serial: qcom_geni_serial: Fix error handling for
 RS485 mode
To: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, johan+linaro@kernel.org,
 dianders@chromium.org, quic_ptalari@quicinc.com, quic_zongjian@quicinc.com,
 quic_jseerapu@quicinc.com, quic_vdadhani@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
 stable@vger.kernel.org
References: <20250916093957.4058328-1-anup.kulkarni@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250916093957.4058328-1-anup.kulkarni@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2025 10:39, Anup Kulkarni wrote:
> If uart_get_rs485() fails, the driver returns without detaching
> the PM domain list.
> 
> Fix the error handling path in uart_get_rs485_mode() to ensure the
> PM domain list is detached before exiting.
> 
> Fixes: 86fa39dd6fb7 ("serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
> ---
>   drivers/tty/serial/qcom_geni_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
> index 9c7b1cea7cfe..0fc0f215b85c 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1928,7 +1928,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
>   
>   	ret = uart_get_rs485_mode(uport);
>   	if (ret)
> -		return ret;
> +		goto error;
>   
>   	devm_pm_runtime_enable(port->se.dev);
>   
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

