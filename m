Return-Path: <linux-arm-msm+bounces-49602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43DA473D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92AB3188AF05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 228141E5207;
	Thu, 27 Feb 2025 03:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1RW+1ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C22111BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740628439; cv=none; b=p6OvaagDN6lld+n0MmGIH+9iNeDOFZIyFJ0pjXe4pQXVulOUPFscmFXnXq7nzAazIy9Lz6uisErjIF5KTKZC4K8E1eSefqleh76olZpPqyjwN0HSrhm9D++mSEePZSvOM+r0amfu4l/W9UOfquFThm4R3T5sGG9oef8s1lpNb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740628439; c=relaxed/simple;
	bh=u/foCfHoF4Hhis1COb7ssCDiziDNwwO0Pz383KIp1gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGxWJWJ611WuAzdXnIbZ4DE9nIKpatFo04vHofq2W08xA5cbIvEFSFPvDPu2u7hTjJl9SXgo6jfDuCBsx9zoJwtgvztawxo+K5tmHAzDXMkZ0H41waOG9/Biti2BM+7aCZirDq41BBZg1wSrcCwXvSK8Y9dm01CuoJlHA8AHzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1RW+1ID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R2KTtg000444
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4tn9hxlyuN0T8oneJTvd5298cAkhX5piGDV4+xPeq0=; b=J1RW+1IDWNGC0D+h
	REZ7g99Ou5r4gIlLfbwJt8wY3RgkRyjWvJcLMLYz1hgNnj5B9x2K3p4LIh8qhqNN
	oU3wNYaixr2nM6IY5KkIeDyl0ANj1Ds7nwScGlK4s93LQY9rbRCe9gbGtidcAa6O
	IlILH1PBFYyqtQeVquLKeRgl7Gr/h4YsXrSp3HO57olhcUDyxiPHPvcFupr2Baxg
	nFwJjK/a9xhqO1dgJhL6aQBxX5BodzRe7faO3J2x7bw0pPVSRtz8l94SiKymABRG
	sok+zdeYhh47HYCPZakyZvPSM+8OyoMPc8mIuuSj03GzdUu2tJFf1LV8Exlnevus
	h54w0g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4522skt82n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 03:53:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220e04e67e2so12631245ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 19:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740628434; x=1741233234;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n4tn9hxlyuN0T8oneJTvd5298cAkhX5piGDV4+xPeq0=;
        b=dSrvgwNp+8mGM+91rrYSTlhIDBhoFdnlgMLvHWgfTI3Nc6izzw99LJT+COepgYIQwR
         tD/e/Z/dJRZc/nyClRA2UW5OiX8wSIrwhkg8Lbgre8kBIBldCJ04nXrUspDZZe0luKj7
         4gH8+/DA+hzZS94bNKv4jtb6YAPNxe4ZBcjXPPCQygYziHwl4UFW0iyapM97xeqX7zyW
         tmtu1lkFv6hdvQZkH+uUuiCj3ag7sqqOhGwwH3CCvpYhaw1AA/iHQ2Vqe4QG/l0vtb/H
         mE+1ngHI4ohBySDuBMzjAtPzQZ7fJk2tgGI13wHcA2ahCJ5X68jebKsqfg9uTa+bq3QJ
         +i5g==
X-Forwarded-Encrypted: i=1; AJvYcCWlEf5Qbw0Ag5kfaoO7QEO8HH6ofVw5zuXvTlqpYeUrDK2x3WXPFM5Chb7IxNrishhKcjKO4Cfnrm24rTW+@vger.kernel.org
X-Gm-Message-State: AOJu0YyfiWcehKKRFkbk6uEM2FB/VPqNoVgU0xAbQ4c7JApT57PkaoND
	HJoNO6lHc1RXV4gyqZYp/7NJjXwC1my545levdHctCl6tSQjscbQk6sysbtYuohWZOcXMAPi2g8
	fwZd2BSaNZoXPM9Cr6s6mi9S9yNcsoI4LRFxF4j/6IEQb8c6izHawvanfqCdsnykB
X-Gm-Gg: ASbGncvi32iBmEnPuYDyRDShSg17NsR+IEVIiei3YfGSM4HAKx4EVqN+M6gAxORHJIj
	yTNDNFVwsoJFmXGJsaoiTt+s8FZhMVfr15/ccFg7XoyWAvve7UNxRPOFbLsRBMUeOljbnCeF3IX
	7AMKO9VVICQj+wVdUvpxAEPBOdxEitpiQ7Z73WwrTEQcWD8Hl3pse2lo77yBEod74UGdA6b+Sn0
	9T2azhhnnNL/PfBPmwOaD5BoCapy4cRLLZFAl3uaJtiZQgyUH2tqI1qu6QtylNIds6/V1phIVNJ
	aQ6D1bRvpH+pTgB39slt6sN4HIkqvMo7Hyr+DXFB+Whl
X-Received: by 2002:a05:6a00:114c:b0:732:1840:8382 with SMTP id d2e1a72fcca58-7348ba6d783mr10093714b3a.0.1740628433615;
        Wed, 26 Feb 2025 19:53:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh5X7bgV3zo/n3ZH5yQ0HTLXd54y0J4VfRDomVEkH4D5IP+RagxLDPvQ42BOJMUDwWpa3BLA==
X-Received: by 2002:a05:6a00:114c:b0:732:1840:8382 with SMTP id d2e1a72fcca58-7348ba6d783mr10093679b3a.0.1740628433225;
        Wed, 26 Feb 2025 19:53:53 -0800 (PST)
