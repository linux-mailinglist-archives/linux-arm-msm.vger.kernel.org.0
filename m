Return-Path: <linux-arm-msm+bounces-83579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C4C8DEB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8843A34D55D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 11:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98AF2EAB99;
	Thu, 27 Nov 2025 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eEy8uYLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XEJpQpoX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EA6CA4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764242115; cv=none; b=u3J9D8a3p5eqpxmLsZ5PExNlj4W+v5XFlw0LBubp5sxldnkCw8RQ1dY/tWKraWoah7OWkSVnt/NGXmhrTUf1tjcWmztQxsx2MgGGMFyACjeAHwjADj1CitYHqssJnrm1UNsXFhLvGAnapgnKp3eoUznVC4NBon2QgjtcN1xdOlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764242115; c=relaxed/simple;
	bh=6WgfxlPID8Y3QmuhFS0bEtxUOha/js9WouYybXVTkxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0j4fU8m+k9SMTuQEhGBK8LnHGGgeVYXI9+u0bvA1uXEaX2WDKpfAMiFRNZ7TTQxQ4G1FN604M01lu3hiTzUsoKJ3dq4c+c13EO564zAuh8VA1m/eGHTl9ualu+1sRtO5fE5uIqeYFziokCdBbVYEHNvKIal4yRw2GwL3ws4J4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eEy8uYLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XEJpQpoX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR9GBwJ606822
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=; b=eEy8uYLcZqem5tvu
	3mkyJNaz7g5++SkXoqbmRQ1yLo1V0l7qNknXu+57tZzpW1kVjB1Ii74VJfbg4nMW
	hLOpiQLrNwin4CADnFkxz4WRDnogZ8IHpexd4EdZW1W7AZ8TcVn9R+Ir3JNE1QL1
	9rVeplvk5WZuH7Mf1nDWHGjmRCWSxJIxtNR1PremE2LW+FT2ZZonyPYqU0DE7Y2B
	YgmYUjsafFQN+t4tdu5oSSXO9VZjRWQEAjvtRfL6YvOOobwr1FzQJzYZsDa2ecOw
	Fv4pxSxVDE4y/g0H8osFl65cxLNreAKKo9nmkVaDeE9SEpEiB6Uh6kUzEZ5evbCE
	Xlnz7A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apkv5gbu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 11:15:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7baaf371585so1112086b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764242111; x=1764846911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=;
        b=XEJpQpoXHoMDFar5bLBIC74qEnEtyjXDVz9CR9k3Y1VzoSuGi68o/BquUcU/VZhhcx
         cIZsx8TLoE1REnU/r89nui7oP4UtpoHCASnNiqBq9qXSamrQTbsUy96KXghR854J+VBu
         NtLgcgXBtwl45/aH/iiEmLOEFgfUexLpLwFwGHeeA5O8T0/tOthzQ5NM1yxsSQuWj03e
         S2nQvGJTGBfhkcx7CVHun4P3gRWPTMxlavcXJns8ia7/UOXcre6KzKHsfvCcNKUooy0n
         Vt0EcSj3yLg4/VxxYbRbZsAjovAxcC9JTXDOOwXNkUu3AuzSKlALP8Amp1rnMChbL9kf
         UzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764242111; x=1764846911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouZiG8FF8rCLx+8FqKvK99eWw/YkoBy6dG2bF+fQFWQ=;
        b=kYQFSTLrx/Bh7X4smtpFFo499/Lh9kMSfWe63XQnc0Lt5Wl4w0sLto6RTp86lE8gC4
         JdPZTwFNiTay5q8VPJXSPmUKxIHPbAGTV4U3UPDrslKbrBS/RRomRsPLgOpL8v+H4CtJ
         1WhEWb++d3ORZXBNbJPsFD5LErxDx8W3gHYYhfPIdJZgoW1U+UfkbpmGWaDSNgUOCVN4
         u7v+7QG+D7KUL5tJ75swhsCVD0c5W/5r4iVPvCWwHA4/iQKnVNcAy5pGu20yI31rzzw3
         +RLsksuqTIXHjGdXyjp+STnGwNB1BHrrcAmm5KtU9TNa2dbHgduofM13uzLlGGLLZcfs
         0f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW+UhOyjhvmKRbcmMJUWD6tvyPrp4sPbQGh5xR3HUlHKnWmmt2l++ZwRg6lnA1cRgmgKMOhK2jJTU0a1mZh@vger.kernel.org
