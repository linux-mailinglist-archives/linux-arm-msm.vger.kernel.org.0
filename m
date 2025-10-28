Return-Path: <linux-arm-msm+bounces-79203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C07C1571A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:28:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81512503053
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 15:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF7633F8A9;
	Tue, 28 Oct 2025 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DIpdchn4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8198333A005
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664971; cv=none; b=RsVkjk8fdkH/WL3cliewfdYe9m2985eeyXKHGn1fpv9JUOK3Q3s+Kk5BvASn/GD5mD57ldrG0kGXHsXQ+72mdob3SmEEbWc7+y4zKFM0jDef7l3dtp6MVpXdI0jVThomcugnYyqVUkgiAzXolFxMd+E5aD5bfA9yVpWno7pSv9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664971; c=relaxed/simple;
	bh=i6dwP/4aVUhxLzEuLGMFgZDkgOJxpg13FAiRQFTaMp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs7pETRij2KAz4dXrt9Tb19qyF6xJrZSoiaUoEEWgYYN6sJBGH6daHr/aBJzeeLpQF4Rd3kaNgTAdWZP5+hMZgTOPBu51+4Eyr5wkVL+Zgk09fqpLIbJotj0AFMRSwvbaMbMt7wFiHMKGyMHb4LozxhcgsTkc8SSLvk80s46opg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIpdchn4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEniIH1974296
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qhVVXAYa1oWMuEPkONY6OjgMsms+Gmm7YOhm+H3VEg=; b=DIpdchn4ac5AkCpC
	/HzLY58Wl7JXF4cOGxMV93IBzK/ztsHr4/O6uBj3n8MXFIMjAvMFgcb47So9681s
	oylTEXcMHshIxrGc8GsOghzfznEBmsX2WwWByAlr/WZytuEapOH5o3zsFbEAOfmv
	2nghXR1HA/xGcg8/Lym+BZ9rmsUZBx0Z0elU1VGdeER/bw5Ekj+foLaSBQX+5OuP
	xrRRH+0344nKpxDdRHWcWa7dN4N6rk9OfiBHxgGfk6vvg6DLy4wxGkCZB/jW8/Q4
	rfvDbjpZieDWccZZVTGsR2xwxG7cWSXZV5jYiNC+HS5493wBRL7IhIRq3DrcQX3J
	WKQM1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pge9x27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:22:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290da17197eso98166485ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 08:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664968; x=1762269768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/qhVVXAYa1oWMuEPkONY6OjgMsms+Gmm7YOhm+H3VEg=;
        b=ScpJ7CmzlDU1p4Vgt4m/fRWgwyUhHVETsJFf2o0gIqgma1KTCvsuscHtUK0RhRYuR5
         CVO7jw2rCXHfmV5k0Ox4g1uGxLycr6OUBJ4ydz+QWdFD03OB+ocGS7PxzMF+GU3DQUUp
         KbQKQqVF6d0zFiS79MyxrKul04qT0AJJ6R282ybLgf7X3LRQ05Fb8q0iQdj+tZFVjGkU
         fNajQ2/A+Q8pAGPixF6D2MQfdk6UftSNSTd7mydIP5htNKM5sxnHbCCRCiy7J8gbUrLJ
         7Mil34fJlPw3BDq6066a86eA9TI+fyEWGQubD3Vs302fZ86aoaUQAkDspePmkfx21nWO
         /gTA==
X-Forwarded-Encrypted: i=1; AJvYcCXFMC3hRw+F5kBG2Ipu2ZK6q58xBsPseiSiNYmy50tbIUfNXw8c/Th+XQ5lyRqr1lQLV/J9ZKdhWSSXmQpC@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSSOlq0y2uRJzgeo+2vEDxI9eSqzsvkVzQ15qf6dwa0sZfYYT
	mK6vx45xd619h6uu037IGUQ3sovg3UJ08n0fzs4gL/GfgxB3veXJlhnQhuynK263uJZ+QScZJnG
	/zAbcSegz4ocOSjxwBoS6FLCWIs13ybK80LdT9CBZTcL259/vHttkB6VKIS3X5K+0GqyY
