Return-Path: <linux-arm-msm+bounces-54246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0432A88188
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F9F23A57E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9140C2BE7BA;
	Mon, 14 Apr 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbrucH6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7846A7081C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636634; cv=none; b=R9f7DVVYf/8nQTMIRlSj3vXgIpbRuRL8k2RSY4o9UXvD7CHqiWJFSUzttr/L+PPN3PEeIBc0LJ8Lpc/hjn2RwzEkkriRY3o22BzL1MMBxYurWX8ommkighabT1EoDR5dse4wW6re9Z+Agt20b19/V7WSwunBscQ/ur1WXn/uQls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636634; c=relaxed/simple;
	bh=Zrb43kFWTVR3Ap7CSrwLk4KdL5IDZkubcFHeBrO1oPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djeJnz7wVtTUx6iRfIo/OIczu2553qjPgKSIa5Z8pQL0tiLD97t65TumMfc1ABE/RH7xYa/3Eh+sl/bDhwB1+krhevXpOJXl4sMHu7kZQx5XIua1HzdalTx4+Oo1pz8+Dkl/huGyqQG+hJ/oi0dDsyjLwrYl8LpWUDiiyGnm2bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbrucH6q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99obn031343
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhLo8hSG2Sld52yb+t7u12oLKb8fAopxH7KGEdG/7u4=; b=LbrucH6qkNHhnwDq
	VqnpY1Uu8aBi8aT+FJVkIaU8ZYRL/rz6ufU4ip4mnCqLAYkJ0OaPiY/j23TFaE0l
	YKkTRQftvLF3mpuXf8/NMJMH23E2XduSwpoAk25TMveScHlywqdbT73Wnr8QcUk7
	8pS9v275A7I20BwTvszBWhrW+5fJZU10moodSdyHboSQMArAvJkkcGmO5gHsbvoj
	kvY1sx8Wij1X+IkEgRBeqh/VuqSk9/u2zCs3ghYDfAQ2vwt45Gn7mEW68TkGet/x
	seRCC4ZdBquBDq2XzX5ncnoLAfaWJU2ecqNK7uERhnuOvlHcundxmb8mc3A2TiDs
	nupA+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjvhtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:17:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7789335f7so17993685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636629; x=1745241429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhLo8hSG2Sld52yb+t7u12oLKb8fAopxH7KGEdG/7u4=;
        b=YY2ViZ/r0hbLV247bpOGvz+macT6gYh1o/fiHZ3LZqHn7cYnnwsIRFzgjMAEQVHWk5
         radWzjR3pzSoBeMSskmf+5CBJkSsKvy0fjANSaW3a5j2o0s193W7BvhDsRCuCynwP0Na
         97SIDOOR+UCgwoVhEFMUbMCq5c2bOiPySRhfXTHmYdq1SZm/prHfqcFgVsO3AXgBMP27
         xqMa4UQq68pQSukj8z7XwP9ydprN0si1ilDnYglvJ97Rd2myM0L2f9h995+mm9TA1J+n
         u2s9ZmF+I3MBqL6DleQxfSSzZQXK/VoxXkMx8zUcmN1ysu9JGPxyKvyA3DgkPy4I9PtL
         Q5Uw==
X-Gm-Message-State: AOJu0Ywu9VcAlj2jc4Rd6gvOBmz532ZifX3ZECoA2V1rT+9nZdNk1ZId
	bk6ba1tyKgv90dh4XSyXPH5au09dys3XdJND6m/bOE8o7AT0tk6GAj2g7qIXSs31Exo0oa/E9vG
	mRCPRXfh3mC9c+PkewBJk3h5m2vMwXtca9iNbLo4uR0pwsWT5oAGimEorRDBVGUfz
