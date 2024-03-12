Return-Path: <linux-arm-msm+bounces-13950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D066879B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 19:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F279D1F23085
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 18:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C53137C2D;
	Tue, 12 Mar 2024 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIkZ4nyI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F017139590
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710267292; cv=none; b=sWrxOti4TQFp8eeGtIkG6RsyrFto1j2j8dS+Odp2zAGB1GUFjntAsuaGr9cIaJI3wWn5L7hYC79kEhQJ1K2MdT19phIL3X3LxNGxYrJBER99oQt95BwBGd22hTsMWosSWB+oWMujObm5aTo2b7X1Myt+9VYGB/ZlRcxWCwPzNmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710267292; c=relaxed/simple;
	bh=NoHLxl5q4br2NmwuVbEbWC8Hgzx+ElYfgu5TSPvDZak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSXN1O+hcQQ4M1tXPXtmuRflEVl/oGp50ZNIsMnbMZODgY5G6fKSGT35JK1edw5UO/WcvGvgx1aHmnhv8lgaezIHwIQTi4lTieXTkvqxfmEEsdjqPuAjurf9fNoZ/WQqJ+D8fAnneh3Zt0hndNIL0iauxalh6OY5G/zBsQPQsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIkZ4nyI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512ed314881so5245802e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 11:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710267289; x=1710872089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ndyrovNU7gmuZatlaLPeU/xwQKMeCdI2vpreLiAY164=;
        b=iIkZ4nyI2z+siU5OovPexeDkLfJpvNaCsQrPYm5xao0TXt/wBm9LRO3ZLix5bliNWw
         szZ3Xvzyfv11pYa+p/iwKTVNFoudRH38/ol8dZ4U1k4C9KcUnWpl89bQCjeytHpx5ePa
         Tx9Ty6vnmMdfV5Z4/mKz7Ci/8gEo0y+r8sQQMWMdtl0c4FL01L9Y3K5BiobNcPM5p+ui
         Yhk1dJtEBW+9SjIpxMetnoex8+H23sUV7dbesA2L5hquRUgFURxRAHgxI/CbXlszVhYU
         sF21GGuC5+vW6MKFvCUH+nic/QyoYmenACn0aJ6h0JXbDpsUPK8wgQGFrfXYbFR/lAqk
         HOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710267289; x=1710872089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ndyrovNU7gmuZatlaLPeU/xwQKMeCdI2vpreLiAY164=;
        b=U2x7faEjk2epdwkOMTmGQ+AvbGZiIup9q3yM6BJWgsk6eNpQCpoDMmSgKp6ed80uq8
         3nhUOVPgnn6P8B5e9zYMYY9hF/ejnYcBM3eu2+Vlyr9aB8HtI6ozBIgaSqFjHtva/4b7
         yMXSs2StGlPrYyvXzIjuEz+GgQDHV51c822rn3u5fL6BuCPGDkBRjLHTsR9SVAsPEqOR
         iA3YajAVmYgZ9GIq6DxCP7zOvOx9sbAIcmP7utl1QWj7ns/7iV5ExoZwo04Pd6GUwKuW
         OzTrwtjSxhagz+HjgwEBYOjg/f1082QCDokSluze6Hz4LML20YOhVoAfBmIu7Lam8FaA
         MHYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8pywhecUnnHovPyJhfXepDFiQZXfLNhxGhw6EEI64JAEGUHXpY4Ry6jTppKfc2+XbAHcdOJPUjcWCGWaBQ5pCVTfKYqPpqdZ23AiZeQ==
X-Gm-Message-State: AOJu0Yw1Vp5g+dD56MtETjjyiNSsesQyeqSojMni6pf6vltT8IbcUslu
	XtPUSH2+WMWeH8lf6Z0ofm1g/IpqSLlQ2kbx0xo54OrOIMGbvT/LsxZyqLAn928=
X-Google-Smtp-Source: AGHT+IEESLK6yRlor/BAs+mtT8DWCpjx4vz0GFvh9t3WEDBysSuHBbCc7YBtd8LxA3B7iMwul9UANg==
X-Received: by 2002:ac2:4901:0:b0:513:a140:fbf8 with SMTP id n1-20020ac24901000000b00513a140fbf8mr6285218lfi.30.1710267289328;
        Tue, 12 Mar 2024 11:14:49 -0700 (PDT)
Received: from [172.30.204.193] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c28-20020ac25f7c000000b0051313a9bddasm1675985lfc.252.2024.03.12.11.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 11:14:48 -0700 (PDT)
Message-ID: <8e00b2e8-866e-490a-bb81-73a9cb9dc737@linaro.org>
Date: Tue, 12 Mar 2024 19:14:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/7] iommu/arm-smmu-qcom: Use a custom context fault
 handler for sdm845
Content-Language: en-US
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org, andersson@kernel.org, robdclark@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cgoldswo@quicinc.com,
 quic_sukadev@quicinc.com, quic_pdaly@quicinc.com, quic_sudaraja@quicinc.com,
 djakov@kernel.org
References: <20240307190525.395291-1-quic_c_gdjako@quicinc.com>
 <20240307190525.395291-5-quic_c_gdjako@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240307190525.395291-5-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/7/24 20:05, Georgi Djakov wrote:
> The sdm845 platform now supports TBUs, so let's get additional debug
> info from the TBUs when a context fault occurs. Implement a custom
> context fault handler that does both software + hardware page table
> walks and TLB Invalidate All.
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---

[...]

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 5c7cfc51b57c..7a58b1b96bca 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -422,6 +422,10 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>   	.reset = qcom_sdm845_smmu500_reset,
>   	.write_s2cr = qcom_smmu_write_s2cr,
>   	.tlb_sync = qcom_smmu_tlb_sync,
> +#ifdef CONFIG_ARM_SMMU_QCOM_TBU
> +	.context_fault = qcom_smmu_context_fault,
> +	.context_fault_needs_threaded_irq = true,
> +#endif

Is this enough for cases where CONFIG_ARM_SMMU_QCOM_TBU=y but the
dts changes aren't there? IIUC this will spam the error message in
qcom_find_tbu()

Konrad

