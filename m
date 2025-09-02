Return-Path: <linux-arm-msm+bounces-71627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863FB40604
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 16:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EABFD3A19B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 13:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E187326D4E2;
	Tue,  2 Sep 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jUyK9yB1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E41E5B7C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756821590; cv=none; b=FRrsxBRZzNK810aIGC544K58CiPe1I6eEmbF4xN3AXLTm4pxwDyBm4X4QSHYsROfYo3+56M4yjYe56YS/I37QOP8AmDH/YsmirbHuALhBSjkMCcYYImDdrXvzs1JBSM3oRF0++XHDxKmsajWAVaS0zgkCFpZELxngypeFdvjdgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756821590; c=relaxed/simple;
	bh=XkCe7+Zu1bMGwKD0Ggjxa0jQLFqEowFTaTX3+Lirq9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FObBfYaRlcA0QvqnKmqOKkinlUTnyIW5/IWzivPr2SmjAZR6bPIe8rsFV0rBEVDiUO3YiL25K5Newj9IidfW6g7Qo+BO2F6GyHA1zvBV5hImfSp0i+FM2IkDMF5GyGIAfXD9cnJdhG1y5poJipHd9hJbWSagzk4PnKIPOYURUgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jUyK9yB1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0419ea6241so17568466b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756821587; x=1757426387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPJXlck5eoKTbALptaBMSZyJz7sZGAJjQHWiJ1GetyA=;
        b=jUyK9yB14gUGdWqU105YOATg7Xh6sXKyNZWVDGk1MvDb/zwcEwd76l+4ep6Seg+RxQ
         GVkwOfoSy6zCYoYYhy9r9RR8W9YKF1fldvXPzUW1zxLvuRpfmP/pZObUlMRXlfyKlFLu
         YVh2O8qbF6BL1sPNoogBPSMGhHRQuZ0O2ThAIvcu4e261IRYY6NFbt9zToShKlzpAoXh
         qx6Wnu81h0RwfOOziMxakaNnzz0U59HEWVQWnH6MhxR3M53gRLuz+higWNmPiCI23Kk2
         NxmQra4sjUPrnRfkFE6rdRyG65sIFmS18bv6Pkbrii+5zHttR3dAa0umnQH/kTpQpq7m
         bbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756821587; x=1757426387;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPJXlck5eoKTbALptaBMSZyJz7sZGAJjQHWiJ1GetyA=;
        b=O0gAYdck5JrSrzinZalsU4Hny6bCKMFqz8BvXA50Ub3TpR7XF4afbZTF/ecIxnPx1B
         oP8BNvs0B5TrGtWyblRLZr6XMp9ip0uQSXass2eHqzcN8CoZ40TE1Z3eQFwzqk6E3ywp
         mpqI71sRYpP/5ImGwtGN5w7jT9QG+qTUFrB+al/pM5Aw7B9pUdkxE0VlpPo/kAy8ROVS
         H2G1LgqbBxqtbg1X1K2rRka4abuZSQLCLmpt/3xRVgwzeP8xEl+6ddCbmPl81mOLnDkq
         0FrkK5s7eo6bPadyKxe80u6lgnJcvf4YH6HKLUhxu2uan7U7YRHkZ5xafpn+vmVs87f0
         C/mA==
X-Forwarded-Encrypted: i=1; AJvYcCWoTl9QZ+w47UPDc7JBvj3+2Y2yRmX+JZsl4JWgIxK7XIxKPTkzkesS9l9Ql/f7tEOZu7iNy5HfJpqeWSuU@vger.kernel.org
X-Gm-Message-State: AOJu0YwtNnNRsz22Q/J0BL9wUnyb4smftJjisTHORdrm3kavZRkNed+P
	vFSo2rjAY2dV06h2bGQeUKSXIhaLSLK5mtBLrCxlsIEkfHUOQd5rNXWFuH4T35s6aDU=
X-Gm-Gg: ASbGnctjs1awfzzgfnfLC/ZwLBVCOWlUBnhg/Y+FeckgzWQx5KbS0zoQ90RT6T/e059
	smuTpTikiOhGm0hUNSvjRzvVEYcVsSv83PGaf0EyldeVY4X1eiz3Te+iKZbw2/6n/RY0ih2A2Fl
	Gm8N+vbvTwPB8qO+HGh/dAOquT+IkHhGcDnpwUOyI9+IBg//i55u+sQcr/vf8/8PpFiSsWrENvC
	DqV3eu27QsuqTZzcX22G3tcKFBG3Z0wu4be9nVLjWmp0dpJS0amffyzVlH+db6rhFcZjKSh+R/T
	MqKyMj3S2PCLgcEmk2BNV5czDw4YiAbCUyr/OhCDVwllIbDTEiYFesWCOghQcHcKAhSVtvyYOmm
	svk73Ow9YPUn4ajpu+ZDdxto5C9XdR8iX6Yqs+aPsOpW8bN2mypO8Mg==
X-Google-Smtp-Source: AGHT+IFXCkxy4FCb1+t0q3rdarr1oaEaEFjPJsYXmjZnz6ziFw45SyQomdO888aAzfhkEI6b3JHONw==
X-Received: by 2002:a17:907:94ca:b0:afe:dbfb:b113 with SMTP id a640c23a62f3a-aff0f191c5bmr756427866b.10.1756821587286;
        Tue, 02 Sep 2025 06:59:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0421939da1sm573368666b.27.2025.09.02.06.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:59:46 -0700 (PDT)
Message-ID: <174fa915-7aed-41b6-9725-2ba5d006d66b@linaro.org>
Date: Tue, 2 Sep 2025 15:59:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250902135835.246713-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250902135835.246713-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2025 15:58, Krzysztof Kozlowski wrote:
> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
> supported by the kernel, but WCN786x is not.  Both of the board variants
> are considered newest revisions and the difference is only in MCN
> numbers and internal codenames.
> 
> Add WCN7850 WiFi and Bluetooth to the MTP8750, stating that this DTS
> represents the WCN7850 variant.  The S4D and S5F regulators should
> operate at 0.85 V, thus adjust lower constraint and regulator name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v3:
> 1. Add also PCIe nodes, because they were not planned to be sent
>    separately.
> 2. Drop pieces of comments as discussed with Dmitry.
> v2: https://lore.kernel.org/all/20250811131055.154233-2-krzysztof.kozlowski@linaro.org/
> 

Forgot to mark v3 in the subject, eh. I will resend this.

Best regards,
Krzysztof

