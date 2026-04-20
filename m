Return-Path: <linux-arm-msm+bounces-103705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKYkJr/q5WnxpAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7F0428943
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36C73301A147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708DE38AC83;
	Mon, 20 Apr 2026 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qv+DZGYi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJcs4/UF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864CF385524
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776675249; cv=none; b=vA+l9PSh6ZjhBqb4eVsJ9aV/lSXGWkrnzZNdmOCXJ+plDOus7vhHQUcodio0O1m7Tvx6sZh7j9VaB5xOOyxCCnBbvDG8ZKqKKfBrW5O3U7LmCh1bllEG6gwo+59dLyvS/THaJGkwQyrqPhj4NXjTN5AuBP5amS1sW2tG3POqup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776675249; c=relaxed/simple;
	bh=KE8u6LRd9CjKfhNT1A12csPMZoYyQswGAVMslYJcMx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu55B6plTgqNg6Zgy/tkzdNXIgNcPOfKvLRRyNjsNW1QoSdMz6M6aaN7CZ4/w9LnSa3nIK0XqJwkOSrw8Wem1vmKyxaJ3yAJ9sgQBi1iQhcyQGytGn4oN8Vgic1W7Z34p7NptkFygKhZxYT8bUdzOYvgbwPWesskeeBoaM/BHmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qv+DZGYi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJcs4/UF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K79FBV1598277
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=; b=Qv+DZGYi+M5mMUQu
	3RDajgiimsyvngMJQapk71K1yyeg+l0y6syyuSyoyXx/kFXR+hFuaHFzK9ZT0KDb
	WJcjmlO3Ha9n8buSLc4txP9PxnCMrc1xqBun9t4zaGypHqTh2KT/2XjlfEMFb4yq
	jvreu6pUWrWNZOKHlPc3KqsTKIG13YL1T/yYvHBSG31gnsInRuKe0mSaS3FFcoPt
	gVKDwTGAa0GVspX1Fi2fkV/REfzfhwRCI3cmVt4vIFZ7l8KWStOF0yPdjXMrq6cG
	EgAaXelsR7fCmfn1Pe0ZRv0YnZa0Jp30F0EsKQOA5C0tx3LjMRMxvegdH2NEl2zh
	4F62og==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgngkea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 08:54:06 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f5f48458eso1571831b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776675246; x=1777280046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=;
        b=HJcs4/UFblyrYGkG31gTJoAqonKT/vsjU/SOCyDmfo+/5ob7f4sNnrK8RGPeSIn0Af
         69Jb3RyfFXRRXIdq0HwAdItWvYVNqUEQMaDbFqhsYkoxqJc9osK1p7EA3pICf+33lUzr
         KMQY+5zAS8Onmsb03ffbtZ2M3e078g5+f4bEhxwySasxGzAGzsN8uUibNFEu0OvktNK2
         +9c3mhZMPL2lfnGDuiKr2SkLfbxkRIY0fK78cgYvb8QtcadIWEttkeuIdCZqxj2+kSdL
         lbjKTC5B00QYSM4IK3IEWq50BcNKwxSIknLVO4GBd+OkhoVYWHAQkibB/Km7yvV0P+QP
         4uPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776675246; x=1777280046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm1OCK/m8zIZwWr4lJqnp8opm4PkM9TvhRZoct8b3V0=;
        b=MIcdTnT69X55fwsBuzCcMIWElNA2Q1a4vn/IQrSzQYny+hs6ysPI08nFcaAsbzBvf+
         +1aBI/5hQGsMIdoccpQdehOj/8ef/FJ9ipRXiJUiYTLeX3Ceab1yIVwCmTR0q9+N8HVy
         x/VEwOGeep09yNBna6WNKUDH+Z0XSynKoG3hhqFisUzEOLP3qa7RELIvvd3kfe9T9wCH
         gwKPkQlXbOj2fz/1W1IEPJiFs+0xvCxzVeaStqKCYBPBrSk4Ix9bzrWkIXDUpKQTDEYg
         PFSc+m+q1N5ib8fojIVWvBCNdMno6bvt09D4pOJqL89cYuSKSTR0e3KajntkSulGa9+i
         edLA==
