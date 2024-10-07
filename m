Return-Path: <linux-arm-msm+bounces-33449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F219A99377A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 21:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A76EB22A0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 19:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172361DE3B7;
	Mon,  7 Oct 2024 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e4ZT6AZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00EB1DE3B0;
	Mon,  7 Oct 2024 19:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728329765; cv=none; b=rZ5RWQSOFp19DvVStFe6vr3NoylCAkbYiRwy/PITB4JIJq6Yo7rv9E1sA2UwDJUrKH3Ufj1F2rEHDfoOJfwRu5w+ZO5EdveMDS3QDgR7QdCq2+jIunz5RMVpTacD5gjoqjMLaigPbwoJIZXh8jZl5+IYvH6wB4jeZZHUqkbGBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728329765; c=relaxed/simple;
	bh=Xsgc5Pdw+KK67mn4AZN9ETwiLbrQZLAUVL7JeM3gwxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f7wIDn+2DFeWSmTRVfe1TI4MRdIbiAdrGUE6TB7Y/ZbN4DGZ9yBpDOHZKjtbqpU5PKyaI81743ULSMlcrkvcXcRWk6IaILYFZ0Z6IxbZms45yUj1xtWIJoCaYgr3EinvSZHVPuoWwAGEvYIXJesER+ZmpyAMvv9eeyuOasK114k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e4ZT6AZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497F81Le032294;
	Mon, 7 Oct 2024 19:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wpog1ABLB2x8/aZCselyEutmW3wSs/BapgUEkqGBFQo=; b=e4ZT6AZPIzHDHarR
	bGIv0FVpnyIAcZ8FBuKggQygvBhq+pSOq2bPQ4BQjq949lCQ4/4js3EySK4HEyNy
	fVHSIdPrOvmvvnbjEa9+H6sfFUf5Afl/mmxuetg8u4UR7TKRPY7gLW2nfuBUUd3i
	NoCu82l+LHwYw38OKOcPG/Krof/y9ccKiDzUi8nKkl6CfH0YxfNPYoVrzGZX+WeI
	bwG5xohmIybjcQYo4Le4Hm9ayb3BdWusD/AlNRswieE9/Ge32hyd93/9T9QHZcpy
	gjC1Ngn0ryTQ8AQuNZviaqgdTyvCwtSkiQA52Q2BRe5C/56s8z+2GMkSg7CTbjfj
	b7ynuQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv8d5am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 19:35:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497JZvrp020809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 19:35:57 GMT
Received: from [10.216.6.71] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 12:35:55 -0700
Message-ID: <5b4510dc-bc41-4fd4-b06b-75a3f0c25309@quicinc.com>
Date: Tue, 8 Oct 2024 01:05:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_tzmem: Enhance Error Handling for shmbridge
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
 <CACMJSesUCVXu8qdFgp88KL9KZxL80ki0UE09f5ciEbe23NvamA@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <CACMJSesUCVXu8qdFgp88KL9KZxL80ki0UE09f5ciEbe23NvamA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -ixQMf7AWZZwAuuiBK6Ywie2orgJMNI_
X-Proofpoint-GUID: -ixQMf7AWZZwAuuiBK6Ywie2orgJMNI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=603 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070135


On 10/7/2024 7:55 PM, Bartosz Golaszewski wrote:
> On Sat, 5 Oct 2024 at 16:02, Kuldeep Singh <quic_kuldsing@quicinc.com> wrote:
>>
>> This patchset addresses the tzmem driver probe failure caused by
>> incorrect error handling. The qcom_scm_shm_bridge_enable() SCM call
>> captures SCM success/failure in a0 and E_NOT_SUPPORTED in a1.
>>
>> Previously, qcom_scm returned values based solely on a0, without
>> capturing not_supported scenario. This patchset corrects that behavior.
>>
> 
> Ah, I guess this may be the reason for the SHM bridge enablement to
> seemingly work on certain platforms and then lead to crashes when we
> actually try to use it?

This patchset corrects the behavior for handling unsupported SHM bridge scenarios.
If the SHM bridge is supported and enabled for a target, any subsequent failures
should be investigated to understand what went wrong.
I am willing to put effort in that case.

-- 
Regards
Kuldeep

