Return-Path: <linux-arm-msm+bounces-51070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2051A5D20C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 22:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3247117AFEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 21:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA70C264FB3;
	Tue, 11 Mar 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/yhf+Ow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855D264FA1
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741730041; cv=none; b=beRIAyuTEZ68heFHS5hEtUPJRbgx5oR81NZG44hEhZxIfNcgHcbqqTEnq7fe0cpRZhJAT5pzbH9IjbGSrEs1md/YM1TtvICqEtZ56pS61If68K7fp0tq4YvIkkIalT5cZSlNSo4Y/0nR0y7E4ovABeuppM3zzaoHkJJihdrantU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741730041; c=relaxed/simple;
	bh=ZgzE4thBCoSTa+dcViXPcQn5/G3IUHp1o/3wzyNpJ6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwDT0Srli8yedhueEDaGwNmW3ZkXXax2pu9ZC30fZOmNLDj5uiNaWF757POu5RYsv/Inuj1XXiK74egHiRFUbNlcrqL6Btki3ysQTBosVq1/qCdxzaGFhBwLY0bibxNtKngEjqXh8zo3HHotjsC9gTKbDn14AZ6l+5h2Prvb+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/yhf+Ow; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf9edec80so3451871fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741730038; x=1742334838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5gsB+0yYh8xE9yPNlTczFYo/dqiaFhvnnAdkeUoWJg=;
        b=f/yhf+Ow6qLnHeu7fpBARK6iQQyRmHWvFObl/a0hci1teamJW+UNUazoTQxxo7esNl
         arQvnfnn6Eq+GUuglGzFjCRxlPy3bGNrmpA7ZWCmnuNPB9lsq6CTUuQn/n6i1o4XdJpZ
         WYP7WVSZou2lt+5F8OHTinmJSjsNNe/IaaQ2XeS7BNvGbr4MUehdokjGbMjXFobxE1qL
         cwTYeXwwdp9u+Kz/q5/1SuPIPxv3hIvJwvOTEHOTzO8tYdmtCoYFq/nw8w7PxTh9YWrg
         R25eUG17re6Scd0jjMyQ6S5xoM6tAYGXlJn4JyxKoFswjSCyDehZf/Dg9nsICyE0UNn+
         wQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730038; x=1742334838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5gsB+0yYh8xE9yPNlTczFYo/dqiaFhvnnAdkeUoWJg=;
        b=tLOR+zfXbf7uvZ9CcGzB2Xn9jjp9jOKKHtNdWSlmP2RbMI9jXP3s5F7+8TIvY1FkgA
         y0/NDg4YzkEDb0FO2smnfGnhk8mRkD8nEVhap+glujeCdsy8Fxe93vNcannQ7fY2Zoc3
         gJS2e8wubXNZstX1Cd8Ty+6HE4imJY1xEIKjfqGQwrio5BTQm67+NarOUaWXSwoEaqv5
         +syUP/UsbZAs9D9PR4yf2yU4v8FEP3wgtPHQnlx5EE41g5004ZbR+tMqLeG12M1zr76S
         RRkodsGmu9/D1zP0wegBs3w5Ws/6dT4OkkCZQM5Dy9OWY8rzE1MWBNF3K1uV71bbNw1S
         H6PA==
X-Forwarded-Encrypted: i=1; AJvYcCXS1tm7xHs8qpD+xQb9+KGRXJtNge2t0DxpGDoJMICJlsJ70p2cUj3OG3V3m3cY0eh0e3WWfPxyB8xiHL8D@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn24V/+gAEGtW1UsKWig9lpaY9L5glny/HHF1+tULVS0R7BagM
	LtK+Pa6f9uoyh6+0Su5/WQ2A8UMrFK+6e6s9XU07Dn4sg441bL/B5bLSkkl8ki8=
