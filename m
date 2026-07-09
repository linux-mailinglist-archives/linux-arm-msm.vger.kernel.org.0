Return-Path: <linux-arm-msm+bounces-117984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2et1EwKbT2qSkwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:58:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF27314E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:58:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QRO6rqNL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=T6J2JnOD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117984-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117984-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AA1F3037A51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E672367CF;
	Thu,  9 Jul 2026 12:58:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452268834
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:58:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601911; cv=none; b=kPWlvJJAG2fHQqDMhdGBZ8INrUP5z0ZkzDjpo2Ian9yKZ550C2f2lRmpT0M9AV4LydVpNiVo8c9Fjg2mCVe1gGS6RVZbdolz34FA6BtVTMlfHKyXAdpYLMDFCRxxj6TbOaDAAa7JKuSQi+1WncjIiXIi63ul8iJwxI9BPUj4MBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601911; c=relaxed/simple;
	bh=2ncECmYmGOQWfSlXNAejUij+wOyeq+XTZ9+N+2uYujk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePFeVQ9As6k8pEhNJ/XRw7fAW71nAz73a83cJ9LmrQUP+hsQ5VpVnwKc/wLbWP0Sau8e/r4EhAYR1aaoI2ZfGCggJKPrOiyu6mFAkQS61eswlZRKNoY500bkYwKfOfad6LS6wXvr3eHqrNRfY58fpzkEScyOWEqgqdCushJ6sK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRO6rqNL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6J2JnOD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNSCi1672672
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=; b=QRO6rqNL7ngIgGWG
	nH0n7MpLDek89Qgyo3Blz1K2m2/sUbLwWsEDUjFyy42oMSg00tQDMo537C2FhCOG
	T1UaM9f+Rm+QYF5F2nci63FIqFkzmcslRqWQVHvD/Shq8b/zH+1aBY8rIMqN7Dua
	ciYb+EojJCnMQfrVeOvpknX3R1iqigaK1dL4bvOLT9x1XZNae5+8H3+Oip0ugasZ
	66SPN4RNPHMrANPv/vrvelv2i8kDBWYRknEq2tKVsE80jCh4FeOTmtqLydTGilLF
	n03R8CeU45slUU74D3Zfvmceuc6xrFcF3i/pACZuXc82NnN3r37S9Id9sCtPFSDY
	qUHTEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscbq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:58:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9c0c4492so56668285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783601908; x=1784206708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=;
        b=T6J2JnODd8SbPyBrFw+TKQHp+2h3AzfpoiNhfyYxAe9RYzrriOoFUTi0ZN5E/3JvpY
         9aLz7e3Fo10n9H+2RzB95UR6UM77vqDJ9g56pJyqVC3zojl35E8UgKxOfK2YTIxsnjPB
         ib8cxZRIIQ2WBn8W+VLZ8tEy2nidG6vwo61XiGNdfun1+TaD1qeZwTQAIwtX7jEPYtsq
         q2IdGG/hwxxNEpM4Mg5MTrbxw14QSocvh3iIOZeBy1gmL8fdvd5Qk09Q2DvGZkXsZyLq
         XbHYtSmXMQuk1J4ZIX9tTET+QHt4nhSXISluA+LVepaXoNy0Q8+KUDJ7pcKU5ejRBk2c
         3/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783601908; x=1784206708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6M8ToX+cI6vvxtv01dKbu6llFvdM/QyNtn4NMUQwymw=;
        b=GdyGlDx91nI3rR91LIav5SpB/nsaD6Od/cjZQf4FKDscz2+qYP5MO6xZXOzEOMMy4X
         2FSI++QqFPTIZatcTc/aEPEOcPmrLt3BTN1tS5k6/00Z8UmOLOynxcpsbT6zjAgMppZw
         /SvXsuBNB1KabRD2Xd83EyeGtT2zUrCyR3oeUPWNTjZNzCDh8hAaYDIREajCm2vXd1xa
         a17E/3GbYItyPWZYm2PS/DeLAlRfopvinMMEFuPRDgbKjzS+xUmxaVJw4QWoh7+41ZjF
         Nzw+kP8/u3J7Up2+IGFuSfhlKw+HhxZ3g8vPjfYpD9wv6eF/a8KArCx0F7fJR9en7gHz
         K/BA==
X-Forwarded-Encrypted: i=1; AHgh+RptN7cxVQxZlemmw/aZ4mdoY7rpwhFkwelIPBSiMcJCCZpCVz63iVR76K5KgFjBcV8hPZQNUb+haM84CZQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWJkgkiBeTZ4D1AFU4PRgOR42wW69+KCzithfzRDvyYHct4XZ
	pwGhq0tKcszZBBAmaMqvU3hkBPwBY3lTZrkL3nFawYBcWldPwIc2Wu8lx3zPZD3WXqG+orgtrsN
	7ss5HAbYt4bC3FGtdEuSbaiyo53xCKdkOX0Eh7heCwwv/PdIXVT+YdmGyKXZlZpwwr5T7
