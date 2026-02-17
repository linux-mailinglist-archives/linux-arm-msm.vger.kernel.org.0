Return-Path: <linux-arm-msm+bounces-93122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BR9EXJLlGm/CAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:05:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C8C14B23F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43E7F3034A04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 11:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD3132FA34;
	Tue, 17 Feb 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DeVrKWRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvHrcRFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4904A324B3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771326290; cv=none; b=JtNwkTZeMgwleH5v6Kjl2rkzuLVBYClV+COfzLvE1rnoUHXH1V3BmBgyIIvdBnN96fJFr+IU+QL0P44HEFdzatYq5MLC5qutE3YGG3D2vrYKYs7GTvYzYKDkCvk5vdznDtRF+EyXd21C+XZfTJRAr3lnaMmzRO1Md2YF/nlgnLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771326290; c=relaxed/simple;
	bh=xjFZ0hdn//xg8PEJB3ItjmhQ6igL7H1mvyq0vdtLNFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhsUCrHo6S35crIsoH2+QDnfZdk7m3V9g3EjYAC8WU9FVhs1SN9pxO2iLfP+Ci5bUK0yZuAXU0eMRs+Bi8sT3I0oVwmrnrNdeVVaQLNwF0RXVmbyPoR9M7H9Xtl4emKJD2S4ujGeuLnNsWMq5Hv87Dt+9SijkSL6rfbQuIixwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DeVrKWRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvHrcRFd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HB1jHL912069
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=; b=DeVrKWRJhzoLyeyK
	OaaiE9n6LFuQPflGFu3lx9temf2ICinDQ4FwIAI3GDNnIsi8RWdPC+YLofjgjY5o
	mNeMalVMSwo1nzLt9G5dULwr/aJVoA2ijNLSFvt/7W+fjhHkcPgHrOTA7TYsqxtT
	yTpsFKpUTIkOMGgF5+KxmXfISNQc4EzVW+HEtudQ/cnAj4AUfudUOL+QN8ihHGzT
	6Peg0WMZR5cLp6F0vL9X4nBVi6tikrbMvZyTSW21Erdd5BFxRNixRl2P4r5APnzx
	Pvc95KWiyQnpd0NhV1wvD81euvsrNgvHd5EhzG2eA0AuVBZ0eWY6tzIbXWaxBnoH
	Ofs2ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t280-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 11:04:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38346fdbso331650385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 03:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771326287; x=1771931087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=;
        b=MvHrcRFdHDvvNJ9xEdUQOnP8iAL1j9GRCYw/hmsSzmmjtqFzLYbZwjadboZLTUAf4B
         NCM4Y8n4ZwufQa23CqN6B30lkOu73/Hxgt/FRI4QaivjVasXOuSXoDV9BxpqtcxvnorE
         VV7dgWpayT2sqo0KyCY5q5VbHEvV3zaP5dHF4MCSm+g3tAHhv4jcbucexxBPPNNiztwE
         RcFD5Pgzu89eZnPO/NNqqV0329WIReJwLyPE9dKsXwCjUt74PpR+m1G1v2FzWZMc7iAo
         cm9edreXQR3CRj1MJg/FO0/715QNO4apVfz36Fk4zyb4x1ud/Qgrw1hTRiIY3gSTnjmM
         h7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771326287; x=1771931087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NcHRxKrlvKBVnphKgCb+nLvOOviQuVyE0fhb8p+XY3I=;
        b=QcnXquHQKce0VoyrLaW1kOiBgB9TtHaZ3NYT3kRY4jCfTK3Zz9ssP+DklCDGXo0uSr
         q7pjV3NZyM2BjQYg4lbjre+/bqD6KHtuwW1R3fYGYZIA2cum94qOpkgyE0Fj0F8OqDHg
         +AP5dcDrsh/GDnnIxR+Ln1Wds1sGtjM1Mb6kMvAM98huhOpyK3XJYremnmWtgHFEvGKl
         6OwsqmkKwbatNSCq76qjGQdg3BYdv3vtG/5fkiX+e0KQw3B2Z0Qf+6SUAp56BD8sFIef
         GgS5CBhp/BDcGDQPrXT5l5yBAr0fDUpDEa16jtjQTh/R6kSMDU2ERWDA453nCcwuWS5q
         kyUA==
X-Forwarded-Encrypted: i=1; AJvYcCUFlREejkl+4McpD4ylFXE1iM+LGvO29d6b02bULoe1tgTZ64zQXxAWsaxHS8pu06KFjzxOH6d1aPOzg37Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DzXVYXJd9hcgt6k8JRSiMH88iDcFip3I4AtxN0jTikp6cCD7
	amBBy9VNAyaCMG5gvbAD5UZILiBoWYRpiFwG3eRS4V+d7zUBm+PzZ+6VU56Xe/9wx2cG5xR+GD7
	2fPV+XtfATf0SdWy9FB9rX+n/kWKmwzdK4C8wWLJ9tWv08tziFua+yl32j/8M03ZPeB/N
