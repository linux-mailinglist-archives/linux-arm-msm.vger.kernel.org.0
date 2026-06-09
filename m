Return-Path: <linux-arm-msm+bounces-112174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rudkJ3kVKGqe9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:30:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470A66091E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:30:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mu4ip5bh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PJ42frEx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112174-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112174-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E089C308C5FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E5928C874;
	Tue,  9 Jun 2026 13:23:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367782836A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:23:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011439; cv=none; b=Nm2KWZ97gI1GZ3SXpf9vc9o/0nHDqYzZrxfXqoBPGMVITR6AbOLcvdIURnk07z2d9gXKG9SxThtox5M3OAX1PCIj66gm52y4krjhanO9Ln924ghHvNjXcp/hAvtlFoF7EKVcmxheqOos5S+jP1iQOX7AJYTno0E+ByHPU1D7/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011439; c=relaxed/simple;
	bh=KRYfsk/GmXVNGtS/PPsItrFkz/Fpb7nExo5NBBcViYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/rQ+8KHeDBGhbegfHgNBpTmFZqZ+woTGMtzHbU+rpRq1Du2VEQfy4eocw7cVyB0rmlmNcuiypLt6l+td2omcK8hQQLXVQx22JUljtNc+F2WtPAVnlkLGC0E7bd1dGuhAD/xaDuE6cemHo895dzGo9s5d5ziQQzLqYTB0bwb+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mu4ip5bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJ42frEx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZLD2183119
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=; b=Mu4ip5bh5bQSCRnY
	ct82BbsltaP526UqST9WoCQvRzfqexnIlzzvSR6fFPkfqYX7VNyQ7CNek93y1DcL
	KmIghn4bdmmgRofk4lhp4IPi0PpSdSQffnYnOS7s5/T+lFyPcGnI9dpIdknvBEol
	dVxRAGQc99DR/MBTnhGwDY9tbEZC5I7ObhdMQBIyheKc8g5D2bHml8BBoT2f3a3e
	aYaVIDgsA1TdI3CCAdrz4e2vLVITLOmjXN21mSSSzuaYBWzglCwSantI5q9qBRJW
	88w/4KLNaa7dWJPAmPx0pzPDfg6JPk+H+Ay7GlyHE8PBl3fxpjnsqYuXhosYJgtF
	EKoBxg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epenr9fau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:23:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423970cb30so3594175b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011436; x=1781616236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=;
        b=PJ42frExys0h8mx6NR4gA0p4UiJksx4KbYb9+GZiyAybBqXvXhsAKiTHGeHMyTjeC5
         pWQPq/dMyHqcCWekWz0pVu8m60k5hZEuFbC1JpmLHwPxLmfzZZE9VIq7OdNPr1XwtA1h
         Red0fuTEeHURCQtCIneEOe+wOn27hd57YyNB2ep+WM76h69pDLa8w3R5dfkmIT2ocRKW
         cD7m6+wJ51Xl8P8otRggtL8rlpeSNPEqkdH5dLaFpgN5FnfPbi7HLaJkgczcDx4ddTQh
         5/kRvWc+hsZga+YmXL7UoBOW21Ky6y4n61MrvcfTvlTVIVjDdcB+w6gN5OEib6riREdz
         16JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011436; x=1781616236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkHFj6Qo495pjgmFOkOfPVQH0xZPeXZfvpX0xr+9B2M=;
        b=pfmQ3Qde29GnfT925Hh9SWVQjJg2ojnIBXIhP6w+gSlh8SdIERvMFCmJ3l9voMkL0U
         ovbJwm1HYWCyLljlTmH++WSoJAF6B0HPPj5b1CaMd7V9BZqcX+5khg6genWEXJp/AKQa
         4aW6lovkAOhCD+EzhO4bapZ8C5W28nQDj/4OA8TU1A2EnLjjGtUEkXdiUV+cytWJ/YgJ
         L0g792eD3uLogyhb+kkesCOopvrB1ZzAQkKJOQelTBiNo0Xx0xvIwKC8CCGyRT7zTdmg
         rH1+tXVyniceIL5r+jWAZfMm6tQojbbb7QpEnr6Rs3pGRxGTVSW4m/xyDj8HryiS2ZVe
         sdQQ==
