Return-Path: <linux-arm-msm+bounces-86254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A7CD6D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 18:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 886AF3011EFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCEF33290B;
	Mon, 22 Dec 2025 17:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTClvcLF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7WPKRBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E232827E
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766425094; cv=none; b=DFYd7xe16stelce6tJyNxv+GTU6RLJnjOwMRRNqw7I367dfjy6clJbpTVnVeRehUVSv8Humf8XzcLkpsqwoZ7sLMcVhnAn5GWYN7nHt2kaYzC3zOcgVgpYVo1U6a30Ky3OlM9MzNjxLD9RwMOKsmNZHSrw9J2XN/1uLxzCXaGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766425094; c=relaxed/simple;
	bh=mO0/SrtfKSUrtCRnVm13vpWFL6f6wXbWQSxVdbJjYSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjyP0jUxdXe3FtVDHe4hycyQxngWCjLf6qEAj1OQAyLPhkERGjrQdkMPUxU5GD5MeaPRQFeKboh3xw/TfKZNml66O3VHDmLoFfwFUeSkPDlAjOtfUrU5mUR4oKGvIM17B9pfgpAEQiqI8tbQ9qQSSV1yraC0BIhRHQ4A6g6Ff2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VTClvcLF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7WPKRBl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEC9PN1889420
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZKjH8eI7ms5s4pu+ziOvk6xlDGrE1j+26EfG7WOy6c=; b=VTClvcLFONEQxj6q
	+7V0cdqa9g9ypnGS0HyIULP9NLE/P7uR70pDTMyekU4HNjV4Wr9eFhq8WfWNBfRp
	rf/1Sd6RKFRA6CVtnkJ+P1ZQsOBUwmMVZN1ZuNFGcwEAWaViWPDpWZjI06a7X466
	F1GyXFtzaffhyDqNjCvdbETlhEHs7m4tTk1PUcsK9I3EvKPUgGRq5PU6hONj8cZ9
	6Ri6BmpBql5/H743Ga8dS6LkV27G1i8FJAhKAPAGymsw9GyMnKDLc46rQTAS8/I4
	/j4G1V4skuO1PMM3Yqx3eCUKJgBPUo9cF4P7AEKQW/c6eN/53LSPqTIhM/nRcpBn
	gF/Q3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770agn1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 17:38:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c213419f5so3977362a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766425091; x=1767029891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZKjH8eI7ms5s4pu+ziOvk6xlDGrE1j+26EfG7WOy6c=;
        b=g7WPKRBlGoxCNOg+Znml8tSvGe076LRyooejnW3QikPLbrWnVwbvCVbQdJML444iXV
         4AJE3JYK/vhwEjOKg0aQBitSa79vNk8rPXhH68nYxH77B0zBMpwUSLZb2LNajLQEjPWB
         3BNbw54fmDwrybl7CCOfuQqztD0IA1mu7+sPUZ100S/+n/Ec5xXqiRGUSEIBurW0pg7T
         EXA+fUbsgqi1xxWoDEKUj0c3vT3p7oJpNYCrMXrFQUYDx+NW/9lNAvQBJKBERyGQCqsT
         QSd9qTpivuN2osw4iB1GwIOp+2kesS364IQDkP2fu8cYLsNee8AEhPeBm1ClIAshsW7d
         bzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766425091; x=1767029891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZKjH8eI7ms5s4pu+ziOvk6xlDGrE1j+26EfG7WOy6c=;
        b=Sim8CEl7v8OSYqRbH1w5ePdGMzyHtH/D90n5vylmO7zpu3mo6vs7rx3YnRyLmPtxQi
         V5j6bBjlgiHyWez1JyhNn1snRUNdfs9Z6yGD+sLUdlyJFXFmnttAe90zbLM3Rbx02gn1
         1dus3MUT91WkrTZbhcH2VHWNXLqvc01hq17C/BnbMKboJlm3O+i6fpyKsbdT+ymTD+Jv
         O3MWlxqBLAptaz47N8SW3tzLUHc+6zW+5GKPDyFZ9JplD0YhMBVc162e7bUP3+cqEspB
         fOkfr/64tEl2X6EpkFfM/gVPmzeaAtzEjnZ93qvXKX2bOOjyHAUQ3FYYm6MyT6Ib77HS
         irtw==
