Return-Path: <linux-arm-msm+bounces-112190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a+QwBOcfKGp2+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:15:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74561660E4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:15:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="CuuL3/D+";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YCwZzN16;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 269E1305AD39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1199B31F9BA;
	Tue,  9 Jun 2026 14:08:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26003164C5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:07:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014080; cv=none; b=XCZFzEMQfr3RyWmHYAtBFGhAqfbEICBn+wLvuC90kZSzaV82zG6tAZKZaR0985yw9bbIgGmVyNlWabLJ5UOp2QSH377NVttU5H2efDVjlPhnWpydzqnuPtBgmR1vpCRzjwv1Lqqq5GSmZwMgITAj/43VYAW7F6WbcwvAOxfRIpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014080; c=relaxed/simple;
	bh=FmDYsp2scSZ3q54ZHGgu4ZeWYbFYjiOygsbrYNCfSmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLEDH5HIJMK21VpMsNaF32OoR5bKd5y1pX9bSPAWeqhj0Zcw/mML1YeB6eGqG5nZlWTki2moM7zVGIeZDWVhd+Moor4Q1sLx6J+CfXedzuWN8bTnpDn/IXuDkjUW5fM6Spn/yezyIz90OnoGujVXQTxOU41kZZH+yevE2jZPbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CuuL3/D+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YCwZzN16; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZbh2183120
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 14:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=; b=CuuL3/D+mCccoNjH
	5T9SQwC6HOXMLJWquMrPX3L6NRdEnwcaOhhyiFaHda1R13zG5vomdkLEBdp+HIdg
	aVfbtWyaO+AcQ2xmTMTUXKyf/4rLihm02xWJ0RX2UTBDDw/Bk7tASAPVGu0+foFi
	e+QpE8kdDVngz2h7qOszfqSp+KL1yaV1B5IrDst9H4z9MgMr7FJzfpula1htzR3V
	cFFZ68dFWlNkSJ+LAf0o96Eg4vX1P3yZxg8EgAXP+sxm+xHpQQ/teVyZVxIknFf+
	/tvqvNqqqfU2go0Yh7hGPFTs5q/GandbCrbit6/9/A/s20y66DAXFsRKd0HUDAb/
	mqk0vw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr9q7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 14:07:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd1227161so193118137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781014077; x=1781618877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=;
        b=YCwZzN16qx0ZKJZWPmitnsiq5yQxm95bNwKTHiQyiFSx5T6sYb6BKriWu60f/lCQb5
         7t14XH7IFe91w++Vir16k2HsPCOBJIPl/7p6J4i484BQrntjM3HvGaShgauahsWYZnGN
         HbJkTXfH1rzarFgQHkKaeECqqvLWIKTL5SHUdDkrzpdhEoWWZ3WM5bROZRS82kdOO95M
         9uEluoCfByKK1IOIk4eZfCD6pFkvK06AnTqqaOi8Sp7n/g1S+/t5yi/yqOvw3HtKAZx/
         1EyxH4YOODplKL6aaYw815EkAEn4e7qgKzihMi/6Zxkhe26xHjzDjjXXPQhXu20yMuSI
         kq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014077; x=1781618877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFeXds4R5J9h3sAk6YnSG7bweitI9YW6z24vpi9kFXo=;
        b=PlE8KOYjcIvcrzLbR0qM4XiuWecKq9O0fnRbvRLFF2QYPgcM+ScnLxxSmmKCTJ+Zd8
         N/8Ty9qFvPPCSygw0jvnh1gaG/PNXpTaWDFjSNMgpkSk2Qh4qR0aaoFkZ1SmUqQ1PDU0
         F5Y4C6XX0/BssgVBzP59LVeTOlZ8+l0qcpfiw508NzKDeviccp2Pb9TA0oQV+8k70pj3
         9reFIlodS4gKiaTJKxkpADG4xEDfN7PPRX16SlFVlNKZeUkg90RD2+bXj5ACEYcUSpXW
         6tYsvQEWdEDOPL135UNvNnPnH9skYjYoGEEfz3+wgQvqZr2Kxg9cMEHjigj42TyZ+HtU
         nkUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8GeqhaCdtzdidRg//uvyatTdp+3ueXnCuVM0qsF8kU0DOPOhP5HxDCvefdsb/yuRILuEZS66Iw9vdVnZtU@vger.kernel.org
