Return-Path: <linux-arm-msm+bounces-41518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B729E9ECF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86FAB188A04D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAB6137C37;
	Wed, 11 Dec 2024 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfdnNB3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74728139CFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733930239; cv=none; b=FexVcxlEp1/EzWAw0yZC2+A0VRcXKmX1AHPw+GBGAEA5YlL8tmuE1c3FZX2FmZXZ+qv4ajza8PRfvcRD2IkKwYyd57ZNsdnlgKDBryBmvbaYzVD1pJEdHLtNXv5/GlS4X10e1LJIfagIZAN1P+dvLy/li1C3z+bhY4kTuW0xU60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733930239; c=relaxed/simple;
	bh=dgj9faCqYqGCmdLBL99xPUxcjSu62deJACuD/zdilWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbSUNK0VIudEfi1OHjY3frtA1SaTdNq/seCW6aSlqq2PlLsk/K4EkaFIScRu7a8oEDGRqcuJEZFu0/Q3rW5G5tIC+HjptqKQ0lQ0ja2/Le5gh1o8+IlohN2XUWjEl1qT2GVGzZrTtaG0P/f8o8ok6QItjDy1DVB3Oik7J96THkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfdnNB3z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd730so3966045e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 07:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733930235; x=1734535035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pq/9/ykQt2mgUtsgGyizTWXxiGQlzsuGpXS0p7j6dlg=;
        b=dfdnNB3zvbi2YhQv15A+/fGnHQP93vRYOsf3jaTpa4SXm4O9WayRHXXxBgunbc7xKf
         E5vyvntmHowjQajV8ZDS0gxmUv95HdibJ6mML/LQpsEneq2UtrGwFG0aIcKWgd5BIRFb
         HNkzGZ22OPjW0p49hKIGyvtG+vCEd5Kp2DoxlYJ+LqBidWwcgepmWGRE917OSRtE17lW
         wrR8666H7WVkVCiDpx/6KgfSJzQQsKe0HdgeJTlydggO/snusEmJqc62/TxEmiU0mqze
         YqaSJPZ8yligTJzNe7F/eyyfsKknYH607XYaPRoUGJlRtE7F8FSs8o8OHb8ENbc5WuwD
         O29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930235; x=1734535035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pq/9/ykQt2mgUtsgGyizTWXxiGQlzsuGpXS0p7j6dlg=;
        b=kQD69QXbzD5oJF0WGZgscQ+cuk+XAA7u5rHtR3t/jn08gxrMnRkLkX+Bm7+uN7EouY
         8D95mzglxy8V1rNkmH7A7sOHz4ijIEABeOxxptk5v7YfkipWt7rijglxUQ1uTLZ+1y7h
         WrJMwikaXpnzfYsccb09pu0QDVQmPsVeEI0UST0EDb9GmhZoMT0iRQxj2RopkVTYOG8g
         r6iQylvGaRT3TDTLb8WnSaXNa76G9cHJEAcuo6bpgz96XQ8b4TLvZBzkOsUV/CD/5yg1
         +8Z/zsbyxNQXw9GhWONmBCH+nw36KPTMNYIlHUtX+3/imUng2Vg5Dyos+xvkPrZDRLDL
         9CQw==
X-Forwarded-Encrypted: i=1; AJvYcCVx7lQb9Y49O5bSLdbmIMMQuEXTNg3RR81d6ITIlQ769rfyEiGbSw+yVr+YD9/sNtvt62y3isgbbh0Qgh2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvpc7/DVnLExGAD5frIiIp+jIS6nGa6IU+6H6gy5SR2M0Ypl1v
	x9qKryvjmBqBe1+1bLIssH9yGVWRzWJrs0w1d+VILRIylye7tJoidx2NA7NVHBM=
X-Gm-Gg: ASbGncvwmK23kCU1xY148aTlfFaiQpLb8o4yC1qkeVR3PW4eR6Q9WBq2/58r8TXL8uR
	12qJWcH7uVbGEUDPb4ynSX2AZjzOdt9cBMd9cLekBWKffj/fKzEPm980x+BAdr2Qn6nkANgT1e1
	zGZ8w0AcV0FuRmG/Wg75lJlTRhFY9kHdVg+tb7rBOwxweUkv8XdLKcigoMOEwN5INUa4jsg+zr8
	WpevX0mfmJy8KckqEmUu9mK0z0qbzxCPAo6KL8MN4qliTiOqGAgnOucw0uMVtKR7zs=
X-Google-Smtp-Source: AGHT+IEt9zWV2LMhZsdWwndfOSZTj2c0JjzyKNLYN1YUNo5ne9QVKbZjRtTvm+taJQx35xtP4m34bQ==
X-Received: by 2002:a5d:47c9:0:b0:386:1ba1:37dc with SMTP id ffacd0b85a97d-3864cea39ebmr2355871f8f.47.1733930234776;
        Wed, 11 Dec 2024 07:17:14 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f8e1sm1502000f8f.18.2024.12.11.07.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 07:17:14 -0800 (PST)
Message-ID: <d8b73275-a52a-4cfb-91d7-948686d3a5f1@linaro.org>
Date: Wed, 11 Dec 2024 15:17:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/16] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Yongsheng Li <quic_yon@quicinc.com>
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-13-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241211140738.3835588-13-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 14:07, Depeng Shao wrote:
> +            interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                            <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>,
> +                            <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>;

Have a look at 7280.

The parameters to the NOC should be named.

https://lore.kernel.org/all/20241206191900.2545069-2-quic_vikramsa@quicinc.com

---
bod

