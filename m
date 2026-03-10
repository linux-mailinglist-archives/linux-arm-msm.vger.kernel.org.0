Return-Path: <linux-arm-msm+bounces-96571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KszKCHpr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:49:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B17248CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 116D830396B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89EB43D51D;
	Tue, 10 Mar 2026 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPnrelKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDurb6ah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA95369223
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135951; cv=none; b=Ig9xvZHzG36r7TJxbWimOSjecvqESczUXVu2awMp8MdgCcQJhmtkEOUDNdizX8bi/cWILvcEQt/HLu/GrWLV9V6CsAcyFl+I3ba73QPhVU4fp2xOJ4+DODrv8/tmW1uuHGGLGYGZneH4dPu1CdRc2dCaVPNcyr1rJfMJI287cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135951; c=relaxed/simple;
	bh=CDOso0q5SCjIEv4wQvivb1gotiV0w12En+/3NiA2naM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hA69+7iebQPI5fMJqOeagYAV+TFBZl0yBE8w9O810ZA0iDbnA/LYuVEf4vqf3hOjCFzNLm3quxqLiSR6IN6sq/8sq25g1LR/E5AEXd322O0iL5U07sCF45yt1Ri8nfOBxsAJWPGruM2cfZVvtP5F4BQDWe2SZyWO4cx1LzU/ddg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPnrelKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDurb6ah; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h2gM2754011
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=; b=bPnrelKDJ/0dUPTv
	a120O8114pFXwIz/RTe0wYtI2rOLPVKIvmbh9W0cEDPUUdfHI6zRU16Wc29dpiVZ
	t6HSvRQqw01PgjXVR8iR7MoHGaHVD4oJ1lehbcSng080VkfgEw1Oa3WH6DcJd67f
	uUmsHIKWWPaD6tUbHsztKdJNDLjNblDwK76uqLdOQVp1Mg2OG+8BuJ8hetzZw/55
	R/yIOk4aPq5wbWUoQvu5q7ixaI3JMqJJ3Ov/V6Yh6LprqL9sC2fAxv/6e0BGpk+v
	sTKdk+s/pnmt5m0WidfRNnnPHuLEKI9epyr+0+POz+a6tvucFtNCQTaXxFM7xQTE
	1khO0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mr7sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 09:45:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so171071985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773135948; x=1773740748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=;
        b=cDurb6ah9v8QL8xU8e2Z8MLEYGbkaKa4qanOZFWGQV27pUnMAaY90Gfyw5kADf8aA+
         ics+1Dfgk0fexfot5gYvn6DKp66ANjAfZRfrovRGPLTgfCbvhyE8M9RHUyNjYW/lRy/4
         8dRy5GGgLvBq+KFLYRcyCT3zlDLijuZV2wbLxZVWR6FXTNgAexjqNGza5kIFy2ZAmGjd
         lWpFVZwrsk4HW9LWTE12Gh6L0N5p7BNIrEtMsw/zdmEve+/jSxiErJPeZmac1dNcM6J+
         /Du2+Kx+tmsaW+6sEZhSO8I8PBQcSKE8zCzojfYmustNrCBQN8oGL4ZA2BkmkcmSIas9
         9iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773135948; x=1773740748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQ8tLu1owIY8abuLsve4+gYZO3I2dEb/qJKESh2CSbk=;
        b=XDQDUEVUTzeHoALC8FuThUn2d8GVqDtqbjUYqFVOm0EDF3h+1n+yBB9ADsqcyP6YU6
         3KoT6uzURg0bbx1Lsf5O+re1QX0Ft/MzH2IcZAIdv/A4+NNNPBsAsunoAb2rABrUArjL
         F68YA4Smf/+TU1t/mfrXnvSiXxkKugteBgS8KxoyrY5Wj14gUURYCoBxqYTvQPl/8VMl
         o61v4YcmCqDHadZdNEoNBsFJx1LRpLUPUZsmWiQmV7BHtlJnkJHOb9fBNiDWVHE0ltDj
         5vBQ0LDUvAKL8Bpa4kf/6vmtjFTGj2TlTg9TcdutsJ3lPL+JgCpe35+rqT0QpDtOU2R1
         AD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvxBrLMhgGqd1IbpR6qvSFauACJJoYM3PmDTH1JPXNr6EcIUUTS4lCM4Z5tpnUEpg/T6z0+OkU9+qqpP6O@vger.kernel.org
X-Gm-Message-State: AOJu0YzejOGTvGMUGdmwbEFK6HLTbWzsg3c5EdkOsPPGsecTE8XsAUtK
	6/ACLl0Bbp8DKqPHeQMsRrOD3mXhphs5oV6pVsKLJx9vaKO877Vs5tmKE/4tfTkCE7DykKbfOVv
	fo6pn2WE9L+l4KtTb7TOj/Xj1/kdE1aYmS4tXHyBKMOtjwQ/9AWbYYff8wCVGJgjNC94y
