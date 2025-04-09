Return-Path: <linux-arm-msm+bounces-53738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0FA83315
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 23:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 426D13A5C90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 21:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D30B202C40;
	Wed,  9 Apr 2025 21:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YtAK71wN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417F1155C97;
	Wed,  9 Apr 2025 21:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233383; cv=none; b=BjEN3yOFfAHGDElkbFPysbCJczONVAH2BmANXI7umM2YEyBSZadYfd67ZY67JyuV2efsxmiWmlLgvhL54xia6JmJA/+0BokcneQ4EzjgY6qq5tgC5on+C7ZofTDYRaz1/Mz705oRtsKpC+I1J2jf4Wo17fKHpMYtPYKE8WuVfzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233383; c=relaxed/simple;
	bh=r+FCOM4FxN8EdgC44yZEyioV6YS73ZEgUGDU3vCHZSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u1Xigqc1O2vwHbOMch7hCceW437jo/hEQzP4PfXYeWwUj2XZCt65NGkgjHi9q/x1u6mXOJQE1yg9LF1OBZmeDZOBOdfOiDkj8fWsF1ly3TYmuXA9EEcMY+fdM3XGOiIKrhRgNSINvtiRFTSccn3Z+vl2Hfvq2TGS5C0hIE5zMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YtAK71wN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539IHWsI002286;
	Wed, 9 Apr 2025 21:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAoVU227KYJbM1z8Qce+FIEVBao6f+hjFeNa5g5KkP0=; b=YtAK71wNtc3Km4R9
	7NNe9W419Cdh2ry4vG6/0cUezWo5OXuS2PS+nW/Uk5IjFXwhWaAzmNFct96U2XXS
	aFbWe1a3xkdqtmMThCe5VVWdaJ1NY2cetUYhLdAGiTz3Hg50GWhhCP8vHldboJNF
	+SZcv4vnJnbAQrDoEUaWj5LcBxxxWzfT4m/HC7MToVwxrAVXvHZsVKCq2tj61I2s
	sAfVPCa+sK+exaAZ5VPmmnRyrx9p4oVItEySebyfhFKn9hdg7HgIpzjUTEXWItnt
	ftgKE5E3EYWY88ATmEw9MBhPJkt0C74zia+llbYYgBAF/JJ+0X6r85XNyTkZg2+L
	YzFFsg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1mmnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 21:16:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 539LGDTj019433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 21:16:13 GMT
Received: from [10.71.111.82] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Apr 2025
 14:16:13 -0700
Message-ID: <92b6ea9d-0b13-472f-afad-2b67d869a0bb@quicinc.com>
Date: Wed, 9 Apr 2025 14:16:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley
	<conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com>
 <20250324-sm8750_llcc_master-v3-2-2afd5c0fdbde@quicinc.com>
 <0ca929c6-6ff5-4ab0-8ebf-aed3cc5f350b@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <0ca929c6-6ff5-4ab0-8ebf-aed3cc5f350b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b5qxgxy_sQ0Z-RQs4yqsgZoM5jK0fInt
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f6e39f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ARX7N87W17KPkUc0mbYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: b5qxgxy_sQ0Z-RQs4yqsgZoM5jK0fInt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090144



On 3/26/2025 6:39 AM, Konrad Dybcio wrote:
> On 3/24/25 9:29 PM, Melody Olvera wrote:
>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>> rearrages several registers and offsets, and supports slice IDs
>> over 31, so add a new function for programming LLCC V6.
>>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
> [...]
>
>> +
>> +	if (config->parent_slice_id && config->fixed_size) {
>> +		attr2_val |= FIELD_PREP(ATTR2_PARENT_SCID_MASK, config->parent_slice_id);
>> +		attr2_val |= ATTR2_IN_A_GROUP_MASK;
>> +	}
> This is fragile if parent_slice_id == 0, but let's say this is not an issue
> for now..

Agreed, but I don't anticipate that being an issue. I don't think any 
slice ID is/will be 0.

>
>> +
>> +	attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
>> +	attr3_val /= drv_data->num_banks;
>> +	attr3_val >>= CACHE_LINE_SIZE_SHIFT;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	slice_offset = config->slice_id % 32;
>> +	reg_offset = (config->slice_id / 32) * 4;
>> +
>> +	wren = config->write_scid_en << slice_offset;If I'm reading the wrappers right, you should be able to drop both the
> shifting and intermediate variables with regmap_assign_bits()

I'm not so sure. I tried with regmap_assign_bits and it seems the 
correct way to use it would be roughly:

regmap_assign_bits(drv_data->bcast_regmap,
             cfg->reg_offset[LLCC_TRP_WRS_EN], BIT(config->slice_id),
             (bool)config->write_scid_en);

but the third argument is an unsigned int (the BIT(config->slice_id)). I 
tried just putting the slice_id there,
but got some bizarre results leading me to believe that's not the 
correct way to use this api. If I'm missing
something, let me know, but AFAICT, this is six one way, a half-dozen 
another.

Thanks,
Melody

>
> Looks good otherwise
>
> Konrad


