Return-Path: <linux-arm-msm+bounces-54949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C4A967EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7318218858CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F9527C167;
	Tue, 22 Apr 2025 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="esSu80Sd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CDB278167
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322085; cv=none; b=UMZmHwUE2ciEsWCKXmNEtejJDbF/f9MBlHLR6JLkXHECJZM+9KjUiMldJ4/Q9tebn+i6CJVyc9cFMiRYPERr/UvML3jOycIjiuTwgyMz8cZOdHFjcomgVr17EJSgCbfx1TwqstS0vAn5Cj3V5JMces0IVn+MCpMFCwUPszDFsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322085; c=relaxed/simple;
	bh=cTFqz9KiP/BNOVxP6oYjAxkQuoAR35vO5bCD+dPhj8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9tFIYhQNoCkfkxU2tT65/C7IRx0TSYW0RJjXrq43EmbPmwMMAQcE3bH4RwPrLrs2e++zSq60RdUpHSAlRXkv0OL8bbPMUZ6CU0sZofGxogQqojArAWN+JzUjmHX4iV7S6C6RI0HZAx1JjSFU8QNLaC0m7+26MfRTXfg87cbWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=esSu80Sd; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2994928f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745322081; x=1745926881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2geUynLfZP5GcwsLx6XiSPW2gS1uqnjT5fqaXqswJM=;
        b=esSu80Sdbuz2C/olhVD6P386RBdGHzypoFtG9l7MnhMqFfhmzjX7AnjtFrWhADPiBQ
         q6TrcSIXaUyxrcPoe+KOdykY1YAuJpESg5XJSDRNW23A7MH27FpA6uLbHxcZ+QUwDisX
         0Cfy6SSECTNxYPJme0J6c3kQVGu29ljYKRhXmvyZvfABA79H80uUMBSM/TNh0cb/TPcQ
         688bW2W6Q2uNU21pJSCEWJ701WIr5YEuI76FrMe0oBdhiux7g6hJgyaCZpfqVqr2sqMr
         Ecrl69aHSQcKDexmIgdatS2WXYp3aMyCrJmOIrtGJ/x//F2/VUhylJqDeMEvOyhirNsv
         HMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745322081; x=1745926881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2geUynLfZP5GcwsLx6XiSPW2gS1uqnjT5fqaXqswJM=;
        b=AjNJbFekJadFaXXhgQz0lRkrM2QUFNqB86SSmkVKcpJCPpidtaN0jqdSFV2PVngeK/
         LOnjG3IGcrdxQnedk9wfqtgFxcooPv+6di+v9cnv7aCZRX518U27/4Inx7fqg/sqHOjt
         DzycTzUOf8OmqbvQlYYWnAxgvjOdbYminfY73qcAoJz31a4qHGvDmWZk05XFlISPsevI
         va2x1GxPgL+koiNyH5+oIkfRZGTDGJvhGgupsjcJk8x4KPlJsA1R5CVD18CNex23gjGz
         CTlo2TX8Xi2t77WxZ3iP/UBgKdbiJPBK0vy2ssEh2YX35qTdJTWE+NzAnFTtjbIe7IKd
         OneQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnD6tnnddOvLM4nJpOw+zPjtTbv75V9SLyQJ/F2ZcBb88I/JFMh526AhFvVLfM15ZVPUVfFXOSLfu6U2Jd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzfnp5rN6MBkpCqOdfZ/N3VChVZyvIs+o0F1DprgFdRBIS6EYZ
	XKtx0evuK1Q8EN9MVXF6WXIbds2bhcVhTnqygnfbKjVrVJUVmZDAkPgEhzLSOIw=
X-Gm-Gg: ASbGncvX4908ldXXJtOXnBloH280ERhlFtabZ4UsAp/1BE/aacEDXq9fz1NyWVk1+Zl
	l41a/lIMgsVrpF2bhzyagz1BeTcV4OxJSRkHsbJvoqerXdh2FlP03y5fvjnpbciJP/gsQwQjEWy
	TkrFdXTusnniGLGykw668Vg75EYq0Dl+hn4oTjd1w7Tb5fLfKg+xSWqdX85Fy9a4A7SJp8Mh1XY
	/gxOJFQZhk9GyW5REG9w+INR4IjTtKwofjYubXnxqPfEljWKU9WZFJ6C26Fy2n+hTpu5TkfuW7K
	xnrzzJKhBktn0RSD8FYE0qkbNZwSuwi9EaQS4fzPNkc0caJST4YougcgxF4/MGgEeFhOfdtJEm9
	qPrlCow==
X-Google-Smtp-Source: AGHT+IEVUBG8VdUTIHsn/SScEWB30O9QywXiGr1ltp9dQVSpRWXHvYoHZ4ukfKXtZWxCtX2w6sQUOA==
X-Received: by 2002:a05:6000:2907:b0:39f:d03:f567 with SMTP id ffacd0b85a97d-39f0d03f56amr4499873f8f.16.1745322081558;
        Tue, 22 Apr 2025 04:41:21 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207basm14766595f8f.5.2025.04.22.04.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 04:41:20 -0700 (PDT)
Message-ID: <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
Date: Tue, 22 Apr 2025 12:41:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/04/2025 06:42, Satya Priya Kakitapalli wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SC8180X platform.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>   .../bindings/clock/qcom,sc8180x-camcc.yaml         |  65 ++++++++
>   include/dt-bindings/clock/qcom,sc8180x-camcc.h     | 181 +++++++++++++++++++++
>   2 files changed, 246 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b17f40ee53a3002b2942869d60773dbecd764134
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,sc8180x-camcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Camera Clock & Reset Controller on SC8180X
> +
> +maintainers:
> +  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> +
> +description: |

You can drop the "|"

> +  Qualcomm camera clock control module provides the clocks, resets and
> +  power domains on SC8180X.
> +
> +  See also: include/dt-bindings/clock/qcom,sc8180x-camcc.h
> +
> +properties:
> +  compatible:
> +    const: qcom,sc8180x-camcc
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source

Missing clock-names

A suspicious lack of clock depends here. No AHB clock ?> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +
> +  required-opps:
> +    maxItems: 1
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +
> +allOf:
> +  - $ref: qcom,gcc.yaml#

A suspicious lack of clock depends here. No AHB clock ? No dependency on 
gcc ?

You call out the gcc above.

Could you please recheck your list of clock dependencies.

---
bod

