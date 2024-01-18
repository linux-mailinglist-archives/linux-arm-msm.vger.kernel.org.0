Return-Path: <linux-arm-msm+bounces-7572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAEA831ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5BDD1F2061D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356A62D610;
	Thu, 18 Jan 2024 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VLLwigjV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1EB2D058
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600711; cv=none; b=TR2ynFJM4LQ6GHavxe/mlfqcGZ1m6X7aKp6W5S3H9Jk2jUUPrQOJ9KTlGl1FQX1s6NRe2GrpCJVwvco1iv4cs7OimuxVrVcrbQzZXvIU/AA+Q1eVDdkT95UczydgtCNbRGFNWBKk1ER69xvjx+qtprq5pyECUJwGZ8Cobokcl9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600711; c=relaxed/simple;
	bh=QVF+n5V+O+hXfuYnJEtJo6fru3J22c12jHPTEEHaopc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2AxLYUylXat2AtKmesKqohvYVXCBWwdQtjb4d+kAzpYkxVvbG+yR4CFRNa6p+/xJruxcYL/QxSXTBXHA2B10Yo3JbdJ+5ppL2vTuMi1XG3hIEykCe9do6fBtvIvCrkkG5U6KpjFW05hywXp51NvbJaZivu5U0QNFlAVpuvAJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VLLwigjV; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cc9fa5e8e1so143334351fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705600707; x=1706205507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrlV4jgpWCJfzB/7NzgqxnwjrFZnXY4okb0+G7cWf8A=;
        b=VLLwigjVLLWhIbwEUpD3weBJKWQ1Qv5LCLFHpwDO0XO+dKXo4KGoh/s40jnB6S/NhF
         ryPJvItm+GlSFfzIs2yxYMiOhJR54OPayNtoPUlMYUFtM458oJymhqJHX8U+mQbp6MSF
         Arkwsjd3ZHGKWMRTKF1QkagN1sC8bEhl63A0cJw64wIy3jCNcpaWorUGweCpPsyLMqp2
         QgCie7nsOdg4/le5W3WfGPRLLwZtFOzEAZ/5wcXbH0524RNho1O3YP9E5qjVWjMzNGoy
         anAPxVH49/evX9Ds9YHGVndkBSujazjuEqdJOCR5t/mnT83WGajXDqiBdDRYnD+LQrPr
         Dedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600707; x=1706205507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NrlV4jgpWCJfzB/7NzgqxnwjrFZnXY4okb0+G7cWf8A=;
        b=Q9AuUK+E0Impy5xaTTwUKR4y3W5lwYQWPbKn0ida3+ztSYKxDgSiXJswX2fpSdk1JX
         hTnr2xB0CZxu0gPmlPmof1AWup/OaNmL6Wb9Dg4KZqnWSiQXLgF/zpDcrAhyr82Qr/hA
         vyDziONyf+Pp4n0Dq0Jn7aNlgwdWfNVkNJiRcm48KxQCnDAy6dwGdXfZrHLCiYNC0Va8
         7mlpQxSbUBKpoz8F599N0RXeSI4SnuIS11o+dNedheQ+b38iHo+QXRF43ZSeiCLIrE1y
         lkwyRgcda6Xfgf8YDR0A3QDK3vtCC18d3W+QSs4li9OE4MaRMy6j6i8+F0rIorVlK6po
         YG+g==
X-Gm-Message-State: AOJu0YzjckUMZ3u0m5m0qgkZ1yUBhBVNC2y58AQIt9Wvn0Z7B5d6XlLO
	yNt/txCwCs27O+2cXhFDlKM/EBoOnVXfaR2ng3ZJxsd4ox7yE0EPmBfXhKw3WHs=
X-Google-Smtp-Source: AGHT+IHA3nsf2QxBjJzDDsSCfuzn2I5E9MPsp1wzSuINFGRlDEcs7im02+W9DqUrmxZ7PrDqlAUQ8w==
X-Received: by 2002:a2e:a555:0:b0:2cd:23a7:a346 with SMTP id e21-20020a2ea555000000b002cd23a7a346mr1045547ljn.83.1705600706894;
        Thu, 18 Jan 2024 09:58:26 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x43-20020a2ea9ab000000b002cdb6a40096sm1507098ljq.131.2024.01.18.09.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:58:26 -0800 (PST)
Message-ID: <7d012b9f-b1ca-4633-8dc2-03d90c418e7d@linaro.org>
Date: Thu, 18 Jan 2024 18:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] iommu/arm-smmu: add ACTLR data and support for
 SM8550
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
 jsnitsel@redhat.com, quic_bjorande@quicinc.com, mani@kernel.org,
 quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240116150411.23876-1-quic_bibekkum@quicinc.com>
 <20240116150411.23876-5-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240116150411.23876-5-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/24 16:04, Bibek Kumar Patro wrote:
> Add ACTLR data table for SM8550 along with support for
> same including SM8550 specific implementation operations.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---

[...]

> +static const struct actlr_variant sm8550_actlr[] = {
> +	{ .io_start = 0x15000000, .actlrcfg = sm8550_apps_actlr_cfg,
> +			.num_actlrcfg = ARRAY_SIZE(sm8550_apps_actlr_cfg) },
> +	{ .io_start = 0x03da0000, .actlrcfg = sm8550_gfx_actlr_cfg,
> +			.num_actlrcfg = ARRAY_SIZE(sm8550_gfx_actlr_cfg) },
> +};
Just a nit again, but if struct definitions need to be wrapped, this looks
better:

{
	.io_start = 0...,
	.aclrcfg = ...,
	.num_actlrcfg = ARR..,
}, {
	.io_start = 0..,
	.aclrcfg = ...,
	.num_actlrcfg = ARR..,
};

Konrad

