Return-Path: <linux-arm-msm+bounces-99237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK/TKnQ0wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:39:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A12FC2F2095
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A072D300AD47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA218388E78;
	Mon, 23 Mar 2026 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OsS3abBA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBlBVxWK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CDC29AB02
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269520; cv=none; b=Dhiglc9/w4w1Nx6BVpjue8GyyHQocLv44HIQET6OUQgou5ODiE5npeyyMXW7TyIV4UwKkKkYNpsN5QUz3RZxY8BdKjATNLLlcYqJHZabWzbguxkKjxswYVw+s9E5mtuWWbv0rg01oBBCbwCDiEYbg+7+nRxtylcjvvt48KQoNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269520; c=relaxed/simple;
	bh=jv/jRVDtcHHI+rZD3ITPOyl7IuExS9Feda8LNxdU4/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHsYVgSeR/5en4FQfsXACn/S1k9PLtwAwzrLQxX4figD36mqg7mwHjahS2ZIjqV7zRAK7Y6GHjDNoyy2RLxKQtljYJUISZay83sWpOQimy69DEB3czFYYXKvUWaMvlbQEGVgi0+8fcNs7aejOgjGQi/cQZnFITnBs/J32+3Ktrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OsS3abBA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBlBVxWK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBgBli122534
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=; b=OsS3abBApC0HDibR
	R4ZZT04WBjssfTqmYeVeOS9JzfQqjnbuVReYAcKLXko4ns0ii0VOGKt11kedj0CF
	/yW0rcHYGEJTR1hY54GP6XhC+fKd/GZltmbfdHijm7KGmvCVibtqv2BzUxIYd4nG
	ikDFb0H0tKnuZAoFsaN/ULyJO0F7HHRhlleHsEoi6JG+MMTlCqnP92qiSKnzHmoB
	3sDTLJuwJZM3/NEdSkoumgiXSvHRbopJFQOr0udYyhg9Gedm+5/ciVvqAbOH0Anr
	QCUOOvEix8JiSNywEOzRCVvc1S/XVLO2ZBdIbi64Vs/8pIVC32ZHYlVl2T5vOESA
	HOfP6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkr5px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:38:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b27636835so41632191cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269504; x=1774874304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=;
        b=WBlBVxWKJZ798CCm66m7gXD2zUf2SYQ+Fgp0IgT2sUoeT0h1IS3TdyxLIaW0I/ixSK
         46PI37aNTqape6fbDvP8oxeMLLlNEZ53s99SJqrPvrILCMxC4rKPBgtCDLEV2pK/rEIJ
         drNiHzLo/le3VPdn7bngJbAATCsiG3o61SPuzJfZj7xEgq10yvpoiGPqX3WQCY+Xwxwg
         zmPGeCxWQivjMFsaeXPH087MA7sHu0ifJ0qkBWroapkoqchcslkFskEUlCGoLyvuovy4
         4ctJ8bkoqcdLYDj482MPPu+FpGpYVYD2gPuMXZyu3oXDJjV30/mwsx3Zq86veDTyD9OD
         G4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269504; x=1774874304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8eOrKf/wN1eLL27+5aZzGuxxl/Ho+uemx+Sv/Rd5OM=;
        b=BHxdDLhmDoWf9Cv/F3McGS59sR0d9Ru1yhz62OvEi+FQ185Z4UZs5XfokD+4TM1sYy
         pdfku3snQ47Vc46EHrLdaitBoxK0KRkNbgHiVx1SGnGRPpTQFZu4AK8Im7bNZKAIKK5S
         9ENPEVIQCaKGxPA7DPipCP7wa3vJWJEDZCjRSeCPKxpJQs9JSduk0iHwlUgT22vBqOzT
         /AUFl8OETW+nacZgLESt2USNVRz/vMLlsEoP0M86XNhaKJOgqHPcvn1TRoRbAL4llspU
         /2VHugesw6/pTyqu/7X1P0k3Ps8rjoeYd/6fNIzMNiBR/m3JHvYNJP3g8ZZCtorz3nwp
         V2vQ==
X-Gm-Message-State: AOJu0Ywkh8vyYOUNgfnLS/Yb8oM7HGydvsEpbQWIcLdbfZSZ6WiHdsms
	blmgABJXsOWWTBbNawrczLImEQV6DZblVmVwGydx5mLFcYwZDdfczlsk5drETXERJyoEGbTGlkH
	kOMtV8vfoPUqKeoz/lvcxcVRjPa9Y4+fyK8dELNQUWk+t7PyHyP23LFrHMre4i6zhLJsh
