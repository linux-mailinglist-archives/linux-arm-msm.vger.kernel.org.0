Return-Path: <linux-arm-msm+bounces-42520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829F9F497F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E61216BC54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 11:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC491DFE0C;
	Tue, 17 Dec 2024 11:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y75yTFa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F941CD215;
	Tue, 17 Dec 2024 11:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734433364; cv=none; b=jzgNZBHxrrbwOfgBLQT4WB3t2zpq3trDma6mg2qCjtsA6EWJQ4/BmxkpPfMRRku1Nj20DZagPUFtCQDcSFCUhso2tXVws/eRoKhPn4ygnOeGA/+NnF06UEQbWQ6vtDMU4I8gi+7ywcO0MxjPwTFXhnAYox9QwxlDzBUEYLhsO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734433364; c=relaxed/simple;
	bh=k9jRpF1FSyMwNj7gw2vTBuoN2nYoDwzY+sH5IIwClb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gLyDuIeq50HZVx9b8En8DAfDV02adJmGS1o5+qmJwvQhGIMOQw5UeY8Id/zDu2hJshu8VOQsHfdxjjD5E+NCITsl2XP1sFSpD8f6Nk+12k8PZzChgdi9NggnqTGiRyEGieR5sOvWNRaIYpKYekt68wkMEKxDoggTT76mLlswNVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y75yTFa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6RaNc002735;
	Tue, 17 Dec 2024 11:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/UEEKnJSCLAcig2TeX2+ECErL1789cyoyRocGA+Rig=; b=Y75yTFa/dYF1upt/
	Q0LI/rEHDtjgszW/ZPzllrbj5bE7c958dVxOryT6iCUhAzordd3tiMH+n3ivg7QV
	cqqMF4krSYLQ3EYicj/TaTSUg6AKbZYWlc2Qd1TUVO8KE2wvMxARt+K8a/JbS5ex
	AtkXNZs9P43bp/4GTnkgctJvwsref2Zr3I/SpraLNe/3oEHszjneIAYTTVH65ZVc
	TM+Sw/LHVQN5SLs59ZeCd9tzUp/RcRWIekaCmOSlBzFjEPqVv+oq8QbbwtDkPNV4
	zFrySocOCE+/ACKExZqQz6uBRi9vq46hHQzrcFjWiuXEt/Q2R5ZKeP9VoQlYV36C
	tHbmYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k424gs37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:02:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHB2OTI031577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 11:02:24 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Dec
 2024 03:02:17 -0800
Message-ID: <ba59f164-2ccd-4cf9-9426-9b6a2c199224@quicinc.com>
Date: Tue, 17 Dec 2024 19:02:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liu Li
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
 <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zhQzBUp5kvAn7wY0sTvHo4kcdgYHBDui
X-Proofpoint-ORIG-GUID: zhQzBUp5kvAn7wY0sTvHo4kcdgYHBDui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170091



On 2024/12/17 18:54, Dmitry Baryshkov wrote:
> On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add definitions for the display hardware used on the Qualcomm SM6150
>> platform.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 257 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> 
> [...]
> 
>> +
>> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
>> +	.mdss_ver = &sm6150_mdss_ver,
>> +	.caps = &sm6150_dpu_caps,
>> +	.mdp = &sm6150_mdp,
>> +	.ctl_count = ARRAY_SIZE(sm6150_ctl),
>> +	.ctl = sm6150_ctl,
>> +	.sspp_count = ARRAY_SIZE(sm6150_sspp),
>> +	.sspp = sm6150_sspp,
>> +	.mixer_count = ARRAY_SIZE(sm6150_lm),
>> +	.mixer = sm6150_lm,
>> +	.dspp_count = ARRAY_SIZE(sm6150_dspp),
>> +	.dspp = sm6150_dspp,
>> +	.pingpong_count = ARRAY_SIZE(sm6150_pp),
>> +	.pingpong = sm6150_pp,
>> +	.intf_count = ARRAY_SIZE(sm6150_intf),
>> +	.intf = sm6150_intf,
>> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>> +	.vbif = sdm845_vbif,
>> +	.perf = &sm6150_perf_data,
> 
> I noticed that the catalog entry doesn't provide writeback configuration
> although the vendor DTSi specified that there is WB_2 on this platform.
> Please send a followup patch enabling writeback on this platform.
ok, will update it in next update
> 
>> +};
>> +
>> +#endif
> 


