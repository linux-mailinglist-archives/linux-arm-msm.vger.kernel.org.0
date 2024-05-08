Return-Path: <linux-arm-msm+bounces-19515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C918C025E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3DF61C222F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BEE7490;
	Wed,  8 May 2024 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YxUXP+Tg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC01130481;
	Wed,  8 May 2024 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715187168; cv=none; b=Dp2JCQQhD6h0yWReAWxBpBowg+ZeWIId56iIStyExH0+PB9E5LYCLtbEWw8fg3h7XgmkRsM7mcXzdaFEb0qwgZ+1nwkgqlSiKO0sYj7fy6dEmNXmCzV958vaCnYf8RZLQS/ThTzPiC6FxjEnFlbQ542PzSvIH2VSpJjkbgwkBGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715187168; c=relaxed/simple;
	bh=9w8Rxe0DLeYhXDz9DiLNQ5cLhLufS2s41grnltnGAiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=esD6hN0kDfb10Aid/OwAYvrMbhM4wtOz8BZXl4AOVrgCPNJ1e4viss3L/2oW9jT4gWm+waU9GFjUB8WvcaHsrpNdmk31/d/G7BQRaS6kSDIApghyHrOFst2vtf1waRAlpOwhwzCchF/N67M2/AO5VO51R9ciXVGyZbFaFQr7Yx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YxUXP+Tg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Baj8e004590;
	Wed, 8 May 2024 16:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=sE0LqZWV3gwZbXfblDbklDN+yoPcsfBA3AQZLjHvvno=; b=Yx
	UXP+TgDa/sgK1FHJNFugFRrQUSWk3Q9VE83FummGCSpTFzHXD8hozee3ehRd5dy7
	qZ+Y5FpgRBLUVRh1oUnAgXSOroqAFwtssmV3XCq9drdgmVBVjYzv3gdpCZ3SMmDR
	w7YuPJQm3aoZjYFDkPu01aWrEZspxw5xfT04Cbym6E1zi1ChHhhlU7ZBmDzXEq+2
	9ezBvfG6UTl0HuKFE8HK0VO11Mfr+STKjx6FKNeDJ01Sakts6Z3/whUY8qGeCYmv
	zOvcqFPuUPxUEVwJoDUrrOCnyrTPxB+gA4hrI41QjSzmpcPdkW64ToobmUAIjJM7
	4kz7h7VmyroyEc1r4Z/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y08ne0sdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 16:52:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448GqWiT007223
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 16:52:32 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 09:52:31 -0700
Message-ID: <0cf9d1ba-2c4f-0863-6f51-e76ee7846471@quicinc.com>
Date: Wed, 8 May 2024 09:52:31 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
        <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "Marijn Suijten" <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Masahiro
 Yamada" <masahiroy@kernel.org>
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
 <87a5l0lmlv.fsf@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <87a5l0lmlv.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: p0YarwhYdHPcd0vHkL1pPlx1RUwiw5wh
X-Proofpoint-ORIG-GUID: p0YarwhYdHPcd0vHkL1pPlx1RUwiw5wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080122



On 5/8/2024 1:43 AM, Jani Nikula wrote:
> On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
>> compilation is broken on machines having python versions older than 3.9
>> due to dependency on argparse.BooleanOptionalAction.
> 
> Is it now okay to require Python for the build? Not listed in
> Documentation/process/changes.rst.
> 
> BR,
> Jani.
> 

The change to move gen_header.py to kernel is already part of the v6.10 
pull request.

This change only fixes the version dependency.

But, I agree we should update the changes.rst (better late than never).

Dmitry, can you pls suggest which version we want to list there?

I am hoping that after this change there are no further dependencies on 
python versions, so anything > EOL should be fine.

I am leaning towards v3.8

> 
> 
>>
>> Switch to use simple bool for the validate flag to remove the dependency.
>>
>> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
>> index fc3bfdc991d2..3926485bb197 100644
>> --- a/drivers/gpu/drm/msm/registers/gen_header.py
>> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
>> @@ -538,7 +538,7 @@ class Parser(object):
>>   		self.variants.add(reg.domain)
>>   
>>   	def do_validate(self, schemafile):
>> -		if self.validate == False:
>> +		if not self.validate:
>>   			return
>>   
>>   		try:
>> @@ -948,7 +948,8 @@ def main():
>>   	parser = argparse.ArgumentParser()
>>   	parser.add_argument('--rnn', type=str, required=True)
>>   	parser.add_argument('--xml', type=str, required=True)
>> -	parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
>> +	parser.add_argument('--validate', default=False, action='store_true')
>> +	parser.add_argument('--no-validate', dest='validate', action='store_false')
>>   
>>   	subparsers = parser.add_subparsers()
>>   	subparsers.required = True
> 

