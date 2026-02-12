Return-Path: <linux-arm-msm+bounces-92725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOb+DdMAjmm0+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:33:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B4912F7A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3609D3162B40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED1435CB8B;
	Thu, 12 Feb 2026 16:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCg/guu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eJ/2VvWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9647353ED8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913777; cv=none; b=GbZWUNmYOLgDqT/Ai1ySY0WKaQLkIUq+3a92LI/QKXMUuKmaJgGR5pQlvwlw+pbNdzGLKKuk1W6ozOLv4qx1B4+H7diIbCjfR7EVg0n951mcmnfiOXZ4qzi+Y7vtjTRBn0hjKRabEQGUBl63diwH2tTPQ237NZkQhC4oYCAX8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913777; c=relaxed/simple;
	bh=vLzdA6zHgbkjuHo9/O+CYEw4Gh+QVxCX4cEaXRw+6yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMe1GhbaRPENr1KiyvljJOe85h+hPdCAAf3FA35WMTV9kYNTkypQJ+s6UpUecm1mvw5/lRK6QuLFEKNmYf6vomLcPB2gFjH76ed+VmDafXeR4nTKz23C2JfLp0YAn4UkxLkafFEj37Zj4SX3VThIjPJQpxPwN3oxvLLkdOgVeiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCg/guu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eJ/2VvWM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CE6tMB652726
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNIKed/0hHSPSELQo7Pa80a3MofyYycCRa4/m8vYlws=; b=MCg/guu6KTYk+1ZC
	cGxzw7P7ojcYcSRvK6UiAoPkuvO/KCa+Rh+Oz2JQo9m+XTxZ1OUDsNP7dhydxDCh
	ohz7clJeiKOLlkqFbqBBnAzbULVtW7D/Ra5W12DW2QK1yleQcNu4gQIa4DTOsIo/
	gqPxECywHYbJuSMw+kM8ubbNv+dJxhAksJO3W8nJgdvr2gGAQkcXGlKiRFd4Mpaz
	KY5XRtPhA6qjEr9S7q4hhswFwIbscl9Wh6Yg3oGl2hgNzH7J0s7ZO5J293wVMpc9
	Ck8K8L9k5e9gNjxyIwC0PfBMGXPqGsCSyxDx+cr9wdWkCb7+8OwhFZiPm4synpqZ
	mhZ/Qw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9gbbggme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 16:29:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb38346fdbso2169485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 08:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770913774; x=1771518574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rNIKed/0hHSPSELQo7Pa80a3MofyYycCRa4/m8vYlws=;
        b=eJ/2VvWMiYoU+/zIr+nRbQLsXO/yiN578pWRPx47jQZ+xrfySSlw0ZQM7o1UI+jjtS
         hxbvWTGTtmGlUmib9j86dVUoYaYhFHljsxr/Hlu0pDyPCSm6nBiLMgDNU/exrHMiJVfV
         4gpGF6v1+7W3WrJimQ4fiQEgDuE42QKOj9KX6/kNVyIUDNwGGj3j8dbobbs0RcyNxA9n
         IZangCpniowqIryvNcsmcTJjjiEji3mlbFf1J/ImDlwMYGTMIkiYVeFioN0VYXnu0U/E
         trLFh4pu+2BlvWmbav50wnTndKaww+IuGKd/sg7sRLmWoSc0pCZV/IQwr9cRKmiH5ew7
         8ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770913774; x=1771518574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNIKed/0hHSPSELQo7Pa80a3MofyYycCRa4/m8vYlws=;
        b=KgbzCAcjYPGozUJXBZHH22U9dmMpabl6jQEkCONQSwdXs4NoBZ3uu30SWQDmOs01lc
         GlPg93b5z+/2QexSfEBxJKNDht7LQi44z4FSzFd+cR5yQ0tDdc4Ga0r/ay2298hXVwAm
         B0sU1h9omUVkOOukf5+4wg6pmwYKCndchVtKHEBj3Zsggnjc3tO95e2fIBciqdwua1dY
         qFkztqif0qhB8kyvkNqRbbXpO8H7WasHaqRgAvEbJxMMCuUC0fTZGL1RI0Xpn9ZN41w2
         KPbRCjYRT3C9hZjhMGTpLw1cRxmmtaXBmf74NrUZQOzYXsCLlr+H0lLPwdPRx69gXv5O
         h3ng==
