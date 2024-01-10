Return-Path: <linux-arm-msm+bounces-6867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8488296A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 10:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5F01F26AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 09:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9039C3FB06;
	Wed, 10 Jan 2024 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNynY4WJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB9C3FB02
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e5451c13aso9110345e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 01:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704880395; x=1705485195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BnWbdAfXzZIvlNsnm8tH4L/RI9Vt+Ov46EHTtMLUpfY=;
        b=sNynY4WJydceXv1fwcbGRLnfEgkxWK34RVcE8/EFtb/2XWb3mYDqlV7RH7MYZ5UFxS
         paWVhv6LPQlos4w63L2UwuTFWp1LtYbeRz8HN43Vt85JKi+23AFJdA645DWXKoN12J3g
         +L/kNm+lMJGSBM5m/vAb900AxzY/tYZPNUJDE3z8tapQzrBJC/4QxqcZdj4isdkLwydx
         AJ9xSsBmDnmBJCNgNuYCo2+tNlHjuMNgtEr+UE4+nvrY8TdQtrvb/wgfmDZvIFjYNLFa
         6WJ9EgejkC0uNdJoeDgOvUbEicZlBqitDDTdFW9X+D9knipCwDcG08wRyTqauLzmZV0S
         G0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704880395; x=1705485195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BnWbdAfXzZIvlNsnm8tH4L/RI9Vt+Ov46EHTtMLUpfY=;
        b=TAqPoCg/kmD7opkkpP/iWrE8LqosIXbDGIgVnvXs4ishYkS2OggGBQl9MhIuyf5XcK
         DOZEfARiv+n7xts9m0MNjMAUtmWngnk3EWGpyIGn3NyIDXc9CxaD67ZEbg0tLLfIoG0g
         0f6IzwuJSaKPo82LViz5ZNB5sk+GJcFY89it/oFnSfN8bT8ciiyyA6k9qFXBF1YsxrBd
         yEtl4bbCS+bYToCH+xrjM4VKCETzmfHZ5lx8tMM9sPmlFVmz6n4kYu0KEb/OK17SLqX0
         cApfubB6nVrBOzzGLgPjrea7WBNHXvN8m9Abi6JT5HvoWnA3s04AAXi+6r7GXBblk6PM
         331A==
X-Gm-Message-State: AOJu0YzkMPsbTVxcfix8c2Nx2HpfWlQrrWFY/cgz1oJ0/9B9GWhIWuSt
	fEGT0F5DCU15xhjfrTYm5Kp3c4ZCt36pqQ==
X-Google-Smtp-Source: AGHT+IFw+zrqWrbS71WR19PxT4+B0U1pi4zi6o0jydECwixmG7Z0prxZcNjLUs8C94WtLKaHVCuCfg==
X-Received: by 2002:a7b:c34e:0:b0:40e:44a9:c2be with SMTP id l14-20020a7bc34e000000b0040e44a9c2bemr255830wmj.201.1704880395304;
        Wed, 10 Jan 2024 01:53:15 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c3b8f00b0040d5a5c523csm1584034wms.1.2024.01.10.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 01:53:14 -0800 (PST)
Message-ID: <a64238e3-effb-46d9-aa9f-9271f137322b@linaro.org>
Date: Wed, 10 Jan 2024 09:53:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: media: camss: Add qcom,sc8280xp-camss
 binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org>
 <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-2-b8e3a74a6e6a@linaro.org>
 <20240109180211.GA2841248-robh@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240109180211.GA2841248-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2024 18:02, Rob Herring wrote:
> This is where you mention dependencies. Didn't I say this already?

Maybe but I didn't parse it.

I will add.

---
bod

