Return-Path: <linux-arm-msm+bounces-78551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1643C00AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 13:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D72703B16CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EBE30DD2C;
	Thu, 23 Oct 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DG6XPpgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A6C30CDBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 11:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218043; cv=none; b=W1iykJ/TZywmWyG50jK7QyGb4I1Ysa9gcjQ2bK4uLHtpiDlTHIF/bLH8/21OLmJyZdwivwbDK3l7D0+K63Qx90F5yEoXDur4o5ipGQkwjSXspTaiEBsQrrihiI0OXVa/BGesuU431voQqhFAWwKBm7nlNOMJqHawmMTmH0BVQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218043; c=relaxed/simple;
	bh=Xd2oFztkHA1Q2+4oN13MbfhKhMmhNS3MhkJQtZ1wae4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbvHspN2esGcInNt8JP8dAo9P7t3ejWMVDZ8s7pEEPleGlb9e0fypaIOmIH9G6KN2ppVrrVt3BE3SpLG5Af6AD4RG5i6v42FAXSnfBmXQNmFUeoeVmlj/5ggSUp2Z4+lecrI/8gtQirgwBJTOGrVDybf57CjVNsiw2qpcLrKwR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DG6XPpgK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57e3cad25e8so196840e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761218039; x=1761822839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NnriRC9eaGPaTyOosu675gl9jkYjYRUomRRP0nsD1w=;
        b=DG6XPpgKrSdWg/qJ78mFPDnklvXWev/pwkWLJOKXf90/xKky/TeWTCeOKwMzNwAyGC
         Fnx/LoYKCLfeMA4iE9EysX4Yc073NyZgyQ0F9m4wtEbQDputNK00bhP6GJVWn1WVFaeB
         9Rl/7VSgqHW+ftOoX78UEL1tY5kjf9LZTB1sUNm6CjEk+/FC7ansnmuWhbKdqgtl4yga
         q0ceNYpU7gzHZoxW3MqVWfxkdwrE39iQTnxJSPstAABQvOA4s3/VTC3tl5E3epIiY4Sw
         4kyBlkRM3LmvHdkwfkxWEDUXiopgU4MSAmABCwKUXGDDnY7Y1spN4DvAFXmke4fL0pFX
         OHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218039; x=1761822839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4NnriRC9eaGPaTyOosu675gl9jkYjYRUomRRP0nsD1w=;
        b=q5BVS3AIFW0svg6zrXPOYESZvvfsbFa76zVcfNmjeM6BmCpIMamkCac71/hyS/u87c
         qQTeK4Umu3SdfPrsufI2a9gWKeUy8n4C5/zYUyO5aYdgBIjkJsHoMAaAQQNbOFrT6QzK
         Ft41ZKG0XJvxP4+mch8NYCCuGqicADeF1AZvXPkWukB0O+8zggoKU1IMCZVPaL5uSF2O
         tCusGuOpU9YVu6t0uU8nJNN+S8+zgqc+0zFfnUtL/dDM8OKv8i66TciB92EGanH9xbLp
         keP8yHCR0Rto9c6C8AOK+/0UwdS/TDJtyGH3wE8iC5JrUlrVbFmmzi5+AmegQVUmwHuV
         rqYg==
X-Forwarded-Encrypted: i=1; AJvYcCWkcQB45ZrcC7U+FD+Z3vjxfu5rSvKLQAucD27NAia6o7ZGyvzLOG8zLdYl2LMmMlE3GRRHr8qJLprIOhgL@vger.kernel.org
X-Gm-Message-State: AOJu0YydeFaHlq3mD0SibU2RxEgp9C7Et8SP0oF71hn+YG52sEIhic8b
	Rl/ABc35hnR/vKoD0jXKt1e5MQmpaf7hSCoMUEjXZVfNps4G73B2D/JRl+76MNKrc+s=
X-Gm-Gg: ASbGnctA7HfWie9kDnrvHZzjDgL3WJKvCztKi9NK93Gd9HzGnhZVhEG7UbDQnnfmiWi
	Pkn4rhTF2hrfouyfG4oIEg8g9LIOwIo3eZZTV9cDYyRxLO0FT9LnZzg8dtZJDxhN3amwUqRmZR5
	IZg61lbsZJN5aa7Xm6REZYC9KZv0EJxkwW9jovkNFW2RbiHbkHoF0ryJMWeSoopDhc3z8bSkU2O
	4lu/g11jC5DF8QXLJ3X7LJV//aAsqFVFU+fUsE3vmIUR+1pv6h/1RH5wQ8m7PdCTKk8Zrm9qWJ5
	k5e2hCQAj/XMZDQbtav28mFThI7Yes0R0W1O+FE/vhvoX2is9AefTxB78l5zT8UTE7boUvf8048
	jus6CK6/Z3IkWOIvjXAx8QOGbjB480i2X9HfMs1VCC3uso2+W09Fo43dl4LAGvfLmac0MSuogOW
	3eQM4aFwAbsVxVLCWJ/wpTe2Hqufih0NdHL9HciT+vs5qrFY3QbZ2p5Ig=
