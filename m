Return-Path: <linux-arm-msm+bounces-14860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFA3886FBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 16:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B283E1C22026
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 15:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAD754FB7;
	Fri, 22 Mar 2024 15:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsnn1yXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEF54BFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 15:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711121006; cv=none; b=Dec8qzZkcLpfbHdpEZWIYCU2/JJ8ZyYm/aXl2hKTpGhj2WKkAvIH7CmON2910vu0HwpMe0TQwtmvlarZDQnMagOOuVK7nG7xESK+U6pMpPzycA/yvh5BHUdNoo+c1TQ1lmEh4MqxOhDHG6yi7qJzm9WIuRarQ9EQ25Qn0sF17CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711121006; c=relaxed/simple;
	bh=Jh9QoSpAh1VJIpxGig8oTblYGq/+BHwEt/Vp0lSS23E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLPX32bXhCQX14EQcjTiKd83cKRSN0Z/r921jwsgkh3/lBlmfhZE7D0AKo0DQ+xpFKAQxqneCDddbTs/Ri9FeZR+OmIqT7PqWX+iNlO4yO2FBgI4DR/v72rvcEvRsfVRKzXQnBlg/ZURMGSkGwFrVD8CdMIGSJ1uZSAXdgva++w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qsnn1yXW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33edbc5932bso1251440f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711121003; x=1711725803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xH+tLDeMl99Xl0L3QKJ15jBZOcEoqwwXUzAeFBXfobY=;
        b=qsnn1yXW8LdqXh4iwvKIexEj6btk6YM1YV6p5gVHnL/mnupx2gW2u/NRIX1SB5mTp3
         wwdIELhghDdDWtBDP+ud2NnjwHwJ+4p82zk5MUuXrXh2jNYbDOJnRhNHB8MzZ8+EgNhf
         z12pSygmnuARXarXJvGgKlud8WQHRouHU3caeIqstB3UbbbxXbW7lapN6mFnpwtw+0bO
         mEhc+hvQsz7bPdTmxGhcGWeiin2bp5KcWsxV4wfE9XLajeelpb6c1BDg7yHbS00D4tAW
         HJT1uB/8k5rNcfeilhft+0UHLs+8lEl7df+hCkjFsqvRU5OkHpuONnCf7g8ep7pJXHZv
         HT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711121003; x=1711725803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xH+tLDeMl99Xl0L3QKJ15jBZOcEoqwwXUzAeFBXfobY=;
        b=FmquEV1kCLPap3GWmZa8jntcJg+tk8sKredwArUKeJoF1g8DMaeMEIGkOg1C4RVUlJ
         dVbNwDWs4aPA/Q6tNSwM56OnfzqlNTQ7ZD7PA7fhswSWq18RonbMsC5rSasvSYq/SW39
         AfeocqV/0gaNInBgV00lkJIB2hmsLEq2R50M1AcO/GGwp+VO7yJJzXampLeFatyYHvNu
         9ahlhke9y+GcZVCCc7/RvkVM7K4d2bWYUART5qaSdUoLcTjUFebLj/23RtoLbTcCFxwZ
         V9V51W/SM482DeObSUay0AvMZMd+4gYfaEFEsDXWourLgDQyjGXAFTqXBKtc0ky5bb/S
         GbkA==
X-Forwarded-Encrypted: i=1; AJvYcCVjZA9bTLSxVH1mb1RF0e+PhyjC3zydG3wDKEFsOcrNewCGxskeM0fDPxj/MW9iMIm5iZTulij0zQrithWzymeIk7kpK3T/SbUE7aDznQ==
X-Gm-Message-State: AOJu0YyX0p7pl/83leMIHjugBHDzUpzptjq+hezP/6Xz9Qhgkwibz+eh
	eZfMLKF0dj4wAJIh0nBdIbjglTVbcmOf4CeKVE7YqWF1Kp59IlT//60y1fWcy58=
X-Google-Smtp-Source: AGHT+IFq6peRNoTIZX+OTTQQf2b0W2SgKQJH3FoqXVgRL6cjwP/nlcEPgUeLLcilEgXGe1cpMzVILg==
X-Received: by 2002:adf:e603:0:b0:341:b5ca:8f88 with SMTP id p3-20020adfe603000000b00341b5ca8f88mr1503198wrm.48.1711121002762;
        Fri, 22 Mar 2024 08:23:22 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id t17-20020a0560001a5100b0033dd2c3131fsm2282603wry.65.2024.03.22.08.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 08:23:22 -0700 (PDT)
Message-ID: <0b091595-1587-421d-bb00-c00ef729d143@linaro.org>
Date: Fri, 22 Mar 2024 15:23:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port
 description
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org>
 <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
 <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
 <5ea4a187-1971-4970-a289-826d96c0351a@linaro.org>
 <c0f1e898-7638-4b7b-a938-9e31e5b57e57@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c0f1e898-7638-4b7b-a938-9e31e5b57e57@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 15:09, neil.armstrong@linaro.org wrote:
>> TBH I think we should drop this HS, SS stuff from the connector 
>> definition - there's nothing to say in a h/w definition anywhere HS 
>> must be a port or indeed SS - not all hardware knows or cares about 
>> different HS/SS signalling.
> 
> It matches the USB-C connector electrical characteristics, which by spec 
> has, at least:
> - High-Speed USB Line
> - up to 4 differential high-speed lanes that can be switched to DP, USB2 
> or PCIe
> - SideBand line (SBU)
> 
> And those 3 components can be handled by 3 different HW in the SoC, so 
> each one has a dedicated port.
> 
> Remember DT describes the HW, not the SW implementation.
> 
> Neil

Yes, you're right about that.

I suppose

1. Orientation switches should be defined as coming from a port on the
    connector associated with the CC pins.
    port@3:
    orientation-switch port name goes here

2. Data-role switches...
    Again the CC pins

https://community.silabs.com/s/article/what-s-the-role-of-cc-pin-in-type-c-solution?language=en_US

Maybe the right-thing-to-do is to add another port for the CC pins - 
which would still describe the hardware characteristics but would 
_accurately_ name the thing which does the data-role/orientation switching

CC1/CC2

Then we would not be abusing HS/SS/SBU for the port names - we'd be 
extending the connector definition but also naming the ports/endpoints 
appropriately associated with the data over the hw

---
bod

