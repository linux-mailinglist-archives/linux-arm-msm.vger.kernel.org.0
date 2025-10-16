Return-Path: <linux-arm-msm+bounces-77653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071FBE5D33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 01:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4B3535339B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 23:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEB82E8DEE;
	Thu, 16 Oct 2025 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ensd4i8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409532E88BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760658825; cv=none; b=hxUgjqiNEmC/F8qBjLdUgFk/SLQaDkAuHQR9hmOeNPYk3sRxhHFp5LlEqIt7Q9moDaUVlP9orT99MhsuI/S3r6dLhokHsc5P+q3M6QquJB6KfQSlKOBbaf6S9mCyQDZ7gM0OUQFzHK94Q+nKpAwTp0MVN8vcCCM2ZBCWULFTFzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760658825; c=relaxed/simple;
	bh=159Ad/mw1yzKjwwPT1PW6TswkfWKbT6EE3oOMe2zZFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvczXh+w+xLJL9EFotBok5dyQO76dZTj0Xc0dTUsnFB4sCD7rGMvGbPf11w+MBwYqqpzEthqOHnWR4x6LDBXthFHMHgDBpYi14uwaF8r4cZl9MPESSSIDD1XwBc5zNDl+iLuf9nIBZHO3ZKf6PO7g/00vtAzZT8mIWoCI3TxF7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ensd4i8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLXCl016623
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	960t/2xukMF6japzDYcR6/o6+qkwGS8gKLOPFbyQfho=; b=ensd4i8u0QNCzD8Q
	ewnJJQ88cStzbNJWi2ioIa37iv+iH9o0EdwGI28s3JE5lVsT9SYXpsWTHR+9uVyM
	QBms065OE04AvGFVB0XIpMMeOk7Jq5tYyrRNNmo7EDYszpKaYJpa0opgBvmBYj1W
	NenaRliMNFXX0gIdM4JknHMIS0yWu9K9QnBb2vp0w9xEUcxMOlJUfsNdl0wvXszX
	kwxCKDzL+96NiLWFwwWxs6KwEg41rIx3xYSeF9HlpTd2JddCNGlXG3XvYuXDQbKn
	6J7kga5qMd+fXcw7GE9KuDslaODCuMxR4kepbOz+f3m0v1xTkFoMfS2zOZmmmxvK
	poh1ng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5tc84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 23:53:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290c9724deeso5664365ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 16:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760658821; x=1761263621;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=960t/2xukMF6japzDYcR6/o6+qkwGS8gKLOPFbyQfho=;
        b=KjuAOJnrfyGJauYECjKyuveQnPqskAQLCTS6ON7sIMzDILXfaouDb4EgjBbYSPM7gR
         aTSImDqaLr/PX9cDOuqNhmfZWikdd1oM3Tqpz9VTjI5tTukIjvIbFlMntAE8/V1Wx/0p
         hsm/AgJxf6MJVIoSijXYsH76I2Gh11K/vqKVgnNUuwGp1TwxSTom84s0KxqHjgs84MP7
         d2FGeHZH1WwIJ4r3jJG9bsIXulpsU8eFNoGn3nAWLHVYkmjrZFQrQGLFB54rTRNfORoW
         ho4VJVPgWBYvEgJ3hsHp5M6OkFtDsw3iw322Oi6IPv9sgDDoLiATU5dqzrav1w8cDHed
         f2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWwVmXiQ8R2/5XeMBZ5M64hHaKvCcAArDOVXCPDbNqHoONMSqFbhhMdmbXZ9SftXddC2bst3husHGv3EHMk@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGx9VmCckGlaRwNE5l30W1VL95HRzVi8wIbNKiXllFMtSCBD9
	mVstm8NylmZ8BZslayfm4vTdba2JzcoPKxCv97SbcPm9kQImNiZToF9SeLm5TORNFuEqiGcJkEr
	ZFNYwOHDHr0g4sf9O9nc2/LQ837SZpaLQkcx8zMxcns/iAl21zI+FLEznac5wt2b1EZzd
