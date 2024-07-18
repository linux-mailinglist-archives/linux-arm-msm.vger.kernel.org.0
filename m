Return-Path: <linux-arm-msm+bounces-26557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20736934CFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 992BF1F22EC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD0813C3CA;
	Thu, 18 Jul 2024 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCH/BBnM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97813B78F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 12:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304766; cv=none; b=s7RwkxIObwU68smNRnITDeKvQIaTK8zA4ldMoQNCvmR7I0L82dahtio0pbayByocovAUYSm9N6JaP1UaxelkSy+PcLhiSm1ORQl18BSeM2IIXow9PNJmg/9VP4IgbyJVXcSCJ97kE9Jt91TrC8oBE/NNaN0on1+LQNDDbqITlWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304766; c=relaxed/simple;
	bh=lDk/OFM9GdPyF5mO3TlS15U51RwuYwspDnGe9beFFBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tAKxkeTY0kVnCfUEWKv9uIUspiyyltUWgmvy4OCtVdOG7NQyx2umht7zuCJLlbR2Bg5mVDJmSpd6hwSgynD7EnIEkDRSAz3mjZUefAQ/FKLAsfE7qQ0CcF/X75vv53pw4Ql3Q8g1QOnHNAOv7UpkGk6FZAcIouN2GPo/9rYzjnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCH/BBnM; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a20de39cfbso451844a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721304763; x=1721909563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zU1bn+cQnLCjdK9wTnZiKvOPZWaExGinaKV5vKvZYpY=;
        b=tCH/BBnMTu8CG3Gxs5kcYA3zXyCbKxQYHAxqy1GvR4ONT8pi/L+aitwJqnF520xrak
         HRtSiCC0nGNkSrqw9+yx8Zm6kA9qlEschgYKC/UZWNYcNKHaO8JifGJhKdvjNNfsx8e3
         X52tcsczT4+V5KYr3UZcFBiSxiTxQJxHGUxolhBpE/3wZmnY5G6JSn7BH8AGOUSvlgns
         c/16o7S/Tg0HjwlTPDDfsL74WSNBTr0fj5rQpuAaN5a47zr3qxLIkwWzN52rIQQhmWml
         jK4pM1VymsWYrlh7pA/7No2kc2osE+Ag8IUB8pElBWcOj5k9dm8NTheFFDNlcqlpIaiv
         BakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721304763; x=1721909563;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU1bn+cQnLCjdK9wTnZiKvOPZWaExGinaKV5vKvZYpY=;
        b=fnPl5X6cKSpegm0f0BPQFZaynJxp0uxw5MutLmehnZhSAOmLRn6dP9bU5+KTdUOHs3
         gEmD36l0xzJanyBvKcJRd2yw7FWZNjCOJVLGVuI1EaWk79yFT6lAhi6qNqqFcutEUjAB
         ibRFs17tRpSu+CAuZP6lkbH8p3PKvDRD8G2pxn2JbEVCxpNwQM8L0FuROrAYulmaFRY7
         WHPHrRVhzDEPqNA7zJT8umqNxVbNNqsIwpMVquNaQQSfet6hiTVfakV2vDCjxVt/G1i8
         RaDh5LW0iP5B71Zi64UXHEppxHcWj+ZM7ErrFEfOgV20/R8gHXDeRl6IJizAl1X9gHS3
         0YEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUWLpZ0SQFOmWiy1NNZmpqEJjoCsUTQe9d/OJiHERSi8w87qlqWO/jPR5v/maZyh74LLHVEnGJWtuapq5xhmq/k/vv/A2NLoaE44/L2A==
X-Gm-Message-State: AOJu0YzrrephmB11EQmkXPcfF+/E6k6dbZX5OB0Qd5FJ7AzWEkRN9on9
	HYZ9Hn4PRw/r+YCUZDwFfdzoJPH1VYleAWuHlAvJAj7JUAT1mbc4eCZpOnbAw3Q=
X-Google-Smtp-Source: AGHT+IHpzAvuicnAr0t0F/QpWfgztRHIDCadRZ2CkWua+qXiqi9HeASkOwId5phE5trHQaIlvHyHqg==
X-Received: by 2002:a05:6402:510f:b0:57c:c166:ba6 with SMTP id 4fb4d7f45d1cf-5a05bfab3c0mr3393413a12.19.1721304762690;
        Thu, 18 Jul 2024 05:12:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a1d9a49e32sm654035a12.29.2024.07.18.05.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:12:42 -0700 (PDT)
Message-ID: <f171ded0-e9db-4bf0-8e1a-e00065becd4e@linaro.org>
Date: Thu, 18 Jul 2024 14:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] PCI: qcom-ep: Modify 'global_irq' and
 'perst_irq' IRQ device names
To: manivannan.sadhasivam@linaro.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240717-pci-qcom-hotplug-v2-0-71d304b817f8@linaro.org>
 <20240717-pci-qcom-hotplug-v2-6-71d304b817f8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240717-pci-qcom-hotplug-v2-6-71d304b817f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 7:03 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Currently, the IRQ device name for both of these IRQs doesn't have Qcom
> specific prefix and PCIe domain number. This causes 2 issues:
> 
> 1. Pollutes the global IRQ namespace since 'global' is a common name.
> 2. When more than one EP controller instance is present in the SoC, naming
> conflict will occur.
> 
> Hence, add 'qcom_pcie_ep_' prefix and PCIe domain number suffix to the IRQ
> names to uniquely identify the IRQs and also to fix the above mentioned
> issues.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

