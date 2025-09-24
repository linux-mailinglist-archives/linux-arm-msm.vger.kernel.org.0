Return-Path: <linux-arm-msm+bounces-74582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7CB99815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 12:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6081619C73D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 10:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF4922541B;
	Wed, 24 Sep 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhm3iKyA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D71A9F8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758711258; cv=none; b=C4pW01Q01PHR19e0dvbQmjIUa+mZvMi5q0vKkfAvfbkNQ8ZBZv0skON37/xSqEJv/JH5Sbd8itVgWkMRHZg4xpQEie1jBEXA4h/zx7Ea18jeMVRgXn/WiV73M19HBR8elPZfq2mhGXr+FWOlKqGNLcWwiC/8ekxorSEsJuzuIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758711258; c=relaxed/simple;
	bh=oT1z5JxaCkcHXs3x0iDnCU/v0li7LGqT+H3MjvUGNQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoskOXLkqW/Eb1560qEPl5KR72IKCPY12/y6htAe3RMCWg5x+fGjM4dm/aPc6RWlSdVy4ttBDuXA5LX/o/8H1QDg5GhqcZtkgIrCKuK7eBFssAsqns6/itaH+k9PvKDyNCBCWv/bC3UkeNQePveNX0LNi8MkTmVQQvnG3uCqMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhm3iKyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iFON027779
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSS+1e+gt7F7YUw/cKXNEYGCABVjM4iXTnQn4w30LXM=; b=bhm3iKyAtu7Lu3oE
	XV+mtqYV3Eszs2cTVhblgnQnmZtbQ9n1zC/zHReNt+0VW8NgI2sFRm9dngsQxyfB
	z2KfRQs1tkMQkMZtGJkUIaAXM1MusIKx7q9xE9EOJFs0tQw6f5n8699tiIYaCD5w
	eSiT2hs+8gXyfEm2aDcemcrIjvqEojjwMWyMTKrYYY+Ef0aXNgnfbwj8QI2Rj6bK
	1zei5DgwsJ6xqN3/ZG2u5ev4mSjx8UZVYKZ+VrkT7zpJ2yuutNgDoUboMMy1YY3v
	FXeI5dDCn33YvX94PrFiFwhYoMj+KArhrVUp/aCUGX0z+HSix1bgxngJhK5Igc0b
	lPfaYg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnvbu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 10:54:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77e7d9ed351so4468116b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 03:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758711253; x=1759316053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JSS+1e+gt7F7YUw/cKXNEYGCABVjM4iXTnQn4w30LXM=;
        b=PZg8sVNQ2emED8hqvaz4kzsDk4vVmMTcF0jAUKsH5VITE0SSIEqp1s/sJwb5zcHVOW
         D9Cf5Vz794H/L/moBQm7x/l31zy5o5nQId2S+GOjWifHzFHX4+dcEZ9RWHpfx0cDzvs3
         0xKzvnLcEhbmxlXXwPbWKQn97Xzd+M0t/hyibWjt/xsDBqVv+2/TfoyiM2jhrxHr2ce9
         0VtJTNimZrXEy8HKpx/GWVc04+KRvKDQiKt9OsiGUmaeKYjmicRKVmsxqbzE6uoXJu1L
         S5l12exoX7ynUhy4RGRiAvJaRZBuNzFIw6Gwxj8tqX9Nw8/Uq1NeKNCBlVyFBgdaYump
         t2xw==
X-Forwarded-Encrypted: i=1; AJvYcCX11CEc6o1UeGxYsjkgMxRXR9iVZsnMuAoYG/HLuSmNM4O3HJeVXNckZY79UGZDMNHCTuZ7bDlJtPOT0iyr@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdrUQEFLbQ+RRbVusa+ESpcVmSzyM3bSrX3C1dzZ/GuME/WnU
	cpxjncqmnIwMtWddLb6l82bFLeTkpZivxp0CM+K/a2mlLrHK/lz0CiyMxET++gZstuRNXnEH3GU
	317JMitkl0Nt1M3lwctK1CJ6E1ZUlZ5JrYWPfNV4wceGENGRyGt/H+8IXFjAIUplxdKfs
X-Gm-Gg: ASbGncvmQcMaAU0vy57MF5NUKwEl0zOucLbEXnlOli8Lka//ohpP2lhw64rWURtk7qm
	hdTULtTBUYBU+LuZfwkG3HNo4PisqmIsL6oYTkmR/nZCms8B1877jadL9o5tpSdvrzYJgdTkZbb
	r3Qxs1WaTCh/N2/9PNoMLFxJTUCL1LdDMyy9IiwcWF8AeB6Sa2S74Tj6g2a8MwiU8+24O7dZ3cQ
	pnHYwxckFLBtUFoIDh3Yvfm8K72S/Ky8lFC3xTMun7WpOHGcMyeV7J3f1mF2j7MkPDl/3Fg4f2t
	Y5Ck95GMmWrdPiMU6e8LsHt7SrUCX0PBqQCCkCBs+sHNtbZyWcHgO3b/HXu5cmiCWhLWNLcJew=
	=
