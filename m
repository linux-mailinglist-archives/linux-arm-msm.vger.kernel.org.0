Return-Path: <linux-arm-msm+bounces-28453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C584A9514D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA44C1C25069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 06:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1E713A41F;
	Wed, 14 Aug 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j1EPYtij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C2913A3F7;
	Wed, 14 Aug 2024 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723618471; cv=none; b=GmXnJ+A6hKdliFPyKbxI/XM17KH5s/5kh2Dr9SzgvYnUqVZ8C0wbl1/fceuIuRDvwkigG0E4Bn1NVBl2a3lgzQLNKLcaw1etjEpJNVJNY6ZgTLFcKrEk6zHWgnU1sUbvkIERMeoHZjn22oCSd/YMN78AjaW+DkmbtS7ec3n5Imo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723618471; c=relaxed/simple;
	bh=HkRVcTrYAvGcPaps9i6GL0NTgB/PhSmeAS/BeyeQHN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eINFFQtKzOdnWskWC0h+g7gqcAT+7Ym5xGQGsS5shggTKAnSajIlP18ELvdHinkBNGAQAHn7WhpU/t2hQKrgAj4pI9N4J5OTexkrR5yaWoD+2E+BXhhTqy7ujntwKKELyusU08GYigun29I4FzV/dUX+EyrGQh0zJbWz1qcNscM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j1EPYtij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DNGE87022468;
	Wed, 14 Aug 2024 06:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enY/Wfd1anQvr2oMDVjWVzF+4mzJwuhscz2wR+sKWRY=; b=j1EPYtijm6BkWBQW
	AL60sTYMx2X+vF6dkwW4cW8FGUuObNihVPBYD4m7Yi1DIYRJOC2giFuzVqFWBS3D
	oLAVXHIhrvTMXc/3F2xAx0Llmv9+LSDh73UmhVUBwxO3oHUY2+h+LnYNXaxO2jvK
	bGantQi+q7yCAvDKLNND0+YrcMDxw9t02qjCEaiUNmWthLFl+4hVowG6zC9i55XC
	/TcrmlnVD2VdqkU3DLxQUmb2nM5KRmZrcOKp38zltOdho0R4UhTYPD1aaaLhHUPx
	TApcWv+b0A9pGDMR5Uh8ZeJBuhQ+8LKf25BWu+53uPkSXaLA0gHm0di4GECUkfmp
	ZmvmOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4j6w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 06:54:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47E6sE6Y000594
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 06:54:14 GMT
Received: from [10.239.132.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 23:54:10 -0700
Message-ID: <4d89a048-eef0-4295-a4cc-500390f005d1@quicinc.com>
Date: Wed, 14 Aug 2024 14:54:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for
 TBU driver
To: Georgi Djakov <quic_c_gdjako@quicinc.com>,
        Pranjal Shrivastava
	<praan@google.com>
CC: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <iommu@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmitry.baryshkov@linaro.org>, Georgi Djakov <djakov@kernel.org>
References: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
 <ZroNUGkKuC1L7Qfr@google.com>
 <cca690c3-916e-43b6-b2a5-eca4f2eb838e@quicinc.com>
 <ZrsJLqTnq6tG2xp4@google.com>
 <dee2f394-c9c5-4099-8e05-ce0c8756887b@quicinc.com>
 <3cb1da06-88e3-4dd2-b56c-e0ab725ef6b2@quicinc.com>
Content-Language: en-US
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
In-Reply-To: <3cb1da06-88e3-4dd2-b56c-e0ab725ef6b2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pdVfXk8RUQ1JOGXNvkSnyCAy4DqL2LQ-
X-Proofpoint-GUID: pdVfXk8RUQ1JOGXNvkSnyCAy4DqL2LQ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_04,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=938
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140046

Hi Georgi,

On 2024/8/13 20:06, Georgi Djakov wrote:
> Hi Zhenhua,
> 
> On 8/13/2024 10:56 AM, Zhenhua Huang wrote:
>>
>> On 2024/8/13 15:20, Pranjal Shrivastava wrote:
>>> On Tue, Aug 13, 2024 at 10:37:33AM +0800, Zhenhua Huang wrote:
>>>>
>>>> On 2024/8/12 21:25, Pranjal Shrivastava wrote:
>>>>> On Tue, Jul 30, 2024 at 06:30:43PM +0800, Zhenhua Huang wrote:
>>>>>> TBU driver has no runtime pm support now, adding pm_runtime_enable()
>>>>>> seems to be useless. Remove it.
>>>>>>
>>>>>> Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
> [..]
>>> I agree that there are no pm_runtime_suspend/resume calls within the TBU
>>> driver. I'm just trying to understand why was pm_runtime enabled here
>>> earlier (since it's not implemented) in order to ensure that removing it
>>> doesn't cause further troubles?
>>
>> See above my assumption, need Georgi to comment but.
> 
> Thank you for looking at the code! Your assumptions are mostly correct,
> but if you try this patch on a real sdm845 device you will notice some
> issues. So it's actually needed to re-configure the power-domains, three

Thanks Georgi for your comments!
Hmm...  so you found some bugs on sdm845 ? sorry that I don't have 
sdm845 on hand...

> of which (MMNOC GDSCs) are requiring this because of a HW bug. I should
> have put a comment in the code to avoid confusion, but it took me some
> time to confirm it.
> 
> I have sent a patch to handle this more cleanly:
> https://lore.kernel.org/lkml/20240813120015.3242787-1-quic_c_gdjako@quicinc.com
> 
> So we should not remove the runtime pm calls until some version of the
> above patch gets merged.

In my sense, above patch should not result in turning off gdsc? It's 
just open the support for RPM.. I tried to do same change for arm-smmu 
driver, w/ test I see cx_gdsc which is the power-domain for gfx_smmu, is on:
..
/sys/kernel/debug/pm_genpd/cx_gdsc # cat current_state
on

Are you worrying that not setting active will turn off related PD? or 
Could you please explain a bit more about how the change impacted power 
domain status? Thanks in advance :)

> 
> Thanks,
> Georgi
> 
>>> I see Georgi added it as a part of
>>> https://lore.kernel.org/all/20240704010759.507798-1-quic_c_gdjako@quicinc.com/
>>>
>>> But I'm unsure why was it required to fix that bug?
>>
>> I'm just thinking it is dead code and want to see if my understanding is correct.
> 
> 

