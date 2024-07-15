Return-Path: <linux-arm-msm+bounces-26246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE9931B7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 22:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B81F1C21C2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 20:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B1813A40F;
	Mon, 15 Jul 2024 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cYSBhLaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CA2139CF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721074023; cv=none; b=FhqsHxt7K41QQY5a6OkErnsUelCW7zNPp6O+wvoXoaJdVXkOejEBvUOWKQkKZXNelXZkWv+BgwqH19udfxJGOvztqFmMQHcVMmPFu0hF+PQDonxuzZjZ2NIf8U2Nn+NTQjV7Q7JGMjNOEmX3vq12wNTJPhFX4XRKN7L5BeCaWpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721074023; c=relaxed/simple;
	bh=mH7ml5XGw2UfHBEbiu0tHBp3fgyAwGNogLpfYZhJvPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pb5U02NG4mMYv5EJWXG2CmTt3JN/JgNVB88aYkJ9GyjPAJojdV/xTugfMiUVKAVxdoekQ+gQQIbiiuzDIpVvFOlKQnXr6wT8lSZH07BjrljbdgzJiH/2JGmTvcRX6+oA3MYF1xBnaTRcD9dhZLG0HhIo4iyF891J34d34noG+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cYSBhLaV; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a77af4cd570so285978966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721074020; x=1721678820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9soHTPXjOtOjNo3NVk4k5D9hNCH3BU8X8ODig3zB3M=;
        b=cYSBhLaVIt07hepflzqgN1S856+IluhRFdbOudoI7XtRBaUw74zpovtEUYgNY+3I4G
         hPVHcsfR5+7NfTIIKUCuc5HbRkFH5OgFxKnXkbQKC8wAgMog14GXCXe0nA8ZezGTH67i
         wooCoYFOPJCOjOiWRYKfTO0RtWsAT9Q0CCnBfXfnhJ4colJfgCLiKRyIfrB5wVfO2OsF
         qG+ONbn0gjrnddonKTXO6yWc/EmEzxezaIuFcunz5EQdjMjaOHiF7ZwKEj12Ytw5QBc9
         Xm/opjauHK60hi471uBZJrqCipdGQGP+ASlXQj66HEL73iTzD2oyrM5xkTetnCMwogWy
         vgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721074020; x=1721678820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9soHTPXjOtOjNo3NVk4k5D9hNCH3BU8X8ODig3zB3M=;
        b=wEEqvOboASfeabnrbTyJL17HM+JJQG7D2XB9pzj5sQGhxjgzj2rMuvxTCDl0MOzJ/6
         F/V2gwK4QPnfrQlSbHI1xdoAUv53w2HbrvcHqxk09PUnh+wjFClmQzvTJB7kdBTUaWms
         /kwQUwCGRgXQL3qbNvJYI/k9GBfuINRvHdMP8ZN1SN6nwIInwGC10f41vjCUWFmxaw5W
         TEiLYEmosXg8kFfOxMHMtMpRDwJdZYakzSPEBm4H0upk3mIu5ImPmmwxDG5t3/SOZYVZ
         Rn5VpPgbpmB0ebCYvOu5ldEBfWuK3hszF6vCO9tIa0rLnSOcvn6RddyMHKWo+AhTtdrr
         F3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUMNjuecxJ99LuN9A6CS0ocVQ/eCu3JzmhEOz5JEA8b1QQe1b06cSlxm9chcjG7+W37tYdycQwcFnHIvpfm0xV8RIdFiGWjy6SNmoUIbg==
X-Gm-Message-State: AOJu0Yx6wRHN9Fg/iDAJSyzBwq0qOuGU1PvJyoM0CxYKeCuXaZUQTCpb
	xsA0vxpp3mye70Z/dKermqKeHx8LSWDlTlr6C7OSR3mm6lny8LBPrifgHASQ76w=
X-Google-Smtp-Source: AGHT+IEqbGCM4EjhL+6laJrvI85EF55lREcmibdMwft25Oug0lVasuFnlZetaOmh32YGl4sHrMz5Xw==
X-Received: by 2002:a50:cd93:0:b0:57c:5d4a:4122 with SMTP id 4fb4d7f45d1cf-59e97ddb9afmr812759a12.9.1721074020215;
        Mon, 15 Jul 2024 13:07:00 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b268a293csm3754495a12.67.2024.07.15.13.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 13:06:59 -0700 (PDT)
Message-ID: <f1f6501c-8562-4f1a-a598-4ab58c7f44e2@linaro.org>
Date: Mon, 15 Jul 2024 22:06:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] PCI: qcom: Simulate PCIe hotplug using 'global'
 interrupt
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
 <20240715-pci-qcom-hotplug-v1-13-5f3765cc873a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240715-pci-qcom-hotplug-v1-13-5f3765cc873a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 7:33 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Historically, Qcom PCIe RC controllers lack standard hotplug support. So
> when an endpoint is attached to the SoC, users have to rescan the bus
> manually to enumerate the device. But this can be avoided by simulating the
> PCIe hotplug using Qcom specific way.
> 
> Qcom PCIe RC controllers are capable of generating the 'global' SPI
> interrupt to the host CPUs. The device driver can use this event to
> identify events such as PCIe link specific events, safety events etc...
> 
> One such event is the PCIe Link up event generated when an endpoint is
> detected on the bus and the Link is 'up'. This event can be used to
> simulate the PCIe hotplug in the Qcom SoCs.
> 
> So add support for capturing the PCIe Link up event using the 'global'
> interrupt in the driver. Once the Link up event is received, the bus
> underneath the host bridge is scanned to enumerate PCIe endpoint devices,
> thus simulating hotplug.
> 
> All of the Qcom SoCs have only one rootport per controller instance. So
> only a single 'Link up' event is generated for the PCIe controller.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

