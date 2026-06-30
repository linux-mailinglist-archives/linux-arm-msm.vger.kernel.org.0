Return-Path: <linux-arm-msm+bounces-115463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J5yEAubQQ2rPjAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:21:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C016E55D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:21:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jAjhfMZ6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jTQkfvV3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115463-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115463-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 135133002B48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB9F4266A8;
	Tue, 30 Jun 2026 14:16:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2E541C2F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828980; cv=none; b=WZAsbAsMVJFT0uC+vcmjF8ft4mU5yuXhf6qRvquIPUwIB+9ZpWBSMuBZRlLsNOd5SiwAOwiKA4s4slVdyYXJLsGHnrD3alrGreojMwz2VxB8Q+tPgpqbXD1rpZGV1q2TQrEOHyuf7qpzcJacvpHBjTgQJLa/GuLD9hoKHMu2NeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828980; c=relaxed/simple;
	bh=BIhbtLTCuL/PsbBo7bkGtYH7eIpUplVqs0upazLRnDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTFhtOZ8dCkUBrRwn2efwXTMV8Zfqi+R4LzxNe/BpNU1yPRL9pOPFu8QWIwhpwDI3+xGC5XIyMOSHWoxEZwamqTX9CD1LXUP2Xwu0HXfjfCJ5deNnbwCqwFPoYhaM9gBZlg7RTPxWYgFNa3A1x+EjiTksMu11ACFU74lUZhvqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAjhfMZ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTQkfvV3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFW22216847
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=; b=jAjhfMZ6op01ueNr
	Vs893PlDvIYcGfDo9Dx2HeGWGX874Sjg+pnUnFP1Ej/neiC9xlWR5St3KxTqP+eh
	1naV+eNK3eI2Y9x7Dw+J9KooUsZzw/EfL80xUzOnTGxa/lbAeaQcWfoHsLwDk+lA
	9LVjMhjaoeaYwkO1M3GAxyLYGZrIRnixp1/ei1243owW5Vw0RJA0SpftKOVLYHPU
	f7OwymOBMfESYc0sBH/jshFHpTZRFY9aWPjCsBMWAu/qhaiF0ortD6sytqiCh7nL
	sJLFYooJ7ublkfjcOh55hAlT2LpMBtMJ98G3VbGPokHncKuyIauyd2Ol6SXLnrIq
	Gkhrdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfk3ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:16:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6b97afe7so12940685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828978; x=1783433778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=;
        b=jTQkfvV3gPuPiOSzyYKXKIjYquoBdU6rKpWxCNo1Wu14ItXMWWAM35Dh6dmDkCsm5A
         jybypHNzZxG4XfZxprxoU8KEsJ+zdoY0XLYUfEVHB7b7EBmzbd/1FvG3Ft5EAfHEy2A8
         U0vMRN7YbEBVsG1xbfforfx2jJq2iX7kWe9zogN4Ul9CPJqDJFNMUWvfXcFhrrfBEhw/
         W8ikPDIGITKFTg/14/wIcMR215iN2DhE38n5M/ZXsbhvl8QlVu+9U4l5L9q7dDkaCpkT
         NxkGAMl0QKu0K6hNRs882wqJ1wNxR9Fr13pFz0IvcWYNBKOTzAjKpHTYCZ0HsqBEfM/l
         0O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828978; x=1783433778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JStmruWEm2i+T8q7mcjNz5amoIiti9X5qtUv4Cl3j4U=;
        b=h8g+JUVtBu2a9ZWdBRoGYiaroTkM3oKgtosxA57CnJoEofk5/+Do/oS1yKtHIrLoFN
         GMcVEEzdzCUSyfEYiaSvwGywWgpRlczKooH8LrxvyAjcRf73ZIwyoLLC5QyzwEZ0qbPm
         fQ+ZFLp0T9c4oMp1Cn/qdsmX/txwpymsXvdRYdK7XBTiEYybiGtZybubXtjJ7/7ucIPI
         gmGdRYDnLW1ILiUeglTgqA65G4nlTehWRCkXn+hUhovWXExD9RHjUv+oGhm5DORIxzzv
         HmLJuB/Hfl8HoNpTUNoq8elol95ZoN4u1yEKtfB6E3N1J8PjvBmBGryg5hlpFwwqjiOY
         k1Ug==
X-Forwarded-Encrypted: i=1; AFNElJ9LQhttjubKLkb6HIaAYDMPPz/9Pvm5mFgNruNjjttT7lJhEpIH769kUBiTMbXq2NbLOMqRKed22fKcuEy+@vger.kernel.org
X-Gm-Message-State: AOJu0YzZMo5nLmG5wg5bQHAnDyy+RZMxXKB3wKbx67NLLEZeWv4At71g
	NHq4/JOoWtOnStHHf2JLKbrkPaw5X407r999Vi9CwqEfQ+kEceXGYIe0dxniakOpVe+5TB8L65e
	lH5lFuT6LU38qrdCKnvrlrs3LG+irStXuZs/PkjN+xMsFUc7zS5T63wYZcxZwNvdkg8eV
