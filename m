Return-Path: <linux-arm-msm+bounces-94970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFX/NWmjpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:49:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C71DB26A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D718D3013947
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81538401496;
	Mon,  2 Mar 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTmMWnMM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFaCViHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69E3FB050
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462950; cv=none; b=awXl5AjGetmURrkyngCGrdXNnxwoo3aScLuJlJfi2n84qDixvSNRMTYGrgJyzpxRWYikV86i8MMfBVNU1wSx3E0D6X8r8Wk2wB8gAZh+LSxf1IQux1VktMpLE5uRlQsyQ1t2iUUaJNX04R1qnYpcBWeTZCiQqUIcvinTa3Hkrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462950; c=relaxed/simple;
	bh=WLvISYw3AkUjIAjEBh47JY7NEGSb7s+i9cMxM340Mso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=panF1m+ovG/l9ZHhiWiOFTDXDpwtimOuGtF0uy9p6rn7y2T9Y3iNUL5MwupiAOHG+B2kVxoXKLp3j/3GLaaRd+v2EGYXPcEmHYK15WgJfW2Z8+QeQQIFNevJWgSxzgaseK6ED5dQr5Kbl1USyDbUouKlAz8ppSO4f0AZu/p0CDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dTmMWnMM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFaCViHp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3ejJ3862850
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ku6U1TAYWdeDbP6BWOVyAz20SUrn2PsUHG+zD959VLA=; b=dTmMWnMMbfIzftKk
	sukqms4XQW1FkJwzrH2G+OLZAHoHuFDB20/cijVqXjKxBYGP+sJ6hBPZcHgPoPD/
	MPDZ4C7yUaVOUvaAMyqHIZDU6C16A0WYRRUhe+Fh5H/K4velNDkc145BhV0++Dsv
	hSSJ7nu4OpGdMk6XpbgaD1HpwKUCBTarczHwui6Yc4ajbQvAUsqe2mFoxA6ebSDm
	WHkoqs+AcwDgWsTS7e1izx65brRNxsp5GP8xjPeDia8fbfu3uoxPSwcvWUKaMmB5
	FXSuiuX7uk55hhpubkcT45o0pT3OJNKpsNDjzSPD0UGgojs6oC8UEuhMvd5Rp6cu
	kLY3Eg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjgn3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:49:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cbdd1bf8b0so82065485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462947; x=1773067747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ku6U1TAYWdeDbP6BWOVyAz20SUrn2PsUHG+zD959VLA=;
        b=SFaCViHpZIdMiNroz6qJzQBa8CEr2Dfaea035wYlEbvoPWlSF5T8+TUDSorWIMzuwf
         sHNGZiims1kShV+dFELx5H8ly4CqT2qDFBJxiyrRAfS6+7FucOWusaf9sXa4FCVwMAsX
         X/EpjLJA6jFfX1c9pO/hl0Xple8MYfc1e5pwJG7fNl5h4r871G+NGj7GfFj1cexm7YMt
         FujZUGqnY0aijQt6aE7/EtKQhj7PIJe7PmRK81vlLzxp6ZaGHC2P9lM4Unfz0oqeqdRf
         yaNyy5FQ6W9ZrCQz3K/hLdCLe/6SmfEJjD1iwTanEgG1DBcd/MZXx/J2FQI1b9LLXfib
         s+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462947; x=1773067747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ku6U1TAYWdeDbP6BWOVyAz20SUrn2PsUHG+zD959VLA=;
        b=gfef/eXXIDgTRbHm7iQ15DGBWS6KDWZ7aPLxfxNUK09JgXOCuEGdQM7qSHHLbU2e93
         CBHUWxTmbrGARJxvIKmBoB5gYFZmDwV5FNu6uVpzNwW0hHGQEPKSADaUMs+H5oqivQXR
         mVKm+Rl4MrVHNE1skJxOFU+yEWyAitVvW/qLn45Er7wZ9B5X3oxjoMFILwLE5pvKMKym
         ag34U2Ra9qtiEeg3OGpwNViSf0/5eyK6WeF5UZDqGWHJnr1GXZfAyb5zoXsUiwoyBXUA
         /fJjB0xBsYSDQnlKDGZodVtUmM9XxNx2YNU2jeWk/uc5oIdg9Qv3hCzbJajcOwK8Wea0
         V56Q==