X-Google-Smtp-Source: AGHT+IEzgWJvYGBcQF2ghyYuGuGA1AUq1vVSVuceN2e2JnaCFLqWBkxRqBMih2S4N5OXUxtsHRZnFQ==
X-Received: by 2002:a05:6512:b85:b0:57a:6d7d:dd74 with SMTP id 2adb3069b0e04-591ea28dc85mr1817576e87.0.1761218038545;
        Thu, 23 Oct 2025 04:13:58 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d2c8c4sm650021e87.93.2025.10.23.04.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:13:58 -0700 (PDT)
Message-ID: <24b6ce21-aaff-4ecd-8cd7-42df71cfd222@linaro.org>
Date: Thu, 23 Oct 2025 14:13:50 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
 <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
 <b18fc946-a249-481a-b727-7d3e49d47f8e@linaro.org>
 <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d4b8cd74-0b0a-4fc8-8ed0-a9023a516b58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vijay.

On 10/23/25 07:52, Vijay Kumar Tumati wrote:
> 
> On 10/16/2025 5:27 PM, Vladimir Zapolskiy wrote:
>> On 10/17/25 02:53, Vijay Kumar Tumati wrote:
>>>
>>> On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
>>>> On 10/15/25 05:56, Hangxiang Ma wrote:
>>>>> Add bindings for qcom,kaanapali-camss in order to support the camera
>>>>> subsystem for Kaanapali.
>>>>>
>>>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> ---
>>>>>     .../bindings/media/qcom,kaanapali-camss.yaml       | 494
>>>>> +++++++++++++++++++++
>>>>>     1 file changed, 494 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..d04c21103cfd
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>>>> @@ -0,0 +1,494 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>>>> +
>>>>> +description:
>>>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm
>>>>> platforms.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,kaanapali-camss
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 16
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 34
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: camnoc_nrt_axi
>>>>> +      - const: camnoc_rt_axi
>>>>> +      - const: camnoc_rt_vfe0
>>>>> +      - const: camnoc_rt_vfe1
>>>>> +      - const: camnoc_rt_vfe2
>>>>> +      - const: camnoc_rt_vfe_lite
>>>>> +      - const: cam_top_ahb
>>>>> +      - const: cam_top_fast_ahb
>>>>> +      - const: csid
>>>>> +      - const: csid_csiphy_rx
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy0_timer
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy1_timer
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy2_timer
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy3_timer
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy4_timer
>>>>> +      - const: csiphy5
>>>>> +      - const: csiphy5_timer
>>>>> +      - const: gcc_hf_axi
>>>>> +      - const: qdss_debug_xo
>>>>> +      - const: vfe0
>>>>> +      - const: vfe0_fast_ahb
>>>>> +      - const: vfe1
>>>>> +      - const: vfe1_fast_ahb
>>>>> +      - const: vfe2
>>>>> +      - const: vfe2_fast_ahb
>>>>> +      - const: vfe_lite
>>>>> +      - const: vfe_lite_ahb
>>>>> +      - const: vfe_lite_cphy_rx
>>>>> +      - const: vfe_lite_csid
>>>>
>>>> The list of 'clock-names' values is not alphanumerically sorted.
>>>>
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 16
>>>>> +  interrupt-names:
>>>>
>>>> Missing empty line to separate properties.
>>>>
>>>>> +    items:
>>>>> +      - const: csid0
>>>>> +      - const: csid1
>>>>> +      - const: csid2
>>>>> +      - const: csid_lite0
>>>>> +      - const: csid_lite1
>>>>> +      - const: csiphy0
>>>>> +      - const: csiphy1
>>>>> +      - const: csiphy2
>>>>> +      - const: csiphy3
>>>>> +      - const: csiphy4
>>>>> +      - const: csiphy5
>>>>> +      - const: vfe0
>>>>> +      - const: vfe1
>>>>> +      - const: vfe2
>>>>> +      - const: vfe_lite0
>>>>> +      - const: vfe_lite1
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: ahb
>>>>> +      - const: hf_0_mnoc
>>>>
>>>> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml
>>>> etc.
>>>>
>>>>> +
>>>>> +  iommus:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  power-domains:
>>>>> +    items:
>>>>> +      - description:
>>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch
>>>>> Controller.
>>>>> +      - description:
>>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch
>>>>> Controller.
>>>>> +
>>>>> +  power-domain-names:
>>>>> +    items:
>>>>> +      - const: tfe0
>>>>> +      - const: tfe1
>>>>> +      - const: tfe2
>>>>
>>>> Please remove all 'tfeX' power domains, they are not going to be
>>>> utilized
>>>> any time soon.
>>>>
>>>> When 'power-domains' list is just a single Titan GDSC,
>>>> 'power-domain-names'
>>>> property is not needed.
>>>>
>>>>> +      - const: top
>>>>> +
>>>>> +  vdda-pll-supply:
>>>>> +    description:
>>>>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>>>>> +
>>>>> +  vdda-phy0-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy1-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy2-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy3-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy4-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>> +
>>>>> +  vdda-phy5-supply:
>>>>> +    description:
>>>>> +      Phandle to 0.8V regulator supply to PHY core block.
>>>>
>>>> What is the difference between vdda-phyX-supply properties, why do you
>>>> need so many of them, when their descriptions say they are all the
>>>> same?
>>> Each of these supply power to a specific CSIPHY and could be different
>>> based on the board architecture. But I agree that the description should
>>> probably capture that than just relying on the name.
>>>>
>>>>> +  ports:
>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>> +
>>>>> +    description:
>>>>> +      CSI input ports.
>>>>> +
>>>>> +    properties:
>>>>> +      port@0:
>>>>
>>>> Please use
>>>>
>>>>       patternProperties:
>>>>         "^port@[0-3]$":
>>>>
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI0.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>
>>>> Please remove 'clock-lanes' property, it is non-configurable, redundant
>>>> and tends to store some irrelevant value.
>>>>
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>
>>>> The 'clock-lanes' property is expected to be removed.
>>>>
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@1:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI1.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@2:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI2.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +      port@3:
>>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>> +        unevaluatedProperties: false
>>>>> +        description:
>>>>> +          Input port for receiving CSI data on CSI3.
>>>>> +
>>>>> +        properties:
>>>>> +          endpoint:
>>>>> +            $ref: video-interfaces.yaml#
>>>>> +            unevaluatedProperties: false
>>>>> +
>>>>> +            properties:
>>>>> +              clock-lanes:
>>>>> +                maxItems: 1
>>>>> +
>>>>> +              data-lanes:
>>>>> +                minItems: 1
>>>>> +                maxItems: 4
>>>>> +
>>>>> +              bus-type:
>>>>> +                enum:
>>>>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>>>>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>>>>> +
>>>>> +            required:
>>>>> +              - clock-lanes
>>>>> +              - data-lanes
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - reg-names
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - interrupts
>>>>> +  - interrupt-names
>>>>> +  - interconnects
>>>>> +  - interconnect-names
>>>>> +  - iommus
>>>>> +  - power-domains
>>>>> +  - power-domain-names
>>>>> +  - vdda-pll-supply
>>>>> +  - vdda-phy0-supply
>>>>> +  - vdda-phy1-supply
>>>>> +  - vdda-phy2-supply
>>>>> +  - vdda-phy3-supply
>>>>> +  - vdda-phy4-supply
>>>>> +  - vdda-phy5-supply
>>>>
>>>> Please exclude supplies from the list of required properties.
>>> One of these supplies is required based which PHY the use case is being
>>> run. Can you please advise how to handle that? Thanks.
>>
>> 1. Please rename all of them, reference to qcom,x1e80100-camss.yaml,
>> qcom,qcm2290-camss.yaml or published on linux-media
>> qcom,sm8650-camss.yaml
>>
>> 2. Remove all of them from the list of required properties, and in a
>> board
>> specific dts file add only the neccesary ones, that's it.
>>
> Thanks. We will try to follow the same for rev3. Just a caveat though.
> If, for instance, two CSIPHYs have different 1.2 supplies and they are
> required to be operated concurrently, it may be is a problem? as we can

It should not be a problem, you can add two regulators, and it's fine,
anyway all of them shall be optional properties, because it's unknown in
advance which ones are actually needed.

> put only one of those in the board specific DTS for the 1.2 supply node
> (ex: vdd-csiphy-1p2 in SM2290). Is it not? However, if we don't have
> such a use case requirement on the upstream may be it's OK. Thank you.

Link to the published SM8650 CAMSS dt bindings, please follow this model:
https://lore.kernel.org/linux-media/20251017031131.2232687-2-vladimir.zapolskiy@linaro.org/

Please note the chosen naming scheme, when the supply property names
follow the SoC pad namings one to one.

-- 
Best wishes,
Vladimir

