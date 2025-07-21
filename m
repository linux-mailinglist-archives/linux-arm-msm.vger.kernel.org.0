Return-Path: <linux-arm-msm+bounces-65928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C31B0C8C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 18:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 372C77A2EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 16:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1B72E040B;
	Mon, 21 Jul 2025 16:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBu3kRPr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07262D9EDD
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 16:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753115381; cv=none; b=JB9t5ztah/4yFtk6NbwaYXQVPtBpy7WYf+HqIthFlTs6nLrvmrRg8CMHBsHtDfCTsPVQVZ1CEZfWrocZVU1q4URRwmvuLLqAqplUK2q006PKHIMGfgfZrlbKju6qnS85Rt1M3Etg+P8zW8ktsdqcDc+z0KVuTmSiODFORIG6xPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753115381; c=relaxed/simple;
	bh=nQg4mVGlavPAkrQIuNcIrVz2XSMjt/8NcDVu2xUbWhA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lUKRXn5ZE6SHXCim7AhIn0MWPDU3lUmSRcD6Y3tZ8XiJNUafPq9vCq28h7y3UdBFRFwprRzVCpTMOKmtwNvRY+NFvboziDh0/1bgr3wv+gxlQpMkETnQqsLiLGXE/16kwjsp3KnwE+IGN9g8j62MXCVQNfV0guqZc4TRCw/ipTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBu3kRPr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b45edf2303so4221251f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753115378; x=1753720178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mDqcrroJ3qLkh5t4BQvEhf/oMY2x7lp1dD/3eXpKYqI=;
        b=IBu3kRPrQ398nv2yhgdtrkH/3nWKZq1OHOnk6R5/Urband4ZwRQ34680+5SQj0rLAX
         A+CXraSefg9nE6jEsz/4Q9ukpXxiHdaw6wwkytUYV9kRUN1yt0fojLBXFxJiuWVQkdtJ
         BnhqzOgPj+FLY2oDJ7WVxMnma7xLpLHm6H5ySrr0ZtjwappbiOVII/AqUt86lAOAX6O+
         NuCDMj8qUTv1Zz3HkJiwl3KtcRF+0/76h7Dk/CmiwBWd9iRF+x88f7KdHgjLA47+1kJn
         nNCCRahN+SmNh6ZFJUO8d20lMuxZhjABbKTJtGjhw+ACfGQUCUxlAkzbcEZ6PFBOrN5Y
         AzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753115378; x=1753720178;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mDqcrroJ3qLkh5t4BQvEhf/oMY2x7lp1dD/3eXpKYqI=;
        b=KAYQGcoLhK0oQXYa2wk7mA5fPAzcc/UViIxFbZr7gO3mq9COGa5Zr8T2Pr5mLibmTr
         koGrLu4N/QfwPDy7W8AJZ9qfoIMKLNDTfWJwqvzwUGlNQc48ABOyPTLnezn7eT0fSkfG
         vZxFyHRRCu9+d2ziojCYHOH7KTNsNJ8+7iRPCezKUfBmYL6gWRrKk9Mz+OmgLkzJxkJs
         1xN7MFW7aW3Ip+SDPUMMpWezYtPh1vB2GLZnQ4bMFut2zHel3QC11IzPseW9kB4mvPjo
         YXf0K4sWYJw4eJuqKr+1BT/qSpu33YuGOSRcIQZBVAc8rebopaP0GjUWYHcEBj/Gm2tR
         JOOQ==
X-Gm-Message-State: AOJu0YxzRUwWQWOrKPsVaGhDQa1a6nyFXqPdBbSGM4n0SPPfUhM5m9l/
	Y1/S2ROm5xEYd0d/ZW53rKW1bqCPSlX8V+OpFxEnuy1UwpYKtwaQPgXGQTpcy+7oN0c=
X-Gm-Gg: ASbGncusOHv/zbCurUfOyY1WFSpDO9/SvlM4N/ka7W6sKQH7BZcFyLSNzuTePn/TAWl
	8HE4OtxUI+W2icGH+VntYLsrjJ4GzmNFfMYIlmf3El38hWjFoQEg2hn/IMnMjSzwNFa6iajYKlG
	/+z+FuFZj1bTtLpFMxHUMxnW3p5p9UJBBfPVOH3e1tYR76dup1pdERBesp2ZyNPKt1xqbJbqZko
	6aByujueLJToD9RbhKFFnLqPg1zI7rUCLycK20ZXehsqYJ6j97pf6zFCJtsayJByRW5CP725XUZ
	v20PLngT8VJ37Z0KGAV19OjLuk+tYVMUPNMXpMngCUTCTseO9t0veeoyzj6uuFsdfhsDWKUvPq0
	0g0Sjay5nr13G0UomVqilaDW6PPqkqLUsZVhco/gCkdoVgMsEgwz/Omz0cT81vIo=
X-Google-Smtp-Source: AGHT+IEyGrnEx/ClY8Jxxfj68ZCw16qbV6UiWvo0mvnQsuihoYuu1pQ1oczOVmJPNRJcxc4Dt5O++w==
X-Received: by 2002:a05:6000:2482:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b60dd4a88emr17973192f8f.2.1753115378060;
        Mon, 21 Jul 2025 09:29:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c8besm10819066f8f.81.2025.07.21.09.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 09:29:37 -0700 (PDT)
Message-ID: <94ca7625-4943-49a7-bc91-5e354d62cfaf@linaro.org>
Date: Mon, 21 Jul 2025 17:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
 <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
 <a7f64b31-4767-4281-b452-a2bc5351d745@mleia.com>
 <c93624bb-ee7b-45ac-8b53-b5391f11c9c9@linaro.org>
 <eac3a877-a4aa-4789-9013-ab8b6c91e0f3@linaro.org>
 <0a12879f-dc4a-47fb-87a0-ac4b8bcd4d75@linaro.org>
 <53a19b1d-5665-4937-a07c-5dd1fcde06c5@linaro.org>
 <3b760685-97db-46e3-80a3-7fad69ad31cd@oss.qualcomm.com>
 <94b75177-9401-4e0c-966b-5847a29cb6f7@linaro.org>
 <427548c0-b0e3-4462-a15e-bd7843f00c7f@oss.qualcomm.com>
 <3UXVZ6ANM9mDjVdMV4SXsiIx_pT3S1lp3RC_Q7mh_o7jF2dpYsni1Sl2TAWv6OCMCRTFmi9aE6BxDquGkOnwEg==@protonmail.internalid>
 <8b908a20-0bf3-447d-82ea-a5ecee1bf54c@linaro.org>
 <57501e81-7e9c-4cb1-9a37-18307d1e06ca@linaro.org>
 <90a896f0-7b67-494a-abe4-dceb52067e65@linaro.org>
Content-Language: en-US
In-Reply-To: <90a896f0-7b67-494a-abe4-dceb52067e65@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/07/2025 17:22, Bryan O'Donoghue wrote:
> On 21/07/2025 17:16, Bryan O'Donoghue wrote:
>> drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c Documentation/ 
>> devicetree/ bindings/parch/arm64/boot/dts/amlogic/meson-khadas-vim3- 
>> ts050.dtsoc/ meson-axg.dtsi
> 
> Documentation/devicetree/bindings/phDocumentation/devicetree/bindings/ 
> phy/amlogic,axg-mipi-dphy.yaml
> 
> Rockchip, Broadcom, etc.
> 
> The allocation of lanes is known by CAMSS and easily communicated to a 
> separate standalone node.
> 
> ---
> bod

In fact its part of the dphy params data structure...

---
bod

