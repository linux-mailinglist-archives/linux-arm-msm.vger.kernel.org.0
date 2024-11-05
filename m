Return-Path: <linux-arm-msm+bounces-37049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FF19BCBD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C909B1C23189
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA181D4339;
	Tue,  5 Nov 2024 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vW3PXFcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59661D1E75
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730806038; cv=none; b=XZ0iuE9V2/A3uFvIkar0q50q2GXgCEIZyg3is8eBf2NftffXEbfTKmyL6FYYhxchHzBQHOx/7t48eLPlJIdl2YX8E4cvLsuGK7hph90uyaRRWcSd+QGj6G8qkPmdjkiqFYmKiSrwV2jPjn/abfcMS7tvsZJ/SVQR1aIn/EUxp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730806038; c=relaxed/simple;
	bh=t+wcayOuOFWui3ZrTMmgaqfBOeZYb+S+1dfjI7oaAJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D8Q7a4ejCQevv8ugXDnuPi5AJ9JeUI9VaEwe6Z1aXEnrwAoldc2hnIJ7dVlshklR3GsUJ0gE/Y/1n13fBzhop1KVZfkh1Ak/yAJrl48ufuADPfpF/bF2PXzPaCu0tPyslWdWwdpr1jxrqQlDn3cb8cnWMuhClIRhpAeSIs8s/6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vW3PXFcn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e8607c2aso5791440e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730806035; x=1731410835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iD+xUYXyW3j/17XwwT1x0rwQmfQGKFXfNjXAKsnJrMQ=;
        b=vW3PXFcnjsAEE2NJ2n353O9Kw/MMGQlrxEwR50DwbYySOfTLWFcefrRsAmPhRb5I5i
         Z7/1xnSy2YsRYGq7PBh/1q9aPSjJKs7QfmhthM4TbYoRKuRfj65ckeG6G2QK6eYSZgWh
         RQUsLSIAMIhEtLbVnBwDuxmFPFUl1+eGyUDM0ICkamJZbMLqyGGSJEdjIP58bS9VNmxs
         ydiM3iULHE0imlBx9q5DCDQgjVuYnVj/IVHC03tim+MmLExiStAMA7ywkSTKBh98Seli
         d4YfNMFp1JfP+F75J1hDKYltO9yxNM/5+irj9CDWA9LVpl7d4gg6z2S5f1ZjG8nObdAu
         MxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806035; x=1731410835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iD+xUYXyW3j/17XwwT1x0rwQmfQGKFXfNjXAKsnJrMQ=;
        b=Pi5BWLaJpOD7HabfpRwjNZHqPY5Lv38BbZaGMEWb2CayGNmyXBi4dxKNNWAPG4E8u9
         /OZdlV4TZGJAvx2LOr1NsqkqrWOGogrHugL4TYaLek8m3zEayqAug+5DXyIgJj/HXU0H
         LfMQwJ+99Lv651fLIWl8JgGHUUP/FpJNvS+wq0w2k2TVES9MTX/7VuBOieb6iWSQjTSk
         nJ++SuYs8l5hS5VRLtEF1+UobN28OVLg7z/LjAj726t1I6fKAxHm0ku9J4OoA2q2AMzn
         X0FgANzg0NeG7CuDjlZEj7YzsnY8ZDgIyAl9tEY851nsjas2azAAc8sqevIsSABfLizn
         lYTg==
X-Forwarded-Encrypted: i=1; AJvYcCUlaLiv3sOA0hHOH5b7W5/qzVf26ktTlyJu2GdBitVtDBvNeAHtuK03XZKoXVjSuPcWXl8yGm5WnRh5+woG@vger.kernel.org
X-Gm-Message-State: AOJu0YytPpilDXhnbjPjFRx+/gaBi1G1iVkwfuk4WxFxUypwqU8Y7M2F
	JuKhlRaevFQ4fl3k3hu/1gIfHznBoIRjfcrmh5h8M1/PCy7MbwIuPGiU74zI0zQ=
X-Google-Smtp-Source: AGHT+IGRLlDbqNxsoLi87Nc6zewG08qTiA2jLORs6DC+oWcOtwio/WsZTF9GgEWch9+RqZOZLvwHMg==
X-Received: by 2002:a05:6512:1390:b0:539:e6bf:ca9a with SMTP id 2adb3069b0e04-53b348b7e12mr18452412e87.6.1730806034904;
        Tue, 05 Nov 2024 03:27:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432a6b4fd08sm9096735e9.12.2024.11.05.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 03:27:14 -0800 (PST)
Message-ID: <a71e75e2-14fb-449f-bb27-2770261708ea@linaro.org>
Date: Tue, 5 Nov 2024 11:27:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: venus: hfi: add a check to handle OOB in sfr
 region
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241105-venus_oob-v1-0-8d4feedfe2bb@quicinc.com>
 <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-venus_oob-v1-4-8d4feedfe2bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 08:54, Vikash Garodia wrote:
> sfr->buf_size is in shared memory and can be modified by malicious user.
> OOB write is possible when the size is made higher than actual sfr data
> buffer.
> 
> Cc: stable@vger.kernel.org
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index 50d92214190d88eff273a5ba3f95486f758bcc05..c19d6bf686d0f31c6a2f551de3f7eb08031bde85 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -1041,18 +1041,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
>   {
>   	struct device *dev = hdev->core->dev;
>   	struct hfi_sfr *sfr = hdev->sfr.kva;
> +	u32 size;
>   	void *p;
>   
>   	if (!sfr)
>   		return;
>   
> -	p = memchr(sfr->data, '\0', sfr->buf_size);
> +	size = sfr->buf_size;
> +	if (size > ALIGNED_SFR_SIZE)
> +		return;
> +
> +	p = memchr(sfr->data, '\0', size);
>   	/*
>   	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
>   	 * that Venus is in the process of crashing.
>   	 */
>   	if (!p)
> -		sfr->data[sfr->buf_size - 1] = '\0';
> +		sfr->data[size - 1] = '\0';
>   
>   	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
>   }
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

