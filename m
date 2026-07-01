Return-Path: <linux-arm-msm+bounces-115677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lFZFDNH0RGr73woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:06:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2006EC8EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YwtKCkK+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YA2+BEPs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115677-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115677-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCDF93036BA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E669A43DA27;
	Wed,  1 Jul 2026 11:04:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A97426689
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:04:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903870; cv=none; b=V9VX5nNhVl+oWvH4vj3E7ssIMrOwZSUbjxCQ+GgWF3L6eILFehboTbf/bVu9r0ZAcDQQI2O0TSaCUB9AahAEXHDYymx9H0k4NhXsmHjCJY68u0welWIwhbOVYMqPIY7HfU1annqCxUG289jPSuzGi5Cp+VqwcqAHsXUyB3+ritM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903870; c=relaxed/simple;
	bh=ynoolOr8Ku5+Kb6BXtxvje213kDyohYYZ9HtzIZ3ZwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBHUPm+Hu7OCfXMiBOuV9vuoWh+PjRq31Wn8CpP/cpoJ1h1KSQmy0nkKC7dMkLZTNLddf/w9dnRFDZIql8VjfSpcmdClBcSJAcnbRxcfKXy0yZP0DeEfRFbTtbHeMLTKQJvetbWHna6J41jqrcEnk1I+PuDRmJWyAHJ2pijTX5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YwtKCkK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA2+BEPs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8qFA721951
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=; b=YwtKCkK+VtN1uI0K
	Ckdoepdh5kEHIOZ5TLSgkVyZTUmuNCh6pbYDWX3R1L4CSVppoG99gTvVov/BbUp3
	z3dzDvHo+jS9vEgjswEq9MbZJG9/Gq+6hUWKPJDw2Z02gkKjjRzTEFxPV0dekttW
	f8F55QaU32lZEO3kTv99VakOuf3hm5MXqX/Lptkb4huGKv1cQQEhOlo3m1JmpKND
	WsztR8mbWJ8teCni5143Mk8vd8x/XqmkRWrpIw3LjSMHX7NRVTrtClLtVTthOkvY
	U3w8UNUUU1z+HZi+KQyxD+CPqmMTIRZbnSbmfHmDzpmNm+4He/ZJ4hv2WUln5Ndz
	sfaQ4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbp47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:04:27 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e777a15so1038081cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903867; x=1783508667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=;
        b=YA2+BEPs0mW8MDpI4mojYmGparubYKEMnhnZsPkGwDqB41K5sKTG1t/oxT8HCZiRu9
         P+RuJLn0sgVZPthcb7dGFI+ULS7JnGkcWMSOQHmnvYzLuaoMDc++Uu36mLQ45OO32ldY
         9Ao45aMpP/BI2+HpuXYt1DeluUOTAfddoBpKHSkGb9U/LhBwAt5rghmXcxUFj0dmRdc2
         meNAQJHiRfGXAaW0bnfz73SgMtuAdeAs9kJ1A0o7+Y7ewIsJM9AsD7+d5N58T8fu9f/b
         ZEwiR5OQUOJB4em9gs7x50WD9wQLprHUz5+7z5opKD2iRu6IyiKD6HVTfsCQy4C6VWJv
         yihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903867; x=1783508667;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwYmI+QcmMAGLGhjINaM9pOWEfdjhWDfUcsOLnPEEOA=;
        b=X45bMKCFNa94aJmuQVLB23Xt+MGlPiaMfXUWAUjC0wm0kQpr/3Qzk/32Wdh59K9P3F
         qc/HYWNYLHNzBno/B3poanS8ZWQjus4jn3giCX08X/T8b52FJW7jb8Jh0CmD5kO+C8pT
         48Q+/ORlYw7Y9XUeA5tzLqsv+YYSeNWOKWhJHxT/aVj1DTJQghsIblqTy1esmJslpBvs
         CnX7Z951ZUV+fzWJ45kMF9yR7J5scnjetW6khQgkRqcPKIhbmxp1T1ro9XnYQHCgrb4r
         IHWurm/uLnMGS02UXiW8q63pqKOGI3w8IQ5vqZ7N4GOcjZL8Og/hg5bGxqRZ7cqBY2ZV
         e9nw==
