Return-Path: <linux-arm-msm+bounces-102156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HF9G3bx1GkjywcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:58:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C626B3AE082
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61ABF306A1E3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683623B19C4;
	Tue,  7 Apr 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNtIkqnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExXFDvkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083133101D8
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562954; cv=none; b=Lxq60SFf9i7CMfccslo9VDXOF9Mizzer1mkKiPf0GD9GqxpsjLU5kE+qXm9VDtkiNjy6ep9lKjkxORmf8/cOydHvvNKEsCN0W3ZNXISH4zMNtZKvMjx9lBWy9PZTW2NDtjiam2Ep0+mJL3QXJACFGgpY/AeVQ4Xoe6fZkjoDJlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562954; c=relaxed/simple;
	bh=FOpSnu178zIxAiHDc0irzy/CfVx7Q/ZjSlET4ZfSK1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=skxExL3F0koJv/OqlZLGTO9atoKBZ9ipDzPPz9y5kRHoHpM14NuRPgjM9VTpsq19n3gMKG7mN58hPC38CMUQ8j0bBIC5OHd+qN4cBRacp1KJ1rYXRkOPQj5MQuXq/4n90pz7Iv9u8k4E0+iuAUXpXqfqosIC6am1mFdqmZgPxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNtIkqnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExXFDvkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376DaCI3815649
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qG8+mDHWV547mjLnhWzemhJkdZY9nVnc5fhkU34nyfk=; b=nNtIkqnO885JYuwc
	CrN+53ry0PlOLotYozEGW8VGw85288DqK9PCrotsNbEe2eEowaaeM734a+Uyhiwb
	iFZedjH1KN2xawjAQ2GgiyJp8epnQNbAqCX83ooVSZ6HL50bnIv5MAq7wxKfIdbx
	oK3aH8qTMlVQj5FFHHlxBxrxAW0myTNo+ppE1MO1Jc9CRiHruw2WmaVvcMOgvo1/
	HKvnZtFpzTzMuY4yyVf4Ix74M0kb0gw6kzuSHhjho52tSSTUAF5DDjXU22PkHWgl
	LzBTKf0IgXDZBjx8LYXV8OpHAPQzfIgOtruVh5nqXsAj7Fbq7V83/1vC2/s4vPIn
	YHU2LQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tkgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:55:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso19108101cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775562951; x=1776167751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qG8+mDHWV547mjLnhWzemhJkdZY9nVnc5fhkU34nyfk=;
        b=ExXFDvkZWqRt5uOkAd4rcw/ozxUzxPZMKj6syrTnzpeFnD3p666T6Cu5tdyBdC96Dk
         SD37QAbwSrRml0EqnUHRkI1bRWsZE/rBldrGNBKq5Amo9j1AlRM877TeSefC0WcZhz8N
         U0l9/QjjGoi0nY6mW9c8T/GAz+8gutEBWJa5ylzNi+Vv3mMtIOw8t+I9i8o4m6ToU5aC
         qhSGmuU6xK8eTHBXEaoShUcFcKUaIT6T+6UzpWWXOxxsA0lIEf27ac8tj2/aez3kHkJF
         5WRjzE1A8dHmoAmuM3eZ7tGLqtO0klMcHNFJQLWgIvxToCtdYlYg13HW8DzwpSZr0eQv
         uO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775562951; x=1776167751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qG8+mDHWV547mjLnhWzemhJkdZY9nVnc5fhkU34nyfk=;
        b=En2/ATgjUShcGNlAhME1xYgIL79f2TjawHMH2gU2V7SNNarJGYZlCpzompikeEGnsb
         mGfV/iAjmktKKiGEQLniWANCWDy/SpmhAOy8dQxD1XQN8L80nQlHQDaomlc0U5Jp7N/S
         HCF9pfKkgod1GprSkffBG2FoNiABytmsBNqdLfqU8tOom87vuM8POAD/Xvu4lcvjdpAc
         17orkf6RKSUe7y/RTBbGzYiTJJJke8GgahUbhCBSwvBKWdy4o+CMuMxAFMpIxy9ui4MS
         O39kB7WSHeThU2uiHf8IoZa/UVjJazjocR3CQi9deegrsQpUtu8bnzRLtZWmJ2fbv9VA
         dBzg==
X-Forwarded-Encrypted: i=1; AJvYcCWVQdNfuzMgeayZ55U9pHtN1l0h0t4oejfBzTqDfi62Tf9hzLdcqMR4uNa9q2d4hzvjfBFDJQZwyfZGxVmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7LutBEleK0XsCC7M3D06nR8hD2YXhUT9dw1h8YEiBWu3d3Rrf
	XCcX5Knc7cLedgxcNJX6O0ZLZBMeGtcSJerKBmMvZD7com1Z83DI0kPZ7vtbeGUaHToPJ7BqT/Z
	jgmOxMpXME7p5Fjd6uoKywqVJ7J8ZgP7sc/LlLpZgspaELQHQ4BB2L7VvR9803Idr0bcK
