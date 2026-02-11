Return-Path: <linux-arm-msm+bounces-92610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1QBjCgOqjGlasAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 17:10:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D524125FEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 17:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E116B301E975
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 16:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521E133A9CA;
	Wed, 11 Feb 2026 16:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LR+WysaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlyErD9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E732B9BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826239; cv=none; b=do19pbmtGpKRwEkAI5HtG0JoDtb4oBiCYwxMl67B4SBKVmH0RT2h8thi+3PqNJIhsjgNun+roNFiskJ2mowpwoGHQ4uyP/XsXHetFO6qFRVHGv3zv3drgVUL2STvij86rZi1SK5E5ZjvlQlpYbkc7KRvAtVd3NTzJ/Q4J2p4JSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826239; c=relaxed/simple;
	bh=hG1Kpqlm5WuUCAzZGjEyX7QifUntUknhBtbEKoZXnOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKgO+v1XDb/1oOf5H5guYC8JqrXotyiTVjQDFKvOciIGUkS/fBskqcpcIp1sryv8sRsnCrtMSsnsJbtb3bDBfHsQNm/FUZIOcQMi3WUKBqgMFaE/u3jAaGf/mMsnJwslWPliwItSOrxEjI0o8XSjESzNdzgASwcxSFDAZBrWVY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LR+WysaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlyErD9N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BBtaCY4013852
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 16:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=; b=LR+WysaTJo+GJCLG
	V4okYhQZAmJAvT7TcGVYe4h5Bkk8WpWdHKBM1X3evt1oVmvgpN5RbgquI260u61F
	zshpAG85Imk3/gxhcGjvE7rnaYXJqLgRxEC7ihrjJIw4bga3He2OSARNc9sFRzxj
	p8Dw6H/G3bFk1HAglxt5lnIJA2HbtN5xhDXpbDwJhBW0PWwUZEFmyZszz2kd2OPu
	xx1V1ZEDarqfjYwpM+0blZi+JnYyDNk+uTNolVvdrSO5K3ybIdYjjccV+i2pO1Wc
	2CKQ1sASuwp7P2tIDoit5OZBrgwZjHu87QrM9bbZsok4QJqhMTuo49VaziF0S4g+
	BzBs5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8aadbkwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 16:10:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6de1ee12a3so2857644a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 08:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770826236; x=1771431036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=;
        b=SlyErD9NFyerzNZbaYVRD8mf02qe9WHbzV+D7qc8Jzoetq8Msi8zuaGyaieIN9y0lA
         7HQOtUlk3/Xy2HsVr/tA4Nw6H15dYxDBIkt+6Lr4gsuLdG8uHXrD8uw6Q3QwixXPWQkx
         bztrjKutmMzIdhmn6z5ve7BNpNUbL80n9fKB13DMFgor4YFrGxgtAyv3f0/GTVu0v/7n
         faqYAQbKo46W3uppmq1PjWrYLfhapMuytLz+V8BzSI1X2XFVCXxe13YGrt0r/rh8E/bh
         eEaklPtbf8khUIvexLNorIiaSD75ROoSrWOxUZcic9QIvwCEoNxEx8uweb6+l2oN/iTK
         e43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826236; x=1771431036;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJBDI3PIChhc2kws+W0dzeaInjfDoZDme9zhqYCp+Tg=;
        b=GqC04wksCzeMK5TmwpRmcvmVJqXxCTYmy/g0sxLzRBxh257k7DR9RGQPjNdZ/SwPCM
         5bDNSc5lGBBTHD4bIRkbT1hnXxGDMsHJhfUMSDa6p0i33WP9MfQeyWxcWddtwjbic2Jc
         Yj4VFeeUkifYw0XfG6o9NcNLwn42r2aeqNr1rChVZVEzce0ved+aK+lCHMKsmJ5h+Bd/
         J29UIEL4E5BDopOtNq+1wmQwzxlMYUPIfJhvovUYVegOQ6hQ3LbpH+fIaa4JYxFPAP6n
         vJmqhVWojeuG4koxijFEtVdrznTljt9Yrgk3SuN7wPANaYKnZwMbT51X3wqb4QBugCHI
         ci+g==
X-Forwarded-Encrypted: i=1; AJvYcCX0yvghyc8idC7HW61T6opEcEpPGW0/uKKn2xyFZ4ObfLMaNGczNEhnU0j/oE6Hm3lwf92Df7/UzLuIP7yo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxop4rNM1/HWHRXoQGse98aI0NPAvT1GZsgaQ+d4gY+C6vOcSCV
	qmy2ZZaG08EE7or+bnfoMpGy8rIO6Cxn3TpWxzC0QRT5qKJnu32q2IVt5zY+xgM7BX7DIC0lW3k
	n0uvUvabOGrlQDMNfBXzh0BV1oOhVu2SrJHpi26dl9szs2LyQG1fWjh3BtaC/G6+q3CZ+wZYyEW
	6A
X-Gm-Gg: AZuq6aIBCWfaFtMUhmkdjBbX8SyuQtNMaPP2ZnoyFRu5AHUTtP/QxS3ZrquFIbSpcu0
	XVMLdW9skC6ktJb0nliDeG4fytz6vQakULbaq8VyO1uew3UywEevJuMJekTH2LJySjJMexx1Xb1
	ECsgM3ACwo6oIQRTz9l4wM76rho+sJDjrkEhK3KsNdGgAnkRU7NQmxp7egMUFxsTNDfBXfQ0Ihr
	GuthYtfrSLt+rf3uWVaVz9zQFS2kELFfpk13XLDvxrAAgzXuj4VFmDAR40j691U8NBYwY2uBUk6
	gN1OUTO9qzmXdRxzBPyeZNP/ufsD5yr1O0/eFzDOvhOnbEjBXK3jDbHyjjyi6XMJypvfc4TlWnr
	WWQK4Gprw9De8EEeK1TnYYOK2vASzKCcbrGsRiMdhzbmWppcHkpRO
