Return-Path: <linux-arm-msm+bounces-68577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32FB2179D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01B09190529E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07DB221FF53;
	Mon, 11 Aug 2025 21:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RZWg6Fe3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34582311C2E;
	Mon, 11 Aug 2025 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754948762; cv=none; b=n2RUpdahas5Xml84bO0TkCmrYaOw3Yte4qed8wk+la4mBLIFxZaJV5T+ZzT/cUcTBk+mLLToJaLUA7xllZV07vCZyUriTbAEOWgNZaTtAK0Tiwr2PECK3xOWXZzk95eQ98gVPY4LoH675+IuiRTfBXqcP5ZlYbZG+xGJEdCECvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754948762; c=relaxed/simple;
	bh=2Oe8kgGT21tommz/oAaFAC2kJoN97CNW8KHYWK8PUks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SICJpOpuaHdgFtC6KYEe/sXj/O6MUsYg3EI4YpMksmipcvL5krT3BelnLTyRyCl+I/rFUg6Kk4dnVDMcPGUShDTfjtNp4lbBwPn3Ix7/4fV+ZlpdkV1Ml8cUThGTdOzMEINx1qddAjRI83oRMMdpmYFS/4SU74BYa/o1k5sp2B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RZWg6Fe3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFBJaR004770;
	Mon, 11 Aug 2025 21:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIjtyinG9nHtHhZQ8hhADmScgNe+P1our94TkbAJt70=; b=RZWg6Fe3kmL8QMZC
	kzXSdNrvKitebLi/j5AMsOJz4cYy6ToMm0o3TkDBKFCFXJtBY4nLi/mj4TFvf66H
	e+PLUtltJHEmKHxJpqs+s2lwiHnV10DTXrleukcmb4llhS1uZBZwSWW4lPItqFBS
	wxhJs8mDk3sPnHmrjQ6aUjUBPLPsi18EL38ACFcXC9nLt6KFsGYrFk7+r/i9eMMP
	UQRSlp4j35zOGYO72HuIneFA3ohLafFxJa4ZyucKd8Y39Q7CcZpr6hEjWrOwexB/
	CqPbL/I1dPxAlTbMpUhBpoK+K7836sn6akSF2WfV1hV9bXhmGM4TTIC/Yt5ztpHp
	Sy6hHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxb90n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 21:45:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BLjmMx008283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 21:45:48 GMT
