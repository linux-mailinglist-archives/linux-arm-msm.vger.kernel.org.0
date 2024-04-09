Return-Path: <linux-arm-msm+bounces-16881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE4F89D5DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 11:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2FB71F23034
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 09:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511D880025;
	Tue,  9 Apr 2024 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rkhzI1rB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9577F7EE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 09:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712655996; cv=none; b=m2C2GPZmrGFvr0lmoEb3t3iaUeZNPAmasCWGzaTLVwpxFDqymI+jA3J/r+r9gjkqqtXXzSFIRFoLHyL0RRNGLYu7oGly8HlLW7ZRFq3zQPpT4ZX1IEJcZufqe+ZHEGMfIkVWT9xAo7WcrEfuMch4E7RzhDxI1wl7YKPBEIMN7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712655996; c=relaxed/simple;
	bh=Lhll4Ya8gvkYKddGbyKns1zLoe9n7V+SCV6zEQrpnMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRecci+SXbOqxx0CJxc6RKAY59JdhhbjnSPi9T97svMGuJ8sEKH0qwVjtk3bxCCxJhUCXsoKQ3kQqIAd2/Hus97JObvh31a41a5r1BCYz3xLSi4Mr+IeJhpv3hFbyHqnbL0ZQeR/zO0kJAt6dyJ9QGEh9smDviSW8TzGViqHJ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rkhzI1rB; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d485886545so94259711fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712655993; x=1713260793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Egh+t0F7kstd2Dcv/3ADKSuF91+/JiZpQiMUf3T+HAY=;
        b=rkhzI1rBSyFNMU4h9AVAM6+rmJ24uK/WvkOcZu8fRXo7xyJop6fduA+JmeFSr+D9MD
         GF2bK5QpMsi1dw2aKsOY9zL0kAqCu+FTkmD4eiQlusqAI1wMdOckgAJ2IF+vGPrwa2d9
         zg6YPL5xaVpsBEpSOx7Rf/R7JTrZNkkCZH1xRsC2TlOuXL6hFimfGjgIc8hdwqKoGErs
         BBmMZqVAxT8m/akVR0oh6/b+oTq5pnK7F71wl3APGevYH81DfeYU1QfZ3UIvwwjI6nl7
         75K27v9MlGjBfTB1MIlZAqEd8i82lbt4gEh0/mJfD+44viudugAoEYTc/TsaI8fV8J55
         pGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712655993; x=1713260793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Egh+t0F7kstd2Dcv/3ADKSuF91+/JiZpQiMUf3T+HAY=;
        b=Qzm4SaZ/1Ll1mVlnSvxu5bzMmzs3kBAHGi6DnrltI6kLMumWad3SHnySNy6NVqcRhB
         6wJqIU6xzvJkA5LRFzMnq2TKbG5TgmbFhWTmGrvMSnhS9EhH4Sj5CNylQJlo82/KgmBh
         DQqAvgGecqcTZVsuC2nBwJSat3pgR/Xcb6mdtVaFp/B+Z8IuziFUB5+05GJqgZBJQwmU
         5UHU9y9XiQmkQEIME5aqW9Qb86+3gwz40hPgVM3I05ABjGwlhNAvsO+BNU2Do7fmfyms
         RRqMXrmTlftMIQKpAc8xwB75n442Hu+xYarAfNtCBA/FIAj1L/pzGs6AKvde3JlW7zcj
         Dvqw==
X-Gm-Message-State: AOJu0YzsRQEvNwfgOMkrGSy0SnyHZz1znEcZmpcIsvgdEmKfw2YVWaPd
	g4547z6h8Jck4zlB9z0z6GNZBYrevqwt5jcnfAXqz6wBUHQCSNKX8h67Pi0jM4GXmuX6dYIdPoI
	yGTY=
X-Google-Smtp-Source: AGHT+IFlaEzNF5o0Ls/6Qgk/MBgGQ4kPQ8KXJ2uZuOCbPpeTHs++XApTTNl/QNR48dam9TbOlCOEIA==
X-Received: by 2002:a2e:9042:0:b0:2d6:a609:9a33 with SMTP id n2-20020a2e9042000000b002d6a6099a33mr8296135ljg.0.1712655992794;
        Tue, 09 Apr 2024 02:46:32 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d12-20020a2eb04c000000b002d70a040f21sm1444570ljl.91.2024.04.09.02.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 02:46:32 -0700 (PDT)
Message-ID: <13da735f-e109-4dc1-b246-cb8c7928f352@linaro.org>
Date: Tue, 9 Apr 2024 11:46:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Motorola Moto E 2015 LTE
 (surnia)
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?V2lrdG9yIFN0cnrEmWJhxYJh?=
 <wiktorek140@gmail.com>, =?UTF-8?Q?Val=C3=A9rie_Roux?= <undev@unixgirl.xyz>,
 Stephan Gerhold <stephan@gerhold.net>
References: <20240405-msm8916-moto-init-v1-0-502b58176d34@trvn.ru>
 <20240405-msm8916-moto-init-v1-3-502b58176d34@trvn.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240405-msm8916-moto-init-v1-3-502b58176d34@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/5/24 16:06, Nikita Travkin wrote:
> From: Wiktor Strzębała <wiktorek140@gmail.com>
> 
> Motorola Moto E 2015 LTE is an msm8916 based smartphone.
> 
> Supported features:
> 
> - eMMC and SD;
> - Buttons;
> - Touchscreen;
> - USB;
> - Fuel Gauge;
> - Sound.
> 
> Signed-off-by: Wiktor Strzębała <wiktorek140@gmail.com>
> [Valérie: Sound and modem]
> Co-developed-by: Valérie Roux <undev@unixgirl.xyz>
> Signed-off-by: Valérie Roux <undev@unixgirl.xyz>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> [Nikita: Use common dtsi]
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