X-Gm-Gg: AeBDietaCAT0Dm0UtUHIYJHQ6XLwF6NrKar4h3flCaP2fyX/b98/+lCtUgwDiKvYBQy
	IM0CPSyZ12Uwofd+9PquTtEKfh2qZASo+Yfu6vZxF0FzmyBGSS217duxtkpXihktM9Zb0sxQGMD
	6oblghns9Fzubmp7fnepylMSqTG32obcUfOc8jJcGef3+t14ekq8Vc69GKUzl2gkoWg/xpAWCfV
	pcazRenM+xNdAOYlCa2Bwzr7AV+JopGDY6wNEDRlh3473ekpO5qHM9fi26KW0GKK3cT+frfWdU5
	poq7uGlEAUFDTZubbNqb4E/oeQ/dPS01xNhW/eYu3LRxpdr2F7J+9nzT6Od4T4IfcanEymIAx7l
	DC/DHa0lSd98M79MBeM1cvTuaXh3B9mLq824r9Kq3eHbGW/xZaoyD4QQ7YaDyynTKHoeBB3PRv2
	cQNaE=
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1523187485a.2.1775562951315;
        Tue, 07 Apr 2026 04:55:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:8d2:394a:d3f3 with SMTP id af79cd13be357-8d4184d407fmr1523184085a.2.1775562950733;
        Tue, 07 Apr 2026 04:55:50 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e034c8065sm4406902a12.28.2026.04.07.04.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:55:49 -0700 (PDT)
Message-ID: <3c59c265-e26f-4db4-b151-7a9c725f71ff@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:55:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add Samsung Galaxy Book4 Edge
 DTS/DTSI
To: Maxim Storetvedt <mstoretv@cern.ch>, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: marcus@nazgul.ch, marijn.suijten@somainline.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, abel.vesa@linaro.org,
        abel.vesa@oss.qualcomm.com, johan@kernel.org, konradybcio@kernel.org,
        kirill@korins.ky
References: <p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms>
 <20260322160317.424797-1-mstoretv@cern.ch>
 <20260322160317.424797-4-mstoretv@cern.ch>
 <881975ea-cc16-4b26-9672-731c146a1ba8@oss.qualcomm.com>
 <40e31e2f-84ff-425c-a7e9-f2df4210ddbc@cern.ch>
 <892fe03c-f3d5-4b6c-b821-95dad55fdade@oss.qualcomm.com>
 <f6323f22-27c8-4ae5-83d3-59831b62b5da@cern.ch>
 <12ee3569-16a6-4787-a874-bc802a50175f@oss.qualcomm.com>
 <e6134dd0-6672-44ce-8ced-41fc3e21e474@cern.ch>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e6134dd0-6672-44ce-8ced-41fc3e21e474@cern.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4f0c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=PNdW6hRCZpnURY4oElQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6zw1WfhqXWMSp3Ns3vtBWYlapCxIG3IG
X-Proofpoint-ORIG-GUID: 6zw1WfhqXWMSp3Ns3vtBWYlapCxIG3IG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDExMiBTYWx0ZWRfX5rmxoL2Md2W1
 gtLzJoVnayBPFKDv8gu8PRGQEec6QoOAtRx2ymVL4VqOOJBqlerkjWj8+tn2Tf5xnJFpE9qB0PQ
 3ozTH1g3slrV0xeHdiqlPy3zZqj0iHv2x+uqIGZFL52h3n0VTTq54SdhzdM6/KuueZhHl4DgsIE
 vw2KQEXRvEpSJTxCmqmOfYdp3rH0rT9gA0Aw0xBTFTmzkJgc8pJIrjQg7e1VgeozQFesmT7io9X
 jMns+xqWtwBMSjDj8krNtvwGcPFdXxoiw5Z9WjV75EXnZ6i7UCt6WlFZFJ3dh+QqyaDPrfMsj1R
 ezVjaG0Gum+gEzCh6ylNJyNqGCQBOwXGjQHyfEACnSfonAaQNHnMLDkOaeraAAsG7BHT97aTKoc
 fsGOs8Pa7rkTUZ2ZZAKPJ0QOG6RAzyhiwwEGt1+ccCifSMvsizORzbV5TqtWrP1ujNRvrd837lg
 qdi7jCiqco95z4xSOtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102156-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C626B3AE082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/31/26 6:34 PM, Maxim Storetvedt wrote:
> 
> 
> On 3/30/26 12:41, Konrad Dybcio wrote:
>> On 3/26/26 7:30 PM, Maxim Storetvedt wrote:
>>>
>>>
>>> On 3/26/26 12:33, Konrad Dybcio wrote:
>>>> On 3/25/26 7:30 PM, Maxim Storetvedt wrote:
>>>>>
>>>>>
>>>>> On 3/23/26 13:17, Konrad Dybcio wrote:
>>>>>> On 3/22/26 5:03 PM, Maxim Storetvedt wrote:
>>>>>>> Adds devicetrees for the 14-inch and 16-inch SKUs of the Samsung Galaxy Book4 Edge.
>>>>>>>
>>>>>>> These use a common dtsi derived from nodes that were able to work on Linux
>>>>>>> from the initial Galaxy Book4 Edge DTS by Marcus:
>>>>>>>
>>>>>>> Link: https://lore.kernel.org/all/p3mhtj2rp6y2ezuwpd2gu7dwx5cbckfu4s4pazcudi4j2wogtr@4yecb2bkeyms/
>>>>>>>
>>>>>>> combined with the ongoing patch for the Honor Magicbook Art 14, and its downstream by
>>>>>>> Valentin Manea, which shares device similarities:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +&i2c8 {
>>>>>>> +	clock-frequency = <400000>;
>>>>>>> +
>>>>>>> +	status = "okay";
>>>>>>> +
>>>>>>> +	touchscreen@5d {
>>>>>>> +		compatible = "hid-over-i2c";
>>>>>>> +		reg = <0x5d>;
>>>>>>> +
>>>>>>> +		hid-descr-addr = <0x1>;
>>>>>>> +		interrupts-extended = <&tlmm 34 IRQ_TYPE_LEVEL_LOW>;
>>>>>>> +
>>>>>>> +		vdd-supply = <&vreg_misc_3p3>;
>>>>>>> +		/* Lower power supply is not enoug to work. */
>>>>>>> +		// vddl-supply = <&vreg_l15b_1p8>;
>>>>>>
>>>>>> How should we interpret that?
>>>>>>
>>>>>
>>>>> This was in the original patch, but using that same regulator appears to
>>>>> be enough to also get touchscreen working on the 16" book4e. That said,
>>>>> it still does not work on the 14". Something to revisit later...
>>>>>
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> +&panel {
>>>>>>> +	compatible = "samsung,atna40cu07", "samsung,atna33xc20";
>>>>>>
>>>>>> I think it'd make sense to move the compatible from 'common' to the
>>>>>> 16in DTS then too
>>>>>>
>>>>>>> +	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
>>>>>>
>>>>>> this matches the common definition
>>>>>>
>>>>>>> +	power-supply = <&vreg_edp_3p3>;
>>>>>>
>>>>>> ditto
>>>>>>
>>>>>>> +	no-hpd;
>>>>>>
>>>>>> really??
>>>>>>
>>>>> One less thing to debug while previously attempting to work around the
>>>>> "illegal link rate" error, which turned out to be related to eDP 1.4
>>>>> (similar to the sp11). I've kept it as-is in case other SKUs attempt
>>>>> booting from this dts, such as the x1e80100 16" (as it might be getting
>>>>> a black screen using the current x1e84100 16" dts, though this is not
>>>>> fully tested).
>>>>
>>>> So do the 80100 and 84100-equipped SKUs of the laptop come with different
>>>> displays?
>>>>
>>>> Konrad
>>>
>>> So far assumed both 16" variants to be fairly similar, though one
>>> valiant 16" 80100 user over in the debug thread did try to boot via the
>>> 84100 dts, with no success. Instead having the screen go dark after the
>>> first post-tux kernel prints.
>>
>> Does switching to the generic edp-panel compatible (which will parse the
>> EDID and try not to be overly smart about it) help here?
>>
>>> This was strapped together via WSL though, so could be there was
>>> something else at fault, but strange it didn't at least fall back to a
>>> visible initramfs shell.
>>
>> You mean the kernel had been compiled via WSL? That shouldn't be a problem..
>>
>> Konrad
> 
> Kernel was one shared by me in advance (same I've been using as a
> daily), so it should be OK, but there was an uphill battle in creating
> the modified system image afaik (that would boot).
> 
> Can only speculate until there is another go at this, but could likewise
> be something completely unrelated that's simple to fix, e.g. older mesa
> in image, but final attempt at boot used a dts with gpu node enabled.

FWIW the GPU and display engine are completely disjoint, so mesa itself
shouldn't be an issue (unless something was caught in a restart loop due
to poor error handling.. I've seen that N years ago but have no clue
that would still be a problem nowadays)

Konrad