Received: from [10.92.199.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe4ccb0sm451884b3a.65.2025.02.26.19.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 19:53:52 -0800 (PST)
Message-ID: <304a92ea-1a73-1400-a020-dd2e0f14bfd0@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:23:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add binding for Toshiba TC956x
 PCIe switch
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
 <20250225-qps615_v4_1-v4-1-e08633a7bdf8@oss.qualcomm.com>
 <20250226-eager-urchin-of-performance-b71ae4@krzk-bin>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250226-eager-urchin-of-performance-b71ae4@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SSirgD2rB0jeY5Sei9VA1fPwpp-NTbJl
X-Proofpoint-ORIG-GUID: SSirgD2rB0jeY5Sei9VA1fPwpp-NTbJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270027



On 2/26/2025 1:00 PM, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 03:03:58PM +0530, Krishna Chaitanya Chundru wrote:
>> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>>
>> Add a device tree binding for the Toshiba TC956x PCIe switch, which
>> provides an Ethernet MAC integrated to the 3rd downstream port and two
>> downstream PCIe ports.
>>
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 
> Drop, file was named entirely different. I see other changes, altough
> comparing with b4 is impossible.
> 
ack
> Why b4 does not work for this patch?
> 
>    b4 diff '20250225-qps615_v4_1-v4-1-e08633a7bdf8@oss.qualcomm.com'
>    Checking for older revisions
>    Grabbing search results from lore.kernel.org
>    Nothing matching that query.
> 
> Looks like you use b4 but decide to not use b4 changesets/versions. Why
> making it difficult for reviewers and for yourself?
> 
There is workspace issue at my end instead of fixing them I tried to
create new branch. I will try to use same changeset from next series
onwards.
> 
>> ---
>>   .../devicetree/bindings/pci/toshiba,tc956x.yaml    | 178 +++++++++++++++++++++
>>   1 file changed, 178 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml
>> new file mode 100644
>> index 000000000000..ffed23004f0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/toshiba,tc956x.yaml
> 
> What is "x" here? Wildcard?
> 
>> @@ -0,0 +1,178 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/toshiba,tc956x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC956x PCIe switch
>> +
>> +maintainers:
>> +  - Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> +
>> +description: |
>> +  Toshiba TC956x PCIe switch has one upstream and three downstream
> 
> TC9560? Which one are you using here?
> 
'x' is the series of the switch and we use tc9563
>> +  ports. The 3rd downstream port has integrated endpoint device of
>> +  Ethernet MAC. Other two downstream ports are supposed to connect
>> +  to external device.
>> +
>> +  The TC956x PCIe switch can be configured through I2C interface before
>> +  PCIe link is established to change FTS, ASPM related entry delays,
>> +  tx amplitude etc for better power efficiency and functionality.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - "pci1179,0623"
> 
> Why quotes?
> 
I will remove the, in the next patch.
>> +      - const: pciclass,0604
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  i2c-parent:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle to the parent I2C node and the slave address of the device
>> +      used to do configure tc956x to change FTS, tx amplitude etc.
>> +    items:
>> +      - description: Phandle to the I2C controller node
>> +      - description: I2C slave address
>> +
>> +  vdd18-supply: true
>> +
>> +  vdd09-supply: true
>> +
>> +  vddc-supply: true
>> +
>> +  vddio1-supply: true
>> +
>> +  vddio2-supply: true
>> +
>> +  vddio18-supply: true
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description:
>> +      GPIO controlling the RESX# pin.
>> +
>> +allOf:
>> +  - $ref: "#/$defs/tc956x-node"
>> +
>> +patternProperties:
>> +  "^pcie@[1-3],0$":
>> +    description:
>> +      child nodes describing the internal downstream ports
>> +      the tc956x switch.
>> +    type: object
>> +    $ref: "#/$defs/tc956x-node"
>> +    unevaluatedProperties: false
>> +
>> +$defs:
>> +  tc956x-node:
>> +    type: object
>> +
>> +    properties:
>> +      tc956x,tx-amplitude-microvolt:
> 
> You already got comments on this.
> 
In V3 I got a comment saying "-microvolt does not work for you?"
so based on this we changed to microvolt.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Never tested.
>  >
>> +        description:
>> +          Change Tx Margin setting for low power consumption.
>> +
>> +      tc956x,no-dfe-support:
> 
> There is no such vendor prefix and you already got exactly the same
> comment at v3. How did you resolve that comment?
>
It is my mistake I taught the comment was applicable to removed property
"qps615,axi-clk-freq-hz". It is applicable to all the properties I will
correct it in the next patch.

For some reasons there are no errors shown in my workspace when I run
make dt_binding_check DT_SCHEMA_FILES=toshiba,tc956x.yaml
& make CHECK_DTBS=y qcom/qcs6490-rb3gen2.dtb

I will check my tools versions etc and will fix them.

>> +        type: boolean
>> +        description:
>> +          Disable DFE (Decision Feedback Equalizer), which mitigates
>> +          intersymbol interference and some reflections caused by impedance mismatches.
>> +
>> +    allOf:
>> +      - $ref: /schemas/pci/pci-pci-bridge.yaml#
>> +
>> +unevaluatedProperties: false
> 
> Keep order as in example-schema.
> 
ack.

- Krishna Chaitanya.
> Best regards,
> Krzysztof
> 

