Return-Path: <linux-arm-msm+bounces-26241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA60931B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 22:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DDA1F21D40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 20:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1C855E48;
	Mon, 15 Jul 2024 20:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fkvrrtmj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B0EEC3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721073743; cv=none; b=T2hKWLrJ6IG9Bv/3z0XNl/2Zn6EdmzxfcbFs8RMV6sD8h3T3k0OPZZ3UT9AO2k/K24fUxjJe5kQMTzJBVnWecCtIxxZExFVhIMM+WY1+ZwoQDtioBLgfqsFAtkJrzo8kdUCptTMaO+BDKAUGJMwyumrLhLWUZADigLCF/Dn/AYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721073743; c=relaxed/simple;
	bh=l8QEKEBGkXU3aatakhtQbocu+dNx/FRPfEVrnCIEO/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbTkCnocWOZ0EfMb1MXhsdUN5I/EOnUc5mVxZWBSjt2yutB9U7SoRhAeFEYMIcZ63MvpiSfzuCm5dOAfT9HziH/DzkQXSeCGqaajpWEWhK4qH8JRh8cNfwslrnWPLbefUmM80TMOQhXTx6mQmgKTT11BAm8Jq08bGhHjLcWuQ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fkvrrtmj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so4891536e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721073740; x=1721678540; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0bV+bWr5KZmcolLmKdTGnq6+GLJHuOudG8E7Yah/uQ8=;
        b=FkvrrtmjBxdFxungCd6WxRBTnJylazBN4x3xhc/zZ8hbGxythXuh2HTfzYcpL8hGw8
         qHA8zasR1EykwYXtPQbNDE6xGJHDVMopbmZmG6uR34jBVkB1CIfqFf028quGcHb54YwK
         EbO6gsbwXV+bxpPP7J0qq69g6WbwNqPw0s/2DFgjj/jGA7psPmpZTABfOu/NgkDNEIsC
         isC4/+gisfeWo80BTvyGelYpUDtrT/POP2/uHpCSTVKVavUZypfb4DnZEtEVvYPfyurw
         aUvPMVQ2wi8GNsFjXzRT9Oq6pXS6sFDLYC7Bvy8KttTMiN1DzVmn2H+WORcR50vN2PIU
         zhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721073740; x=1721678540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bV+bWr5KZmcolLmKdTGnq6+GLJHuOudG8E7Yah/uQ8=;
        b=Qn2iSMGNGammpr7dAlEQb8VLFjo4mGpKtA0flUKNI6O9nFykO3ePO7X21GKaf5lOmD
         ZiZFJ+EEqbvP0VM5obMq4scuZZqdjfmqscRvwTzqoOLZ89oVj6WEnXrP/RgRkig+DER6
         /Teb6sbOZ+CptsXDcG8il+SkCoxcas14Zt2tGfy4RQY6hZiaIP63W7UcU/Lsf0t22rze
         MQe2gdUSC7k2CnVXurW+LihJwzDE06JreauPZcgCqHJy/C4AvskU/w2YjwHceEqn5PKj
         xrx/wspCYFeHy3biQ96nz6rHU6Qvw9u4BoTbs7Pdh/JmXnMvsWKiLuAXsD6+e2XEWrb9
         xTGA==
X-Forwarded-Encrypted: i=1; AJvYcCUPlPEXrxgdI56tEr3au4TO63tt+wWYvyyme3q6ruWjkNUwzVFsjXSInYH/9daBcCDd4IyBHcuYNfh4YN/h959Tvfm7ZlP1fdssy4EYrg==
X-Gm-Message-State: AOJu0YxXhjNIB/VTOO0iwfSNwnvZZxZPSDDYpW7hsffom1WOin3QMW8L
	kR/FJ9lLfqW9DQ5AzYyXMji/bkha5H3IMX8I/dnr+aZU08MQBebH655eIb75WZ8=
X-Google-Smtp-Source: AGHT+IHCpiDTtG5pfOo+qj7f9Q6cGLkXgu3pRLUS1758KZ4ae+RvTNX1khU+YNKEI2dFUAd3xEmDRw==
X-Received: by 2002:a05:6512:3ca6:b0:52e:7f87:4e66 with SMTP id 2adb3069b0e04-52ede1c7bcfmr407406e87.49.1721073740073;
        Mon, 15 Jul 2024 13:02:20 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc820d68sm231212766b.190.2024.07.15.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 13:02:19 -0700 (PDT)
Message-ID: <5ea6d478-f2da-4b68-8987-79cc5dfb8c86@linaro.org>
Date: Mon, 15 Jul 2024 22:02:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] PCI: endpoint: Assign PCI domain number for
 endpoint controllers
To: manivannan.sadhasivam@linaro.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-6-5f3765cc873a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240715-pci-qcom-hotplug-v1-6-5f3765cc873a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 7:33 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Right now, PCI endpoint subsystem doesn't assign PCI domain number for the
> PCI endpoint controllers. But this domain number could be useful to the EPC
> drivers to uniquely identify each controller based on the hardware instance
> when there are multiple ones present in an SoC (even multiple RC/EP).
> 
> So let's make use of the existing pci_bus_find_domain_nr() API to allocate
> domain numbers based on either Devicetree (linux,pci-domain) property or
> dynamic domain number allocation scheme.
> 
> It should be noted that the domain number allocated by this API will be
> based on both RC and EP controllers in a SoC. If the 'linux,pci-domain' DT
> property is present, then the domain number represents the actual hardware
> instance of the PCI endpoint controller. If not, then the domain number
> will be allocated based on the PCI EP/RC controller probe order.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

The PCI counterpart does some error checking and requires
CONFIG_PCI_DOMAINS_GENERIC. Is that something that needs to be taken
care of here as well?

Konrad