X-Gm-Gg: ASbGncu85hkcHbz/4+eNUHOmOIKnBxBLBM7EhejL0QDjcK2Nz6qBKM+g+JOyUi1876I
	0ozUzQMTUbcSJtfNG0UKWpdI3gXXdwcOQoKlpH8pKQqMkrFrtmxg5JpFgJ9ReryCW356ExPR19Q
	J3D5ObAZfk+gcl/nEb2qi3w/SHP4BS5pi4dpNY7090xUwaXUqnFLyUnACYw3faBjvE6vb3vsM4S
	oXvkTsGEPDQDrneMQIau6Wy7dM1/n3rcpKAVvNL4UCT/8t85pt/f7YLNdOn6zv64hTmKb1O/xhM
	KDcfaP8jQ8ezqyzjHYqBDucpiGaU1jSWChzyd1yVGWVK6jzqYliclalq7I6IqJg3EhJ6EJ5jKYR
	X0M0pNMZJrOoy6GZCEb+KThn9aovFGui+2g==
X-Google-Smtp-Source: AGHT+IFMqD7MP0QO68gqxLROvT5NFpnEwxTOzpskeLzkJrA9xPbwOTw4OmpOx0RaAr9lWptyIlaMyw==
X-Received: by 2002:a05:6512:3b10:b0:545:6f1:948d with SMTP id 2adb3069b0e04-549abacc9e6mr613771e87.7.1741730037032;
        Tue, 11 Mar 2025 14:53:57 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae462c6sm1910515e87.4.2025.03.11.14.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 14:53:55 -0700 (PDT)
Message-ID: <70d6acfc-739a-4c0a-9087-77e16c6ac989@linaro.org>
Date: Tue, 11 Mar 2025 23:53:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: media: Add qcom,x1e80100-camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-1-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add bindings for qcom,x1e80100-camss in order to support the camera
> subsystem for x1e80100 as found in various Co-Pilot laptops.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

<snip>

> +
> +  reg-names:
> +    items:
> +      - const: csid_wrapper
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: csitpg0
> +      - const: csitpg1
> +      - const: csitpg2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +      - const: vfe0
> +      - const: vfe1

Here I'm a bit lost about the selected ordering rule, I kindly
ask for a clarification.

In ASCII the underscore symbol '_' goes way after any 7-bit symbols
including '0' and other digits, but this is violated in the sorting
order above.

The expected sorting order would rather be like this one:

   - const: csid0
   - const: csid1
   - const: csid2
   - const: csid_lite0
   - const: csid_lite1
   - const: csid_wrapper
   - const: csiphy0
   - const: csiphy1
   - const: csiphy2
   - const: csiphy4
   - const: csitpg0
   - const: csitpg1
   - const: csitpg2
   - const: vfe0
   - const: vfe1
   - const: vfe_lite0
   - const: vfe_lite1

> +
> +  clocks:
> +    maxItems: 29
> +
> +  clock-names:
> +    items:
> +      - const: camnoc_rt_axi
> +      - const: camnoc_nrt_axi

Okay, there might be some explanations about the underscore symbol,
anyway I would appreciate to get them, but here it's definitely
incorrect, it's very unlikely that the symbol 'r' precedes 'n'.

> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cpas_fast_ahb
> +      - const: cpas_vfe0
> +      - const: cpas_vfe1
> +      - const: cpas_vfe_lite
> +      - const: cphy_rx_clk_src
> +      - const: csid
> +      - const: csid_csiphy_rx
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
> +      - const: vfe0
> +      - const: vfe0_fast_ahb
> +      - const: vfe1
> +      - const: vfe1_fast_ahb
> +      - const: vfe_lite
> +      - const: vfe_lite_ahb
> +      - const: vfe_lite_cphy_rx
> +      - const: vfe_lite_csid
> +
> +  interrupts:
> +    maxItems: 13
> +
> +  interrupt-names:
> +    items:
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy4
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe_lite0
> +      - const: vfe_lite1

Same as above.

> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_mnoc
> +      - const: cam_sf_mnoc
> +      - const: cam_sf_icp_mnoc
> +

--
Best wishes,
Vladimir