X-Gm-Message-State: AOJu0Yzbc0tl+Q3YpgYY7C9BPV5fDrEbS+2c1eZhzfSc54UGPh0GNCx/
	bzltdVA5ZaNAqnYWyLwDGXoDAaOGTUbVNB0Sd2N5vw+NXIG0D2Z2mezZDqFHEHSTcRUTxroMKJR
	1Ais/lkmh63fD6C6jLQ2pvawuF+fbkXOO3/tNJ1F4fqY9eIFRmBXbL8jE+An2yLKMk0JUUAnbJI
	kD
X-Gm-Gg: AZuq6aLwfu2wsl5ZNjOjYPhdV5HDm4lbTmNj47jH4VkdKuPwZ8DNTS8uAbBavhpr04S
	/+J88uN6Z5+Mh5koN3M5tcXQweBARv8ShgkwfLcrM3xhDFObkL3CGhgP6LVteZYI5CaGYMMsGd1
	TZ0ajGP/80Cl7T6Fa5AK4vYxCL8UzvnTwT2KYbYylPlV+ohn6Kr/XcODiNe0m41ES8LCeSWwWXq
	pSXE2PNfNmb2fnWdTf2x4Ae48kLygHAn1vDyvZoADQ3HEZ+VG8rsMPIlkAwK2ZYY4e/qLS0VADc
	0sT/M/P9ufigrOcEvuzRXhaoh9nMA50qx4lKyq+0979uqM8oRIahePjN4rypTPMhPmMwT1DImUc
	y88yHCch67HdXP5gR3ytxHAf9sZ6PWDUIn53xFWFg3JClB4xRyneoMSO1RT6tCkk25ZY4kkq0k/
	JBUuM=
X-Received: by 2002:a05:620a:5795:b0:8cb:3f84:6e62 with SMTP id af79cd13be357-8cb3f847056mr12572285a.3.1770913773678;
        Thu, 12 Feb 2026 08:29:33 -0800 (PST)
X-Received: by 2002:a05:620a:5795:b0:8cb:3f84:6e62 with SMTP id af79cd13be357-8cb3f847056mr12569485a.3.1770913773226;
        Thu, 12 Feb 2026 08:29:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3ceb13casm1892752a12.6.2026.02.12.08.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:29:31 -0800 (PST)
Message-ID: <af15dfbc-806e-4731-a7a3-6832a781154e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 17:29:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
 <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyNSBTYWx0ZWRfXylexFmM9L5iE
 Nqh6YB8bTKZ5LVfxkz5/X3+5R0GXaAXbK7mixDaQqOg9P/93w3qflZzLWdKHEoLstO0u/42ikbl
 g17r+Oa68iusKx3bln5j/EXJm+qqWRyc2NoVpUb0r3CjAZOTAEVaKoerBYGl4NFQec/DCQSBayj
 FToQg/sORnoWr2m7om294cP3vWqFv/rC3rKD4PJFfRWLHLgbqyIPBQahcaO4qtY0g/nYhGHvkRI
 xaho+NMUrMgkO9B9dI2wjGHSrvNM9c9lD+15w7fsH9FzZUt+ffUbYbifVdi7Y1gDBn+amFiKJRJ
 zqZqOXRNsdxQhfVkgEe7m2bZ4jHRWLhAZbKrs0p+p71+q2QVhTmJ5HHAygYCJO1/PfFvs5JiSmG
 wZ3mWmLrw1+tbuAUfQ4Vgs8fcD8Okfi5y1VvihLJa+/nYX6ovmwi7R7DbYzTLcMfpSvAUh3+hC5
 9rYWtkBG2qU+HtK2l/w==
X-Authority-Analysis: v=2.4 cv=a849NESF c=1 sm=1 tr=0 ts=698dffef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=yyGGvlRu5vKdtQ4bmygA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: A4jkZxKJb4DUPJBQBOhX8uxXoAqmAVns
X-Proofpoint-ORIG-GUID: A4jkZxKJb4DUPJBQBOhX8uxXoAqmAVns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96B4912F7A7
X-Rspamd-Action: no action

On 2/12/26 4:50 PM, Umang Chheda wrote:
> Hi Konrad,
> 
> On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
>> On 2/10/26 11:38 AM, Umang Chheda wrote:
>>> The Mezzanine is an hardware expansion add-on board designed
>> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
>> is there a better name for it?
> 
> Does, Interface Plus (IFP) Mezz sounds good ?

I don't know, does it stay Interface Plus on the silkscreen or similar?

Konrad

