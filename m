Return-Path: <linux-arm-msm+bounces-17214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D658A0F00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAE301C21EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 10:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B1C1465A6;
	Thu, 11 Apr 2024 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uw6+JLhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C892140E3D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712830803; cv=none; b=BMXpuZRhlkAefDOVmPKmG6k6dxU7GQPSyOb8jz5VtJ2qx1WW9rWZriGkuad5NXg53uaUiKCBYidecxbPwV2dKAvGX4bOv23aOS2F4QPBn3ITRs7jGstlQRR/+wSExjCRzkovSNRfJQscQirObwMeuSoWdLo9tHlhYCOOogZ7jYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712830803; c=relaxed/simple;
	bh=7neA6WW4WRLl7mKNbn+9gp5ybC0OC4IaScQHI4tz2eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHVd5lAx1279+9VdWZbvRGTkJUmnNQdDBzwz9BDDfZ8pJB+ca6Xow7Tqz0JiFL+IPk5IPXMUIocQJA0jz9NfKvYyXXb1gkNivLpI97gJvWDPEobZV8rM4zjbkPVTYnsAVzIjquAjigJokDSj4X7ZPFOLaSYPWNLp3G5vkneYJIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uw6+JLhI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343c891bca5so4899467f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 03:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712830800; x=1713435600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahLDsVjiZ+H2VO47WR5tZ5Ke+e0FYqnQEaGeYBSthJ0=;
        b=Uw6+JLhImv03AFnUzJnF0q67LwiUKCnq0+KFCSGkgOUUAWLgEkkPiayhUPqMYMkQZ9
         pIT77T0wVjDXe5IlPw/RHHvJC5p03/hc79F0KuprDdURuQoLg3ByODG5iCO2R/U3KgUr
         +6S4p97Pz7U/bSteNLbJWtIO2CrtqLeGzYZLB8mimdZAzyG2Jy0OOCGYT/PjgGyMf2Vi
         Ehcc/yfF1VG9VDXTtVdYujkFvRhgVbl0DgHfewAopV/GE+iI6vHw/aqubUiEkrzFS+Yu
         OBYGUlb0fjJuNZafhdpj8zX6IwcEe5GmNvT4IBrUQIIyabWGP+WkFtARiPs/k4LquVuu
         mtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712830800; x=1713435600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahLDsVjiZ+H2VO47WR5tZ5Ke+e0FYqnQEaGeYBSthJ0=;
        b=W71gKBJjWVpGHI0JdzYs1HbJ5VoA1jBoDzY9zIX+3x+j4HRXBhZVQMGBPz+rLjG79h
         sJBJet5NvHH9eCNyIA0HKuHKO7t37CqjF7z90onFsDVvE7e5gVLuKDYYzrjvsT8zmvmd
         QAQqGQO/e3/fkxuWN1BneWZMvJZ7fztC2hBNJmHl3c4o4S7Wsgte0M8YfyEk+T2/nLpR
         AMu02SLJiE6WV9DerqorjqDZIVphH7gWj8Jln9BV1n29ICeljkaKL6DfyOzgvazQaLaH
         nMp8qcpC7XtnKZODzs/0UeITglGJSVtxhpsB+IDqnrcTBx4lBy5JZOfoN1azwZ25UKEE
         X5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW7y/DkOP7rkyEhR6uaSP2B++aD0glTvscrVWs/4cbdsZwjh3ULmhqx+cN5hfv7wM+68wmUe1gvh4+KE1zdcMDrwzZe/v1sToKVkWq9fw==
X-Gm-Message-State: AOJu0Yxn6614BNa/p0aw64EhrqDA4poBS2XZ6ZtXPaSXMNDUcOjJZ7Px
	a0GakX0SFPxyYfdW0qGfENdqHlRnkDxenxTTUTv3QkodRzeUkbrX4IMZagagJ4E=
X-Google-Smtp-Source: AGHT+IFINgr6EUAWs13ks5LI2HK47oRZIKXdHnT3h1ag5Th5XQgYBXvR3y7Lh0ftwWncvt9aq6D2iA==
X-Received: by 2002:adf:ce05:0:b0:343:9f03:ccf9 with SMTP id p5-20020adfce05000000b003439f03ccf9mr4467650wrn.22.1712830799792;
        Thu, 11 Apr 2024 03:19:59 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id z11-20020a5d44cb000000b00345920fcb45sm1432517wrr.13.2024.04.11.03.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 03:19:59 -0700 (PDT)
Message-ID: <ece55350-ae8d-4533-b9fd-02f496db0468@linaro.org>
Date: Thu, 11 Apr 2024 11:19:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2024 08:49, Vladimir Zapolskiy wrote:
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names = "camnoc_axi",
> +				      "slow_ahb_src",
> +				      "cpas_ahb",
> +				      "cci";

So..

You still need a new compat for this clock list right ?

Current options for clocks which need camnoc_axi are

   - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,sdm845-cci
               - qcom,sm6350-cci
     then:
       properties:
         clocks:
           minItems: 6
         clock-names:
           items:
             - const: camnoc_axi
             - const: soc_ahb
             - const: slow_ahb_src
             - const: cpas_ahb
             - const: cci
             - const: cci_src

and

   - if:
       properties:
         compatible:
           contains:
             enum:
               - qcom,sc7280-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
       properties:
         clocks:
           minItems: 5
           maxItems: 5
         clock-names:
           items:
             - const: camnoc_axi
             - const: slow_ahb_src
             - const: cpas_ahb
             - const: cci
             - const: cci_src


Also suggest you should look into dropping

slow_ahb_src
cci_src

May not be technically feasible though I accept.

---
bod

