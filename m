Return-Path: <linux-arm-msm+bounces-76518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D329BC72CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 04:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A063A172C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 02:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C091F92E;
	Thu,  9 Oct 2025 02:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gciwe8k1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC951891AB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Oct 2025 02:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759975523; cv=none; b=p4Eh231lWI4HPR0MzWz/L4wjYM3C+iiC7dBGrEmHLpW4RZhNBc0r2DkVG7XbvoJeR36YLNHkjOxkmJHpshLPeXwfivrcmXfu+8DICEihqNdJ7YOmqD7FdNQXRTtZTbGsFf4G8TyT7IDnTMak/xRqgf87g8LEyGWNjvHekSFwPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759975523; c=relaxed/simple;
	bh=guUxBHKVz5p/qL+Qv7LSeNqo1hHowLJH+2OuFqjSIok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nco3JGmfJfoXJcjkYk+xNNnOAk7Mh6DuyjorjZbyiZxXSGHNJnDWOeDrnqOlkOcER3YpAa3k+XX2Nwabig2ZPDF4Ct3jHzstLpX6nxGJpiEnpw7Qn/z+BhPK43lds2UujG8vam/9XHqm+eaF/KCaJ9z46cpJJFAQBVBEr0P4MJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gciwe8k1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-269640c2d4bso669335ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759975521; x=1760580321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r628U9UK/YF44SMc4r+HpCa9RKSfgMkrYIQBO1Xq1XA=;
        b=Gciwe8k1Mvl2S5OyReJVePcu0ba3Mmqn13wogpOtLoQtW1GMCTkIT76wY6buGNynok
         ILJ8iEOOJYoIG8zXCEaVSwi8nokZn/LPMMjMbwFXVn7BR8zDSJ1nyKjDTnjphc2fPIbQ
         MAZwDOhY54/0bOBS/+8HOlYu9QoR9LosLyco+SKiSzY4TjeokXvHfghd5jMy5DDCrWoG
         8RGXCbyKyZwwzdwZyf7j3kJYYvBL+qh0u9bP/frW8y9HudUuaHkDg5h4LfIObFmkoMGS
         h399LUhYB9cj2esC3xDJN7RpiiYvNSwT9dXg4RWAZv7hHTYPCw5C12YhOjymnIjK4D9g
         5YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975521; x=1760580321;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r628U9UK/YF44SMc4r+HpCa9RKSfgMkrYIQBO1Xq1XA=;
        b=qQFA2NbALYJayEbvYTbt461g3dA2ZjqU5tNeGGe+oIXkUUSzCPTPS5f6X77ErJGe2G
         D4X7y/Gvwvc/d0bSs42/lQm3cGg4iIOBpU7kamIoI2ZshyFLnjky+z2Xr+7nogPhF1DD
         WDq3GeNDWjY0RN/QUr55hww2YRJ2jQ2WIkKg6+Ne9unqR9qw86/UX2CClFRVu9/s9SS0
         MLnIWG7s0zvj9RfYbNq1+YpnoGanEPzqwKll7sA3tQ0wSraVntHeI47zF4Jsncu5GvZr
         xxzkvrFzjSOgaW1ViLqhLLdbe7bDjDOZylMN0zQBUuXBmIZ1+brGlqmpUeGWYlG/18nu
         uo9Q==
X-Gm-Message-State: AOJu0Yxd8BD2Smjaefqz2bvIZFin3YxVjhD3wEncmrCyZsYaSLfj8Otn
	RzbBUcCrD50v2PjjQRIdUOzGror5VU/IFa0t8dnn68pa2lq0sSA9vxmkFHlq/wev4ok=
X-Gm-Gg: ASbGnctXqc2HYOQyKVO24BZidltzQHSUsMi/j0IpL3Ry1ifnCMj47Rc/PibGqYuNvyV
	sNcQdSTxp02wTETyKFEKzEPo/PPg5o+UoFmrVyS+1GllI3RlANJa6wZUO/2rdiZAyq6lxO5kwCe
	kSuu5LryhKBmfcLwSSmHPhr9aNjl+4abv6bchTea5tjQeaJWfZAxwcwaCzSMesOfEFgmPZngqnI
	cr3c8ZN+Yg7zt27JHfEvYyFgyz0MNBnrAvLUiv5cZTtiJ8cVQW9/iTW2WSml3L1q7lOdzACxoAW
	i+U12uKQ9sPRP8SvsyHcyu9987i6w2+vSDYNyMRDJpbQpq2xyCaIlJW4/ZgbHK0mJl0JB8xvPsn
	7KzN/XX/Ht8Z1kr1IBXtIO8ZaxW03Emt29T882Dn0mLn8Y9DEe+oheY7X/1vMP5NtgsyGrgbe
X-Google-Smtp-Source: AGHT+IE+tYRvnZUksvRRuEZRDN2ric4vKa6DWfs0HxwGzR0W1J57dXrBmo5cMncGZNfe+BMxwuIMDA==
X-Received: by 2002:a17:903:2f86:b0:269:80e2:c5a8 with SMTP id d9443c01a7336-290272e3cbbmr40883095ad.7.1759975521396;
        Wed, 08 Oct 2025 19:05:21 -0700 (PDT)
Received: from [192.168.50.149] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034deaa54sm11142925ad.5.2025.10.08.19.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 19:05:20 -0700 (PDT)
Message-ID: <e9cdd9c4-4ce8-4d92-b337-1539e566c03a@linaro.org>
Date: Thu, 9 Oct 2025 11:05:13 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: move PCIe GPIOs to
 pcieport0 node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 13:38, Krishna Chaitanya Chundru wrote:
> Relocate the wake-gpios and perst-gpios properties from the pcie0
> controller node to the pcieport0 node. These GPIOs are associated with
> the PCIe root port and should reside under the pcieport0 node.
> 
> Also rename perst-gpios to reset-gpios to match the expected property name
> in the PCIe port node.
> 
> Fixes: 141714e163bb ("arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth")
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I wonder though, why the fallback method fails to work and device
stopped booting (see also Bjorn's report).

Best regards,
Krzysztof

