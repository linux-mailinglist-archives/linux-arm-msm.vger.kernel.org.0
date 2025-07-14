Return-Path: <linux-arm-msm+bounces-64832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B99B04202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 678CB3B1DDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEC925744D;
	Mon, 14 Jul 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q40qDfwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402062571BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504144; cv=none; b=mcZmJNVc4dRjGRWvH+9OyRjpg8ze9palW1+0wMFndNTZx3Qzrk3efct2PwYBVSIdzcZm+TtZREo+YKd0j7if6Q7WuVBuNrIguDpdMBCOQsVsjcuarPUBSiAbS5TDptExsjCglS/XH+kSpt08iorGd5BpDJW3ThrYWUBXnAp22Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504144; c=relaxed/simple;
	bh=I7Pxnln1BUjfe7HcY5t1QvJulXfLwXmFHrmFWRkwVbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXh9aJEDDvZVIDeAAdSk7CnPvCDVMbZIQ6+qVSxiB68z87f37QKD8jAuN7hEKB1gmTAPiCQ+50CrDUQM0cA6zsy+Unu41qmSpUqXOrUApzhnzEUXja7/HUtawj7ilVwUP1z+Uyuo+W6ioascpiTNEf6dTHf/noy+KTRtUxLno8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q40qDfwz; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3223153f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752504142; x=1753108942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YgT/ZO8DO6Wf1bRdrDifcHYIjUyKTX9Eo/tSV9XIcEY=;
        b=q40qDfwzSIA14x1r/J2rEkv6K1gxFsLR9g71YzjpsE6p6yyKnDL03XaUeaipq9qbtE
         sPSscV7zXPXPszZUWxrwFO2bmGXSxRHADAfkUMipJq5vD+gKVUVDzVPI9fX/tAosqAyW
         9e5VLaDKcTtGFlDJLH8CG+W2sj1fsnVEj5yJP9PqvcMk7KH+2MaeMRSgKRJTsyh0zky+
         UQSSKm0HPvwQ5EQnxzpi449raR24hCiotmch5uSmR6aZCoU72L4RvO+Y88A/q9YeQpQp
         eFi3WaqKBvxd/WWVjVI8UX/00lhKz8RDu8qhZo1MfAoQrPkssUCcWq3FDos4k6BkosUC
         bk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504142; x=1753108942;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgT/ZO8DO6Wf1bRdrDifcHYIjUyKTX9Eo/tSV9XIcEY=;
        b=A3mSWXQp2sM7b9+KQ0RrEyUnE5lm5vvusE2Vws5bHd2dhgjEVCG3cX90sqlcDdTUyO
         W7BfYa0G1kb1FnPN/bd2f8xoTnbvknySQL51vuWYwnFRwqqsO/0vKk+yKWIS5HBHdPot
         6hLmX7vgdvnHjZ8URpugUSQ1HHYq0xAGkV0SZ+JvyomCKBiHA4MHxYF9UuY3k+cKe7Ap
         ttkBEQyMRfwDyGvS95KXa+jqO3MRE2DHhBcqhCHJu9ipmHAOin2nlv2hEYi48+InOMFa
         wDxTub0AzwXHZu0RevSfPvs6sqj+53MrQwJGqfC/3avUr8MY+JeS6F+rs0COMyejElFQ
         5bXw==
X-Forwarded-Encrypted: i=1; AJvYcCUItz04Wu0i13lvXCEYMkUvVVyZTMUQn4Rx7Btl4/x6xL5PfyPHIuvp5rPZ1HpS20FaGS/zzVDLppQh1tl1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnxu3cwFuY5Jo09ZKE9FNf+64i1FZrVFJ0Uf0qHM+vcYbVBZG+
	JnkrKPJBaVmN02JaKASYxxMBifcMIrqQD6w0KiAQbnoCCdbIm/AeUX1nKnaXW0ruNjM=
X-Gm-Gg: ASbGncuWIJvgb+5TxAP5OaOPo+K1NCq4aILjSVDr0Ql1QMDjR/3oLjGWWziweLVt/qX
	qsVTfZFMvsQvZAkeCQ7ZfIoGZOR/EuXq8nlqQBLpy1BfnN4Ry7LP7I1BXMrrR6zTHnBRtfgm2H7
	XXE/Rs6ADrgHWbhaigh0DXgT0Yid+wSMdJ+ow039ZL5/2V0PitbDExvCk9MXFeVgUfBSeq3uHqi
	dhPTIAry+tqzTSxLgv4/bJmbG+ZMSZ4xk5cWnCkPND9ofMpmdegRZ/Vdwqaqtd3byrATJhos5oC
	qxvL3vQsLBfuZAQvCKaQUeVThIdCzvoRljKAFekg7btqBUzcHhf/yPBHCd5vxKzwHUiuRiuAOB/
	9nE+m1QSyKx1+I0TPZz98/MJhNRc/+AAJJibJGVrrOiLWBlt4oMNutNry4VtyKPg=
X-Google-Smtp-Source: AGHT+IEi60GCx6StklZNLN6fInXr5r58gDpnVQSjnfRk5TaJycuEkJOCyklDv2cd+DxYgwPBiYqnHQ==
X-Received: by 2002:a05:6000:240d:b0:3a5:6860:f47f with SMTP id ffacd0b85a97d-3b5f1c67c67mr12717295f8f.6.1752504141614;
        Mon, 14 Jul 2025 07:42:21 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ee3sm12845397f8f.96.2025.07.14.07.42.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:42:21 -0700 (PDT)
Message-ID: <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
Date: Mon, 14 Jul 2025 15:42:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
 <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 15:13, Vladimir Zapolskiy wrote:
> 
> There is no ports at all, which makes the device tree node unusable,
> since you can not provide a way to connect any sensors to the phy.

data-ports should go from sensor to the consumer of the data camss/csid 
not to the PHY.

Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml

https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/

---
bod

