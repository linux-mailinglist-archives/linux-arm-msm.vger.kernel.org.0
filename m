Return-Path: <linux-arm-msm+bounces-70293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77880B312F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79A0D5C3268
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDA12EAD18;
	Fri, 22 Aug 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l/rumJaD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4051E5705;
	Fri, 22 Aug 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854704; cv=none; b=dhgNQp+eV96KEcHXDcVaMfc+FwZp60A42YYcZLmzYELSonZiskf0ikyf6z/bAklcPefvHw26o1BTTnUU5lsgDpj767QWuiSf/7ISXb1P16ZbX8Czp8oKDAd9iWRkHflwqvHUgWeASgSroPCDAsaLZhA1w88kj0vSw6p6fBsCqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854704; c=relaxed/simple;
	bh=Erotj6jOeMsrD4jiRmM2+9TlqBroZuOzNluODArlfuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UebQijE+vIXYoH6ovADzahjC6Qew2NPaa8owlLgHobpu4BgCVCFEUw/wN27H9baL3VvoOiutnUnIp97/IZzCk9lrogdrXl+qlnlx8h1eemUDtwWIBvUENZFghN6WNKcbdtbLxydTJI4C9xR06mijtn7axjLIOts9rT58ZROoVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l/rumJaD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8USDF021815;
	Fri, 22 Aug 2025 09:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DzVNPB8xTXUqx7ZE4WGUwMD8Kgr3PNnsTFcnCr///+0=; b=l/rumJaD4CBkMSB4
	cCi0K7RhJnpdKQRNdvkW894LPWn36BfHn7hwiJwl8OPRyNx/YfWDdneHByHGAFoc
	YmtPuLT3JvXatFePQaNdK349fTSmic3j9Yx6KFI+F0uor3RhBeFCoQ8IdF972Jxh
	07BMXsjY1fZlRgaTwPLnD2jYATMSpwZA9ECIsIMKF/7GDVSyPRKVPPnqgk2WjCZu
	AVGYRSUiuGU8xUn6t2Ren2CUORFpoRH64dkavdk6Y9fdaoIse3gClcDSfRJYhH58
	///2S8RAgKOylI2rcabQJTpU2e81tYoc8DixQuSeF/BP1/tbs+1c0RkbxJRV8qei
	4oEIUg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a8qt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:24:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57M9Oxdt026171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Aug 2025 09:24:59 GMT
Received: from [10.216.22.206] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 Aug
 2025 02:24:55 -0700
Message-ID: <e42b7bdd-e9a1-47d9-9d97-c4da9e3a553a@quicinc.com>
Date: Fri, 22 Aug 2025 14:54:52 +0530
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
 <9a38ec05-f7ab-4241-ba47-0d514b79e808@quicinc.com>
 <8aa65fdc-d5a1-4a81-bcc1-8d953fa0ffa8@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <8aa65fdc-d5a1-4a81-bcc1-8d953fa0ffa8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a8376b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=HlU9Us3Qg5alJfMBsI8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: KjI4gmKcUOQdnvZBnLRUzrmp-h0lHPop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9EVKypVeG/E3
 4wxVZ45M8p0d8Uk8CaCOk5kzn1FFWJuague/jw8x2szKYFUEtQHxz0zliTRTXHZyTWQvB/qzUv6
 8foK4cbvPUxi0bHyyZCabYoJ778CGW4oe6psCYUyZItC8PNIQ74frQw22EQ26PRxtjdLkCOXYhN
 fbG14EVxlXyuZOGWHlrz/S2f2bEB3PPu4+Yvbsn46pN4DHmOxlWiBzjEM9P/+leLeGJgnDLjn8k
 G2LzRw2vlD8oDiGAlUd6rS+VXzqCwVdknq7IyZUW04oLY9uICsGF5EQHgc8Dk6lZeCOPAnI29bz
 UHNTdt9yFz0EBIEXkQBWyt3QbxsVeBXMhutaH21wBzJGg45uoNg93tWUcjpOSpyyK9GWL1mfeWP
 yQhBoCLdxSjW9oP+fEHWCdD5pf45eg==