X-Gm-Gg: AZuq6aJU/gtp97oaEMB2bbu+2Hm7Eu3l9eddR5ai2r9+4Tp+hOX0TvIH0Na1yb/jjU6
	CdD62P9St0/wL/pOiC4xCF+qb5UxwJQVNQ4CFX3DJE1DcEfYeu6YXHx+aMfKMTSPqKFHynbC2RI
	wzGZ/QrZRouXS2kQiriNckrYJrlhmluEZAAKUQlRW/UxFQuORwvdIEhM8nfpWdcWD+QPr0REVp4
	fRuj2kezO1UsecF8qcNTClUbSc4BDyeI24ohh+c3cIHQZmj1qelHAkhk4CoVaFqQL1/eVSCDwv+
	mF6CfhISLqY2Hp0mdh5H5SlwrDM7cGaD395kX0a3oXkYCChswv8WAECQw9Q4ODsJ1BWQ3ZJ078k
	gCmitP9AKf3XTRHLEsfQTF3bUVYaHM7eAsIWvnZuBcURcMPI2k3sNbuazswXtqmPlrmD1D3CVoP
	9AzoI=
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1405258185a.1.1771326287333;
        Tue, 17 Feb 2026 03:04:47 -0800 (PST)
X-Received: by 2002:a05:620a:d8a:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cb40820215mr1405255085a.1.1771326286867;
        Tue, 17 Feb 2026 03:04:46 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d1ebsm337347466b.3.2026.02.17.03.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:04:46 -0800 (PST)
Message-ID: <b6642f5e-c890-42fd-a733-c5ff1cc95d25@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 12:04:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add initial
 devicetree
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de>
 <20260215-wiko-chuppito-v1-3-9ee6b89606a0@posteo.de>
 <f5517032-202b-4ae5-a8bb-928144cc5771@oss.qualcomm.com>
 <aZRJb6FVi6B-fgWF@MyryksLaptop>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aZRJb6FVi6B-fgWF@MyryksLaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5MiBTYWx0ZWRfXwU8zSBWDqwRZ
 IKzap1xUwb7U7qRx6Ua8dejW0E73VrmTDYA+iJuXsGOw9Zh/I1kXSXduUleXaDEzswTuyLtgfrJ
 S61gooe2h/mzeKh8l0zoSCCaoM64/aGswEKTHYIYg/xSCJItKVUpMY5ECXoUfcc3/uZgqlkXJnm
 UzYEKPUCxaoP6uVmDrBNkioCXIW3undn9wiy7VSQSvgQZO6KJNjduz/Au/SrZcTBKNEsWjzSIqE
 J4Ctv7dPy4lemxYua8j5wrItNwmoTtYDX+3MYT28bGlHf6QOGpDajiCYjrfkVQsCjht6mDOofbL
 lRezqtsz9H63QYDZuHaWpTGTmxDNLab5OIsONVESQvPOZUd00411EGjbxVeI3l1PnxZKUpCZ3xO
 RoH9FsMdDnK5CtN7rQjTQKMNmGlacr65XLpkDwrZjVRVubSJ80btNh7oTCMt19hb8zwCQPvQBnf
 Aj8cqy1txmMtpS5rO5g==
X-Proofpoint-GUID: 1naiglGEm96XR-yMNrwjAeF1mCQ5X0co
X-Proofpoint-ORIG-GUID: 1naiglGEm96XR-yMNrwjAeF1mCQ5X0co
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69944b50 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=sbB4V6NMbHWj2XBHrEwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.105.105.114:from];
	TAGGED_FROM(0.00)[bounces-93122-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.222.198:received,78.88.45.245:received,100.90.174.1:received,205.220.180.131:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E1C8C14B23F
X-Rspamd-Action: no action

On 2/17/26 11:57 AM, Paul Adam wrote:
> On 26/02/16 12:18, Konrad Dybcio wrote:
>> Hello, just a couple comments below
> 
> Thanks for the feedback!
> 
>>> +// make sure gcc is probed with display disabled.
>>> +&gcc {
>>> +	clocks = <&xo_board>, <&sleep_clk>, <0>, <0>, <0>, <0>, <0>;
>>> +};
>>
>> Do things break if you remove this line?
> 
> I tested it without and it still works. I just included it because
> it was on the pmos msm8916 mainlining wiki page. 

If nothing breaks, let's remove it :)

>>> +
>>> +&gpu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mdss {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mpss_mem {
>>> +	reg = <0x0 0x86800000 0x0 0x5600000>;
>>> +};
>>> +
>>> +&pm8916_l6 {
>>> +	regulator-always-on;
>>
>> Is there a reason for this?
> 
> I removed the always-on property, it was for testing purposes.
> mpss_mem is needed for audio to work.
> I removed mdss since it is only needed for the panel.
> Should the gpu only be enabled when the panel is added?

Ah, I only meant the regulator-always-on part specifically

The rest is OK, including the GPU and MDSS

> Also should I wait some time for additional comments or immediatly
> send a new version when all remarks are addressed?

Normally one would wait some 2-3 days after sending. Because we're now in
the special part of the cycle (post stable release, pre -rc1 release where no
new patches are accepted yet), some people will be grumpy and actively refuse
to review your changes but I wouldn't pay too much attention to that

Konrad