X-Gm-Gg: ASbGncueZ0XiGSgtCruUsrVXkISXWoOxX/HhjS0R5xQ7ZKwqjy3s8kUtl38mewlphp4
	M7k669yrliIYlkBb2yrQS6FLiYjY7sEXl7hFDzJg7gqQ4zO2uUzVYdZWbqG9pyghkflEHYVWQgs
	OmuA60bKyq7sOUO+ztIaYUYPynfSbBCDnuD22ue1qe6lb3E0wCWQAj81XRyhhYdgguvALhZoYN3
	h6ulaaFiQSa+iNB1Dwj66cN0CEkDy7wPHmvRMHRXmjOCLDg0D8dLmnWB/Tdc1lzdyhggfWEMsqo
	tL+v+5ocG9VJRwamIz/gIsCNecRdvW6hp+yxY18gNILKFprnPGhwRt6FgAxvALHD85qgDnzsZK7
	NrYqU+2zSv+EvVT4AlYTG4mxPKCL0/Qzd113zrDv3K3w/6CNB+p3lHg==
X-Received: by 2002:a17:903:41d1:b0:275:f932:8636 with SMTP id d9443c01a7336-290ca216585mr19085335ad.38.1760658820445;
        Thu, 16 Oct 2025 16:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxVCiPjE8eYCmSiRKCZd2pZXHZIfbt9IUWCioBE0sp251wRna0K5j6tuUW9pxs6Up8+itOZg==
X-Received: by 2002:a17:903:41d1:b0:275:f932:8636 with SMTP id d9443c01a7336-290ca216585mr19084995ad.38.1760658819796;
        Thu, 16 Oct 2025 16:53:39 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099372c4fsm43145505ad.43.2025.10.16.16.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 16:53:39 -0700 (PDT)
Message-ID: <1d6a20d8-b011-4608-a722-a1996b366a56@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:53:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-2-f5745ba2dff9@oss.qualcomm.com>
 <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <dce1018c-6165-407c-8f3d-40859cb36b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZxAKnUAKB_BxBx-h28E3MbViE2pRS7i_
X-Proofpoint-ORIG-GUID: ZxAKnUAKB_BxBx-h28E3MbViE2pRS7i_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX8+PR36I+C6tm
 5d637mivt24Zei34xmxBzAhZ95Bkmf9jnrw/dUwqUzVSAdIs9Jk2dAHxyussoJI3KmNBzEyGaUb
 8BFUs2+byBboNzzqnplTeAEhwCeYzq7FBOr2gjEsVG/SP6slW9JdTL9nNkC9u/ijJgGu0nFGeFH
 rR0K16hbPxasH5iagNf6ij0jXw+DkEPzVQ5hIgwjmkrUQ58t5ACl5MWZnQm8aNpBFkVtLiOc3a6
 WES5YDJ/QfldAHw29BjLbwq1uu4vdhWpzj4C4brD4EHkDF/ElkoSFXKxpGlR48k6IGweqqGXNIH
 q/PPhVbu0fwxte5nRdTCAknogmPHxYDjLSHHBzaWsP7Hzerap65Tb8PFf4Hi4yV4u1Nq/w3U5mY
 kRKsZnSJGs0J0Fqzbp1SHMKZl9jj/Q==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f18586 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=XqPAWGmz1m5w9qskTY0A:9
 a=VCiyCveCf9S4Bs0l:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020


