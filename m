Return-Path: <linux-arm-msm+bounces-101712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCIqDM38z2nt2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:45:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2963971F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 599AC3020861
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710083D5654;
	Fri,  3 Apr 2026 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFRVUBvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/WuHH5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A153D410C
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 17:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238346; cv=none; b=CpWP3XSHj4k9MhoVylSW0RhPmjqZN1WN3qUrnBEH/TBC+oAE7RZuAnSmnDfIpR8JPf9yFMn8CxPx/tWqMCX3c4uRGo2kZBtx7Heg9UQFxDZeIQgl5B19m7oAxiJyFdPulBXRvbJ4w0G+g+SM+wsCXo6jvHSfmEtgmlKkY9CA8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238346; c=relaxed/simple;
	bh=793ilWMo0AtuO5x03/HxCDAGDn8y9fcCAsLObzmOWQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFUsmNjPvM6WrccTqfQA23fpGtyNSa4wweX07OXG1eQax4WcK/iSUC4INKEjHmi7yDxfmDnL3USx/OgusjvqPkmR6LNPnZMcdKzBgxp+POtKH8DIx9zoc42E5P32YfKk/Yrx4oXFirnckAyob90+JVZ5IvFabiT7bDuXYNmMxV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFRVUBvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/WuHH5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633Fv0oj258467
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 17:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=; b=KFRVUBvZOe2C0zgk
	e8tSDQsHTE3yxdNVLr4Csc4+WzEaw/yFbEGpPxRr+o7SdiPO2uIIxWKQCeYai7f1
	8VOMvMRjoCwtBIUerLOoj9EIwHjuwwSTCOM+n8NEBK9k2LpOXYsnYFEq4UVeHXgo
	zTddW1L4sMsncNekJEOFJRldvhmP9CZ5P+LmbXbOzdhhL3C4+h55g2JlKYGkLV/D
	GAMkmb1gg+b5j3buQe28PQ4EOlv1T0oEU6s97UklIjxIouG54erk5HZ22DEMRwpt
	Jrec8/3gieGPqSQDQx6j5q9oY/aGigao8fza4VtqinJco7GEd5+5YKwuRqfdVzE4
	EOH/Zw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20ad8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 17:45:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7424d91b2dso1138561a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775238343; x=1775843143; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=;
        b=d/WuHH5lFxa8ac31yVvkE1mnCTTbt+vrZMSrmCXUiQq566hCa3A4uVvz4SPwS5sQHR
         7uo2++yErR0dd1xrQk+P+kEF1LWOZSwWaen6qRTFo/5A6KY66qdef+2KUEYnvZiyxfrV
         9PFQ0sntFFrEWVWDy+Xpess6qbBMoWdJUrbmbsEMwMGH/vmQZEmKjumthP1OiVMy2Khn
         6OmBhtjSwNrCzL+HbPB2kxXoe2ZVRJOvXbqNweWIqduUXD6ifcAsOc1Dn/ALFmdBwKFA
         wQ3XLfm6BNDlfJVgIAUHeCo+dH3hUJWP8oBx25Kj/Ugwg0IojjP8h80ebxB7Jp0L0XuF
         JdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238343; x=1775843143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcRbm4HgwKmiNI6qxpLJK0dsTMaJBwVAMn+5K7yoUOs=;
        b=LumybrdWlZwZBxEQq+lGe/JURVy64d5c4bHMd/1MrpCe7mv+hwwb5+ew3+Cj6NwfR0
         h7altYfH2hj7OBeR8jmZWp6yib4twzeA8vrrBx6m2yb9p0fEIgjXr1WuETPBYx7STX5z
         bwASl8f5to7JmZZO6gsENkJfVbA0T8ffv+MwNBGtgyNj+UmsiCa+b/W8hPhw1Iw6RP1g
         xHG9RzsbJhLNmKGObPWJmSAnHPENfrQb9iqYu6w3j3qDP7+/k6sS2B56DyFwTE/BCBC/
         t2HEUKliU7cNM4cU8BA48ebUHGR4PEV+AmResnzDuTi+BddnhssOHvmXQqvOL7BH6++W
         FtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9TZ6HrTQXeHJGqrufiGa4JfGrSgAsjljII5E6a1RD99RuncsCi43ApVxmtUrPsr+lvRw8yWTtPkha5l3m@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyAgBdTp6cyty3G+hkGDbEH+rcG0syG/xkbxSgek6D5B3wX6N
	LJiqs0FZRG48q3JETptA1PO7hHDBAMVhlJolzyHrp3CGENiq9CFpYp55Lg0nAQAD+jlfvaqtiem
	I5ugjeGKK28GwOm+QkS3Dj5kofKFN5qdUAqRRTmRkYUcSSBEsU7o3aJy9nsbz7AkobBuI
