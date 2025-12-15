Return-Path: <linux-arm-msm+bounces-85185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9078ACBC8E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 06:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F29E300BB9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 05:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B16B3246EC;
	Mon, 15 Dec 2025 05:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cwfl1z6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC428851F
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765775897; cv=none; b=FYAoGIvskhFYbeS5BMWjz7Ais2mEYDeZyJmV/CJjYw3TiXytfCf+lsC2p8ruPBSEAN1LwAJb2XXENN6X5Ai47pT+b1Kum/UXuQw2GkqkCKZbnKtfqNs+5dwSeNuzIBMdo6Z1Rt8aRJmCSHsEKNFECc5csjkpjEOnk8t3GFizlDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765775897; c=relaxed/simple;
	bh=EyhhTu6tEajuduNp4/0le6GxWfnSGbcGf0p5nThcZrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9MKxUCavxJmS3S9fS74shs/J2wSIBvUGnijBCWO7ThoUf6uoFlUcBbtS3dU/NaKD/NbVnb7xJ6CVaMbfPXtCtRmoKfWHnGzVorrJdJZfivo72zP9xRZmmi90USwiEuikPLK6KPjh7tqjgP0UUPm6I/mtmeMbIsm+ZsM37ho6YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cwfl1z6v; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-298287a26c3so38363045ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Dec 2025 21:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765775894; x=1766380694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bYGV5sGRh2yeK6uvxRn1wHQ6jEWyDVrINv6+U1Id/8A=;
        b=cwfl1z6vO+qUVJ/kEpR+Lr4aURVQNuPWddaQ+x3kC1SqBY8LBgPG4p2wcQC2IYlFgK
         lBqoCFwgRGdrOhhnviFX2J6A3YDDQAfEXr5b6bAekBTp5VzNle6WThA9PCFpEDFPrg0T
         NptK1k4/5IOPxUqF9SgOojtd2CUSc7NbqsJ5Fo/VL0A5pe6u9uaC7OpDoULsTvscXQsw
         7mIRuAGaY7aKV2luDl/9CCLUc57JZL96fvQaivg68pUM2Rpa7cI2MqdfDpwJybGtrLhf
         mG5XNJ7gspEA9ayj33xQre90gP4uppO+8L0JjzhMzcXt0Lelj5SF1drE06fzzq5BQ4oH
         g/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765775894; x=1766380694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYGV5sGRh2yeK6uvxRn1wHQ6jEWyDVrINv6+U1Id/8A=;
        b=u/J6HBSfC5aTNa/SxP4hi5barHzy5XqJ5OVFMdHgtNYG+oVQO9gkWGvWGpTFhfcoSu
         dJf8rVKOQHT4+pLXlQ5V/CGfhBElWqwqO0WP1tzIzjbY+wQXL0nZHgLxAMEn7u52vzKr
         rRUwSKcqY/HqeGJmR6H+W1car4t5aIBHl7d+xoRoV1OME6qiOM8gIXuS7bxE4E17OOCi
         55C2yCfY9NryzCmRq/gIo/A2nk/nXQTu+vLw82uvB2vohnPd6nlqpz/gsbk2LcxSBV50
         Uczv4RpKJm6J4lupqhOpHRPURNQfs5lsIdvOq4X+I8R1Iqnx4XRranuGM7kvvN00uOTZ
         Cz1A==
X-Forwarded-Encrypted: i=1; AJvYcCUoU+9dNvCdOPU+pDy6HHzFiPYK8oe+8PS/2KYYBenndAnTBIcpUv1yIdSDZq04gzCGMmXrwNF2RxTws02C@vger.kernel.org
X-Gm-Message-State: AOJu0Yww/exU3l4aa6nIMWVVM+AMGGwjg2HyuwWYL9gWZ8WHSsqZ8lKJ
	oKND0au+Xpfh6nNBqGHbyb/Na6ror6eWX8K9vn5HnePxaCK5oKh7kdouCNjCrLXoOUg=
X-Gm-Gg: AY/fxX6XSQZms7LJh08kZCHOg3ijYrB3XlYmPWlr8hz4Qk+yBnTjDGmCZndZR+JA0VU
	T+/8ZBkIzR2gY02h4cZdxh0U7syA0ZmSV60J/5neYjh3lO8eTcZWWr4J6X1IGwOW3ysTi9SpGbI
	e0x2cSVnG8D37s2fvlWwRU4Dbcq46R2gpxWj7bVqcJzgE9FNs4jntQzkTRwIwNTQj704OJHtVF9
	pPVcoFY/GtiI+VoOtxebDsgSPTVWmJh2LBeLHWevZsAkXZ0xf1MHDUQDH+YEYIa5UjESJwUNYhH
	HUBysMPiWdS0yO+3qDm16o9iGvNnwtUNgcV954Pwlh/gz8CBRb2CidnZNUfg2FwdQRS2DtUFDBM
	LJyIUmTd2nQuhvCzwMCnZiwr5ChUKkz8JxaQ1V9xXL2lsO725KsTf8yPTzO/wbgnp2WZ7zq6uer
	MAq3QQ7SvSVVw=
X-Google-Smtp-Source: AGHT+IH71LGyS6r6X/23fUIRTMHB9hMJFZwpz7dGoHIihSQCvhU76eKfPDxzle5KT+xNtC/kg/DPCg==
X-Received: by 2002:a17:903:1b66:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-29f23caa438mr105521885ad.42.1765775894222;
        Sun, 14 Dec 2025 21:18:14 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ef4sm122285845ad.56.2025.12.14.21.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 21:18:13 -0800 (PST)
Date: Mon, 15 Dec 2025 10:48:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: cpufreq: qcom-hw: document Milos
 CPUFREQ Hardware
Message-ID: <qogyami7g3wdvfodttrjqzvmrufw4qaqvzp3jsq6lt6wqshu5y@kofhldddiznw>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-1-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-1-b05fddd8b45c@fairphone.com>

On 10-12-25, 10:43, Luca Weiss wrote:
> Document the CPUFREQ Hardware on the Milos SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> index 2d42fc3d8ef8..22eeaef14f55 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -35,6 +35,7 @@ properties:
>        - description: v2 of CPUFREQ HW (EPSS)
>          items:
>            - enum:
> +              - qcom,milos-cpufreq-epss
>                - qcom,qcs8300-cpufreq-epss
>                - qcom,qdu1000-cpufreq-epss
>                - qcom,sa8255p-cpufreq-epss
> @@ -169,6 +170,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,milos-cpufreq-epss
>                - qcom,qcs8300-cpufreq-epss
>                - qcom,sc7280-cpufreq-epss
>                - qcom,sm8250-cpufreq-epss

Applied. Thanks.

-- 
viresh

