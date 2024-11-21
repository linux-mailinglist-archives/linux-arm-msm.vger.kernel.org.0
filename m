Return-Path: <linux-arm-msm+bounces-38640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2543E9D49F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20522B23EB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F771CB32D;
	Thu, 21 Nov 2024 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RncVDNGv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA891C7299;
	Thu, 21 Nov 2024 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732181092; cv=none; b=PBQ3DO/60L57vO5rPh6Y9HelRwZFy4Z+VVwyQ0mJbQvqGaTbUDN9FF6N26MrjEtgAdJU9+QYLOGSx87umyelzZKtKOsUZwxR6LYPHnNCQfOTGVzlJN3araBbbadTLzOZyv2+QuYfJ2s8nC0O7QvP9tdKcImr+WeGtxAkB7jh1Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732181092; c=relaxed/simple;
	bh=KFJ2jt9vNKHBDlrlbmFiI5q4KQn8RB1m5KE1F2LSB0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d/vEyzEAOxVjMUVRDfVsSFwLCN7ECv8wfyHep0Xy329Gb6JuDMj6T49+gYWohT3De/s6lOIDGu7F9WcgZwMHEzCyZ2RmLun5QKXPIfXLpOhUwV0CPlOyuCSEP69LchHDKyPdYGBx+kaxwYG++IvenB8rqBlSPIUzJfmSiqCgUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RncVDNGv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKNtGAQ020148;
	Thu, 21 Nov 2024 09:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAtAn9YZ3PzXaDgcYH+9r+VHp2B7tKp3mc9IR/69eQI=; b=RncVDNGvNocP0K/j
	/pPUMZxFDaCu7DCJt4pWg1hcdYlYVOiaYvHVnB70ZtJsBE/YE3R2Khw24QSNuOzc
	SSxfZFlNu8yrWszClCn09zyAwJGuJZoj5OIGsV8PztmqkWeCA2ng75P9AIR9WcVQ
	LinFV2zkAOxNaUBIXFDpQr5GnzmSbeF1NzBbVe1QHyRREH6APYVIDgpoS383+Hgz
	SYbi7Fb3yEG5Jjjj+hcWE1CzexxukZJGQRZxZMFGGiYfwZnwHOg8yWW42AxokRr/
	pToEb8qNVSo131bRMuLtyyRWDQUoZBVCcbeMBvELEM0aiIE/zxbzicTFDrWz3ami
	iPYwTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431sv2hbby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:24:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL9OWTX031450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:24:32 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 01:24:25 -0800
Message-ID: <dd389504-2689-4a60-b50c-47a428c00e4e@quicinc.com>
Date: Thu, 21 Nov 2024 17:24:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
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
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
 <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
 <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5QeG7tDwsKa_lXvLoQbXWsaaIcpRfOAm
X-Proofpoint-ORIG-GUID: 5QeG7tDwsKa_lXvLoQbXWsaaIcpRfOAm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210073



On 2024/11/14 21:41, Dmitry Baryshkov wrote:
> On Thu, 14 Nov 2024 at 15:32, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 13.11.2024 12:51 PM, Fange Zhang wrote:
>>> From: Li Liu <quic_lliu6@quicinc.com>
>>>
>>> Add support for DSI 2.3.1 (block used on QCS615).
>>> Add phy configuration for QCS615
>>>
>>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
>>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
>>>   5 files changed, 42 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>>> @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>>        },
>>>   };
>>>
>>> +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
>>> +     { .supply = "vdda", .init_load_uA = 21800 },
>>> +};
>>
>> I believe refgen is also present here and you can reuse dsi_v2_4_regulators
> 
> This was in feedback for v1... And the patch should be further split,
> having DSI and PHY parts separately.
yes, will split and fix in next patch
> 


