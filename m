Return-Path: <linux-arm-msm+bounces-113389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xf2iN7s3MWrLeAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:47:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF7768EE6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:47:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bo56dbwm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B37Sux6Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D54E830590A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EAD3AEF3D;
	Tue, 16 Jun 2026 11:46:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF127BF93
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:46:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610378; cv=none; b=T6q6U+Zp/hiTVSuh6kPrgvuPbAH3dd2yCy94znG/z6fZ3fnETTwP5rWOrPxKlpNStatnbA05NdBE4JKSCtoZTZ38AfdgdQuhMcMhu8un1BK96beepKBxdEOoXY8Er4M11/3VGJzh8TqgUlOA8Qq5GzoMTid16ezLGHrpT2eGL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610378; c=relaxed/simple;
	bh=xUoKAl/tOQq5A4/9OWwbo8axQZkqumbFn7aijamQtF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qej8unpDKvz0rkCyjr0rGNxg5GqWQeHcF8lFUB36ouxcq/xvZuXiME02cFm8fRrmSdaeO+ZuBRnlsovxMiA1+MKivgZTC5RMEaOtT2aRUbakyCE3v6aKTzjIUJoQnQRcSn+jUSvr+J0CaPcXy9FyoCTCnbmNi61aLnZSKUF501k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bo56dbwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B37Sux6Y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACIvr3411110
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LH1kOVRIq6/aNLun9y9f8La9VZeozCmkQYJl1HbzIHc=; b=Bo56dbwmNHgvMXRI
	jYdT2sZav8I535vosXMy53qAKfGnRoqxChiIa2jwUkFsuVmjFYyt9Xe6myBFHZtM
	bFmytrdwD1mGF/K7RWuqYOG+d35rqZg+BBVwB4aGnRdRmFcMc1CnI4MQ0omu6eN9
	byk3OZzTlS3TOueomdMPXox4wdqHZADi5lFAMCZ+t0h/9LfDHsJrNmEnKqm5bCGW
	Ld0MAFsVluI7/+Ngz9SdTaQ/Pw7w9bqdU9KkeGC8gHa80pez+CePBVHY0wg75XZ6
	L7/dkpwkNH+hcaNaM9healHt0KfbB6HsXpjgq4lwnL8bMSLY5HuYP+cUqomY6Qv1
	zs4hGg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09g9k2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:46:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cc6b92b8f3so119609137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610376; x=1782215176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LH1kOVRIq6/aNLun9y9f8La9VZeozCmkQYJl1HbzIHc=;
        b=B37Sux6YL525ZS15qZXQ+BM6iLBEw4nCdSWF/oJejLU85G77OWXj9GR+6oGDNIDV0o
         wa8uyUfkNzOLS7QuH1/pKQbt1skXgtHpGJOuVTBUKd48lL2xxWbBlXp9BWZn75T8CDF9
         1e3aoBCe3LbFZgm65vwBM5ZrX4FOoa7Ob2kYJPfOvN9Rv0tHnBX+Gmr2XLnrSHAwcDZ3
         F+hKfUQgU42E8csqDPD5WgBCQBQCdTTIn+yslxwlG8+uMw/s5pGWxGVCmCw+T/dc/OEh
         RjAg75M8nBXJpr11yD4ZG6arS3hBice8Wy4IOq1yGZ12COxfkhjoHKWQ7WIWTYUtJcXF
         /ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610376; x=1782215176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LH1kOVRIq6/aNLun9y9f8La9VZeozCmkQYJl1HbzIHc=;
        b=DVJ60U6ui4p0xrTROEjZEqHiGdf57QxbXlRxTW1wglonsAwx+/H+sCPLrP0hNFgxew
         vu6etpe8ty3yeQWOQQsFb+Wr5SmlFKEC/VGORwbESEzrl/3soT5ubUI4KrhmIpqG8MS1
         K1RNmcoVjO4gnzQHKTOKHinN8TtVPZbu94X5vxrNR03edF0qS9jcVyi0PSt6o0Ck9otv
         LZWfA+FAjA5KUbxO+8L9Vdemn+fSsSR/jRDMl4Mu5z/Gh5KKXfyAGU/8Q5ATmC9qevgg
         htR+7+gwAVDIvgx9OCEUhPLumIKOpYSLCtiam0KyTlStsaZfBgkAT5Ky++m/DjpQu7/R
         2Q3A==
X-Gm-Message-State: AOJu0Yw1RGc+yfizFC6gUXaW09fIC4FXWTAnWuOFxZbiGvG2X6E/7P7a
	mmZXifq1i5VHplruwm1BdM5c6as9eAJBXdIstgpU89MgXNP8LyhXXS6ymTalHnCMollAntO59C2
	zqxIEYyUB/dz+19w8p52UDaxRxIl5uZdNS2zwsqMq875LLHTignZl1Vg/CZYkLgXn7gTZ
