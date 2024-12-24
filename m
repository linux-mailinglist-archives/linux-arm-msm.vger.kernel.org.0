Return-Path: <linux-arm-msm+bounces-43200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 780629FBA83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B94667A2366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055BF1922F2;
	Tue, 24 Dec 2024 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZqrgoFZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ED3192D86;
	Tue, 24 Dec 2024 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029010; cv=none; b=mZ+zJwWpo5HDefFRr1w4s+jlYy43F22hY+sgtppT8VDX5arQx8Pc6eRXswSC/QurmGRQOGBAUDKkgsJAtJD3P9NahfjHqlfKJIgsgat1LkXgy9We5P2w+7oLnmRQDiiGyDD4IbI1ER097/UYzimRsu87QemvAr1SrJPUfwU9sQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029010; c=relaxed/simple;
	bh=Wbmw8BPxfxq/teIi2HRjCbdDkHuybVoooTlzbU2GLkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pH7B9u1woFwXeESDEozwKRvbBUgI+mCOXHEcD54NzlAju4i/Ph+yjKyc0q7nODbRhwjlFLiPMa7P9cib3hRwspOCxNJnOnPWyPzRPhqqWlCEerS0Cev0NOpxSja3cUyXTd7JW9VA7rxTEat/Q10401pYYAYk9Q0mY+X7rn/AF8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZqrgoFZ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO0mROs028368;
	Tue, 24 Dec 2024 08:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4eLZRyuO3Qbkd7uzqImboKoFs9zQLAWJlz8RxntLrs=; b=ZqrgoFZ+dLubh+OQ
	iL6j1+aseTuzFrCw3Ug55zlVmDpsvFqQQvOvCoS/5Fbnwu9nAmOs6mw+NlTU2kgO
	q0jlfDzxuHBrxhLMu8tupvasuMA5iMfMoBH4eng9VuafOK3O5vF8vWcH1Kr371Od
	J2IgLA4hvKfr85Qj2A+e2J+yuJu0XXNa5UymaIcbKjx87SKI71xx3nzd6OAjs5bd
	92Jx/SamllaYxVYQPBoVOjaKZbJFRAceQR+ebgJp8SdhLKA2i/1oU8WZlQt3FNc4
	PyqehbMC8OWxgnmNkOpfOrv3tEpiQQa5vEwVxbWPNofiNSA74aSnioORPxSu0P4u
	4/FWlg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qjqvhm24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 08:30:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BO8U1c8023001
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 08:30:01 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Dec
 2024 00:29:56 -0800
Message-ID: <61fd78e4-d583-42f2-9886-7f657585b9d4@quicinc.com>
Date: Tue, 24 Dec 2024 16:29:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] Bluetooth: qca: Update firmware-name to support
 board specific nvm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Balakrishna Godavarthi
	<quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241212150232.3823088-1-quic_chejiang@quicinc.com>
 <20241212150232.3823088-3-quic_chejiang@quicinc.com>
 <94eae703-ed9e-4f57-9786-99db7aaa07d1@oss.qualcomm.com>
 <db516034-81de-4e41-932d-c1bb26e1c55b@quicinc.com>
 <d5fe224b-7ef5-47ae-840c-7b6df21da816@oss.qualcomm.com>
 <3a8fe16f-aca7-482e-b1cb-e6fa37717843@quicinc.com>
 <89d308d4-8565-4e60-bab7-94474dae3b55@oss.qualcomm.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <89d308d4-8565-4e60-bab7-94474dae3b55@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yMwNyFTGwuJKlqloWFgmk2miqqGCE8zD
X-Proofpoint-GUID: yMwNyFTGwuJKlqloWFgmk2miqqGCE8zD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412240070



On 12/23/2024 7:46 PM, Konrad Dybcio wrote:
> On 23.12.2024 3:47 AM, Cheng Jiang (IOE) wrote:
>> Hi Konrad,
>>
>> On 12/20/2024 9:46 PM, Konrad Dybcio wrote:
>>> On 13.12.2024 8:05 AM, Cheng Jiang (IOE) wrote:
>>>
>>> [...]
>>>
>>>>> /*
>>>>>  * If the board-specific file is missing, try loading the default
>>>>>  * one, unless that was attempted already
>>>>>  */
>>>>>
>>>>> But, even more importantly:
>>>>>
>>>>> a) do we want to load the "incorrect" file?
>>>> Normally, there is a default NVM file ending with .bin, which is suitable 
>>>> for most boards. However, some boards have different configurations that 
>>>> require a specific NVM. If a board-specific NVM is not found, a default 
>>>> NVM is preferred over not loading any NVM.
>>>
>>> So, if one is specified, but not found, this should either be a loud error,
>>> or a very loud warning & fallback. Otherwise, the device may provide subpar
>>> user experience without the user getting a chance to know the reason.
>>>
>>> I think failing is better here, as that sends a clearer message, and would
>>> only happen if the DT has a specific path (meaning the user put some
>>> intentions behind that choice)
>>>
>> In the existing BT driver implementation, even if the rampatch/nvm are not found,
>> BT still works with ROM code only. No fails, just a warning in the dmesg. For this
>> new approach, we use the similar logic. 
>>
>> The fallback to load a default nvm file is due to each board has a unique board
>> id, it's not necessary to upstream all the board-specific nvm since most of them 
>> may be the same, the default nvm file is suitable for them. But we can't set the 
>> default nvm file name in the DT, since the platform can attach different 
>> connectivity boards. This is a reasonable way to approach this. 
> 
> Okay, let's do it this way then.
> 
Ack.
>>>>> b) why would we want to specify the .bin file if it's the default anyway?
>>>> The default NVM directory is the root of qca. The 'firmware-name' property 
>>>> can specify an NVM file in another directory. This can be either a default 
>>>> NVM like 'QCA6698/hpnv21.bin' or a board-specific NVM like 'QCA6698/hpnv21.b205'.
>>>
>>> Do we expect QCA6698/hpnv21.bin and QCAabcd/hpnv21.bin to be compatible?
>>>
>> No. It may be different. 
> 
> That's a bit disappointing considering the filename implies it's suitable
> for a family of chips.. But I guess there's nothing we can change here.
> 
They are different generations, so the nvm file may be not compatible. Yes,
there is nothing we can change here. 
 
> Konrad