X-Gm-Message-State: AOJu0YzSzuiKmcadCvseHXkm1bXgMwy3XiUTqUW2ADBzhwLUjxuJh7SJ
	4Zjyi4TURHNHpesW0cApeiVDCOg32xIBOR8dC88D6iXukyqVh4PLQK0QIPz4LEe2gldR3VG56M+
	Uzz9leC/9VwEFCoTtEdV4BSGOrfP3DFiltFWMOEMSb+XzoT2ov0s9Czy7vcjLqk7+o+Dy
X-Gm-Gg: Acq92OEGBxzpAPVwUZqev90gVK0Cf5Hmsi+5PoxvZlWrAdcHWPoT45u6QamCxQHsmAg
	WAgX5V7dWyilxmj3vKAPjIR8iyVu+NPqSGnVr8j+4PM1cMluqwxeIPvdnyuQYcXq4sfFuth559b
	t7O6LlFsPsZbHF038ZKIdcVlpqcfT4pGLL0eXhTuq+KXmghpifn2/UgQWiwzJ8MMI3IgIBe+oNA
	c9tjS5Ee29uqv3eagQ3CijCrP6mSJLbjG7iXBorl6Q0uNavJ8mJ/XtwNuGNkS1cV7/LwDIkGrwl
	dit9c7CGTCSNv1cGRDpLqfgrnRLW23yL8klwf/OTR/b5f/5na5UNVRxsrR5OV8qi6vVMRiCjI95
	2OgQragoVLHbIPUCwdFXMP+DhDCsCN8aVZ0qPMtzivl0pmQZM3W/pCSmG
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459850137.1.1781014076928;
        Tue, 09 Jun 2026 07:07:56 -0700 (PDT)
X-Received: by 2002:a05:6102:548c:b0:633:3bf6:977c with SMTP id ada2fe7eead31-719160955fbmr459805137.1.1781014076231;
        Tue, 09 Jun 2026 07:07:56 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1061974666b.2.2026.06.09.07.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:07:55 -0700 (PDT)
Message-ID: <f32e83c6-ce78-4495-8fd7-a2c48e977fba@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 16:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Drop fake PCIe phy 3B
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com>
 <bgcrs7ijonskkobvidzoldixqy5ctmvp3hdzntsvfpj4wvjfgq@inlchk3nhogy>
 <b0ec6352-164c-4492-a0c1-b29a07e5e7e5@oss.qualcomm.com>
 <dttcqv63qc6igab7zxlg27ckt3irmjnzhjgcvq6oz7ays4q2ld@be5kp4i433f4>
 <5c1f7955-883f-4fa8-a0e5-513a987bd3a9@oss.qualcomm.com>
 <0710caaf-ec73-4c4c-b6cb-7fe716724f4b@oss.qualcomm.com>
 <13349811-31e3-4658-911f-6f93d74efaaa@kernel.org>
 <658358a6-45bb-424e-8d8c-5b0b09cf479d@oss.qualcomm.com>
 <569f9eed-09b4-462f-b90b-9d8cb7867148@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <569f9eed-09b4-462f-b90b-9d8cb7867148@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xNBgOAIFLwtciVI0kvMKQfX-7VZ9mm50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNCBTYWx0ZWRfX16SgqQ3arCeE
 bWHtdN1WrYgUIOK1u/zOXLYqU5vwOTWwFoZs6ueN9ZdsbAZ4ufxma5oF6m2AVAS1mwusVd20C9/
 0cN86Rp/5Exh39lwItbOhsgN8t32lIBU0ZFUtL9USutIRri6tH0JQD48x5BME/23waIH0sLMqBd
 fO6FO8V9jHPv8L3vFZp94l7NiMU4pyp/kVcnvUfwMcJyt2xHMaH6z1KioCFq77HahoFzCNJ+MB4
 MT8sj7OvtLlm2o+4U/032MfIvllbArNg7pzSkH10DBA97lfl7PixFEyHKDaXPocXGkrAFyBUjMh
 83g+3zemYNkPk/fmX3yt1ZWS7+WmSEyepN3jMZmr1BwqGSKhr1iWnyzpxtLBtWTY50xqayaQggv
 NKgRkvCESbsuhUmdfyB0vm+X2IfsP2yh2CLCZ/7qqaFsQhoHksXq8X+sNVy+3zcmVZTezSA1Ucs
 8Sepea2aXsdFGyBlbaQ==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a281e3e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=XrpWG4DannpcGcY-z3sA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: xNBgOAIFLwtciVI0kvMKQfX-7VZ9mm50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74561660E4F

