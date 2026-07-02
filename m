Return-Path: <linux-arm-msm+bounces-116006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fLKbKTBXRmqTRAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:18:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C7B6F776A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:18:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JcZ50FjZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DWPEEORm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF20830E5E63
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD9442B32B;
	Thu,  2 Jul 2026 12:10:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86CB47CC63
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:10:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994206; cv=none; b=WByNJpgZSqnN9VKKiWMI3kn+bDNt/VUf4Bw4q0GpsosVpBwPd1AyBSuACzJUH/cSuulAx6ClF5uUjV1cUOHx1H5uZ2CsW+/hm6Ys849PkfFv6nKI/6G1QOfSgZg1Rpf/4plX9bInNLVGSem5EEYDmWM+e8RQdM21ON8PhWTMDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994206; c=relaxed/simple;
	bh=S/iYlCNJx0bB4rwLfVdEC0/cbwIYuctYZWTNTYnHWHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vFBgLRE+WSlM6t3eDSsznIGarKR9S/qIccrTUQRHPPo/Q91MWV6j0UZ3FqvBYEWZzmMWgxYhecsptOq3GH3WLOGGmK4LVXxPELLKntAo/LlzWQMccx4CzmAkCGazjGNinsozoVy4Ja89i5B1S4CLorapjksiJ3DVJg6PpH5+Z+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JcZ50FjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWPEEORm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628sJgg4172111
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=; b=JcZ50FjZ4o2n/az8
	MMjsxCsLwnbDwmcfahy9X69WjL4VbwjSmHI7nNQzzixZyF6tlgHSM1qwpq2SM8ac
	YyUduhryKhws71dQLI2ULfV9SxLfw2HnmnnD42Wr4AY+iAkhRYpK9bnpw9l6ilAe
	T5Z54NqkkwsivkKdFxlNmzL72OfCae9Up3XP0O+xRxH0fBvZ0CS6PanPM1DdMNtY
	8Oa2pX4QXBTPNoeH04/CjtMsKVthhaAZPuseaGjpFHVFrbg5ElBbrALQVzS/vrmC
	XEHk+giRj1siUg4gzWBmFyZjcVI25PlfIly+gHtq5ohaHf01MDSatL4Rj1XjX+gX
	uOBvLg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5mvwrqr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:10:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21be5bb4so8702431cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994201; x=1783599001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=;
        b=DWPEEORmvKGW1/BJw9bJ2CoKAwm5Lysw0eBXXoQJWoUdor5rAMEpYBzgUP3S5EvOtg
         ikZDaNgY9ui/29r/Lu0R2hQy6AsAdrUHb+/8qgQi4hPaxi4ubheKMKwtlt6hhQCJhH+Y
         MMi3xrTpVWHdJ5Bga+sYnd6E62TzEq6oBwmC544KwvL9UF1xzEBPUyJ9lPib/wuDRLod
         I5XTKHJ7P8rmB3ys9g0+7EqYC53A+ZJXLcswx9DEv+w9UMzIq/eESI3yn7k7/iiA9YBJ
         uz9x4pgRRqwUc4lhn8gkb/4rDbCiRtCIVv8ldr/xuf6fhjseiA8L7kMmu5AdyLJ4lgrt
         EEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994201; x=1783599001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl9GSImze61k4JpNEPGLUzkgXHiflvsw4NggzrOW5cY=;
        b=S4hKq3J5vb+M7yLwylgwRk7jEzzXST3W0igQyMA4ZPM3y58k/ekJ6/g/mjnf6KStBp
         /6wfxfr2wait/1hda3W3uudE+D6q7av2jL55FFWUvJMkn0DjkDrDMrzZa502qBcvaQbL
         bQ7ztxJ/jbBafzfPvJTgczlIIIJ6qPeraiUDLlSCoro+Tg8IBKj7VjUaSDhSc2h2fU1/
         DYl2v89Okky+hMboNdpB2SoEKeCFJPq+k1c6N7UynNy/sM6Rm8CbC4K6340K7q7fDgmf
         /kam5iq2yCCL1LP5b/vbT6zLQ7i1Np5t083wKPNW0RNWbJm7sW+77F2++g+Nur4UW1BC
         T2ew==
X-Forwarded-Encrypted: i=1; AFNElJ9OviM4wdmx1MH8rYvFiTYx/clNk5jEmheCo3TieV7f0eKFqdd89OGwkjqXCTPxibXt+KMHjPAOig2PCReH@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMG3mvfnncpFqAijE9qqPgvNWpka8lHvh7AEqSIy7X4XfuSJF
	VbcvF2hxWGbDtn6oKWU70r8IUwYyC6he5WSqKmu6i87tAahHskHMKSMFg5msqGM3Txg1hzJJVwP
	hLi10fL04rdmcZlmmiSTna0+0qWNv5Te6vdhQfEe7gY/ryvp3QFd5hDLqgIz33w0Wk/hy
