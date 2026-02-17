Return-Path: <linux-arm-msm+bounces-93159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIdODGxilGlfDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:43:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6C14C108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72871302A2CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909843542F3;
	Tue, 17 Feb 2026 12:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEcMJIBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMLKL6wB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F041482E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332197; cv=none; b=DOQWh7An4xOc9oP6VTV1T47QSbDlE4/uRpwYw3+0/4zQt7FOvNhtLeyeSTb50B82bbDWV5tuJlcfIjOEUVEMU91AobFf+sSM0BPq7fBYoSJu4CnaZXFN7BbQ4U/wpXN85J6hwQgLoXF87rhpF2Xk/7FfkIAYZgGx6PSvIpZ1usE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332197; c=relaxed/simple;
	bh=4QHlZiAg2nr+h401QmtY+/NbyzOxnSl6KaALxYS8iWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcTgxxCrgC0w2mSAl20b3yZjaMv4ainJdVDE1g6fy8hDqLxHqVKG8imouheF+4BG5y0aFLEhcV4o6XRRWAxl1/R3pUONT/Uc8c18Vmoy7j3V3k/7RqVkPoGneTBwTSDIvjdFqVyIef+4wDe1/TlLTdoSJdkCCeD9HdJ4+92+5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEcMJIBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMLKL6wB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HC3hSs2470783
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=; b=HEcMJIBSybtdCLpG
	6uCve4e0Qa0ahXp2gdjODYBpeDZJ0uK+AV1sf8LbVH3lQu3cR2VDaO+/6XNVuq++
	NiwNxw8gZ+/i2D/BH03HUDE+tc7qqak+cd1ic+xhRNvj7YtPJ3G3xhvb0YTvABOS
	DhZMJ6FPV4vb4GTgCDGkIOGDx1DLd12XakNd59VAeoqNQLWj4R6Ub1KcQRk95cJF
	YuxxG4D5i7hToWEZkhZpxNLaM6aE6WFRzKTQrdtiseFkWTGqXs1hyDgueX60FTpM
	bc1pw+ZG/1tD/j0pVNYRSbOy5OIa5rI/+kDtNILt1EJC5+9ZNu9FPa7jrPfH//9g
	4VT7TQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6tma9a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-895375da74bso29023676d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771332195; x=1771936995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=DMLKL6wB3aUmjl/94XNkGrXtG6M9SRiFqHHIfqn84FJa47qHx8j40i0DC2n3R6UUnQ
         pIuwZGsNgMRScVcVbb5ezk/On9JEjrll6Wm8KZ+ZSPIVrrJNdV6bqHRUcaCZMlGaz4kX
         VK2uoRn0wy5kskCPG659wT1QQVN9Le/fVZ0cpFChcTXD7xgL47LCoByX9vCrl6Rw/w8X
         2G+/ejOZD/EwWlYVawnabCp7gPyFowBE8lba679WpQX/ph/Et/ePm0Xrs7G2d6zvuGhE
         38RMj1253GP3vF6S3X7K5CPfTlxX+uabtojNkG7t0JVJghLg+WXNKcwSXUy+YHF447Rq
         t+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771332195; x=1771936995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=iX/oYXLW9/9jeEWJMdreyeQ1BIWgxnQknsSfVzon+O6oFdP7zrGC/uPTEAMx6DNks2
         VwiMXQGwjaKZ6GcxRt9iJRPzjJkMPaOFIA/IqITkzDt8AUKI073DJxfDF7Jzqj7yvuZI
         mLPZ901vuH/xRobvWFle8gXLVSkLYvNSYYINRSdoK0LjgZ+G6L7Gb46fZS6RyYTjD8lZ
         aUl2a11abqaz83OudB29iVePNgg20lZCxKwx1UWJib9XxxlUpKLR4Rp/mSsMccT0gQnq
         2JrLS9ucbCuIEpmUDaO0vegNeCH1mFh3LHXEkxRyvnxpVrMJGCjtQxvV1nbctGQEHNB0
         JCzQ==
X-Gm-Message-State: AOJu0YxpjrijxbyD+uqr6uFb3m4rTzA0s6GrbKE1+WIwjyhNaMT4vQI1
	KqCWUw+fixMVIbetPFAAlhWUiMkF7tAbAu61q8qfgFqzbbxHIVyw/Tuq3RlImxyZcBS44tvMXTC
	r/KcfGMyttnYVaN2CCniIiIDOQZ5eXb7mKSHJgIIM3WO5WI7Yf3/nwr6XPFyhOMFCKsrY
