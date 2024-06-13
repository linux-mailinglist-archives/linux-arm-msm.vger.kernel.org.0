Return-Path: <linux-arm-msm+bounces-22534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13973906053
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 03:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 934721F21FD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 01:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C028F68;
	Thu, 13 Jun 2024 01:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LcDA59Ms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FBB646;
	Thu, 13 Jun 2024 01:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718241500; cv=none; b=oSN32GJZkSK3KsUlNADICdlgdHl+Ilfwi0QzHDYLvAg59WdrixRHVWO8H7S6b4JSQA57IQSXZenjriul8VETF/EUZV6zF5qMKkYmRioCkAUnPToQM1bmVh0Tx3y85rmrc+qcarbOQ0OVHv7mzsLtj6/ZnQ53dzZgRtvtBU87XqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718241500; c=relaxed/simple;
	bh=tZBAfneu9nDDXRU9+8v7Bb6sqpF+vtTNy6tl79Dc4ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FrdUg+WG9Y3w+9frUkvwywwPMWUFbYIofSiWdtb7QmloMnwOUZZMsD3JucE0TVd2s2EHzF4hFbnBhwdEDSj7q180FHIl1j7fI7YwP4rU4g0h9dPaf99qtX/p3w4gC6Out+KWz+yHpWt/d/25N3BXDY29feQEk8zyhp42YWbRh7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LcDA59Ms; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKn8Hm022977;
	Thu, 13 Jun 2024 01:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX/BI3T3moLdOtCMGFzzA29bAgp6YHRvjx/IZo2ogJ8=; b=LcDA59Msv7OK0vuT
	u3nfgIZAuiTjEl3y0M5j8JoLIOynH53S7lWWoBOiyqne4mOOSe5Ywtk3FeglFRss
	F1Dxdcy+L0Vs8PBBbauyeUQqS81eOP176VDDVZh4xGHqYlA9t9GHY1xF07vjLp0E
	h80i0HjdUsI+GrYZPLQYdzQx/CC+uQX8VRcfz/4D0alu2QBYwE/S0X3T/LAFdvKI
	6V7HCVnqKX2kEHEefO3tUySobw/fX/nXYTjIBGx9WFpf9dN6t7vS2KIRS/+KQGR0
	GWWBZPh5QRLx3P2G/Keag8ZqwrDthV+tkBsKf8FRdYHAAeYVDELBZE1DLz2uddor
	R+MlcQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypmjaw8yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 01:18:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45D1IERV025592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 01:18:14 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 18:18:07 -0700
Message-ID: <7572acab-a6f4-4f79-8c13-46f422b69a46@quicinc.com>
Date: Thu, 13 Jun 2024 09:18:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Ziyue Zhang
	<quic_ziyuzhan@quicinc.com>, <quic_chenlei@quicinc.com>
References: <20240529100926.3166325-1-quic_tengfan@quicinc.com>
 <20240529100926.3166325-5-quic_tengfan@quicinc.com>
 <s5gt3p6zsd5ebrkop4dhd33tykln33f6ahu3pibymecxsmakyd@lg5wfgec6dat>
 <205de8b7-507f-45c9-83ce-6eceb1466cb2@quicinc.com>
 <CAA8EJpqFq=6YFcUpjdkKikN54iQ76i8Rk_z+mLH1Tt0zFFmciQ@mail.gmail.com>
 <89c5c663-df8a-43d4-91b3-0a84b0c9a324@quicinc.com>
 <CAA8EJpoBi+iWeZz3JLQkRXCTP-9xnCV1hGAGr8J37W=GUd5CPw@mail.gmail.com>
 <783099ed-e19b-4313-bc92-e0cddee09203@quicinc.com>
 <CAA8EJprgUB-JicFzJGmtwXufunEu1J5HvsDZea3+1OEkq14Jpw@mail.gmail.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <CAA8EJprgUB-JicFzJGmtwXufunEu1J5HvsDZea3+1OEkq14Jpw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KTbiCmjokDBa1ytFMx8sBsrDGST11N-b
X-Proofpoint-ORIG-GUID: KTbiCmjokDBa1ytFMx8sBsrDGST11N-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130006