X-Received: by 2002:a05:6a21:478a:b0:38d:7d8e:5062 with SMTP id adf61e73a8af0-394322dec17mr2632283637.34.1770826235735;
        Wed, 11 Feb 2026 08:10:35 -0800 (PST)
X-Received: by 2002:a05:6a21:478a:b0:38d:7d8e:5062 with SMTP id adf61e73a8af0-394322dec17mr2632247637.34.1770826235179;
        Wed, 11 Feb 2026 08:10:35 -0800 (PST)
Received: from [192.168.1.8] ([122.177.240.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ad84sm28188315ad.5.2026.02.11.08.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 08:10:34 -0800 (PST)
Message-ID: <53c051f3-3a72-4d8d-917e-3b9d1537443e@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 21:40:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
 <9fb8f661-a235-4f86-bc10-f80a21a8fa9d@arm.com>
 <00fcbcf2-3f48-410d-88a3-88dc834c1ed7@oss.qualcomm.com>
 <d6bc7f38-b41d-4e89-b484-0e699981b8b4@arm.com> <aYEFop8CJiLYzhLw@google.com>
 <7720d215-9f92-4f0f-83af-c992e1cbe531@oss.qualcomm.com>
 <aYsvacmKoLroXlrZ@google.com>
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aYsvacmKoLroXlrZ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wxsXXVm8c73dlluxxYN4bxAXw0rQJv04
X-Proofpoint-GUID: wxsXXVm8c73dlluxxYN4bxAXw0rQJv04
X-Authority-Analysis: v=2.4 cv=OoVCCi/t c=1 sm=1 tr=0 ts=698ca9fc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=AriDp7QaH+PBGn1cKZtmxA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=2sq3q3wKjKmezesidpQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyNCBTYWx0ZWRfX4y3wPaEGOybm
 OJh/JDFkG6SUxoB6xtgg3b9T/kXNa7sjdPMy5552bO8mp2pVXh1yk84eBvUy5E4xFaoMyQaFg6j
 ThtlzpNptfp9mXYcmi/59PTyHTQw5K8zhXWaegaFYcb4vp5TgrjWEVR9/hGIKh6qS3Bz+gLndsB
 ewJawVe3ydqf8GP8o/dYK7lH924An+oYx0nyVmUE/6GOYwAe60ZXWCThvtIchDJJcFkU7/m8MWZ
 6sDzdnFvHhIbI2W+TFjHPxPmbXOJRRJw4ua0vEwNQ/MqsuE8lazfkt04seFN0y6EUXZ7zuM/qMK
 vHM9SoO2ilmnjfwZkEZcu6CLm6kQhbRr4Y+PvlvIgMPz4bg4Iq5yNyhVCyIPGlpvTK3KI154d9C
 /wdrMGt3G09gaT0gD24t/IgKX4JO8hrD0yCCGmrbElXZheu+QP1QfJt3U+JD6q+rlkPKFAH3dNc
 ETGzex/ESAoOBM6JKZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110124
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92610-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,8bytes.org,oss.qualcomm.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prakash.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D524125FEF
X-Rspamd-Action: no action



On 2/10/2026 6:45 PM, Pranjal Shrivastava wrote:
> On Tue, Feb 10, 2026 at 04:39:56PM +0530, Prakash Gupta wrote:
>>
>>
>> On 2/3/2026 1:44 AM, Pranjal Shrivastava wrote:
>>> On Wed, Jan 28, 2026 at 06:44:35PM +0000, Robin Murphy wrote:
>>>> [ +Pranjal as this might matter for v3 too... ]
>>>>
>>>
>>> Hi Robin,
>>>
>>> To weigh in from the arm-smmu-v3 side, we’ve attempted to address the
>>> "can of worms" regarding power races by leaning on these differences:
>>>
>>>  - Threaded IRQs for PRI/Events: In the recent series[1], the PRI and
>>>    event handlers are fully threaded. This allows us to call 
>>>    arm_smmu_rpm_get() safely, as the handler can sleep while waiting for
>>>    the hardware to resume.
>>>
>>>  - GERROR Handling: Since GERROR remains a hard IRQ, we handle any
>>>    pending gerrors in the suspend callback before the SMMU actually
>>>    powers down. Any GERROR interrupts received while the device was
>>>    suspended are treated as spurious and ignored.
>>>
>>> Thanks,
>>> Praan
>>
>> [1] refer to case where SMMU state is not retained during smmu device
>> power down, this I think is equally applicable for both context and
>> global faults.
>>
>> Since the ARM SMMU runtime resume triggers a device reset, any pending
>> faults would be cleared during resume. Here the solution can be to
>> handle both global and context faults before allowing the SMMU device to
>> suspend.
>> With this approach, any hard or threaded IRQ scheduled after the SMMU
>> device has suspended can be safely ignored.
>> One concern I see is iommu fault reporting to clients while handling
>> fault during smmu device suspend.
> 
> I believe by the time we've reached suspend it's safe to assume that all
> clients have been suspended. Thus, we could simply not report the error
> and instead scream by having a dev_warn_ratelimited about the situation.
> 

By reporting error I meant reporting the error to client with
report_iommu_fault(). I agree that if smmu device is being suspended the
dma devices should have suspended by now. If so, it should be safe to
just handle the fault excluding report_iommu_fault() in suspend path and
complete smmu device suspend. Will update in next patchset.

> Thanks,
> Praan
> 
>>
>> Thanks,
>> Prakash
>>
>> [1] https://lore.kernel.org/all/20260126151157.3418145-9-praan@google.com/
>>


