Return-Path: <linux-arm-msm+bounces-48851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFAA3F132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A1AC3B7050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EEF204C25;
	Fri, 21 Feb 2025 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWWD6gwR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C34B20469D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740131939; cv=none; b=FpNxt8RJpHw/bQVWJty5B9F/YLGIAOqp/H/ro7AuvWvnu9uiLh6A6BdtaQT5/fXql2Q3WYy+sI9k4TOqR0wt1nbK5Oz1sUn3gQ9DWQBQrpJX6OvMkkwLTRuskVIJ5M5Xg3B8JaQ8JaCRxYLZ08CFeoxAKiJHlD1fejl/TgvcYrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740131939; c=relaxed/simple;
	bh=YuIlQ4FSUsykqva7/KDtYayb9cKWI6zL2uqU0oUIP/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ht/QDqg/8JgzOOIXkGSYHP9F2cBLtdDiU1ppWHfzPmH18tjHhRYNfvy2jf6oi014zb+xbbjT08+2h/uXrNEYOl8JiO8LHd6MkOz5xyRgfvnh0YLTtyataEOoczU+IvK109lrt5CSjHLXBfDeYhAF71Zias2/1Wzi1fqY7kz9214=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWWD6gwR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dbf5fb2c39so261704a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 01:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740131935; x=1740736735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X5NaHo5EGXrMjeHk5dfs1UJQGgTL4oMCcK6u4bUWk1o=;
        b=uWWD6gwRQo8D8KQtAx0IZJQv3vXfElgAZV9cDzxqk6a1FSniCJnxUGbxcNGThy0e/O
         PovGzTsmtUO60WzP2QkzpBU8jiZMnpJlkZwcQxO65EoQpRFLuIHWTLYeOW/zbKn5/R0J
         VmIOrJvGSJ3aM743ldD8OHkoXyHn/98B6hwV1ESCJ4nwIRi3OukUHaf/t7aETk3rhIZD
         7qyy55N8EcJPIdBwrTZpHf/0kzaJrF7O1P+O8feQP9nW85YXpJ0ygM+RdZtADDfFsLq4
         APZTnBm277Nvh2qWdfKrdAVn8ao/qSeq44qPgwdex21nBf7ha1U71tIbBBDABjN4ALZQ
         PmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740131935; x=1740736735;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5NaHo5EGXrMjeHk5dfs1UJQGgTL4oMCcK6u4bUWk1o=;
        b=Bj+jqBUQsxNgru21uYLQdXSJSB6k5XJpZgKbGNY3jEbU0smon77Kg4z/Tio6SBvAkh
         jw/QJsPlEbCBzhQOU/TukZCfa9xqgZa8tiXIhN+IhIfM2rygUlC6IUwIoFF9wSSwaTmE
         LV6JN7/SrWPPTfrUXIkBvCsp9sAwFvUsJHC9LsLqQM9Ua7rIKicsGGojQon5QadonKYd
         ZmzIZ+a/3zz4X8EvhCcVIpbkg11AbkmNigjRQUiH2Q4q4FNuZ7qBHeaXvxh/nCp8YA1C
         XFDckCIHV/5YV8EEQSPXUc/WfUFMIbZ2rnTW4Y5rftcsvvnPorzEDLruTkPDiTLk3r37
         Juug==
X-Forwarded-Encrypted: i=1; AJvYcCVLj5gnuPczUjR9ZiwcMN8JEOatl68wGTcDnyqm1B5/WgFXKKGYwpuJ6YLZahscRRNXr9kb2mcUzRV5CHUp@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxc8nZH5O2BAkpPzP1sx+1lJUpxGzhAXx4gFnrIsFJwjs0gWA
	XbGILPhh1tbnfarPqveola5+hsN/BcPSf8Qaq0GiD/LwnCg7/60QLmnXMem1uJE=
X-Gm-Gg: ASbGncsvO5ytD0recu6nI5uwz2SLbVG6BGqn1F8QMr4XPr3WyuWxip+rXW3hZOjrEg5
	Mpa6iSP7mH4TLjSOm7jCDjfu3FMm4E/w8Tt79Bg7zliLFVVh32jY3HYGKp/IDDrL2wZZDSIblVz
	YwVTexSL1jWwCkNoxdK0kK93nh6LIepjtQgGKmMpp5fL3DW7KRMtG1vsMILnusg6e7JD9FNQe5X
	Gxhs87SgYjnd6VxyKUbmrgXS9f9WxBrwbblLLUJDMKv3dTmbgHtr5BSq+Kh5rNAbh5VXkjPlBLr
	M5OQmilyeP/nok4G0fkroqO+8CYCnBFwciDQTuOYAHMuQa74/ncOC/X/04ak9gWegA/sF/fakai
	uPy2d
X-Google-Smtp-Source: AGHT+IH/jPcEXsTcUEO3S5ZRJCoxgr23gJr0jVwm7pPoLBr4B+Q02zJNZ+yi3eFr45tSAzoMtmobCQ==
X-Received: by 2002:a05:6402:5215:b0:5dc:7fbe:72f1 with SMTP id 4fb4d7f45d1cf-5e0b70c37b1mr796416a12.2.1740131935317;
        Fri, 21 Feb 2025 01:58:55 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece286861sm13221502a12.67.2025.02.21.01.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 01:58:54 -0800 (PST)
Message-ID: <54d61a13-3198-4bcf-a771-523c905d0740@linaro.org>
Date: Fri, 21 Feb 2025 10:58:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: PCI: qcom-ep: enable DMA for SM8450
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
 <20250221-sar2130p-pci-v2-2-cc87590ffbeb@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250221-sar2130p-pci-v2-2-cc87590ffbeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 04:06, Dmitry Baryshkov wrote:
> Qualcomm SM8450 platform can (and should) be using DMA for the PCIe EP
> transfers. Extend the MMIO regions and interrupts in order to acommodate
> for the DMA resources. Upstream DT doesn't provide support for the EP
> mode of the PCIe controller, so while this is an ABI break, it doesn't
> break any of the supported platforms.
> 
> Fixes: 63e445b746aa ("dt-bindings: PCI: qcom-ep: Add support for SM8450 SoC")
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> index 800accdf5947e7178ad80f0759cf53111be1a814..460191fc4ff1b64206bce89e15ce38e59c112ba6 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
> @@ -173,9 +173,9 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 6

You need minItems here and in all other places (also interrupts).



Best regards,
Krzysztof