X-Gm-Gg: AfdE7cnddxJ5ABRWcd+3Js/QKXqd35V61gCKnc7j7EDQ0i1+sAGZnAU3ozzhiqBHZAB
	WeN2ShXxY00i66A2mUFpEwU/1hDXiwOO7Woy26azAjqc2ASAtVHVjXfWmSl5qMDLKZnmfMmLyLK
	wUjArbMNUGxXmQpFCMj2HX7cBlsMRWDUEKVMhoUju5A9K6aoXUifPthxowx6kfHTRQEpiXT1/hi
	Ph6Ps8RIKr0ugNAUqmZddieYaRxfaj+V1hbVfJhqBMermCzDRnObwq6toVRu4+SDf+EXawZBIjs
	pp57zSxOetQ128iyzypDGm9NUtIWSTsXtPLVyZusPgNP83v1pvO3lrucFoFb4mZM6l67WKiZvoI
	HCo17n1cCQ9RYdx3OtBw2Q6oRYHLL1OBTYsg=
X-Received: by 2002:a05:620a:178f:b0:92e:7436:5284 with SMTP id af79cd13be357-92ed7a1c5cemr287075485a.5.1783601907663;
        Thu, 09 Jul 2026 05:58:27 -0700 (PDT)
X-Received: by 2002:a05:620a:178f:b0:92e:7436:5284 with SMTP id af79cd13be357-92ed7a1c5cemr287073385a.5.1783601907084;
        Thu, 09 Jul 2026 05:58:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c6bd0d72sm296238466b.7.2026.07.09.05.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 05:58:26 -0700 (PDT)
Message-ID: <f5d0a902-5ff0-4591-bcc7-3cddb9f4d27d@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
 <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <21f13da7-94ee-4eb2-b2bd-6200d70f38f9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX4Qc5AYIbVMsB
 U8Rkxy2RRzdkCpG671gX4xZSBx+uymy6baU/jIzQBWRqTZntAHP1iMpc2eXxlz/w1e1l1gzVAo9
 OezNT83gvbX1o5QTyImQWZHauP6+bi8=
X-Proofpoint-GUID: D1Gf4rwqRcLZUWL0krttO_Yr8Zm7F7O6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEyNyBTYWx0ZWRfX0U83/1uw6Imm
 /9quUkaD210HdE0ta+i9Y/WPF2adRuY4CS7AopgGoHZ1QkDh7uWcW+M2rM8G54DxvR4Nt6I8lJ0
 utpYxIlRrb1hcKujBLKtuILaGRxFZgTLJP6J00XTlBBRZkb+7fJcw7jyJD5mkjnqnTFfbsirq0b
 d0pPotUy+XxugtzTZsZiCisAQf07ls31GsgdLrVcXQrGmR6LOq9tvXxVVRq8BGxxVjMIh3Ve5WR
 hEWcHZem8dewqsoX5XGvDc5A3+ZrnZi9mtUkCxEo+aqaWZ8dtlrCNerJEduunhlr+khtiUI1fJZ
 psqxtpk3t8FRD20a8ZjSF5eQKgxif7iEaJTIohs7Bzkqn+a2Tqm3UGKfnHe0/Ef0JMQFAI8j34M
 UDugtgGejHOtbVuYsAN6opQPO2+y9dwVWvwETxk/KAbw2H1HZuPrhQ8tgpUOE/fWCKOkz6PaVsf
 odR079h1ygU4KEAdmzQ==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f9af5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fz3elM8aSJ4FunxCNjAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: D1Gf4rwqRcLZUWL0krttO_Yr8Zm7F7O6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117984-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8FF27314E8

On 7/6/26 1:57 PM, Konrad Dybcio wrote:
> On 7/2/26 7:22 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>> based power monitoring and limiting capabilities for various power
>> domains including System, SoC, CPU clusters, GPU, and various other
>> subsystems.
>>
>> The driver integrates with the Linux powercap framework, exposing SPEL
>> capabilities through powercap sysfs interfaces.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
>> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)
>> +#define TIME_WINDOW_MAX			((FIELD_MAX(TIME_WINDOW_MASK_H) << 15) | \
>> +					 FIELD_MAX(TIME_WINDOW_MASK_L))
> 
> I am having difficulty correlating this mask to the register
> description I have available. Are you sure what you call
> TIME_WINDOW_MASK_L actually exists?
> 
> [...]
> 
>> +/* Constraint configuration */
>> +static const struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SoC domain constraints */
>> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
>> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
>> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
>> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> 
> Similarly, these offsets are difficult for me to correlate with the
> register names in the constraints/0x0ef3_d000 space

They are apparently correct, I had outdated information at hand

Konrad