X-Gm-Gg: ASbGnctcbzvyCTsI0vR+4TKDW079FhzzjucYsrHblsyPQvtf99QzPSacrvRd8RpEd+i
	z4tQp2zxY4OVLvkJdr1Sk4ybJvUCZV0FgK6EpK/oiQMs3+vkGp6lNDCr5AA07Q9w15c5rwmm3FX
	phtpfRpcQRfjycY6LqvRkgunxVxfoOWLWnZyjS3d+QJFXpygjCqFU5jXexqADNkMqOhfyvWqGFa
	6C0gKLsGJi5Vxx/qe47qA76Q4ZoxgNAaiOhHc/UAcXiQ+zSU267HfeQJz5SiaWVHJHuusxJC7+D
	oFV9t9nyBriZQstHyCnxFN85z2GLUY9SqLxTHF3kTO9kaIZZVUhi4CjFPkt7Af990w==
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr760506985a.5.1744636629135;
        Mon, 14 Apr 2025 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt6LiWKzY6fMPs2bAMNAcdjvfSSy0XirJTkEaglVnC5MXIbVEOqGO5m0fSpi/xvMwYDjLw1Q==
X-Received: by 2002:a05:620a:4093:b0:7c3:d1b9:e667 with SMTP id af79cd13be357-7c7af1037bfmr760496185a.5.1744636626494;
        Mon, 14 Apr 2025 06:17:06 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef61911sm4872735a12.32.2025.04.14.06.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:17:05 -0700 (PDT)
Message-ID: <629bcae5-f999-448c-885f-4737ac0c64c3@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Melody Olvera <quic_molvera@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-2-2afd5c0fdbde@quicinc.com>
 <0ca929c6-6ff5-4ab0-8ebf-aed3cc5f350b@oss.qualcomm.com>
 <92b6ea9d-0b13-472f-afad-2b67d869a0bb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <92b6ea9d-0b13-472f-afad-2b67d869a0bb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fd0ad6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=gk2TToWdodi_jzWV97IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: UHfjTOtbaOsH_7Ih8zL7gQ792brMiFar
X-Proofpoint-ORIG-GUID: UHfjTOtbaOsH_7Ih8zL7gQ792brMiFar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140097

On 4/9/25 11:16 PM, Melody Olvera wrote:
> 
> 
> On 3/26/2025 6:39 AM, Konrad Dybcio wrote:
>> On 3/24/25 9:29 PM, Melody Olvera wrote:
>>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>>> rearrages several registers and offsets, and supports slice IDs
>>> over 31, so add a new function for programming LLCC V6.
>>>
>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>> ---
>> [...]
>>
>>> +
>>> +    if (config->parent_slice_id && config->fixed_size) {
>>> +        attr2_val |= FIELD_PREP(ATTR2_PARENT_SCID_MASK, config->parent_slice_id);
>>> +        attr2_val |= ATTR2_IN_A_GROUP_MASK;
>>> +    }
>> This is fragile if parent_slice_id == 0, but let's say this is not an issue
>> for now..
> 
> Agreed, but I don't anticipate that being an issue. I don't think any slice ID is/will be 0.
> 
>>
>>> +
>>> +    attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
>>> +    attr3_val /= drv_data->num_banks;
>>> +    attr3_val >>= CACHE_LINE_SIZE_SHIFT;
>>> +
>>> +    ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    slice_offset = config->slice_id % 32;
>>> +    reg_offset = (config->slice_id / 32) * 4;
>>> +
>>> +    wren = config->write_scid_en << slice_offset;If I'm reading the wrappers right, you should be able to drop both the
>> shifting and intermediate variables with regmap_assign_bits()
> 
> I'm not so sure. I tried with regmap_assign_bits and it seems the correct way to use it would be roughly:
> 
> regmap_assign_bits(drv_data->bcast_regmap,
>             cfg->reg_offset[LLCC_TRP_WRS_EN], BIT(config->slice_id),
>             (bool)config->write_scid_en);
> 
> but the third argument is an unsigned int (the BIT(config->slice_id)). I tried just putting the slice_id there,
> but got some bizarre results leading me to believe that's not the correct way to use this api. If I'm missing
> something, let me know, but AFAICT, this is six one way, a half-dozen another.

Yeah let's not waste time on this

Konrad

