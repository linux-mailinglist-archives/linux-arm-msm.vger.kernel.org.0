Return-Path: <linux-arm-msm+bounces-102141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MbeOP7m1GmeygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:14:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458523AD87F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51AF7305288C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7403A784A;
	Tue,  7 Apr 2026 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PSbQ8xt6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ikROfZgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963F83AA19B
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560190; cv=none; b=S60xnqBAoq2k8fIH5d+oBRgPmmIA0CqtgD1xrXPxzWXEP/Q8Mq5d5Ag/p0qWVncMlfOHBMYYJHfNJGvTTTvhU6j/5FC9+Ug3bkMUv2swLPZ0zZkhhs5JMMPVitJqV08sxPXu4q9odJy8InfBAOvdPQzGUVr4m4MF+Y/XCEsILDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560190; c=relaxed/simple;
	bh=6GAyjq/gQbQzlatX5AvAy9PCMUY6k/966rJsfggjNd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANh9pegNkRIsumiodIO5t/WURbWm8Y3YarY2WwHbYKxntbdXWuAmJxZ1OsGeoTWVoC8gv1AbMZwyooBmiulw6w9nZdWm8WLPGrj/y7Dpdwa9HkZ9NTxf5eA9A6Jl2BeHCH+WAUb9zbOkadNHEy+ITPyOIFidxCMNUrA8+9wlHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PSbQ8xt6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ikROfZgX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376XTTh492547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=; b=PSbQ8xt6vfHjLk/T
	6rE4KjXDYII7BcW9mZcFNICoDGuszI0WijhVva48m2jWbtSAITuaLcr4q7EEd2bX
	9hNg//XueEHZPkejgpSBq4ecniR6QN2zAlwYWwmlhj5/zQH0+OItHPEb2AvnXqv5
	LeSaDPm7fXCu6o60sT8CjQYiL3vbaFJgzIyDHTPmz9Lxfrg+mRBnFxrL7QRVMand
	QdkZHGniJywuTInzYB6WNU5vF0icdwNGLLo5maIdeYRFaCrjwJQTrSy5MhQH+Qod
	JMwNswtNd6ivgrHP3WtEDDKlwjAHKq+3AoPzCcFF7c3sZVAOYO+ReX9ZzQfDAcWi
	3l9t1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8tcu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:09:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24305cb3cso59928555ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560188; x=1776164988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=;
        b=ikROfZgXPHc/cHbiXvhFlJJypWYTXxFW7vTZpSE/Ol7ohUKei7N37HJ867zBeZDUje
         sD0pshXPbRSvOXiRMMuEs6HF7xvGxT0dCUD8hziutRsK8Q0xu0vfR28rn59HntzR4zWI
         w1h/TYCS5TP7wXIitv0veCyKpo/r5XHW09iBOV5sA1IJkCVlbsPXGOKPFMc2Q35Y4vET
         XCgFDYzC6urHSDHWHTrDXEOi8ASX7vh4NaZtfuGOBtR3+LB3Ouj09YJ8H310GLUeUWqr
         fgmNSN2p4zWrWRQR52Xa93fnVrWRbxg+uvE7bPAnvT7gTZoM6cfUNSatkJ9B4HLbXX+N
         vpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560188; x=1776164988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6eiccQO/e38UrZ6Zd4wBRS4N1jpEVerQAlu0qR352HE=;
        b=rqg3s8X+/s0dehdM0LttcqCOB39JcBVoSlR7TrR8Ml4OmJ5kbo6K7npE+jZtxi9De/
         h+68ftXy801fuPmrW7R8CUz790y+JIwUAps7aJ9Z2I5S2O7HD4Bv7tIUEYk85MoXqwR5
         WjUJQyfL1qrOIJSOaW7LSKY2du5Jace/VAuUiT5+4HEkJNUb9XP80LSsk5sM5T8FqLcs
         4RZCtj7liHgBfjEx6NrDQsbMLjRx0VCglZpgf8BJl/q+TWVu8Z0LUgjFWnUpF2Rs/ME0
         je36UJ6B4q/i2ns3jeXmmYv+jB2gjT6yk3HPBplDc6NzqUNZrcuEliFkLGO1KVeofu5l
         rdlA==
