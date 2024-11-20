Return-Path: <linux-arm-msm+bounces-38566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD59D432C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 21:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D90AC1F21D70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 20:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F97A1BBBC5;
	Wed, 20 Nov 2024 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeAx1EkN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED619DF9E;
	Wed, 20 Nov 2024 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732134987; cv=none; b=WZoolGAYLHFy3iUFp60UPrlOXxz0Wrpr7YPl3XJFAioYlFfpGzC0sQYa0vjzyWDkfvanKNQa5pkHCgMSx4ICECTV1q5np5jjvGAcXpl00eQPGDSzE10950LWxp0fx92FMiXtS9vCprUqXkBGlQCWtrPjY5N9pCBbneRKwltoqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732134987; c=relaxed/simple;
	bh=3pTF8HtboJNXamrbK2zTKYm6YaLD0WCIOPJbeAO1+kA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mal/QWaD59ZudV5oQHhJXtroqCzNvyCJTMWAIgNiWmG6jmhf4xD+EQZtsAc6tZtTYeMTi+pba4+LKjuvShMdfXU8cV86aDGyIfdaAoS5K3G4BXxx5RoT9qz8yE+1ogweUHA0sy8Ih0BXk+W3HEUYqydH2TyhuCAR83/U5FJer78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeAx1EkN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38231f84dccso84029f8f.1;
        Wed, 20 Nov 2024 12:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732134984; x=1732739784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x3or1iEimUGIRqJLaR9LmxWG/5ydCrarknTWSiPGeos=;
        b=TeAx1EkNlP/8Vwv0hpV+H3sein5F/g1gGRMdusuIywEgYzB4twXdPzzFaoMB5ncoAw
         c533HHpY09Og3c+CC2ebzxT0bv+W67TRAhFvSZBGPNyoUZWdtdeLcN7xf8UIT74/EZAM
         XsPLstLx5uCNNG4TybneJjuqVUBB7BD1iYsfA6P/U4O4/5znJd8F9T718vXZj0h+3qO3
         +bYHqqbxDwZn6eBwsusz2Cm3W6/xC/Gw8tjvc0Z7E0wQqa8bK/172aGTqYHqFqTu5nNe
         3Ktcc9UEC7xwyVoWqBhs426zxKRXq/1C0ULbfnsEq9jPOyTMMD6n5NKh/+09nIH1td3c
         wFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732134984; x=1732739784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x3or1iEimUGIRqJLaR9LmxWG/5ydCrarknTWSiPGeos=;
        b=k6irMUp1dLBfqHfbFosNSgJZbseDPVQ1O9n/ABLQ7DE1HOrHUpOtCekDZhT77NHZ2O
         GXPfGuR70Si6lEKblpwx74swS3tYb54jsypQx5SC5zRkZ1eMXcHEjY4X9ydywkUKMYvN
         etg6ruS7QRtcI20FRO30h2R0/ZMFl+fkF2F0iA6I+kQe+a1NT28IvWsN050+udFp+1Ga
         m2fxTipDX7ItyYzv9Dcho+W8XJEwR7e30R2tdMZrSncnRm9Om+6MAOfQkYUdix4hrMWL
         qF914DDcAVsrDMO87YzviffTjbVVgAC1anxTnu/8YoEPGffkJNMvubtQ410g98mzOnFi
         88nA==
X-Forwarded-Encrypted: i=1; AJvYcCUxUNi1Gip+Zg7nex7T5QI/WwB7tPmXaKnWQMMhw1BWe+YqQZ2cuP/AXEJD/vCgBAEpdyLoXwpGd9MkYz0Q@vger.kernel.org, AJvYcCXVwE68f3QkJwpwa4WUgJ+aACS242MYTInShHx1sRVYU09q1DhpFElZdD85s7zKxAkzz6+84eV6lq8WJi9I@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhZ/zKvyMJ90dcnHz1B5P0OtMFtsbEQeaCGadcvHRF0o65DYx
	CwjX1B6ePLP+5YcO0FJmhQpxtVnZxJZco7zXaWXWjSJQzwQs8B7q