X-Gm-Gg: AfdE7cnAhzwQ8CVwLX1otFQhGQsVo5vVaTw3nds8teouaqgR5+p0Ucy1y6dPgs0Ax8m
	Rx9QLCgPMsUV6YK2HO83NbyjZByaH2/4ZQoddWDw1Lm+IZv+LHoQpcjnDWjpdx4txaD7Ne4Jz9u
	pIEPJ/xAXSVpoOZH3j5Za3vs2xclFTBuwIDS3X55cAj2PgbVwn1CG2R27fsAgU1bwG3CnmAx6F/
	XDx7zAtzL18VIE3WXgeD3F2Af3+W+CqYOSd/FFS4Y60/68hLf0hrFLU2eCwS57uicUij1aCVaDO
	Cubu6Bgk/yANwN7El3oiMTrH2j1ppsxoSatkfQZnIuscwW8wXljaanwXOA9xwnw/K+uH7KBSaCE
	Yn1RW/G6WrlCdSFr/Dnvg/i0CkT8l10uEFn4=
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr45865951cf.10.1782994200572;
        Thu, 02 Jul 2026 05:10:00 -0700 (PDT)
X-Received: by 2002:a05:622a:14d1:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c26b41df6mr45865681cf.10.1782994200108;
        Thu, 02 Jul 2026 05:10:00 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c53c1sm119359466b.45.2026.07.02.05.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:09:59 -0700 (PDT)
Message-ID: <9281844d-5570-4100-8517-d1bac4e08a30@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:09:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
 <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
 <edf331e2-73a5-4afd-9a44-56cb786626c5@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <edf331e2-73a5-4afd-9a44-56cb786626c5@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DWqeVDaxM1kHW-54dLPjLl8jtldtiN_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX9/G7XGdFEEuS
 N9xJoDbK0h6FxHFp6prBFPOiORlgDHEoyOBaWN7VNpW87AmAkJ/qu5K/a7tQaY6qlvXphvwoPCj
 1FDVYRd43qx2IMvyf8hopNc3MrV9pqTjiY4k7c9mxVqEXZWadFYM+kvs2huMOLQSb4eYWGuAjN2
 KQ3Ee28oK0yqXkwnFbh2S8YtcDEmETJ8QIFyo64RU5vtknLM4csbcgNBD+sicRh7sDBbw0MJHar
 wNWqcjeGW1xTrZEXh+qDkJ2OfKJNiefu9FAWO0LM0VuC7oHjNiXqtZDvS86cHxC6an3YMJF7LHK
 XdnOR0zWg9rKsmg1aPxBFMN/d5nFs5K1+vBU8T2e9+qC3N7DyxRgDMin9dck8vUzXiXmjwDvRz3
 OzNQ4jLzEQz4DEcx1mt7jiHqy2dCq18k+MRPQ9r+r2Igx7eRwvZMtyc3w8sdCFgxalr7JiKTdU7
 WF4RG5AWtaxyCEk812w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyNyBTYWx0ZWRfX8hQonOMn4XrF
 jn8XocBR50iMuf1ykuYzW+S33P+x9jZNBa6onmtbzk3d2Kmbk0zxKZQHZGQCrZlx5jFqfZs56WD
 loXHDzmKU/kAX+kuhuGqHbn1+2lyuX4=
X-Authority-Analysis: v=2.4 cv=N+UZ0W9B c=1 sm=1 tr=0 ts=6a465519 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=PMVDw0DiDpggxp4qDyAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DWqeVDaxM1kHW-54dLPjLl8jtldtiN_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:alexeymin@minlexx.ru,m:setotau@mainlining.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48C7B6F776A

On 7/1/26 5:31 PM, Alexey Minnekhanov wrote:
> On 01.07.2026 15:48, Konrad Dybcio wrote:
>> On 4/27/26 5:20 PM, Nickolay Goppen wrote:
>>>
>>> 27.04.2026 14:49, Konrad Dybcio wrote:
>>>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>>>> starts at 0x80000000
>>>
>>> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 0x40000000
>>>
>>> 40000000-855fffff : System RAM
>>>    40080000-41bfffff : Kernel code
>>>    42600000-42fd0fff : Kernel data
>>> 88f00000-8abfffff : System RAM
>>> 95000000-feabffff : System RAM
>>
>> My docs happen to be silent on this subject..
>> Do you have a device that has more/less RAM to compare?
>>
> 
> I do have quite a bunch of devices based on sdm630/636/660.
> Logs from UART including longs from stock bootloader are only
> available for lavender,  though. For others I collected dumps
> of /proc/iomem (and debug/memblock/memory):

Thanks. Let's do 0x40000000 - 0xff...ff then, I think that Linux
should figure out what to if there's no memory below 0x8..

Konrad