X-Gm-Gg: AZuq6aJIZ+M7wDcjvthmvcjq9qIXNk8e7gLZOIUn+SAIoUUQuJgxPQsPEOJIB+RjLgP
	n7rVsC/fJ4RJspjFRYzBRXECY2g6qZvK1xDkQAnPAY8CtRuleZsr4Wz8icwDTjuaoCs6NkSR37N
	vr0i8UEk2UAzkx/vazkrYy8Pnpj8QLfhSE6H5H0Vkg+/Dr5qZoz8XNE5ZOxPn8k9/MdrwP51qBd
	ftjFjW7NPfQ9t007F86t0qTN0c8z/roz5dm2iFdd3ceFa6hP/z4Xr3nd5cTEEGu3dAfbYucXx+i
	7sIsX7FipZVGpLGoLVZrZbduvi+TsE0jrMra5BwH9QjqMztZmZgMkS9imjAR2SlIbFB6F5LKnpE
	tJlpOrEosIt3BXmINH4Cvi9xmq6ThBeYB5wPJgwu0f4cjmca49WhmbETKE/QxmoDQsRHdoW8BhZ
	SB4/0=
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276632785a.2.1771332194575;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276631385a.2.1771332194210;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385d99sm333776866b.17.2026.02.17.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:43:13 -0800 (PST)
Message-ID: <e8eb2a60-d0d1-4522-a70a-84386e32ab1b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: Remove inexistent TCSR_CC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
 <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JyvYyGyo0e4FO7XG4o3eOL2_xZKD_oZs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNSBTYWx0ZWRfX5H+sKKEIhSAK
 vbEkj4QtW/7B7KcmRnQHKrO5bysHp9tnCfeFAQYsbL67LsaBtnllcmrcjyPgrtKUgS3c55+YQyM
 TS3qbmKELYu6IMR0tJ3FfsDVrDrM/wKIbWXZ7dNuIgid5bdxulyPUjA+N7gogk4irFE/HybQF9V
 Zvv1uMG08uyvjKqNB8768ncyylvK2M/QHtCLffwLD/X7LEW4/AMV420INHAZfCnzumW9kjkKntZ
 d7qDlVbIFOOKC87Biua35onk+BHUaXpb+r2ttwfkXKTTm802ZSdyV4w6HZ37fLRZG0N5c9EakvL
 OhQ8/LcDjKGfMQhXCUsS6kqu8mfjZsLjbSADljw8pJPaF/LeQ+3QHDhWkmMvd5+o5D9YJmBxGBT
 NhjCAFRM6NgnyyC/YavSL4/nmg7WKZybmH2yM4QBksm3plmFQaqbJUcRwL5Cl3GVzECZyBsa9OU
 lnv3FGmEx+LtCFDokFw==
X-Proofpoint-ORIG-GUID: JyvYyGyo0e4FO7XG4o3eOL2_xZKD_oZs
X-Authority-Analysis: v=2.4 cv=IOoPywvG c=1 sm=1 tr=0 ts=69946263 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HEtdb3PhFzw24E7G2eEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93159-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,noautosel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EF6C14C108
X-Rspamd-Action: no action

On 2/17/26 1:39 PM, Krzysztof Kozlowski wrote:
> On 02/02/2026 15:57, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On SM8750 specifically, the block which provides various reference
>> clocks does *NOT* live inside TCSR, but rather TLMM.
>>
>> With the former now being able to properly expose them, switch over to
>> the proper source.
>>
>> Now, the TCSR still exists as a block for various tunables and
>> switches, however the prior misuse resulted in its 8750-specifc
>> compatible being already in use. With it freed up, it is now free again
>> to be described properly.
>>
>> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
>> Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 22 ++++++++--------------
> 
> 
> This will break all the users of this DTS and commit msg is silent about
> this. It's also silent on actual bug being supposedly fixed here.
> 
> So again - as explained many times to other Qualcomm engineers - you
> cannot just break the users silently and without justified reason.
> 
> That's RFC, so maybe you planned to rewrite it later, dunno. That's why
> I did not review the rest.

I assumed the explanation in the cover letter is enough, but I can
include some more context here too

Konrad

