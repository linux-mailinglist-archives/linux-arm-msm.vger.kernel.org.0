Return-Path: <linux-arm-msm+bounces-101290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKJYJlDwzGknYAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:15:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB24378563
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85C993071ED0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D463CCFD8;
	Wed,  1 Apr 2026 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fX/uAAWk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gG0pjbms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A713B583A
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775037828; cv=none; b=ej8UKWuuCQ/C5BfCxxD1Gq2HslzyXFiBdcTpRmEtL5TrSeqHYpj9MxQU1oKOxwiFaMNIMtkdlXdbRehDB1oSQSTRCqzJnZjFXFN8ogKv2TrItWSbhpsbvRGva4WmQ/CWStXyayw6qCMgDMI+Ba0m/9r9sS4VP5xLEpO8xdq87Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775037828; c=relaxed/simple;
	bh=lsS53ynYkH/13C4ief3gB05YFg3r10XwFTsw+k9pbck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2T+sxwDXtHPTToB9+zKBmoSixa+jLdDdRs+PoHqUbY1uA6C7ffXwGBCQq6BLuE0aNhSgPC/Jzayed22kTBeFkbfvWSRshsEr580Em0Clerb1SP4HSSI6IWAOoPKC+BFiqH6mMehSBDNTC5lNUBo//ZNYeuko9EXgS2NuPi2uUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fX/uAAWk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gG0pjbms; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63144CMO1579572
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=; b=fX/uAAWkm+TeWmCg
	MROw7RHiEeHcIvgWMV0MmtTMmYR+W7LQEE2x5fTXPVikqGMrsR/u8eknq+3NVV5W
	Eg1fPnV2LFaIWqGBjYiTVrJCXFDDFAiH/ezL50I641L6KEMCYWM13b/uUwtetOEM
	DQ5HE9rDr5VlwBHr58q66BU65wWnIZ+VbW/iC6qsW+JwkGNvcdwzEdxmWqhE9VIq
	K6ua1iJXpS8HPoPnXHCYSjdTqSbBG5wIPlmutQ1VPgTvnf3BDZRvvx72PPjW6P57
	kJTYjmuaAAtjqZg11vaLeq4S1obJTSjprdD0lfEdGvRMKkpFTFzcdj+VqcaZAG5j
	y3iKRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2txud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:03:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfbd336c3eso254768685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775037825; x=1775642625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=;
        b=gG0pjbmsVoPHKWg2cS4iNWkYmtHO4QSAsnS8nWZAD0u1EjcIQzZyBaFVo1IWX8uEiG
         dNTsOB0/gYJGZBVti54WoSWNDhSRiYKK6J3wkgRiSWy/PPo5W3wyvyWptFBxRH6wddWA
         2FZr72wReLSH7M27mn6VzrwGCbuEP9roLtq03JVlKqQj0z3UICc/pSwLvk+ffdeDkbCt
         9xqwEO9PxADvSxSWBflCEynYr+62BwOauMdNUN9+60dSHLBV5FgbKzPXzkRjyC/NFyUF
         Zkq7kmw2JgRd8GYypJMbKhpNZaR4AP9M88Z1WMMeJTE89W8F67HiRkvoKSU5+Db2VYwO
         e99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775037825; x=1775642625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwjUJrGpN78FgjyI6AFw/4aUjqt9OxZcg+7oepy+CYc=;
        b=rPswy7xCvfpR33+cVQ/FLyR0OGZxegx4M//oqZMno/rVkaeaWqXua6ZEPEw0Zoh8gk
         RgFfQ7O+m/hgQRIoDpfN/6a2OBHLnpH+DRurCJwhbw4mqOyT0/WwhgBEifqt4PIhoWc8
         4oWvKqNp/fqY8WowJgmIj/khqe1igI9MahpRqOEaLcXfcwmDLpcq+qLp2i2CivR7ynC6
         GWX+qNksGwoJuthHzcrmGniHQnlYmEyHyaMImpg6nUjjhP8G9uIwKTa9lU0Hn9hubdLg
         L5yj1F6CNFcL2cLStKYH/II2y/Yuo089OesRB2GU++DjjGUb37U/g9gASi0FWJKYt3FA
         G19A==
