Return-Path: <linux-arm-msm+bounces-38016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584459CDE0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 13:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E98FB2303F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 12:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640CE1B3942;
	Fri, 15 Nov 2024 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jWFYH6MM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324E2AE77;
	Fri, 15 Nov 2024 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731672637; cv=none; b=BnmLSDUsrChOPjIeVgiBTFr2VUKRW1QKtaCop2HElH2dGNTXkciKxMCnXybYhssxh+9WJXXvbdrUAnxjMeOn8GpUQWYlJ8ix8DZMKo+L1TUegaeAdtDNf5wI8sgHINATH+ZvKAhrjUrHDB3UCXgVPUxQVHY6vYfr/5EIzx9PWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731672637; c=relaxed/simple;
	bh=EQ6TU9xB854mxcM3E8J6oqRyNgA89ixsp5dU8F/nDXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FuD6dlCrz+zmN24jAqlitXAatlOxEt2+9mQI25c9gHlnRWqsLT0XjmkjKkq9IEMi37XIwC8i6iIduwI+660R+9YIbhkpzem87ec2bpFb3EG0Z3MU6kJSrCPE5KhGvlbW2hJHeX0Oj6/2/3LaEjOh9bWwwR3y1QndcrI3QWsVay4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jWFYH6MM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF8NgdB020734;
	Fri, 15 Nov 2024 12:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	otdQxhxs0sr7H9CWumkpBZ2P0dQz/+4HKxJl4nBPVPI=; b=jWFYH6MMuBI7Hbum
	+QIC3A284Q0V5Cm+9rUpjP/bhw5eR2e9B3jfaHcUY58FwDItFVSiNX3WDdrsd0xN
	bSBFcAkWIjQz/WnC3ShzSTCPpK34jacx+O7Lp1TirPUk/wei/Df53OionqG0soYv
	1NfsoWrqzaPAG/KDgqy8DRZO6HH4xhGw3soXILu0vm4RtKOQkUALIZZD2Dgfod6i
	cWTDbZ/vjIJHBw/9qqQe1nro9kR6sTGfDZff6ghlEFsjRSetnlrt0JEAv9hT8wTO
	xJAC/+TmK5haXHYViX7QA8o3rZZ1JmfpJeUguIAVJUM1exEE3Q8hvhT9bhJ1OmpV
	z99VWg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wex8v1em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 12:10:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFCAU4k019173
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 12:10:30 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 04:10:26 -0800
Message-ID: <9b16f4d8-56ea-4ef6-9cb5-35750af871e9@quicinc.com>
Date: Fri, 15 Nov 2024 17:40:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Make ADSP a secure fastrpc
 domain
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <srinivas.kandagatla@linaro.org>, <quic_bkumar@quicinc.com>,
        <quic_chennak@quicinc.com>
References: <20241113050042.181028-1-quic_ekangupt@quicinc.com>
 <5oqzxppquoeppt6xnjfm2rdwm23hbui5k3caz5v5ffqzizepob@dz5ikvzgbd4x>
 <c1f0e56b-b489-4370-99e3-0973641410b8@quicinc.com>
 <CAA8EJprDTz7b4rNtR4e9A-=j9_z-aJGBg3+g5is8Bmy=cgTM1Q@mail.gmail.com>
 <b8a9a8f5-1f36-4eea-925b-84578e71838d@quicinc.com>
 <sbkm5wvhtjoluhz7mi7f2wyc4t5znhazcxra52cd5yev5iksbi@yqielk6i7bpe>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <sbkm5wvhtjoluhz7mi7f2wyc4t5znhazcxra52cd5yev5iksbi@yqielk6i7bpe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1c2fIRMsUQQ0iFx15o8odrnAYfMc_AzW
X-Proofpoint-ORIG-GUID: 1c2fIRMsUQQ0iFx15o8odrnAYfMc_AzW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411150104



