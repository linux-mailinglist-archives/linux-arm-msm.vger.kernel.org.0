Return-Path: <linux-arm-msm+bounces-48849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0718A3F129
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58B2E1894B89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252951E5B78;
	Fri, 21 Feb 2025 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ll+/2cuY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF520469D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131857; cv=none; b=dByNmktKd7RBXuo1QqVBFCeXOQ6+DWOq17BAAc5m+o69HabaOq6Za9WzDF8LteaQ6TmUnWLcXKdrYp2rGr+cIVVibD5W1PeHKJMMTpDdJBym/0KxAtcR+o1QB/igw74vLlm8cpNA/k/nyV0spMMjF9Boewx1EbEt+IIVQFU20SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131857; c=relaxed/simple;
	bh=awRrQG8My2jPkSTLVXCSEmn4cnN81ZIxkT+0wrUaW+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkPfkpFUlZJCmrE/WMmFPWZzZOiARa67RhJpMYzfqL0RW0EaLbZkz1EZzH6EHXGp+gojftVDPCLA2DVY/1KLUb1NGMl23BR8J2rAdhaChkp7lDGqc5V2eaB+ApjSmmmjUw7dm7PWRT9cGyMHvLZ0OHdNmphZKqaFMbRtDp0mpuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ll+/2cuY; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso327553a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740131852; x=1740736652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqkMt33aIVzf/RYUp5sQ7i66jsblVvCNxT/7o/SCfHc=;
        b=ll+/2cuYw5QyQN5q6BjzH4d4nzVXiSsvkYyelgGzEigXY8PWfOV83BQnevGQnXHp3s
         A3OXcyovMXowHaYfFgKpbxgJ0MvKgI3LYstdj1pLgwbn4Bfo8tAOtx3NFpz0r2drbLo0
         0/rWfkUOBPpk/fRBgAcY1j7Sx33RUk50CnyUFLbOwqJAh/BWs1p5kkFWzoXsMHQwLvXg
         lWMHnY4ZLe+ll1uQCKmzXLNpNCfjhEKadGDh0GPI2z2/iamVBS3V347a5mFKO3WEPkCR
         sD4YR9IwFwgbNLyZMddMRLV0gkoUSdPfgB2SzefPxvQjwuJa76JRriAmf2W+5MfvXDTN
         zjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131852; x=1740736652;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqkMt33aIVzf/RYUp5sQ7i66jsblVvCNxT/7o/SCfHc=;
        b=dgrI9wU7mPpqwAXSQpND5mtiYsDwXONcJOjlVNYzGRcFBDfQU/1k3p0sFHE/HeYslb
         c10Dg+z11NlExvAH8utDjteraUQUhIiHnUsoZ/2C1tLaG3OZ9ky61Mdo9OWoQyvfJAOu
         8++/3W+lvN5OXWbLaEUW+gski0+TOUVnS87niNatpyhlaUxR07en9PQYF1LgO+eog8RO
         SYYcc/otDKaOzxsUv0cf2xdghJdLIbINr1hud7+GXwRJyIZKUpPAkURr6JAbB3jg+IF5
         NmI21zBm5u9GPKoi31sXunXbROpKNEs+0gUb4gN4U8AFAwdaWC43OW6ojlZvMhiaTkFI
         QvnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzf72KtnO00V0v86Cz2e16dAJ4CG8ieDyQjv0Ev4X6wC+vVWCJ8qji9APztd8aGT/QnEpLyzpJifx3Xee8@vger.kernel.org
X-Gm-Message-State: AOJu0YxHwhbvleQfFZKREbNuy8EY6FZ0Ph9s9v/QVWqALdxO2HjwR0i4
	XSOC8ZUy1xFopL2s1ta4BTrbZtA5uq6gTnShggnxqnHCCi67d+nwYVjpdYAIER8=
X-Gm-Gg: ASbGncukeIVgdEwIyH0CYjCJwISbK1sfxjNq9jYW90Dg2lPFyiBwKrcZQa1d7UsZcJQ
	6YwU+rL+1QDXucu9a5VxciqwP+c3bx/nyWW8ZoBXjRQrjIIxevyCkh84vAJem2gQbtP4PTXKdyH
	qzJs6srXjVwwQ4WSD4vljpYcH9jwLrAvT72RhpYJ3yWsrW/mIn1+hgLor/RTULrIoj6VAso0X2I
	uHMbPrv1waDYXDfB3ZuCFuI0mCBhrFsAnHzmuEx6XZ8uTtZRpiJnm4ed+mVoiXtcAYwHkY+q3L9
	foMEaJQv8WT7PDuMb2H6YeXSE+J6Uj6oAaniV1Ru6xeB6nIj4h1TQrFM3cTB5sTmransHCGaBLz
	U0Smc
X-Google-Smtp-Source: AGHT+IGIZHDigZqENXwGcceTFgMb1ySsKzxAP+ch/y6jbGNwougXaHtLskU7bRrP43X1lCZ5wZa+Pg==
X-Received: by 2002:a05:6402:4406:b0:5e0:803c:2440 with SMTP id 4fb4d7f45d1cf-5e0b72311b3mr774032a12.8.1740131852097;
        Fri, 21 Feb 2025 01:57:32 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d367dsm13706646a12.44.2025.02.21.01.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 01:57:31 -0800 (PST)
Message-ID: <4fd7bb26-f182-4030-8e03-b8973d0596a6@linaro.org>
Date: Fri, 21 Feb 2025 10:57:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: PCI: qcom-ep: describe optional IOMMU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250221-sar2130p-pci-v2-0-cc87590ffbeb@linaro.org>
 <20250221-sar2130p-pci-v2-1-cc87590ffbeb@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250221-sar2130p-pci-v2-1-cc87590ffbeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 04:06, Dmitry Baryshkov wrote:
> Some of Qualcomm platforms have an IOMMU unit between the PCIe IP and
> DDR. Changethe schema in order to allow specifying the IOMMU.


Missing space - "Change the"

> 
> Fixes: 9d3d5e75f31c ("dt-bindings: PCI: qcom-ep: Add support for SA8775P SoC")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index 1226ee5d08d1ae909b07b0d78014618c4c74e9a8..800accdf5947e7178ad80f0759cf53111be1a814 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -75,6 +75,9 @@ properties:
>        - const: doorbell
>        - const: dma
>  
> +  iommus:
> +    maxItems: 1
> +
>    reset-gpios:
>      description: GPIO used as PERST# input signal
>      maxItems: 1
> @@ -233,6 +236,20 @@ allOf:
>            minItems: 3
>            maxItems: 3
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sdx55-pcie-ep
> +    then:
> +      properties:
> +        iommus:
> +          false

iommus: false

> +
> +    else:
> +      required:
> +        - iommus


You make it required but commit msg does not explain that. It actually
is quite permissive: "allow specifying". This is ABI break so either
drop required or rephrase commit msg explaining why this has to be
required now.

Best regards,
Krzysztof