X-Received: by 2002:a05:6a00:1398:b0:772:63ba:127 with SMTP id d2e1a72fcca58-77f53aa656cmr8013955b3a.24.1758711252917;
        Wed, 24 Sep 2025 03:54:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkk3zLohmUvhkW4YeeMScuehmTSlCnUkX7YIdy8aRbLfTbPw3eiVk5vZgbOYjGpTimKDYuGw==
X-Received: by 2002:a05:6a00:1398:b0:772:63ba:127 with SMTP id d2e1a72fcca58-77f53aa656cmr8013920b3a.24.1758711252401;
        Wed, 24 Sep 2025 03:54:12 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2fdfbffesm9443835b3a.73.2025.09.24.03.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:54:11 -0700 (PDT)
Message-ID: <81932285-b007-7cdf-a28d-21131a26eb85@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:24:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <d2qkd3k7pv7cv3rf76nf3wxedqagg7egz7q2vipiddxzbac5oj@rva7gymbaof7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3cdd6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=jALX246FgZPKRjHUN40A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: zXCt2Gy2gEzxnPhyMHwszA5uiS9YT2c-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX8cGIH0Jg08O0
 5R6LZP8DpMPoj3/kr0NqMfSIl1wbsZ5vMKDVvv1hWyrQyRZ0xfTJkgwzTK0kJr2+GMbUCxasnll
 kuhvuB4dNj3vqkLJA9CqM5RKPlUyELuXPl2iJZWlHdVjZpgcUmlr1oCU1Yy7qYsGzRBZpSkMinO
 fq6Uy9ojpWqSiCrJQrhp97OoZbK+whgFKB1ToahK6jlah4qNkFnssrJ+efbF0pqBZr556G/6AiJ
 wfvYlYTXbQh0c3GRzzAAvjPFH+CoDGMHcQUaqSxIcvY/NH49v3X1y4uMN8WGOdoJ8eJcrxESR7b
 3KrNWCQiS5V53xfaRD/R47rFUtLjaIRCy+aHuBb3aR+SiNYmEvmC8C7rlLuSkd87TSnJyzmKWAu
 apN9zMAI
X-Proofpoint-GUID: zXCt2Gy2gEzxnPhyMHwszA5uiS9YT2c-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000



On 9/19/2025 10:24 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 09:17:16PM +0530, Dikshita Agarwal wrote:
>> Introduce handling for the QC08C format in the decoder.
>> Update format checks and configuration to enable decoding of QC08C
>> streams.
> 
> What is QC08C? Is it supported on all devices?

It's qualcomm specific compressed format, it's defined here
https://elixir.bootlin.com/linux/v6.17-rc2/source/include/uapi/linux/videodev2.h#L820

And Yes, it's supported on all Qualcomm devices supported by iris driver.

