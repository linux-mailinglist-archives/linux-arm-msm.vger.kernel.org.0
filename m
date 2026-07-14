Return-Path: <linux-arm-msm+bounces-118954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id unvOAm/WVWqduAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:25:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41275176C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:25:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="oXY/uVi6";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jDiTYbYZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118954-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118954-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10885303C4FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4EE2C2349;
	Tue, 14 Jul 2026 06:25:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF9275B1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:25:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010333; cv=none; b=paeirzyKw2NaItWcfZbf6HJmO68WN1CpX0M3zsIqhMXCfAQTdxI4+9DAUv5V+TmzsU9kkuLuew7FAE4cV0LE7QKeIj1ZsXSonCQlGvrJqRN6wmxKOBjbL8yFWw/8zSscoK0oZ9S/TDnhRbXd/+OoUKVwiK4Nu36jyjdCCzE3VIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010333; c=relaxed/simple;
	bh=B9pVgo495diTna48/2OTSXCDVKMHadDb/yMwyo7Ctqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyx8Uqd6tWFf2K4FG6E6ERyrzgIhLD1cjk8n+U35MKPaMBnfXH6goCodw7T6ZH+QGm6EqxR/r7/+69FoIB+EZbeuj5BZyYYJkZDNLx7VpBlQEzfgH2Ad5n6IFQ+CRtafkb6BscZ/JtLRDTCw6l0wQB0yc0Nuypl6qxku9AqAKpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXY/uVi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDiTYbYZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38dGA3303476
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZBr75t40r+MiBfSLFczvCckh94aSYrJwRQNiIqxluM=; b=oXY/uVi6mr+lfCNC
	RpI8s5qBhscqfRydZtgyW3Ngvs22dNTjsfxlMELn+CcVLwxwcDs0J5Td5t0g6e1J
	x2lMEIKwYdYMoXFlRhqguEfJA2wNbYf9LkQLQmfxU4qpLHiglmXSKHF2yLMhwvNr
	JyR5cCwChdvhhRo78HWsTFHnBSsZo/xkNrIv6Me+nXwg0rpMHsLEc+7pa0r0fok8
	Zh8dxIOYbylD9XI0iTh4yCriNTwyrbdI+Gj8v9T96w74kJYpev+wog0VIh8Ioz89
	Y3+NoaAw4YCWQnHKfnNUg4fVQCVK822LJOkOZgORaZ+5e1bHcxOnGz5J+JqeUuBm
	BKcyDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p28ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:25:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca8409ba0easo625585a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784010331; x=1784615131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZBr75t40r+MiBfSLFczvCckh94aSYrJwRQNiIqxluM=;
        b=jDiTYbYZlX6wYi3TArZ/NBi8D2+N2UcrC1lTORkDWtVoG0tJH67HlpIWLXhH/7wOPI
         +vJf5yy1D7ygBezYc4yYkZexkdsITTB6ZNvfPiED2H2aEWXleLr0G+vgLUzJiGIkxdU6
         bbZEW20lySII5mYtzSlnBXllApGMCdAbAWowRJEz/HIPQkHLizmG+CPieyojsjJgJWXL
         I9+T7ePstV/310D9RiYuI1Kd1YH6i7Z0bfQrYpST9TYfND57joQMMDYdspZc5zKsBSho
         rcD+0qDrzw5zOmiLr4C813Y/H5dJf7jAYyWgVX2j4vQvDRxc4NZjVSjQ0aQwzVytGGfB
         ev6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010331; x=1784615131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZBr75t40r+MiBfSLFczvCckh94aSYrJwRQNiIqxluM=;
        b=eeW2qUR6KVByCp99b5POmbGmJNC37fNDY0Ooeq9hi5Y7w6bl2swjn54F7YGlBdqh5/
         q1TgWSqhkbMyHjlfQ1vmxnGJh+8bOnk86lftdMW5jImQjRVzZ3NsaHXj4HGHrQZeGF13
         d5fC0xvdbUfRTRxv0SFKzKh4N5Fqml3BTrlhZwrESrhDJ3pH3UFU65A358pMBn0zzfv1
         VH3o30YRVltAU7qBDxCUPbUYTAc6pQNXAc06wOO3o7s/K8rFmaFyHXxaubRT0D4T3u99
         svEQcQekbE4gm5kveCi82Zfd3HVD49ktbyBordlab2e8tWM2x6jlYkA2YMbe7w4cFTF9
         Onzg==
X-Forwarded-Encrypted: i=1; AHgh+RpRhEMeusrtqA+5z2D4H/LrYhMRLIE33/qni582D557xGhHZ3b4Lj/KxZyc70YTskrnIdLxt0pjNZH4hgh/@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEFjimCa6DwbgokNiqNVbTxz9ARDg/xEZnDKgWyIkkRw2fT2N
	AVxbAOULUrxzYlVhuZTvi2VQ5r2rd6uLvFze1GlZbjBOC1rCYzUd3GzdACk4bl7Tb6/KiUyRO3r
	bdOk6VL5xDXh4BqqtKEBD1t2WYH6vLug6n4f9K2GzA4kQDDH7tcuG558L/xlaTX4dvTQ8
