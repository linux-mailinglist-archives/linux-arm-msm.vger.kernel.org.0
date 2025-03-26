Return-Path: <linux-arm-msm+bounces-52525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4FA717A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:40:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85ED53B316E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 13:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA961EB5E6;
	Wed, 26 Mar 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3PccR2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB881ADFE3
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742996389; cv=none; b=F9Xt+D7ICIT/z1uuPtF9mPRlqDgBhvCOJzSJQthI2C/j3hDZ1ZUCTj+AdF/oMXep6Mbl0kRcF3eevZl3gIVzS2nWggAJvCnY0WDfitn/iY/I9H+Zlc0V8R0IxTe3rX84hyqxTkXR+SDjH8V0b4hyI5vBX4SdvCRIRv2+tnIuX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742996389; c=relaxed/simple;
	bh=kf/F+jkny4YZ6AMu9z2yztZ4555sxMojDJfUc3bbQ5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uWFLpiVt/fPn6j2PGwaIO/+rpmW5EWrrKoyRlbHUO5jSU9j33nrVtJEvD50z21uhIIMqnxuGqhEK9LeWm8o7julVsj1x6BO0L68aD59tNdYPkwibldQoKwbB/qcXugVvnSvpefDdEDhXTkc1FTKwGYs+4HaVfuDWC845UT9Zgfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3PccR2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73cH8029945
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY+54IoSFwl5DkXlueEGcXHNH/dGPmMQZUEhf3D4Gz8=; b=R3PccR2g11AvGt3A
	9gd63yRUAp/h48xNAnlloqI0zkkYwDcN9vRC1rqwG562XZU60YcRH6p0475rMSKk
	SdZoSv7CETHygqiAoKYCJWMpBNOzQtnkospRlzx3YiasVCjS6uEXCJ/KQblMa/ZQ
	cFhRr4mGRNuL+KOPWTgCZX/lueI/LjewtiSLsYy8/jjKoxCIAN5zyRU9xunYe7Ob
	sGPhdkYcd6jVLUZd0aOb/v1tYJxHt7w4NB6ENnwrc5Ja/VCTF5Pqz13xzIvYnk54
	71mXSuYGbJGWGXFA7Uwxck1/Z4lOGj+AFoVOY5QNJvD1lbQ5fR6s+OxQoYp+OdUJ
	JP7Uaw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenby3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 13:39:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso205535785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 06:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996385; x=1743601185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yY+54IoSFwl5DkXlueEGcXHNH/dGPmMQZUEhf3D4Gz8=;
        b=iPtwyb+Q4YSgM40pz0Sbj+wvi9FHvRcBYGQDiZiO1xjY/Xu/dJJjC7f/9VM9kuuMSp
         Bb8uW0kKbLt0El2L4Ku2XWVGa3K2uwcinIQVsaGIO/8/Zar8lNiEFPRXxn8ynnSa63iM
         HKaoPrbUna9fIlL6j0QYDG21Mwgj1x1+9YoboCGyFanaS9cc5LlE8vn/2utdXjppmnry
         4Lj9z6qg9rM+iAyEB9FzuvLv6/aj3ohQgUYRRuQE1lplCYuwWSnksNccXmYhLyC8Ma1E
         EgnFPlcn7XARUat4VA1KhIPBEWqC4ct7T0rwLMNa1veJZqDiKlqGSawCfASu/QhrUx67
         EvqQ==
X-Gm-Message-State: AOJu0Yzrze6iprjBWSB1+aS1qOUsl6AJV1COC9PFJxnJF49nT9GVv/rt
	f++LA3iF0ZIO7988FqJ+AsINPuQVo+e+UiyQCehLEaoIY+tvlkYhGi+pHX5covOjED1nHhzK7GC
	W3CqisZLf8FT+5mMC93KtY4kYEA9+zrRcNI2U7BPi6LLjDLGsRsAQE5kfAPV+9DEo
X-Gm-Gg: ASbGncu3Nd9rZO3sIWCJzGbo+U4Op0ws1DPPwFnvPHhx5zeBKGXM7eWEcHWCzm0IkNh
	kacmYP6M2LmW3lNhMHEgFdxzHHXK26isFd7ugAmyyoGDw4cxl5V4XQGxYcI6V7+VZ30BCpmLg3S
	GjE/ZJZcooOdeTVrMw4bqAQe4kYXu4LONkxgMBZP9tyHwcHI4cysLtblTXKWdnEf5BWa1XZ1NZ+
	887inD7T01Ab+vau3/2TeP4wsB+8Dw2W5fSh6a2vtlMjovad41Dd6pnTgMVPpl75NqfpLbOqGnc
	Yv1/3yOxl4pyxTtGJXxKxS+WEEhq36xUa6HVUggc62QewdPhOkH/fFM10AmEaPOTQM2xAg==
X-Received: by 2002:a05:620a:390a:b0:7c3:c4ba:d8a6 with SMTP id af79cd13be357-7c5ba1e9ba0mr1272912485a.14.1742996384579;
        Wed, 26 Mar 2025 06:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE30qP9JMblwOKR3SHMweTnCiZ7e3Na7JTC5GCduH+gUlOFCJ52ha4yHx4d11pPVez2ptf/w==
X-Received: by 2002:a05:620a:390a:b0:7c3:c4ba:d8a6 with SMTP id af79cd13be357-7c5ba1e9ba0mr1272909685a.14.1742996384033;
        Wed, 26 Mar 2025 06:39:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb004fsm9514631a12.40.2025.03.26.06.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 06:39:43 -0700 (PDT)
Message-ID: <0ca929c6-6ff5-4ab0-8ebf-aed3cc5f350b@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 14:39:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Melody Olvera <quic_molvera@quicinc.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250324-sm8750_llcc_master-v3-2-2afd5c0fdbde@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e403a1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=cgwDF5ybabLtFIHcvScA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: g5QkKfE2fqqQduC3bhTgrORrQuURt9k2
X-Proofpoint-ORIG-GUID: g5QkKfE2fqqQduC3bhTgrORrQuURt9k2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_06,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260083

On 3/24/25 9:29 PM, Melody Olvera wrote:
> Add support for LLCC V6. V6 adds several additional usecase IDs,
> rearrages several registers and offsets, and supports slice IDs
> over 31, so add a new function for programming LLCC V6.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

[...]

> +
> +	if (config->parent_slice_id && config->fixed_size) {
> +		attr2_val |= FIELD_PREP(ATTR2_PARENT_SCID_MASK, config->parent_slice_id);
> +		attr2_val |= ATTR2_IN_A_GROUP_MASK;
> +	}

This is fragile if parent_slice_id == 0, but let's say this is not an issue
for now..

> +
> +	attr3_val = MAX_CAP_TO_BYTES(config->max_cap);
> +	attr3_val /= drv_data->num_banks;
> +	attr3_val >>= CACHE_LINE_SIZE_SHIFT;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr2_cfg, attr2_val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(drv_data->bcast_regmap, attr3_cfg, attr3_val);
> +	if (ret)
> +		return ret;
> +
> +	slice_offset = config->slice_id % 32;
> +	reg_offset = (config->slice_id / 32) * 4;
> +
> +	wren = config->write_scid_en << slice_offset;If I'm reading the wrappers right, you should be able to drop both the
shifting and intermediate variables with regmap_assign_bits()

Looks good otherwise

Konrad

