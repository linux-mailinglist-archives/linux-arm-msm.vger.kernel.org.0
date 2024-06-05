Return-Path: <linux-arm-msm+bounces-21727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 570CF8FC617
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 10:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F1311C20D79
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F2019922F;
	Wed,  5 Jun 2024 08:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRIXlYAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C870199232
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575505; cv=none; b=YirzVyBuF1qJFvc+swtv+HhxWoCmxrcyOY9G6NlB4rxlQ/1lroMUh866i+2A8nOzu4+t2htw0Bvv6kl1IPTkJCciJfLS5tHDDqX9/c+Hfp/Ei7/8vozQ1AChx/V+3aQcsc+G891Q+7TXOTl+/ign338NjWyBShnHmIT1PdYwuLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575505; c=relaxed/simple;
	bh=nYuggaP5OlQN4EdqIUgdigJsr3LueYjrNkB7hqxlvy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=acdcUNxkpFN9alB6+2z51TGLST2ImZsAYx9Mjf3PF2yfJApryi4V71Y6LaB2YnPhvDI/ST2+IGpvvm6hgkH9aVHPSV6/SNNkgkOeVsxy5AbWJWu6nkZXKXnCyEWVjZJwwYN8jTa4592PLbs144JSJ+e6Y4xiFrI9p5nSTEfUsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vRIXlYAZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4214f803606so13838815e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 01:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575502; x=1718180302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YHTyr4Z8IFfCoMY0nq2p3HC+oRHjs8UmhM66hgIBca0=;
        b=vRIXlYAZ4AJaE+eT0mZ9ZP3UA1Bd4Q9EuzB9mu/o542QmWv9Em0+g384dro9svZ/Rv
         Uk+nioFUrg2KcxG+5VWgMMPU1LRPD+ALFpfAAFt9zhq1ZgMSwZlBJcdZPKhfmYOQuFAy
         49hU3dp8hPUmS8tNKHlisPZqak5hL79srl6fTK2V7uBbdeqQHhW7A+G/AqoAmQ+vE9pv
         nx+Ltd6XDUSbauBf6y71qh4+6aWB9lT+BCZCpddLdiOxPKTECpuLblGzRxQvbQRwfwGZ
         VjIArJ00gWajazp6bEMme16nM8fxKWCvNt5I40fo3fDK5D1oIt7mU7x0dtXoiubs4ILK
         59Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575502; x=1718180302;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHTyr4Z8IFfCoMY0nq2p3HC+oRHjs8UmhM66hgIBca0=;
        b=UjXTmNtgGg/d2+i75dbdWUlhUHtsvYnczHhlVTpGr1LLzqwQRe3a9XPkXYeI+6k5T0
         uTJPbnDf19PxmZmYNXAZQoYtYynBCiNw2GwIpUNNc296l2IobGYaSGEamxeGRgC0hvk5
         faNMa1HgGA1ZigumGFUH9TqvVbDmjCYUee4Y6ex8mcKqCb2OAa4buIHxu8GrI/1zpChJ
         EFhX8B/JX3ZYZU7uFhGVdSmMXWJQZrPgksVaD0NLVU2ZDWysOFDhVhem9gNwidQZ7EeA
         FFZ8dlrJPjNRV6ePqhY5c5cn2M8SfhMcdMqbY60QK0CzUv2zCn7ZonAW1rPT+a5yEe4M
         2neQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHm0pDp4lfTXVHXJUC4UQXppjNJy6lmphr5/bEshHg5ClfFHP502SnHaVET/LUi/V0dJPjKrqVi1Q0sJ58VNLjuTJvGxaMfmTlAslBPg==
X-Gm-Message-State: AOJu0Yygbv3l6IxpJKLrsvHS96o7Je4oPEtdWnl8rdXxvsmMem8PSk76
	hyYhzuxVI+UzRO35mEdtbo5TBglp/aKVTRn7VvnVVyq/rLYui53A5KEkGjeuTcA=
X-Google-Smtp-Source: AGHT+IE6a9aXRUtuQV03zs1vY07UmmfoJztBwBWmf9PITZAV0O+jhc3Q0cr2yOuyHaw+pCw/rAtFKA==
X-Received: by 2002:a05:600c:1c19:b0:41f:d662:65f6 with SMTP id 5b1f17b1804b1-421562c7dbfmr12602565e9.3.1717575501937;
        Wed, 05 Jun 2024 01:18:21 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581020d2sm11363645e9.11.2024.06.05.01.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jun 2024 01:18:21 -0700 (PDT)
Message-ID: <451963a6-74ab-4654-a9db-c6f5e2d1b28e@linaro.org>
Date: Wed, 5 Jun 2024 10:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 6/9] arm64: boot: dts: sm8650: Add board-id
To: Elliot Berman <quic_eberman@quicinc.com>, Rob Herring
 <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Amrit Anand <quic_amrianan@quicinc.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Andy Gross <agross@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Simon Glass <sjg@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Julius Werner <jwerner@chromium.org>,
 "Humphreys, Jonathan" <j-humphreys@ti.com>,
 Sumit Garg <sumit.garg@linaro.org>, Jon Hunter <jonathanh@nvidia.org>,
 Michal Simek <michal.simek@amd.com>, boot-architecture@lists.linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240521-board-ids-v3-0-e6c71d05f4d2@quicinc.com>
 <20240521-board-ids-v3-6-e6c71d05f4d2@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240521-board-ids-v3-6-e6c71d05f4d2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2024 20:38, Elliot Berman wrote:
> Add board-id to match sm8650 MTPs and QRDs.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> ---
>  arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 6 ++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> index be133a3d5cbe..ceaf7cc270af 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> @@ -5,6 +5,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sm8650.dtsi"
>  #include "pm8010.dtsi"
> @@ -28,6 +29,11 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	board-id {
> +		qcom,soc = <QCOM_ID_SM8650>;
> +		qcom,platform = <QCOM_BOARD_ID_MTP>;

I don't see a single benefit of this. This duplicates compatible and
brings absolutely no new information for the bootloaders.


Best regards,
Krzysztof