X-Gm-Gg: ATEYQzxKp0AeM9y0TGgN1I2VuCej2VAphqAo2b3Zl8VW69NrdPLDtxJuUy0RDZOo+Fj
	1l0PctiN8mtjmSXyO1v6PgnqtecXRxH5YehK2zGiU8rDDhljZBep3vhr5o/lyS+3YOQ3t2bepYf
	KPY1FAk7eaV7my6Lee7VurRs6Fez9IDX4H5RuVUDLX7D+RpU3KH+IzXnNm9dyZWt98mol79Uj64
	J/pkHNdu7Oot3qTLOfJ/7C2ybsv6r3YsDmG4XmTipy4BCZuUgJHbASxsaexp033rqu3lXQrY06F
	wTe9fXarkb/TexhRkdZyzW+FpJbpU8cUyucMT9wglLtukdJ0RswkJDtoM24prrpLe1l/3Fpr2T3
	oq51evjZo6SO4AXPm1yTIOItBbgYw9gjQyNaPXDH33PyEpp4v5w+lcWcXNebeGdxWNIwPlD5VHV
	1RlYY=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr152870221cf.1.1774269504452;
        Mon, 23 Mar 2026 05:38:24 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr152869881cf.1.1774269504038;
        Mon, 23 Mar 2026 05:38:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668cf4f8827sm3796627a12.2.2026.03.23.05.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:38:22 -0700 (PDT)
Message-ID: <62242f73-161b-4bf6-bb66-3775b7755971@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:38:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: milos: Reduce rmtfs_mem size to
 2.5MiB
To: Luca Weiss <luca.weiss@fairphone.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321-asteroids-v1-0-4b902901cb49@pm.me>
 <20260321-asteroids-v1-1-4b902901cb49@pm.me>
 <bd33bd53-2539-42ee-ba3c-4a544a61b621@oss.qualcomm.com>
 <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DHA5WVPN3F25.2Q71FMM8PD7UL@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX7qZrItSVSHKt
 KdttXSJvH82onivr8S+aaJhxWt0ZIJts7YM3+ej17G3pODBH78n7HpDKdjMmtrRQp46oDr9H8Ng
 cLEcAR3vMZXjcptFC+LPRFo4bNttjZtH6FkXRj5EraXFSRykwImhWS4s7yU1qFmDNsPd4dI2PYM
 0a9yCATQxOEOVQvRmp131Ij7xrGQTb/bl66qv1tgkyH//tBzhysabQwcVZIQXLTQIrniN5fEgpe
 kDYztbUNXyVWXgoPp2grUq8WjxOXyn0/6zAIeJV1NP4kvoPpMEkldi6SY+3cxwlZoxO3ZCtOIQK
 hJ0X7V9v+l2M2xQIau3lCdyhZ0br7ZLhur672Md4ka+bG5nLW1Sxba3K0qn5plAODPmbUC8QL3y
 TLy7menVbCdRhq25sg0QPfcQQxDGiSHOPr1y/+lU8qTKoT84pYfpHe9ncqEzcmhW6giPTVvoNJp
 VED5DZ0Ne6GP4xQ/ydA==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c13441 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=W6naqKN7AAAA:8 a=EUspDBNiAAAA:8 a=Jnoa2UoM1I-2u1HpP8gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Xp8b5NkTPdl8jt_qJiRs:22
X-Proofpoint-GUID: k2GyM0qmGbFkEq3IvlJp8SvHJ61fKEzV
X-Proofpoint-ORIG-GUID: k2GyM0qmGbFkEq3IvlJp8SvHJ61fKEzV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99237-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,fairphone.software:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A12FC2F2095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 1:32 PM, Luca Weiss wrote:
> On Mon Mar 23, 2026 at 10:51 AM CET, Konrad Dybcio wrote:
>> On 3/21/26 6:00 PM, Alexander Koskovich wrote:
>>> The rmtfs_mem region is currently sized at 6MiB but the default for
>>> milos downstream is 2.5MiB. This causes remoteproc crashes on devices
>>> that expect the smaller size:
>>>
>>> modem_ac.c:281:Access Control Error: Could not protect the region specified:Start:e1f00000 End:e2180000, PID:1
>>>
>>> Reduce the default to 2.5MiB to match the QCOM downstream config, and
>>> override the size for FP6.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 4 ++++
>>>  arch/arm64/boot/dts/qcom/milos.dtsi              | 2 +-
>>>  2 files changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..c0981ab731c4 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> @@ -724,6 +724,10 @@ &remoteproc_wpss {
>>>  	status = "okay";
>>>  };
>>>  
>>> +&rmtfs_mem {
>>> +	reg = <0x0 0xe1f00000 0x0 0x600000>;
>>
>> +Luca
> 
> You didn't actually Cc me, but I found it on the mailing list anyways :)

Oops!


> 
>>
>> Could you please confirm that this was intentional in the first place?
>>
>> FWIW I see that volcano.dtsi indeed only requests 0x280_000 on a "clean"
>> Qualcomm tree
> 
> Yes, it's intentional that it's 6 MiB on Fairphone (Gen. 6):
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/devicetree/+/b3744ffef87e1f2a232b26e9cb270a1f82554bc3%5E!/

"Root Cause: Requirement" :D

> 
> I think Fixes is appropriate since the default for Milos should be
> 0x280_000 and not 0x600_000?
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> 
> And maybe a comment like this on top of the node?
> 
> /* Increase the size from 2.5 MiB to 6 MiB */

Yeah, sounds good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

