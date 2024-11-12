Return-Path: <linux-arm-msm+bounces-37595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F749C5661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27E23B47202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB8A1FA850;
	Tue, 12 Nov 2024 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKXbmio+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B21FA830;
	Tue, 12 Nov 2024 11:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731409452; cv=none; b=kp8AexM6u3SYSOFIgNXwxJbaE7Z/mo1Ce5mMdnHRrHBUYVDmwQleIugjKa0SCS1NwW5f/cY5RW91ErGUSARH6cA679bGuM35eDMEROZN8S69CcQXk1JaTnPaKsBdTWFIaLNXgBpTNXc8h4vm3yJeX7URstQRV0UCXuIcqZT0hS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731409452; c=relaxed/simple;
	bh=mR2RnXl+Nunu9ql5NbB2XqMav8cXQhs7d4rGbOJX2c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EijrB9YSKS1IgkqT88YW59CGpMxDjG0/FFhqqXxBnJ66rWShTQHcFOmPHXEJtPOmg5+z2xECDdaiAZgG/BGFd3zxpVktIMampxceuItPBTPvlRVNi7AVpVmO2AhhSFap5QT5Pl5PVm2v8sEte4yGz4GALvQbF4EZcRajIzeP7/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKXbmio+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so8155123a12.0;
        Tue, 12 Nov 2024 03:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731409449; x=1732014249; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xXivvMQJAGQn5kG8ei4QlOJXIxILixHe6nKKSfAb6ds=;
        b=aKXbmio+W5xiHHg8JNNBwbT+zrQqRDO6S+1ZmVTXIwG16NHGIWRaItfvg/3lQO/iL3
         jJWn2vscx/PkctO4xP7VhiKx0iSLdw9wUvqiErE4tePnRFQakxlmaFKnD1WSY7Tl1Wer
         TKL3K+22wdCl02Ij1VvpHaUiFQc6WiGMnp+WxwcqkxJWuNh005jPDUAy0MxgvYb6etS0
         4oEs7IjrbrXMzVLXQfpFrkxeKDSVGHTNmwqBcbQeXoEySVC38AftsALoIk7tUlgQ47AI
         DGskhPYxG7L9uk2VUJnnpse2MQeIouURDr2arYdxTx0RCTy6awrsu/7FTaMMET5LfdIe
         0c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731409449; x=1732014249;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xXivvMQJAGQn5kG8ei4QlOJXIxILixHe6nKKSfAb6ds=;
        b=wobHb38ZAWKOElf8cJx8Y3nxbZVc3/AcplmxGSQjrxMmgq7a6czVloj/DolcE7tkqG
         3F4sn7aNM9vpFZ/zllif2ZllqHJ7GLsFQeexg4seYJq29xstFR575MXA0kNAStFdoi+P
         6VQIg060En8jnCoK7iNr3kqk5daRnE4faZDLBVy6xpTATSwCRcrdvlhex7388m3tHsNq
         +EwFYu3bjcy6ppZcEYzqqzU6z09i33IoaLFBctbcgD0rXyN4HYVqmJJ7QKs5hf+JXK/b
         JErTg0RQq6VG0t15RzDYWtB02zoERYZwFCjAWr97YktFL1KOjSd0Bx6NKbE0Zwul64ed
         dKhA==
X-Forwarded-Encrypted: i=1; AJvYcCWBolksG0qocZHWirORcExYcqOzm8vi57eRp1tgp2WP9I3jk9Rz468asp6zdwa6K06S6yOQP2o5xBug@vger.kernel.org, AJvYcCXSn5hCD/BXtrVmo2JuZbfMoQoRCwyxZ70lusHaftyVn4F9ybinEmBT6pT59ZjeSo8he2fB2/gRNpP1Xnc57g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6dbCrPMJhKfs7jMwO2aOKaLVkzQJ7pzCWvd1cboT7rrpVLMjC
	yizdCOa4x8hYDm/qIM/UjrLlv8e2QcKpmr2gf/cgUlRP34IKUYRm
X-Google-Smtp-Source: AGHT+IFko1toNPwxCCNTAHzW0XJ88m1ibrKMKSxiEsot6Few53JeQktfa+mjFxgQXXuYTfyeqDMffw==
X-Received: by 2002:a17:907:2ce3:b0:a9a:1778:7024 with SMTP id a640c23a62f3a-a9eefee9c40mr1530837466b.20.1731409448439;
        Tue, 12 Nov 2024 03:04:08 -0800 (PST)
Received: from ?IPV6:2a00:f41:cf4:1aa4:f628:29b4:ebbb:4aa2? ([2a00:f41:cf4:1aa4:f628:29b4:ebbb:4aa2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4a9b1sm702439866b.52.2024.11.12.03.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 03:04:07 -0800 (PST)
Message-ID: <dbd8ae86-03a5-4b33-b774-846788bf8b89@gmail.com>
Date: Tue, 12 Nov 2024 12:04:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
 <20241105164946.2357821-2-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
Autocrypt: addr=konradybcio@gmail.com; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20241105164946.2357821-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/24 17:49, Krishna Kurapati wrote:
> Add support for USB controllers on QCS8300. The second
> controller is only High Speed capable.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---

[...]

(the PHYs look good)

> +		usb_1: usb@a6f8800 {
> +			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
> +			reg = <0x0 0x0a6f8800 0x0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;

Please match the property style with x1e80100.dtsi's dwc3 node

[...]

> +
> +			usb_2_dwc3: usb@a400000 {
> +				compatible = "snps,dwc3";
> +				reg = <0x0 0x0a400000 0x0 0xe000>;
> +				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x20 0x0>;
> +				phys = <&usb_2_hsphy>;
> +				phy-names = "usb2-phy";
> +				snps,dis-u1-entry-quirk;
> +				snps,dis-u2-entry-quirk;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_u3_susphy_quirk;
> +				snps,dis_enblslpm_quirk;

maximum-speed = "high-speed"

Konrad

