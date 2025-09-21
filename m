Return-Path: <linux-arm-msm+bounces-74373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A8B8E64C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 23:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EBAB16A49B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 21:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C8026E708;
	Sun, 21 Sep 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqYHalk2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412519F464
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490382; cv=none; b=mcarqmII5Gg86ukMIBGRKllTOvhby7jBfh8AyEqWlnInaPZMg6+1kJJiTi/mugVwkkNAlPKp8cREm6aZPWWzIJQPWShxkPKERdk15GF71wm4jyQaNJACR9OjUNipFMXA/znwsGI/41DXfAlhXrQqmYbC5m+/wCCB6bs0Z41Y6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490382; c=relaxed/simple;
	bh=6ypWfiZHJzX/xDZsK0T64csG57qQjcut8czBqxy2qWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSNpW/buKp1LaM7+9X84bqQPxYTs2PhK1DFEZtmNZH7hHAoQKTRDFycp01COYvShGZVc0QuAZKStKsFSZmNkHlX12cDD8+oC0DWIgw+KjFzRoSBJp9tGb8k0eIve0HQyHerb88T2+rXv04bknz+d3Eeihp9OCkG7CzmrCaFj2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqYHalk2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46d25f99d5aso2184915e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 14:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490379; x=1759095179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WcyVlJ5ccBg3OsxdDlx685Nr8K8wL5Pp0q8kjSCRzk0=;
        b=LqYHalk24oU89xEtZI3ebBI005MzS7y8hjblvW2vNhZpD0St2kkku6uWb8Lef/Rrxd
         162YzkAvuOaS8bJCmQOoyNzCKNeBtUTFqxX1jfunLb6unKIETUEcqiPyOqn+FBiqmv87
         V/9uV/btiIFUr67/ZSm8oAkSYLRoTUDjyx9kRT6t7g1B5qRIdo5klFTqW+A9FGUa4Rof
         X5H3ZxwinwQwZ7VyJ+C43LkBGAMs6H/ntkr4PEVn92l4KWrzaLpCk0ZNVzWKH80H3uJs
         T3tFCvkRh9C9RmVhcavG8W7/FWNSDIGpIIouDEUudul8H0N6hTvt4W2zDfl+ak3DJDWR
         0G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490379; x=1759095179;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WcyVlJ5ccBg3OsxdDlx685Nr8K8wL5Pp0q8kjSCRzk0=;
        b=CwkwXmkPDdKqjswpAUTaPqzgETruXgEgkEq4quXrghSSiSjqpc6ti3gXjBrD8YbBqM
         EY3bO7TUVT/zxfHs9DxyMdoNqgjmwcP48Ugk8bIoKQoRmL9Sa7Vof1GGigsH0cIdjoEO
         Ty8PY+uaPxCxRXKLq4F9C/Iwu0FBftM4frJjuPdjDp0vO3fe6GNdFvjh7dF+08yUv5kL
         dKkyX2f/Q9nw1qvdwDW/xSFhH4H+SKLAnZvzr4AOngy9fXJO39R+kInaHOuHpXFAVaeR
         MOIQim39sDLzOKyxIin9qvFNs4kkS0cy0R5sx7LCUAUTvbOE4U4T4Y2GM5E9ltL4zYch
         fQPQ==
X-Gm-Message-State: AOJu0Yxf05u6K164AwG+wETH8Y4t+qnMEn8fV+bfqtNwbybSCx/tP2lS
	6R1A0/73wlQZPBK5f84pogm2wVXuPylQ7wwCdoPZNhWXnDqfFclPXCLiO212uPkOeOg=
X-Gm-Gg: ASbGncsYQGSi40Q/NDvzgwqhaRrcFxJvfbJbIATty6dO5/DLlJGM4a9QHOKLY5vI1Rg
	/0gQRP+IdwsI8DIizve7TSEdDKvPNKKKY3OgTbmQzRG6+yyPdyleozTBAl2Z0HK3XeX5AJ4NTui
	nhYbhHj3KpgI1A552KvVuFf3FmXHEHNVerpvInsU4H+OIyC6Gr9+wE3vOk78V7ZcdXH47HUKe9p
	ydo75p+yeiU0NV0ps1fe0tPqBSQSz3t/MOdrVBXMQhu86i/t0eKI2fD3039E5KRqLZEJxu3Wvho
	94z+8PS6NLnd7AiXHVAl/by5w8/nuBEZWsJcisNtvF82aiy9O+OfqhiBE3Q4IU2YprS92VIuYQa
	dhRpQmKqr38WwKs0sCjrNacBj8SqgY25DUpyTfsDwgQ9aFYnM8vgms5Bam8S2edfWxz6fCk0ejD
	2ZNlg3m7FzYK1QbhqeGlA1z1nOkQxY6A==
X-Google-Smtp-Source: AGHT+IGrFtUS6kuiPjXUW8VEeVl4lEajrMTBX6lS1ArstWn69VRG3TQJ1C8xitL4/hpLzTt7MqEPSA==
X-Received: by 2002:a05:600c:4754:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-467a7f111b4mr119477045e9.6.1758490378901;
        Sun, 21 Sep 2025 14:32:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f4f9f4e4sm196526075e9.13.2025.09.21.14.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:32:58 -0700 (PDT)
Message-ID: <f3b384cf-bb2d-4476-b97c-1f63dc64671e@linaro.org>
Date: Sun, 21 Sep 2025 22:32:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <CJt90J07fyMMpE4e0cdA57Hr2SAcSOfVD1Y2NWFfICOWw7rfnwzPtCeZnR9dGbu_uYVGKezX9spjUO89uFFMPg==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:40, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> configuration for remote processor and when it is not present, the
> operating system must perform these configurations instead and for that
> firmware stream should be presented to the operating system. Hence, add
> iommus property as optional property for PAS supported devices.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> index 63a82e7a8bf8..8bd7d718be57 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
> @@ -44,6 +44,9 @@ properties:
>         - const: stop-ack
>         - const: shutdown-ack
> 
> +  iommus:
> +    minItems: 1
> +
>     power-domains:
>       minItems: 1
>       maxItems: 3
> 
> --
> 2.50.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