> 
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>  drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>  drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>  drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>>  8 files changed, 89 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>  		case BUF_INPUT:
>>  			return iris_dec_bitstream_buffer_size(inst);
>>  		case BUF_OUTPUT:
>> -			return iris_yuv_buffer_size_nv12(inst);
>> +			if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>> +				return iris_yuv_buffer_size_qc08c(inst);
>> +			else
>> +				return iris_yuv_buffer_size_nv12(inst);
>>  		case BUF_DPB:
>>  			return iris_yuv_buffer_size_qc08c(inst);
>>  		default:
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
>>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>  		if (iris_split_mode_enabled(inst)) {
>>  			fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -				HFI_COLOR_FORMAT_NV12_UBWC : 0;
>> +			fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
> 
> This needs some explanation.

We are enabling QC08C format in iris driver with split mode, which means we
need to set UBWC format for DPB (reference buffer) buffers to firmware,
since firmware only supports UBWC format for DPB buffers.

> 
>>  
>>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>  			if (ret)
>>  				return ret;
>>  
>>  			fmt.buffer_type = HFI_BUFFER_OUTPUT2;
>> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
>> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>  
>>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>  		} else {
>>  			fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
>> +			fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +				HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>  
>>  			ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>  		}
>> @@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
>>  	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>>  	struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
>>  
>> +	if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>> +		return 0;
>> +
>>  	pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>  	pconstraint.num_planes = 2;
>>  	pconstraint.plane_format[0].stride_multiples = 128;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>>  						  sizeof(u32));
>>  }
>>  
>> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +	u32 opb_enable = iris_split_mode_enabled(inst);
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_OPB_ENABLE,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32,
>> +						  &opb_enable,
>> +						  sizeof(u32));
>> +}
>> +
>>  static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>  {
>>  	u32 port = iris_hfi_gen2_get_port(inst, plane);
>> @@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>  
>>  	if (inst->domain == DECODER) {
>>  		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
>> +		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>  	} else {
>>  		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>  		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
>> @@ -527,6 +542,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>  		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
>>  		{HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
>>  		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
>> +		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
>>  		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>>  		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>>  		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
>>  #define HFI_PROP_BUFFER_MARK			0x0300016c
>>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
>>  #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
>> +#define HFI_PROP_OPB_ENABLE			0x03000184
>>  #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
>>  #define HFI_PROP_END				0x03FFFFFF
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -15,12 +15,17 @@
>>  #define DEFAULT_WIDTH 320
>>  #define DEFAULT_HEIGHT 240
>>  
>> -enum iris_fmt_type {
>> +enum iris_fmt_type_out {
>>  	IRIS_FMT_H264,
>>  	IRIS_FMT_HEVC,
>>  	IRIS_FMT_VP9,
>>  };
>>  
>> +enum iris_fmt_type_cap {
>> +	IRIS_FMT_NV12,
>> +	IRIS_FMT_UBWC,
> 
> UBWC is not a format on its own, it's a modifier of the format. Please
> come up with a better naming.

Sure, will rename this to IRIS_FMT_QC08C inline with v4l2 definition.

> 
>> +};
>> +
>>  struct iris_fmt {
>>  	u32 pixfmt;
>>  	u32 type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
>>  };
>>  
>>  static const u32 sm8550_vdec_output_config_params[] = {
>> +	HFI_PROP_OPB_ENABLE,
>>  	HFI_PROP_COLOR_FORMAT,
>>  	HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>  };
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
>>  
>>  bool iris_split_mode_enabled(struct iris_inst *inst)
>>  {
>> -	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
>> +	return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
>> +		inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>>  }
>>  
>>  void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>  	kfree(inst->fmt_src);
>>  }
>>  
>> -static const struct iris_fmt iris_vdec_formats[] = {
>> +static const struct iris_fmt iris_vdec_formats_out[] = {
>>  	[IRIS_FMT_H264] = {
>>  		.pixfmt = V4L2_PIX_FMT_H264,
>>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> @@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
>>  	},
>>  };
>>  
>> +static const struct iris_fmt iris_vdec_formats_cap[] = {
> 
> s/formats_cap/formats_capture/

Ok.

Thanks,
Dikshita

> 
>> +	[IRIS_FMT_NV12] = {
>> +		.pixfmt = V4L2_PIX_FMT_NV12,
>> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +	},
>> +	[IRIS_FMT_UBWC] = {
>> +		.pixfmt = V4L2_PIX_FMT_QC08C,
>> +		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +	},
>> +};
>> +
>>  static const struct iris_fmt *
>>  find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>  {
>> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> -	const struct iris_fmt *fmt = iris_vdec_formats;
>> +	const struct iris_fmt *fmt = NULL;
>> +	unsigned int size = 0;
>>  	unsigned int i;
>> +	switch (type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		fmt = iris_vdec_formats_out;
>> +		size = ARRAY_SIZE(iris_vdec_formats_out);
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		fmt = iris_vdec_formats_cap;
>> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +		break;
>> +	default:
>> +		return NULL;
>> +	}
>>  
>>  	for (i = 0; i < size; i++) {
>>  		if (fmt[i].pixfmt == pixfmt)
>> @@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>  static const struct iris_fmt *
>>  find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>  {
>> -	const struct iris_fmt *fmt = iris_vdec_formats;
>> -	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> +	const struct iris_fmt *fmt = NULL;
>> +	unsigned int size = 0;
>> +
>> +	switch (type) {
>> +	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +		fmt = iris_vdec_formats_out;
>> +		size = ARRAY_SIZE(iris_vdec_formats_out);
>> +		break;
>> +	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		fmt = iris_vdec_formats_cap;
>> +		size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +		break;
>> +	default:
>> +		return NULL;
>> +	}
>>  
>>  	if (index >= size || fmt[index].type != type)
>>  		return NULL;
>> @@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>>  		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		if (f->index)
>> +		fmt = find_format_by_index(inst, f->index, f->type);
>> +		if (!fmt)
>>  			return -EINVAL;
>> -		f->pixelformat = V4L2_PIX_FMT_NV12;
>> +		f->pixelformat = fmt->pixfmt;
>>  		break;
>>  	default:
>>  		return -EINVAL;
>> @@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>  		}
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +		if (!fmt) {
>>  			f_inst = inst->fmt_dst;
>>  			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>>  			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> @@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>  		inst->crop.height = f->fmt.pix_mp.height;
>>  		break;
>>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>> +			return -EINVAL;
>> +
>>  		fmt = inst->fmt_dst;
>>  		fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -		if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
>> -			return -EINVAL;
>>  		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>  		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>  		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> @@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
>>  {
>>  	const struct iris_fmt *fmt = NULL;
>>  
>> -	if (pixelformat != V4L2_PIX_FMT_NV12) {
>> +	fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +	if (!fmt) {
>>  		fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>  		if (!fmt)
>>  			return -EINVAL;
>>
>> -- 
>> 2.34.1
>>
> 

