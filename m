Return-Path: <linux-arm-msm+bounces-37869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BAD9C8252
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 06:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78FBD1F22F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 05:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7672F157E99;
	Thu, 14 Nov 2024 05:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ooFPOwrE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B40A801;
	Thu, 14 Nov 2024 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731561608; cv=none; b=O0pXQumArARNNkwGOHEYZUCB3oFdYzUzHu0Bv/XSFTduGviUoPxfX6LLSKzMjQ0YlYkXwyo+XWg/t7Dnxs6hnIJ+waQA1UBU4lTEGZwNKvb+dgPc7/ZEzuerIZyS1hE/KzDsvWBztWZb5LLs7eQeXm6qD4JuNY5i7a/jJawtYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731561608; c=relaxed/simple;
	bh=bC7YHY9eRvaXNaKGtlpVkgCIyqbqSnpXZKz2bnktmP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sHm4H/DrCFuX8cYoBZeRtj7Hb8wED/x3BDwyLe12W/WLZhAaZmCdOoz99yZQWquiWOU9arkaoM3qboiC2C/Kbn5NM8m9WDlgWn9ePGyGMeBSmRGgGuZYgdPAjLrKTBwptiblcsNT5tSAzX3n6w7gvgwpfog+akfeQZVlq59aCZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ooFPOwrE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1ega026166;
	Thu, 14 Nov 2024 05:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrkIrxY0jsX5Qba7Sp5R/vGBw075/HC9nXMl2JaMbb4=; b=ooFPOwrEJRtvmcXA
	4+hvnjLQAHZsY0Fbm/udwdjqf7xooI+ybIFz+69gl7pgDZw2ZI4fVq26/K7ZkR3H
	8mT2MzzDcjuIfeaQ3v4f5efaAV18uTilKaALCt3vbRJSKbRumaZBBED2HyMRrJ8A
	NXgDYLHf1/b23tX0DQnliGajVBmRgfc8lOHr9GlwphiAyjjg5w/o/YsQ4SHDXQxA
	2bONdKEbDCG4Zu8bfENW4wKA6uOE8jMNnmnqA0KQHr6MMjosbgRO3AkVl/w/vlh8
	rMWibZnSdJn3OOlDfT9m9vMK9ZhzU2uj6ppAayBB62PLtPbU+7HKQ6rCYeA/60Z1
	YkXMPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07d9vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:20:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE5Jxx7027146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 05:19:59 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 13 Nov
 2024 21:19:55 -0800
Message-ID: <b8a9a8f5-1f36-4eea-925b-84578e71838d@quicinc.com>
Date: Thu, 14 Nov 2024 10:49:52 +0530
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
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <CAA8EJprDTz7b4rNtR4e9A-=j9_z-aJGBg3+g5is8Bmy=cgTM1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0BZNFmNbmwykowaBM1Ic30s1u-Ec2_Gs
X-Proofpoint-ORIG-GUID: 0BZNFmNbmwykowaBM1Ic30s1u-Ec2_Gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140039



On 11/13/2024 5:20 PM, Dmitry Baryshkov wrote:
> On Wed, 13 Nov 2024 at 08:18, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>
>>
>> On 11/13/2024 11:13 AM, Dmitry Baryshkov wrote:
>>> On Wed, Nov 13, 2024 at 10:30:42AM +0530, Ekansh Gupta wrote:
>>>> FastRPC framework treats ADSP as a secure domain on sc7280 SoC
>>>> which means that only secure fastrpc device node should be
>>>> created for ADSP remoteproc. Remove the non-secure-domain
>>>> property from ADSP fastrpc node.
>>> If this prevents the non-secure devices from being created, isn't that a
>>> regression from the userspace point of view?
>> The actual intention of having secure and non-secure domains is to utilize signed(high privilege)
>> and unsigned(low privilege) DSP processes properly.
>>
>> Non-secure device node is intended to be used by untrusted/generic applications which needs to
>> offload tasks to DSP as unsignedPD. Only unsigned PD is expected to be allowed if the process is
>> using non-secure node.
>>
>> Secure device is intended to be used by trusted processes like daemons or any application
>> which needs to offload as signed PD to DSP.
>>
>> The ideal expectation from userspace is to first try to open secure device node and fall back to
>> non-secure node if the secure node is not accessible or absent.
>>
>> I understand your concerns, can you please suggest how this can be improved/corrected?
> Thank you for the explanation, and thanks for the description of the
> expected behaviour, but the question is different.
> Currently (with the property being present in DT) the driver creates a
> non-secure fastrpc device for the ADSP.
> Can it actually be used? Note: no mentioning of a particular userspace
> implementation or the (un)expected usage.
> If it could not and an attempt to use it resulted in some kind of an
> error, then the patch is a fix and it should be decribed accordingly.
> If it could be used and now you are removing this possibility, then it
> is a regression. Again, this must be clearly documented, but generally
> this is not allowed.
Thanks for the clarification, Dmitry.

As of today, if the property is present in DT, non-secure fastrpc device will be created
for ADSP and as there are no checks to restrict daemons to use only secure node, there
will not be any failures observed. So there is no error if non-secure property is added
for ADSP and your 2nd point holds here.

Problems with the current design are(you can look into below points independent of the change):

1. This creates a security concern as any process that can open non-secure device
can replicate daemon to attach to DSP root PD and cause troubles there which is not
a good thing. So basically any trusted process(maybe same group) should only use secure
device node and any process using non-secure node should only offload to unsigned PD.

2. Having this property well defined also help in scaling fastrpc driver for new domains(like CDSP1
was recently introduced) as driver can only rely on the "label" and "non-secure-domain" property
for device creation. Say, only secure device is create if property is not defined and both device nodes
are created if non-secure-domain is define. This way, the dependency on domain_id can be removed
from fastrpc_rpmsg_probe[1] and create either only fastrpc-xdsp-secure or both(secure and non-secure).

This however is a regression as you have mentioned, but it it helps address multiple problems.

Should I discuss further on documentation or is any more design clarification should be done here?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n2327

--ekansh
>> --ekansh
>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> index 3d8410683402..c633926c0f33 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>>>> @@ -3852,7 +3852,6 @@ fastrpc {
>>>>                                      compatible = "qcom,fastrpc";
>>>>                                      qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>                                      label = "adsp";
>>>> -                                    qcom,non-secure-domain;
>>>>                                      #address-cells = <1>;
>>>>                                      #size-cells = <0>;
>>>>
>>>> --
>>>> 2.34.1
>>>>
>