X-Gm-Message-State: AOJu0YxRm7pmyGLGydeaJiOsuOurxIwNe2cjpQtAMIiZ6LYaNQb6u4Oe
	7gp/NZXOJAwiTYAln8w3dMnzYU+QypwzuNUQuSpyafSixcQzyFORX9Zubr/2ryllUY6oN9vVG2J
	w+yA7bWbuLdyilK6MHH+zQT4R2bWM2e67O/1OHHnzcOv3lTwNeeAriRzZqwFfyZ6lvMOm
X-Gm-Gg: ASbGnct2ACGD4VbFR4JB4OZHWL8RjASFaSRHRuFfls2mMR11qYZ5CBPS2BAFn76jJoZ
	3v49L4wkjijSfXzNfQauldrA3OHWiXn7KA455urOi5lkCoC9auQwVqyQeanXOvXbvszioes21WG
	kZCPoW3NyMkpD01NL2EFQx3KQu10a6qkRZQqpTRlnCXPRkGXI1GyuC42CnlizM0k3SMWiQdmCFI
	5LlOYwkCvOVLQ8k2EWR7Q09O/bhS/VAHkG8L9hmHFEu8q5GTZxx0mkhuGzMK06uoto2UzV0mtov
	uXg554kxM9MEw4me6slcAbWh/2fIeE+Vfp4GbsaUpcXpyeVmLNbxznLGSVfp23//Vg4Ow93VGCE
	07KnPBO23wrukC1NOASNK+jU9OlJUcGx5ubz8
X-Received: by 2002:a05:6a21:328f:b0:263:616e:b61d with SMTP id adf61e73a8af0-3613e56b300mr28425912637.23.1764242110679;
        Thu, 27 Nov 2025 03:15:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQMpXZfz/1tQ1M+zSZqz12+vq3ETE0Igc96Qyd9T1FJRvajJ/vF8AzDuqyu15xoKFLcakbBA==
X-Received: by 2002:a05:6a21:328f:b0:263:616e:b61d with SMTP id adf61e73a8af0-3613e56b300mr28425872637.23.1764242110078;
        Thu, 27 Nov 2025 03:15:10 -0800 (PST)
