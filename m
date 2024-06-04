Return-Path: <linux-arm-msm+bounces-21569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26C8FAF5D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C48C2820D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 09:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0EF1448C9;
	Tue,  4 Jun 2024 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X9xs4YMR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7873D14372F;
	Tue,  4 Jun 2024 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717495086; cv=none; b=GK+CNLxAMbwJ3Nn9A4MUzF7NqUmMmatrq1uKT1TMt5/gVOPtwJjd/DOwPuaLz0eUaSzAe+gpg6oxbUk+OCMX4GFZrw8XMQtJiTMOIQS5TlbYcHLq8i0H/X8IvQCbBuCcTDv1L0o1uZW2Ah+tD+OY6znidF3+YUSiqexhkXPz3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717495086; c=relaxed/simple;
	bh=3PPtXn1jPClzorEiZU4odMAQl97QeQz38W5I32jP4Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DDVmAda1hCbu9h8BasP0fVBMdie8NM5qboIff955yV9qaNE2gMgnlkoNkmpKJ5Ef9Vpt0th7pyl/u11knrdiNRxzAMrStdtNby/TsLnVX8e9YU6POF+VucZg6kWXJFdnnBx73xKUyT4mGT3+L8fihBDZIPFD0DYuExhGsuL+VDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X9xs4YMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4542sHBN029983;
	Tue, 4 Jun 2024 09:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2F/p0Z4ulNOQZTPsq3TXnRby97U0xEoSLT1/W0wO2Jo=; b=X9xs4YMRHk+UjVx+
	4hCk5+u6TUlM959S0lDzSXf5yTzAonTHa2jlsj/5YfpQNOQ1z8tvoe9MvFUkn/1E
	Hvkoi9YgXUANJAkoKzaKnPogXJfUM0RHDawzenGX4o9k8Sr35sv7M/BvkfVcNXG3
	mKgYw/BfS1OY9wpEf3zH4YG3V89oibKlYC7y2mESPBQkMvCZ//wWO1z05cse7z3B
	uDFUX1fdRgx+D+4k1YHorcca5ExqPAjCVWw5ccpqcNNGFVmH521hWR7CsFh4D58p
	vlKFJA3Uhk+1XRiJGcWTClHntk/ZOiJtIYc0sinUqSCbv2T8ezSLbPPcAEwwhjaT
	i9+gnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dpbf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 09:57:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4549vvd6008475
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 09:57:57 GMT
Received: from [10.216.52.99] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 02:57:51 -0700
Message-ID: <2b8e5810-6883-4b6d-8fa7-f13bbc0e897e@quicinc.com>
Date: Tue, 4 Jun 2024 15:27:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Disable SuperSpeed
 instances in park mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke
	<mka@chromium.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>,
        Doug Anderson
	<dianders@google.com>, <stable@vger.kernel.org>
References: <20240604060659.1449278-1-quic_kriskura@quicinc.com>
 <20240604060659.1449278-2-quic_kriskura@quicinc.com>
 <le5fe7b4wdpkpgxyucobepvxfvetz3ukhiib3ca3zbnm6nz2t7@sczgscf2m3ie>
 <e0b102b6-5ea5-4a86-887f-1af8754e490b@quicinc.com>
 <tbtmtt3cjtcrnjddc37oiipdw7u7pydnp7ir3x5u3tj26whoxu@sg2b7t7dvu2g>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <tbtmtt3cjtcrnjddc37oiipdw7u7pydnp7ir3x5u3tj26whoxu@sg2b7t7dvu2g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -qyRPollpA0kgcu67bO212WB4PoIuPym
X-Proofpoint-GUID: -qyRPollpA0kgcu67bO212WB4PoIuPym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=969 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040080



On 6/4/2024 3:16 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 04, 2024 at 01:34:44PM +0530, Krishna Kurapati PSSNV wrote:
>>
>>
>> On 6/4/2024 1:16 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jun 04, 2024 at 11:36:58AM +0530, Krishna Kurapati wrote:
>>>> On SC7180, in host mode, it is observed that stressing out controller
>>>> results in HC died error:
>>>>
>>>>    xhci-hcd.12.auto: xHCI host not responding to stop endpoint command
>>>>    xhci-hcd.12.auto: xHCI host controller not responding, assume dead
>>>>    xhci-hcd.12.auto: HC died; cleaning up
>>>>
>>>> And at this instant only restarting the host mode fixes it. Disable
>>>> SuperSpeed instances in park mode for SC7180 to mitigate this issue.
>>>
>>> Let me please repeat the question from v1:
>>>
>>> Just out of curiosity, what is the park mode?
>>>
>>
>> Sorry, Missed the mail in v1.
>>
>> Databook doesn't give much info on this bit (SS case, commit 7ba6b09fda5e0)
>> but it does in HS case (commit d21a797a3eeb2).
>>
>>  From the mail we received from Synopsys, they described it as follows:
>>
>> "Park mode feature allows better throughput on the USB in cases where a
>> single EP is active. It increases the degree of pipelining within the
>> controller as long as a single EP is active."
> 
> Thank you!
> 
>>
>> Even in the current debug for this test case, Synopsys suggested us to set
>> this bit to avoid the controller being dead and we are waiting for further
>> answers from them.
> 
> Should these quirks be enabled for other Qualcomm platforms? If so,
> which platforms should get it?

In downstream we enable this for Gen-1 platforms. On v1 discussion 
thread, I agreed to send another series for other platforms.

I could've included it for others as well in this v2, but there are 
around 30 QC SoCs (or more) on upstream and many are very old. I need to 
go through all of them and figure out which ones are Gen-1. To not delay 
this for SC7280 and SC7180 (as chrome platforms need it right away), I 
sent v2 only for these two targets.

Regards,
Krishna,

> 
>> I can update thread with more info once we get some data from Synopsys.
>>
>> Regards,
>> Krishna,
>>
>>>>
>>>> Reported-by: Doug Anderson <dianders@google.com>
>>>> Cc: <stable@vger.kernel.org>
>>>> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
>>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>>> ---
>>>> Removed RB/TB tag from Doug as commit text was updated.
>>>>
>>>>    arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> index 2b481e20ae38..cc93b5675d5d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> @@ -3063,6 +3063,7 @@ usb_1_dwc3: usb@a600000 {
>>>>    				iommus = <&apps_smmu 0x540 0>;
>>>>    				snps,dis_u2_susphy_quirk;
>>>>    				snps,dis_enblslpm_quirk;
>>>> +				snps,parkmode-disable-ss-quirk;
>>>>    				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>>>>    				phy-names = "usb2-phy", "usb3-phy";
>>>>    				maximum-speed = "super-speed";
>>>> -- 
>>>> 2.34.1
>>>>
>>>
> 