On 6/6/2024 6:54 PM, Dmitry Baryshkov wrote:
> On Thu, 6 Jun 2024 at 12:27, Tingwei Zhang <quic_tingweiz@quicinc.com> wrote:
>>
>> On 6/3/2024 3:52 PM, Dmitry Baryshkov wrote:
>>> On Mon, 3 Jun 2024 at 10:38, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/31/2024 4:38 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, 31 May 2024 at 11:35, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 5/29/2024 11:18 PM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
>>>>>>>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
>>>>>>>> I2C functions support.
>>>>>>>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>>>>>>>>      +--------------------------------------------------+
>>>>>>>>      |             AIM300 AIOT Carrier Board            |
>>>>>>>>      |                                                  |
>>>>>>>>      |           +-----------------+                    |
>>>>>>>>      |power----->| Fixed regulator |---------+          |
>>>>>>>>      |           +-----------------+         |          |
>>>>>>>>      |                                       |          |
>>>>>>>>      |                                       v VPH_PWR  |
>>>>>>>>      | +----------------------------------------------+ |
>>>>>>>>      | |                          AIM300 SOM |        | |
>>>>>>>>      | |                                     |VPH_PWR | |
>>>>>>>>      | |                                     v        | |
>>>>>>>>      | |   +-------+       +--------+     +------+    | |
>>>>>>>>      | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>>>>>>>>      | |   +-------+       +--------+     +------+    | |
>>>>>>>>      | |                                              | |
>>>>>>>>      | +----------------------------------------------+ |
>>>>>>>>      |                                                  |
>>>>>>>>      |                    +----+          +------+      |
>>>>>>>>      |                    |USB |          | UART |      |
>>>>>>>>      |                    +----+          +------+      |
>>>>>>>>      +--------------------------------------------------+
>>>>>>>>
>>>>>>>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>>>>> ---
>>>>>>>>      arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>>>>>      .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
>>>>>>>>      2 files changed, 323 insertions(+)
>>>>>>>>      create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>>>>>>>
>>>>>>> [trimmed]
>>>>>>>
>>>>>>>> +&remoteproc_adsp {
>>>>>>>> +    firmware-name = "qcom/qcs8550/adsp.mbn",
>>>>>>>> +                    "qcom/qcs8550/adsp_dtbs.elf";
>>>>>>>
>>>>>>> Please excuse me, I think I missed those on the previous run.
>>>>>>>
>>>>>>> adsp_dtb.mbn
>>>>>>
>>>>>> Currently, waht we have released is adsp_dtbs.elf. If we modify it to
>>>>>> adsp_dtb.mbn, it may cause the ADSP functionality can not boot normally.
>>>>>
>>>>> Released where? linux-firmware doesn't have such a file. And the modem
>>>>> partition most likely has a different path for it anyway.
>>>>
>>>> Firmware releases can be obtained from
>>>> https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git
>>>> after users sign up for free accounts on both
>>>> https://qpm-git.qualcomm.com and https://chipmaster2.qti.qualcomm.com.
>>>
>>> I'm getting 403 when accessing qpm-git (both with my Linaro
>>> credentials and with gmail ones).
>>> If I try to git-clone the URL you've provided, I'm getting "Not found"
>>> when using a gmail account and CURL error when using Linaro
>>> createntials.
>>>
>>> error: RPC failed; HTTP 302 curl 22 The requested URL returned error: 302
>>>
>>> Not to mention that the URL wasn't mentioned anywhere beforehand. So I
>>> can hardly call that 'released'
>>>
>> Hi Dmitry,
>>
>> Let me elabarote the way to get access to firmware of aim300.
>>
>> Visit the website Qualcomm used to release software which is
>> chipcode.qti.qualcomm.com.
>> Use sign up to create a Qualcomm ID with email you have.
>> Login with your Qualcomm ID. Search for Qualcomm_Linux.SPF.1.0.
>> This is Qualcomm Linux release. Select
>> qualcomm-linux-spf-1-0_test_device_public. You should be able to find
>> the firmware release. You need to agree PKLA license during this process.
>>
>> After that, you can edit ~/.netrc to add your username and password
>> which you just create as Qualcomm ID to chipmaster2.qti.qualcomm.com and
>> qpm-git.qualcomm.com.
>> git clone
>> https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git
> 
> Cloning into 'qualcomm-linux-spf-1-0_test_device_public'...
> Username for 'https://chipmaster2.qti.qualcomm.com': dbaryshkov@gmail.com
> Password for 'https://dbaryshkov@gmail.com@chipmaster2.qti.qualcomm.com':
> warning: redirecting to
> https://chipmaster2.qti.qualcomm.com/home/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git/
> error: RPC failed; HTTP 302 curl 22 The requested URL returned error: 302
> fatal: the remote end hung up unexpectedly
> 
> 
>> Firmware package is under
>> qualcomm-linux-spf-1-0_test_device_public/QCM8550.LE.2.0/common/build/ufs/bin/QCS8550_fw.zip.
> 
> The licence file is not present inside the repository. So after
> clicking through it it I have no way to check the terms of the
> licence.
> 
>> Unzip this file. Firmware is under QCS8550_fw/lib/firmware/qcom/qcs8550/
> 
> Is there anything specific to qcs8550 vs sm8550? If not, it should go
> to firmware/qcom/sm8550/ instead.
> 
> However, back to the original question. We are looking for the
> unification of the firmware names, not for the further diversions of
> them. Few weeks ago we got another ping from arm-soc maintainers to
> stop including firmware-names into the DT files. From my point of
> view, no matter what file name was used in the binary release, please
> use adsp_dtb.mbn for upstream submission.
> 

*_dtb.mbn will be used instead of *_dtb.elf in the next version patch 
series.

>>>>
>>>>>
>>>>>>
>>>>>>>
>>>>>>>> +    status = "okay";
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +&remoteproc_cdsp {
>>>>>>>> +    firmware-name = "qcom/qcs8550/cdsp.mbn",
>>>>>>>> +                    "qcom/qcs8550/cdsp_dtbs.elf";
>>>>>>>
>>>>>>> cdsp_dtb.mbn
>>>>>>
>>>>>> CDSP also as above ADSP.
> 
> 

-- 
Thx and BRs,
Tengfei Fan