On 11/14/2024 5:30 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 14, 2024 at 10:49:52AM +0530, Ekansh Gupta wrote:
>>
>> On 11/13/2024 5:20 PM, Dmitry Baryshkov wrote:
>>> On Wed, 13 Nov 2024 at 08:18, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>>>
>>>> On 11/13/2024 11:13 AM, Dmitry Baryshkov wrote:
>>>>> On Wed, Nov 13, 2024 at 10:30:42AM +0530, Ekansh Gupta wrote:
>>>>>> FastRPC framework treats ADSP as a secure domain on sc7280 SoC
>>>>>> which means that only secure fastrpc device node should be
>>>>>> created for ADSP remoteproc. Remove the non-secure-domain
>>>>>> property from ADSP fastrpc node.
>>>>> If this prevents the non-secure devices from being created, isn't that a
>>>>> regression from the userspace point of view?
>>>> The actual intention of having secure and non-secure domains is to utilize signed(high privilege)
>>>> and unsigned(low privilege) DSP processes properly.
>>>>
>>>> Non-secure device node is intended to be used by untrusted/generic applications which needs to
>>>> offload tasks to DSP as unsignedPD. Only unsigned PD is expected to be allowed if the process is
>>>> using non-secure node.
>>>>
>>>> Secure device is intended to be used by trusted processes like daemons or any application
>>>> which needs to offload as signed PD to DSP.
>>>>
>>>> The ideal expectation from userspace is to first try to open secure device node and fall back to
>>>> non-secure node if the secure node is not accessible or absent.
>>>>
>>>> I understand your concerns, can you please suggest how this can be improved/corrected?
>>> Thank you for the explanation, and thanks for the description of the
>>> expected behaviour, but the question is different.
>>> Currently (with the property being present in DT) the driver creates a
>>> non-secure fastrpc device for the ADSP.
>>> Can it actually be used? Note: no mentioning of a particular userspace
>>> implementation or the (un)expected usage.
>>> If it could not and an attempt to use it resulted in some kind of an
>>> error, then the patch is a fix and it should be decribed accordingly.
>>> If it could be used and now you are removing this possibility, then it
>>> is a regression. Again, this must be clearly documented, but generally
>>> this is not allowed.
>> Thanks for the clarification, Dmitry.
>>
>> As of today, if the property is present in DT, non-secure fastrpc device will be created
>> for ADSP and as there are no checks to restrict daemons to use only secure node, there
>> will not be any failures observed. So there is no error if non-secure property is added
>> for ADSP and your 2nd point holds here.
>>
>> Problems with the current design are(you can look into below points independent of the change):
>>
>> 1. This creates a security concern as any process that can open non-secure device
>> can replicate daemon to attach to DSP root PD and cause troubles there which is not
>> a good thing. So basically any trusted process(maybe same group) should only use secure
>> device node and any process using non-secure node should only offload to unsigned PD.
> Again, you are describing expected behaviour. Other userspace clients
> can deviate from this.
Okay, understood.
>
>> 2. Having this property well defined also help in scaling fastrpc driver for new domains(like CDSP1
>> was recently introduced) as driver can only rely on the "label" and "non-secure-domain" property
>> for device creation. Say, only secure device is create if property is not defined and both device nodes
>> are created if non-secure-domain is define. This way, the dependency on domain_id can be removed
>> from fastrpc_rpmsg_probe[1] and create either only fastrpc-xdsp-secure or both(secure and non-secure).
> Well, I don't think I follow this point. The property is already
> well-defined.
By well-defined I meant there isn't a proper documentation of what is meant by non-secure-domain.
>> This however is a regression as you have mentioned, but it it helps address multiple problems.
>>
>> Should I discuss further on documentation or is any more design clarification should be done here?
> At least you must explicitly specify that this causes changes to
> userspace, and all the reasons to do that. So that everybody else
> doesn't have to read between the lines.
Ack.
>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n2327
>>
>> --ekansh
>>>> --ekansh
>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
>>>>>>  1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> index 3d8410683402..c633926c0f33 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>>>> @@ -3852,7 +3852,6 @@ fastrpc {
>>>>>>                                      compatible = "qcom,fastrpc";
>>>>>>                                      qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>                                      label = "adsp";
>>>>>> -                                    qcom,non-secure-domain;
> - Are there other platforms which have this flag set for ADSP?
Yes, there are a few platforms where this property is added for ADSP.
> - Granted that sc7280 was targeting ChromeOS devices, might it be that
>   there is a CrOS-specific userspace for that?
FastRPC nodes were recently added to this devicetree recently. Looks like this property is just getting copied.
It might be that fastrpc was recently tried on ChromeOS device or it might be added to support some other devices
that uses fastrpc(qcm6490-idp etc.).

--ekansh

>>>>>>                                      #address-cells = <1>;
>>>>>>                                      #size-cells = <0>;
>>>>>>
>>>>>> --
>>>>>> 2.34.1
>>>>>>


