Return-Path: <linux-arm-msm+bounces-44485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA2A06996
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 00:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CBB01885D94
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED7D6204C1A;
	Wed,  8 Jan 2025 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B/fe4x3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F303204C2A;
	Wed,  8 Jan 2025 23:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379677; cv=none; b=iv/NgeQJuKRJ01ykR4fv3+qcE853noSZrWx0wNf5hzbBWTgB8CezPo6QtjnVL3PqykH8nxDCP8J5sw5ieu2ilQu8C7apuf7lkhB1DSvvnJcbAdtCj8lS0xFWqIeofW/SissEvTa2sMZrxPSLhnNcHbRKtGZO08TsMWHXkuNd7fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379677; c=relaxed/simple;
	bh=CcE4N8GZykTnQZSKNYqt1O94q2aijywmnEGJAZLDWVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NLh1IsYd0cRkdsrPHexphJfHaN5XUOqe61uV7l6wK4tMy0chopMksa9xhpzZnf7RNFrodh/sjBjt0jlsDYsIt1CLLYiPkp51660SrJit9qhVS21G9KDYG2T7BMRZlX9pEo9DXXjxh7UFnYN3EhCER3D7R9VNTEXDz8bfc3DBwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B/fe4x3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508JsehX017399;
	Wed, 8 Jan 2025 23:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFsrE6vhX1PZrq0qLvy4LKF/eCeRlAc7e7f74Vt1w10=; b=B/fe4x3bhxAweZzd
	9yoBlGS/gtonCFrrMvlVKNmSUNcrSoU/FGT3mGzS7N7mdapWhKUi2RC0srNZB87M
	SZTgtSIRmqbkrjbpPumR/8eUZUI332x0iACZYFDKqnL19HA9rS0iwts/1LQvBg6E
	0SDzZfeCXksPNE3M9nG2fSa74dvrxkEyBogGBMi6AmN+GjNl3dqAht1geWM0uFmk
	6O/9C8B+plrrzkNmTMXFF9zjwq2nkxJ2P4Y6l19msk0GZzEZ22T3mRhFYb6xxV6J
	6/yXdE4Dq9sIoOt5TU1HCH6bi73TVY4bQNf4jMjBNATc1trVpt8zxD4/qDIRWm9f
	d8u+vQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441yxfge00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 23:41:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Nf8le019978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 23:41:08 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 15:41:08 -0800
Message-ID: <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
Date: Wed, 8 Jan 2025 15:41:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jun Nie
	<jun.nie@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pyMOUFmsfgHlToR0dnDDRq_ViYiSFPgN
X-Proofpoint-GUID: pyMOUFmsfgHlToR0dnDDRq_ViYiSFPgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080194



On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
>> decide right side of a pair per last bit, in case of multiple
>> mixer pairs.
> 
> Proper English sentences, please. Also describe why, not what.

Hi Jun,

Can we also add a note in the commit message on why the last bit check 
works?

Thanks,

Jessica Zhang

> 
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>   {
>>   	struct dpu_crtc_state *crtc_state;
>> -	int lm_idx, lm_horiz_position;
>> +	int lm_idx;
>>   
>>   	crtc_state = to_dpu_crtc_state(crtc->state);
>>   
>> -	lm_horiz_position = 0;
>>   	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
>>   		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
>>   		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
>> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>   
>>   		cfg.out_width = drm_rect_width(lm_roi);
>>   		cfg.out_height = drm_rect_height(lm_roi);
>> -		cfg.right_mixer = lm_horiz_position++;
>> +		cfg.right_mixer = lm_idx & 0x1;
>>   		cfg.flags = 0;
>>   		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
>>   	}
>>
>> -- 
>> 2.34.1
>>
> 
> -- 
> With best wishes
> Dmitry


