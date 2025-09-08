Return-Path: <linux-arm-msm+bounces-72569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2DFB48DCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 14:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F8120393C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17161AAE13;
	Mon,  8 Sep 2025 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKeGQabn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0ED2E8DFE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757335189; cv=none; b=dt3aumIsxXzyY2vwtgZvVETCKEQxTyC6YUqkL0MqfaE/Z10J8+JPF98HodarGrp0ruYpiJSCZ5QXBHt6PD9hvpc9Kmu6EehUXgpVTMZ4rM9HqYYNpzEIbLCi0dbnGcqf99BLr22MKoaQFAh3PTPApYWQjTftp7yvAT6V+UEyWJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757335189; c=relaxed/simple;
	bh=zkCovvdvkGJf66RNvpZWl8A4T7ecGjNF4suroGD86PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qpItAExJJnDb/65sFvbcp6+TP/TDb5I21StkDYuj3BC3RiIt5Mo5SJShHUb5NbktEXKfrET11tRDaCx+hZYz9Os/ms4AdwSMghDQMkkdFSGbzSJHPHRKmLKd7N389J/N4BhWzryZzd8bpfqGqPvkK8EGRDoTTgHjvBlIuhcoZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKeGQabn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45ddddbe31fso11472105e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757335186; x=1757939986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOQbjYa7uTeN/Rir/miu4y3FOUbT0e3+50z0qSPwvr8=;
        b=DKeGQabnLpjFLsf3NgRsbfXutC+fyekBLLD5dst7zLEn4zXOKkyiHbglQ7GcDPcICL
         FnhS+49BcY0yz+0U7JNPpfGEO4CTWAPtuMtQu7O8hgqU+A+xUXjE2TW3pk+IG1leXoBZ
         H2siObePW/LMMbBffb7/7AnfoUF1JAG5KgHv8+qfeA+c81PibbH8qIbmxefM6ueP3RPK
         tKPCQuQb44o0rwj5jpt0a2C/uDcyzIiNzER+vbSzC9asuizf1PD59yytCkir1ETCO15+
         ECbdyyHGz3GgSWFgyAu58zkyzVxME9tgNvMPxZCGc2vpYlwcxMisSm/2PknrpuLf+IUt
         tcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757335186; x=1757939986;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOQbjYa7uTeN/Rir/miu4y3FOUbT0e3+50z0qSPwvr8=;
        b=UM0gKC8DWc++mCmP+S+ab4cAG0T0kIH5od70JYIqzXLqOFkxuPHw0gyRYuP1TX+c+2
         boy4pHF2Okp31DEcDkrM1bZpjX7ZOFSnehaCdb+hzow9Idspdn3KzeAc/QTTegl3fVvB
         dy36lsujv+YmjfrNJLgOi5CnTgktgsgocjP+vUAKVemcJwrNMdUgk14WFP5ImMAUJzlO
         bUi7qtJQ0buxjj2ubnMIGUomG0c79PfzpZQB0dvPpYxLK0BNs1yLVLnvTyMwbEetiTJR
         NeubQvrrJ8Dffm+VFArAfg6iNp+yU9BkHPMw47uy4Gbjwx6xdVQMyqkWqg7mLb7uiLYv
         Vqxg==
X-Forwarded-Encrypted: i=1; AJvYcCWber7jAPAk7XGbdjuh1YfGuBzbSCdgBWEmbXiDEwm+ldzxmVsiNuTq1vN7VL17i43IiOx3HcBpFeqQFEt0@vger.kernel.org
X-Gm-Message-State: AOJu0YygvWjG4uia2jET4lPcAIvj69KRZwInfRrRoP5zKyYMFnWy56cO
	sVYAvfw/NNlSnxT5qlYuKHfg7TT/joSlftyjjbzQU+JHY1L8gIpiXidV4GPaqU04ofo=
X-Gm-Gg: ASbGncuaUPFW9AAOwA46D2BixpIaDwtVkdtmCtQCvnIwPqxi7xUxKQcnSCu1Izf5RY1
	chRgzyjUw5i4NNjZqprVOqGFSDpT0UwxPZpYOlIO/BF3uomeKax+B99x9w6zGrs/CIaTYqZotz1
	jzWluYjqpPqIouY46N+7De9wEBPSyRk1oZHF8NVGsiSAWSMgZgivRk00uCZg45IKAt2UQGdYCDq
	cJ64qewHTM1lJa4OtP8MDZBesqY7EZLXMwb5+9HmjOEMiJTusxBF2Z8Pyng3+lWt/+czyykr0om
	GMBKUQRAdxWX361DQdMJSwnG+OzulGsAKo8JaBMy0YiwttILwM5NKfJNIRs1qIsXZAyZNQvmS9M
	6lDtbyLL72x/T5qvOVpuLohLV6yoN/IUumpSrfV9p67clFg20oGlC9fjqTbADsQro8lNxKaxqQx
	8gfQKUm/mWZaZAx89Iqi2NvrWX8ZN77Q==
X-Google-Smtp-Source: AGHT+IGssgEgPQqCY5JjfftBjqLsflmfRf1S+VhLNRLQln8IEtOgWUXb4qCkr0a+b8vMCtFJRylKsQ==
X-Received: by 2002:a05:600c:4fc1:b0:45d:d5df:ab39 with SMTP id 5b1f17b1804b1-45ddded614bmr64755625e9.26.1757335186245;
        Mon, 08 Sep 2025 05:39:46 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm437835175e9.19.2025.09.08.05.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 05:39:45 -0700 (PDT)
Message-ID: <49d0d369-7e08-42f0-b587-88779dc6938c@linaro.org>
Date: Mon, 8 Sep 2025 13:39:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: qcom: camss: use a handy
 v4l2_async_nf_add_fwnode_remote() function
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
 <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903002255.346026-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 01:22, Vladimir Zapolskiy wrote:
> Another code simplification makes parsing of remote endpoints easy.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 13 ++-----------
>   1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index be1c62d27e2b..4909dbdef1ea 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3038,18 +3038,9 @@ static int camss_parse_ports(struct camss *camss)
>   
>   	fwnode_graph_for_each_endpoint(fwnode, ep) {
>   		struct camss_async_subdev *csd;
> -		struct fwnode_handle *remote;
>   
> -		remote = fwnode_graph_get_remote_port_parent(ep);
> -		if (!remote) {
> -			dev_err(dev, "Cannot get remote parent\n");
> -			ret = -EINVAL;
> -			goto err_cleanup;
> -		}
> -
> -		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
> -					       struct camss_async_subdev);
> -		fwnode_handle_put(remote);
> +		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
> +						      typeof(*csd));
>   		if (IS_ERR(csd)) {
>   			ret = PTR_ERR(csd);
>   			goto err_cleanup;

Similarly, I think this change will conflict with moving to a real phy 
driver.

---
bod

