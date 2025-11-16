Return-Path: <linux-arm-msm+bounces-81975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58670C61627
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6135E28A0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 13:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C8430B538;
	Sun, 16 Nov 2025 13:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSfMkfip"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641FB30C379
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301030; cv=none; b=qYn16curpkp3jSulSE9tH+Ndzy1yZWABtLjSBw6bdzxEetal9KdkuHEcf+XQU/mnDJnWZmAD2pP/2XVfZF+gYT1/vYaRK/y7G5I6PaiPkNzu/al7OiYnYqNJ0MjoPDJnqSYty7DDDi3OEeI7pjV+NatwCrqHWt4SsOmt79lfsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301030; c=relaxed/simple;
	bh=xBUF0BKkwZYKTEHzNdupGdJM5fWZSOcJ3Y3kn2tjKwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTJthTq7PXi9v0BWkjeuKXnCTXRlvn6Cycf+2G0utKm1mDv+pTov3WSmKfMXlw2GtHwB02TPt3CANr1QpJ7fJSa4SfvNyVyvKzKL4oLUfjo5nXqH5h2p8DM5dHQaoHzZVPTvvB+ghhX+ebNLF5P8fjyBzJRocQeCX0D8E5zanZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSfMkfip; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47796a837c7so6618025e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763301023; x=1763905823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsFsVjl8oE/lkkam5eLsiD3gLh4CJDHdyycJdfwM3co=;
        b=oSfMkfipw87dD/Lxt/KuuR+5Qg5KkKlCyCy+cQvbw1hnzQ7w0JzB6pUni2ZX3QJX9K
         pRrn2HEddNUzxaJ89hLcyNM5nNHWHfzOOtGRq3EBTD6yXpMnrH1feWDXBIFDLRs0ddN1
         s13YpA74AjqkUDMVNlLjOMd7KNsMPRjGRiGb4y2Dk4FftY0vXoU2nxjMzieDIyH1wsTm
         oQhGIyP51+9WLvYE7ylJj1luLhOgrkYYkJntd7spVZRmZCgR/MMywn3fNfO/VabD1ApB
         SZXgIORNtXc2Sis08NvrH33LDwXOcP7Tnc/zcmbtvCaZ8JOAdLdCmy3xnT6DAe353GQt
         Mbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301023; x=1763905823;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsFsVjl8oE/lkkam5eLsiD3gLh4CJDHdyycJdfwM3co=;
        b=nd8RG51bmcOboQ7N4kC1UU4xLXjenxcvFm0zexSMkenB07Cnzm7ERjEp7a0L1v/zNY
         pgW/0vu5Rl+3bQOQCE6YCbXESBgxoymEWOJqozrsbBMwWTYUZG8AXsaAQPEMOCE8rD1E
         P1ZSCMYKsgfioBAD6Zvs4bWhqGKVr9HPuTaH6m5h8vznZC8sy1agw/al+baEqL65cCET
         9hSTm+e/w/7rOV817MReGa35PfhBxnacI1dLaFqQQ0nJe1oCXh9Al60W0UGe5mWFHivZ
         75KQupUgQ3KIK/vNYCTz02LyLCoED+naU5cXCEwYwv3FKQpG1/tID5HOgcM7n2TAAzVq
         ad1Q==
X-Gm-Message-State: AOJu0YysOTSBfJi+8R4LJ+N/PYiM7+pQzKYYGysCoLC1PHh93QG/rBSv
	6R3eV/ZagiKf5/EPQ2IXO6KQdFcgAHt2dllxuYHpvojoHGpVwBcxd5qqVcjdwkPlpfQ=
X-Gm-Gg: ASbGnctnrBaaMca1hNLeLi+8XTWYvmNzO3AlJk1S//Ne3BmjV1J3wCaCVoU+LdAv2Mv
	f2eNXJAM+gWB/6AvERawVM8eXeaOG2ZL7JjdBaDuYFsya9BJUPMsy7izFzfWuOr/fkSllVLXOtb
	ZEYGw1a21jU/S5bjtUDm2Jzv/UBtBpn8EUvCyjZm7H/GwchAfcL2tSUNHN731FPYXpwbzxLhiPD
	/TLWB9tbCvON8F7s7mptgXfJ0bO+BmzKVWXCGEBMvQf9pkHR/GR6nJW1ZbHHhgCTkAAtdY3s3M/
	JuIp9OJK84CtPI49nLskCJtQFFHdLS89YiufDB1XZDXpe6RgOJ8KSR87qRZDjNpo2HxYmiW6hIU
	Sxvl7a4WgvIdZsyfshuQYIryLaUtPrQ6aC5XHJj1HfyqvPUhMQPRFSTR7j96lcTJt71MHsH3vWJ
	3OzWC3KCe1BoJZ3C1LkNoXnfSkpLqmItOpLyvNImuSZczD52BlZdB8
X-Google-Smtp-Source: AGHT+IGaoiDorkO7nqDxZYo6Led+8eqxFt8ey/tZ1b794CQxwAjAGn9Y0aIzFGj0WfPTFZQUIp1yNA==
X-Received: by 2002:a05:600c:4714:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-4778feaa8ffmr86129135e9.24.1763301022918;
        Sun, 16 Nov 2025 05:50:22 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477969b3c12sm91700015e9.13.2025.11.16.05.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 05:50:22 -0800 (PST)
Message-ID: <fd39f653-b7fc-4d1e-a70a-156aef4e4b60@linaro.org>
Date: Sun, 16 Nov 2025 13:50:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-2-1e6038785a8e@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-2-1e6038785a8e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2025 03:29, Hangxiang Ma wrote:
> Add support for Kaanapali in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2fbcd0e343aa..658d9c9183d4 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -34,6 +34,20 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct resources_icc icc_res_kaanapali[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_8x16[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -4291,6 +4305,13 @@ static void camss_remove(struct platform_device *pdev)
>   	camss_genpd_cleanup(camss);
>   }
>   
> +static const struct camss_resources kaanapali_resources = {
> +	.version = CAMSS_KAANAPALI,
> +	.pd_name = "top",
> +	.icc_res = icc_res_kaanapali,
> +	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
> +};
> +
>   static const struct camss_resources msm8916_resources = {
>   	.version = CAMSS_8x16,
>   	.csiphy_res = csiphy_res_8x16,
> @@ -4467,6 +4488,7 @@ static const struct camss_resources x1e80100_resources = {
>   };
>   
>   static const struct of_device_id camss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 901f84efaf7d..876cd2a64cbe 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -90,6 +90,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8775P,
> +	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
>   };
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

