Return-Path: <linux-arm-msm+bounces-117753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sM0xIPhwTmo9MwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:47:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE66A7283CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:47:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BgMEKQ53;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ihNobtFx;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117753-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117753-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7D13250982
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A282D249E;
	Wed,  8 Jul 2026 15:16:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783037BE7A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:16:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523774; cv=none; b=WhxU4mZdTQCacYl+XiifEzPPKirHaLpzXemTzgA4Wdn6ofSKe8uee0Yia8BDeGEbpGWt02PgkkrA27y7kUeptRfpNocfQ1Lr4hhZ78ueY21oI7H5o+gvbEXH43hOSqm3H7g5aFI1uzsNFD55/NznpjNb0iwk05X1sb5LG/sZHbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523774; c=relaxed/simple;
	bh=p4j5G4quTDHyGe3b3amO9/mJmZjRILpAnL7eDql6WJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGrzH6symNxGKjQrlIrWC5vrBLgv2Mnmc5jweru17uRV4hcdm52zaYQBsPkDrIHYNCrCLVaBG+UskHCB3DnNO0DeTYhd04CRoRHVA+H3pBFuIZlixr6rrgi6wE9dwGR5rm+YcVOiSq67NECmaGLrU6Ch1xcNntS84tE/1fPQyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgMEKQ53; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihNobtFx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3LsZ2608008
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=; b=BgMEKQ535wUP+Vtg
	CU/KtFdphTQJZJ86inIpvODazCp5qsmoX/b3C5E8KTl9Ipu9E902d/QTHnQmPS8w
	KGVuaAH50HN+9f31+IEHRkEaEdSJY9at8KYej1cNx1nNnlzwixTzIk/KDk4BJ5Jn
	6q0snjoTMIjCMP1wI1Z7x6on98g0cdVKeDgs8qCyykL0wsNIfZqpADv8n2GOoIm/
	uUYORG6ksSHi1bm+qi5IrJU6c4tQo2VW79t306Yl0uNWlEW237nul7uZevKKvp3W
	7zF/YaP+a6HekUvkisBzl9SkNBIcHlsTeU9PzWgtsa5t4AUjUsSZruA7EafaXUa7
	Hg1TBw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5bbvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:16:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccbb61893fso22397905ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783523772; x=1784128572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=;
        b=ihNobtFx7FEpt9RXshzRtykkTm9iGb2ure3mOdW3ivzvk5BJDZsebbwmQ8BYiJrQKE
         ly4dPE+NfDryPl3lWnL00aANSICWr6WI4LXWTl6qdoXw/WJz/iZbZ28lHFBbpKmarRQZ
         AlhL6sIgOkUuVwPJyMAO6OOIOKekbQ7lHlzBL1DJHFGyMyoUQ1YZ9UgtVIAYC3KIH01z
         mPouSYxVNOFhfkzOVLBrjSY0XXaBLLRpWsC2P5zA7kp3u3eEp+W3/UIZOxuuPPpNbCR0
         LkViZcDTdhyImc0Jft60Q4mAEtwiwOHYII4fejJFLoiQ4mCGbaIUdoOPcnfpiRTdEvG2
         EQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523772; x=1784128572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YaBYtPepMdqaWBjSOuHgDR7wn2sbsIujCr1femId7w=;
        b=aDe5BlVZvfsKK7nUhJU9aSs/Y9DC+6m19Y6bVcRPi58PsxMqbPNIhkr4T7jiYNBXug
         CRgf/gwtEnQlF4cvUntcuhohPztkfjIl6h3b7us/LfQGCD6t6Jqn/V9MRw9LqXvvbwZZ
         taDEDsM4JyUdhrFsgNgSgwOVMKTTN+t1W4dB7Nj5NOavI2aoFoY3K39wvMKli6RgloJB
         v4lSs2OGYOvHlQo2ZYF+0weihG9+H+NyYDMryk4mAVfFl8RDQS5Icxa5U3aXoRNHiOB4
         UQgBqVCriToGN7+ZN+zS3PXDowZykCeCEilj//uSfizsJaRwp0O317TSWD6fr9ofW2VT
         Pm0Q==
X-Gm-Message-State: AOJu0Ywh6O9WzV7wPvXorPBZxniMQVqVh/uYT2My12uc4Xm5qMnDbx5e
	g9VD/t2GL22dgShQB7LNHTrk6v+WQECv0U2rhqInM8OZvFpIjQXZepRVeDcmOiEjJ1SMUuzGx7k
	vSA/C7Zptf89ahTBQtFMP0gKAUzTsywljyHo8tYdAFtKQ9QhpSatwLZa+IfiPwZ2WhO3d