X-Gm-Gg: Acq92OG2sBBLbusFgC1143+TB9ZgGPPFkRbnBnWq00uZnWY9stRXMgRQat5djftbMYU
	RNSLNPgVt4HUtS+F3BwqTEvbZhFtkSDjdzBaIr0xxCEso8cynBp0enrsdyXmORPBBgDn2fYPz5G
	ZuiGYBmUBqdgiaBhY3xCjwHRjpGmpuwZePbekIU6AoqmNViNHIOwWVNDA5zYzukK3wVWoZKvT8c
	+CoiRAArWqnVf9Aoi+TAQs76WmebergzgSIJuukBUt5llCGol/Pu5SY7bPm68wrfJcaF87R+QtV
	Dgbpr6IYYyx3OvZcl/RgmI32hqQ5Ctr47nahKP8vrKSRt2Fn2O3UBWtkKJe1L3LO1vCZHXMgbzu
	D+I9Z+ja6cAXnkmHOlw031ecy9TOLpgAoEvmgLhlBHh5fWw==
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr3158909137.7.1781610375813;
        Tue, 16 Jun 2026 04:46:15 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-71e88e6c8d2mr3158899137.7.1781610375389;
        Tue, 16 Jun 2026 04:46:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c6d7cf3csm3940045a12.14.2026.06.16.04.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:46:13 -0700 (PDT)
Message-ID: <fa071c6e-2529-4410-a5b3-3c077d4cea99@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:46:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] thermal: qcom: tsens: Disable wakeup interrupt
 setup on automotive targets
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
 <20260601-tsens_interrupt_wake_control-v2-2-ce9570946abd@oss.qualcomm.com>
 <80333371-48b3-4cdc-85b4-5625af6517ff@oss.qualcomm.com>
 <5b990bd7-e234-49eb-b5ae-5ec117fdf2d5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b990bd7-e234-49eb-b5ae-5ec117fdf2d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfXysRe1oTOMxJj
 c9/cdTAl1rer6YMCKdxN2HhEethLVxAHoobNOdHl8p3DIQjpKQ6LzbhnPuJRK520cF8XmVVxgFQ
 aNs36sLl+am58sNyw2//nglu6rMWPJ+pmN+1RcaM9drqDMW5Ll3zWkR548HLCqCQrwuLxGUiTiN
 kKlstvICQSMi8UvytSbVHvSWvpC5SQz3WCxNKBuEbNg4QROvfQxC2tfMebGvb8F5CTPJg3kcRXU
 dBFjFL9GZKFt7jAci3n6/jPfsYYnMJV25Xo1r84+q2HBSEdtEAIh1IF+ag6CXT+XHxEegirNjPq
 1R4I9iZ6Bt5rtvN2WkJBkqlFeYqltvssZLERjxnaYjrVLwO9v+r9YONZtLicPZwuaUGSyXyQd12
 UGasAC/NsSTylaWnSlomtqiexIyY9QKbCn2mGh12YH1WDCOF3FKX7Ne7q09uU8WHJSNvVWY2APc
 C5XnYmEfxxPtvt0v8hQ==
X-Proofpoint-ORIG-GUID: jLrF1gOXpJVqJkeEiGIuBQzM2Lz1MegH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExOSBTYWx0ZWRfX3ylYwpspt3Ri
 EYYMjtmUPPJCcweRTpT8jC254AXMxydOWSCGx6SAhrBzNEiMWAAA+Qw/i6ZY8J6Vh0+vkFDTvUR
 TfHH9W6ppCNsxwQ4PzjucQDVK1Xr19E=
X-Authority-Analysis: v=2.4 cv=DLa/JSNb c=1 sm=1 tr=0 ts=6a313788 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GStInHzQdJ2FNXMrR3UA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: jLrF1gOXpJVqJkeEiGIuBQzM2Lz1MegH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160119
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
	TAGGED_FROM(0.00)[bounces-113389-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AF7768EE6F

On 6/3/26 2:27 PM, Daniel Lezcano wrote:
> On 6/3/26 14:25, Konrad Dybcio wrote:
>>
>>
>> On 01-Jun-26 08:37, Priyansh Jain wrote:
>>> Add a no_irq_wake flag to struct tsens_plat_data to allow platforms
>>> to control whether TSENS interrupts should be configured as wakeup
>>> sources.
>>>
>>> Create a new data_automotive structure and add compatible strings for
>>> automotive TSENS variants (SA8775P, SA8255P) with wakeup interrupts
>>> disabled.
>>>
>>> Automotive platforms can enter a low-power parking suspend state where the
>>> application processors and thermal mitigation paths are not active. In this
>>> state, waking the system due to TSENS threshold interrupts does not enable
>>> useful thermal action, but it does repeatedly break suspend residency and
>>> increase battery drain.
>>>
>>> Allow these automotive variants to keep TSENS monitoring enabled during
>>> normal runtime while opting out of TSENS wakeup interrupts during suspend,
>>> so the system can remain in low power until ignition/resume.
>>
>> Can you not just disable the wakeup source via sysfs for
>> your needs?
> 
> AFAIU, the system will crash for this version, so it has to be disabled

I can't see a mention of this in the commit message, but if it's the case,
it should most definitely be there in writing..

Konrad