X-Gm-Gg: AfdE7cm0Ee6spsKlWQCEDYExqBfvOnyvBILl/yFz5HdGZqGSi6C+7ivJblMKqF63mF7
	Gi2wvOEeD4o7I/RHh4AkmOsnuFcrQf76PLe8jFugX4WKfXv4hMpXgr/h4kT60UZyvfUpViOkCGP
	AtMpS2YXhl1+fRPg/jz1BFw4U9wfbOWvkrVyB1TgOq0T0YimJc9kLE/fokwyMEerOlubpYdjyIA
	CABxEOf7yqwFmhB09+6iZYeuTClpDapam3HjY3AZHzlXXDVyKmjJF/WH6hEpSneOLR++klCfNdD
	Nq2JbcHQYYlKjH3qZRpMiVDLDwpSoaPILuChcun70KTBc3HVvZ20Ld23Ycts0MTdZRf2XtqEpU5
	HDeBi6gF0e1ot0A2HNTlUc3U9MBAahHzPQfeJMq8=
X-Received: by 2002:a05:6a20:1604:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3c112c6df67mr11810090637.17.1784010330786;
        Mon, 13 Jul 2026 23:25:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:1604:b0:3bf:ab54:8db8 with SMTP id adf61e73a8af0-3c112c6df67mr11810061637.17.1784010330332;
        Mon, 13 Jul 2026 23:25:30 -0700 (PDT)
Received: from [10.92.171.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm9318316a12.14.2026.07.13.23.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:25:29 -0700 (PDT)
Message-ID: <c588861c-bbbe-4f30-a503-c9c04d9361ae@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:55:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, bartosz.golaszewski@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
References: <20260713045811.484554-1-sumit.garg@kernel.org>
 <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
 <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA2NCBTYWx0ZWRfX5fi3EzEXLaU3
 S5PMu1uarqE7Xu/2HpT4ZH3o4A6a40yUT+kD3F4Xuws5R++eRKUQrQYz3YlGskXLwxRLAsDr6wK
 suvMOCE11LDN3Y+lPdpmCD2Nve6y8cw=
X-Proofpoint-GUID: 9RK5Zme-Mx928X4O9-wuCyzPqYSiP2oc
X-Proofpoint-ORIG-GUID: 9RK5Zme-Mx928X4O9-wuCyzPqYSiP2oc
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55d65b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=J04rnDO_GnZqDZMaarMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA2NCBTYWx0ZWRfX5hzPIbLDe9IM
 mrYxYlNCYMihG6v5Ja5NhOht+jlVwNxJJy8qmsbnNUnsiBQdUVOceasC1ukVHJfMTRQ7qMa3yXO
 NKxmox0rWVjD9k/WkHCI+7nC8xFgRqkxlGkrQEjcMEi1e/eIwcoPSHZRRkxAw6IQQ2d/MAT2otP
 Dkm74w2oqhyQgnWvf7lZXvSqh2B09fNolIL/+KPlE0GQ53H1CDZTwE7okYMHfXH6D1xZJXTDwzf
 RedGtDDYdz3i9TlB8kyyEw8i6hpXrKmATdl/wRsW3KudWp0dg9s3+8mvKhwECzGrdkei6pVlRf6
 Gx9/+QM4+ICNRl/lQaFBCBfLeRLeeBG4+QHXSZkqy6eSwJIM7VF5uyLVfD7GkwtRiRCR5kHwRDj
 gPLfReH8fcgPFPR+5IkXUgOEsUQ2nw3EFPaOsXmSTkFqa+U7aaXeaFlSDJcq9Umcg1EbAVg68IJ
 6KA+BWTM1xSQRNAEUGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F41275176C

Hi,

On 7/13/2026 5:05 PM, Sumit Garg wrote:
> On Mon, Jul 13, 2026 at 4:07 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/13/26 6:58 AM, Sumit Garg wrote:
>>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>>
>>> qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
>>> calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
>>> calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
>>> When both are built as modules this results in a circular module
>>> dependency and depmod fails:
>>>
>>>   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
>>>
>>> QCOM_TZMEM is an invisible tristate that is only ever selected by
>>> QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
>>> as part of the qcom-scm composite module instead of as a separate
>>> module. This breaks the cycle since the mutual symbol references
>>> become intra-module.
>>>
>>> With tzmem now internal to qcom-scm, the shm_bridge helpers are no
>>> longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
>>> move the declarations from the public header to the private one,
>>> alongside qcom_scm_shm_bridge_enable().
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp@intel.com/
>>> Assisted-by: Copilot:claude-opus-4.8
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>>  drivers/firmware/qcom/Makefile         | 2 +-
>>>  drivers/firmware/qcom/qcom_scm.c       | 3 ---
>>>  drivers/firmware/qcom/qcom_scm.h       | 4 ++++
>>>  include/linux/firmware/qcom/qcom_scm.h | 5 -----
>>>  4 files changed, 5 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
>>> index 48801d18f37b..55751d282689 100644
>>> --- a/drivers/firmware/qcom/Makefile
>>> +++ b/drivers/firmware/qcom/Makefile
>>> @@ -5,7 +5,7 @@
>>>
>>>  obj-$(CONFIG_QCOM_SCM)               += qcom-scm.o
>>>  qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
>>> -obj-$(CONFIG_QCOM_TZMEM)     += qcom_tzmem.o
>>> +qcom-scm-$(CONFIG_QCOM_TZMEM)        += qcom_tzmem.o
>>
>> Does it make sense to squash the kconfig entries too now?
>>
> 
> Sounds reasonable to me, I can do that for v2.

What kind of squash are we thinking about here? Moving the TZMEM_MODE* choice to
QCOM_SCM and removing QCOM_TZMEM? I think we should keep the QCOM_TZMEM Kconfig
around for when we boot with OPTEE and want to disable TZMEM since SHMBridge is
QTEE specific.

Regards,
Harshal

> 
> -Sumit


