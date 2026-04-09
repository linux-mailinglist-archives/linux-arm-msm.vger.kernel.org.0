Return-Path: <linux-arm-msm+bounces-102408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y3+8AcU812l7LwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 07:44:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E03C65B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 07:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70799300820E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 05:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06602304BCB;
	Thu,  9 Apr 2026 05:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hGfnU83J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B30221F39;
	Thu,  9 Apr 2026 05:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775713473; cv=none; b=I9M9dsvgwYuoUVWvWLT4JfiITVoDYWHzb4nvuzSXrxVlkmw0Ot4MWhDSYLhoqeptD94KNf1Ik4nn06I/RyNCSMPx+eDnD8LCxCVb27NY8xmSaNMA7gp3t3coKhyRdOy+NJepxBK8T3OSgHbfHCSEXx92QNd/RKQ2kYoCwaUdnqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775713473; c=relaxed/simple;
	bh=3+BFoDQD4UGhv/u5iKR61AyE5QPCcr69xWeIblpslLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GktegEsaX35Is1Mxd7dh2ZUhuBqr8WXjXAngq4qyANpJcOjuT+fRaOziJ6y+ctxGfdqCvkeps6ssgowFGDY6Zqj/aTh7Hxtt+9XTsY9V4UQPOZDj2M9Qlftvt8kecmQqikLlCqx/H0EPOpbdnuDaGDDyyZ8gb66K4xF8K0MhDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hGfnU83J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395OLb23712758;
	Thu, 9 Apr 2026 05:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+WQCybGlL4QigHsZgqmfBWWmN0VKUE8WJCHz2x1DQo=; b=hGfnU83J+MuZuU3H
	dEEagdkvig/GpdZj9kFrgH3EQdYYR3jxV75U2vBzREyLZb8W8EPZkoc0uirX2aQ/
	yJxn3FWHXpn2OcGObFBv/2QCec8u6vAZf+DRoYNkFk8zO7E2JD8LXKaJ8OYuM88o
	kuRCvOPDobd8oHUdETBPsEWyIx+CN0ns1OYAUzqhfnTY9jxM8Cwyrnk3QN3WYQ42
	wnGZRcbcM91zstd1h0ezMwUWqojnZ9pYncwYoZfKbprdNoOXk0YY2Ie0jKJf9PAA
	z2FvTwTG6PJXb9W+1mWdjV5q34Rcn/4CjaLZyEl/jWPSJJAvSGU5TiFpXV2Ojaqz
	zTA1fg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74agma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Apr 2026 05:44:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 6395iPQp005642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Apr 2026 05:44:25 GMT
Received: from [10.204.78.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 8 Apr
 2026 22:44:21 -0700
Message-ID: <75d22f54-eb55-4e55-9582-5b407f41ee81@quicinc.com>
Date: Thu, 9 Apr 2026 11:14:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur> <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
 <acVWseivbxLQ_uDM@baldur>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <acVWseivbxLQ_uDM@baldur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d73cb9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=aBhg6lAgCmotgtkINXQA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7WIROd-NrMSWNwZCJBRQx7cIGvSuiUE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA0OSBTYWx0ZWRfX5vM6VqO5rN+i
 v6LUPkUK/b15O2dhDuBGalFDRemVvnr2yDQydvGJwAAAOwA+slMCzMAknVM0D+cBZCMrz4p2trI
 kBWEI/uDIWzeQNYVy/zZv3O+0pjA3+LfuhOaXX84cTaTgo+hiHkXTKOHzFGGCd4NNE4+tiRXvMH
 LROfd9T0yVqP4OFQgq0ODlRkegPEREdwykIP9ZppJ06WfiCOcuF2KuVFzHcbOAYuQ5ecNP+EVxz
 +2EJYYMH9Nw6o/2w5PfGhbsTPVbC62fkhuZ3e/OPChVXkoiCXV+PW4YBKWpzG+WrLEB2zH27kUL
 H8fmsIbzJ6hKerriKr4Uv0/AWQ8CUNuD5INbvkbwUKHknqgEu3D9fROE9y0MlFx0S3B7h7IOfEh
 G6tv10cGaFkC6NBDexJLbldDH+9yvb9+HiIFeY8UxvCBQFcpd47o4OsgFgYabFfFPP9Tlb3qlQZ
 JzHGj7hwCHVBrRE73eg==
X-Proofpoint-GUID: 7WIROd-NrMSWNwZCJBRQx7cIGvSuiUE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090049
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102408-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[quicinc.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 203E03C65B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/2026 9:28 PM, Bjorn Andersson wrote:
> On Thu, Mar 26, 2026 at 03:06:52PM +0530, Ayushi Makhija wrote:
>> On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
>>> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
>>>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>>>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>>>
>>>
>>> Please add Fixes: tag.
>>>
>>
>> Hi Bjorn,
>>
>> Sure, will add in new patchset.
>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>
>>> Please start using your oss.qualcomm.com address.
>>>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> index 3837f6785320..6ba4e69bf377 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>>>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>>>  
>>>>  		vreg_l12b_1p8: ldo12 {
>>>>  			regulator-name = "vreg_l12b_1p8";
>>>> -			regulator-min-microvolt = <1200000>;
>>>> +			regulator-min-microvolt = <1650000>;
>>>
>>> Are you sure it's not supposed to be 1.8V, given the name of the rail?
>>>
>>> Regards,
>>> Bjorn
>>
>> There was already discussion regarding the minimum voltage for this regulator on sm8550 target
>> on other upstream patch. 
>>
>> Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
>>
>> This values is according to the NT37801 panel sec
>> "The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
>> VDDI=1.65V~1.95V."
>>
> 
> Yes, so the panel requires 1.65V, so regulator-min-microvolt needs to be
> at least that. But regulator-min-microvolt should account for all the
> consumers of the rail, are there any others?
> 
> Which leads me to my question, the people designing the board named the
> rail VREG_L12B_1P8 in the schematics, why didn't they name it
> VREG_L12B_1P65?
> 
> Please check all the consumers and make the regulator-min-microvolt work
> for all of them - if that's 1.65V, then your change is good.
> 
> Regards,
> Bjorn

Hi Bjorn,

There is only one consumer of VREG_L12B_1P8 rail, i.e. NT37801 panel.
So regulator-min-microvolt as 1.65V should be fine for VREG_L12B_1P8 rail.

Thanks,
Ayushi