X-Gm-Message-State: AOJu0YwdWaWQrQcJI5CE/h1yE1ZPVUyhSF7KVFPJ+HePLmpnkX92wgVR
	dFOylQoGFuGHm3PsjBajSNmjgB4xjNhwJT7pZXMRPWZi3/dXUEtQrzCu21at6mcV4rJEyC50eNM
	fbTSCNhnhVtdH3ku79qCUu9W+5/EFMERSPX1TpEMnXXDkFUeAGU00OD6ZV5F9HKqg343e
X-Gm-Gg: ATEYQzyTNGTbj766nREwK0QvkkZSCuL1UjAltIVLJ/UcL8fmyFVUstLwm0CcWc4BzCP
	0n9H8XiqSzcyHmFG60bh33rSpCN9CWYoE8MA4Ar8sDI4gsxxUs6LtqAp8Ba5/CLH6XkKYDzISei
	Yz3gx1CbKOUnGRJ7d57ebbQu8r9a434ZXwbPWeovbGcR8S4CQwQLRY2tZi5MYYE0iy3zMjNmKmb
	yt2N+c42KR84ua5bDy3BS1a7eVnt5UlfUbVF1TqkuZYHyjdue5jK2KVnLOoT1MMLJuyItzzTX7m
	/gG9sFOZVpFvM4ILc9UtMKkL9ChgxwrfQyRanojWgOhRVfWX30a8wZzszWHeEDyq6I4mHTLVnuD
	ugxTMkLiS1eXcGlzZQU+UutVqsL59+Bb+kIWUzyGKSJfoIerHta65TN3NBP5TKZIBjr98r2ps64
	slNjo=
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr1242342185a.10.1772462947387;
        Mon, 02 Mar 2026 06:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c7:f61:eff8 with SMTP id af79cd13be357-8cbc8f5a1aamr1242339285a.10.1772462946893;
        Mon, 02 Mar 2026 06:49:06 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab135bfsm479911566b.1.2026.03.02.06.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:49:06 -0800 (PST)
Message-ID: <b3538ff1-434b-4249-b4c3-e016feb31f35@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:49:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco: Reserve full Gunyah metadata
 region
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_jingyw@quicinc.com
References: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260302142603.1113355-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a5a364 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nWub8vrOtRhPMQg-7rEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EvWgh05JLV65qiKMOd9t0PwfHLosRFJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfX2HqfI3aeN2YD
 Ym/VceVHuwN3B9UEuE33c5sGKtuM9aQh0EnUWpesCRDDQwXA81++QZCTstdf82ZKroh7RI2aCo7
 d2vpC+pf84TwMqKxCBrsDzG3Eme6J9blBp7Ul/q7m+V0K0MldLxtpbGc6Jgrc3GPRsZpIRBJNIP
 e9dpe6htovocjCTtd3JDTaHtbZvB7FnU8ZkzMFKypooPHkLMy5AKJgqaWKiA5wx9zjUoZZB+kHZ
 lpZERsH6p4i7QLyX8oBoZIA9pf5ylp3kAqkWFFwUnab0Q3CUAhck2mDaX3cRivTghJafBqErAeI
 RqwlIjgFMMjCeR9HAOTefiBucs8eqdaunDGIcMRWXxlH3f392fI9CE76D4lGUzx3F9ScR8UdX6U
 Fl2lZP5yInaFChmOSSlApyOE/gqnAXnG3Qf7RfMtqHpkkm8mC0WGzwQl9uEPAplZhrl9jtbiOur
 yNpXU9olDwY8WNe0BJQ==
X-Proofpoint-GUID: EvWgh05JLV65qiKMOd9t0PwfHLosRFJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020124
X-Rspamd-Queue-Id: 7A9C71DB26A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94970-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 3:26 PM, Loic Poulain wrote:
> We observe spurious "Synchronous External Abort" exceptions
> (ESR=0x96000010) and kernel crashes on Monaco-based platforms.
> These faults are caused by the kernel inadvertently accessing
> hypervisor-owned memory that is not properly marked as reserved.
> 
> From boot log, The Qualcomm hypervisor reports the memory range
> at 0x91a80000 of size 0x80000 (512 KiB) as hypervisor-owned:
> qhee_hyp_assign_remove_memory: 0x91a80000/0x80000 -> ret 0
> 
> However, the EFI memory map provided by firmware only reserves the
> subrange 0x91a40000–0x91a87fff (288 KiB). The remaining portion
> (0x91a88000–0x91afffff) is incorrectly reported as conventional
> memory (from efi debug):
> efi:   0x000091a40000-0x000091a87fff [Reserved...]
> efi:   0x000091a88000-0x0000938fffff [Conventional...]

Please file a bug report with the boot folks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


