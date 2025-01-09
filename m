Return-Path: <linux-arm-msm+bounces-44496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49308A06BC2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80CBE3A365C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 03:01:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1191584FAD;
	Thu,  9 Jan 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="eycMJDfP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE292E64A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 03:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736391679; cv=none; b=XGVhUS4cPH84Sn8ot4SJ7+nkzbSZkWcN0yLXeip1GYoUnSP1vWH73YCsqPiLDJFO6vMZOH2q14v5+JE+xt3K9P7X3mHpEwiJyT3c5hXr3KRzu3je9NMoMOEe/BkJG9byeoYvC7VqALC6xhxLqTxL+GS36dHyfRT/ilqlgdPOgU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736391679; c=relaxed/simple;
	bh=styal6a10fBSjAdXfS/03k5/+K6pkiyNCbLjLqDpKJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KCDDH4qmoe9PANn4X0/2HLyh9ohWphaOFtJpdAXid+picHeFRithKdtjhT/TW1i3S4AZyZhhErS+QZr6Of1Ve4wPS3TkhxQ1NwTjStRgv0bOI1wbG5acxEjdHJnre+jrzRITV3YuDhMkAYG+A4sawkjMj308KUGeLelMoTyRBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=eycMJDfP; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-84a012f7232so51373839f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 19:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1736391676; x=1736996476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chLFunAF/6a+8neQ/O4A300WGPV8Q4UnrjtHUfVgGHY=;
        b=eycMJDfP6/cPe5uB6nhiFej8YK+SSUMNnoqiGbGMWBqnP4MjvMLqe/eDN9U1ouJeDh
         dMZXCvyAoOrmEk13KXmjLxNxqrxAhTxcAihykCE3YdMRqPoS8JHJI/6MdMpcgXJyKZig
         cT/IJOduplB9DOqEjqlyid/Kgm6nJ3ZKMbJZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736391676; x=1736996476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chLFunAF/6a+8neQ/O4A300WGPV8Q4UnrjtHUfVgGHY=;
        b=Evh8LD3t9BgJeghCz+U5dxsStm2OrIUV5Fbq/W0hYZWQIKHoyeFmcEFHpYuqAxK7T3
         TgJ7ECLBAjtzw+a9x7rHpg5Zbpv2+ZbP0bueeh4XM1sH5mu9kqUo5JM3GJ0gg0R/xi/g
         O6G5uiMtKV8K4yngnfHV9JStFbXxzliuJsY5Rp6C+RMVA8SFjaliuExIxKCPKTvlcoph
         YnsmH2xqDQLa7WF9CTUxvMjUg162hKCJMdAvm37D3tYz4bgKFtZS+dhqmAIh9e6AGpwS
         ynk4aCWcRTOegRD/mzPwp4xGDUh5WDN+NayA5XcBs0iLKMi9deOWz5LiGkc5zmmqHgYO
         Oo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdigQtAHOEiTYkSWAwhLU/8XLZsjxnwRbW22PrafSgCMFSEEHZFCjKQabKjcG279S6+W5TxKDHVEMpNzzX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzLPtWf+puKOs/vjt/sm+Vk66JuTNEepyUj9O3LekFxueC6eu
	043mXUCWUFcDJIFdtXN62Phho7fW3EWplE/PSxn4v0e2JEaF3yRr2ACKLd5o4w==
X-Gm-Gg: ASbGnctIG/FE2hNdRgMpNaMtFxiaMye9gUQr5N4y1GCLjhM13gy5gOi8V6o1tRW6ixy
	QL6f4fQOVJot6bGPYXozI88PxPP3Erx416MVgW0SDQusjIojfJhcWjGYdx1XZr8QnaSjGWABgZv
	4BUTUMCOaVo4LBSim2a43eKVdVwYTxDIkq9WGJ1Bm4bCCu1m0jLvBEuTI+kx9NQY89c4ybg6R1O
	Kthq3vDLwsI/chxzdxBSAT7krlInDd4TvKZDR41B2k53yHQZWHO8NXfgXbGUUCkTnXprDlhYmDO
	axS8k9JC0rghxkdXSmvPk3tE
X-Google-Smtp-Source: AGHT+IEmu7TPSTXMcXWqBPqzgGP992fYz6d0NlpSB4pe0TArY/5e/MlCpviUh6kU6qxRmMV/w50qsQ==
X-Received: by 2002:a05:6e02:1a8a:b0:3cd:d14c:be69 with SMTP id e9e14a558f8ab-3ce4b212f1dmr5019645ab.11.1736391676216;
        Wed, 08 Jan 2025 19:01:16 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3ce4adbc838sm1149235ab.30.2025.01.08.19.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 19:01:14 -0800 (PST)
Message-ID: <9b7a7b9a-7f70-4ba2-b948-ffa1a7ae8f53@ieee.org>
Date: Wed, 8 Jan 2025 21:01:12 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: qcom,ipa: Use recommended MBN
 firmware format in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108120242.156201-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250108120242.156201-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/25 6:02 AM, Krzysztof Kozlowski wrote:
> All Qualcomm firmwares uploaded to linux-firmware are in MBN format,
> instead of split MDT.  No functional changes, just correct the DTS
> example so people will not rely on unaccepted files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Looks good.  I don't see SC7180 modem firmware there right
now but this seems like a good change.  Thanks Krzysztof.

Reviewed-by: Alex Elder <elder@kernel.org>

> ---
>   Documentation/devicetree/bindings/net/qcom,ipa.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index 53cae71d9957..1a46d80a66e8 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -239,7 +239,7 @@ examples:
>   
>                   qcom,gsi-loader = "self";
>                   memory-region = <&ipa_fw_mem>;
> -                firmware-name = "qcom/sc7180-trogdor/modem/modem.mdt";
> +                firmware-name = "qcom/sc7180-trogdor/modem/modem.mbn";
>   
>                   iommus = <&apps_smmu 0x440 0x0>,
>                            <&apps_smmu 0x442 0x0>;