X-Gm-Message-State: AOJu0Yy6JXE6AQgIafoSYa2kjJuo6gZcKxbTkKWfLp5D8NM08LuhFgzJ
	Ve/4LJeLCdvjKnaIgqpINXCh7+Wc2LdJ12LlRJ0Bk7OapO0GUpbKv9CJsxfC7cx0ExjFC0c/iM8
	EkxH9QODyuxh4X3LePJ5yJrgIeYjVOrMqxUkhl0Ljfv5Tegq7JAxTS7TDrddQSy8uxE1Z
X-Gm-Gg: Acq92OHk4gDvUzjIeIvHvUntXLsKjzQ97FGsIbdzqYsISFJREDVIdBk1E3oV6hIk3Ga
	h7+O+JraBx2h1mlLkS7igtDqkImA0Pb/hZ5usEFtNDQ8HGwxQ0VR3s4c9RzfHpukG4enzrRrJPK
	AhDf9ARSW2WJDba2M4/EkuDoTsNg3u8blyi0jYBHZ4fxW4fcvRiY7VAFbOrBd4pd+kZ6knw1Q0A
	7ib+tDZofhIqtz0C2KvfRZwx3lkJuGZkN3cQCPvaOsh02EBG2JqOlqcGS7oLqF/6wC0FdENlemx
	TkIvbYZzgxaLzBjAAL6stD23i3a1H6lhkK9kOv+/gpAza1shIr72+UJ6Igha0Xz8O8IbQMH5Vbp
	XLTCeHYamXD1OXx7ZcWvml4AUWQY2j0FG67Vhtsnjo1vUMNdLU7SUu+Jc+mgY8wqzzXE=
X-Received: by 2002:a05:6a00:808f:b0:838:127d:a167 with SMTP id d2e1a72fcca58-842b0e6bb0bmr19975883b3a.16.1781011435776;
        Tue, 09 Jun 2026 06:23:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:808f:b0:838:127d:a167 with SMTP id d2e1a72fcca58-842b0e6bb0bmr19975821b3a.16.1781011434968;
        Tue, 09 Jun 2026 06:23:54 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm20261369b3a.43.2026.06.09.06.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:23:54 -0700 (PDT)
Message-ID: <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:53:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qU9I6mmX-BDJupfeJpo6oCLRc8oXchAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfXzVpNJaD9yxwh
 LY8Dk1erx6AXrAAzl4Po8AQb1SxVmupVJfbBw9OqPhGYizDsP/FGCMMC3aKCXOUeaF2EVBOfJ/c
 /Vx/u1uSRTCwj4Xyf548uQGXm4lfgLadpS5jQTfrmoMwTE+7yIXwybZD/Sn40R3P+5Oe3YrouFz
 1cbUEyCdrVIG5bzZ2t/RmRqgYpX9F17pr6ADN/zUlNMv90YdM7FasLNVKHcGgBZGAbenlgF34QE
 kWHpI37v0BFoRJU6TIpPNERXKogneNckuuI7QsLc4oDj6oB2OolShgHgV/Vu34DcyKGAESsFf9J
 3kBa8jSh2ck6WTvX/6YjawDNC6//+JuekrwbQCa6cupLYaNrLuO3cj9wUHHMxjei4c5zTW/pk6F
 bbGVaUkXgdIb0lt+53Yp6S/QJNyr7Sp31llbmrRWhVAyT0OE0zlmuAfnHH/fhDojyqSRLaKjgkc
 pSMiRZgCEcE+CZJar5A==
X-Authority-Analysis: v=2.4 cv=NKPlPU6g c=1 sm=1 tr=0 ts=6a2813ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bEeoLGOZ4EoZlHOPchMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: qU9I6mmX-BDJupfeJpo6oCLRc8oXchAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112174-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6470A66091E

