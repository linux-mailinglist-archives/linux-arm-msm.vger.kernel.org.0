Return-Path: <linux-arm-msm+bounces-22922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC1E90B832
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14CB9283162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653BF1891AB;
	Mon, 17 Jun 2024 17:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mm8f18AC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF425185E72
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 17:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645877; cv=none; b=DYEKHu7Lzxe6g/Yfl84wxB31oqu6yKfRzp2WrVjW2o9MtUGXfQAXR8KKWhZvjN4KoLM1EJM3lGUdOTiDJc+boYIVRshTvpIQQL3U76y5E5LU+q567mk8nulehg/jEWVeuS70UhouMOvv+GEI2+nyyvilZYaN/S7lmWOzTwqqS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645877; c=relaxed/simple;
	bh=aolkxKvRvPIVJ5LETI4Hrnp8zx+LOBl01iPVxlavPkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFTfC+yzkuaY4q1B6sf/bxZCukeeTYPYFKXTIzzrzF3DUcU2cu08Pxj3WkevPo4tEQi22QZyGu5oPKFZAIy/OLDjjG46tkH2mrpbwIk6poJn9b8PGbS5oJY0lqpQLztukqrjvURp0eDXi9FI5GjTJ7dEdQYiUb849XDOw08ts4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mm8f18AC; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52c9034860dso5808234e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718645873; x=1719250673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR/Rb5xAaQGOJ5DS10l+hrvLr7O7vUYtHmk4lXMtiMo=;
        b=Mm8f18ACJ+fDlXRc3DkfZIEWdg3ZYZ9SKjtokGYHotWlI5RAoKKA71ZfL5zFxpv5vi
         jEBrZR+LvWygkHD9igWHVlg50EVaHqPRNJdA97hMb+AY5lTqzZTB1Oa9Am2rmR8XbZbc
         ZMjnvTBXvAm8VDGYEkDD9BfSvOnFQ5+K+/0qkkisOIW3lWClJkozihAcGuexzMPab/R0
         B9AgfjYSCaOzECR5JgOeHMNVRGcWDhuuRg8uQmnhYsZevzGFCYsXqgwtgxGrsJ7R9Dps
         wzUwDyLUJhj/fFqUpf4zgyJMOc5VD7rUXZ0d4zS8j288u52tVetdTEFb9PcbHvTnK1r0
         3vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645873; x=1719250673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR/Rb5xAaQGOJ5DS10l+hrvLr7O7vUYtHmk4lXMtiMo=;
        b=NC450cFthuPE717K9C6W1DEH7I9vsf22HFSGLmaBzd+f3A6vbotGWhEZm0oZnunIQL
         IVrprtqLMinNGGm7IFd0nj3FLiak3eOm0ax+IBDYGjE4k+GxWzl87wQyHaVX95Y19PNN
         SwjgnwramptoT49IIno/ryi6J2NCuP47T0ZyRkhagPz+WYdHhVVnotA5AI84XZ3Ekusl
         VH4p6XSP0uNUxOL6fPIABxUmMyrrF44A/nMKZsqDE+bfXnAayjE5tXPKEDAKnB1GcWPM
         j0vOdahJT6HJSVQPd2zbCK42pTGMkYontUc//6+lhPNct07fn2/C4v22F8YfwyDItS+p
         QRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxW8bXxXvf0oJKanLNDW6k14b3RKKejZMXa9zVDDgKCC7VwhzVrx/aECOK+6eVo9Nu3iYEs8D0j2veflYrfJcCBCm/k4ge4l4LW7NOXw==
X-Gm-Message-State: AOJu0YzIl4QuB3UrzixQe4RMm+ZzmOUkQhzzay8FAhUoXncr0JLDLzai
	asvhtI4t5Wl3P2DH/nFg/Nb5QKmH+V0SOaVrOpFNtmLwExv854jiEnb1Wph3zi8=
X-Google-Smtp-Source: AGHT+IGar7uh7/qvCi73QxBJXZ6s6MZ9h6S2JVkmR8/klBJePWGXzGItSfkyV9Oe+VUxofwGJiqlyg==
X-Received: by 2002:a05:6512:616:b0:52c:c97:b591 with SMTP id 2adb3069b0e04-52ca6e6e321mr6501823e87.32.1718645872896;
        Mon, 17 Jun 2024 10:37:52 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8? ([2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cc1fb481asm60273e87.82.2024.06.17.10.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:37:52 -0700 (PDT)
Message-ID: <fab4cf38-d3b8-421d-a610-b16aad7670db@linaro.org>
Date: Mon, 17 Jun 2024 19:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/15] ufs: core: add support to derive software secret
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 kernel@quicinc.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, quic_omprsing@quicinc.com,
 quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org,
 ulf.hansson@linaro.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
 mani@kernel.org, davem@davemloft.net, herbert@gondor.apana.org.au,
 psodagud@quicinc.com, quic_apurupa@quicinc.com, sonalg@quicinc.com
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-9-quic_gaurkash@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617005825.1443206-9-quic_gaurkash@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/24 02:51, Gaurav Kashyap wrote:
> Block crypto allows storage controllers like UFS to
> register an op derive a software secret from wrapped
> keys added to the kernel.
> 
> Wrapped keys in most cases will have vendor specific
> implementations, which means this op would need to have
> a corresponding UFS variant op.
> This change adds hooks in UFS core to support this variant
> ops and tie them to the blk crypto op.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Om Prakash Singh <quic_omprsing@quicinc.com>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> ---
>   drivers/ufs/core/ufshcd-crypto.c | 15 +++++++++++++++
>   include/ufs/ufshcd.h             |  4 ++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd-crypto.c b/drivers/ufs/core/ufshcd-crypto.c
> index 399b55d67b3b..c14800eac1ff 100644
> --- a/drivers/ufs/core/ufshcd-crypto.c
> +++ b/drivers/ufs/core/ufshcd-crypto.c
> @@ -119,6 +119,20 @@ static int ufshcd_crypto_keyslot_evict(struct blk_crypto_profile *profile,
>   	return ufshcd_clear_keyslot(hba, slot);
>   }
>   
> +static int ufshcd_crypto_derive_sw_secret(struct blk_crypto_profile *profile,
> +					  const u8 wkey[], size_t wkey_size,
> +					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
> +{
> +	struct ufs_hba *hba =
> +		container_of(profile, struct ufs_hba, crypto_profile);
> +
> +	if (hba->vops && hba->vops->derive_sw_secret)
> +		return  hba->vops->derive_sw_secret(hba, wkey, wkey_size,

Double space

Konrad

