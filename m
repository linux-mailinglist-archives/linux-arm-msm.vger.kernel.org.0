Return-Path: <linux-arm-msm+bounces-67891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AA1B1C495
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 13:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3362560789
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D24728B4F3;
	Wed,  6 Aug 2025 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXhWhPTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD351C8603
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754478010; cv=none; b=ozE2pA2pTGBkym2mlrnM0FpU2IScQyWf6iNBLF/VOPQc4EfdHE5EtQDYVHfjNu0Mk/LBH4o1vSTC9GnQLTsg273+/4+6OXQgMcDl76EpAMAWk19FG+YN7iiDpFu/Lf4h+0H5yJXql8XCOJFRxYJN+q02pinjr3Ud/HZ1ZD2PQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754478010; c=relaxed/simple;
	bh=ztmA5grMhynCFB2kUGWvxLZcBQdunX1Q6gK/ADIuAQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TP6H5+XEAYJRIH2KYFq5k4lCBFh2s8ypgmff0Q7Yqvn3yQL4NT6fiszuG7tQsL0/gfax9ALsp5J1YWmzp4eyuBEGngfxqWMWGgDzzSarnaZgBLP8t1PMV5ILNX435F6kotmHCt904hlJwysgBr3o0R/E4QQrajnjpeQx+OsXECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zXhWhPTo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b794a013bcso5701963f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754478006; x=1755082806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCmVre5gjeM4nS/wqXusx4xVtaJFxkhLqF5sa87a9kc=;
        b=zXhWhPTonY0/LNpKu0zP/6GZrHtMMsNMHG2zeLcGcIRxxjfVIuRJUQHg2C2wC7+zz/
         jtBlY0fW7pYM276izuSRcz5uLs9p3adLSijYtdxJmUn+ArA4A/J/Hy4Q05Uq0fjgEQJp
         4LbtZdrXYBH+45VKWuvJV0mDSa+EX5YPG5Iyn5xZC/6lz4gaMHkPEVAAmfZR84AR51VY
         W37SJhdVfr6TbhijppYsTFmmJihvg5OOS75ZGi93HssHr8isI+ZwLajLPVplbhiL+dst
         BlsrL6iD2VrYBgUya7FCSohs63Bn3SiPmNA3s8xA1s58XXhjylGLly841ksn0NbvXyob
         MKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754478006; x=1755082806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCmVre5gjeM4nS/wqXusx4xVtaJFxkhLqF5sa87a9kc=;
        b=py6qQnQrsTlnum/MXNfQYaa2G2Uu8YaoA8P/fBrhmA7kWGYLCG8J8Ea/OkB3Z64NFV
         a+ETzuto3jMoLdzcqT/KQctXyyl0Kvi8lFCAL/DtBrlbYn0blirPgZUn7bf2R2zZPDCD
         2Nm6TjTOwo3aZGhDxGyPG3JbxGygLtqt+2xMhbq9i+KrevUjiQXnnNIs4b4GVQNKQrIx
         2EkIlIGcKeQP4WvzHfYTggVpUguaNq4YfDrw99LSMf2KkXGRahvlfzV7m9kRzl27BPmC
         XxpB2XklkmmLDHGQAi0eVsEW4KXdF9Dqx7YhNkGddbmx30ZYDDJTOAWDxhqDs01mpJ+t
         OVEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVlYIIC1xCfxmqQeJlG3gNhV0dcpBkJpSAAqJJ2HoCR4sZeH6QWRS54yU1nFmyj+ZhzWnwtpkBodUcjfq9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/iTrk/imxCqKrsvvnHR14iO/D0sR/p6GGLek94SrK/GSAOHgv
	zCN0imgK77RaOJQ2L+Wmox5zl4jFlFk+xM+F/Otjh2wHEJ/sdKCtwEb7TuGPr1MCWIQ=
X-Gm-Gg: ASbGnctL54Ex0SO343CaNIr5DifWx3UTZqGAvga0rkd0Wv9igJHrhWzhOWFY2XwQv1E
	1JUIwbnU67TdmVH3plGqHlxKE32AvCBe4ZO8gOGSnCIJieTH0SKZGOuKAx2ThXds+7GJksi3LYB
	fBYAF7TWh8OaTdi4V35Ws55Ip/lE7W1pOyFzjOAbMtcXnCvF+/4Nro/IjKD6XmgitfPvXRjHQQI
	74Hwf5ca9gIfxZS0v3qaKayd7tDPAqPRMa1lK9vEppmkAJVETuTcZAw429NlR7lge3kV2Bwilee
	wU3FFHnG5Rxw1mULwz17UbUeBBKdOaGr69HWKfkzrfK3/vyhX4KMBM948nwlnDBaZcSHwVREt34
	1tcxkW1ADSPoGr9Y0hYlghdJXPSM=
X-Google-Smtp-Source: AGHT+IED1ObJfhfJTF9IANk5X4B6IPDP0k6oF3FpmB8DzDbBAJ47RdFvv8Mlx8ZmKpcul2JbAtAwiA==
X-Received: by 2002:a05:6000:2001:b0:3b7:8d70:dac5 with SMTP id ffacd0b85a97d-3b8f48de435mr1517659f8f.2.1754478006344;
        Wed, 06 Aug 2025 04:00:06 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e585430csm43379465e9.11.2025.08.06.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 04:00:05 -0700 (PDT)
Message-ID: <e08322f9-3bce-468f-b951-21eff63cde4d@linaro.org>
Date: Wed, 6 Aug 2025 12:00:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] coresight: tpda: fix the logic to setup the element
 size
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Mao Jinlong <quic_jinlmao@quicinc.com>
References: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/2025 9:09 am, Jie Gan wrote:
> Some TPDM devices support both CMB and DSB datasets, requiring
> the system to enable the port with both corresponding element sizes.
> 
> Currently, the logic treats tpdm_read_element_size as successful if
> the CMB element size is retrieved correctly, regardless of whether
> the DSB element size is obtained. This behavior causes issues
> when parsing data from TPDM devices that depend on both element sizes.
> 
> To address this, the function should explicitly fail if the DSB
> element size cannot be read correctly.
> 
> Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
> index 0633f04beb24..333b3cb23685 100644
> --- a/drivers/hwtracing/coresight/coresight-tpda.c
> +++ b/drivers/hwtracing/coresight/coresight-tpda.c
> @@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   	if (tpdm_data->dsb) {
>   		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
>   				"qcom,dsb-element-bits", &drvdata->dsb_esize);
> +		if (rc)
> +			goto out;
>   	}
>   
>   	if (tpdm_data->cmb) {
> @@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
>   				"qcom,cmb-element-bits", &drvdata->cmb_esize);
>   	}
>   
> +out:
>   	if (rc)
>   		dev_warn_once(&csdev->dev,
>   			"Failed to read TPDM Element size: %d\n", rc);

Reviewed-by: James Clark <james.clark@linaro.org>


