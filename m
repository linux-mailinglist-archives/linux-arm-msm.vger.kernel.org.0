Return-Path: <linux-arm-msm+bounces-17025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B82A89F1B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 14:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0901F23845
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C4E15B102;
	Wed, 10 Apr 2024 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPiVYF9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD615B0F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 12:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712750923; cv=none; b=F3tW7oLkTZBtXhcWiq2JYguuTb3MOiqNB0uaa1fvg4sHs5Y+koJVSfucXvfeKLVO10jhk3kIkcbe5XojcBi6/KYUNqa6ciuXlkbQuK8ZiSJx/lDSkprqREBBrC5lPcEHatVavoX//EHvXSrUHfj9/cCxMqMwROAqf2hBZvhLF2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712750923; c=relaxed/simple;
	bh=jenHaOnHcbxtWDU/sjx/JJIEbosXdTyAf0Nq51UQ+ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=id1Xym/rCfW0uUwoHPJZtMiyslvenUB9e0lLUmGTpzS9gykRHh1Fbdkgoh63egLuNCr6uWlHQM6VeynjUGcmHawWvz+nA6ZAW/fvpnOA5sxwRJGpVTFdzVZEJ6LFPhpQRZN8J+9ju7Yq/ZKbodzfzcqg+nWulTuVSpF95iXoWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPiVYF9a; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d886dd4f18so39513951fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712750920; x=1713355720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/eIBodkkKg9gHiISFmQzqjV9vYTJz8x5fg7OEsG2PY=;
        b=DPiVYF9aQ0Rp0shN0jc7a7gZB3ChAgjpGMGFblqHQiPmmI7UFWvkDaWILtEcSMc+v3
         w3u03LfixU0LamxAPxJKwJaQFQvBJGAQdfWt1duCKk/cEUugt5EkgeknC/lsuOtBWeUD
         bBL5odqyAy+gzNYeQQLEAN/3qlPt+H1t5UGOWVrjofs5eaZoVd9XdAiTXa5ZZExXDwXh
         ba4mTRiCF48BrUkfAUncEPs3xhyqiLuAEL/6bITYwsRBOUHEEOsFtbiN3CIPlblmk+Lv
         HXwxYo1rW9c0fEmkfqiWFeuH4IL23Di6taXJ4h2kIRzHMDoNFUGBMEVrLrqqjIQjm7lF
         +U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712750920; x=1713355720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/eIBodkkKg9gHiISFmQzqjV9vYTJz8x5fg7OEsG2PY=;
        b=SAN3R4qoznX2Mn1+bnAFueJQSvUTrLmnIIe2mTLh8XXvhrLP6vgtbErIUI8MqWIWzy
         V2iAP145JzCVOxYg5HWG4dZd2aKOGfG41fvUSi1yO7WKnawIbgH911b/83lyQ/T+ZpIp
         4c3Gc3IHxjLKIvMsKcWngiR7V/QTxy1Iyq26pYAkcy85Pa8djabws4E2b20SonJrZS0v
         iq/GKJhDBNxi9kSr1bktFIp8qCfGY5IMGTueWMT4m3lsYdyLXNpLvmDY7yN9LfkbpHdf
         Wjx3rWn0m9U1sRX5h27uclw5DFbnvQw/bjvw82MdDv5OuEq0ctqYSA0ygNvjnGUBBvYX
         qEhw==
X-Forwarded-Encrypted: i=1; AJvYcCUO1pYwkov6LFHZ6z9Ce/YXc3LBhaJ60uhYvnDOKcYS6R6mWoDIeDxOrq9Pwpp079YNlhcMHetJ2pNKV24SZNrcs1HVNlhjXYy/TUJ4BA==
X-Gm-Message-State: AOJu0YwJ8Z/JbVj3QpBiOGqRYJu3XmUnHztZf/DBv0zEZT4VKzUkRUqD
	cKGyX3fn+wlNudQu2hDT2QMhTM61CiweD5pGIlgrhPufngDYF5BFuaMWc3+5neI=
X-Google-Smtp-Source: AGHT+IHWhWVUT+mJBbmOEO2cd0a3sYytqZtHgO7IW9217h6HPe6S+6voseWdDbeYpLJ8PbQDvZI58w==
X-Received: by 2002:a2e:81d2:0:b0:2d8:5fb1:4b80 with SMTP id s18-20020a2e81d2000000b002d85fb14b80mr2016525ljg.24.1712750919723;
        Wed, 10 Apr 2024 05:08:39 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id r10-20020a2eb60a000000b002d2dfe8a36csm1795293ljn.96.2024.04.10.05.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:08:39 -0700 (PDT)
Message-ID: <d21b1b9b-6f1d-4ffe-b5e3-41d0a43fb17d@linaro.org>
Date: Wed, 10 Apr 2024 14:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] arm64: dts: qcom: sdm845: Add DT nodes for the
 TBUs
To: Georgi Djakov <quic_c_gdjako@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, iommu@lists.linux.dev
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, andersson@kernel.org,
 robdclark@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_cgoldswo@quicinc.com, quic_sukadev@quicinc.com, quic_pdaly@quicinc.com,
 quic_sudaraja@quicinc.com, djakov@kernel.org
References: <20240329210638.3647523-1-quic_c_gdjako@quicinc.com>
 <20240329210638.3647523-6-quic_c_gdjako@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240329210638.3647523-6-quic_c_gdjako@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/29/24 22:06, Georgi Djakov wrote:
> Add the device-tree nodes for the TBUs (translation buffer units) that
> are present on the sdm845 platforms. The TBUs can be used debug the
> kernel and provide additional information when a context faults occur.
> 
> Describe the all registers, clocks, interconnects and power-domain
> resources that are needed for each of the TBUs.
> 
> Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
> ---

[...]

> +		mnoc_hf_0_tbu: tbu@150cd000 {
> +			compatible = "qcom,sdm845-tbu";
> +			reg = <0x0 0x150cd000 0x0 0x1000>;
> +			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			qcom,stream-id-range = <&apps_smmu 0x800 0x400>;
> +		};
> +
> +		mnoc_hf_1_tbu: tbu@150d1000 {
> +			compatible = "qcom,sdm845-tbu";
> +			reg = <0x0 0x150d1000 0x0 0x1000>;
> +			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			qcom,stream-id-range = <&apps_smmu 0xc00 0x400>;
> +		};
> +
> +		mnoc_sf_0_tbu: tbu@150d5000 {
> +			compatible = "qcom,sdm845-tbu";
> +			reg = <0x0 0x150d5000 0x0 0x1000>;
> +			interconnects = <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mmss_noc SLAVE_MNOC_SF_MEM_NOC QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			qcom,stream-id-range = <&apps_smmu 0x1000 0x400>;
> +		};

These three are missing their GDSCs, the rest looks in line with msm-4.4

Konrad

