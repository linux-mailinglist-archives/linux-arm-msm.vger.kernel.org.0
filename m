Return-Path: <linux-arm-msm+bounces-24902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E29243E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 18:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58D041F2765E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 16:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569481BD4F2;
	Tue,  2 Jul 2024 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8GhtMwK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93327BE5A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 16:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719938730; cv=none; b=nFUL1QHhb9vLq0PjtKWzhjU6LnWT2Z3/fEEDtil+4nyMOmkPYl3Z8fg7gUMZnr5RKgVGaxtjg/LyKcq14ld8ijdvytav693J/Ck4g7BwphfO2mDbk26eLgY4W+nMszC3T6jk5JW0ba/a0ON7exCgpCOivC2z4oingScMHi/1F8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719938730; c=relaxed/simple;
	bh=3nXRptT3XS6fYDJodDzbr5a10QmaOR61M/sAVY5ilFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnAzTym0kG4j/ysrIirYBtI3ioWNxf/k8M4dQNrK86wcqA1emiGUuZji5YvzfdCSHR0kcCAkw/oMWPWIatjJuBJdJN9hOs55ZCL3oaoDorjKB7qC7dqyO+qxXCGNCMqAx8js1HfGpkxEqLs3d0PWCRUaI9CA1XAO1XI2Gb3lICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8GhtMwK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36785e72a48so580207f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719938727; x=1720543527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1cYREOP31EywM3h1j7bQokqdAVYFNs0tCc9+hVliZ8=;
        b=t8GhtMwK5v6OMokGoZ2KrG75BU5zgnVGWmb1mNaHKPwusEZ0JzzWlZ0ccU+hzrbfzg
         5WG0rxfvIW2EdKT83ouzixsIzeWh8rFAw8fBxOVE4kxLUAWitPHq4lY4yEQlbuceUE4+
         Tg0vjzaR+lB8AKIkoMS7eTHliA0wCPtFSnJFOygUKjNo7i5rls8CWB64ZGXQk7/FI0Wg
         hutunNt53BIlGqCqr6yA0uQgzsTTalhHsunozgaZBTOctVcvjz+aYt+001xBI4msk8fF
         iQOdZyT7y1RY8BNNYTbW9VnprSieAQ1KS+ECXTGYG7+u5Kr4yivsbZmw4GNrvkhSyK0A
         IAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719938727; x=1720543527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1cYREOP31EywM3h1j7bQokqdAVYFNs0tCc9+hVliZ8=;
        b=XG4vzz+zd4QdH165QXPvRVQPB2ZgSwRVMNmZ9j4dGKJWJx928jiE/uvXvQkXe30GmY
         3OiKgBNU/sfClWdVbYP8fACCiYAyBVqqMJHGQOBBIHlS/3+yE4x1zK8abAXAaycx4I+T
         hPoULZYzqzeDB9T3SfDKfFbEhHlasaJdOIecRZ/FJDtpBIG/JQabaOaAQXFVRQD4IkSj
         cNbMziVikbAZ90Do1zrrpAMgi8i9Xiv+/QdxDpBGuCUEm/4fbwoBvmlDs4e50m7+2h2r
         XLdA/JqFdlAnui2WCfPhbQPeShD+ls5c+JB+u78YB+X17alwO+1A8Ze+pY6GSOVMjbZG
         ChIA==
X-Forwarded-Encrypted: i=1; AJvYcCULti7XRmdIr9bvU+YZvO7CHCKsZklgHPE07/JUh6+eG1SkqQO/unOP29qC7EEzp8biZ+uHH1fLVkQYxNSAJL6eMZwvEwbStX+ev3S2ZA==
X-Gm-Message-State: AOJu0YyMplbWRLWQcKb20FQ1t9dIQJ13D/oQACyYFe/BA81IaMnIIhit
	gMgCmMLaZmNJFK6Sz+EKWGQM2G1T/enMIhv15qVo+IvXjTz4JXLU3KrFNSyM+HQ=
X-Google-Smtp-Source: AGHT+IEBWDV+60MU01aANMdE0q8VPO+1pvEuf1/jB7KUviux2SJyGN5NunN+2vpKZtK1cjg9X7ncWQ==
X-Received: by 2002:adf:db50:0:b0:367:880f:b8a7 with SMTP id ffacd0b85a97d-367880fb9cfmr1348950f8f.8.1719938726969;
        Tue, 02 Jul 2024 09:45:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a0fba0bsm13698885f8f.69.2024.07.02.09.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 09:45:26 -0700 (PDT)
Message-ID: <5b2806cd-467d-41d2-b205-e34f9f281294@linaro.org>
Date: Tue, 2 Jul 2024 18:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the
 X1E80100 Temperature Sensor
To: Abel Vesa <abel.vesa@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20240628-x1e80100-bindings-thermal-qcom-tsens-v2-1-4843d4c2ba24@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240628-x1e80100-bindings-thermal-qcom-tsens-v2-1-4843d4c2ba24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/06/2024 10:31, Abel Vesa wrote:
> Document the Temperature Sensor (TSENS) on the X1E80100 Platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


