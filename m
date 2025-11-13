Return-Path: <linux-arm-msm+bounces-81598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B597C57593
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 13:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BCECB3440FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 12:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B72C34D4C1;
	Thu, 13 Nov 2025 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYNF0ml1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99F34D395
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 12:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035946; cv=none; b=RGnARn/Kfdne/+R16CviMzb6JTWgaVBrpwyPuxX8KnHyVioOA26TrNUehv0LsKuNAN3LTPOwAFPAgDW60gWujlA9NbmpZjL9aKbeC5ilCBXg5H5nqR9jSe4c0VFj4O+qKMRtq6Lg6I+DiT8oKkITOF1lD6L+TVmRVZiNFC7s/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035946; c=relaxed/simple;
	bh=tIRyBtq6ZgmwZ/RdMREj1gR29I0tL8lowm1gb91/zSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npUItDiiJkjRaHSTVUHIxuHq+yVL6JAFs4qUvx9KNjOnWZ8xSwfPFuWcbfdugRzoaYUoLNjZjCrm5uTsqgwWzSso434GszdnIi9FLVXcqLwsd5JpgE/wL7p6YpMJCwpqSFvvaGg9wMO5IxLJX+BmDdG5lSaMGOPXH739rtdmkDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYNF0ml1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so1185940a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 04:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763035943; x=1763640743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmL32TLheuHbN2HDaUa3UG1QnGtlOG9N/Q5N775z6d0=;
        b=CYNF0ml1DpleNUfz+G+2lL9hhJrYQUWslZOJEJWeGWEs6q9d8EhrKwnukmTypyCk5e
         i4oJiVHSZF5EQTq5CLRYHRHr0JctLV6pRJTInSCEO2WrjGW0vTwzBMBooviHxzvuzxRa
         thld1GQu+rf+00Xjt4dEjBuU55mjjMlPj3Ty482vLZ1oUT64CxGKf0t7hCG0h11YOHSC
         COGZYFk5DJMpaepmWN1NjFBEvvCv1BdLXaJJKoWL8cI7AF45m+dgi4z0BlXeEPAw1crt
         YUIZa+v6Wqtt02fy+NoA/fIBp4sR0iyE3ZLdH8kMmKpHzcDcFDOCpL1yuC/fTXyAOqOP
         tJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035943; x=1763640743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmL32TLheuHbN2HDaUa3UG1QnGtlOG9N/Q5N775z6d0=;
        b=BR5RGtJfu2a+Yc8dvZ7aME4zJMRS6pf6qTmrX4fLEEPXBJAYRHS7aO/KkNq52YIeKE
         v07+RhH4kW9iAiUdQ0sUjKSI3K339DCt9eqNLp+W50MVPIzV9M8EQfMlXdnPzAMMaCgI
         IMEiEAyK+jfbmBVBFHwtYVC8d6yFz5p6mvUSfJUsMm3xd+UDb/fuXkckEDHbNizo0Ikd
         5lCO+oW6rhkUtVeECHv/9ZOtfSOU8vfog7om4cwawPFovIM60ri4AklazQx9nCyU9EYg
         wy6ojXO/oDpYbPCS+ba27dOugvb0Zuwu8WtVDoKBQ5gWT8cJwg8pLkQuyIfOvqFZsVYq
         VAHA==
X-Forwarded-Encrypted: i=1; AJvYcCV9d4Y2hWh0WxXCGJg32IjlH9TMTNW6uMS97v+9sr8iaw1YKRwoAqpuXT9jRrjx9E8YBHj5xqQrPUhDheOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzob15CK6pvuXh23WdITSRET8zXBP/wXfVsFRKn/VLTnhD6Wv5P
	rSHLGszYemsaPdru+k3LN6dU/7vPKNGsPVcfdQDe/UP1qmP7DLHBYfE8E+KbGtvjQIk=
X-Gm-Gg: ASbGncsGWW95Vw0eldopbPubMGTgf6lL7zes3hytG1hcWdpWDqCUpwMamQgsjCktWAM
	PTNKsVKcKe24siwxUMjGVBOd8Ka1kHLBT1TUO6/Rw4B7SHhGKISG5qAB7MNgp6+KULo/fgrefHx
	zsh3WklmGqbP2WZrd6U15NYwJGDrugi9Ifr50l/rEv34iV2DoE5/Iv4+ZFrUmSloyh+eAEMivJp
	nuTC2BIuRQ8qmyCymEBw8ewYb4RYsKKK5SPLNL3oZAigUxzEF1ZzXzoVKwxEiOaDkTHBiNjFO8t
	GzBCS7LAUv25HvXudxGsor4nANNCx1+RXymenEzWlbwVy5Rus9OJjS5Wm4amNRVBbvCedFkgqlv
	iDudVrYE9carNX1Rwi1KN2s5F4yLGBfnRbPUF5Th6tElIfiSBY63rbYEYM4u8ORVrQ63k2eTneM
	UQPP3Bmosnp9Ba1VocutQCUbw=
X-Google-Smtp-Source: AGHT+IES54zSRW8sTH8TIe84JLMl9O+9k+g7kEG/EMcHoTIpOAkv6hlmsk6iKOP7BgiRYf1ZJ102EA==
X-Received: by 2002:a17:907:6ea6:b0:b72:c103:88db with SMTP id a640c23a62f3a-b7331960ea3mr649017866b.9.1763035942693;
        Thu, 13 Nov 2025 04:12:22 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:e68d:9e37:1627:2b9b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80d27sm151837166b.40.2025.11.13.04.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:12:22 -0800 (PST)
Date: Thu, 13 Nov 2025 13:12:20 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 09/14] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <aRXLJL632V0ys6rs@linaro.org>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-9-df4910b7c20a@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 04:05:59PM +0530, Mukesh Ojha wrote:
> Simplify qcom_scm_pas_init_image() by making the memory allocation,
> copy and free operations done in a separate function than the actual
> SMC call.

Nitpick: This feels more like "refactoring in preparation of the
following patch" rather than a real simplification.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 550707f2b46d..1d8a2c537c44 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -590,6 +590,37 @@ void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t
>  }
>  EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
>  
> +static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *metadata,
> +				     size_t size, struct qcom_scm_res *res)

The metadata and size parameters do not seem to be used inside this
function (also not after your follow-up patches), do we need them here?

> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> +		.args[0] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_scm_bw_enable();
> +	if (ret)
> +		goto disable_clk;
> +
> +	desc.args[1] = mdata_phys;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, res);
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret;
> +}

Thanks,
Stephan