X-Proofpoint-GUID: KjI4gmKcUOQdnvZBnLRUzrmp-h0lHPop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013



On 8/22/2025 2:49 PM, Dmitry Baryshkov wrote:
> On 21/08/2025 19:02, Nitin Rawat wrote:
>>
>>
>> On 8/20/2025 5:24 PM, Dmitry Baryshkov wrote:
>>> On Wed, Aug 20, 2025 at 12:07:57PM +0530, Nitin Rawat wrote:
>>>>
>>>>
>>>> On 8/20/2025 6:19 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Aug 20, 2025 at 03:58:26AM +0530, Nitin Rawat wrote:
>>>>>> Add regulator load voting support for SM8650 and SM8750 platforms by
>>>>>> introducing dedicated regulator bulk data arrays with their load
>>>>>> values.
>>>>>>
>>>>>> The load requirements are:
>>>>>> - SM8650: vdda-phy (205mA), vdda-pll (17.5mA)
>>>>>> - SM8750: vdda-phy (213mA), vdda-pll (18.3mA)
>>>>>>
>>>>>> This ensures stable operation and proper power management for these
>>>>>> platforms where regulators are shared between the QMP USB PHY and
>>>>>> other IP blocks by setting appropriate regulator load currents 
>>>>>> during PHY
>>>>>> operations.
>>>>>>
>>>>>> Configurations without specific load requirements will continue to 
>>>>>> work
>>>>>> unchanged, as init_load_uA remains zero-initialized 
>>>>>> when .init_load_uA
>>>>>> is not provided.
>>>>>
>>>>> Can we please get configuration for the rest of the platforms?
>>>>
>>>> Hi Dmitry,
>>>>
>>>> If you're okay with it, can I merge the configuration for the remaining
>>>> platforms in the next patch series after I complete testing on all 
>>>> remaining
>>>> platforms.
>>>
>>> You don't need to test, finding MSM8996 or 98 might be troublesome. Just
>>> fill in the values from the hardware documentation.
>>
>> Hi Dmitry,
>>
>> While implementing changes for all remaining platform, I noticed that 
>> the "regulator-allow-set-load" property is defined only for SM8750 and 
>> SM8850 within the PMIC PHY and PLL device tree nodes which means that 
>> even if the UFS PHY driver is updated to vote for this configuration 
>> on other platforms, it will have no impact.
> 
> If I remember correctly, on other platforms we don't allow setting the 
> load exactly because consumers were not voting on the current/power 
> requirements.
> 
>>
>> Should I still proceed with applying the change across all platform, 
>> or limit it to just the SM8750 and SM8850 drivers? What’s your 
>> recommendation?
> 
> I think, we should proceed, then once all PHYs get those votes we can 
> enable load toggling on those platforms too.

Sure Dmitry. I'll make the change in next patchset.



> 
>>
>> ===========================================================================
>> // Device tree:
>> vreg_l1j_0p91: ldo1 {
>>      regulator-name = "vreg_l1j_0p91";
>>      regulator-min-microvolt = <880000>;
>>      regulator-max-microvolt = <920000>;
>>      regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>      regulator-allow-set-load;
>>      regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM 
>> RPMH_REGULATOR_MODE_HPM>;
>> };
>>
>> ===========================================================================
>> drivers/regulator/of_regulator.c
>>
>>
>> if (of_property_read_bool(np, "regulator-allow-set-load"))
>>          constraints->valid_ops_mask |= REGULATOR_CHANGE_DRMS;
>>
>> ===========================================================================
>> //drivers/regulator/core.c
>> static int drms_uA_update(struct regulator_dev *rdev)
>> {
>>      ...
>>      if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_DRMS)) {
>>          rdev_dbg(rdev, "DRMS operation not allowed\n");
>>          return 0;
>>      }
>>      ...
>> }
>>
>>
>> Regards,
>> Nitin
>>
>>
>>
>>
>>>
>>
> 
> 


