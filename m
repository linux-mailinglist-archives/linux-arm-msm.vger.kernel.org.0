Return-Path: <linux-arm-msm+bounces-112176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nj31MqsUKGpw9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:27:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 933686608C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:27:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z69CVyS/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NICOCO43;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112176-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112176-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 53118304CF3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29612D0C64;
	Tue,  9 Jun 2026 13:25:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3AC296BBC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:25:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011501; cv=none; b=LgmuKCTILuQVJ9lD7tm6Vc/XiwGL/Ftjn6ZM2UsSKVmWmEck6LhLAbIXTSMw53gsN1O4PCSyhBys39C0OtVxZpKEJSTnNOPcdhO8lp5qoupyYtfe0XlcE6gYHGDtK0MsQoWxw5LtPDiKlYORf2MalnGMAhf4QA656bhJaEredzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011501; c=relaxed/simple;
	bh=TGP3thYwS5cQEvKp3bq6AQJmDxlBqvBlj4kGcWvPqvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QWYVpLB3ffVah3kQMW/3w0wKMXkA/bsxwwZAAdyeFq6QgfZXclXa7ewSGevwmdZcXE1s4EqVkPzbvnqSmy+dVpNq0w+LvbUppU74h0ZKaLnLJ8Xjhc78MWsKmbGvzDhTBdD1SWc2eByOoT9yzFcZ7FzUPPXmjPFUIWwtS0XQ7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z69CVyS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NICOCO43; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnL2g2668531
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=; b=Z69CVyS/18J9r58K
	qULq/j/zWPbC3t5keUjm+Z+ATHHfCJ6YtmcZP8DEB8+t10j5DGIJk7t/uWQUggqj
	+r8WtH5cMOs3kyw58aEzDh22qBUSK9qzZzjfmDaWln+oYKwflwfRN/1dEShTo20D
	c4AhMURJladJhfo8oWohK5thhRHYjSc+fhAs3SKF/vOTh9EtmY3WHpIzGQ/149K6
	xdfKbiuNZXntU41dBKprZ55v/490uB77CWuIvrEJ0uPrYmJXrzYwrDceOnLcpuTu
	m0XksTQAJvY7js9cUjBnp2CpoJnxyKW96PxbOybzDgpLBy7mpXX+K94FRr2pL9Ro
	reIDQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25sm7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:24:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bcfce8a33so5027915a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011499; x=1781616299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=;
        b=NICOCO43Di7sYRKHfbUg2tz3/RHDKcZ24DQgZrYfVCwklVXw7d8z8TEhB437V9y6CK
         2ZnF7IgkOzHBYnmwmAZ8RXZArG2XAd3dOAWsO2BceWx2Bhbh3qBu44kEOJDvqAVhQKD1
         9JoSLSp/pbLhMGeYNmoolQIFtWPVVzR0z4ccc3jenDywImuSPdZGWJml8n57WKHLEQSd
         1Lh+sakCCspgY0k2HZ7DNGvn/vg2cCEZvOR6iQ5OY38cv31BuvyEGZ1CsE04v/0LPkK2
         WrmtJmG5R9vwVLo3izLIPywyJntyEeYWoGhAXl2ijTXiTuyYmrfwSNuEQ//l3zsICuUY
         /WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011499; x=1781616299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GSvQb4RyHDcKwjA04narD1yN7pysrwi3CeTU0bbhZE=;
        b=ByC3K7o7kbi5i7qJ85PpdIlllYofYVG94EXSIf4sNh+RPkEIw5bLo5Btpi+TtZWsuY
         UaJoHjtkuSZIk/vKMCqYwqTdc1OKunu7lYzZto1IUOcF3HB1dmTsk1qIR1u2FLsg37sI
         Mthuqj7pU575bCu5y5OtpAbhSozG3ECR8TQqH/RTd15O/6aMM9WpLCukSZ1r9StZb8SM
         WdHi0/mAWV/tGu/aM85yLPc8SDKF/F8W2L7Nxvj+Pb5ysDnAxdkPUJw2vMmZOs5detw9
         LLdBsLpx91duaDYkwzuKTbx0RZDmwUcXpPMnsOosKs6kwPqrNdXUZKCLgOKv8IFcZRtX
         NSTQ==