X-Gm-Gg: AfdE7cmUl79RveyJpsQz+KMOj/j3Sy2mCxXeM1/UqhnT/yrp8sMLzwfGVed/RwJRYPK
	KOH2yqMlMj1Dd3VFcWdAoZ9UoqVQ59NP9dD2tpn1igM0YMGEzvavHJ9+tw4wFkW3cEVTy2WGF2b
	W4Dsz7l0KSn2f2BR0oD6gvkoHaCqMru4QKX8l/8tcyuENQVhlOvbOQ/STI8r5j6zkY2elFTcjGS
	9/hngJunVkUj595LeyGzLB24Vt+vnTG/zD9Vhf9gcMnXpYll/tUUwWfdubIj87eZ23XJi6k5lxn
	ALSxwd6KZ/I+CyroDSC33yD+QNjpl++DwlyWSrw8SqxudyJQXnXrwIr1JKxLtwJHRy6Tm6k6tHO
	5YabKsqbtNF8swqq+WDR714Td5mO1UPQo7YopblX+moiLGp2ADp7y2GZzUA2u7cMepLceLGwosm
	MhsA==
X-Received: by 2002:a17:90b:3c8b:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3893fe5b9c2mr3633434a91.16.1783523772272;
        Wed, 08 Jul 2026 08:16:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-3893fe5b9c2mr3633392a91.16.1783523771782;
        Wed, 08 Jul 2026 08:16:11 -0700 (PDT)
Received: from ?IPV6:2409:4091:c00d:4a15:d9c4:b604:397e:f06e? ([2409:4091:c00d:4a15:d9c4:b604:397e:f06e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm20954746eec.2.2026.07.08.08.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:16:11 -0700 (PDT)
Message-ID: <916c7405-704a-4487-aa2c-824933ef8837@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:46:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: stats: Add stats compatible and config for
 Shikra
To: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-2-0aa0ec1fa83e@oss.qualcomm.com>
 <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <91fc1aa6-b237-49e5-be50-87d6a06c6bd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4e69bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lW0qd329ZGhoXQ_XPREA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfXzl6xYSWk9LxJ
 1FHo1RNqBwRXsMiviewcfpOKMW8/PEYEa74c2QSU3QOcBUBjSPKolX8keX1yjq4hhblobVqUJj/
 iNfx28ybBB/I+cfUVt+nZfENwb2ImYg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MCBTYWx0ZWRfX+4k0QX2HZh3n
 +2KNRCh40bNITI4OhPmR9gkj2LzhdE5CJqC7/ZKGrMaNmC/Bfh7mcKNxNzrbD7IxPYSw1PgbQPm
 UNN3yksSCzvo+0ZSIwCw3PCUENA3vOM9gLkItV7eC8cz9Al+rS2OrsZfIFeWmvmV7abX3L2GIM4
 4blWA4paWFNCYSv2AIQhw+h46KlOcX2n62oHoWLVz2tC0X+E5LkbfOKMXQDQCjgfLpzFyhKKmZL
 dSnujnT4rNEgKUofaAQ5CCdZSthipUWNndbOSObctK4pJW4E2ueyUqKUbomGP2csxkxLef/OJ1w
 xWgJy9AFdoVS16FY9VNMCoxMQsUOijDayHhjAHytaXOn0SDooE4PY63MN6+4FPs3RA52JfjLB+2
 iR0byVDRfDdBx55tZLTlZa/Ul/ZdIZsQS+n05IyZT6t5XDrzJaDnCrVNKwut8OMWCXjh15jJJ+5
 47BbOkMghrHyaLHUiDQ==
X-Proofpoint-ORIG-GUID: fVqN-0oEDeIBznFchizeFfY-GOrnau1I
X-Proofpoint-GUID: fVqN-0oEDeIBznFchizeFfY-GOrnau1I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117753-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE66A7283CD



On 06-Jul-26 2:42 PM, Maulik Shah (mkshah) wrote:
> 
> 
> On 7/3/2026 4:43 PM, Sneh Mankad wrote:
>> SoC sleep stats are present in RPM message RAM and subsystem sleep
>> stats are present in SMEM for Shikra.
> 
> minor nit: use RPM MSGRAM term in above line as well.
> 
>>
>> For earlier targets using RPM processor like msm8974, rpm_master_stat.c
>> was used for subsystem sleep stats since those stats were populated in
>> RPM MSGRAM.
>>
> 
> [...]
> 
>> +---------------|----------------------------|---------------------------+
>> | SoC           | subsystem sleep stats      | SoC sleep stats           |
>> |---------------|----------------------------|---------------------------|
>> | msm8974,      | RPM processor MSGRAM       | RPM processor MSGRAM      |
>> | msm8226       | (rpm_master_stat.c)        | (qcom_stats.c)            |
>> |---------------|----------------------------|---------------------------|
>> | sm6350,       | SMEM (DDR)                 | AOP processor MSGRAM      |
>> | sdm845, etc.  | (qcom_stats.c)             | (qcom_stats.c)            |
>> |---------------|----------------------------|---------------------------|
>> | Shikra        | SMEM (DDR)                 | RPM processor MSGRAM      |
>> |               | (qcom_stats.c)             | (qcom_stats.c)            |
>> +---------------|----------------------------|---------------------------+
>>
> 
> [...]
> 
>>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> 
> other than minor nit:, looks good,

Sure, will update.

Thanks,
Sneh

> 
> Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Thanks,
> Maulik


