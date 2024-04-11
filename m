Return-Path: <linux-arm-msm+bounces-17202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E488A0CC0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 11:49:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2905AB215C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 09:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6B6145349;
	Thu, 11 Apr 2024 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xU0CDoW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6B145342
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 09:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828949; cv=none; b=lHIiVpo22s0eoboztz2DF2zBGVYmmrzfpfse6UarBBvPCMpTvQJ3aRX+Dtyi70YrtB1RmGiz8ctQuZkOPPnFXb5lvCZ/m/vksMNCwfln+PCWpprB9sPeRbq9vLwgc7n5RhrtNgH/X4ZLl85ABIB1p/dzTGMtJiaXWT9sMvAjWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828949; c=relaxed/simple;
	bh=VRFMeL1yR00t7d0ztD3oY+Cl355vb7WeMLBqLT3v9VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBMHLZ5k3YbjLJSyE8WPb8Qoyt/48Jt6YO42k6JQQyZoo08Z3kTExAmaG1VkP8uzOZYuujRiNJk0TB0SGzHXy+PNI/9qVxx4RApH6BrgUmmaOAxmmA4ALe2eQgu0x5bNOcI0rCbOrL8J66kkVhChb9K+2gNUrlqJpx9DLW3MHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xU0CDoW/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-417d029bf15so4538865e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 02:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828946; x=1713433746; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOKJQ8jt7AxSxSEOBwduE0YRgHhLkC7CChdOI3MJABQ=;
        b=xU0CDoW/tHFm3EcpNoha8j0eWPMr/mW9jdLWcoeWtZN2nYcurlaUgzJYpVOyvk3OJo
         m0eHUnsAtCwtV1wNmhpm5CDo5jgwdQIQ8w5oXBgNLnLqMuX94lDtJp7Uf8g38db5Aykn
         U8Q2O5Csq6QqXdgwC/3S93pfsV40BXO+sAY+mcT5Od3AqncVz3pNke8BhADFPQCZ9hxH
         tpX6j/Ws1g5gYeYu4pC7gm5LAQXdJ6Zmfa1wPS/SFGYqIkZXYMLGMmnll31CXiQcz/js
         Ffil/PXhfKEGLq4wh/LkjhZcimlNJDv1mtCnl3OryV0ybTwfODymBQz+ssz6u6YppLGh
         L1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828946; x=1713433746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOKJQ8jt7AxSxSEOBwduE0YRgHhLkC7CChdOI3MJABQ=;
        b=tTGMyNIDWAqHazNpRrh+AJ8ATpMwVx4SvUtZG2w6czBHj+Ujg8l6CzVAeh1c/O5aNF
         hsyKsp1DOMs4aiwgk4QHec859sy2BCSwtqpuu76E5i4nIhr+uXKkhsovnZOGOpT/fxu0
         9VJJdziOCnHbWbBttLcB3lz5eiGJTBLSU7qFC8r7WatmcMZFWylfsu8SZM4FCqdkkqyP
         NNQ6DaAA5u2bT4Ox21XMipbLW0ZM+dwVJlAoizL58ry4jY76wM2BuLmlFSkcXkoiwkmo
         L2pQGqxXZgzjdrf0xM3s4+9iqOwadWQ4KKFZQugo1jJ9b3q3i9dS0MqyUyKSUCQmVd4N
         FL9g==
X-Forwarded-Encrypted: i=1; AJvYcCUC5yY2RK9yiT/SSWhLhwilMQrIKOYBS51DoP9Ky1zZQubyaqcZXY4X6dSXL+giH8BGExQNo+ULtwQlQG8LJVp5Ntv9Du4NpNwPHiovyQ==
X-Gm-Message-State: AOJu0Yx48tsRpFQS4oPYnx0bhMvV/qijrNJnbFAL/lq+UWxht7tNIehv
	g15IRPOFi9YodBVvpw2IojcVdBDgv8TkXds+V/Mza6GqdXfwB74tKUpTuNlCwi0=
