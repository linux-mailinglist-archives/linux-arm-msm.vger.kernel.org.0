Return-Path: <linux-arm-msm+bounces-21871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5258FE2D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1EE1285DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45002152539;
	Thu,  6 Jun 2024 09:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NpKEoB9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014B1514ED;
	Thu,  6 Jun 2024 09:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666066; cv=none; b=tf2K/u889aALGX22YtgfWk2z9loL/7roeBPpLhEkq6qsZBwOcU+IUh7/AE5bH+QAz6Y/pvqBeGtpjhFkfrvYxO1+tN9GFvnYKnIzTWGW8PJ8C1/BczfLScJ65+91KFAPhVUJzNwD9cv6m6h+eQ5/yI0dzjWfjrHr2lNOimXHdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666066; c=relaxed/simple;
	bh=maMX5HQzEiVRq8jhduE172NdvDQwKY4QlXyYlYMLUpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qCnpv+fG/Ify59bqIgjKQjXAliChMmb9i7ynAlbfL4n1qPqck77hPsOCiRu6KaX5jtl/4j0/E8hNTBbj+6eCTwYOiBmtPnHDmMqm9LUNELX1WYe/w61Jxsmt6qqsqqtUDZYWXSj96PoIU87px6Ic84HI5JRBWdbW0t/PIr3mHiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NpKEoB9d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4568cLO0030007;
	Thu, 6 Jun 2024 09:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvacjwvFZAE1q67KYqMDQMwidl+zffFobNrB/M7cQPk=; b=NpKEoB9dDDAVwIzU
	kqlWlrltqwWKRRtunE+BGCBR7SSigeDrr2kxUy+ZlVGs7zKmtEeaZ4/cs9S+1kd5
	mgBu1uguqvrOEdo4MKBevGeQdmPAC9D7k2qcbUnuDRHBigneASZ8QwJBz6PRJR3A
	/vfHmbToL3n2lz/21asTzOpRkiPbNsVd4va1HDapdd63n6C8CNwyba12U7dsPnIv
	QjPV0o9V2ACODQCOrXPZnDlKVMOUwyORh4uPv6Mcza1iC9V0ZEFSyGYFiv4W0knw
	e+wFG71hSDMgHExjFgYPjWUSWbNtfo5LcGxoBptMnwYZPSQ7RGwA7e4ftkGCIyH2
	gBSPeQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rmdns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 09:27:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4569RdT8003839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 09:27:39 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 02:27:33 -0700
Message-ID: <783099ed-e19b-4313-bc92-e0cddee09203@quicinc.com>
Date: Thu, 6 Jun 2024 17:27:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
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
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <CAA8EJpoBi+iWeZz3JLQkRXCTP-9xnCV1hGAGr8J37W=GUd5CPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kG6Xi6Cgtu8b1-W3v9vh0_ZEm0z9PmIE
X-Proofpoint-ORIG-GUID: kG6Xi6Cgtu8b1-W3v9vh0_ZEm0z9PmIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 spamscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060069

On 6/3/2024 3:52 PM, Dmitry Baryshkov wrote:
> On Mon, 3 Jun 2024 at 10:38, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>
>>
>>
>> On 5/31/2024 4:38 PM, Dmitry Baryshkov wrote:
>>> On Fri, 31 May 2024 at 11:35, Tengfei Fan <quic_tengfan@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 5/29/2024 11:18 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, May 29, 2024 at 06:09:26PM +0800, Tengfei Fan wrote:
>>>>>> Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
>>>>>> I2C functions support.
>>>>>> Here is a diagram of AIM300 AIoT Carrie Board and SoM
>>>>>>     +--------------------------------------------------+
>>>>>>     |             AIM300 AIOT Carrier Board            |
>>>>>>     |                                                  |
>>>>>>     |           +-----------------+                    |
>>>>>>     |power----->| Fixed regulator |---------+          |
>>>>>>     |           +-----------------+         |          |
>>>>>>     |                                       |          |
>>>>>>     |                                       v VPH_PWR  |
>>>>>>     | +----------------------------------------------+ |
>>>>>>     | |                          AIM300 SOM |        | |
>>>>>>     | |                                     |VPH_PWR | |
>>>>>>     | |                                     v        | |
>>>>>>     | |   +-------+       +--------+     +------+    | |
>>>>>>     | |   | UFS   |       | QCS8550|     |PMIC  |    | |
>>>>>>     | |   +-------+       +--------+     +------+    | |
>>>>>>     | |                                              | |
>>>>>>     | +----------------------------------------------+ |
>>>>>>     |                                                  |
>>>>>>     |                    +----+          +------+      |
>>>>>>     |                    |USB |          | UART |      |
>>>>>>     |                    +----+          +------+      |
>>>>>>     +--------------------------------------------------+
>>>>>>
>>>>>> Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>> Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>>>>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>>>     .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
>>>>>>     2 files changed, 323 insertions(+)
>>>>>>     create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
>>>>>
>>>>> [trimmed]
>>>>>
>>>>>> +&remoteproc_adsp {
>>>>>> +    firmware-name = "qcom/qcs8550/adsp.mbn",
>>>>>> +                    "qcom/qcs8550/adsp_dtbs.elf";
>>>>>
>>>>> Please excuse me, I think I missed those on the previous run.
>>>>>
>>>>> adsp_dtb.mbn
>>>>
>>>> Currently, waht we have released is adsp_dtbs.elf. If we modify it to
>>>> adsp_dtb.mbn, it may cause the ADSP functionality can not boot normally.
>>>
>>> Released where? linux-firmware doesn't have such a file. And the modem
>>> partition most likely has a different path for it anyway.
>>
>> Firmware releases can be obtained from
>> https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git
>> after users sign up for free accounts on both
>> https://qpm-git.qualcomm.com and https://chipmaster2.qti.qualcomm.com.
> 
> I'm getting 403 when accessing qpm-git (both with my Linaro
> credentials and with gmail ones).
> If I try to git-clone the URL you've provided, I'm getting "Not found"
> when using a gmail account and CURL error when using Linaro
> createntials.
> 
> error: RPC failed; HTTP 302 curl 22 The requested URL returned error: 302
> 
> Not to mention that the URL wasn't mentioned anywhere beforehand. So I
> can hardly call that 'released'
> 
Hi Dmitry,