X-Gm-Gg: ATEYQzxsnRDS+qjTmuAGVNcuqQbbeLkiroiZc/tqxhlaShF0NnARcbnpM7YQYDzasJt
	ZCQQdQNVNzdJTsOfWvHBzY/eNc1oM7+bZ08c+ci8YLTy3q1pnzkD87DxwVoJyGLHzzokiaJNh1U
	LNQ8B24S8f33xWeJuiR3Pd0K6PSoy9DRtxPZD7by6u4RyO+jiC/TwdhJel91IJzU94op5+N4Cu8
	0rn3e6ByAb5L+GGgxAUmCR7AYSM+U/8EuyctfEb2VzEVgao9VttmaaZtHbopA/mapNsT8H1yv7R
	rNSAjrKYl4UnzSDGYIh/hHMKeOj2AlBlaET9Wh+AgG0I0FRqwsolA5NAV90e+4smPA5VXJlzR4k
	xG3Zzo8tvZEyurDutlPJGXjUumr2qkxO3k0I4wziIMg0W/I01xFusJ+p2
X-Received: by 2002:a05:6a21:9995:b0:39c:4ca1:345b with SMTP id adf61e73a8af0-39f2efadfc1mr3753190637.38.1775238342821;
        Fri, 03 Apr 2026 10:45:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:9995:b0:39c:4ca1:345b with SMTP id adf61e73a8af0-39f2efadfc1mr3753157637.38.1775238342245;
        Fri, 03 Apr 2026 10:45:42 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6563597sm6988128a12.16.2026.04.03.10.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 10:45:41 -0700 (PDT)
Message-ID: <547c006b-231c-430c-a69e-f80334c4f81f@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 23:15:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <acaMPgRALnoUIHMC@lpieralisi>
 <93a78bc2-4fd1-41bd-bf4a-b433b06fc218@oss.qualcomm.com>
 <ac0trUGsRBLPS+ux@lpieralisi>
 <da6f4566-a719-409b-80a9-40ca89e3e721@oss.qualcomm.com>
 <ac/hru3IIiU0+Lp9@lpieralisi>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <ac/hru3IIiU0+Lp9@lpieralisi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1OCBTYWx0ZWRfX4u5qo4/iWyK7
 R2/hZJlT5hsecsY42ISrTGtIEBJumc2RZWMKIgnod6P0Ym8fu+AVipfluZ7+l2pmqbwdgFlxkvQ
 WZLhfSGIMWUXDJVcJXZ+ctgVI0dIXVJn6O4rLSAZ0eP6Bt9aR2G81PUGgJHR+Mguis4We9ZiX8s
 xF3z4KYROqSl68A9Ti48s24v1S3GC9RWHTJugxrKj16OMRElZr+fYY9HJrCrivdP8sB+zSYn1sP
 yyEI+r/JNfAX4L6DYB6B4/Lcak6+r1FUB6KDPTB4na9BKQ23z3ip1/u8mME3lw8lVFQYgAFw3P2
 KQX+fM4zopQrwtsRTl0VOsgoM0noBSJ28iCycPHSNYe+V/YkFisTxB1uIKwpOkIYJX8ryTa1m5q
 KPs2E99tZxMdmoq8OK+APegRPnoPCCxdDlk2SmOQv8dvjums3l5U4GN1KduOjTmmIl4KeSZc3uz
 ZIUrTZ+Zx14Xwxctnuw==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69cffcc7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=2dos1RgzJhmu1+008kacPQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=F0Qtw4M1lXcpx3oWCRwA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: kNryewkBY-Ep1omV_3iZKMgCTX7E5tR6
