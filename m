Return-Path: <linux-arm-msm+bounces-7571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6EC831ECC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E3111C2224E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540BE2D609;
	Thu, 18 Jan 2024 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsJEV6aE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11EE2D05F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600537; cv=none; b=rSVK0SpVXo28rQ3ngpfgHr1Snr2Vs9sC8R/9WUympspX9TIJS/mZxz3Pts++mZ6msI/dTOoTwlllsR09ZGKjYpw/2t9tBiTiNlPht9+PVL0Tv0OhiSXrCTD5Q/C7BNpn/xIjjAPB/MSpuPyafotu658lZQSmy2aVhHHVK7uv5mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600537; c=relaxed/simple;
	bh=aisBVFiczj/jDzFOQ/gAkAjn85FMrdiPrHE0pnY7fXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX7y84x1HKuD2hrL7iAVll+QtJg2hs/E97jcvWfaWsE9zArETg8t78JddI/JzmqRgNt/7DdjMNgCUOuKdh18t/bmdwnWuF/JhV3ouSkI2W1K5DtEfqPZIMpk+UypM8ULj6lHp9AjL97EPMQPzNR89n9VWMChCRhGLpkDvgYAChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsJEV6aE; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso14132479e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705600534; x=1706205334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ij3Aid6rc3/+qPxyjn4VOAO9ySy7PRtD3+5FtjfYAss=;
        b=RsJEV6aEBQbd5GLCWqs+Wn2NSyUjgdXNPMCD+Ql6TR+aparlOvaTgUYt7EYliunfrl
         W81DxqMiXaatFxpE2Qyl0qnPdtJIBduy4x9xB2UFHyg/EXU25CrqNyIAtGyt8TgJdy0/
         146Rzqb6ff+z3Ejse3AJJxtPTbW5TbThSdinSqHx8cjmhSMRdQz664n1YZo5lMz+a+Ev
         WJdSR8wUCr5G5SCs3iz8gu1EY9SsE8wDvKRkxepQcm5gkI8FD4zl3RWkSmt5o+zOKiRb
         De/0Qb/TYz9EOy/rRicf1WchvbXvHF3RY+P38NOJVeOeJtGJvOa0q+TA8tWTdn2AAgE6
         ivbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600534; x=1706205334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ij3Aid6rc3/+qPxyjn4VOAO9ySy7PRtD3+5FtjfYAss=;
        b=wp5Iijq/vJ6/yW/4BYwHDMmndss3j2QmsgJ+I/+4T+iHI1brDdatxxWIxH0ThMmCXJ
         lz2GTK+LYyXn9OwoaflpO+Yj3fYPfKOV7IyZq1dDlOilDL1/v3kFYBpablbdXCmzuXII
         7HNZptGSeARUnYX9PB/FceFIVn4HQQ8GIPHkDMQ4LEkERsnHjJNwgaG8EA2CzrmSVwZS
         1rx5hcitcqe6mEFcExxIFxPgle/j3eNNqpV8xDRC266JuYGhgsd9k6uFNILcIBKmCKuz
         6ppN4r5K1m1CEeNtwKfKFVO4ZCQx1hkGOXCu7PUSV7DiO9QTLRzlu29cGasL1LV1RVPl
         xC9Q==
X-Gm-Message-State: AOJu0YyNO5kmlnLpeDLDI+opzM7jz08lIL6P4xCs+DpNn2H79sARoqOS
	0nA/wUFw3b1L0U7CHtCO57vuxwqscVAjCZveWSCqzVI4MmUxCQYvAv/DmjX5zg0=
X-Google-Smtp-Source: AGHT+IGG228V8tanAnesngcf1mfWcLrYcU8aze9RSKB7jrVY3whXoAFZhO5z1Rmk8AJAf+oAZfApwQ==
X-Received: by 2002:ac2:4c48:0:b0:50e:2f46:1111 with SMTP id o8-20020ac24c48000000b0050e2f461111mr6414lfk.97.1705600533660;
        Thu, 18 Jan 2024 09:55:33 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id v4-20020ac25604000000b0050f0dc3a08esm644932lfd.151.2024.01.18.09.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:55:33 -0800 (PST)
Message-ID: <f25b7a0d-28b7-428f-a88f-2ceecc208f85@linaro.org>
Date: Thu, 18 Jan 2024 18:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] iommu/arm-smmu: introduction of ACTLR for custom
 prefetcher settings
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
 <20240116150411.23876-4-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240116150411.23876-4-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/24 16:04, Bibek Kumar Patro wrote:
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
> 
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Since it's your idea with Dmitry's review suggestions, I don't think
this tag makes sense.

It's normally used for situations like:

Colleague X: "Hey Bibek, I noticed x broke on y, can you fix it?"
"Sure!" <proceeds to make a commit with suggested-by Colleague X>

Just a nit below:

> +struct actlr_config {
> +	u16 sid;
> +	u16 mask;
> +	u32 actlr;
> +};

This, can go here, in the header:

> +struct actlr_config;
> +
> +struct actlr_variant {
> +	const resource_size_t io_start;
> +	const struct actlr_config * const actlrcfg;
> +	const size_t num_actlrcfg;
> +};
> +

Otherwise, this looks good!

Konrad