X-Forwarded-Encrypted: i=1; AFNElJ9NgQ2krnH8a/VfcOnmboAikufuc/tl8qIP0qpyLk9lt0Mi0+D3q8gyEDLRtGuq/+IKybf+ULjhRFYxM/II@vger.kernel.org
X-Gm-Message-State: AOJu0YxMDWVZjPzHtHPPpeRKrLNxHVgBEpOx7H65jOsBb1E+d58NSTUE
	9rGWUfpQARMZqEyl9dnG5BM9CxlGoA3hSSQZWSTqNWIaIH/hw4W5h+QWSMXzKwB4pYNTPKT5/HA
	yZ29Bhp6tSoGryyfkxz0WxNBNAOlYPIY00E2mq+qLT5wC011hnP6tVV042EZGLy8epZmW
X-Gm-Gg: AeBDietD2OvmfybwXWJGZHRbSm6JjZIeEuqjQVFkjYDR1OxnhFawXOD+2BN6OfvYzxA
	IS4iRTfj6O5tjW96QLJzoxm611htCeouVnozZQaakXK/jbr+7UYsnTpHRf01d9EeorByyGW6aDI
	OQp6eDcbBPLoYkKKeE7f5CIlcw8Wv1XixeQzvIJYd8buXWjo7vGbpQrKBlfQmERykJAx1ETXE/9
	MR8tY4kw7po0uAM+8y1T1gCP66+kiEOAXj9/eA318o5OGXWQ0PAUw36zVZzkZBl4S7vQg9nWSJK
	FBgD57Jd+nG4Wb6kmgp25Z+YcBJUUg1UhdqHvLNq5eqwVjvK8T/YdiMmvq2rMnqw6SHvgwe9116
	ZereKNl20MadMo470lPNyCj4wS85UyjBJIN2kmij+KsdDidUBQMUQr4T5Da3b
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr12392277b3a.26.1776675246129;
        Mon, 20 Apr 2026 01:54:06 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr12392251b3a.26.1776675245615;
        Mon, 20 Apr 2026 01:54:05 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm10997069b3a.47.2026.04.20.01.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 01:54:05 -0700 (PDT)
Message-ID: <8b971e25-03d7-4596-a328-b8998458b57f@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 14:24:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
 <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <dd09f4b8-b0f2-40d7-80f0-bdd2cb382c65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OLwB1uy6aWmjiBHiaoI9o0yrkQv1Mi_B
X-Proofpoint-GUID: OLwB1uy6aWmjiBHiaoI9o0yrkQv1Mi_B
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e5e9ae cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UFEU4FUi6niC1vJbelAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA4NSBTYWx0ZWRfX3Dr67y6aIKWw
 h5WRv8CBtdBfN4dGSN5ihUb2QQbFHU8cD5CTuk97S1vXHoENaWXH+WZFrYBOgZMa5yrmG3ust5J
 9iX/R0MQoGVcK3PxnDyt9ZH5ClRqMsEu6H2OvUsey8/BSAauX2dWG4P+y5P9nDLdtwwqTWjJ0nG
 OtZQmHg17uCyHE97sIYJWSrXr3VhYdQkRHQrQ5gODsfBlEOpIrP7ktAFrkryFX95NCNiSWsYoPs
 k91pHUNwpk8B2bhEQMAbSwhfzBv6nEHoDcIG5+6nRul2dLhZC0W6E2UY0v2oWsOyD41MUKEfxcX
 KswSAjpaIBNB/L6b+mKkB5DYwewkNqBBf9rvGXESfimVNLas2oJi5mDTG5NwV+glWDRNTwlT8JI
 U7oLyWEFG10d4eHmpD7i6JwWPCGMY7tquyedHLmsskiw77FLjv8/C8VzyewD8HmaYXkljE16IWR
 ms5BKUyaNpmR+HAjCPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103705-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3C7F0428943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 2:16 PM, Konrad Dybcio wrote:
> On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
>>
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
>>
>> This ensures clocks are enabled only when the WSA macro is active,
>> improves power efficiency on LPASS platforms supporting LPI/island
>> modes, and aligns the driver with common ASoC runtime PM patterns used
>> across Qualcomm LPASS codec drivers.
>>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> 
> FWIW I have mostly the same comments as on your other series
> 
> Notably, msm-5.10 uses 50 ms of autosuspend delay for the macros
> (100 for VA for $reasons)

ACK, will post v2 accordinly

> 
> Konrad