Let me elabarote the way to get access to firmware of aim300.

Visit the website Qualcomm used to release software which is 
chipcode.qti.qualcomm.com.
Use sign up to create a Qualcomm ID with email you have.
Login with your Qualcomm ID. Search for Qualcomm_Linux.SPF.1.0.
This is Qualcomm Linux release. Select 
qualcomm-linux-spf-1-0_test_device_public. You should be able to find 
the firmware release. You need to agree PKLA license during this process.

After that, you can edit ~/.netrc to add your username and password 
which you just create as Qualcomm ID to chipmaster2.qti.qualcomm.com and 
qpm-git.qualcomm.com.
git clone 
https://qpm-git.qualcomm.com/home2/git/qualcomm/qualcomm-linux-spf-1-0_test_device_public.git
Firmware package is under 
qualcomm-linux-spf-1-0_test_device_public/QCM8550.LE.2.0/common/build/ufs/bin/QCS8550_fw.zip.
Unzip this file. Firmware is under QCS8550_fw/lib/firmware/qcom/qcs8550/
>>
>>>
>>>>
>>>>>
>>>>>> +    status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&remoteproc_cdsp {
>>>>>> +    firmware-name = "qcom/qcs8550/cdsp.mbn",
>>>>>> +                    "qcom/qcs8550/cdsp_dtbs.elf";
>>>>>
>>>>> cdsp_dtb.mbn
>>>>
>>>> CDSP also as above ADSP.
>>>>
>>>>>
>>>
>>>>>> +
>>>>>> +    te_active: te-active-state {
>>>>>> +            pins = "gpio86";
>>>>>> +            function = "mdp_vsync";
>>>>>> +            drive-strength = <2>;
>>>>>> +            bias-pull-down;
>>>>>> +    };
>>>>>> +
>>>>>> +    te_suspend: te-suspend-state {
>>>>>> +            pins = "gpio86"
>>>>>> +            function = "mdp_vsync";
>>>>>> +            drive-strength = <2>;
>>>>>> +            bias-pull-down;
>>>>>> +    };
>>>>>
>>>>> What is the difference between these two?
>>>>
>>>> TE pin needs to be pulled down for both active and suspend states. There
>>>> is no difference.
>>>
>>> So why do you need two different states for it?
>>
>> Dividing into two different states can provide a clearer expression of
>> whether the corresponging functionality is avtive or suspend.
> 
> How?
> 
>>
>> We can also find similar settings in the other SM8550 and SM8650
>> platform dts files, such as sm8550-qrd.dts and sm8650-qrd.dts.
> 
> Which means more items to cleanup.
> 
> See the discussion starting from
> https://lore.kernel.org/linux-arm-msm/36f22383-79a3-427e-bf17-35ce2e1dd620@linaro.org/
> 
>>
>> [1] sm8550-qrd.dts:
>> https://elixir.bootlin.com/linux/v6.9.3/source/arch/arm64/boot/dts/qcom/sm8550-qrd.dts#L1052
>>
>> [2] sm8650-qrd.dts:
>> https://elixir.bootlin.com/linux/v6.9.3/source/arch/arm64/boot/dts/qcom/sm8650-qrd.dts#L1098
>>
>>>
>>>
>>>
>>>
>>>
>>
>> --
>> Thx and BRs,
>> Tengfei Fan
> 
> 
> 

-- 
Thanks,
Tingwei


