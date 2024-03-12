Return-Path: <linux-arm-msm+bounces-13955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C9879D04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 21:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97D39B21A60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 20:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2129614291C;
	Tue, 12 Mar 2024 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ils7ZC30"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52B382
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 20:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710275877; cv=none; b=tRVAv6L3l4O49YOFFoeacE7YoS3b/mF0sWBWZrrs+LvHQnZAldaF84AWWWh2bMACysbVuZ1rTOltyE6SLB635W97ev0eYjIUVEoMCcHlhD4XJaPgYVGoY+ZkJnXVNTAHyvchNefKS8D0xGfgmjkLv12gFxD4gYN5R/qA98ZBSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710275877; c=relaxed/simple;
	bh=3PoZtqZfv/6PU1uW7l4UoCclsEmR/Cq0T8eKpXLxOAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpAdemMvZSMyWDSBowT3bgZN0WrVXbuG1B4q42PfmWyr14Rf5cs6MZYSdTHeKn51QP746CuO5un7moTR+7oN0OW3AruxMsKehVITBpUNIBzX/J3Xbjj5xgt32fp/CjDajkgQPLHlEwV0nZkXYeVFlQFjv/3F4sGGmR0ziQk5XOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ils7ZC30; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513c1434283so370407e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710275872; x=1710880672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qkAM+iQxn7GBJaPt3CHhQXDne7eiNHja+zN5jC9ZRg=;
        b=ils7ZC30QZ0HT6qFeVMyhqhW5guOI2ZT1Cve4kRZHl/qAEfl17KscPFSW5yDhs+vYh
         zTEltdk9DkpozprtWgnDse0UNQqVVeEsKcA88cCzCmRUQlFSEz0g04KQpjd0UacolGO7
         R5FXafPek1T1lLDvHshntecc/ifTindJKOrKiEjNwqoaFRV3n2mSkqwZTZTQxImzE2uy
         yeDXcjkM8xxYupNgQVFfxc3let3QPdfGvoltOrO7859mjVgMaIoArzBD+iC9TuIASq3F
         5bnEEQeIbulQ8ckIuJvekaCXWXZqPd2Zw4lEDFmEmscEutEPIjVarvC+TcNRVWPYlWzK
         /Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710275872; x=1710880672;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qkAM+iQxn7GBJaPt3CHhQXDne7eiNHja+zN5jC9ZRg=;
        b=D44gk7W/WEpa6vlsZB+7kF7U3/QT1dw1pZ+OrnMBPX1OjxH0zUAeJG5qQG0jsr1K5o
         brqpoUD+n6ujInJTiya3y5/K0/xHYi8w5niJbX5kAetpU4cORj6d9eE5DEx/fRAXYcap
         FqmnvkdQIf3xB8fy2qmQId3sDj1x14QBPZHUIVgY0a8akEzyxcTaFI2iIm9iH4GEyeE9
         k3jzvjOnzUwWkKnBroGBQnjJLRpWf0Y3g5EnlvyRChKBZk1s4h2nq7NOOVNWh+5b35Lq
         ZXTy9vtoFqMeDSZZ4r2ib5HShdcZkXgA1bpanyZKudXh27dhHpXmy1yaGU49QGVqaNe5
         cJeQ==
X-Gm-Message-State: AOJu0YwW2QnXo+ycjA4uHqel7akkE63pb1p12MbWW3hiiioYr3Tt4ZhX
	I7P5WNeHqtKzzRI2jchjSrovxOAXVlC/odL7dn38bIZmEFWHM/dk3GJsNLIMjGk=
X-Google-Smtp-Source: AGHT+IEwbT5mrbnBCcSEv/VsxGJBXrJlJ2+9LKa0GMPBpgwIJWgGFYSTZs9yyW5Wt+mdSIbJ6kkwSg==
X-Received: by 2002:ac2:4834:0:b0:513:ba0e:a2e9 with SMTP id 20-20020ac24834000000b00513ba0ea2e9mr2443479lft.24.1710275872233;
        Tue, 12 Mar 2024 13:37:52 -0700 (PDT)
Received: from [172.30.204.193] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u14-20020a05651220ce00b00513a238039csm1426317lfr.287.2024.03.12.13.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 13:37:51 -0700 (PDT)
Message-ID: <6cbc2741-db0f-4acb-a9e1-45b3df1292d5@linaro.org>
Date: Tue, 12 Mar 2024 21:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: add TP-Link Archer AX55 v1
Content-Language: en-US
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240226-archer-ax55-v1-v2-0-3776eb61f432@gmail.com>
 <20240226-archer-ax55-v1-v2-2-3776eb61f432@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240226-archer-ax55-v1-v2-2-3776eb61f432@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/26/24 18:12, Gabor Juhos wrote:
> Add device tree source for the TP-Link Archer AX55 v1 [1]
> which is a dual-band WiFi router based on the IPQ5018 SoC.
> 
> At the moment, only the UART, the GPIO LEDs and buttons
> are usable, but it makes it possible to boot an initramfs
> image on the device.
> 
> The device tree can be extended in the future, once support
> for other periherals will be available for the platform.
> 
> 1. https://www.tp-link.com/en/home-networking/wifi-router/archer-ax55/v1/
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

[...]

> +
> +&uart1_pins {
> +	/*
> +	 * Remove "gpio31" from the default pins in order to be able
> +	 * to use that for the WPS button.
> +	 */
> +	pins = "gpio32", "gpio33", "gpio34";

I believe you can even shorten it down to gpio32/33, 4pin uart
screams flow control, and I'm not sure if it's there only one-way

Konrad