Received: from [10.216.45.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 14:45:42 -0700
Message-ID: <f5b4580c-4e68-405f-95fb-21fa1b105711@quicinc.com>
Date: Tue, 12 Aug 2025 03:15:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
To: 'Manivannan Sadhasivam' <mani@kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>
CC: 'Konrad Dybcio' <konrad.dybcio@oss.qualcomm.com>,
        'Krzysztof Kozlowski'
	<krzk@kernel.org>,
        'Ram Kumar Dwivedi' <quic_rdwivedi@quicinc.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <06d201dc0689$9f438200$ddca8600$@samsung.com>
 <wpfchmssbrfhcxnoe37agonyc5s7e2onark77dxrlt5jrxxzo2@g57mdqrgj7uk>
 <06f301dc0695$6bf25690$43d703b0$@samsung.com>
 <CGME20250806112542epcas5p15f2fdea9b635a43c54885dbdffa03b60@epcas5p1.samsung.com>
 <nkefidnifmbnhvamjjyl7sq7hspdkhyoc3we7cvjby3qd7sgho@ddmuyngsomzu>
 <0d6801dc07b9$b869adf0$293d09d0$@samsung.com>
 <fh7y7stt5jm65zlpyhssc7dfmmejh3jzmt75smkz5uirbv6ktf@zyd2qmm2spjs>
 <0f8c01dc0876$427cf1c0$c776d540$@samsung.com>
 <xqynlabahvaw4cznbofkkqjr4oh7tf6crlnxoivhpadlymxg5v@a4b5fgf55nqw>
 <10ae01dc08c9$022d8aa0$06889fe0$@samsung.com>
 <o2lnzaxurshoyyxtdcyiyphprumisggd6m2qvcoeptvnkvh4ap@dm2nc4krinja>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <o2lnzaxurshoyyxtdcyiyphprumisggd6m2qvcoeptvnkvh4ap@dm2nc4krinja>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689a648d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=pyoVPm71RKJ-DdxDm9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX4hNPXG7rrA/c
 UYoeeeMp5YAhGlGluUEtht4A587+suPjkkkUT+cPI3UeG/mbUdo2aDiRC3QtzR0pm1gtEsyzdid
 Nqu6G5dQ3s6J3ZOONVnVU9GxWELkfgsW+41Qhx3EUeSXLQtGcfxiLtbfJle5fKix1lO97UQ79lu
 mXx2kAeT2xj+OB5sDCxfTy8cCx30SGVMhEzMn4rMG4BV6adScVrCvJETFVAlnMHaz8mctM2fUao
 veA/BXMYkMUAJXzR5J/XQB9HoJcYWuFGqhsb1XaTWEebbS0grVEkrOuHqbgrPCWymwwLSE9d6ub
 qPLgtpfgS+8R78sA3rBw6GkFw1MVeMTwNEJozlIcUPGqfUYnXD5p5PmFKiRBbmc6QfyJ6vvhCyV
 CwoQxpS/
X-Proofpoint-ORIG-GUID: vfhsHoI_08neQPc0-2oc0GfW9_30P2ni
X-Proofpoint-GUID: vfhsHoI_08neQPc0-2oc0GfW9_30P2ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097



On 8/9/2025 4:43 PM, 'Manivannan Sadhasivam' wrote:
> On Sat, Aug 09, 2025 at 06:30:29AM GMT, Alim Akhtar wrote:
> 
> [...]
> 
>>>>>>>>>> I understand that this is a static configuration, where it
>>>>>>>>>> is already known
>>>>>>>>> that board is broken for higher Gear.
>>>>>>>>>> Can this be achieved by limiting the clock? If not, can we
>>>>>>>>>> add a board
>>>>>>>>> specific _quirk_ and let the _quirk_ to be enabled from
>>>>>>>>> vendor specific hooks?
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> How can we limit the clock without limiting the gears? When
>>>>>>>>> we limit the gear/mode, both clock and power are implicitly
>>> limited.
>>>>>>>>>
>>>>>>>> Possibly someone need to check with designer of the SoC if
>>>>>>>> that is possible
>>>>>>> or not.
>>>>>>>
>>>>>>> It's not just clock. We need to consider reducing regulator,
>>>>>>> interconnect votes also. But as I said above, limiting the
>>>>>>> gear/mode will take care of all these parameters.
>>>>>>>
>>>>>>>> Did we already tried _quirk_? If not, why not?
>>>>>>>> If the board is so poorly designed and can't take care of the
>>>>>>>> channel loses or heat dissipation etc, Then I assumed the gear
>>>>>>>> negotiation between host and device should fail for the higher
>>>>>>>> gear and driver can have
>>>>>>> a re-try logic to re-init / re-try "power mode change" at the
>>>>>>> lower gear. Is that not possible / feasible?
>>>>>>>>
>>>>>>>
>>>>>>> I don't see why we need to add extra logic in the UFS driver if
>>>>>>> we can extract that information from DT.
>>>>>>>
>>>>>> You didn’t answer my question entirely, I am still not able to
>>>>>> visualised how come Linkup is happening in higher gear and then
>>>>>> Suddenly
>>>>> it is failing and we need to reduce the gear to solve that?
>>>>>
>>>>> Oh well, this is the source of confusion here. I didn't (also the
>>>>> patch) claim that the link up will happen with higher speed. It will
>>>>> most likely fail if it couldn't operate at the higher speed and
>>>>> that's why we need to limit it to lower gear/mode *before* bringing the
>>> link up.
>>>>>
>>>> Right, that's why a re-try logic to negotiate a __working__ power mode
>>> change can help, instead of introducing new binding for this case.
>>>
>>> Retry logic is already in place in the ufshcd core, but with this kind of signal
>>> integrity issue, we cannot guarantee that it will gracefully fail and then we
>>> could retry. The link up *may* succeed, then it could blow up later also
>>> (when doing heavy I/O operations etc...). So with this non-deterministic
>>> behavior, we cannot rely on this logic.
>>>
>> I would image in that case , PHY tuning / programming is not proper.
> 
> I don't have the insight into the PHY tuning to avoid this issue. Maybe Nitin or
> Ram can comment here. But PHY tuning is mostly SoC specific in the PHY driver.
> We don't have board level tuning sequence AFIAK.

Hi Alim and Mani,

Here's my take:

There can be multiple reasons for limiting the gear/rate on a customer 
board beyond PHY tuning issues:

1. Board-level signal integrity concerns
2. Channel or reference clock configuration issues
3. Customer board layout not meeting layout design guidelines

This becomes especially critical in automotive platforms like the 
SA8155, as mentioned by Ram. In such safety-critical applications, 
customer prioritize reliability over peak performance, and hence 
customers are generally comfortable operating at lower gears if 
stability is ensured.

For the current case customer had some issue #1 at their end(though 
don't have complete details)

As Mani pointed out, issues are more likely to surface under stress 
conditions rather than during link startup. Therefore, IMHO if any 
limitations are known, it's advisable to restrict the gear/rate during 
initialization to avoid potential problems later.

Moreover, introducing quirks for such cases isn’t very effective, as it 
requires specifying the exact gear/rate to be limited—which can vary 
significantly across different targets.

Regards,
Nitin

> 
>>
>>>> And that approach can be useful for many platforms.
>>>
>>> Other platforms could also reuse the same DT properties to workaround
>>> similar issues.
>>>
>>>> Anyway coming back with the same point again and again is not productive.
>>>> I gave my opinion and suggestions. Rest is on the maintainers.
>>>
>>> Suggestions are always welcomed. It is important to have comments to try
>>> out different things instead of sticking to the proposed solution. But in my
>>> opinion, the retry logic is not reliable in this case. Moreover, we do have
>>> similar properties for other peripherals like PCIe, MMC, where the vendors
>>> would use DT properties to limit the speed to workaround the board issues.
>>> So we are not doing anything insane here.
>>>
>>> If there are better solutions than what is proposed here, we would indeed
>>> like to hear.
>>>
>> For that, more _technical_ things need to be discussed (e.g. Is it the PHY which has problem, or problem is happening at unipro level or somewhere else),
>> I didn't saw any technical backing from the patch Author/Submitter
>> (I assume Author should be knowing a bit more in-depth then what we are assuming and discussing here).
>>
> 
> Nitin/Ram, please share more details on what level the customer is facing the
> issue.
> 
> - Mani
> 


