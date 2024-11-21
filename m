Return-Path: <linux-arm-msm+bounces-38713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAEE9D5519
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26E6F1F21771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D430A1DC06D;
	Thu, 21 Nov 2024 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqGHjc7W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE931D9A62
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732226477; cv=none; b=lBpoOyVW6HM6919U5YKTBo/G5qXsHoyXQ0Kjp+s+sx5SOsspiooxUs1MAdTxOBT1BqIFOGfUc8HuV5IlpRIzsfpu33ZWUWi90fzrOdoEoy95LSQuflp3885MobebrDeM2hrBt2ZDEGb3lEIZHl0lJEyKeO+x6W4njno+sz08Bwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732226477; c=relaxed/simple;
	bh=oULDhTY9NKL7RUXhTGGxFaIwXHvE7IZ1UIswvh8QlU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwa7eFlRyKDTXzWhpoSCcVr1mO+LU+4oZV5Zfxf/RwMyr4t0poYAZrWV1K/NmffKRg/OPZgdv5zeA7Nn9cMJTK4da/zhYp3eaY+8fdjzSqyzWKZW88UU+EXwuUliRuDulLvf4DmhgyBujfvi+wDA7n5gJixsMKzkQsuOnoSDFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqGHjc7W; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53da07b78dfso1615207e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732226474; x=1732831274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PypIErFyD/n0BNOpM458f7rPV3XZUhIzNxg2aBsXTpI=;
        b=WqGHjc7WJA77kBg4oS3H44MbbnPwmVQYq83522AaVel/GYU2VOp5kvlpquzNZyVYYP
         JxKXiEegpEcxst2sFX6DyIZ0RGUtJCdIuHBkuoaCe9xD54HtTqzZ5UKPfgXyKKz0ungC
         28MB94MY301/ZWVu3X7NhXDR4lwdTxJ2onSyS6whYP991AvlksYQn7clqahyXx+wwMZz
         CdskYLm0CCreKMEHhNTswwwfbhpKe6qowlDriWHKeMnFnkhw4F6ApmPr23ZWIT0lDuu5
         +Kr4PALqB9ah1gJUNwU/Id9FW7o5R511CJSKddva0735/Y68D5NGf4LN4nhxWN/xS106
         CCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226474; x=1732831274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PypIErFyD/n0BNOpM458f7rPV3XZUhIzNxg2aBsXTpI=;
        b=fFxLu7qxlHH2JkEuL0ypWF5H2uDwBHmxoQ31zi+9oZn8JB6YjrkpXrWbFmDsfRejut
         hUSXHHFtAsP7Q7+NEXms26dzqqysx+YeQIlx/Ao/TgxymJPc6EtIrlGdZOKrciqMormG
         NavA0QVT7KPO18ziEKgLT/7PlY+36Tv1pUUjz58KEwes5SWZ0TnML6/AgpqaBvqMoBDZ
         8MmRsUdDgUbBAZUzaiES400OS9oQ/uWrCoD6qPoWIA3kDfwFcvsQD7OwvqbXaFgiub4U
         4vrtyqm1lLqhMyGsHNieRR5VbclF9jraihdvuXriWs2AZ65F3o1WLAR7U1u89lI2KepJ
         eJtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC8HxK/xkuHRIUveitBzX0o9ltNvBhjNPZY3+QXILNeY0lwNlVPqn/+M8XLtJPum4jDCpoB1sekLn0UTYI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7twYTwvtVXzGpxKAmdYfh3VFyFp5zcwBXOy4LgJZ2pfHVH0j
	eXPFqUqg0i6gIPZwhdtUhZvwzRYVFePZVEs0rPEUUiWQF9HygRCedzl9NyirJ48=
X-Gm-Gg: ASbGncuswciRmGd8nb82j+qdf3BO+HcUGNp9hL7mF1T97AM1DLYF9yDqLyaxoVaD/L9
	tDI2a2VT5wbK3uOExCCn6BytaOuo18IQjW2BuIDjHGS81lsuaufCF5jZu+XYfxjpW0Uq21yTboY
	vKRlEHTZpic0l5JIlTCwhioyuzXZdUSTiK3pEB1iqE787xNkAU1KED/zdr+Re9OJw+50ugxCu9d
	i58xP57Y4aSm3bsWuQfEalZeTYFaDz+ItkL/hAIXfPaGMTDEEJdi147wSrt0SoRJGVrzZBgbWRP
	/gsIqT/V8AA8sk9BYU8alCdLCR/xgg==
X-Google-Smtp-Source: AGHT+IFFL2q/vIMRHr/WtuLEdj4EJHjWtGPHoUZcmjYRAKu5VLoo+jdnHtTWOwZ8S+bh83TLTJUqqQ==
X-Received: by 2002:a05:6512:2382:b0:53d:a8d3:aeca with SMTP id 2adb3069b0e04-53dd36ad5e2mr186652e87.28.1732226474029;
        Thu, 21 Nov 2024 14:01:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2499fccsm89849e87.270.2024.11.21.14.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:01:12 -0800 (PST)
Date: Fri, 22 Nov 2024 00:01:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Odelu Kukatla <quic_okukatla@quicinc.com>, Mike Tipton <quic_mdtipton@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom: drop QPIC_CORE IDs
Message-ID: <fuplqyfqvfc6foi4tdsts53kvdokfzprxwxedgi6hyxicedvvk@3rrx67vihbex>
References: <20241121172737.255-1-quic_rlaggysh@quicinc.com>
 <20241121172737.255-2-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121172737.255-2-quic_rlaggysh@quicinc.com>

On Thu, Nov 21, 2024 at 05:27:36PM +0000, Raviteja Laggyshetty wrote:
> QPIC resources are modeled as clks, therefore remove corresponding
> defines from the binding as they're unused.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  include/dt-bindings/interconnect/qcom,sdx75.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/include/dt-bindings/interconnect/qcom,sdx75.h b/include/dt-bindings/interconnect/qcom,sdx75.h
> index e903f5f3dd8f..0746f1704ec0 100644
> --- a/include/dt-bindings/interconnect/qcom,sdx75.h
> +++ b/include/dt-bindings/interconnect/qcom,sdx75.h
> @@ -6,10 +6,8 @@
>  #ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SDX75_H
>  #define __DT_BINDINGS_INTERCONNECT_QCOM_SDX75_H
>  
> -#define MASTER_QPIC_CORE		0
> -#define MASTER_QUP_CORE_0		1
> -#define SLAVE_QPIC_CORE			2
> -#define SLAVE_QUP_CORE_0		3
> +#define MASTER_QUP_CORE_0		0
> +#define SLAVE_QUP_CORE_0		1

This changes the ABI of the driver. If this intended, please provide a
reason for that. Otherwise you can not change the values for the
existing defines.

>  
>  #define MASTER_LLCC			0
>  #define SLAVE_EBI1			1
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