X-Forwarded-Encrypted: i=1; AJvYcCVs1A1Hglvh4fplh6bRjIqA1dPpAu+klgrBw7y9gbrywacgaz8ER/1a+vyDsWt7SwgZm1brutGSzuoNCafV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7i0skbWg1hMzkcz93Q/6Ai+Rsc+Xl0pnMEE2Z1+fF/QcbvxxE
	e85muEAeFw4s+9CmevuUo742mdOI9PyvEwONcMiUbPw4kkPIErmfk1XxTi9iBQGw7P5MjQC2XV/
	vKgO4P6QZs0esVwfs4OX1WsmW0kX2LbT39KtNh2ITacNIYHpSqaYNhmrYJmvOIO7oZSjb
X-Gm-Gg: AY/fxX7uJ54ZNPGsqPnKpW7t/HNkvFUBGheyXXRk7XDVqMJsmqo5xVqx3IpvbAoZWsT
	vuEPuyMpw0U6vBt1b2Mb7fJeg0zIN0X0Ua0OxdtMyTzHH5qZMx6jsA4DH2FhvmEnWhHLsGhAXpj
	EAfXAlOpJCXS+gB69QoQlJLWzoSFhcv8pXKsQ8BJCkGKghvo167QOsZkyp4g5Iwsuj6dJn+Nc8P
	zFPZFaOHq1H6pF/aeEw6Hci7hV0j/nWc5k75KsMnwl0KmBdeO/HrmkPMRHe8O3tXey4I5ZSj3Zn
	PpVsLKL5s9LZ9hQA0tq0JvktlQ85sOPi7V55LpkTJB6Y9SGtffvJfytSlL28PLv7BL6l+km2Uqj
	opzx1Ekif35twN4AAg8CN1byvkBjcLQ/j6n4L
X-Received: by 2002:a05:6a20:728a:b0:2fb:2e04:eeae with SMTP id adf61e73a8af0-376a7afaeaamr12510926637.21.1766425090691;
        Mon, 22 Dec 2025 09:38:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFekOsk3KSjYhm1q2sKf3Hzdnd+yeet1Lb5PxQgEn3JL3LXbsaZSnqZMahzotRMjxZrNGiF9Q==
X-Received: by 2002:a05:6a20:728a:b0:2fb:2e04:eeae with SMTP id adf61e73a8af0-376a7afaeaamr12510898637.21.1766425090149;
        Mon, 22 Dec 2025 09:38:10 -0800 (PST)
