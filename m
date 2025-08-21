Return-Path: <linux-arm-msm+bounces-70225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E41AB30312
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 21:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C937AB054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9251254AE1;
	Thu, 21 Aug 2025 19:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PnJrjt6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F162DFA2A;
	Thu, 21 Aug 2025 19:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755805184; cv=none; b=iMMrKWVE7FkPeX7pZnnfU/AxLpqmxtQZAe7TGjL7oh0A7ALQAlwtfBUn7mVZw51/FCrwIWRj1dntA25llT4JAHYxXEa7fQSvY2zK60eq5IKpwuNGabT56OcYsapX8A/q3u2tq43QOt0yzHnDJGIwi6TNkEtazhNQUDDHbnCoo2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755805184; c=relaxed/simple;
	bh=7XKUZmG9seY5/sMgIpebkIhDRhAmECOOHMlX8cyC99E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Pi9Ya7+mLoMzkh3YvSBdl1prgmhaj6ObpMhUGxDHqdLeYLVwbt15/5oj1jYbpQcMVNtdzW8QnigkX9XPIffcNMi8dt1KCawmePd/mBCCkbS5eWZJ6YCikAHUczBB5VdfnKGAZ82mdM1WxLl82ITYjuRCIfPumzr0KVMzYZGDPws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PnJrjt6i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI92vC003002;
	Thu, 21 Aug 2025 19:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eV7LdssLFhHbnCgWsJxZ4mZ8DzMg88BtHyb25ZkhDp4=; b=PnJrjt6il9djlj/J
	MmWwFryfOUQ+YcqDDDZmIdl0C0vNru2UjRaiGtzM6Y8y433p00cU8uNSHSFth/5j
	PHKQlw/ATN/rNESWDp8l87S5QWfjB7n/o1wBHh3bZaj3RP2RGo506qbdKb88whel
	FK77BTh/wpH2elsbqN4AptQfPsFlu4IuTYDeCUBEkMeolq3wukPVZ0I9TbJPC2PV
	7ZzFPhNrp/uCyUGk7AjvQbEaq5p9KCpFznFENPpUPXDtPv2IQri+ANwI9WyCperr
	pb9ZvUkItjo6es7++P0uaB/ZdWPZLYOdyV0gMKZ6RCsxqJ7ed3sNU2XGSZPNExuJ
	NNioRw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5296ndx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 19:39:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LJdb81030032
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 19:39:37 GMT
Received: from [10.216.47.227] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 12:39:33 -0700
Message-ID: <f0de58d4-3b2b-4e8d-90cf-fc6ef37dc88c@quicinc.com>
Date: Fri, 22 Aug 2025 01:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] phy: qcom-qmp-ufs: Add regulator loads for SM8650
 and SM8750
From: Nitin Rawat <quic_nitirawa@quicinc.com>
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
 <9a38ec05-f7ab-4241-ba47-0d514b79e808@quicinc.com>
Content-Language: en-US
In-Reply-To: <9a38ec05-f7ab-4241-ba47-0d514b79e808@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u7-aiDAj7eJbrFrs5SHzjGOaUhoQe86a
X-Proofpoint-ORIG-GUID: u7-aiDAj7eJbrFrs5SHzjGOaUhoQe86a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxRW+s8QVcfnn
 vXx85Vg73YEBo4ekR7ilcMdkk20CKE70iY9XCk0XeghUHAYTh0cJFvQ+nnsDu+pmUsXBHToEm6+
 7DixIw4sRn7KTOVIJb1hNJANJ4Kboawb5IdzLPBasKTV+RYHGlHj7HAv/ef7cImzp2LwYc+x9B5
 VuuMfh8Q7L/YudUz6tBubTtO8eWMPid7VEOgCUPlNlzuP6Pqf2qlfDThTvYglUdP5/YbvcOkTmX
 5ZthTzG6y23FXI9CdraT7J8HwcPPjGGjphM+KmsSHTR+Yn4JLXwDR3XK8fp0rtJrPha5bfJo+9o
 LLfJw4YoaPhmolNKmDTHp+tIH/Kucc13lBP0IdFQAVVXYMIj8Vm1v853NQEogy8TZGy5GcWPJF8
 Xf+RarLxDq97XuW8w/iVnhZ5gofEqQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a775f9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=LfbFHgk6GMyTBLOash0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/21/2025 9:32 PM, Nitin Rawat wrote:
> 
> 
> On 8/20/2025 5:24 PM, Dmitry Baryshkov wrote:
>> On Wed, Aug 20, 2025 at 12:07:57PM +0530, Nitin Rawat wrote:
>>>
>>>
>>> On 8/20/2025 6:19 AM, Dmitry Baryshkov wrote:
>>>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>>>> introducing dedicated regulator bulk data arrays with their load
>>>>> values.
>>>>>
>>>>> The load requirements are:
>>>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>>>
>>>>> This ensures stable operation and proper power management for these
>>>>> platforms where regulators are shared between the QMP USB PHY and
>>>>> other IP blocks by setting appropriate regulator load currents 
>>>>> during PHY
>>>>> operations.
>>>>>
>>>>> Configurations without specific load requirements will continue to 
>>>>> work
>>>>> unchanged, as init_load_uA remains zero-initialized when .init_load_uA
>>>>> is not provided.
>>>>
>>>> Can we please get configuration for the rest of the platforms?
>>>
>>> Hi Dmitry,
>>>
>>> If you're okay with it, can I merge the configuration for the remaining
>>> platforms in the next patch series after I complete testing on all 
>>> remaining
>>> platforms.
>>
>> You don't need to test, finding MSM8996 or 98 might be troublesome. Just
>> fill in the values from the hardware documentation.
> 
> Hi Dmitry,
> 
> While implementing changes for all remaining platform, I noticed that 
> the "regulator-allow-set-load" property is defined only for SM8750 and 
> SM8850 within the PMIC PHY and PLL device tree nodes which means that 
> even if the UFS PHY driver is updated to vote for this configuration on 
> other platforms, it will have no impact.
> 
> Should I still proceed with applying the change across all platform, or 
> limit it to just the SM8750 and *SM8850* drivers? What’s your recommendation?

Sorry for the typo. It's SM8650 and SM8750.

> 
> ===========================================================================
> // Device tree:
> vreg_l1j_0p91: ldo1 {
>      regulator-name = "vreg_l1j_0p91";
>      regulator-min-microvolt = <880000>;
>      regulator-max-microvolt = <920000>;
>      regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>      regulator-allow-set-load;
>      regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM 
> RPMH_REGULATOR_MODE_HPM>;
> };
> 
> ===========================================================================
> drivers/regulator/of_regulator.c
> 
> 
> if (of_property_read_bool(np, "regulator-allow-set-load"))
>          constraints->valid_ops_mask |= REGULATOR_CHANGE_DRMS;
> 
> ===========================================================================
> //drivers/regulator/core.c
> static int drms_uA_update(struct regulator_dev *rdev)
> {
>      ...
>      if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_DRMS)) {
>          rdev_dbg(rdev, "DRMS operation not allowed\n");
>          return 0;
>      }
>      ...
> }
> 
> 
> Regards,
> Nitin
> 
> 
> 
> 
>>
> 


