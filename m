Return-Path: <linux-arm-msm+bounces-43166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8D9FB60C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 22:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 483B3164097
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 21:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388891C3C19;
	Mon, 23 Dec 2024 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LMYnSVOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874861FFE;
	Mon, 23 Dec 2024 21:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734988981; cv=none; b=PbK9kSxw6k9RUBEt4Mz1D82zDaeM6+tBlz1bUxNpPzz7+iBDKiUfGTZE1nmPIVoow7fLa67KRKjnIH5os3Gx2rSfYGG3yWwzvqsSegdbvkRhlM8bzjuMfnSpqJAE1IsweGZ3dN+Pe/Fo2dmn+UiEDP9/3jULwexx5/ee67FnJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734988981; c=relaxed/simple;
	bh=kylQ5IXCPv5gR+HgKMniLpkD/5FJtObsl/JLdFbcLsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=j0UrJNgpD7DQY49sVLT1PEl6yY/ML1suckO+FSQGN8L0Zn2OkoHR//bzvoF+7kTrMiCn5Ivzx8LsGpQMlXzJfohTdSyVG0HR/vaV00qldcX24+j7bHP5doliFwnM0pJJB5FXlf53G9TttulWY5z/hB1KS5vFk4rRsWuV6K9C3WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LMYnSVOz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNHTi6i018497;
	Mon, 23 Dec 2024 21:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hS/Y6yW1s5W3mihcvs63v+xACZBKR+LeKoO5/HhiemY=; b=LMYnSVOz4RnYrJ2P
	3qmHhh/lKumW1F96KRugLHOeNDCVx0XCOYRbrW9EJLGlKK7vSPWXddp/UR0LhN96
	LNwc5ranpiQOie+IiHZiXa8rmQ85R3I/bs9ejvT9CJEAs750VlPZ2wuphGcgiRsU
	ZMcZwgFhVskxTlFvVjMKJrdCZzTm+l4cZaHJZPezpqrqqfi5dZoRH9nsKM5UOMpF
	JHkgOgBa6v+iQYntgnJSykOX3gyZw5ZorVMXRnsmlAAI/3e2HKhoLrGutJEI/cEP
	DqU4eJAo9ONklkHs5YtbFsYPwc6LI8uOowYJPeXe8P+C8QrcMfXt/LXz9xf9B/Cn
	L97mOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qca18ftj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 21:22:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNLMk2R007617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 21:22:46 GMT
Received: from [10.216.35.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Dec
 2024 13:22:42 -0800
Message-ID: <7f5144e2-1c28-4e12-a9eb-1e8c8220bbcf@quicinc.com>
Date: Tue, 24 Dec 2024 02:52:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/msm/a6xx: Add support for Adreno 612
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        Jie Zhang
	<quic_jiezh@quicinc.com>
References: <20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com>
 <df25ffe5-b20c-41a7-b178-b191d332cb19@oss.qualcomm.com>
 <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <jsuzytkpcs7xmsaaedypz6w5d4ia6rckxjqg2x7mp4sidxxtqk@t5ukbn3sv6oa>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gItu9bQFWmhLTxfGFLF4gP4wsBU5_xJl
X-Proofpoint-GUID: gItu9bQFWmhLTxfGFLF4gP4wsBU5_xJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230189

On 12/21/2024 2:28 AM, Dmitry Baryshkov wrote:
> On Fri, Dec 20, 2024 at 08:56:31PM +0100, Konrad Dybcio wrote:
>> On 13.12.2024 12:46 PM, Akhil P Oommen wrote:
>>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>>
>>> Add support for Adreno 612 GPU found in SM6150/QCS615 chipsets.
>>> A612 falls under ADRENO_6XX_GEN1 family and is a cut down version
>>> of A615 GPU.
>>>
>>> A612 has a new IP called Reduced Graphics Management Unit or RGMU
>>> which is a small state machine which helps to toggle GX GDSC
>>> (connected to CX rail) to implement IFPC feature. It doesn't support
>>> any other features of a full fledged GMU like clock control, resource
>>> voting to rpmh etc. So we need linux clock driver support like other
>>> gmu-wrapper implementations to control gpu core clock and gpu GX gdsc.
>>> Since there is no benefit with enabling RGMU at the moment, RGMU is
>>> entirely skipped in this patch.
>>>
>>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>
>> So we talked offline a bit, and the RGMU requires a piece of firmware.
>>
>> We concluded it's best to describe that from the get-go, so that the
>> user doesn't get surprised when a new kernel update brings new firmware
>> requirements for previously-working hardware.
> 
> I'd say, please make sure that the RGMU firmware is also a part of the
> linux-firmware from the beginning.

Yes, I am working on that part. I will send another revision of this patch.

-Akhil

> 
>>
>> Please wait for the new revision.
>>
>> Konrad
> 