X-Gm-Gg: ASbGncuLaNAAHBv+IL8oMO5K6O7aroguoA6o8Buz4uQTToT2y68G1wC4nZ/S4Lw/rGi
	1pvGWCLiZcjg2mRKB0bCpKjSyKCaEBWRe8sRnpBEYgJqr7bmeuV7NRN2izPJYPBdRQi3skSMcWD
	eP5GMvRj2JcR0Rc5iJCyVRe+QUAVt3dp8GC8+5iT4pQ2Pz3MUdr/3GlCws1kNPwC+deLCIE27Jk
	npp0DbonStkBLpsEPc8J2f0P25BSNTMn69LjMzseZdkesAlYJpSmjdVMjHTvjcSlKQkKzhkNpVK
	MtfwnT7uuIXaN388E3T+ErxfYRA4BgmL3ggfWsu8b+9X/4hsoSd71gl63XU6OY6ZxXsa0RzS7IN
	9LZXoCLSKYGxqEvO0+g91Hn8+EyucKA==
X-Received: by 2002:a17:902:ce91:b0:27e:e1f3:f853 with SMTP id d9443c01a7336-294cb35ec0emr39522815ad.8.1761664967628;
        Tue, 28 Oct 2025 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKT+rFVMcwAQICluDKMtEhBioNthl6+SABX35wYAnUtYg4zabmFpp47e5pdB3TWxtlbA6gBw==
X-Received: by 2002:a17:902:ce91:b0:27e:e1f3:f853 with SMTP id d9443c01a7336-294cb35ec0emr39522395ad.8.1761664966848;
        Tue, 28 Oct 2025 08:22:46 -0700 (PDT)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d23334sm120010065ad.52.2025.10.28.08.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 08:22:46 -0700 (PDT)
Message-ID: <ac126c63-f40c-4159-87c9-1b3d7a8dec63@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 08:22:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20251028-wonderful-olive-muskox-77f98d@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1TVN3aCtMk8Mej9CA5NxOcI4YN0H9G1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyOSBTYWx0ZWRfX+ss+kc7rb7qo
 MLIpLy3tiAbSXctoB3HBbbk6wjcQoyBn1fDHMuQVc8Nhfz2dyWk28QUNrPAn5P/XpEKl7mHAq4T
 Ud9/LlwxrAEEDc27F4ry69NoNWNl3atQ3mTMjAaET8kGuNc/U1BtGshqg7jgJTBOx1q0RWx1m7p
 PBHCbeBHlqPw3s/hYjrWd/ulznUChe9SNe4czbTgOW49+g+ypPe3NR5Fz9f864t6EJ2stsX3cIM
 89SNP7f8vMyNrumMTG0mEfhdy091zMP4nLEgV1OWNtLHKLiVaYZ+ReWR1G+vgedsL5y6E5S5AfF
 tY84jtjGt46a3jFh6VQIghSQCazqaPsrxW3e/0FUWa0JzajMJKUZMghHxWndOVBIVb+3aeLoLuv
 GTwAVEdChGOEBfZNWhs9C+WirEUzlw==
X-Proofpoint-GUID: 1TVN3aCtMk8Mej9CA5NxOcI4YN0H9G1v
X-Authority-Analysis: v=2.4 cv=fLU0HJae c=1 sm=1 tr=0 ts=6900dfc8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CBB8_qsqxfPmcTTwScYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280129