X-Gm-Gg: AfdE7ckNXnh8jzS5X5ViHmfl9jcw9jFFlJX5F5DgiR9V1mDxEkfmKY5fxFHa7IIUcmm
	fHCLlSW00FwCcvZzk+KQdcVvCj18klDjcRLm02r8v29H+eSZ2NiN8SV5D6/gsoM/bOQkqK+BZXR
	5GKvgU8rGE4vCBG73Pe1nxEXM6ciFwXoJSMsRV/j4sutNZeOWmqvOzfUmv4OnIIFdtzmNyqW9ES
	5j6I6CJ4SLYkuwFwbvzcuWqY2P+XUgRgaDKVljwb0rlByR8d9cS7mnTLJad5w/akWKz5peDV/ox
	zuS/+WHmvPsF7+MMqVgYFIzCJC4mr6vOsaU8JWt6HLBIuhIdJ10Wr22/nAk4DpvYmUAu8jnnGSw
	184rKQQx+xYP1+ERZM+n2wy+QtGmIvalE8Ro=
X-Received: by 2002:a05:620a:371b:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e62829870mr353029185a.3.1782828977672;
        Tue, 30 Jun 2026 07:16:17 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92e62829870mr353021485a.3.1782828976841;
        Tue, 30 Jun 2026 07:16:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6b068sm138860266b.25.2026.06.30.07.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:16:15 -0700 (PDT)
Message-ID: <d4001407-cdb0-48ee-a138-87c94b5dab01@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:16:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] qcom_battmgr: Add batteryless DC-adapter MAINS
 support
To: Bjorn Andersson <andersson@kernel.org>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <56a54a34-1040-44ae-92e2-ce65a3d3acb5@oss.qualcomm.com>
 <20260519065938.4i5wot72pfxy4m3d@hu-kotarake-hyd.qualcomm.com>
 <ag-NLvh4ROgTCs_L@baldur>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ag-NLvh4ROgTCs_L@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JDZA5NkiJXZaRgwuWyRFusus8HlEZYmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX583btm1cLmlZ
 6jJvuzCLSMn1Ox11eGnYleuSABEqx1wHfSEEJz8kXf3EPwb7ogrDWriHw4Bqdq4Kk8x+0vM34li
 1R9b398bQlXVebGN3UNqSqZ4kOWvXRB9G+VhO8SDSQoWy/mFxgZf7kdQYavbYIQ1ATWWuXy8kC+
 jiEBe86BKIwZoL+spinays7QMomKTrwMiSIt7F2mNUkBB72kWhDb7RiJnjGNrHclHv/1zmH9ff2
 zk0+1mH5uObba5As8k3dm6qADgcz1ipWPLbP+34HW6qbNr59lgw0hSRcfFuOdPZbDtwXHW3qwkf
 TeAw4NO0VPFF796PN7LaASDb0eTGKFSIL/GkRoIn0ftbGHLFa4or0pZemjYJDZosH/aEygQwO4h
 xv0IfELZN+cTA+ajk91OlraC/oe/ZdZIRngZWgwkcwZLXLaP9emWjVQ03Xt+eAtLcReePowV/b0
 7QWJttzMrGEJw0/CDtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX5+RuY8LSDXIc
 8iAhC3Ar1280b+OeJnl+P8REXtkmyGChWdzzuW7lxiX5/l9EgSr+ESmChAUiky+7VndwhgjkHLQ
 yZdWZK2JIbSmBabmAclEISiOE5mWvBs=
X-Proofpoint-GUID: JDZA5NkiJXZaRgwuWyRFusus8HlEZYmu
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43cfb2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=v7J6KcBBf8EwAPocaPwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-115463-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:rakesh.kota@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sre@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[178.235.128.140:received,205.220.168.131:received,209.85.222.199:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05C016E55D2

On 5/22/26 12:56 AM, Bjorn Andersson wrote:
> On Tue, May 19, 2026 at 12:29:38PM +0530, Rakesh Kota wrote:
>> On Mon, May 18, 2026 at 04:36:32PM +0200, Konrad Dybcio wrote:
>>> On 5/18/26 3:49 PM, Rakesh Kota wrote:
>>>> On batteryless boards powered by 12V DC adapters, registering the
>>>> power supply as BATTERY causes userspace to incorrectly trigger
>>>> battery power-saving sequences.
>>>
>>> Does battman really offer no way of differentiating whether a battery
>>> is *actually* present in such cases?
>>>
>>> What boards are affected?
>>>
>> Currently, batteryless support is only implemented for the
>> qcs6490-rb3gen2(Kodiak) board.
>>
> 
> What do you mean?
> 
> Are you saying that the pmic_glink firmware in Kodiak has a one-off hack
> that no other implementation of this firmware has?
> 
> My Lenovo IdeaCentre (hamoa) doesn't have battery, what should I do now?

I was going through my inbox.
This remains unanswered, and I don't see the discussion progressing
without resolving this.

Konrad

