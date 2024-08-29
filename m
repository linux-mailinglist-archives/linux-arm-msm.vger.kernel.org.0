Return-Path: <linux-arm-msm+bounces-29958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE59640FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:10:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69911B21A3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A3215E5C0;
	Thu, 29 Aug 2024 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N80c+WHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9902B18CC1E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926227; cv=none; b=NUdsKKQcIWl9YA8Gl4vnG3zzoN+Rd054eL6yQ+M7gqe6TDwMlA9m5yKKGfrMxG5LorgBOkiMhAp13CZpGDrejKLoymafSBEpT3vqZoZPGM52KVR0jTquQ5aZWf8857Ml21j5aygXWJXxiAFBbmWsm0xzdO1JJQhemmiXrokLV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926227; c=relaxed/simple;
	bh=Lt/9ND4lk2gsg2G4bm2hpuneDuZWchDQV3zw1+AFHoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiHCc5loaoIAV6NduTPSjYvGXg7AGwT3saPtLnJnECWSjarsMmOrbRBKkozGgcYBiyEaeElLGisTTmm95MmAWKtSJpW/yPUmZ3iymhiSqZRwoVKnHTtkW6F9XvbloNTvjWK8pUZjEeCZ0aPZ3Y3icRWK+85i30Fpb3lK2cwEXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N80c+WHA; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a86abbd68ffso84764766b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724926224; x=1725531024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x88YAxOWPM6Vm2Gaxr6swuFJGR/lRbnBdiJSpLORFsA=;
        b=N80c+WHAPfZQua9L7jxqTPEQYmzuAn/Me3xpn/usPwy99sFXFU/IBtiNmtZV9OjVwi
         NKJgUABSWjP/OQkfRiuoob1elcgffh3GEI8XohAKehZ0ErmKsbKwl1l2afVFruKVE/Sz
         9gCTxO12KDcTIbTHEwNJ7zlfZHsVxU+hsJy7QJ8F7fsoSrcR+ikwbU/ZGYT3MzqtplfS
         yflhLxdoPXgJA9/+OMmDSdA9ntdVPp+BIraeU3ybB8+qP9MHulXgIgv11dekIYssPt0F
         2R3yq4up4X9dw1rS3QOSo5xVms+1r3o7qkopBZtfNdFmk8FfrMGNFUYJql1gx3XRCo2E
         +snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926224; x=1725531024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x88YAxOWPM6Vm2Gaxr6swuFJGR/lRbnBdiJSpLORFsA=;
        b=vQZe7XAMGJmk4GH3Der+ZUGCPGEAex7QTUlkKEzo6q+xFNP+0ZreBfaiUaQCYqvQWq
         GVIKmSooWAknOhoAvo+z43LhLRqBj/pq4SYuzfsqZxikJi1jD0y9BvaD27ZX2ZI4PT4+
         mhe5hJ25f1aEanYMRF2k8vh2A+VRIiRltB5nVhoVyuNxXyiLP4ObKFZSlb2VNtBvs0xm
         GSct9xIf4AJHzVsEZ1sLSSeOi6QmB45Cm7zGW+jKpQwVay9qtRbrag5O82nyhJi+L8/v
         5wUZ/WfL8cic6KpYKACrEOqmwlvCwqJxCWedmj10rLEMuLDrK61LLTA/WjzQC93LYyrA
         C4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXQIYTLu/tDF+39brwtRkm0FENy9CB3SCY0qg54aTSgltPTYp/+7PmtASNCCsvfGW+J6ChyeSlC81Mz7NR3@vger.kernel.org
X-Gm-Message-State: AOJu0YzVBu7zjZfFL55ZT/C1mffSQMNMkGMBdahvjbx5NpEZHUa7u4yC
	AVvxvWPGt/IyF2TNPhVUZpC3u2QRpdKOBUeV7/qU3t0iUVtvoqKAy6rVBOgsbJk=
X-Google-Smtp-Source: AGHT+IFNZz/FqMD/n7Lr2gtCtPCnz6hc+vHB01WkC69OIprExbTP7zO8xXE9q+kqD8YaMxA/hnBEXg==
X-Received: by 2002:a17:907:9407:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a898c41445bmr156461566b.12.1724926223712;
        Thu, 29 Aug 2024 03:10:23 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb32asm58908166b.23.2024.08.29.03.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:10:23 -0700 (PDT)
Message-ID: <c3ee4cd4-a4a6-421c-9114-fba5ecc365da@linaro.org>
Date: Thu, 29 Aug 2024 11:10:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] Enable shared SE support over I2C
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
> This Series adds support to share QUP based I2C SE between subsystems.
> Each subsystem should have its own GPII which interacts between SE and
> GSI DMA HW engine.
> 
> Subsystem must acquire Lock over the SE on GPII channel so that it
> gets uninterrupted control till it unlocks the SE. It also makes sure
> the commonly shared TLMM GPIOs are not touched which can impact other
> subsystem or cause any interruption. Generally, GPIOs are being
> unconfigured during suspend time.
> 
> GSI DMA engine is capable to perform requested transfer operations
> from any of the SE in a seamless way and its transparent to the
> subsystems. Make sure to enable “qcom,shared-se” flag only while
> enabling this feature. I2C client should add in its respective parent
> node.
> 
> ---
> Mukesh Kumar Savaliya (4):
>    dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
>    dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
>    soc: qcom: geni-se: Export function geni_se_clks_off()
>    i2c: i2c-qcom-geni: Enable i2c controller sharing between two
>      subsystems
> 
>   .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
>   drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
>   drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
>   drivers/soc/qcom/qcom-geni-se.c               |  4 +-
>   include/linux/dma/qcom-gpi-dma.h              |  6 +++
>   include/linux/soc/qcom/geni-se.h              |  3 ++
>   6 files changed, 74 insertions(+), 9 deletions(-)
> 

In the cover letter please give an example of Serial Engine sharing.