X-Proofpoint-ORIG-GUID: kNryewkBY-Ep1omV_3iZKMgCTX7E5tR6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030158
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-101712-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9A2963971F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 03-04-2026 21:20, Lorenzo Pieralisi wrote:
> On Fri, Apr 03, 2026 at 12:05:27AM +0530, Shivendra Pratap wrote:
>>
>>
>> On 01-04-2026 20:07, Lorenzo Pieralisi wrote:
>>> On Tue, Mar 31, 2026 at 11:30:09PM +0530, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 27-03-2026 19:25, Lorenzo Pieralisi wrote:
>>>>> On Wed, Mar 04, 2026 at 11:33:06PM +0530, Shivendra Pratap wrote:
>>>>>> PSCI supports different types of resets like COLD reset, ARCH WARM
>>
>> [snip..]
>>
>>>>>> + * Predefined reboot-modes are defined as per the values
>>>>>> + * of enum reboot_mode defined in the kernel: reboot.c.
>>>>>> + */
>>>>>> +static struct mode_info psci_resets[] = {
>>>>>> +	{ .mode = "warm", .magic = REBOOT_WARM},
>>>>>> +	{ .mode = "soft", .magic = REBOOT_SOFT},
>>>>>> +	{ .mode = "cold", .magic = REBOOT_COLD},
>>>
>>> These strings match the command userspace issue right ? I think that we
>>> should make them match the corresponding PSCI reset types, the list above
>>> maps command to reboot_mode values and those can belong to any reboot
>>> mode driver to be honest they don't make much sense in a PSCI reboot
>>> mode driver only.
>>>
>>> It is a question for everyone here: would it make sense to make these
>>> predefined resets a set of strings, eg:
>>>
>>> psci-system-reset
>>> psci-system-reset2-arch-warm-reset
>>>
>>> and then vendor resets:
>>>
>>> psci-system-reset2-vendor-reset
>>
>> Can you share bit more details on this? We are already defining the string
>> from userspace in the struct - eg: ".mode = "warm".
> 
> "warm","soft","cold" are not strictly speaking PSCI concepts and mean nothing
> well defined to user space and even if they did, they would not belong in
> the PSCI reboot mode driver but in generic code.
> 
> Spelling out what a reset is might help instead, again, this is just my
> opinion, I don't know how the semantics of resets have been handled thus
> far.
> 
> If userspace issues a LINUX_REBOOT_CMD_RESTART2 with arg, say,
> "psci-system-reset2-arch-warm-reset" it is pretty clear what it wants
> to do in PSCI.

ok. got it.

so it predef-modes.

reboot psci-system-reset2-arch-warm-reset =>goes for => ARCH WARM RESET.
etc..

> 
> Again, it is a suggestion, comments welcome.
> 
>> yes we can move away from enum reboot_mode and use custom psci defines one -
>> Ack.
>>
>>>
>>
>> [snip ..]
>>
>>>>>> +
>>>>>> +/*
>>>>>> + * arg1 is reset_type(Low 32 bit of magic).
>>>>>> + * arg2 is cookie(High 32 bit of magic).
>>>>>> + * If reset_type is 0, cookie will be used to decide the reset command.
>>>>>> + */
>>>>>> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>>> +{
>>>>>> +	u32 reset_type = REBOOT_MODE_ARG1(magic);
>>>>>> +	u32 cookie = REBOOT_MODE_ARG2(magic);
>>>>>> +
>>>>>> +	if (reset_type == 0) {
>>>>>> +		if (cookie == REBOOT_WARM || cookie == REBOOT_SOFT)
>>>>>> +			psci_set_reset_cmd(true, 0, 0);
>>>>>> +		else
>>>>>> +			psci_set_reset_cmd(false, 0, 0);
>>>>>> +	} else {
>>>>>> +		psci_set_reset_cmd(true, reset_type, cookie);
>>>>>> +	}
>>>>>
>>>>> I don't think that psci_set_reset_cmd() has the right interface (and this
>>>>> nested if is too complicated for my taste). All we need to pass is reset-type
>>>>> and cookie (and if the reset is one of the predefined ones, reset-type is 0
>>>>> and cookie is the REBOOT_* cookie).
>>>>>
>>>>> Then the PSCI firmware driver will take the action according to what
>>>>> resets are available.
>>>>>
>>>>> How does it sound ?
>>>>
>>>> So we mean these checks will move to the psci driver? Sorry for re-iterating
>>>> the question.
>>>
>>> Given what I say above, I believe that something we can do is mapping the magic
>>> to an enum like:
>>>
>>> PSCI_SYSTEM_RESET
>>> PSCI_SYSTEM_RESET2_ARCH_SYSTEM_WARM_RESET
>>> PSCI_SYSTEM_RESET2_VENDOR_RESET
>>>
>>> and can add a probe function into PSCI driver similar to psci_has_osi_support() but
>>> to probe for SYSTEM_RESET2 and initialize the predefined strings accordingly,
>>> depending on its presence.
>>
>> Not able to get it cleanly.
>>
>> 1. Will move away from reboot_mode enum for pre-defined modes and define new
>> enum defining these modes- fine.
>> 2. get SYSTEM_RESET2 is supported from psci exported function -- fine, but
>> how we use it here now, as we do not want to send the reset_cmd from
>> psci_set_reset_cmd now?
> 
> You do keep psci_set_reset_cmd() but all it is used for is setting a struct
> shared with the PSCI driver where you initialize the enum above, possibly
> with a cookie if it is a vendor reset.
> 
>> 3. For pre-defined modes, warm/soft or cold - reset_type and cookie, both
>> are zero, sys_reset2 or sys_reset2 decides the ARCH reset vs cold reset.
>> 4. For vendor-rest , we use sys_reset2 with reset_type and cookie.
> 
> Yes.

Ack.


>> All above is done in reboot_notifier call at psci-reboot-mode.
>> --
>>
>> Now in the final restart_notifier->psci_sys_reset --
>>
>> If panic is in progress, we do not use any of the cmd based reset params and
>> go with the legacy reset. So we need to preserve the values that were set
>> from psci-reboot-mode.
>>
>> Did not understand the proposed suggestion in above usecase. Need more input
>> on this.
> 
> I explained above. The reboot mode driver sets the command to carry out
> depending on the string coming from user space and whether PSCI supports
> SYSTEM_RESET2 or not.

got it. working on it. thanks.


>> --
>>
>> One other option is to have a restart_notifier in psci-reboot-mode, with
>> lesser priority than psci_sys_rest and then handle all the case including
>> panic and sys_reset2.
> 
> No.

Ack.

thanks,
Shivendra