X-Gm-Message-State: AOJu0YyfeKryucpC3zJe/MZkdbfLdmQ6EEVkhqg3l9Y05RjoTfTsNbJZ
	wAgqSQfXBqfXxv1kz9A6Jb2RKQD0IS6LMMNkSaA/ZHXFAcbzMlAtDQ4FFFephCl7nq+Fq1jotAH
	pOw8bo/Te4hTOvULxrn1UvB0GG92qQODIKaA/9WoYqt43ZMLX07Iit1cKpBCjHHNLoiCQ
X-Gm-Gg: AeBDievoPY2PL7Hzax0uOdmH50zBKeevUsOR6azgGKH+QMfomKIQHa92ZqSozaDrako
	/OVKyjy2G1P/GIOCt9gLy6UDReGXZ7IKZw2GW1My7luE6RiKjxUF77eRzXVISxYE7gE0R+3n97J
	DeALUWWrQk3EFeySnqxcDzZTFh6lfhkZcDY7d0kXbRAOagjFd6696f83UMAmnop2btkRqDPYO5m
	W8ROR2sCzJi+xroYS4EVq5/DaoUcFPIJKni9FJxy6H4yJPdudpBTitBZFguiX0gdpanpJTh+D/h
	MwRRdSIqOhqXWkokV36ZK0AgbNYUf0jq7BTY13iTLrc58vJ+m+UcXJQUiAKXnz1gNcALte7K6GV
	9HilmSQWx6gg6mLvzeWSJSMPYTMBV6W6+hrulep0pC9EfxTT/iXmB
X-Received: by 2002:a17:903:b45:b0:2b2:54c1:2067 with SMTP id d9443c01a7336-2b2816f3dd3mr166178205ad.21.1775560188282;
        Tue, 07 Apr 2026 04:09:48 -0700 (PDT)
X-Received: by 2002:a17:903:b45:b0:2b2:54c1:2067 with SMTP id d9443c01a7336-2b2816f3dd3mr166177925ad.21.1775560187819;
        Tue, 07 Apr 2026 04:09:47 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c65a3f08sm15510846a12.31.2026.04.07.04.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:09:47 -0700 (PDT)
Message-ID: <a2e2df62-42f7-464d-8833-8eabc7d92ecb@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 16:39:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <8ea92c00-56ca-47cd-95aa-dbf49ecf4118@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: L5KveHHMuEXlbnzhaiHw_OzmsUxJX7GJ
X-Proofpoint-ORIG-GUID: L5KveHHMuEXlbnzhaiHw_OzmsUxJX7GJ
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4e5fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=yChZgWpjsVOoaIn_3ooA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNCBTYWx0ZWRfX9fYm2ogW1otj
 Dn4BTJ9REV5dcc7KpAoEK4HTiiEIcIz5ipZqKxikx42rYRWa/snrc7ftsqTe6jvbdtUnOY3v8AI
 3qqpltl5HY4p6mNTojhzQHjzuK0lCZCgYS4NmbczV1wLS08BVPd3tA9y5q0A9UEfhZEHE0uuyyV
 gkIkh1QhjI6KZl+6RTUeCLYkF9Hf9vDTZzxHQQWXqCua4ZJwSfufi/cMksn3HeSw6qpIjV400NJ
 XVemTM8YUGpOSPdSIf3EBDXWwBcaZcX2iVsPuhUX4wlx0bxrKwiHXnZaRnaGUd8P8aA0KXwD0LC
 Bv3K5EgsBEp0pjEWJIgDWp3pAghQddeQFp3T5cllLQk/jKqSctyuoLwfd0Y0UXBlRHC3Hd5rzYl
 XXOuAUqPPaiYgebGvGWYrzqHDbp07sjQ6wdvE8KOGtR4w+5mWOnoBtCZTAF04RMdYd1XbTjCO3t
 baHgSo+2nTQKbScgDuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070104
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,7c8000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102141-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 458523AD87F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index dda4697a61b7..5e6b659e8719 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>  				     "qcom,inline-crypto-engine";
>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core", "iface";
> 
> nit: one a line would be preferred, please fix that up as you seemingly
> need a v2 anyway

Hi Konrad, Didn't get your comment completely.

Do I need to send v2 to just fix clock entries in 2 lines?
Or some other comment to address and send v2 for that?
I don't see any other comment on patchset to address.

Kindly clarify.

-- 
Regards
Kuldeep