Received: from [192.168.1.5] ([27.57.93.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cffesm10906282b3a.49.2025.12.22.09.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 09:38:09 -0800 (PST)
Message-ID: <ef51aa03-4478-42f4-88a3-510457c4b917@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 23:08:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: add clocks property to
 enable QoS on qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-2-odelu.kukatla@oss.qualcomm.com>
 <bf8fbe4b-d89e-424f-8445-0da2f80422c1@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <bf8fbe4b-d89e-424f-8445-0da2f80422c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE2MSBTYWx0ZWRfXyHpi8mb4xL7U
 oe38u+MZF2Y7zwKSHLo+uPXSDz5kbtXsqoGiLIxzXru9x0iJ0CjcQ7/8nLorOzr1UufdDsBhGV0
 5KcdNKZozPn+xmayGup2arUFEyiCDOqPAPy+0+0qjjc2DJWTUAMC195nByCFsAYoh4by5oZYB2t
 c4zXpoRd3VYcDXKAy//SAs1l2lNn/x6UrTx7aJJ/wQI3O1VOYgP4v7SQCaG5/gGahcerf9m+k/P
 SEk2njuRMJx4wI0KajEvp3JhpNLZrMEToEkQy8iw7CLY2vOHGqxrp786nY5zcUUTL5HhO10X2rg
 6YsgEZY0XZrvSehh0ZcPdkxodSVlVUWi/7z+Zv/pdyAMvV6XnY1G8NMQfIjLqvEHY12vmf2vsVd
 xc73Sph7q2XmgCwN18rVfCNSXHasXweqeEbcI/5NB2RPE5F/1Ui+vMj7DZ9BekZa8w+rh+VLGyC
 Dd/yOkSUCAWJsUAD7jA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=69498203 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=luqpl2TCSyK2LuNNAmtdDg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=57ojg8xjcnJcsMbD-uIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: uoZ8m3dMAWzq9EEpXh09v5FaH4Z82BLU
X-Proofpoint-ORIG-GUID: uoZ8m3dMAWzq9EEpXh09v5FaH4Z82BLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220161



On 11/29/2025 3:03 PM, Krzysztof Kozlowski wrote:
> On 28/11/2025 16:01, Odelu Kukatla wrote:
>> Add 'clocks' property to enable QoS configuration. This property
>> enables the necessary clocks for QoS configuration.
>>
>> QoS configuration is essential for ensuring that latency sensitive
>> components such as CPUs and multimedia engines receive prioritized
>> access to memory and interconnect resources. This helps to manage
>> bandwidth and latency across subsystems, improving system responsiveness
>> and performance in concurrent workloads.
> 
> I don't see how clocks property help here at all. Are you getting clock
> rates in the driver of some other clocks to make QoS decisions?
> 

We don't need to get clock rate/frequency, just need to enable the
clock(s) for QoS register access for which we need to get the clock
handle in driver.

>>
>> Both 'reg' and 'clocks' properties are optional. If either is missing,
> 
> No! They are not. How they can be optional in the hardware? How SoC can
> have for ONE GIVEN device optional reg, meaning one board with the same
> Soc has the IO address space but other board with the same SoC does not
> have it.
> 

I agree, I will drop the “optional” wording and rework the schema so
that `reg` and clocks’ are required for interconnects that implement
these resources, and not allowed for the NOCs without MMIO/clocks and
the virtual providers.

>> QoS configuration will be skipped. This behavior is controlled by the
>> 'qos_requires_clocks' flag in the driver, which ensures that QoS
>> configuration is bypassed when required clocks are not defined.
> 
> This suggests that - driver is not helping. Please describe the
> hardware, not your drivers.
> 

I will remove the driver related description from the commit message and
ensure the binding text stays strictly about the hardware.

>>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> ---
>>  .../interconnect/qcom,qcs8300-rpmh.yaml       | 53 ++++++++++++++++---
>>  1 file changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
>> index e9f528d6d9a8..594e835d1845 100644
>> --- a/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,qcs8300-rpmh.yaml
>> @@ -35,6 +35,10 @@ properties:
>>    reg:
>>      maxItems: 1
>>  
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>>  required:
>>    - compatible
>>  
>> @@ -45,14 +49,39 @@ allOf:
>>          compatible:
>>            contains:
>>              enum:
>> -              - qcom,qcs8300-clk-virt
>> -              - qcom,qcs8300-mc-virt
>> +              - qcom,qcs8300-aggre1-noc
>>      then:
>>        properties:
>> -        reg: false
>> -    else:
>> -      required:
>> -        - reg
> 
> Why do you remove this? You cannot make random changes.
> 

My goal was to add clocks for the interconnects that need them, not to
relax the `reg` requirements or change the behavior for
`clk-virt`/`mc-virt`. I will restore the previous `reg` handling and
only add additional constraints for `clocks` where they are actually
required by the hardware.

>> +        clocks:
>> +          items:
>> +            - description: aggre UFS PHY AXI clock
>> +            - description: aggre QUP PRIM AXI clock
>> +            - description: aggre USB2 PRIM AXI clock
>> +            - description: aggre USB3 PRIM AXI clock
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs8300-aggre2-noc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: RPMH CC IPA clock
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,qcs8300-gem-noc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GCC DDRSS GPU AXI clock
> 
> So all devices have clocks now? You made the schema less strict now,
> removed pieces of it and you add more relaxed code telling every device
> has a clock.
> 

Not all interconnects have clocks/MMIO, I will update the bindings as
you suggested in the fix:
https://lore.kernel.org/all/20251129094612.16838-2-krzysztof.kozlowski@oss.qualcomm.com/


> And none of this is explained in the commit msg.
> 
>>  
>>  unevaluatedProperties: false
>>  
>> @@ -63,6 +92,7 @@ examples:
>>          reg = <0x9100000 0xf7080>;
>>          #interconnect-cells = <2>;
>>          qcom,bcm-voters = <&apps_bcm_voter>;
>> +        clocks = <&gcc_ddrss_gpu_axi_clk>;
>>      };
>>  
>>      clk_virt: interconnect-0 {
>> @@ -70,3 +100,14 @@ examples:
>>          #interconnect-cells = <2>;
>>          qcom,bcm-voters = <&apps_bcm_voter>;
>>      };
>> +
>> +    aggre1_noc: interconnect@16c0000 {
> 
> No need for new example, it is the same as previous.
> 


Understood. I will drop the additional example instead of duplicating
essentially the same content.
I’ll rework the patch accordingly and send a v2 that keeps the schema
strict.

>> +        compatible = "qcom,qcs8300-aggre1-noc";
>> +        reg = <0x016c0000 0x17080>;
>> +        #interconnect-cells = <2>;
>> +        qcom,bcm-voters = <&apps_bcm_voter>;
>> +        clocks = <&gcc_aggre_ufs_phy_axi_clk>,
>> +                 <&gcc_aggre_noc_qupv3_axi_clk>,
>> +                 <&gcc_aggre_usb2_prim_axi_clk>,
>> +                 <&gcc_aggre_usb3_prim_axi_clk>;
>> +    };
> 
> 
> Best regards,
> Krzysztof


