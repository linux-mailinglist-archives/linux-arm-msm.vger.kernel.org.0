Return-Path: <linux-arm-msm+bounces-84005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58214C987D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 18:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 608F43A22C4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 17:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD10A3376A0;
	Mon,  1 Dec 2025 17:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zom9/Imm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A133375A4
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 17:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609609; cv=none; b=FkvgoVSmxjUXJ7ARSvTlA1/MVal18ewTZTAp1Kn3082MpmYDSr07bnBnumUpbfOQhZhFPZ+SdewkD9vyceSxYg0zzVCGUSHLD5WcaprAXtHMKKFEzwfQrku3wKHiaCdutJlR3SzoMyLi15kZsgU9LQG9IptaBhrWfJC1VT8yULg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609609; c=relaxed/simple;
	bh=Pkvbx/rsr9npY84kvBVhLaqULKnMKhECYvLjFUsYua8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=On944kAUnkjzrIc2BRJDDCWFbvDyuzuuQcLIge0TzIZ/m/DeGzdROC8u6GP2l+oHyNwTJ3TZrnbqUDZYIiw6N+Y7Krho3+aT20TnfWbV5sf8Jkjj6ViK3dcwZJ9pl0r/bD+PGJVHWcyJ8cXjGCebKDeO9h46a3yWX/nyjRBgUpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zom9/Imm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34361025290so3595602a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764609606; x=1765214406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2CBelm1P11p6Y7C7heiLZ9mkPWBlTs4Y3+LWd3Gn5o=;
        b=Zom9/ImmgKoRwIymf78Bc0fVpPrMSdvn+Rxmeb0DbDxa8K+JdOet0vrlcRWXfZ9viy
         iFb8iRZhsuGdqdisd5QRonsSm6crX+3wH6oGKMRma8ks5ZWmutbBugu0ZM7CLOJWChu2
         ig3i4hpzhqn05kotgXIOafTqeADiFsxjCCDOEWQukT8rCelk8P7d3a/2D7bhYoqF4f0N
         Me56tzu88x02TRzRHy2wAq26xa+EQSEeePfgdkycVydVldDNPxHeMPXdGc1AJB8o1zAM
         QwUqpNoVO+qvt7C9N4sq7tLX3DnmP9JfPXlKbwM+INKvyszOyLEfW2dCtwn5FB377FgN
         KkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609606; x=1765214406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2CBelm1P11p6Y7C7heiLZ9mkPWBlTs4Y3+LWd3Gn5o=;
        b=X+QU62kBK0m6uR4vmc4YSwvBCd9ORhavk2qnH/p5LWV53Y2XRJLk9GZxCuLdo+ikbG
         G4CqS/JJp21EHk5rQCMNpjn+SbBHUogBvnFHScqmlGh3RN03+j58p3HMMyO3zYtF99Oc
         jrXYvyl3mZzQptl+xwWutJpYfLXzVWCA9GPEF0BVTugNjsBWAl+YFz32WLBMPn0WsgK9
         TE2ru4GkQce7g6pdUKxr3RCX+dLEPzAZfhTqflY6vuNOXQtB9JwxcRfZEi3k1XZ8Qo9h
         /svGsIZV5e18BR1XWvOSAI2ebB/XdQsuU0ePapVkIJh+GVdeV4qXZgUe96j2w1lTuSTO
         m6fg==
X-Gm-Message-State: AOJu0YzALZPQ7t3RSOwJ8wijihcROnVb/7+5/Wm/SDssM1X6IStr56ge
	Fe+xhovY9OZNkVKvo3UfGsDwR4lDh4R5BtOCqq0VD8hci1uPsxE6Dti5
X-Gm-Gg: ASbGncuFWjOWK+88/IESjkKONu8ouWYGSle3x3LVxMim0Yg6zl/15xSFUPWtfzWV6Ov
	EffH/gxJEkOPLcYkUDXOeYiczA8qpsFtnnYyDiKN2zCdszhHo3xRvQJSPz8zEAFR2qTtR1H1w7M
	4uWctqve3N7bjFgVOtPbxa8TU6q9CmE3k//Zi0xcSSimMxfDxQCZXCfG308Kstfnn702Uz1qVsx
	kt0n1D3IJVnd0+4NfiTbsdPifKLU4Yr57HSN9PKtlXviU9RT//k6DQ9dIfHof2Jf58OvsA+cVNM
	f/4nfRNdJFmqeEZssQsgGQJ8jxLVXeXyjuWpFUZoEe3KS6psDA0wqT7Xnxl5gtg9HqRqwfWTh3I
	mfjHd6jWVHUv/L+5i6EzfgjM9tE71Rd1GfP+AjBCSGP0kn4YgSVNlnC5m1fno7C/iETSarP+Viy
	ra+uSnNi+9fg8KoK60H0e7v8GcfwP4SWOU
X-Google-Smtp-Source: AGHT+IFxUZMlZVPSrVRpIQJ3MuG4oYzgftZYA8N5yMR6pcGRWUMh7S+nz1of6oBw9lT1HrpGPm5IPg==
X-Received: by 2002:a17:90b:1c0b:b0:32e:7340:a7f7 with SMTP id 98e67ed59e1d1-3475ebe6420mr26672877a91.2.1764609606206;
        Mon, 01 Dec 2025 09:20:06 -0800 (PST)
Received: from [192.168.29.7] ([167.103.73.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6970sm13991659b3a.17.2025.12.01.09.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:20:05 -0800 (PST)
Message-ID: <8b10f0e5-6f6a-4b1e-b407-32cf7979574e@gmail.com>
Date: Mon, 1 Dec 2025 22:50:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, andersson@kernel.org,
 linux-kernel@vger.kernel.org
References: <20251129142242.3661349-1-tessolveupstream@gmail.com>
 <20251129142242.3661349-2-tessolveupstream@gmail.com>
 <176442976917.4054928.8877916591661919569.robh@kernel.org>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <176442976917.4054928.8877916591661919569.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29-11-2025 20:52, Rob Herring (Arm) wrote:
> 
> On Sat, 29 Nov 2025 19:52:41 +0530, Sudarshan Shetty wrote:
>> Add binding support for the Qualcomm Technologies, Inc. Talos EVK
>> SMARC platform based on the QCS615 SoC.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129142242.3661349-2-tessolveupstream@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Okay, got it. Will check and update the dependency in the 
next patch.


