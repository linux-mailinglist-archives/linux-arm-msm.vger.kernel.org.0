Return-Path: <linux-arm-msm+bounces-22924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEFF90B84B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 19:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C09BB26AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 17:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C361891B0;
	Mon, 17 Jun 2024 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNT7NuiE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B61891A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 17:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645980; cv=none; b=rCaSgJoUjtrY/ec2gwBBO9Uf+IVWBlAbFTUmETAF5en+n+Ov2WBK9MzNUG/Ce0DGJTgBIDzARuYPhlOOSlnOCkh6wJHd40lFMyZs8J8nUZ31OML5tZ54VCFM7kYMWQK14C5sDdvCqWgeSWfSPMBEG7AX/W2eZ5XZ4HdJDIL2ln0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645980; c=relaxed/simple;
	bh=7tbngbM0thJzH7DBH8FLM8dfaladHgKX1kOLNHAYi7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oN5NunchMFvbFt0WP1m7vbPC+t9eGAAXHro3yJ1uyrZPxa5+PxGabRYDCI3jQXFzVDUB5gGHxyyHm5Gk7ipSZzMj7BNdKuMlQWctUV2WcRIk73xzKypp7mZby9BHA1JYlPS1tWYRqSGIFR/ZWd056b4i+wyhGsbC1ec6ZyKrOf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNT7NuiE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b7e693b8aso4906783e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718645976; x=1719250776; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkTc3joUdIw3ZeosQL+9+Gg1cqpTq6IsWfB+l/kr07k=;
        b=YNT7NuiExncqKs6KZg4lGdUk+qzMQlEm1VklBTEfZpbjx4amJZNXJPxBnOQeMxR6Mp
         BB+0MFyxNzWgfSFIOMxuM/coIdAKNxpz5DYGb5ggLkYbUFBFR0M+UBcPtyjxhsKFvE/0
         n18N3j6KB1LkpI/mxnNY7ORWnEHwln/Bppa/ajZumV0Sjna0i7EIxKCdz1D4Ey8w6/t2
         oESvo9qz3IlMscUZbUrlaiCXAQs7NVaf+J8JI0LBow8vkH+QYe8kAezGBWIv6x3lSh/V
         3aVhcUAhel1D2XRliRUtHcox1Hz0rZ99RgK+LX98qsu21r5iQaVtF7WV8XhN+dmtIIM9
         Wh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645976; x=1719250776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkTc3joUdIw3ZeosQL+9+Gg1cqpTq6IsWfB+l/kr07k=;
        b=cD/fBFjNfDhCniUy1Qgoh5EmMka4Xd6fLKiHplhHS07XHPST/+secXPaxIinXICPsf
         9Z/7cri+Fog7VJHf3xZ0TINiqZLuQyvzLroRLYXK57t8pEuss7C+n8mWsvg6t77DWYXI
         ustkuvqunaW02suKucfOGOayWux58nmsjRuRb9hLXzy+tXGeF1E+v+CoxBWoDHbdr/a/
         W4WtqmZhmMSiE34xd+V5eEJuzNdy+tmGq7yhk/RcaXVuLRzjMfx9fYckPqy2HuEItXTF
         BsruDQ1ngArVGIIm3CM8R/56JG017HdUWpTYPAmKSLCuPnlI0Mx6E5Sr2arrTw/JdYka
         LgWg==
X-Forwarded-Encrypted: i=1; AJvYcCUCrxdIyp4FvBFgyPE4fywWX7UsyvheVJd9HM5S4NAw6n9y7jUN1i0fMD0PUfnWYTsWof7rDDVZ2y2FpLQWz/27Qm9lf5s08pNoym42Vg==
X-Gm-Message-State: AOJu0YzyYbi71C9bH9MMkXMMNPTteZ9TbniVcmHp4woNw2y+3WcNBM9m
	G0hPmx3Lmd/X+npPVLkrr1VdzEyfFCywlZUKEHVqSpWJQg9rfbKVHxK0sqnIa6w=
X-Google-Smtp-Source: AGHT+IFqFPRmpS3LOzv4lOvGb9jjYE3HbZMF2oFd6BHrIpNVU/vzTJcDXnOpRRO0oZ9ZZxbHzjC2kg==
X-Received: by 2002:a05:6512:3452:b0:52c:ba72:9414 with SMTP id 2adb3069b0e04-52cc4ae9fbemr60960e87.32.1718645976525;
        Mon, 17 Jun 2024 10:39:36 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8? ([2a00:f41:cb2:a9df:20fa:cfbe:9ea6:1fe8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cb7c98b17sm560651e87.235.2024.06.17.10.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:39:36 -0700 (PDT)
Message-ID: <311e97da-3ec3-407a-920b-fd042392cf0b@linaro.org>
Date: Mon, 17 Jun 2024 19:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/15] dt-bindings: crypto: ice: document the hwkm
 property
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
 <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617005825.1443206-14-quic_gaurkash@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/17/24 02:51, Gaurav Kashyap wrote:
> When Qualcomm's Inline Crypto Engine (ICE) contains Hardware
> Key Manager (HWKM), and the 'HWKM' mode is enabled, it
> supports wrapped keys. However, this also requires firmware
> support in Trustzone to work correctly, which may not be available
> on all chipsets. In the above scenario, ICE needs to support standard
> keys even though HWKM is integrated from a hardware perspective.
> 
> Introducing this property so that Hardware wrapped key support
> can be enabled/disabled from software based on chipset firmware,
> and not just based on hardware version.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> ---
>   .../bindings/crypto/qcom,inline-crypto-engine.yaml     | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index 0304f074cf08..0bb4d008f961 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -27,6 +27,16 @@ properties:
>     clocks:
>       maxItems: 1
>   
> +  qcom,ice-use-hwkm:
> +    type: boolean
> +    description:
> +      Use the supported Hardware Key Manager (HWKM) in Qualcomm ICE
> +      to support wrapped keys. Having this entry helps scenarios where
> +      the ICE hardware supports HWKM, but the Trustzone firmware does
> +      not have the full capability to use this HWKM and support wrapped
> +      keys. Not having this entry enabled would make ICE function in
> +      non-HWKM mode supporting standard keys.

Just check if qcom_scm_derive_sw_secret is available instead

Konrad