On 6/9/26 3:41 PM, Krzysztof Kozlowski wrote:
> On 09/06/2026 15:33, Konrad Dybcio wrote:
>> On 6/9/26 12:28 PM, Krzysztof Kozlowski wrote:
>>> On 24/04/2026 13:09, Konrad Dybcio wrote:
>>>> On 4/23/26 9:16 AM, Krzysztof Kozlowski wrote:
>>>>> On 22/04/2026 22:08, Dmitry Baryshkov wrote:
>>>>>> On Tue, Apr 21, 2026 at 08:41:14AM +0200, Krzysztof Kozlowski wrote:
>>>>>>> On 20/04/2026 20:02, Dmitry Baryshkov wrote:
>>>>>>>> On Mon, Apr 20, 2026 at 03:36:17PM +0200, Krzysztof Kozlowski wrote:
>>>>>>>>> According to user manual / programming guide there is no separate PCIe
>>>>>>>>> phy 3A and 3B, but one 8-lane QMP PCIe Gen5 PHY which consists of two
>>>>>>>>> 4-lane blocks.  This is also visible in memory map, where the 0xf00000
>>>>>>>>> is marked as the main block with additional sub blocks for each 4-lane
>>>>>>>>> phys.
>>>>>>>>>
>>>>>>>>> Describing the sub phys without the rest is not correct from hardware
>>>>>>>>> description, even if it works.
>>>>>>>>
>>>>>>>> Is this the case for the other bifurcated PHYs?
>>>>>>>>
>>>>>>>
>>>>>>> There's more? Oh damn...
>>>>>>
>>>>>> In the previous generations. I think Hamoa had one.
>>>>
>>>> Any PHY with a name ending in -A or -B. That means:
>>>>
>>>> $ rg 'PCIE_.[AB]_' drivers/clk/qcom/ -l
>>>> drivers/clk/qcom/gcc-x1e80100.c
>>>> drivers/clk/qcom/gcc-glymur.c
>>>> drivers/clk/qcom/gcc-sc8280xp.c
>>>>
>>>>
>>>> And, quite predictably, some PHYs may not only bifurcate, but also
>>>> tri- or quadfurcate (on Nord).
>>>>
>>>>> Ah, I did not check the others and there is little we can do there -
>>>>> it's released DTS. This cannot be easily changed while keeping DTS
>>>>> compatible with users, because probably two PHY nodes will be replaced
>>>>> by one with different compatible.
>>>>
>>>> I think no one utilized the non-reference configuration of those PHYs
>>>> in practice. Should a device like that come around though, we'll think
>>>> about what to do then..
>>>>
>>>
>>> What is the resolution of this discussion? I have impression that no one
>>> objected to my patch, so maybe I should resend it?
>>
>> Qiang is working on a proper solution to this. PCIe3B is nominally used
>> for a secondary NVMe, so on the occasion that someone has one inserted,
>> this isn't really a huge loss (the Yoga laptop and the CRD both have
>> a primary NVMe on PCIe5 IIRC)
> 
> This still should be removed now from the DTS, before you get more users
> of it and any change will have impact...

That's what I meant, in a convoluted way, yeah

Konrad