X-Forwarded-Encrypted: i=1; AJvYcCUt5fMvq4675fTuyOY/4pLqjlmbzv63MrCjHrFOT3b2+mnzstAv5BGNQnKnuc5gOKIEHcPdac2lJcO3JVZ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+6xtXzr4KqNNrLGSL9GBH70RgPYZG7FWWyIWupw7NyCQTQgbU
	ULxcErM0kjlvX2LNHGKNeFfya26gMwUU9/X8qXomwFf3dFwP6e2GBQlZ7frrRu9GrUM/2XtaPkD
	U2HwhgSmnntDyrgGRfqSs9Pa8Vpt8ImSGejvRZ8QICYAZEtwdNzmtRnmnkRmBLdS8NZ1q
X-Gm-Gg: ATEYQzxxetgh1uyfCDZ7qZm+vSLa43FmGWTLDfIprN/txj28Sw5xBKrJbt+tMLQUriE
	32gSd59PU3qNfMTxZcBuXB3l2MnJkJcmcD3otXV7wQMD0lnw2N+LPaFT1YcqF4LCpahLke8iO+Q
	kERReA9Eumvd5MnJsz2/DfLsPHZjQweFCPexeRROcL3vjQ6/L7AwoMVJCOmXoxc+hocsQ95XudR
	XzS85AvOcLIS3RwlrkZj+YK4DCJehJ5hRhmXIgMOxZNYRY84JbEKdykdqzJHU27WcvfEJTTyozi
	nOyIzuq6zDZSKFeoCp+xyy1hzY+AxGKNEcacjQxnWZFcTDUS4PFlib8o04pa84UCVU0LIe+txAk
	mrJlhLqLAxe/xsijraB0HhCn5jb8qxeQe+6qUb51j+mV4o87X0xFKYiiaIoJMGagnhQixP9p1Y4
	rrJ0A=
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr370318585a.0.1775037825259;
        Wed, 01 Apr 2026 03:03:45 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:8cd:8b9b:4581 with SMTP id af79cd13be357-8d1b59568c7mr370314385a.0.1775037824844;
        Wed, 01 Apr 2026 03:03:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72a6ec5csm4272185a12.9.2026.04.01.03.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:03:44 -0700 (PDT)
Message-ID: <bcb49e49-9f9a-4587-b025-94979abca25c@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:03:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spmi: spmi-pmic-arb: add support for PMIC arbiter
 v8.5
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, Stephen Boyd
 <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260401-hawi-spmi-v1-0-c40963041078@oss.qualcomm.com>
 <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-hawi-spmi-v1-2-c40963041078@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cced81 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4h3_F-PqDEY_y8xvUNAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RQr4DjHK6xHcSW-uIICJ5J7h_kT39wLs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5MSBTYWx0ZWRfX6ohqitktrr1S
 2wg/PW2NclDtWb9bSCuMglDF0GRQn0w3Ap3IEGLn1+rZF1tV54uY3SXIjbVB4yhE+ySLZXPupGG
 aGi/T0rJoUIkZWVMoPNdF+ZqAiwMue1UnLcULBhLbrUvSTO9EkwX/LZl8o/Dar2uQ+q+k0a+3Za
 boDmgaFkCGS9PhxbvoTifhDBKRjJ8oJM+TXpKJ4ej/wIGK+M3xaWImM6bdhbOy6Lv8F32andbYl
 8UD6N7jmJwhwNZQqIERJS8RQaaMf51Ken2BzlwfyhXGuqvzT55p/UiKIDbCZB1hJsMDWMUBHV1G
 w2wUJTdn/uVYvy4ApT7cf/n77jYp3si4K2LmELc9bdmG4su29kZRIoGXTg2SRyyNqP5vssno9ME
 WojhDyllUTauaCFHEvpg0i1hoxnzLqcBPksjwXWlljYVeR+SFJMygvUbSQOgJGix9EDgMyJvmW2
 SyVyrXsyyCHqTu5LDmg==
X-Proofpoint-GUID: RQr4DjHK6xHcSW-uIICJ5J7h_kT39wLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010091
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101290-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FB24378563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 11:41 AM, Fenglin Wu wrote:
> PMIC arbiter v8.5 is an extension of PMIC arbiter v8 that updated
> the definition of the channel status register bit fields. Add support
> to handle this difference.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

Please carry the internal review tags..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

