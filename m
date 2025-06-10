Return-Path: <linux-arm-msm+bounces-60765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A822AD34AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E47F3A3A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0309C28DF35;
	Tue, 10 Jun 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fg6WGMlc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF228030F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554091; cv=none; b=PBdCwVTTt51cRasGD6C2nqLy4L+VrjEsR/IBwb0jkrYkzRCPwS7qJSLbcZ8TNDkQSqay0qUXxz+c1N8P2NEoygQp1OHFBSUflrFDP0/3bSpwtemolVpEleNsGQOMVblkc0yn36DDdr3sgS/OWvoOT5c7PqOsPg3Y38+Hq6/FOK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554091; c=relaxed/simple;
	bh=qerf7R7x3MmKFRml/liVP9QCkPFqOO3yGP2nvsx19hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5ZYKra6F1p0rn7VdO1taop+q2NMcFEpgRncEKPKGdKSH9MBmwXotJ0YJxsnxtfDKkYxP3EfGLMMAwd+rWAHOZKgbpmL/oY0hHdOYmCKF3pxBovowhn3qDwBn3qEX9H0y+MylsgpYoBJufye1uodmzhsRBoJ92QgBmRh2WsiofE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fg6WGMlc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4531e146a24so4105255e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749554089; x=1750158889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u9YfwqU8RsJJfZWtSE6GdaClk0k0kVRiBuWkos8aGMg=;
        b=fg6WGMlcM0m+5c6G1Kv6zmSR+TpdcR4Ym1giOsALt1H6IwKzouI+nbkCF6xccqPj0r
         KrC/tUMlA7cR+neOg7no3ByFhdEBI2NVwesFaov10Lqf+W6hDT0v95RqlrdfXbD2KijQ
         DSaiUU3jr3/5aJ6C/rDVCrCVWFwnQy5n3JKnsaQo57BvGM4L323efnOvmG6jB0M9LtR9
         FDYNTNYAyNzvx/Trfz1XkdSeitonMXwfsgqHm2FxoG3A4FdQ7YbUiQ5nqFmmK9eZlvp8
         k4QEUHG1MY+aiezb/WxIsfewLUSIPTMtORrskbBioNzlrR1bD0VCxDeWHxhrYXJfm/g3
         NhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554089; x=1750158889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u9YfwqU8RsJJfZWtSE6GdaClk0k0kVRiBuWkos8aGMg=;
        b=v8L10VwntubWplcYUFqSLjwyUP+1PUA6QlL3kXSmzdXQVtf8wRE8yFnxBYqGSllv7Q
         JJunTaH/H8Im3ojjD8Aplki6Hp9dbXllZ23563zAMDf9NCE5sx2nPUQFPu2iDip3Wctq
         wJuUe3RqFVEXVdXUbXKx2Sphli1KrToJJqlj6iUzb8kdm62Ku1Q+iEAtFuBEeugm8X2f
         OUrHQ0xHQf6eryS3U4e4JRHSsJMWgxnNh7V9Cgvp+Epi2WGiHLMeZCiLvorpmEWSnXWg
         6mDXF1E3RX+p+5iPmCV1TpFrusdGuvOCF89J1U72lbGKziVW8NjrUf9eEr2hAjdOpxRv
         w3eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1VqLbnK+UemwAP06agZL3vXGXf6XrU0jURFCCHbO4S+I6hC77pNRxrzKzoL1As7Qr2/qahN63j76Cp3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzE/wWOsEyEhoNA79LIx7IPHBwdnD3VFUiSUwSPaIxiVy/oo8T5
	vPSiK55m2S2jGsbvkjbHGFTHJ+DM+tyiKZpvvb/b4vOb8fBpJVSdPO18YxP80g+VWxI=
X-Gm-Gg: ASbGnctLTAUWOYGrz9ajQcN0koE+ZwKQQnH3oExHu7KcZLF2fjN0DEj2AdGcnGH4S0K
	XccDBTWdVgJk769trbv7PM3PkwrjIKsNCniWZXH/PFkclo4XfXFiRk0/+RbI9aScxVjOR9NL8c7
	JfqD8nui8TbQoGtwwX3Or+n+co0Q8TvBhB95oGBFNi3iR+NL2itq39d9oqD4jBrXOFF669v1bVx
	P1DxIeixWD515IDZjfvb+g12QvoAXe45+ah1l7rdvQUWFSL5ptOR9kxpbPh+H39pNtXEdDGtzLs
	7pl797lqRCf/jGT1qPAVoiZNBpzMVC52Uv76OgzO8VhWP4/zLZIYUqKiT/7mpUhFS1Qxei+/Pwd
	rfF57oWFzYJ0lWn1rbt5P6p+TpHc=
X-Google-Smtp-Source: AGHT+IG64JuaWmpv5wfb7cvgoK83Q0NILojodK9xatw1h8mZUrS3UNG5bUBkgBBPrquvsC5B84JHZA==
X-Received: by 2002:a05:600c:1f94:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4531dde6b67mr22418225e9.6.1749554088664;
        Tue, 10 Jun 2025 04:14:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45311490f44sm61809845e9.30.2025.06.10.04.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 04:14:48 -0700 (PDT)
Message-ID: <a072d00e-df91-420b-9363-424bcdf1ed8e@linaro.org>
Date: Tue, 10 Jun 2025 12:14:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/2025 09:33, Vladimir Zapolskiy wrote:
> Sort the entries of interconnect and interconnect-names lists in
> alphabetical order.
> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/
> 
>   .../devicetree/bindings/media/qcom,x1e80100-camss.yaml | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index c101e42f22ac..7d4e6ef57bf8 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -100,8 +100,8 @@ properties:
>       items:
>         - const: ahb
>         - const: hf_mnoc
> -      - const: sf_mnoc
>         - const: sf_icp_mnoc
> +      - const: sf_mnoc
>   
>     iommus:
>       maxItems: 8
> @@ -321,15 +321,15 @@ examples:
>                                &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>                               <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>                                &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> -                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> -                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>                               <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>                                &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>   
>               interconnect-names = "ahb",
>                                    "hf_mnoc",
> -                                 "sf_mnoc",
> -                                 "sf_icp_mnoc";
> +                                 "sf_icp_mnoc",
> +                                 "sf_mnoc";
>   
>               iommus = <&apps_smmu 0x800 0x60>,
>                        <&apps_smmu 0x860 0x60>,

How is this a Fixes: ?

---
bod