X-Google-Smtp-Source: AGHT+IGryICHdMrckhWGV5wzftvfmfRDF+oAPtzgI217Ncq8uwac0chRlOVAL098WWQo3OsWuKEmPQ==
X-Received: by 2002:a05:600c:4e94:b0:416:34c0:de9 with SMTP id f20-20020a05600c4e9400b0041634c00de9mr5015684wmq.29.1712828945966;
        Thu, 11 Apr 2024 02:49:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id f11-20020adfdb4b000000b0033e7a102cfesm1356008wrj.64.2024.04.11.02.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:49:05 -0700 (PDT)
Message-ID: <d2a4a91d-1b8a-4136-af30-50eb693423df@linaro.org>
Date: Thu, 11 Apr 2024 10:49:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] slimbus: stream: Add null pointer check for
 client functions
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240327083214.29443-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks Viken for the patch,

On 27/03/2024 08:32, Viken Dadhaniya wrote:
> There is a possible scenario where client driver is calling
> slimbus stream APIs in incorrect sequence and it might lead to
> invalid null access of the stream pointer in slimbus
> enable/disable/prepare/unprepare/free function.
> 
> Fix this by checking validity of the stream before accessing in
> all function API’s exposed to client.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   drivers/slimbus/stream.c | 37 +++++++++++++++++++++++++++++++++----
>   1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
> index 1d6b38657917..c5a436fd0952 100644
> --- a/drivers/slimbus/stream.c
> +++ b/drivers/slimbus/stream.c
> @@ -202,10 +202,16 @@ static int slim_get_prate_code(int rate)
>   int slim_stream_prepare(struct slim_stream_runtime *rt,
>   			struct slim_stream_config *cfg)
>   {
> -	struct slim_controller *ctrl = rt->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	struct slim_port *port;
>   	int num_ports, i, port_id, prrate;
>   
> +	if (!rt || !cfg) {
> +		pr_err("%s: Stream or cfg is NULL, Check from client side\n", __func__);

Please use dev_err where possible


--srini
> +		return -EINVAL;
> +	}
> +
> +	ctrl = rt->dev->ctrl;
>   	if (rt->ports) {
>   		dev_err(&rt->dev->dev, "Stream already Prepared\n");
>   		return -EINVAL;
> @@ -358,9 +364,15 @@ int slim_stream_enable(struct slim_stream_runtime *stream)
>   {
>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>   				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	int ret, i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	ctrl = stream->dev->ctrl;
>   	if (ctrl->enable_stream) {
>   		ret = ctrl->enable_stream(stream);
>   		if (ret)
> @@ -411,12 +423,18 @@ int slim_stream_disable(struct slim_stream_runtime *stream)
>   {
>   	DEFINE_SLIM_BCAST_TXN(txn, SLIM_MSG_MC_BEGIN_RECONFIGURATION,
>   				3, SLIM_LA_MANAGER, NULL);
> -	struct slim_controller *ctrl = stream->dev->ctrl;
> +	struct slim_controller *ctrl;
>   	int ret, i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>   	if (!stream->ports || !stream->num_ports)
>   		return -EINVAL;
>   
> +	ctrl = stream->dev->ctrl;
>   	if (ctrl->disable_stream)
>   		ctrl->disable_stream(stream);
>   
> @@ -448,6 +466,11 @@ int slim_stream_unprepare(struct slim_stream_runtime *stream)
>   {
>   	int i;
>   
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
> +
>   	if (!stream->ports || !stream->num_ports)
>   		return -EINVAL;
>   
> @@ -476,8 +499,14 @@ EXPORT_SYMBOL_GPL(slim_stream_unprepare);
>    */
>   int slim_stream_free(struct slim_stream_runtime *stream)
>   {
> -	struct slim_device *sdev = stream->dev;
> +	struct slim_device *sdev;
> +
> +	if (!stream) {
> +		pr_err("%s: Stream is NULL, Check from client side\n", __func__);
> +		return -EINVAL;
> +	}
>   
> +	sdev = stream->dev;
>   	spin_lock(&sdev->stream_list_lock);
>   	list_del(&stream->node);
>   	spin_unlock(&sdev->stream_list_lock);

