Return-Path: <linux-arm-msm+bounces-23846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E66379140F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 06:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 712041F22268
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 04:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A27881E;
	Mon, 24 Jun 2024 04:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I8isRJ8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9C376
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 04:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719202427; cv=none; b=XuA+glp7k7hGrqIMFiB96qvHLj6Pnkud5OS7fboZiltYxgRqJS+VcE+9I7U2m9TZt9h1gSNB8HZRN51svkhG6NFAOSHFXJQg9KtmoT4xclBYgAU4/VRrltm8zsbTD00nFhspea23Q0PPKPGL2zAoxxF/nQDOuSMt7JJ5skfV1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719202427; c=relaxed/simple;
	bh=g40p/038wh7aZoKP0QQSTY6JQqMKagXDwC16tPe4zhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgZ1lUHRi965WRaVj3Gy0mwIyHDX7sA4SYgozhaxeqcrATCf1A0pScNDEur6sQiyCHWMdYI66qof6dN3caov/emdq9ayXsEHawtsgPK93qlBqAU0Wic2d7Gjmq/LYKqolrFdbBYDsuiU8xENfbzVsObGBqKJsxXFQfTN/vnw310=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I8isRJ8W; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f9aeb96b93so27684325ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 21:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719202425; x=1719807225; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8cBzkTKbl++ipTccj+tqWjGiU8poirFQQErpQeRckjI=;
        b=I8isRJ8WsI8CdsASd+vWuGIv/oixor/Z/MwVtLx8yClY+RYsZPdtyuEHU2mKIDm9p7
         ly5m0XeNrc4m2J2c9DoDkGMyuDItKW8mo02K909+H0Zws7uLG4SjMU9xsql4ncfSEnqA
         3ueL2YiJuzuJdPZaTnla1f98NeXbA7KUf/yedYkpnLikIQdrsKo/CboLpq0UhSSDNCRs
         b7TlTaLdSUnejsAZQpD7TIeB9fid/ZfFasRTtIcPbdU/Ru5gz41gYZUzI2yFqs4olXaD
         3yeabTv0fIb/qDDKu3Gbzgtbj671i1q32xLuLx4MBAC4xtVB3gGSnVqEa2mROCSBwF8T
         L6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719202425; x=1719807225;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cBzkTKbl++ipTccj+tqWjGiU8poirFQQErpQeRckjI=;
        b=abDR1Ky0EvpK8/1zmsA3WFaLl56WVXZGOTy86uF+liPbW818JirOMHK70/sUU70RW5
         duqPTXWWtcSF8zqCcvab63xx4A70ykAsfGRlcncuACscaSx4zp4bdwxv5qqagYvZ/v5K
         nVcYXSWVm1zlrmWYHrLsIOwa2PbgFapgdNnkuXcnsL5gZdJxaeJccytPG2bg3skLc1XR
         D+fk8QIUyOupZ8bf4ADXmzEOsnhUjLCsbiYtXMNtl0gnEnaMmBYjmx+AuQpD2W5JJmLa
         qn/YFrC+PMCpQJ6SLM7N7QRQGnO9xd5pzsT83rdxG7z5DDV+/u2HAtKVWGICLBaxeDJF
         VJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVznsxELEo8ezLxPLs555gUUTiuN5N8v1PcWdZF0BPp5ZSwZoDgtkVJQPHdSQFUdrXXgX2bhvgQhX6cHXsZLBpm6grxJrOk0UXC82eR8A==
X-Gm-Message-State: AOJu0YwbEeDPCAkQBW33Nk235QfNYisABuqAR8imOFLxS7zhUD8nzSJl
	IBVBBVjhnSldd/xQrUwKZJel6+eeRA6Y8PPibaG6CcYzFfzwnNk02C+mEHJy9Q==
X-Google-Smtp-Source: AGHT+IEFH6u4Phxu4XFbcP6oZlGouPp6ySyJ7RzMJnUbJnrqSy6lUpugRFFKO7YbCnXWz8uf73KoHg==
X-Received: by 2002:a17:902:cece:b0:1f4:9b2a:b337 with SMTP id d9443c01a7336-1fa238e4490mr46624255ad.3.1719202425410;
        Sun, 23 Jun 2024 21:13:45 -0700 (PDT)
Received: from thinkpad ([220.158.156.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d8b7esm52445395ad.207.2024.06.23.21.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 21:13:45 -0700 (PDT)
Date: Mon, 24 Jun 2024 09:43:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/8] dt-bindings: PCI: qcom: Add IPQ9574 PCIe
 controller
Message-ID: <20240624041339.GC10250@thinkpad>
References: <20240501040800.1542805-1-mr.nuke.me@gmail.com>
 <20240501040800.1542805-13-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240501040800.1542805-13-mr.nuke.me@gmail.com>

On Tue, Apr 30, 2024 at 11:07:54PM -0500, Alexandru Gagniuc wrote:
> IPQ9574 has PCIe controllers which are almost identical to IPQ6018.
> The difference is that the "iface" clock is replaced by the "snoc",
> and "anoc". The "sleep" reset is replaced by an "aux" reset.
> Document these differences along with the compatible string.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pci/qcom,pcie.yaml    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> index cf9a6910b542..ac6d2b1b8702 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,pcie-ipq8064-v2
>            - qcom,pcie-ipq8074
>            - qcom,pcie-ipq8074-gen3
> +          - qcom,pcie-ipq9574
>            - qcom,pcie-msm8996
>            - qcom,pcie-qcs404
>            - qcom,pcie-sdm845
> @@ -161,6 +162,7 @@ allOf:
>              enum:
>                - qcom,pcie-ipq6018
>                - qcom,pcie-ipq8074-gen3
> +              - qcom,pcie-ipq9574
>      then:
>        properties:
>          reg:
> @@ -397,6 +399,39 @@ allOf:
>              - const: axi_m_sticky # AXI Master Sticky reset
>              - const: axi_s_sticky # AXI Slave Sticky reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,pcie-ipq9574
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4

There are 6 clocks defined for this platform but binding just requires 4?

- Mani

> +        clock-names:
> +          items:
> +            - const: axi_m # AXI Master clock
> +            - const: axi_s # AXI Slave clock
> +            - const: axi_bridge # AXI bridge clock
> +            - const: anoc
> +            - const: snoc
> +            - const: rchng
> +        resets:
> +          minItems: 8
> +          maxItems: 8
> +        reset-names:
> +          items:
> +            - const: pipe # PIPE reset
> +            - const: aux # AUX reset
> +            - const: sticky # Core Sticky reset
> +            - const: axi_m # AXI Master reset
> +            - const: axi_s # AXI Slave reset
> +            - const: axi_s_sticky # AXI Slave Sticky reset
> +            - const: axi_m_sticky # AXI Master Sticky reset
> +            - const: ahb # AHB Reset
> +
>    - if:
>        properties:
>          compatible:
> @@ -507,6 +542,7 @@ allOf:
>                  - qcom,pcie-ipq8064v2
>                  - qcom,pcie-ipq8074
>                  - qcom,pcie-ipq8074-gen3
> +                - qcom,pcie-ipq9574
>                  - qcom,pcie-qcs404
>      then:
>        required:
> @@ -566,6 +602,7 @@ allOf:
>                - qcom,pcie-ipq8064-v2
>                - qcom,pcie-ipq8074
>                - qcom,pcie-ipq8074-gen3
> +              - qcom,pcie-ipq9574
>                - qcom,pcie-qcs404
>      then:
>        properties:
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