On 10/28/2025 1:09 AM, Krzysztof Kozlowski wrote:
> On Thu, Oct 23, 2025 at 02:14:34AM -0700, Hangxiang Ma wrote:
>> Add bindings for qcom,kaanapali-camss in order to support the camera
> What is qcom,kaanapali-camss? Sounds like a compatible and you cannot
> add bindings for a compatible. Instead add bindings for hardware, so
> explain here hardware.
>
> You could easily use `git log` to see how such commits are written
> instead of pasting here your downstream practice.
>
>> subsystem for Kaanapali.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 369 +++++++++++++++++++++
>>   1 file changed, 369 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> new file mode 100644
>> index 000000000000..82f427bd036b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>> @@ -0,0 +1,369 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>> +
>> +maintainers:
>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> +
>> +description:
>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kaanapali-camss
>> +
>> +  reg:
>> +    maxItems: 16
>> +
>> +  reg-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  clocks:
>> +    maxItems: 34
>> +
>> +  clock-names:
>> +    items:
>> +      - const: camnoc_nrt_axi
>> +      - const: camnoc_rt_axi
>> +      - const: camnoc_rt_vfe0
>> +      - const: camnoc_rt_vfe1
>> +      - const: camnoc_rt_vfe2
>> +      - const: camnoc_rt_vfe_lite
>> +      - const: cam_top_ahb
>> +      - const: cam_top_fast_ahb
>> +      - const: csid
>> +      - const: csid_csiphy_rx
>> +      - const: csiphy0
>> +      - const: csiphy0_timer
>> +      - const: csiphy1
>> +      - const: csiphy1_timer
>> +      - const: csiphy2
>> +      - const: csiphy2_timer
>> +      - const: csiphy3
>> +      - const: csiphy3_timer
>> +      - const: csiphy4
>> +      - const: csiphy4_timer
>> +      - const: csiphy5
>> +      - const: csiphy5_timer
>> +      - const: gcc_hf_axi
>> +      - const: qdss_debug_xo
> No, I told many times you are supposed to use same order as last
> generation. Stop doing this alphabetical ordering or ordering by value.
> The previous generation has here vfe0.
>
>> +      - const: vfe0
>> +      - const: vfe0_fast_ahb
>> +      - const: vfe1
>> +      - const: vfe1_fast_ahb
>> +      - const: vfe2
>> +      - const: vfe2_fast_ahb
>> +      - const: vfe_lite
>> +      - const: vfe_lite_ahb
>> +      - const: vfe_lite_cphy_rx
>> +      - const: vfe_lite_csid
>> +
>> +  interrupts:
>> +    maxItems: 16
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: csid0
>> +      - const: csid1
>> +      - const: csid2
>> +      - const: csid_lite0
>> +      - const: csid_lite1
>> +      - const: csiphy0
>> +      - const: csiphy1
>> +      - const: csiphy2
>> +      - const: csiphy3
>> +      - const: csiphy4
>> +      - const: csiphy5
>> +      - const: vfe0
>> +      - const: vfe1
>> +      - const: vfe2
>> +      - const: vfe_lite0
>> +      - const: vfe_lite1
>> +
>> +  interconnects:
>> +    maxItems: 2
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ahb
>> +      - const: hf_mnoc
> Why previously this was called hf_0 but now hf?
Hi Krzysztof, the interconnect driver exposes only one node 'camnoc_hf' 
to the camera driver, with it internally managing the voting on hf_0 and 
hf_1 clients. The traffic from the Real Time blocks in camera go through 
both HF_0 and HF_1, with the former being the primary. This change 
correctly represents that the BW voting is for the whole of the HF 
client. Please let me know if you have any further questions and we 
would be happy to answer. Thank you.
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description:
>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
>> +      - description:
>> +          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: tfe0
>> +      - const: tfe1
>> +      - const: tfe2
> Why not using the same names as before? It really does not matter that
> it is thin or image, all of them are the same because only the
> difference against top matters.
Right, this is done to maintain the consistency with the clock driver on 
Kaanapali along with the terminology used elsewhere in the Kaanapali 
camss patches (wherever feasible). However, we don't mind updating this 
if you think otherwise, please advise.
>> +      - const: top
>> +
>> +  vdd-csiphy-0p8-supply:
>> +    description:
>> +      Phandle to a 0.8V regulator supply to CSI PHYs core block.
>> +
>> +  vdd-csiphy-1p2-supply:
>> +    description:
>> +      Phandle to 1.2V regulator supply to CSI PHYs pll block.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    description:
>> +      CSI input ports.
>> +
>> +    patternProperties:
>> +      "^port@[0-3]$":
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          Input port for receiving CSI data on CSI0.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +
>> +            required:
>> +              - data-lanes
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdd-csiphy-0p8-supply
>> +  - vdd-csiphy-1p2-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        camss: isp@9253000 {
> Drop unused label
>
>> +            compatible = "qcom,kaanapali-camss";
> Best regards,
> Krzysztof
>
>

