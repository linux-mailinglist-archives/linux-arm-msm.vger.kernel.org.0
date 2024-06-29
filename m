Return-Path: <linux-arm-msm+bounces-24710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013691CC31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 12:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDB1028252F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 10:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0473745022;
	Sat, 29 Jun 2024 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NKR68Z2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933342076
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719658662; cv=none; b=iP1LQEp/ygFu8gHOhpNGaQnonfOrkFWOUoTRBG1+OvTP+7Lj0sLmvFkzf1VcxgJanRrXjIkqh5PgRY+Au7FzZLGmJ5gXTpmIBDi8wIZ3ELGqdh2WQfCtFWYrcrJo2tlaeO6M26kHNvLOFvmYspc8Uh/GkyEaWnQst+06iRooWMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719658662; c=relaxed/simple;
	bh=gjzxog3Mb8JMf2rUUMDAlM7leBu6VGGWWpEbchnY51E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k7r7LlsqnQn520gEIPw16jLBdxr97RZyutdF2xTOAcVrM1MwvhYLbC2iDWWSqjJwVpfqoI0Dm57G4bxlE+c7U13HpFJPaH9NxWqv5JURDu9aonNgkEOfqy9bb8QZ/GANnRVbIDsdNhGKnZ+XmHKxJFQu2MtycUtYdLbJURY/U8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NKR68Z2C; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-36733f09305so778264f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jun 2024 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719658659; x=1720263459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPzoYFWOBijSuxNipZNf1hsOuMejTmHC//0xYNGUiGY=;
        b=NKR68Z2CbXCMYL8XTjpyN+Z6NUGxVRMV96hHjoQLNgOYB8glg4UoAnWwqM5M+8pvM9
         RFnaow2V2sb57QbZQX7uH2lX3x61v9y/ep7lXfZenIgi4W8ZxjCy8mrPdcbfzAEZ0aSt
         wffnDB3VgWkWY/qB6XPZuMAHEV8Js4FK15Mn6RYi6z77CGNOqbZCja3m4U+uRB2WU4G7
         uoidFx74I0UBldDRQvwfIuCgm1dZqeEv2VE+PY0cGNXcwmC0NOEfj87LJEff/LhztnwH
         1YqQg9bW2Cq27lN3dRyAHFxMIpPdWK+Y4EDuTcUZIGIum6Y3sk5iEB+Or2JyrVbhP0Fv
         yCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719658659; x=1720263459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPzoYFWOBijSuxNipZNf1hsOuMejTmHC//0xYNGUiGY=;
        b=vRYdfR9sL6Gii6mjmOqqcbVp+3hhTuOzt6diFqmsctRRmOzFkXHymRCil6xHwhFvp+
         iFOrYJFwbMen7k6hPpLgLjzMqv/VuIcvZOa6OUE0/PHZgRTtBYpQybABtr3fLW5dmzRp
         PUFyY2CEuU74/gFejRfiXoiN4huth9nfY6Edyon5C97FrmOAFYoGdyIgUcMCtiEzd+tc
         5hBZLmfDOdiJwMsSBKkDZmEX+fW1oQR/kDgb9drUiO7C9yhviiDiZ1Pd+S7q62juEzZR
         GjL353z6VhRTtzr8la6dQXmlrY/wf1GvVwjQnttLQ/xHhDrL4ptyQswvC6hJm1HqAfiM
         Yjbg==
X-Gm-Message-State: AOJu0Yz3zoazEizJAm6LCt6x+iz/ZfnXWm7qs5qWPn9qJXb13PjMgkWY
	A/wT0b97mbahJdNN3YqFqzST74nDiSZowRsq1SqnNUPnoAjy7TeEoStlpzhj9/A=
X-Google-Smtp-Source: AGHT+IGoM/9KSNdxFL7CwwE4+Ftp75/mDJK5QMpVY+2F6WHOPdSUELuNgowwn+bUUJXWyTo1CjDgqQ==
X-Received: by 2002:a05:6000:18aa:b0:367:4ddf:385c with SMTP id ffacd0b85a97d-36775699491mr511746f8f.6.1719658659384;
        Sat, 29 Jun 2024 03:57:39 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a112a54sm4598514f8f.115.2024.06.29.03.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 03:57:39 -0700 (PDT)
