Return-Path: <linux-arm-msm+bounces-42416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BAD9F3DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F362C188609E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04B11CDFD3;
	Mon, 16 Dec 2024 22:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wc48ARLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4DA143723;
	Mon, 16 Dec 2024 22:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734389183; cv=none; b=j6AWxXHN9nkZN+e5mscuvsRLFGyXhGBth8vdMcojT2lgYSAikDiCfbbzc9YyIPRH47JtaZ7ApjRLFSkWJupqkq+dVLAkvK60JYRAHUrj4AcVRgTvZ7IRkhB3kgB/tIe3mdwAlXVOEpmWM1gup0OogiGAlrrQk/mD7UqQhYkK9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734389183; c=relaxed/simple;
	bh=4wH/InQ1C6Dd5ZPK0n0yH01mn76sjusAGRvS82//O+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d1LoZqeJIG63X/dUZx7ZjlsCV+P8h+SOtsE2TSqnf6ydSyKIMufdYY5pnGHUR0hYtsj3dHpyeaTuTU7odvDzn7vn1ZEgMcfEEgVOZ4QvCt19XiRaXc4O1I8lqKBJwEHtmNzw45LRDz7Za3r9+bB+WCWQ5dzHZlklu00fAJjszeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wc48ARLE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGKM93f030386;
	Mon, 16 Dec 2024 22:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O8GwVu2m059IicnAysIcT3Yi14FZ4JYh3//9QPPQ3lQ=; b=Wc48ARLElOIA3hul
	XiNoLTDh250LhRHbXwf7Pcum8UE+3mD91R3IUHbAWAK3lO/DSuYeR0hqUXXao7Is
	g1EKz/VWZW0LJdLLzXyHanJLP7HcaGvzA3KHDbLT/rwYmFSpk1Yvp//DY9lkkmCv
	y//b78Wur8qzLXvQuNJJqS+iJIWuU3EGDP/eDcxAEm9g+vnfpUof+aO0AmI0qydd
	Ee/GQARreIfz2tqEs7JYFaCtDCiEppbR6TrOa1b/LNDnUYekFUGDQ3bE+8WHUq7o
	snxKfZ5vfXLwMq7hrXbQaN3a81UkAkLkQDHNYrVaf0CdWunQyUTBUOXoT0Y52Wc1
	tTczcA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ju61r8sy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:46:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BGMkBTj001585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:46:11 GMT
Received: from [10.110.119.169] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 14:46:10 -0800
Message-ID: <ee04bf79-5a47-4a91-9aa2-cf0b909c6dea@quicinc.com>
Date: Mon, 16 Dec 2024 14:46:09 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Foss <rfoss@kernel.org>,
        Neil
 Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-1-15bf0807dba1@linaro.org>
 <d6be6564-ce24-4a27-a014-45aa9ff28d24@quicinc.com>
 <og2qlg7fy3gwh3uv7nvmqxmjbzqpdeuekefflzgdet4vnltdtr@q7suuz4ujxp5>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <og2qlg7fy3gwh3uv7nvmqxmjbzqpdeuekefflzgdet4vnltdtr@q7suuz4ujxp5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mrUyvHh6U7jX1oCMrakJ1MxamOyn5_Ev
X-Proofpoint-ORIG-GUID: mrUyvHh6U7jX1oCMrakJ1MxamOyn5_Ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412160187



On 12/16/2024 2:21 PM, Dmitry Baryshkov wrote:
> On Mon, Dec 16, 2024 at 01:11:35PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/16/2024 12:27 AM, Dmitry Baryshkov wrote:
>>> Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
>>>
>>> Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>
>> Change looks fine
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> One question below (not tied to the change but arose due to it):
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> @@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>>>    		.sblk = &sdm845_lm_sblk,
>>>    		.lm_pair = LM_3,
>>>    		.pingpong = PINGPONG_2,
>>> +		.dspp = DSPP_2,
>>>    	}, {
>>>    		.name = "lm_3", .id = LM_3,
>>>    		.base = 0x47000, .len = 0x320,
>>> @@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
>>>    		.sblk = &sdm845_lm_sblk,
>>>    		.lm_pair = LM_2,
>>>    		.pingpong = PINGPONG_3,
>>> +		.dspp = DSPP_3,
>>>    	}, {
>>>    		.name = "lm_4", .id = LM_4,
>>>    		.base = 0x48000, .len = 0x320,
>>>
>>
>> the consumer of .dspp seems to be in the RM code which is used to map the
>> DSPP to encoder_id but is there really any case where lm_id != dspp_id ... I
>> guess I am missing the context of why DSPP id needs to be tracked as LMs and
>> DSPPs go together. Let me also check this part internally.
> 
> For example check the SDM845, the LM_5 is tied to DSPP_3.
> 
> LM | DSPP
> ---------
> 0  |  0
> 1  |  1
> 2  |  2
> 5  |  3
> 

Ah ... yes ... seems like sdm845 is the only one having this anomaly.

Thanks for clarifying.