X-Gm-Gg: ATEYQzxZm0Wdf1g6P7F6Rnh0/Z9JpmskkB5RfmnAOiGb02Hjsnj1/hO8CjwNDOOHdrg
	MfOwvxCczrcpdQphBSgsTA52xjs4M2WDzjV3XwGy8w6v67lqHOwwRJ/bWKm3CWQzctuZ9YjTzpl
	4n51uYnoFvEvVjxTq93XkfJD7BxQBJUkc+bRJ0HYo5lj2JHQcA20A08/dkCtNQN288egAl0oqw0
	93bxQNJdvKUEu4Na+3Ga7J4+bG1zzMym2mMcqGNkK88IgEd1o+zuJP2L0BHwdBWyOnhkp4Cn+5A
	JtumVqBZg4lGM4DqcDKJFZ4a1jti+9ApK7haKvcGIAWovhOk67/VLuh+VvnMYz6D633uDY7kaY9
	iCRGGX2UgWJlgLtwm5PeQzQJwqu7kAFkzWrrmLHk/VLfHbxQt5P1rRuMssRgiP9I8fYzYo31lPg
	MlFtg=
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr216829785a.9.1773135948566;
        Tue, 10 Mar 2026 02:45:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a28:b0:8cd:9446:cec4 with SMTP id af79cd13be357-8cd9446dc04mr216828485a.9.1773135948150;
        Tue, 10 Mar 2026 02:45:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a2b801a3sm4154561a12.0.2026.03.10.02.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:45:46 -0700 (PDT)
Message-ID: <8c97d121-82cb-4547-b2d0-14c123c50df5@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:45:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
        hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
 <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jcjspcef7v75btwnhjzgsqndw23j3k7jyhnacxzwridjdkyize@slpzcxwyntzd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afe84d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JKISxpa1xdn5d-WQYaAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6EkUB23RvyNS_GmU39cRNgN8nxe9XgSo
X-Proofpoint-GUID: 6EkUB23RvyNS_GmU39cRNgN8nxe9XgSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4MyBTYWx0ZWRfX7CdvX9rC14r/
 nUziDJvA7tPBmApfhgJ64TlL0skbdaUt3fXrHvAdSew357kG9nIENzl18Og6TAgsupNVA1pfe7R
 4bk+KtdxJC8zEcd+kaXbMYW50qypsWOjakJ8RLRS8w8CH/XOAJ8LgdZCEeI2+gJkVem3g9gF7P0
 h+tOrJjjR3x9jL3UJFeQIl5SKzzR7YUYQcnsRt0wwAfNiM4fKaZ38BBPh/pGYWQhDr77dKw9EOh
 mGK4FXA/Uw1BIGxauUyouK9tm86jCVes1HN3nUaQhmpeU1Zb2O+FbwtJrwiFTu64CXBexoeKusj
 /3Bm7Q+aXYU5ojU/a27B/v1Uv6VXcqSCuQoypbfbFjcrqIragrwNnbTuDZ2fXWSui0PHdtYMwBP
 vzegrSup2Sd5/m1cPtfreiSHqZz2DI/IU9JK3PQxrlP3aGd7QK+9/TtSZ9RprikZx8ENbY3xcQn
 lRtsaZoapxIDYLNQdNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100083
X-Rspamd-Queue-Id: 63B17248CDE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96571-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,4f:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 10:13 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 09, 2026 at 04:21:50PM +0530, Sibi Sankar wrote:
>>
>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>> entry/exit notifications to the EC.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>    1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>    		#phy-cells = <0>;
>>>>>>    	};
>>>>>> +
>>>>>> +	embedded-controller@76 {
>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>> it. All of other Hamoa boards apparently do not have it.
>>>>
>>>> Hey Krzysztof,
>>>> Thanks for taking time to review the series :)
>>>>
>>>> What other Hamoa boards are you referring to? The series
>>>> mentions that the driver and bindings is meant for Qualcomm
>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>> boards like you are assuming.
>>> hamoa-ec compatible implies that and that's something I raised in v2
>>> already. You need a specific compatible.
>>
>>
>> Hamoa/Glymur reference devices can have different EC MCUs
>> depending on the SKU. This introduces the need to deal with
>> possibility of quirks and bugs introduced by these differences.
>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>> reference devices run on NPCX498/488. This pretty much was
>> the rationale to make the MCU part of the compatible. Anyway
>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
>> and add specific compatibles when we upstream those boards?
> 
> Why do you need a generic compat at all? Glancing at the database, at
> least the following laptops seem to have similar protocol (I might be
> wrong, this is based on a very quick glance):
> 
> acer-sfa14-11
> asus-vivobook-s-15
> asus-vivobook-s15-q5507
> asus-vivobook-s15-s5507
> honor-magicbook-art-14
> honor-mro-521
> hp-elitebook-6-g1q
> hp-omnibook-5-14-he0xxx
> lenovo-ideacentre-01q8x10
> lenovo-ideapad-slim3x-15q8x10-WCN7850
> lenovo-thinkpad-t14s-120hz-64gb
> lenovo-thinkpad-t14s
> lenovo-yoga-slim-7x
> medion-14-s1-elite-sprchrgd
> medion-14-s1-sprchrgd
> qualcomm-snapdragon-dev-kit
> tuxedo-elite-14-gen1
> 
> I assume that some of them might be false positives and others will use
> vendor (or device) extensions to your protocol.
> 
> I'd suggest implicitly using "qcom,hamoa-crd-ec" / "qcom,glymyr-crd-ec",
> because then we can use something like "asus,vivobook-s15-ec" to
> identify the EC on VivoBook S15.

+1

Konrad

