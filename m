Return-Path: <linux-arm-msm+bounces-115700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P//SINILRWoo5woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:45:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502E6ED82C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 14:45:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EybAWa1H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kNx6v9T5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115700-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115700-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB4ED332305C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD43548164A;
	Wed,  1 Jul 2026 12:26:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EFA48164C
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 12:26:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782908778; cv=none; b=rpZ/+qmAYPa5xKB0Lu5ZlcjbLP0FePnSq2yaMEgLnFdXyQFPGzjVRoKIA/pEZM1EAfPVS2IeXNlcMn5Co+SwxW3vSrMpNM/qocEqMTYQYWusYLtkthJ3Qu/BlVrP0QbXXL3ftaxLrvXlk9yD+qRuLnFYQERjdDdFRv1jj5VyPmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782908778; c=relaxed/simple;
	bh=g++P9wP4ThEeg1nB+znYtKhHWwVaNlLTV3Vj96WrnXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAZPB2MwnUMPiQrDTfpS10GCZ6gpsL8Dxnk/CrSpDEUlmO3fySw0Fl/cTTTSmqjdlORaMKadGZ4pwq4nr0hJW4o/o8eVEE+P8O7QV7ws94KcXbWG9HOH7ZQHqylBYDhIptNuRZhdbKEAsuDuMXbsKtx3k5VCdeh/LyNTI2lhn38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EybAWa1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNx6v9T5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8hvM683205
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 12:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=; b=EybAWa1HHO7Qk+HW
	Tg7MSdu/tn2vaDJZNNjGGrc7LcgK6ZSxkOPFxgzNv/Nx1le3tsGZn1Lye71yZWXu
	cdoZf9rFOJ3Pm3d0lNuKE1d+pxXGs+6/L5zJr+P9m0lWbATADjRaRS23mN0/OafY
	gRJrA0rTAVML3xu1Ww02MASUhS/Yxehwp2h3oTMmVwOzVZjxkrLDmE4EwzIGzV/+
	wwXJ4ukkhiQXlDL1TT7U2pitwTgBSmMHySJmq9dttEroQ0/Jqj/AOpalvgtJzxKJ
	g0/y54Xg5NPkGxqmMA1ScbR1QG79hNwuARxW3YHQiqxYFXu3jC77Kn062PxZn1gA
	oR9Zxw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqm6t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 12:26:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso1345861cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 05:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782908776; x=1783513576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=;
        b=kNx6v9T5yOkioQlN72SRRfjhLmjcduimlH5tnYUAfFdQ9uIELS5AQL45f6zn3mEe/s
         uoeUhELYNGEoAo1fT8BitTXG/a9VF9NqoYDzvIi+zWHTun7GLxcXrIc9Edl3ctYhg7OK
         jwD0AA2IdI5kZk6ELf8FHVMc6qv2BoDbf52rtzq/JgCsa9WS5o+ugvPVX5c2hPzj2jm6
         rB9p38B+FmKsrISoRBMGPfFfmjB3aieP8Y7hDSMFI9lZLjY3++1hw0+K6OInCHJkqpBG
         GbLXNnkXK+FRLPfjZ/KjWHVx1+hJSIA+x0I0jMx7OUYgVoNm9AVVKGEnp4RDDY0S+cvK
         Vgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782908776; x=1783513576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLyvR5zrom5hP51Zq11DZwCL/QGJ5wMO0HKgH08RYcY=;
        b=BdA7xKBGZqBWpAOlkoEwyEa4aC8GjFMUsRndKSbcleqxh7V3lYSmxCme3h9fWcHvSw
         j8ZedLyBu6rPHNHZ2mdHBPhIfrqh4ijaTLNlBgfDBAXi+/5/eJ8WAzed1QnRqidDBoiw
         A2RxcLPFDIRUxCKi5BMx/q+7pLusf8qHx2DjO3Pq5jOYVjy5GswvvQ8LVtfuImsHsYXx
         Bqboz6KuxdbFChRFbLbKamevAzUlEmSetpev9TCzJ/NKXkLm3AFEIrlHfuNQflXCB3Ir
         VEb5FR8jSLryVIdBhyEyj5UHWQPeiKs4hqD0GA6GrOZOSG/3qWmWKDumo1bOpwqimiyY
         4y1A==
X-Forwarded-Encrypted: i=1; AFNElJ+9NCei6hCfOmyTNsChBjlkmFCLrT+61Xa4mDIjrevCMglfd7iw6bZGzbF5fGIFRB2qmUD1zqErAbOTJWkh@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9lG8D85CaWONuixzeCF9bYvfjiNTyUVaeyYzGJ0o4WLAfKnx
	q67tFmTqD7wxwKPJwbH24Xa5ruz68qWJcHb0r0wo486hzAmfN5Grog9axiMXCcQqrqbm6i9oCge
	N1ikiD1ZyOuMvD5UhOdEi5F5rqkz53MsgRmb0uN00DXAFfxEutTyVZEBbESX/4OnjscdM
