Return-Path: <linux-arm-msm+bounces-23569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02559912385
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F821C251BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 11:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B97176257;
	Fri, 21 Jun 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Un0i7p2K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B9173342
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969124; cv=none; b=Wcms5fuCzWU8qpuIWX//OG91AuBWWidK41PKY7DzA0WFzcPPwmbq9a0eaDxpGApHiW/oaXO1vC7n7XbEcLqll/n/perR0rXRnWHgeFtZV9Kb+Xwl25/s15vkbY+zFd1c121RZnX/y09mkVzH8/7YQUQU98KI4Xut0RxdoeXazm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969124; c=relaxed/simple;
	bh=/78T4gIP6Vl7qO16NoY/Yc+0FArSmsilMMQukCe6F6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l69sXhwKKovfGaBhJbrqdASesDNPxmdq2mehE4VpIF+t6Qv6oFSUuvURwFXQyQZymVW3HdT2chZxJhH6Kbo7WVVONqTy2MIiWOYXni4pP9NNidzSUUCaTMFF1Luvgy/oxbe8rNaT5d59KRIfBQKCtQYVeTTtKqYd7/2g+zpeX3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Un0i7p2K; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a6fb341a7f2so237665966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718969121; x=1719573921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVqer5McNqdNZnecI/834Szrx4B8E3Deyrvm1bBN9j4=;
        b=Un0i7p2K6bw0p+YO4Sxsmx+evq4Aq3M4dyXapGavjzfqtxmBSy4C9McKXsQCBQvS/N
         RDAjAkvj3lifiiej0NVA7dDSTca99Tn+/3JrAqu9sNPzuozBKaXrqa7Or83Orx9iPqAE
         EI3rv5if4dGHvhPR8FUifG66WhngykGyYCA9eiSSyk2lCCA/kpREjjz60XAgDLvrzwQ5
         GMwXoQ109Ic7YdWuYeQu8sTp2gb9/p+vQXpH06KCoRLS2hcm8VxVNjFlCLSXB/yluWLy
         W3+E+8jNpZoujli8Fx4ezpKfnyO5ZknmSp0t5NuiseYQRgnHRblPflRltiItnW70P4Pu
         Vg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969121; x=1719573921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVqer5McNqdNZnecI/834Szrx4B8E3Deyrvm1bBN9j4=;
        b=NdeO4/6a3fAuLwvS2EMXnf2w35l1/C2lSFcwVH8RUpOE0FTaoBd85k98Im+XR1uW7b
         bl9/X0i4qZoBIA2aMFxz2G7YqWT/OZ/M5dttpdgIWBdS7mz/bl2NFPMs0W84PauFjjwQ
         QgTKxAysR9QvsuJHVnFh9qFFlSD83F1ivzfcrENMPuSPb1V82rAV86DD5CpsTXAnO7T8
         lfO4fe8iNDsy0oxIoVOH19yt4tvQZ78dNr/KJcThwz2L3cIRTwfNMttIGY99iQqdH75Z
         /VTlkZANlYvIV3q+yQSnbLruo2EH/TyZgz7CGEWSn6x1KyaSHgwDy3sytH/0G1elGvUC
         g4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCW8NK/top8C8Fx6AxUYUCFo8jfjRZbG66q7Ogfr4WDwRB2euHpeVwbZZDa3869CUcKsvhyJwwodxn+bt1L/S97s17gHmlG7SKWvjx1Z6A==
X-Gm-Message-State: AOJu0YwFHUfHIoiavPgu46C6NlkjV4/LZWdscatNgUQwrG3aVurNfQRr
	Yl1FYFDcmShdZ0bZmIBedqiClwtTO80Vtg2HJa4EIZgnz2rlUoAsgqN9HYd2BKM=
X-Google-Smtp-Source: AGHT+IH126ydw90RFkIhA8Jjhs+0tNi7TXjbkKjB2FNHRMNyT4BERWZyQz9kSzzxO2pfpg2TTTUqyA==
X-Received: by 2002:a17:906:b41:b0:a6f:1445:9de8 with SMTP id a640c23a62f3a-a6fab778da9mr570586766b.54.1718969120996;
        Fri, 21 Jun 2024 04:25:20 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf489e1asm73538966b.47.2024.06.21.04.25.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 04:25:20 -0700 (PDT)
Message-ID: <cd9b5612-1160-4284-be7f-4efbcbbbe346@linaro.org>
Date: Fri, 21 Jun 2024 12:25:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: qcom: camss: csiphy-3ph: Add Gen2 v1.2.2
 two-phase MIPI CSI-2 DPHY init
To: gchan9527@gmail.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240621-b4-sc7180-camss-v1-3-14937929f30e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2024 10:40, George Chan via B4 Relay wrote:
> From: George Chan <gchan9527@gmail.com>
> 
> Add a PHY configuration sequence for the sc7180 which uses a Qualcomm
> Gen 2 version 1.2.2 CSI-2 PHY.
> 
> The PHY can be configured as two phase or three phase in C-PHY or D-PHY
> mode. This configuration supports two-phase D-PHY mode.
> 
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>   .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 120 +++++++++++++++++++++
>   1 file changed, 120 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index df7e93a5a4f6..181bb7f7c300 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -348,6 +348,121 @@ csiphy_reg_t lane_regs_sm8250[5][20] = {
>   	},
>   };
>   
> +/* GEN2 1.2.2 2PH */

This is the init sequence for 1_2_1 not 1_2_2

https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_2_1_hwreg.h

https://review.lineageos.org/c/LineageOS/android_kernel_xiaomi_sm8250/+/311931/10/techpack/camera/drivers/cam_sensor_module/cam_csiphy/include/cam_csiphy_1_2_2_hwreg.h

Please fix.

---
bod

