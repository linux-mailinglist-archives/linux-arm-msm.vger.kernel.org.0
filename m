Return-Path: <linux-arm-msm+bounces-57570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1FAB2DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 05:17:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 324E83B2CAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 03:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690FC2A1B2;
	Mon, 12 May 2025 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RS+eBUsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFDE4C9F;
	Mon, 12 May 2025 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747019852; cv=none; b=YMB85wuAdX8E+0aaw44+zwD0Q7ReJEGCcG3jrAHRdvSQvC6qJvir8O+0V9sm3Q5w2K/ToMVyVe32/Y5rN2/dMJ4SgUXZBxQyvTlEEx9S7lIToxkm9UqYnZESK7u2Qa68rlHsvO/72Dc1Ey/2/kg+SgCBQGllzUWPXWp1HMj6NbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747019852; c=relaxed/simple;
	bh=OZfWAnobhqdNFKhB9BPrKOzfKONXZNBxo3gQaRzOoZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IJzvrI9oCptI/MtGtuMmzpzIysMmMN9kfv9HvJ3Y/7LgzfCbUFJI8dYSG+R4GmGuCvtkPGm0QLB34Mk30M36Uv/257SQwCnzAxbE8I/i8R46HUiAH/NJukTQf0CgDb4JSJz0PvCwW4VUPUt4sENbqeCB7r15txkpcZISuvXl7iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RS+eBUsa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54BMVidD027707;
	Mon, 12 May 2025 03:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ei71nJhFIXa2GPr33EmRirerjA+BagoTAuqVGerbAsc=; b=RS+eBUsaYPaZmbSx
	7jN9wxoDA5EI4kNgn0sBaBvEDlncitHht1Z2Ztu31JKdAYxz/ijdhtM0sBST76Ww
	/4AV69pa3+DYG8U/U3fmZ8J7qR0Azqbe/86YXSgsdB7yunyxIYJscIEHzf8ofSlX
	5jChBzrRLtACanjlSC8sAy6EtRwYfG11ta+yPE2rh7sENwEUNoRQvE98FADMxedp
	cuUaxrblFEmRmriDyrbpDyqeDN1w4qlCM/NBYVo8tHn0P2ko7T1sLCuoL7wq1CKx
	C06XC/UVNMLC3G3lCpq8+J2m/N5M6CE2Z/ierD1reh1TBSfdDKUheOLBmr/1Pp+L
	0yH+TA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghb4ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:17:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54C3HPQZ007225
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 03:17:25 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 11 May
 2025 20:17:18 -0700
Message-ID: <f70013d1-6273-4ec9-b860-0d88cfe6f181@quicinc.com>
Date: Mon, 12 May 2025 11:17:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
 <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
 <53dd6e80-b0d1-4b1e-9354-851fa2473191@quicinc.com>
 <18993254-5fa2-44bf-845f-3b0bef29508d@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <18993254-5fa2-44bf-845f-3b0bef29508d@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A-iLo1AcPI8ZS1AvQR1UqkfGtqqPG5vZ
X-Proofpoint-ORIG-GUID: A-iLo1AcPI8ZS1AvQR1UqkfGtqqPG5vZ
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=68216846 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=ElEvMR_8cTJwMRenlScA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDAzMyBTYWx0ZWRfXxpPAssAqjm3Z
 T7qcZuJMWvrwluyFxU6GAil50Q6m9ycFAJHNENj5Rjqjgn/LE8bxeXWIBI7rewmkd/Nw34toPoX
 F4T2DviEmXrvgl9XaB7GrLheHDd0wooXthxZbnavXhFj3nGCWEouuwgu/59ExAwPGL/hpYYhFhX
 cn0DMSAtPjVKhiqacLpGDi8vd+Hkwa7+eZvM2A4ET7cDchLN8cUr2hG8qLwjLhMGiWbMSjZ39I3
 IwjKnbr4bxCTOT/Rrb09SXx/4ayCVN3q40OZZY26SQ3AcEpTJfbkYfShlRNpCAtFiqAZ0dNhaF3
 6bD8vzFlEReXr3cijIKreaKqPSFreNuR1/VrIhOi7xsrsa/86n4l+Xz0Wi4WfnHGkpne7NEnD6r
 4CN4aF8sg1t6HtwAkfj1Neuv57uMu1jw3KGmZUXjiCIID7ffIUHQo5YD++2Tl5muKXdvCEQS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=975 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120033



在 5/9/2025 4:53 PM, Konrad Dybcio 写道:
> On 5/9/25 10:22 AM, Lijuan Gao wrote:
>>
>>
>> 在 5/8/2025 10:40 PM, Konrad Dybcio 写道:
>>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>>> From: Kyle Deng <quic_chunkaid@quicinc.com>
>>>>
>>>> The Shared Memory Point to Point (SMP2P) protocol facilitates
>>>> communication of a single 32-bit value between two processors.
>>>> Add these two nodes for remoteproc enablement on QCS615 SoC.
>>>>
>>>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
>>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 43 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> index 7c377f3402c1..53661e3a852e 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>>> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>>>>            qcom,bcm-voters = <&apps_bcm_voter>;
>>>>        };
>>>>    +    smp2p-adsp {
>>>> +        compatible = "qcom,smp2p";
>>>> +        qcom,smem = <443>, <429>;
>>>> +        interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
>>>> +        mboxes = <&apss_shared 26>;
>>>
>>> 26 will poke at the SLPI instead
>>
>> SLPI has not been enabled in QCS615, so the sensor will be in ADSP.  And 26 is being used dowstream, so it should be correct.
> 
> Please check in with the relevant folks and leave a comment such as
> 
> /* On this platform, bit 26 (normally SLPI) is repurposed for ADSP */
> 
> if it's indeed correct
> 
> Konrad

Yes, I have already confirmed the above information with the relevant 
folks. I will add this comment in the next patch.

-- 
Thx and BRs
Lijuan Gao