Received: from [10.218.29.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbde37d7sm1671813a12.13.2025.11.27.03.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:15:09 -0800 (PST)
Message-ID: <9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 16:44:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
 <eb596f7a-e13b-4edd-8ee7-05424ea3d9e5@oss.qualcomm.com>
 <c4b1df46-e4b6-4d95-971c-7aaf33bd35f1@oss.qualcomm.com>
 <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <02d7c0a9-0d24-4fd8-980a-da9d7307588a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 428wSRqsYswnK_6E04dQl5xkbhSKUc3m
X-Authority-Analysis: v=2.4 cv=O8k0fR9W c=1 sm=1 tr=0 ts=692832bf cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=j0LsKdlxD3o4FQvCk1AA:9 a=UnacWq3ggp9slQcj:21 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4MiBTYWx0ZWRfX5JzvLViC1l1f
 iBjX+tyADQlUmXbd5F3ziBNMJ/R3TnWUxtxMtTlDshqX6L1U8mavKhjgCmp2H1UqP1wEnKQfQdY
 LvBQQZEqNeq1foWyctxeQYI3vjkJuIDJ0LKIfmX7EEPa8NIW1ocMc6F0j7mbhHQ/Iu4rR0b7yS3
 zf9L9QoxOFNwr8R0SAGeYRRL7n8fOFWB14nJQuyYMJa/U7Tls7/Lcab0svxZdodG9LXglVdU2NU
 XiR9hrM/7FAi8TU8fX6vHWDKYlMe1JXnorCNoe+TInpOjaKtCgI2Vd+ZaxVrlmOPmnP8Rr/Q6pK
 VGQNnwg9BJMaBv3745jO9MHl1Qw/969hzuGL92S6Fx1NlX27PfkCliMOIu+VWEUWivXOFHJqFjb
 puvfP6N6pGX5aLfo7sPiiyrV1XZPnQ==
X-Proofpoint-GUID: 428wSRqsYswnK_6E04dQl5xkbhSKUc3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270082



On 11/12/2025 7:32 PM, Konrad Dybcio wrote:
> On 11/11/25 3:02 PM, Charan Teja Kalla wrote:
>>
>>
>> On 11/5/2025 2:44 PM, Konrad Dybcio wrote:
>>>> +	{ .compatible = "qcom,fastrpc-compute-cb",
>>>> +			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>> This will be globally applied to all smmu-v2 targets with fastrpc,
>>> starting from MSM8996 ending at Kaanapali and everything inbetween
>>>
>>> Are these settings always valid?
>> Oops, you are correct...this settings are not always applicable it seems.
>>
>> Example: lpass compute and cdsp compute node uses the
>> "qcom,fastrpc-compute-cb", but it is for the later that ACTLR settings
>> are valid.
>>
>> Then for these cases, should we be extending the actlr match array with
>> additional compatible string and then add them in all the device nodes
>> that require actlr setting? example:
>>
>> @@ -3119,7 +3119,8 @@ fastrpc {
>>        compute-cb@1 {
>> -         compatible = "qcom,fastrpc-compute-cb";
>> +         compatible = "qcom,fastrpc-compute-cb",
>> +                      "qcom,fastrpc-compute-cb-actlr";
> 
> dt-bindings (and especially compatible strings) must not be altered solely
> to work around a driver being suboptimal
> 
> But because you reported that these settings can change both between
> platforms and instances of the same devices on these platforms, we could
> possibly reconsider adding ACTRL settings to the consumer device nodes
> where they stray away from the otherwise seemingly reasonable baseline
> we have in the driver so far..
> 

During initial discussion of ACTLR design phase, It was concluded that
prefetch alike QoS settings are not hardware definitions, and device
tree would not be the right place to store such configurable/tunable
settings [1]. So it might be contradicting to add it in consumer nodes.

For fastrpc client, there are 2 hiccups:
1. For a particular SoC, Different SIDs of compute client are using the
    same compatible  "qcom,fastrpc-compute-cb" but can have different
    prefetch settings <refer table below> e.g. CDSP and ADSP have same
    compat string "qcom,fastrpc-compute-cb" with different labels.

e.g.
fastrpc {
         compatible = "qcom,fastrpc";
         qcom,glink-channels = "fastrpcglink-apps-dsp";
         label = "adsp"; /*---different label: adsp---*/
         compute-cb@3 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <3>;
		/*---Prefetch Default---*/
                 iommus = <&apps_smmu 0x1003 0x80>,
                          <&apps_smmu 0x1063 0x0>;
                 dma-coherent;
fastrpc {
         compatible = "qcom,fastrpc";
         qcom,glink-channels = "fastrpcglink-apps-dsp";
         label = "cdsp"; /*---Different Label: cdsp---*/
         qcom,non-secure-domain;
         #address-cells = <1>;
         #size-cells = <0>;
         compute-cb@1 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <1>;
		/*---Prefetch DEEP----*/
                 iommus = <&apps_smmu 0x1961 0x0>,
                          <&apps_smmu 0x0c01 0x20>,
                          <&apps_smmu 0x19c1 0x10>;

2. Different SoCs having the same compatible string and same label but
    different prefetch settings.
    e.g:
    in below table sm6550, sm8250 and sm8550
    compat string = "qcom,fastrpc-compute-cb" and label = "cdsp"
    but prefetch settings are different

As per my idea both the above cases could be resolved by compat string 
addition,
case 1 : compatible = "qcom,fastrpc-compute-cb-cdsp";
case 2 : compatible = "qcom,sm8550-fastrpc-compute-cb-cdsp"

This discrpeancy is not applicable for other clients, except fastrpc.
One way both the above cases could be resolved by additional fastrpc
compat string with below format:
compatible = "qcom,<soc_name>-fastrpc-compute-cb-<label_name>"

e.g: "qcom,sm8550-fastrpc-compute-cb-cdsp", 
"qcom,sm6550-fastrpc-compute-cb-adsp"

This should handle both case 1 & case 2.

But as you mentioned previously this might need change alteration of DT 
bindings addition which might not be allowed or favoured always.

[1]: 
https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/

> Or we could introduce some more bespoke matching logic.
> 
> I would like to know more about the scope of this issue, i.e. the matrix
> of (soc, device, actlr_val) that needs special handling.
> 

+---------+-----------------------------------------------+----------+
| SoC     | Description                                   | Prefetch |
+---------+-----------------------------------------------+----------+
| sc7180  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sc7280  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm6115  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm6125  | qcom,fastrpc-compute-cb (NA upstream)         |          |
+---------+-----------------------------------------------+----------+
| sm6350  | qcom,fastrpc-compute-cb | label = cdsp        | SHALLOW  |
|         | qcom,fastrpc-compute-cb | label = adsp        | SHALLOW  |
+---------+-----------------------------------------------+----------+
| sm8250  | qcom,fastrpc-compute-cb | label = cdsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8350  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8450  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
|         | qcom,fastrpc-compute-cb | label = sdsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8550  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+
| sm8650  | qcom,fastrpc-compute-cb | label = cdsp        | DEEP     |
|         | qcom,fastrpc-compute-cb | label = adsp        | DEFAULT  |
+---------+-----------------------------------------------+----------+

Thanks & regards,
Bibek

> Konrad