X-Gm-Gg: AfdE7cm8m0kEskyx8Bb2r6IrKkEZl5pZZveTiQw/ncakuZfWLAXs7TFaldGOlsPc3WO
	iwlK4xbkhuKpLThAeDgDrgqeZqbLgxMHI1pZK4idW1OztCg68ZXBLtU8Xh/swqdAs3cV4BDrpUN
	kpDmvsDDyejpOSUdkHNaQWWIJYBQKF8oGtE7QlaeeD8s48898xJQY/4k6fMykIABQwTnPn9qYho
	IM2IiQpPyvIACbnviEM8rWjmkvx8pxdHaprzcuSwadpXV8GOxrWPWbSwUOeSGRU7FNQHAAvx7g/
	CIDrs5PeUTcWLmR0RGHp4t5hwMso96FicL9pJKM7wItQWRKYB02a4bxqc3JIkGNQXX66ZhDf4E8
	t52q53HA3sxNuLWvvq+GLO9T8Ef4zGq/7cdU=
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr12609671cf.0.1782908775824;
        Wed, 01 Jul 2026 05:26:15 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr12609301cf.0.1782908775301;
        Wed, 01 Jul 2026 05:26:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1289178a18sm266058866b.57.2026.07.01.05.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 05:26:14 -0700 (PDT)
Message-ID: <174009b9-8be6-48e0-847f-a85c224fb817@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 14:26:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
 <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: THiKhtgP9d1zcimmLJ67FX8dnP7Wro1I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzMSBTYWx0ZWRfX6ccs3EyA2Gyq
 4GX41e2xfYHmGcqbtcuoW/Tx2BOhQpAv7JNI50ZeWWMASPvpLh9Ys3EbpHE9Gj4AtiSquvG9YnM
 zkM78sI7hDnWNkrnQiCE6GjF/Akt+dRVy0Jd+vCc35le5JxAwDSieYtMB5IzTQU7Po+77Up1/Sq
 iz/pdjsZD0qK6kADN84XTvRIxwFlt76XevDYHDTLgOgJQgQ//0xPAx17ND7eISQmCLEn0VqnSl+
 zrZcVofNP1I3hQDPzvyLRH4nGQq2O3MCjm+aVUsvjpML5OOFqB7GNIThfNHrPnyFK6tIrx1MDTd
 tlzVJF1oAJp8HsDDWX+bOI/S2ox5nbi/dlkREo6QWp+IEpw7nmK9P4OE8tL0UukG8dSAPNFyl3V
 riNSXUQPQR+ukHCWQPUORZZkWcMT7V0G/cM6RUQ/PxGMzqjln04JGOg+SqIzyH4D986DzmnBVOa
 Xybkkrwq2Sp4uyjoHXQ==
X-Proofpoint-GUID: THiKhtgP9d1zcimmLJ67FX8dnP7Wro1I
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a450768 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NxiBK8CvgdjxvVHj4DcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzMSBTYWx0ZWRfX3RCv9P6fx1yW
 OFzJmUwQOhX+EwPtIHJ5Fft/6Y4jtFJ0qfK7PcQMAXbnydIv+VFnsv505d3eoaAXruEtTU0MCYL
 /uk/sR5msO8pS8tXh+0NowUIqKenl6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:miaoqing.pan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0502E6ED82C

On 6/30/26 8:30 AM, Mukesh Ojha wrote:
> On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
>> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
>>> On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
>>>> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
>>>>>
>>>>>
>>>>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
>>>>>> All the existing variants Kodiak boards are using Gunyah hypervisor
>>>>>> which means that, so far, Linux-based OS could only boot in EL1 on those
>>>>>> devices.  However, it is possible for us to boot Linux at EL2 on these
>>>>>> devices [1].
>>>>
>>>> [...]
>>>>
>>>>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
>>>>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
>>>>
>>>> Is there a good reason non-chrome devices never defined that region in
>>>> the first place?
>>>
>>> This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
>>> control, maps it for WPSS during boot up while Linux at EL2 needs
>>> to map it for WPSS in Gunyah's absence.
>>
>> Right, I'm asking about it usefulness on devices *with* Gunyah
> 
> Ideally, it does not need to be mentioned in the OS device tree when
> Gunyah is present as there is no user in OS..

But it's also reserved (in the UEFI map), right?

Konrad

