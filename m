Return-Path: <linux-arm-msm+bounces-21690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A73A98FC052
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 02:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 355F81F22921
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 00:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD98383;
	Wed,  5 Jun 2024 00:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JERdFIUl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B735136C;
	Wed,  5 Jun 2024 00:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717546433; cv=none; b=qVZ7PeuSmW126DuZXw1ShUu+C6Q2M69PFLMKkGeS946jeKi23hpxpc9NeTcPYqe10dKwCg1V9igHotI2THESOXdS2FKizjoAXFivh1RAz1ZodIYVgT+4f7XRdL+TC05iodX/MZtq+Py/JRc0i3/vBYS/ITS5nMDWzav9ukxK5s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717546433; c=relaxed/simple;
	bh=7lGqpJ0q1PDeFxXtpIKvXYZKpx/YVVGquXk5PjooP08=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kvzf28Iu2wbRpKQsnR8QV+qZLmuq/f3zWuM9jWhu84u5FvGgmct6mfXUJaKPLHkSTf1j80wwpKFQWGbgu0j2IJSTEfl0dE869bL/CSeGIqJjiQNDQB9ZL6FpRqHwof2oS3uhxnVE8QWoNRlL+wz/5jxG6nyLvQTDh9GJvF/XTCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JERdFIUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454IRpLs008712;
	Wed, 5 Jun 2024 00:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzQ0N1wxV3RPCvvF5PjfHJe7twnzcZr7JCVW4jChbDE=; b=JERdFIUlUhLAsCDw
	M5+EFrJjV52O6oW/UGxVc6SLR5njSIEFx3ORSWTg6J3R7iKwm01Dacy6M56qlYSC
	9JKqMxwkQiGtkXnRVmSn/r3vaUcX5tfqTpmwqhRmIf+wr4cQ8MQC53IFLx92zNIR
	jxsz7ZDVb8RSE4Hukx7AZxzBThY4xfpUxQHAxWaBSRsMk6rQBH8UktVQ2stPpfPk
	6xyg8/J8PKLArQCfx4icDaMd8ctlDIn3nOm+m7Kg3bRxRiPcGyxPFeaDoX9S7PJe
	POdftW8ptkF9kUoMyQx9csFdqp+acQVD7xU/wrh77kzzO4aoApo8FAbYUfKrMG5H
	UisSsA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rgk15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 00:13:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4550DY83001612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 00:13:34 GMT
Received: from [10.110.31.89] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 17:13:29 -0700
Message-ID: <efe9a303-47de-36a9-3a13-b6f89d1d8784@quicinc.com>
Date: Tue, 4 Jun 2024 17:13:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/a6xx: use __always_unused to fix compiler
 warnings for gen7_* includes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Sean
 Paul" <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, <dri-devel@lists.freedesktop.org>,
        <seanpaul@chromium.org>, <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240604215105.4057278-1-quic_abhinavk@quicinc.com>
 <x42z2ykkpx7qkn2lr3y5sl3lm2m3fl2asy7qvswgemz5bpu62w@drh7b7wihrwg>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <x42z2ykkpx7qkn2lr3y5sl3lm2m3fl2asy7qvswgemz5bpu62w@drh7b7wihrwg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u5cmut2unrStAVqhKdDBze9iOQ4gMwVl
X-Proofpoint-ORIG-GUID: u5cmut2unrStAVqhKdDBze9iOQ4gMwVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050000



On 6/4/2024 4:58 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 04, 2024 at 02:51:04PM -0700, Abhinav Kumar wrote:
>> GCC diagnostic pragma method throws below warnings in some of the versions
>>
>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown option after '#pragma GCC diagnostic' kind [-Wpragmas]
>>   #pragma GCC diagnostic ignored "-Wunused-const-variable"
>>           ^
>> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning: 'gen7_0_0_external_core_regs__always_unused' defined but not used [-Wunused-variable]
>>   static const u32 *gen7_0_0_external_core_regs__always_unused[] = {
>>                     ^
> 
> I don't see this symbol in upstream.
> 

This was a C&P mistake. Instead of pasting the warning message from the 
default msm-next, I pasted the warning message from one of my trial runs 
(a bad one). I will fix the commit message when I post a v2.

The correct warnings are:

drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:16:9: warning: unknown 
option after '#pragma GCC diagnostic' kind [-Wpragmas]
  #pragma GCC diagnostic ignored "-Wunused-const-variable"
          ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:18:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h:924:19: warning: 
'gen7_0_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_0_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning: 
'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_2_0_external_core_regs[] = {
                    ^
In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning: 
'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
  static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
                                            ^
drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning: 
'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
  static const u32 *gen7_9_0_external_core_regs[] = {


>> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:19:0:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h:748:19: warning: 'gen7_2_0_external_core_regs' defined but not used [-Wunused-variable]
>>   static const u32 *gen7_2_0_external_core_regs[] = {
>>                     ^
>> In file included from drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:20:0:
>> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1188:43: warning: 'gen7_9_0_sptp_clusters' defined but not used [-Wunused-variable]
>>   static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] = {
>>                                             ^
>> drivers/gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h:1438:19: warning: 'gen7_9_0_external_core_regs' defined but not used [-Wunused-variable]
>>   static const u32 *gen7_9_0_external_core_regs[] = {
>>
>> Remove GCC dependency by using __always_unused for the unused gen7_* includes.
>>
>> Fixes: 64d6255650d4 ("drm/msm: More fully implement devcoredump for a7xx")
>> Suggested-by: Rob Clark <robdclark@chromium.org>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> index 0a7717a4fc2f..62ca0cf24005 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
>> @@ -8,19 +8,10 @@
>>   #include "a6xx_gpu_state.h"
>>   #include "a6xx_gmu.xml.h"
>>   
>> -/* Ignore diagnostics about register tables that we aren't using yet. We don't
>> - * want to modify these headers too much from their original source.
>> - */
>> -#pragma GCC diagnostic push
>> -#pragma GCC diagnostic ignored "-Wunused-variable"
>> -#pragma GCC diagnostic ignored "-Wunused-const-variable"
>> -
>>   #include "adreno_gen7_0_0_snapshot.h"
>>   #include "adreno_gen7_2_0_snapshot.h"
>>   #include "adreno_gen7_9_0_snapshot.h"
>>   
>> -#pragma GCC diagnostic pop
>> -
>>   struct a6xx_gpu_state_obj {
>>   	const void *handle;
>>   	u32 *data;
>> @@ -1350,6 +1341,10 @@ static void a7xx_get_registers(struct msm_gpu *gpu,
>>   	int index = 0;
>>   	const u32 *pre_crashdumper_regs;
>>   	const struct gen7_reg_list *reglist;
>> +	__always_unused const u32 **external_core_regs7_0_0 = gen7_0_0_external_core_regs;
>> +	__always_unused const u32 **external_core_regs_7_2_0 = gen7_2_0_external_core_regs;
>> +	__always_unused const u32 **external_core_regs_7_9_0 = gen7_9_0_external_core_regs;
>> +	__always_unused struct gen7_sptp_cluster_registers *sptp_gen7 = gen7_9_0_sptp_clusters;
> 
> Wouldn't it be easier to add something like the following to the
> a6xx_gpu_state.c before including the headers:
> 
> static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
> static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
> static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));
> 

Ack, this works too and its cleaner. let me push it this way. Thanks.

>>   
>>   	if (adreno_is_a730(adreno_gpu)) {
>>   		reglist = gen7_0_0_reg_list;
>> -- 
>> 2.44.0
>>
> 

