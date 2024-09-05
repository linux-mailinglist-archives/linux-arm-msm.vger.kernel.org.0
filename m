Return-Path: <linux-arm-msm+bounces-30969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E496DDEE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 17:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2EC1F22916
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1677219F49A;
	Thu,  5 Sep 2024 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGAlNNJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3329D16F839
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 15:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725549655; cv=none; b=AULEIiO7bLlilkD7R5OTAP6Oz77BPCPm1dzhfoaAZp1A/rRNMR2mWrKoxVj49kmAUGl5xyaV0TYbSI89wS88MwWpdu5Y9HyiYGkaRI24TxJzlAAb0zCabylASG8prJvI/B8QMwdj3QM1m/QhG2B/+hS3ho+XRNuyeZNOgsKubN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725549655; c=relaxed/simple;
	bh=07EZ2R2cvNPxkqgvwKm3BBDwp9JFfmM1EZaGxb9jQmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xq8DRaRo+dGeLSeXIbZ9cZHQ3LVXcveJooB/cMYjzfs/c19NsAR+carn8Zuj3BhE26RaI9aI133QK9k4D2njEUrvKjc4uAoWczYir1dTNJxUO7Gc3A4NzusSXu7kFG6tidmqX4VpoBTy49k2G4FaC+lHC1E6zT5Yo27/2vValzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGAlNNJy; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-535be0a9b9bso148857e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725549650; x=1726154450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL4wK+XGBbbQRznJUjfP4Y3RXCynR/eSS+8QDOZLKvg=;
        b=fGAlNNJyBJ1/+pJF8+DNgLSF3tjMhpyegkXn0+/QtWOONPyFt/Nk35pF5i0nvRuVNU
         MXHJkBDzAIoSEO/FT6dbFKQidVIAbMW+UKA5LBPLrj5L6XbjdeRNmXYb1NBUGKaRNFoo
         TuorlYOy1zoh7tLczcfJzD3cquTbXQDpcTnNh6jKI3s1yj1byILZjmhdoXZXOBmbfqvx
         U1iKmM79F4og2Zu8iNVgA/AwVQv4vvWKKvipCjoEv3AHCLI4OBIAwJ3XUYBVX1JEnIXO
         WHwErcWJ36pMppbDtA2Jzoam2TvBtSvYB7SBlsis213z+MuhVA0mOLTxMcTUJoreaoxk
         eRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725549650; x=1726154450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL4wK+XGBbbQRznJUjfP4Y3RXCynR/eSS+8QDOZLKvg=;
        b=Yu9gU++Z4in/BQ+/WIf2k1+dt9CIwOm19yrs4WEb9gM15irprem8hGBaWz21KRlvfT
         nz3iAiNQZWSWm2H1Zx15KPOt0O7WHPIIDz0M5XzXknUWZNftQ9n9oRWjh9MnmWNAmXDz
         2bDMS3vPKAAnx2rbGYogjPGpYWwNohaSN9gMAZ53Gy+2ATrA91ytQXgvxbBTVFW+Lw7u
         DnhtV0Te4ftrjGI8FoTGLM7shM9PlTbAd5t+ZIqcphBmwR9N+PFhYxzsDg31KZqc/zm2
         ZC547IFYfY1MDEpkX8iwEWruhYAkDZaRQmHNIiCvSvGStG7TpO8cEe+5X5eR2GeXUPJw
         keBQ==
X-Gm-Message-State: AOJu0YwtLVCC/Crflsd21bCxFvbeKJz4Zt67xH5t+EXshjk9dLZNR93u
	9c7FFM+AGnZkfs1GK7ARvyeEYxg4xl+Mn9K672V8FJ47vYHOjnKXcThgEaHncRo=
X-Google-Smtp-Source: AGHT+IHcOrCnX5lCAxr8SDKciOEJ578H4NZioD2TasiDK34x6BAeibOAKn1lBxBpfh8Bw5KmvFnibQ==
X-Received: by 2002:a05:6512:124f:b0:52c:def2:d8af with SMTP id 2adb3069b0e04-53546afcdc8mr8446487e87.4.1725549650228;
        Thu, 05 Sep 2024 08:20:50 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827b28sm2619062e87.140.2024.09.05.08.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 08:20:49 -0700 (PDT)
Message-ID: <d3e7e8cd-fe53-4fd8-87fe-afbbca1b218e@linaro.org>
Date: Thu, 5 Sep 2024 18:20:48 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
Content-Language: en-US
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240812144131.369378-8-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Depeng.

On 8/12/24 17:41, Depeng Shao wrote:
> Add bindings for qcom,sm8550-camss in order to support the camera
> subsystem for sm8550.
> 
> Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>

<snip>

> +
> +            interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;

Please change all interrupt types to IRQ_TYPE_EDGE_RISING, this
will match the type set by the camss driver itself, and I believe
a rising edge interrupt here is correct.

A similar change would be needed in the dts file change.

> +
> +            interrupt-names = "csid0",
> +                              "csid1",
> +                              "csid2",
> +                              "csid_lite0",
> +                              "csid_lite1",
> +                              "csiphy0",
> +                              "csiphy1",
> +                              "csiphy2",
> +                              "csiphy3",
> +                              "csiphy4",
> +                              "csiphy5",
> +                              "csiphy6",
> +                              "csiphy7",
> +                              "vfe0",
> +                              "vfe1",
> +                              "vfe2",
> +                              "vfe_lite0",
> +                              "vfe_lite1";

--
Best wishes,
Vladimir