X-Gm-Gg: ASbGncvyqsRalVmT788cwMcMRCIBNTyYmLkgvv7pwzzgftds2+3OFVTMMJK+IJGNxXQ
	J8eQXNyR4pvNnqDj9jbTVNLllEjXhCqai1Xo+jANdRjIRgcc+e/vMeVbSy4Eo+0X+ZHTrkkSOvc
	zYLdi06WwNINfk/8UDW/ZAWGzdGzCemsdyVYyjK2nhMMUcxubVuaNKF7ofCMAmmXKVTuHCgvJnF
	NykyIEjUKadfFQxYgHxsafnS9X7XDSLa+E+C+uAutf3P69i8sU=
X-Google-Smtp-Source: AGHT+IECZF5CB7ww/8uLBoheSaSo8qyLeRSAQ+EmDMpZQZa/pX+WHMDslgstSLfXg4Lqs8NFX60nxQ==
X-Received: by 2002:a05:6000:2a8:b0:382:3f31:f3b9 with SMTP id ffacd0b85a97d-38254b20749mr2491140f8f.56.1732134983501;
        Wed, 20 Nov 2024 12:36:23 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b463af68sm30560835e9.40.2024.11.20.12.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 12:36:23 -0800 (PST)
Message-ID: <863ba24c-eca4-46e2-96ab-f7f995e75ad0@gmail.com>
Date: Wed, 20 Nov 2024 22:36:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: wwan: Add WWAN sahara port type
To: Jerry Meng <jerry.meng.lk@quectel.com>, loic.poulain@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241120093904.8629-1-jerry.meng.lk@quectel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+Manivannan

Hello Jerry,

this version looks a way better, still there is one minor thing to 
improve. See below.

Manivannan, Loic, could you advice is it Ok to export that SAHARA port 
as is?

On 20.11.2024 11:39, Jerry Meng wrote:
> Add a Sahara protocol-based interface for downloading ramdump
> from Qualcomm modems in SBL ramdump mode.
> 
> Signed-off-by: Jerry Meng <jerry.meng.lk@quectel.com>
> ---
> v1 -> v2:
> 	- Fix errors checked by checkpatch.pl, mainly change indentation from space to tab
> 	- change my email acount to fit git-send-email
> 
>   drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>   drivers/net/wwan/wwan_core.c     | 4 ++++
>   include/linux/wwan.h             | 2 ++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index e9f979d2d..082090ae5 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
>   	{ .chan = "QMI", .driver_data = WWAN_PORT_QMI },
>   	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
>   	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
> +	{ .chan = "SAHARA", .driver_data = WWAN_PORT_SAHARA},
                                                            ^
The space is still missing between WWAN_PORT_SAHARA and trailing '}'. 
Please follow the format of existing table entries.

>   	{},
>   };
>   MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index a51e27559..5eb0d6de3 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -342,6 +342,10 @@ static const struct {
>   		.name = "MIPC",
>   		.devsuf = "mipc",
>   	},
> +	[WWAN_PORT_SAHARA] = {
> +		.name = "SAHARA",
> +		.devsuf = "sahara",
> +	},
>   };
>   
>   static ssize_t type_show(struct device *dev, struct device_attribute *attr,
> diff --git a/include/linux/wwan.h b/include/linux/wwan.h
> index 79c781875..b0ea276f2 100644
> --- a/include/linux/wwan.h
> +++ b/include/linux/wwan.h
> @@ -19,6 +19,7 @@
>   * @WWAN_PORT_FASTBOOT: Fastboot protocol control
>   * @WWAN_PORT_ADB: ADB protocol control
>   * @WWAN_PORT_MIPC: MTK MIPC diagnostic interface
> + * @WWAN_PORT_SAHARA: Sahara protocol-based interface for downloading ramdump from Qualcomm modems
>   *
>   * @WWAN_PORT_MAX: Highest supported port types
>   * @WWAN_PORT_UNKNOWN: Special value to indicate an unknown port type
> @@ -34,6 +35,7 @@ enum wwan_port_type {
>   	WWAN_PORT_FASTBOOT,
>   	WWAN_PORT_ADB,
>   	WWAN_PORT_MIPC,
> +	WWAN_PORT_SAHARA,
>   
>   	/* Add new port types above this line */
>   


