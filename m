Return-Path: <linux-arm-msm+bounces-45806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0F8A19284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 14:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5B2188292B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 13:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1978C54782;
	Wed, 22 Jan 2025 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvrQYSiZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF825761
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737552644; cv=none; b=RsJo0D8kg1FepaWJPn0vMs0qAOgvCxt/AAsElYofjc/GR9lTYGbBmMPlZrGelUCemTuGtrynIFu+BURxu5FP9I76pBD+6MXQwPvGBJqOPrTFtb+o9ANVjqwZch+YcF8aHE0lAjXay4QUaJYtJJ+L+f8QukMSonakT0Uf0CM35pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737552644; c=relaxed/simple;
	bh=nQ+EfzcRSwtzPf/2Sjx6eJs4I6cX9R80znntCwpy21c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc9UErL10yOuqVPbdnZZlKGMDQzU/Od0hgViA34Uh/aCReIhYGrHPCDpWn2Qzy32gKWd2f+gLlkMwo9vYu3BVgGBtdJfLVkYbSeXXYJFN+nzAjpWaemAnbCCIeow3zVg4eIpMVjHiEY/huFjqkEoztVf+sfQBuLAAQN6BuBSMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvrQYSiZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3485036f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 05:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552640; x=1738157440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=KvrQYSiZU1WBLdFJNaulz8Fe3RapypBt1FULEDR3KSK5FPL5qDwJV202UGKKsxSjsM
         +NZYU0CQjkOt6Q5xD3YJJ/TgsoH/khuA6OO09upybgG0HU2t0M3Svs0rQ/eyV4I8QDA1
         houhd4bP004ExDUkGSqnYgiEE82f4fuu1+OBv0FC7/AiFnfgxAjhgNkY4AAh45piBOKi
         9wdXn92P4gcCUcpaSUWJPcdbL1JogQGfLgNOWO7Huou5+i8FUCtFbgizQiBQc5YOg4V0
         0r1+O+fOMbWX7viitlHfQGboVK0pd5CcWdweHCS/RxcvODLmfX7BtughD3XE4ONGqf1c
         P3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552640; x=1738157440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT5ZgwViolUdUf4pKeCqLICO/10Zy8qj04pN0k9tFs=;
        b=sgYC0dkDgwquXLgiC8bUMa2llpcR2/um9mYGCdPoWp24ZpMMSHJO03fNMlUb8GIKs1
         0s/uKaXqq3yp3G5n//hVqAIp5X1k9XZQKyBwA0v044760Ke3DUxiO3ExMTzE+kKAZ9d1
         6pOCanA9Rbqm4wP3LuS1AjvijhA5W8lkR+XDM0n6ZXx0osBWO5dsY3EU8JsMb7ZHtzba
         OmJKDU1TOx42eeKSvGPA49RRb+uHj5Dr5pqyx0H6yhD4tJNbbYepDwy0xT2F0PS/2zRW
         iP/da7yXSjH70wJWiK01wbYn2YUFEKQr56A3ZdmZxnmY9jGrCQR7cT/Qnt12w4wKwp9g
         l7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8BWUPtHLpctNG0pBWDJNZcn9h/KNgxc8X9n0TGfkm0DIVWLyIzqZDQ2ARZJY93PoJojufSzfiPsRmBfwH@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdqr4whL0r/N5lbY+iHaf1jDGWO/aVWJpZ6agSw+YGyDPavt4
	zzIbsk7kkB8Bsl4tcUHRXQuxCkdT2uXDQjLJ7+rceNztNm0rezoIGwr/968XSzw=
X-Gm-Gg: ASbGnct5P/lCsAW5AJO3wef3rgSYR0e5lP3AOg7z8HK5ZHOSJY26hjjj8hEBy6eetp9
	YdcliWzIkvUnLjaDsb3aHzHnx8by5bHSGglgcdP65/mSaDF1e8ogodafQaGZkQ41/KN+EbfXuPD
	mOIjXqVKSH5E7+Y9q/RdqC3iksfz3bcYI9sbKHQ7PIAsURo+l4pHNpb+2Zelt4Y+vUzhUPYq64v
	gjwlIyegsmxlWSYGalxIaEXJIG50xKoWNNaT0nkiqFT6aeQFoHRoUHt11gEktFK8STsIz0rb7Fo
	VZNYpR8=
X-Google-Smtp-Source: AGHT+IHGz3oZZDXrd7dn+W7Dx6QiFyDmlY7D2ck63M0pEtyL+pVpGkX33GNbY2T81rXpW5skMbhNiw==
X-Received: by 2002:a05:6000:1f88:b0:386:459e:e138 with SMTP id ffacd0b85a97d-38bf57a604amr16210415f8f.36.1737552639966;
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322a838sm16081440f8f.48.2025.01.22.05.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:30:39 -0800 (PST)
Message-ID: <93be5858-6c1e-4a09-bfe3-ac89d458a892@linaro.org>
Date: Wed, 22 Jan 2025 13:30:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: qcom: camss: update clock names for sc7280
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250121180746.1989996-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/01/2025 18:07, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> sc8280xp. Rename gcc_cam_hf_axi to gcc_axi_hf and add gcc_axi_sf.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a85e9df0f301..b1358457c66e 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1443,12 +1443,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe0",
> -			   "vfe0_axi", "gcc_cam_hf_axi" },
> +			   "vfe0_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe0" },
> @@ -1468,12 +1469,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe1",
> -			   "vfe1_axi", "gcc_cam_hf_axi" },
> +			   "vfe1_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe1" },
> @@ -1493,12 +1495,13 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   		.regulators = {},
>   
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb", "vfe2",
> -			   "vfe2_axi", "gcc_cam_hf_axi" },
> +			   "vfe2_axi", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 380000000, 510000000, 637000000, 760000000 },
>   				{ 0 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.reg = { "vfe2" },
> @@ -1516,11 +1519,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE3 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite0", "gcc_cam_hf_axi" },
> +			   "vfe_lite0", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
> @@ -1537,11 +1541,12 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
>   	/* VFE4 (lite) */
>   	{
>   		.clock = { "camnoc_axi", "cpas_ahb", "icp_ahb",
> -			   "vfe_lite1", "gcc_cam_hf_axi" },
> +			   "vfe_lite1", "gcc_axi_hf", "gcc_axi_sf" },
>   		.clock_rate = { { 150000000, 240000000, 320000000, 400000000, 480000000 },
>   				{ 80000000 },
>   				{ 0 },
>   				{ 320000000, 400000000, 480000000, 600000000 },
> +				{ 0 },
>   				{ 0 } },
>   
>   		.regulators = {},
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

