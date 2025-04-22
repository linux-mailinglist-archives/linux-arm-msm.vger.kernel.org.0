Return-Path: <linux-arm-msm+bounces-54951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D33A96845
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B83B17BA7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632601F130B;
	Tue, 22 Apr 2025 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xreADrxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51C27BF89
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323151; cv=none; b=IAEXj4l6IEkOTmBc27mA8fcAkWazSvaUed69VTq0uE95pwVQNkLtALD6Ufp76ENyXbztpTHnwdf0mC03kxVIjNT7Xb9gHlzplhi7N8cgFaj+TNf7XdQc4CXVzZx+b2LztKA2sFJFHYjrOvFg6rKwaJ1DzytLQaAxagIOP6Cese0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323151; c=relaxed/simple;
	bh=B8KDn3QvXvfYLh7t8A/lONT5acg89ujQ4x71zHRXKm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tFA+gHtK4NFl7Vy45gwYAIrTTRRBhPuf07xmXp2RmcTj4KUsP2PVTWintNYnILryj1c5v04wdFpYAyAcJMG2nlocTMaR0nGp9KywHlEYsdYI0YM0ksWC5ykYzAiKmAyAh9X1Fltt8Wax075cFJYdr/LvJDT6dMpfo7rBm0BWBqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xreADrxM; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso48595345e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745323148; x=1745927948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZtemBd3G/uirmnOoOQusjnqcdAhM8s88bXls8NzP5Fk=;
        b=xreADrxMbOd7nlDXWdt/NNWXmNZjNDEbLWeofh1TLSTPaR7YeWtH2om/GyLNnTuFwF
         MQshkEa8q0zor3+fqNiSkQWI5iBzADFggkeEbAmryDAovXFxs1ju6G4bHblUAuizF2Zj
         Yib3cr6Maw2t/TKyLJ3OrhkFBB7OZ+I3F+huuLPsWkMfPnfTfBlJTgutUzaqt+XwNyTk
         NdwWmRxa0aSt5oArN6j9vhwmilGBTj5maOXWSxDafR7TqEtGWO1p4xRwMH3m0/ZPs4PZ
         fX3C1496TGNpskbhSDWEEYMphOzg9p5TVtXe7IEJMfPsSRXtJhspAzFVYDKUzQM1NSAY
         7W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323148; x=1745927948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtemBd3G/uirmnOoOQusjnqcdAhM8s88bXls8NzP5Fk=;
        b=MAiNeA24PolTNwPFo36vmDdnqo50fchreZieUwM6915wdAwXzErqFJb5X0qNez0GuH
         pQIkN3nDHGHMj95Gn+/cHaFGQWL9r6kaAnL7NAv8azs4Db4BOtw9DuI+r/ME4NPjn94L
         jhFBHlvCNhG729f2aqASjIOWhcvZ9zzb2JzIh4u0v2biiHN2mUeB24zmdMbG1eQxHYi0
         a0Oe3kB3ULZ8P7J5OHSqHfUp0tP757CTgzTdyyAZPG7Ej+wYEJ2T0rDmOui+BR0mMkNp
         RE+17MHWEyDOCWFpBaQaP1lw33dueyoqhMUQJ9jaVr9IKfLDHCZUpQZ0B3IAP3T1KmKF
         zKCg==
X-Forwarded-Encrypted: i=1; AJvYcCWs7DTBUO0+1TXIZZP8FxW4ho+GhVB9jn5TQTRDcZmptHydicSilVRWq56ugf4lzoQSWBJSGeaY8zGKB77L@vger.kernel.org
X-Gm-Message-State: AOJu0YxVu33lFmUXg32JY5oURb+gXFh2sHEZ/RzpcswR4+rT1RLfcRh1
	2MpJp/X8157jJBvvyNEsO+j+tcjW1sNK2wAauFRefqIZ5/ADjkSHu4Py95g2oYETt8KZ3GFBLqJ
	be7E=
X-Gm-Gg: ASbGncvfpnHlK/5Qf02bE+G4kpCu5Czfcj5FgLv6xqaPS8KvBMO/go6t83WC4aL7zE6
	rniWcjUyWE4wtsxOrShjRxFdZsXeJQcZPq1GKbQ1DxAI87bR85d358iH/isI8VsxEf4pM6B60pf
	naAXZEIdTLqhslcKcl/EhztowD8PBOUHUcHpZhmduAIG3u0aj/1cZOX6Efx6486g7JZqzp8pwNy
	HVRz1/O5fVcfyTAUGkTEaGf3BAcBH9EmHhRsNfjSCAZlQddaGwMSzyeJKCdPdQValeRmnzFPb5a
	Uv9uNeGeC6vu/6bO++xsIu3E/OGv3OIHQojo/4lJjkaM7i2XbbwOeVChnXTjgHjjSB7qLYC1AqP
	AKrON+Q==
X-Google-Smtp-Source: AGHT+IF1y0d12KuMkqHmAdbxu4rB1xn7kfvQc2RyPvUyr9/eORSwE/0jB/0/qhRoefW+QRojCB8LlQ==
X-Received: by 2002:a05:6000:290b:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39efba3867amr13238328f8f.5.1745323147811;
        Tue, 22 Apr 2025 04:59:07 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4235dasm14809380f8f.9.2025.04.22.04.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:59:07 -0700 (PDT)
Message-ID: <d19ce1ba-2b72-4c04-b405-f5a9d3df07e1@linaro.org>
Date: Tue, 22 Apr 2025 12:59:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: dt-bindings: media: camss: Add
 qcom,qcm2290-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
 <20250418141147.205179-6-loic.poulain@oss.qualcomm.com>
 <20250422-nonchalant-bald-mink-7c2d34@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250422-nonchalant-bald-mink-7c2d34@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 10:15, Krzysztof Kozlowski wrote:
> On Fri, Apr 18, 2025 at 04:11:46PM GMT, Loic Poulain wrote:
>> +  vdda-csiphy-1p2-supply:
> 
> Why isn't this named vdd-phy-supply like in every other binding?
> 
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
>> +
>> +  vdda-pll-1p8-supply:
> 
> Similar question.
> 
>> +    description:
>> +      Phandle to 1.8V regulator supply to CAMSS refclk pll block.
> 
> Best regards,
> Krzysztof
> 

In this series we agreed to include the voltage level in the regulator name.

https://lore.kernel.org/linux-arm-msm/20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org/

---
bod