X-Gm-Message-State: AOJu0YydNYWjlhXAtkfyL4vYtssLBpcJN4pg6sUhZgFEu5EZkfAU9bH2
	oamw0e3WPRxMkd75DhKSfKEG0Rysgmady/psDOImL0kb4yx6cHG3fhfEeaTSs+FM2kiNkE8SSMr
	VXv+mvYyokFeebA+d5G/wH7eYgpOZdEsRD1kyaox7HZuKtrxeQVSQ4COxcKcM+Cj/+uk5jGZeG7
	gW
X-Gm-Gg: Acq92OHsqgbvtP7nnQZ4vMW2hWEOjhDV81x3OvShR3+cBgQAwT8VOg60q6uxsZxEzad
	by7HPWgdfv8mGhGisv7FAi6ZrMA581j6dmagbueKlM5b6a5CmTexUA8GC2AHCuStk1BaBJPJOmm
	bSWmrIFXsZNbrgh7M/TDK6M6ylnZxhGlATIOQXtjQxNGKSrP7FP/7lbrTxEbWJ+q7L1DpX68XkH
	378wM/TVSSVY/vFGI70CDTq1f4maIBr26h0sHSmydIga9WzdrYzjh6SFXhW4nwFMD6FfrKaguFo
	fvdkbthYVLf6cxXYiMz8Ry7cAjkdx4EoZLvgT3Bko2n6ykvQEgl1XGdULneRPtd5ohVRVLNWV+1
	4Lq1Sti4qF8QV74nJ1On9XuIk0SI5Vg+XzPcaC01553eNs/Ru3zpOFKj/a6enauzmKKI=
X-Received: by 2002:a17:902:cf07:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2c1ec3f5cb8mr168553155ad.1.1781011498620;
        Tue, 09 Jun 2026 06:24:58 -0700 (PDT)
X-Received: by 2002:a17:902:cf07:b0:2b9:cabe:ce37 with SMTP id d9443c01a7336-2c1ec3f5cb8mr168552765ad.1.1781011498094;
        Tue, 09 Jun 2026 06:24:58 -0700 (PDT)
Received: from [10.92.193.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa072asm212244575ad.34.2026.06.09.06.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:24:57 -0700 (PDT)
Message-ID: <db1c1ec6-56ec-4fa8-8620-b8db4e95015e@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:54:52 +0530
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
 <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <e3b15b7e-ba09-43ca-9e6e-b778393d6acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AadNvLepEA73gjC0WMOQDETVefTQzQaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNyBTYWx0ZWRfX7ywBFvUJNT9f
 5LIF1I7NY6EM3gjyek5i2arc50ALMbRy3Qk0coS5gTImKQVPlUgzKpKaOfTG0Gyy05K82pAPICS
 nPP6X5NH6RkhL9eRnfjppj5lf3ZXLJzD7ewXpxVdA3Ho4n9Sbv1Ut5J1UMw/e7Gy/s64+9ot2Zb
 edNdjHQKfx8vsUNrRJfMWPNTmJFvoKqAIU9gdyqRQpcHaP3CN4PjcBx6OS0spUl1aIFJAz0XjBj
 bJvndqzc4csrEuG/UsDT9bVJgrrICmpzYMnZSBAq6hB1cEuplAFTaKNdFL+eLNfCxy3OvxPp28O
 PLe+FFoP0eW7g2C98y6++R+IVM9k6mI4+ayhYOAombZS4M0jLO5wfadZJoLRrm66uBHAUYwMmSh
 boulgQrqXC0MH0wQcKP5U+RbpbYI90Izj0TLLzszmO283jIn06R77jUNiRZSFnItQhc2IfgF4um
 gwjZ/kbeksYwg220+sw==
X-Proofpoint-GUID: AadNvLepEA73gjC0WMOQDETVefTQzQaH
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28142b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fz3elM8aSJ4FunxCNjAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112176-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 933686608C3

Hi Konrad,


On 5/21/2026 4:47 PM, Konrad Dybcio wrote:
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
>> +/* Constraint configuration */
>> +static struct spel_constraint_info constraints[] = {
>> +	/* SYS domain constraints */
>> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
>> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
>> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
>> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
>> +	/* SOC domain constraints */
>> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
>> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
>> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
>> +	{ 0x0C, 0x6C, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> 
> Lowercase hex, please
> 
> Can this data be const?

ACK

Thanks,
Manaf

> 
> Konrad