X-Forwarded-Encrypted: i=1; AFNElJ8TJFNO0aJqgOwojDRZvfppSjqJkhN7xJva8CwVUvBkmIhRQp4a4nZXasUvDySdbTWFKvum/q0shtWVVbJi@vger.kernel.org
X-Gm-Message-State: AOJu0YyA9YMhEJ7R4i2WWR4Jfb7v8pT8uoUDiRsHZf2y2Ng2lIhBx7mw
	oyWKRDPq0jgYDy4mhCOw9dEH/aod8MeeCd8Gp2yHUN0THUIpTvu4UDih1uMvjfxoCbVhTohJMsd
	uUl0RnsrYpa2rD9R0agnfHyKcOPwuIhtWqsjOnKlv/ymsb3BfaKOKdKIRhcLwpqTuaM1j
X-Gm-Gg: AfdE7clbX8LHjXH+stlx+tTIwmXH+3pCOTBCfk4MMWz/b34Moupa449dJVMw01lGnvv
	hmQpRFIE5OoiJkS9j3Ky88WLQe5p+818FgV0QwibjeTZSI6DqYJzebpqm+tEgvQCzv/FU0fh24M
	LXA7jI+dFz5XVLtBnuBgGqPd3XAoRGvYphqrOyLTgKCJmZpgimSXgkHpGhoxJpSF7qOpPfjW8cp
	NqQEdfVD0Ne15iZwIjSctXOHHKDJl7l0zSFqzf2fBr9cnHClBr1Bxl6IPw7ptgjmsKJorNDrWCK
	gSOhCCIqFYEVd4NpZr2xsWHBE4p2LhPyjbz3vEuOJJkBYHtxBxsoZup1pPeXbvoPDLG+HXbR4mt
	Qfb41hINE7gc4EnXoMp3LyDSbNsxBy5pUrEk=
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr9946341cf.8.1782903867217;
        Wed, 01 Jul 2026 04:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:13c8:b0:517:8999:6c50 with SMTP id d75a77b69052e-51c26b25b59mr9945821cf.8.1782903866842;
        Wed, 01 Jul 2026 04:04:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12a5eed4bfsm59364566b.0.2026.07.01.04.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:04:25 -0700 (PDT)
Message-ID: <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dY3jinKllzWROxre215bfijy5NfBNhzP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX9ybjGnz9OHdw
 /Fgnc5EDtqk6WMm77DPBTqDtG9CFG49L0+pxbp7H/fVkQWr+uXtOtlg3r78s+BXJA8rnkjBwmOT
 gXI4n29JslzOwuySxbwwEbJub4708zM=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44f43b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ijDTMADtph2p8D2MxOEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dY3jinKllzWROxre215bfijy5NfBNhzP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfXy2EWeUXSBXGM
 SbJi76W8hN3gY+RDP2FNOuVom43T2so22rOxyWFxdmdd7Rz21C0rs+wyWV027OtM8ejqeTmzh80
 PRkoO7JSPzdgG2MREcaSBoAZcRHh1L4lCzAhzA+gshnMcMWWnD/GCFkTA7HqqfmFPLwo0nz9N9S
 7l1Kx3jeT8WDyoAu5u+zpdLJQo0kWiGwFUqB/GtPliqEhH6CgVdJ4IRL+fz4p/JZ2u89GUVbw4c
 gu6ZtqFD1C7TP6nIsNJPyBimBERHgtOPRWCgVyfdwdiKSss1t2spWbtkAvu09w0CLlBFUt/jZCI
 7nA6erBRv1KBHnuxCdy9hIBn3MtQOZDvafQTbgBN+q/2zlW8ZIuzCmmGHJXKn9Cub3bc7cQVkzC
 QPWUMqKrn07pHde4vNvbB67eWIdCJs9To87+MY/RpQxLGduPAAe6+uwd8YrLJuOGl8ii6vWlARI
 8vedi1OISE931foCC6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010116
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115677-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB2006EC8EB

On 7/1/26 12:57 PM, Harendra Gautam wrote:
> Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> DAI IDs. This provides shared constants for devicetree sound-dai references
> and QAIF aif-interface reg values instead of using raw numeric IDs.
> 
> Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> controller used on the Shikra audio platform.
> 
> QAIF moves PCM data between system memory and external serial audio
> interfaces through the AIF path, and between memory and the internal Bolero
> digital codec through the CIF path. The controller needs a binding so
> platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> clocks, interrupt, DAI cells and per-interface AIF configuration.
> 
> Describe the single register region, one EE interrupt, the required GCC
> LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> child nodes used for static PCM, TDM or MI2S configuration.
> 
> Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
>   support on Qualcomm Shikra SoC
>   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/

This should most definitely not be part of the commit message (which
lands in git history..)

Konrad