Message-ID: <94810ad7-a6e8-4e25-b158-3065c1ab0294@linaro.org>
Date: Sat, 29 Jun 2024 11:57:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7280-camss binding
To: Vikram Sharma <quic_vikramsa@quicinc.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Suresh Vankadara <quic_svankada@quicinc.com>,
 Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
 <20240629-camss_first_post_linux_next-v1-1-bc798edabc3a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-1-bc798edabc3a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/06/2024 19:32, Vikram Sharma wrote:
> Add bindings for qcom,sc7280-camss in order to support the camera
> subsystem for sc7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,sc7280-camss.yaml          | 477 +++++++++++++++++++++
>   1 file changed, 477 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> new file mode 100644
> index 000000000000..588c6fb50e2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -0,0 +1,477 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +
> +---
> +$id: http://devicetree.org/schemas/media/qcom,sc7280-camss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SC7280 CAMSS ISP
> +
> +maintainers:
> +  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
> +  - Hariram Purushothaman <hariramp@quicinc.com>
> +
> +description: |
> +  The CAMSS IP is a CSI decoder and ISP present on
> +  Qualcomm Technologies, Inc. platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7280-camss
> +
> +  clocks:
> +    minItems: 41
> +    maxItems: 41
> +
> +  clock-names:
> +    items:
> +
> +      - const: cam_hf_axi
> +      - const: slow_ahb_src
> +      - const: cpas_ahb
> +      - const: camnoc_axi_src

You almost certainly don't need to include the "_src" clocks in the list 
of clocks since the CAMCC driver lists "someclock" as having parent 
"someclock_src"

> +      - const: camnoc_axi
> +      - const: csiphy0
> +      - const: csiphy0_timer
> +      - const: csiphy0_timer_src
> +      - const: csiphy1
> +      - const: csiphy1_timer
> +      - const: csiphy1_timer_src
> +      - const: csiphy2
> +      - const: csiphy2_timer
> +      - const: csiphy2_timer_src
> +      - const: csiphy3
> +      - const: csiphy3_timer
> +      - const: csiphy3_timer_src
> +      - const: csiphy4
> +      - const: csiphy4_timer
> +      - const: csiphy4_timer_src
> +      - const: vfe0_csid
> +      - const: vfe0_cphy_rx
> +      - const: vfe0
> +      - const: vfe0_axi
> +      - const: csiphy_rx_src
> +      - const: vfe1_csid
> +      - const: vfe1_cphy_rx
> +      - const: vfe1
> +      - const: vfe1_axi
> +      - const: vfe2_csid
> +      - const: vfe2_cphy_rx
> +      - const: vfe2
> +      - const: vfe2_axi
> +      - const: vfe0_lite_csid
> +      - const: vfe0_lite_cphy_rx
> +      - const: vfe0_lite
> +      - const: vfe1_lite_csid
> +      - const: vfe1_lite_cphy_rx
> +      - const: vfe1_lite
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  interrupts:
> +    minItems: 15
> +    maxItems: 15
> +
> +  interrupt-names:
> +    items:
> +      - const: csiphy0
> +      - const: csiphy1
> +      - const: csiphy2
> +      - const: csiphy3
> +      - const: csiphy4
> +      - const: csid0
> +      - const: csid1
> +      - const: csid2
> +      - const: csid_lite0
> +      - const: csid_lite1
> +      - const: vfe0
> +      - const: vfe1
> +      - const: vfe2
> +      - const: vfe_lite0
> +      - const: vfe_lite1
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: cam_ahb
> +      - const: cam_hf_0
> +
> +  power-domains:
> +    items:
> +      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: IFE2 GDSC - Image Front End, Global Distributed Switch Controller.
> +      - description: Titan GDSC - Titan ISP Block, Global Distributed Switch Controller.

Please name these power domains.

https://lore.kernel.org/linux-arm-msm/fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org/

---
bod

