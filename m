Return-Path: <linux-arm-msm+bounces-66018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665BB0D4F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 10:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 463107A2489
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 08:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537C82D63FA;
	Tue, 22 Jul 2025 08:49:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4DF21C178;
	Tue, 22 Jul 2025 08:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753174174; cv=none; b=CluQRDaGxAOOg+Wbb9oU1NvgtChY69MCnHltfh2Fj2m8fC7MqDFA8mjDLjNcjvuVKsFU2F3JngM6rmDsC0y7+Uwg5kDtVN0Z+N0ycA26AUnO6DBkWJL4bkRfSG3b4H+Imn2gPxzdaIKf/uE+vsM0pBA4Kw7Phykv0lgvKYA4Xw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753174174; c=relaxed/simple;
	bh=VnCmq82uXeT9fbTPAPxiNjJsKPCdRg/XONRuwA8LE3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VmU2r32NuRe7ARod4n3M4myR3gz7H+MDJIE8YiV2UmtV/vocLfBPIWuOy1yyLkmwb6GQGkEsvjAvigah7TRxDdhKDBdUs1/+InRmOCA3dQHWFCnHIWxbH5+oXmegqxvOv59UK/QR+o6iIwhTFs53H/j85lwKYhvJmLerSjaDKDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CC97152B;
	Tue, 22 Jul 2025 01:49:26 -0700 (PDT)
Received: from [10.1.36.73] (Suzukis-MBP.cambridge.arm.com [10.1.36.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22D583F59E;
	Tue, 22 Jul 2025 01:49:29 -0700 (PDT)
Message-ID: <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
Date: Tue, 22 Jul 2025 09:49:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250722081405.2947294-2-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2025 09:14, Mao Jinlong wrote:
> From: Yingchao Deng <quic_yingdeng@quicinc.com>
> 
> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> extended CTI supports up to 128 triggers.
> 
> Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..1aa27461f5bc 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -84,7 +84,9 @@ properties:
>             - const: arm,coresight-cti
>             - const: arm,primecell
>         - items:
> -          - const: arm,coresight-cti-v8-arch
> +          - enum:
> +              - arm,coresight-cti-v8-arch
> +              - qcom,coresight-cti-extended

Why not call it qcom,coresight-cti ?

There are no other "qcom,coresight-cti", so "extended" is not required.
Is this specific to CPU (i.e., CPU bound) ?

Suzuki

>             - const: arm,coresight-cti
>             - const: arm,primecell
>   


