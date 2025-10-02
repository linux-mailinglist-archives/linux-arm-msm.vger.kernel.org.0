Return-Path: <linux-arm-msm+bounces-75735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D00EBB2232
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4672A7AD6A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F9925776;
	Thu,  2 Oct 2025 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSc8Azhb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DB4B640;
	Thu,  2 Oct 2025 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759364486; cv=none; b=CH2BGAE4QbYBN8vI1JOG+GnDxpXEOUF58Kgv98/Ei7TwUf9rButgh1HV0DkobAkzHYI21I3lVsIiU7vX1FFSfXZRhRRQ4TG+HCyhPXhrvpYb7YwEc2zxd3v+ezX7zdiinVON1vKCWq6r/gGIypc+Dpem7m++EnadmwCAFQ3YGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759364486; c=relaxed/simple;
	bh=OMIm9how+q2jo4ss9EDXYOpWHxSgLfFY96eMmTzUu20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IirRbwsHmojDB13v2HFKWtLnxlUG0L3l5lP9eA2jRDZQ6aMI+f3uE/2czG5KDY+yu974tDCJQlyLCUeyowD9m6C2YUdY5jSD89XkU0/+tiLGRhNy8ppqhR7sAyCMWt0BgGUG1+vZPtVSDC+TBWTg1tlpRWNqTUlVF3+j5BngMSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSc8Azhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E199C4CEF1;
	Thu,  2 Oct 2025 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759364486;
	bh=OMIm9how+q2jo4ss9EDXYOpWHxSgLfFY96eMmTzUu20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tSc8Azhb4S/MDddmG+uFJ3/jb0BA9RECLCSFsazaowt/CzjaZsRB8FiTLMxzVk1Dn
	 8+7y4eI9gmyJyb3ARiZWbBZPde4Mnd0rki30n2czeNojbhwbifCfvcnAN96PhscF++
	 iZX5+dcMOERQKyaFRB9ahPPZMg3ZZbInH9T3Raha4YjaE4lurwkQPod3bh9+FjPaIJ
	 Aqpg7bLY/N8M+kKGaFP/Ko7rPw9qvLo9kedWvEjoZN3YKHeCTPeE8v0bHx8GLl2Ir6
	 m1U4Tz0tyqdww/iy+4BoPi3FDAJD2Q6AcIHjF9M7KTnUEi81cLHgoxo1m4hJ7FmdQR
	 xEoTP5nmnR3bw==
Message-ID: <22a6cebc-bd09-48f5-a11e-ab925011bd8f@kernel.org>
Date: Thu, 2 Oct 2025 01:21:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: ice: enable ICE clock scaling API
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <6PNEPfyjHahJ_pLSaxMINWXDHyO3NKVQD8Bo6XXlA7yI8Qcgim3MDd4gFC8LIMYAIFoAIHnttsDVc6LFEdBWCg==@protonmail.internalid>
 <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2025 12:38, Abhinaba Rakshit wrote:
> Add ICE clock scaling API based on the parsed clk supported
> frequencies from dt entry.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/ice.c | 25 +++++++++++++++++++++++++
>   include/soc/qcom/ice.h |  1 +
>   2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index c467b55b41744ebec0680f5112cc4bb1ba00c513..ec8d6bb9f426deee1038616282176bfc8e5b9ec1 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -97,6 +97,8 @@ struct qcom_ice {
>   	struct clk *core_clk;
>   	bool use_hwkm;
>   	bool hwkm_init_complete;
> +	u32 max_freq;
> +	u32 min_freq;
>   };
> 
>   static bool qcom_ice_check_supported(struct qcom_ice *ice)
> @@ -514,10 +516,25 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>   }
>   EXPORT_SYMBOL_GPL(qcom_ice_import_key);
> 
> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> +{
> +	int ret = 0;
> +
> +	if (scale_up && ice->max_freq)
> +		ret = clk_set_rate(ice->core_clk, ice->max_freq);
> +	else if (!scale_up && ice->min_freq)
> +		ret = clk_set_rate(ice->core_clk, ice->min_freq);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
> +
>   static struct qcom_ice *qcom_ice_create(struct device *dev,
>   					void __iomem *base)
>   {
>   	struct qcom_ice *engine;
> +	const __be32 *prop;
> +	int len;
> 
>   	if (!qcom_scm_is_available())
>   		return ERR_PTR(-EPROBE_DEFER);
> @@ -549,6 +566,14 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>   	if (IS_ERR(engine->core_clk))
>   		return ERR_CAST(engine->core_clk);
> 
> +	prop = of_get_property(dev->of_node, "freq-table-hz", &len);
> +	if (!prop || len < 2 * sizeof(uint32_t)) {
> +		dev_err(dev, "Freq-hz property not found or invalid length\n");

If this error really happened you should pus the result code up the call 
stack also since either case can be an error you can inform the user of 
which error happened in your output string.

> +	} else {
> +		engine->min_freq = be32_to_cpu(prop[0]);
> +		engine->max_freq = be32_to_cpu(prop[1]);

You check for zero later on in the code but, is zero a valid value to be 
returned here ?

e.g. is it valid to specify "freq-table-hz" in your DT but then set max 
to zero ? min to zero ?

If not you may as well reject zero and dispense with the checks later on.

> +	}
> +
>   	if (!qcom_ice_check_supported(engine))
>   		return ERR_PTR(-EOPNOTSUPP);
> 
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..b701ec9e062f70152f6dea8bf6c4637ab6ef20f1 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -30,5 +30,6 @@ int qcom_ice_import_key(struct qcom_ice *ice,
>   			const u8 *raw_key, size_t raw_key_size,
>   			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
>   struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up);
> 
>   #endif /* __QCOM_ICE_H__ */
> 
> --
> 2.34.1
> 
> 