Hi Konrad,


On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
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
>> +/* SPEL register bitmasks */
>> +#define ENERGY_STATUS_MASK		0xFFFFFFFF
> 
> GENMASK(m, n), across the other defines too, please
> 
> Then, you can drop the _OFFSET defines as FIELD_PREP/GET/MODIFY
> accessors will derive them from the mask
> 
> Please also use lowercase hex, file-wide

ACK

> 
> [...]
> 
>> +/* Constraint configuration */
>> +static struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SOC domain constraints */
> 
> "SoC"

ACK

> 
> 
>> +/* Helper functions */
>> +static bool is_pl_valid(struct spel_domain *sd, int pl)
>> +{
>> +	if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
>> +		return false;
>> +	return sd->pl_name[pl] ? true : false;
> 
> return !!sd->pl_name[pl]

ACK

> 
> [...]
> 
>> +static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
>> +			   u64 value, int to_raw)
>> +{
>> +	struct spel_system *sp = sd->sp;
>> +	u64 units = 1;
>> +	u64 scale = 1;
>> +
>> +	switch (type) {
>> +	case POWER_UNIT:
>> +		units = sp->power_unit;
>> +		break;
>> +	case ENERGY_UNIT:
>> +		scale = ENERGY_UNIT_SCALE;
>> +		units = sp->energy_unit;
>> +		break;
>> +	case TIME_UNIT:
>> +		units = sp->time_unit;
>> +		break;
>> +	default:
>> +		return value;
> 
> nit: maybe setting units and scale explicitly in each entry could
> be better for maintainability, but potayto/potahto

ACK

> 
>> +static int spel_register_powercap(struct spel_system *sp)
>> +{
>> +	struct spel_domain *sd;
>> +	struct powercap_zone *power_zone = NULL;
>> +	int nr_pl, ret, i;
>> +
>> +	/* Register SYS domain as parent zone */
>> +	for (sd = sp->domains; sd < sp->domains + SPEL_DOMAIN_MAX; sd++) {
>> +		if (sd->id == SPEL_DOMAIN_SYS) {
>> +			nr_pl = spel_find_nr_power_limit(sd);
>> +
>> +			power_zone = powercap_register_zone(&sd->power_zone,
>> +							    sp->control_type, sd->name,
>> +					NULL, &zone_ops, nr_pl,
>> +					&constraint_ops);
>> +			if (IS_ERR(power_zone)) {
>> +				dev_err(sp->dev, "Failed to register power zone %s\n",
>> +					sd->name);
>> +				return PTR_ERR(power_zone);
>> +			}
>> +			sp->power_zone = power_zone;
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (!power_zone) {
> 
> I believe this is only possible if ARRAY_SIZE(sp->domains) == 0,
> but it's not obivous that it's to protect it from that specifically

It will also catch a case where domains defined without root domain 
SPEL_DOMAIN_SYS
> 
> [...]
> 
>> +	/* Map spel domain registers (energy counters) */
>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nodes");
>> +	if (!res) {
>> +		dev_err(dev, "Failed to get nodes resource\n");
>> +		return -EINVAL;
>> +	}
>> +	sp->node_base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(sp->node_base))
>> +		return PTR_ERR(sp->node_base);
> 
> devm_platform_get_and_ioremap_resource()

ACK

> 
> [...]
> 
>> +static void spel_remove(struct platform_device *pdev)
>> +{
>> +	struct spel_system *sp = platform_get_drvdata(pdev);
>> +	int i;
>> +
>> +	if (!sp)
>> +		return;
>> +
>> +	/* Unregister in reverse order: children first, then SOC, then SYS */
>> +	for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>> +		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
> 
> Could you try adding a devm_ variant of these register functions?

Powercap framework doesn't support any devm_* API, you meant add this 
support in framework in this series ?

> 
> [...]
>> +static const struct of_device_id spel_of_match[] = {
>> +	{ .compatible = "qcom,spel" },
> 
> The compatible must contain a SoC name

ACK

Thanks,
Manaf
> 
> Konrad


