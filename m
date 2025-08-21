Return-Path: <linux-arm-msm+bounces-70206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF521B2FF8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3D507BDE92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7C6275B0D;
	Thu, 21 Aug 2025 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VexkOBYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533D27EFFF;
	Thu, 21 Aug 2025 16:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792172; cv=none; b=K9JAFOzIvAEsVYeCg9OHZtxnj1TycoqU/pgPyPl8IHTnXaqmA05QhCyMcPPs4A6tkv7eQXTWCR+3n2Lc9yXB1x/zyceTcuDwNn/W2Bze3GGuuWmRWJNlPd5VJg+tyKAOMuGHGirRADYEQTm1X+mYt4+p+FbvQ/Wa3cElJoEcoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792172; c=relaxed/simple;
	bh=C8xw7tu6C/VTwyQy7VhFy4pnhRO0rLzDaMi7Jy3Ew/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pvicMndIrKbH5mz1lzZIw6WDGQHbYjPhwFZwYk7yrHQc+xmdiOlISEHaTWquY4DD4R1TPZFvGVv+zjmuiJpyo2SRUNiG4xnRLGJ2H0KKYiN7beAmnYGyF7FDMkRzeufRUxp+vKfnO9hKcDDHkCzon7rnf9F2X1Fg/oPHaK8rPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VexkOBYj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDaa006394;
	Thu, 21 Aug 2025 16:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xxPNP5AS8eEt0PeGMcjZ3CMG90P5nYV1hx2wnGBeO10=; b=VexkOBYj7mlm4V0W
	pmvoBpkPbSkKG/S57mM3jrdY7iMY7Bpt43Wdzapc+l9D3+fSDruxKbOTeH0KMsqq
	2sxkTPjP7PZqRjE1dK2S/Cet6hpyT0vptMH8m7VMHDhBfk3twwe7DyZwsGD9JraJ
	FbzfMB90aoJfgiLNkOklJkwfafX6WOyh/KJJ+ZLr2525Yxuf7jYLfBkFkGm24XNA
	Oct+hJ6sTdbgOXe1PB0vYs3kWBblvvVLyt0M2leV7VHyRledFfxOTZPrzqhHMMap
	o8fiqh1s1ECOFi7ldOtD0pV5HuEjLKbNaCoMQfBQkY49GKsmPtx2X4SFkjRQ6not
	JCG+5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529626h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:02:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LG2hVJ008528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:02:43 GMT
Received: from [10.216.47.227] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 09:02:39 -0700
Message-ID: <9a38ec05-f7ab-4241-ba47-0d514b79e808@quicinc.com>
Date: Thu, 21 Aug 2025 21:32:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <mani@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250819222832.8471-1-quic_nitirawa@quicinc.com>
 <20250819222832.8471-3-quic_nitirawa@quicinc.com>
 <ger4kizeltjwalfuwu4dpfjiskrv2okgo5c7d6n3pb24yaxgfo@nkcndblyx3il>
 <b453b8ff-a460-4ccd-9019-aed746a7d52d@quicinc.com>
 <ukxv7donvkulgci2dwrokuflzxzeyh4kohoyja2vywropntxnb@qepcssbe4wpc>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ukxv7donvkulgci2dwrokuflzxzeyh4kohoyja2vywropntxnb@qepcssbe4wpc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LcVfzQqGIZtt7cMx1acfeeU9pxt1VbCq
X-Proofpoint-ORIG-GUID: LcVfzQqGIZtt7cMx1acfeeU9pxt1VbCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy8LKfEsvyKFa
 GjvaA+veIO0BNAJLC9QgGIKJ38POqywKlcZJXwscz7zEv6To3Vi/sLbNDAdd8EQFFD1SnMMzNw3
 oy0DOsjuVnirl0HNnDzwYv3A/QSGtP9FEdacFCKteJ5j3OLEA3UrRvT3LEBFBvDf2JnEYoaDMps
 u1fJ0aIiYKzKV9CB5YNLXVdFlWSfJCYn5Yn+spM5eYFB2C6NrHCCV006wD/Gt7eqeDJv1XRVwKX
 l1RYaJ1xLbLXq0QV0hWaPzYhkf17Vx9UJxENMWkC9b7+QAMcCQdqbfecu63QAmfc95Qb9sME2z/
 wYU8lk9wbGQRGkxG59dSng/0fLTH1duOAkT9wjCN648RRNLDI8cwt8BNbjBP6QOHluUNoPz6+ub
 lddXkcYKXGyELnfr0HUvri55UEJWIw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a74324 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=1y30qzyz97Y3s8v4aJsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/20/2025 5:24 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 12:07:57PM +0530, Nitin Rawat wrote:
>>
>>
>> On 8/20/2025 6:19 AM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>>> introducing dedicated regulator bulk data arrays with their load
>>>> values.
>>>>
>>>> The load requirements are:
>>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>>
>>>> This ensures stable operation and proper power management for these
>>>> platforms where regulators are shared between the QMP USB PHY and
>>>> other IP blocks by setting appropriate regulator load currents during PHY
>>>> operations.
>>>>
>>>> Configurations without specific load requirements will continue to work
>>>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>>>> is not provided.
>>>
>>> Can we please get configuration for the rest of the platforms?
>>
>> Hi Dmitry,
>>
>> If you're okay with it, can I merge the configuration for the remaining
>> platforms in the next patch series after I complete testing on all remaining
>> platforms.
> 
> You don't need to test, finding MSM8996 or 98 might be troublesome. Just
> fill in the values from the hardware documentation.

Hi Dmitry,

While implementing changes for all remaining platform, I noticed that 
the "regulator-allow-set-load" property is defined only for SM8750 and 
SM8850 within the PMIC PHY and PLL device tree nodes which means that 
even if the UFS PHY driver is updated to vote for this configuration on 
other platforms, it will have no impact.

Should I still proceed with applying the change across all platform, or 
limit it to just the SM8750 and SM8850 drivers? What’s your recommendation?

===========================================================================
// Device tree:
vreg_l1j_0p91: ldo1 {
     regulator-name = "vreg_l1j_0p91";
     regulator-min-microvolt = <880000>;
     regulator-max-microvolt = <920000>;
     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
     regulator-allow-set-load;
     regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM 
RPMH_REGULATOR_MODE_HPM>;
};

===========================================================================
drivers/regulator/of_regulator.c


if (of_property_read_bool(np, "regulator-allow-set-load"))
		constraints->valid_ops_mask |= REGULATOR_CHANGE_DRMS;

===========================================================================
//drivers/regulator/core.c
static int drms_uA_update(struct regulator_dev *rdev)
{
     ...
     if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_DRMS)) {
         rdev_dbg(rdev, "DRMS operation not allowed\n");
         return 0;
     }
     ...
}


Regards,
Nitin




> 