On 10/15/2025 12:45 PM, Vladimir Zapolskiy wrote:
> On 10/15/25 05:56, Hangxiang Ma wrote:
>> Add bindings for qcom,kaanapali-camss in order to support the camera
>> subsystem for Kaanapali.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 494 
>> +++++++++++++++++++++
>>   1 file changed, 494 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml 
>> b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..d04c21103cfd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,494 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  clocks:
>> +    maxItems: 34
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cam_top_ahb
>> +      - const: cam_top_fast_ahb
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_hf_axi
>> +      - const: qdss_debug_xo
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>
> The list of 'clock-names' values is not alphanumerically sorted.
>
>> +
>> +  interrupts:
>> +    maxItems: 16
>> +  interrupt-names:
>
> Missing empty line to separate properties.
>
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_0_mnoc
>
> Please rename "hf_0_mnoc" to "hf_mnoc", see qcom,qcm2290-camss.yaml etc.
>
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch 
>> Controller.
>> +      - description:
>> +          Titan GDSC - Titan ISP Block Global Distributed Switch 
>> Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: tfe0
>> +      - const: tfe1
>> +      - const: tfe2
>
> Please remove all 'tfeX' power domains, they are not going to be utilized
> any time soon.
>
> When 'power-domains' list is just a single Titan GDSC, 
> 'power-domain-names'
> property is not needed.
>
>> +      - const: top
>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.2V regulator supply to PHY refclk pll block.
>> +
>> +  vdda-phy0-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>> +
>> +  vdda-phy1-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>> +
>> +  vdda-phy2-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>> +
>> +  vdda-phy3-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>> +
>> +  vdda-phy4-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>> +
>> +  vdda-phy5-supply:
>> +    description:
>> +      Phandle to 0.8V regulator supply to PHY core block.
>
> What is the difference between vdda-phyX-supply properties, why do you
> need so many of them, when their descriptions say they are all the same?
Each of these supply power to a specific CSIPHY and could be different 
based on the board architecture. But I agree that the description should 
probably capture that than just relying on the name.
>
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    properties:
>> +      port@0:
>
> Please use
>
>     patternProperties:
>       "^port@[0-3]$":
>
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSI0.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>
> Please remove 'clock-lanes' property, it is non-configurable, redundant
> and tends to store some irrelevant value.
>
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - clock-lanes
>
> The 'clock-lanes' property is expected to be removed.
>
>> +              - data-lanes
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSI1.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - clock-lanes
>> +              - data-lanes
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSI2.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - clock-lanes
>> +              - data-lanes
>> +
>> +      port@3:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSI3.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +              bus-type:
>> +                enum:
>> +                  - 1  # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4  # MEDIA_BUS_TYPE_CSI2_DPHY
>> +
>> +            required:
>> +              - clock-lanes
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-pll-supply
>> +  - vdda-phy0-supply
>> +  - vdda-phy1-supply
>> +  - vdda-phy2-supply
>> +  - vdda-phy3-supply
>> +  - vdda-phy4-supply
>> +  - vdda-phy5-supply
>
> Please exclude supplies from the list of required properties.
One of these supplies is required based which PHY the use case is being 
run. Can you please advise how to handle that? Thanks.
>
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
>> +    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>
> Please keep the list of included headers sorted alphabetically.
>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        camss: isp@9253000 {
>> +            compatible = "qcom,kaanapali-camss";
>> +
>> +            reg = <0x0 0x09253000 0x0 0x5e80>,
>> +                  <0x0 0x09263000 0x0 0x5e80>,
>> +                  <0x0 0x09273000 0x0 0x5e80>,
>> +                  <0x0 0x092d3000 0x0 0x3880>,
>> +                  <0x0 0x092e7000 0x0 0x3880>,
>> +                  <0x0 0x09523000 0x0 0x2000>,
>> +                  <0x0 0x09525000 0x0 0x2000>,
>> +                  <0x0 0x09527000 0x0 0x2000>,
>> +                  <0x0 0x09529000 0x0 0x2000>,
>> +                  <0x0 0x0952b000 0x0 0x2000>,
>> +                  <0x0 0x0952d000 0x0 0x2000>,
>> +                  <0x0 0x09151000 0x0 0x20000>,
>> +                  <0x0 0x09171000 0x0 0x20000>,
>> +                  <0x0 0x09191000 0x0 0x20000>,
>> +                  <0x0 0x092dc000 0x0 0x1300>,
>> +                  <0x0 0x092f0000 0x0 0x1300>;
>> +            reg-names = "csid0",
>> +                        "csid1",
>> +                        "csid2",
>> +                        "csid_lite0",
>> +                        "csid_lite1",
>> +                        "csiphy0",
>> +                        "csiphy1",
>> +                        "csiphy2",
>> +                        "csiphy3",
>> +                        "csiphy4",
>> +                        "csiphy5",
>> +                        "vfe0",
>> +                        "vfe1",
>> +                        "vfe2",
>> +                        "vfe_lite0",
>> +                        "vfe_lite1";
>> +
>> +            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
>> +                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_CSID_CLK>,
>> +                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY1_CLK>,
>> +                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY2_CLK>,
>> +                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY3_CLK>,
>> +                     <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY4_CLK>,
>> +                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
>> +                     <&camcc CAM_CC_CSIPHY5_CLK>,
>> +                     <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
>> +                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
>> +                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
>> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
>> +            clock-names = "camnoc_nrt_axi",
>> +                          "camnoc_rt_axi",
>> +                          "camnoc_rt_vfe0",
>> +                          "camnoc_rt_vfe1",
>> +                          "camnoc_rt_vfe2",
>> +                          "camnoc_rt_vfe_lite",
>> +                          "cam_top_ahb",
>> +                          "cam_top_fast_ahb",
>> +                          "csid",
>> +                          "csid_csiphy_rx",
>> +                          "csiphy0",
>> +                          "csiphy0_timer",
>> +                          "csiphy1",
>> +                          "csiphy1_timer",
>> +                          "csiphy2",
>> +                          "csiphy2_timer",
>> +                          "csiphy3",
>> +                          "csiphy3_timer",
>> +                          "csiphy4",
>> +                          "csiphy4_timer",
>> +                          "csiphy5",
>> +                          "csiphy5_timer",
>> +                          "gcc_hf_axi",
>> +                          "qdss_debug_xo",
>> +                          "vfe0",
>> +                          "vfe0_fast_ahb",
>> +                          "vfe1",
>> +                          "vfe1_fast_ahb",
>> +                          "vfe2",
>> +                          "vfe2_fast_ahb",
>> +                          "vfe_lite",
>> +                          "vfe_lite_ahb",
>> +                          "vfe_lite_cphy_rx",
>> +                          "vfe_lite_csid";
>> +
>> +            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
>> +                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "csid0",
>> +                              "csid1",
>> +                              "csid2",
>> +                              "csid_lite0",
>> +                              "csid_lite1",
>> +                              "csiphy0",
>> +                              "csiphy1",
>> +                              "csiphy2",
>> +                              "csiphy3",
>> +                              "csiphy4",
>> +                              "csiphy5",
>> +                              "vfe0",
>> +                              "vfe1",
>> +                              "vfe2",
>> +                              "vfe_lite0",
>> +                              "vfe_lite1";
>> +
>> +            interconnects = <&gem_noc MASTER_APPSS_PROC 
>> QCOM_ICC_TAG_ACTIVE_ONLY
>> +                             &config_noc SLAVE_CAMERA_CFG 
>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                            <&mmss_noc MASTER_CAMNOC_HF 
>> QCOM_ICC_TAG_ALWAYS
>> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +            interconnect-names = "ahb",
>> +                                 "hf_0_mnoc";
>> +
>> +            iommus = <&apps_smmu 0x1c00 0x00>;
>> +
>> +            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
>> +                            <&camcc CAM_CC_TFE_1_GDSC>,
>> +                            <&camcc CAM_CC_TFE_2_GDSC>,
>> +                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +            power-domain-names = "tfe0",
>> +                                 "tfe1",
>> +                                 "tfe2",
>> +                                 "top";
>> +
>> +            vdda-pll-supply = <&vreg_l1d_1p2>;
>> +            vdda-phy0-supply = <&vreg_l3i_0p8>;
>> +            vdda-phy1-supply = <&vreg_l3i_0p8>;
>> +            vdda-phy2-supply = <&vreg_l3d_0p8>;
>> +            vdda-phy3-supply = <&vreg_l3i_0p8>;
>> +            vdda-phy4-supply = <&vreg_l3d_0p8>;
>> +            vdda-phy5-supply = <&vreg_l3i_0p8>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +
>> +                    csiphy_ep0: endpoint {
>> +                        clock-lanes = <7>;
>> +                        data-lanes = <0 1>;
>> +                        remote-endpoint = <&sensor_ep>;
>> +                    };
>> +                };
>> +            };
>> +        };
>> +    };
>>
>

