Return-Path: <linux-arm-msm+bounces-1572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5457F5092
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACDD2811FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C76F5E0C5;
	Wed, 22 Nov 2023 19:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkGHURid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E383319D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:31:22 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50aab0ca90aso110281e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700681481; x=1701286281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3Hb4WPhSaSPAUoOT6lB75q1bgT44dZFwIpXm+KkGko=;
        b=nkGHURidAIDei8O3E5usUyMd4izr+Y45af4dYisXNK5Ucfn1/gj6m+kdZVLFBqLXWe
         5F6EZVtNzFR7Q8QeYQ/vSBLeWGv6rhy+C4DPUdL6VEqi/QKyQ4MKO1fcDsOTPCuTf866
         hJHkBREZxUS68gI+vKa9XtEeVPuRjt7B6qBmoECCD3Zg3i3i3arYJ+hbo7+ilGWu07s6
         7YomS69xxuAa9u+YWGY9wTze5n35lwPRo/jhZg27Dr806SafNOGSG+DEXpf0rcCnZoGU
         Y8S1zBSyhuyd9KA/+FjyggmHwgk3VF/kEFbwmvuHWFRE6D1ctZZkEEpE/7AvVedZEDng
         mLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700681481; x=1701286281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3Hb4WPhSaSPAUoOT6lB75q1bgT44dZFwIpXm+KkGko=;
        b=UUAfkjXuLb7hUv5R3IHAY5n2QEvVpe7bzxKSWCkvXLHBo3Mz8IAN3X3rJSns5NS0A6
         EOL3sP8xLBhBhtz/Pwaeo2jFfaMQ5/C7igqREztJ4FTpi6duxQLoDbAvaHpcrAPpW6Wt
         oMC8b8ygS1X1wko+6AHZbIQdb1elXm6CDW7YOb9QQq11Atc71g9FKb292nAai0mpqAJh
         LG+r7EGD70hEVxg/r5gF5PvC+oHF+jMXxnaROWtEDzPu2b8WYbdebMOOmPzhytUoyEhv
         FEFtWxYDpfLqyLfm7mvZFwLgaU7eIXHmfftczQzMC3jfFrMkzNit7LEYyj004vxQdv76
         OydQ==
X-Gm-Message-State: AOJu0Ywg814gZTzJaH8i+qLVw0ygO795zeTVXI73RtPojQkgAZGLVOma
	Yx3UKidfsVlfUJbGXtBSk0akCA==
X-Google-Smtp-Source: AGHT+IG9PnDXoY4hN8COg/8KM91F4QysmaB1ycYccER3JxluzECblJt0qpgWnFM6mx7ZjbgcZ5+Ohg==
X-Received: by 2002:a05:6512:3b9c:b0:503:261d:eab8 with SMTP id g28-20020a0565123b9c00b00503261deab8mr2918554lfv.28.1700681481136;
        Wed, 22 Nov 2023 11:31:21 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i4-20020a056512318400b005007e7211f7sm1938041lfe.21.2023.11.22.11.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:31:20 -0800 (PST)
Message-ID: <675bce4e-1270-4e9e-b520-f3f4c1c5ee8a@linaro.org>
Date: Wed, 22 Nov 2023 20:31:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: pm8916: Add BMS and charger
To: Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
 <20231120-pm8916-dtsi-bms-lbc-v4-2-4f91056c8252@trvn.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231120-pm8916-dtsi-bms-lbc-v4-2-4f91056c8252@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: *



On 11/20/23 15:03, Nikita Travkin wrote:
> pm8916 contains some hardware blocks for battery powered devices:
> 
> - VM-BMS: Battery voltage monitoring block.
> - LBC: Linear battery charger.
> 
> Add them to the pmic dtsi so the devices that make use of those blocks
> can enable them.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

