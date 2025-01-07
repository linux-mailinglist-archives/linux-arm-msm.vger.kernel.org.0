Return-Path: <linux-arm-msm+bounces-44073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612FA03722
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 05:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4260163A77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 04:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31029770FE;
	Tue,  7 Jan 2025 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gm6mMTsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1614418EAB;
	Tue,  7 Jan 2025 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736225449; cv=none; b=lnK2P9nJdjRaNcODdPOzKb5XpbwcYmvIya5niIOgyTtuneB6rvZgKQ+fwzl3pQXyXwoXq562g8u4YNG1yv9I2h6GoiuAwsO293a4R/iqcGiivmLQ3MsC2pzAex2Pbl15RbBchp56B0ijg8QblHDVE1jcxEpd3C66uqsIn4JBCu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736225449; c=relaxed/simple;
	bh=gA6FSYqlWzCZt24ckVeukqaY2K8DYVmZoSXqGbxO+U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ghXGI/TjhC1w+wUoHyyKSLn6BNzUSRv7eWapIYbBmLFhGOK2pzY/SJPJo1bUJFPaiFXwbpoKeWyPdyB6KCliRr/uv2ul+A5TZ7Vu7JQ4TNcdgM4lwKXRhZSuFtGZn/niaCJCquRGwl9PqSpL8K/LRPaTIooeWmeI237jOmmBrss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gm6mMTsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5073PmJO006516;
	Tue, 7 Jan 2025 04:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WpkrPrWawUtuFQj866JPaYVpcE429Endl8YKxCDDzg=; b=gm6mMTsjGnaLhdA1
	UDLaBE0T4YqF57tfKPZvt+IRCnlNbf+oqYp8eFN9D2qIO+wjsh11GVMj02+IFWfw
	lfv8h5u8EOuoKxSZbqRNEiXjtOuJeGtr1gb3skBbYp35S9T6MNdagohgcuv0NnCE
	+aQ2v/eCof9iDKzIM6likcYO0yBvmEEFiTIVGBjfqSV5WI0AAvLiwvsZaCVvSxh2
	xPmzVxgrdz+cukBSVJPxe/HtlL/wZWLPc5nQdOZu47QcTJYWZ4W22z7xueCY38p4
	UBMiF+eTH3PnPX5VpALc5SiFwcZwXMVRGnmhAq+ahyc+0gRlXbn85uDVrv4YpzWc
	1TUbQA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vbu0515-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:50:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5074oVMv030536
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 04:50:31 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 20:50:27 -0800
Message-ID: <aeb30048-cdcd-4746-9e86-11beaa2b0cad@quicinc.com>
Date: Tue, 7 Jan 2025 12:50:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Add writeback support for SM6150
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>, <quic_fangez@quicinc.com>
References: <20250106-add-writeback-support-for-sm6150-v1-1-1d2d69fc4bae@quicinc.com>
 <acd91ca7-1951-4711-b76a-afe583eb0b27@quicinc.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <acd91ca7-1951-4711-b76a-afe583eb0b27@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ypFGH6d-1VmqEZ6L-Ye_4N5rySz3Yx81
X-Proofpoint-GUID: ypFGH6d-1VmqEZ6L-Ye_4N5rySz3Yx81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070035



On 2025/1/7 3:15, Abhinav Kumar wrote:
> 
> 
> On 1/5/2025 10:39 PM, Fange Zhang wrote:
>> On the SM6150 platform there is WB_2 block. Add it to the SM6150 catalog.
>>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>> A followup patch to add writeback configuration for the SM6150 catalog
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 18 ++++++++ 
>> ++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/ 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> index 
>> 621a2140f675fa28b3a7fcd8573e59b306cd6832..6d32deead77728264b6de6d5fd2843a81afdf355 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> @@ -27,6 +27,7 @@ static const struct dpu_mdp_cfg sm6150_mdp = {
>>           [DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
>>           [DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
>>           [DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
>> +        [DPU_CLK_CTRL_WB2] = { .reg_off = 0x3b8, .bit_off = 24 },
>>       },
>>   };
>> @@ -164,6 +165,21 @@ static const struct dpu_pingpong_cfg sm6150_pp[] = {
>>       },
>>   };
>> +static const struct dpu_wb_cfg sm6150_wb[] = {
>> +    {
>> +        .name = "wb_2", .id = WB_2,
>> +        .base = 0x66000, .len = 0x2c8,
> 
> This is not correct.
> 
> WB_2 offset is at 0x66000. However, MDP base address accounts for the 
> 0x1000 offset. So this should still be 0x65000.
> 
> Why is 0x66000 used here? It does not match the docs.
sorry, missed it, yes it should be 0x65000, will fix it in next patch.
> 
> How was this change verified?
i checked drm state, and found the new writeback connector is loaded 
successfully.
> 
>> +        .features = WB_SM8250_MASK,
>> +        .format_list = wb2_formats_rgb,
>> +        .num_formats = ARRAY_SIZE(wb2_formats_rgb),
>> +        .clk_ctrl = DPU_CLK_CTRL_WB2,
>> +        .xin_id = 6,
>> +        .vbif_idx = VBIF_RT,
>> +        .maxlinewidth = 2160,
>> +        .intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
>> +    },
>> +};
>> +
>>   static const struct dpu_intf_cfg sm6150_intf[] = {
>>       {
>>           .name = "intf_0", .id = INTF_0,
>> @@ -244,6 +260,8 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
>>       .dspp = sm6150_dspp,
>>       .pingpong_count = ARRAY_SIZE(sm6150_pp),
>>       .pingpong = sm6150_pp,
>> +    .wb_count = ARRAY_SIZE(sm6150_wb),
>> +    .wb = sm6150_wb,
>>       .intf_count = ARRAY_SIZE(sm6150_intf),
>>       .intf = sm6150_intf,
>>       .vbif_count = ARRAY_SIZE(sdm845_vbif),
>>
>> ---
>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>> change-id: 20250106-add-writeback-support-for-sm6150-ba7657196ea8
>>
>> Best regards,


