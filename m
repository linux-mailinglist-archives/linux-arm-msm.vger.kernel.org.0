Return-Path: <linux-arm-msm+bounces-97085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH2ABnDzsWl7HQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:57:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283126B01A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D9A83011D55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 22:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93983398912;
	Wed, 11 Mar 2026 22:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn1+/UD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GFnw5Ws6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EE0397E73
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 22:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773269866; cv=none; b=ET8XdfLBql9W7R0axmmsVRhrFeOwlPk+g4gLp3u3q7i/oM2thiEyyzdVdrqN2i2i2hZ7EfX80q4vgpJqzvnFY+BTlM9sGp9KeAPWnFvl189zvR49YSD/pOdpjy2bx34o+zF/zWW+nE9znZsPpaNxrm9jysO0UnT5rBNvd4x32Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773269866; c=relaxed/simple;
	bh=VHm6QSnAsA+602Lrd0emZ6caSFHzLyVnfrA1BntmvqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/Tnxa2eVs53jyCaozpy+MsHzhbgjMW3pRHOi7Tv+Mnj5F6gPjZDVKSVecvi7ej8EFIFJZDY23e0SKrXGUn20evo184cEMYlU7llhCKloXN3h7Rnyjd4m0jBmVntz1VLBPlZbDe/XC3aK5SFENLpvGuIkC9EOmEVuop8PJLYxDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn1+/UD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GFnw5Ws6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMMgNu1207646
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=; b=bn1+/UD1+NWbHFOo
	fXr9VtQHFwMIApd6ugoH3bqgeEFv6hKYPDHs4KQ8REJaPSIYIF8zKjUSptIvmLtb
	uwj/BPuy8MPBMoBizqRglFwFcC/8MEds8MuDoWC9yb0pVQQOPaKbWCzDX4Yx3ief
	40Dc1Q9dM+/5cToC/0H7TzrBZ8DT7TVOqbxR3tCIC4dKFVojaAqUzXSP8D2UUTl9
	ipLm5HjozemfxQj+rOH0heOVXhzMOtOTsper/D80jbujfAvMDqzo0N/K2+nB9nqc
	gJsaSVpkocSiD+InTaPpEU2zsP+/Yga5YHtEXtRgfPazYgJXPgPkWteQuqhs9x4w
	pRNj5Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4v02q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 22:57:44 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46713069242so1300498b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 15:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773269864; x=1773874664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=;
        b=GFnw5Ws6rgTOoWnYyqyc33F+0RFTExcxPA3LLoqIxoArmYyOllQ0II1n416/++XXW2
         RIyXCXXfIyx24wvI4bP7eIBQwyyCBmvTnbDyxQ7mPVgzfnhCAUbU4AuCNnIdP8kcLBbw
         Zrxndfgpx50s/do1hY5U8qUAxtFkBjGxhrjX/XS4vODvi3FmYUKy7D+lIJIG+uRShiXD
         OoMFq+RWbwtQ4pzK+KUgCutngceZBebgnqQ/pkvcTbQqtgsrD4XjdjVc5Oz8RtI+CBJo
         n49Pgc4WjUMf1M2Nim2BZGy3kGFSJJEd1gYaxkprWW6ZCNMCsYff22fnqKp1m99R5Erv
         oyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269864; x=1773874664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RtNHy2LyyuXRdz/OlobybRGnBBWQatheEUj0Up6bJVI=;
        b=iMI/w1y7KDCsdh9Cz2xP362HBGYCKWpSO6r4W2sUtlQo/Q5GI270pbyw4KaxIRgHT2
         82Xk/8iAiFVrCCNz8wPsaOSFsu1k0FRUA+h1AN3r/D3WnECSYzSPj6N3BfNuXz9kKTgr
         AV1eFiRRJ27Mi9UoxuygG7ey52XCxztFXTUJ0zbfJ1GbFqUjEweoQ3TGgY0wdVeQX6dC
         or/x/hXPhJxqBfZyFgdbGw8M+2tfVYA2Y4syVvyqYd8D2K8sGXrNkmJ12GEgKXH4KCgX
         aPSpi5NO9IXREAAGOtPhWNKofrYxeVTT/5M6okvMBR10wcGiJ5xKPwinT7/SAFOYMPaX
         duMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfTo4MfFJSIzqlSRgNtRTs1r9HQDVZQs6UurAig3CsPSCzxxW0rbDbnyQmgPoNdt8+clyNLtCXs9mdJJhv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdMFvr4u4mZFtqJ/Y+PmXg+X0Wq+jN23Cm810HE3B+gZ8tDje
	3eOBvcSAZcCBPldp1C5uPyk7THgj/kDbdSnUf+MbgtfOYK9OWJYOjTQMgGMwlIpxHzNHiYoFabT
	3VkNxyCdQRjURbYuq9NJZg/6GmLWnRzFCZFgvkKLM1GwNrUWgleUvgkAn1EIKNyBj7TXrOOj7gu
	rF
X-Gm-Gg: ATEYQzzqf6fINRynpakhnmFpWqk5tEXgGhR8kuvU3YT4zBjAIALurnrEhkWi8k4D2GK
	yK/ELoG8mYUrPPdc2FkdBU0Z3+9hrE+m/IAQZfLLTBJGHUinYHdwoqautxljCXVD2k9UrhIRagr
	34usLYv6anQfNM+h5WMXJZjXT/uaJtgEmM0kezKbBODvyT7FkSQ7RTexeV5pbefvoa5mj6WvfDY
	iaX58617GEmWuR9tLHYzLAfZaMDz9VrXUJcTqfx41bPOo5Fgk9taRpeb5upuviWoRufrmftLFJP
	m23cMv+Ib+/nynOh8QwXqJDsMqY3ehFX3Tgn9fgu7n3glrZX5c8X90+hT0OJEN5zSGdUpDdqt9g
	lEU/E4uafRgt8ZbFhuxneimYDUJ7BLaruS/JIZmSGyikow2MSW16YsmHNis3L9C6YqsHEAEp8JU
	lMR1g=
X-Received: by 2002:a05:6808:1920:b0:45c:7b2c:10bb with SMTP id 5614622812f47-46733641014mr2342956b6e.60.1773269863620;
        Wed, 11 Mar 2026 15:57:43 -0700 (PDT)
X-Received: by 2002:a05:6808:1920:b0:45c:7b2c:10bb with SMTP id 5614622812f47-46733641014mr2342938b6e.60.1773269863167;
        Wed, 11 Mar 2026 15:57:43 -0700 (PDT)
Received: from [10.71.180.216] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46734340842sm2034184b6e.18.2026.03.11.15.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 15:57:42 -0700 (PDT)
Message-ID: <c313921f-03ab-40b3-82cb-10b0a40d91f0@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 15:57:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 02/10] usb: misc: qcom_eud: add sysfs attribute for
 port selection
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
 <20260309203337.803986-3-elson.serrao@oss.qualcomm.com>
 <2026031101-cornstalk-partner-a30e@gregkh>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <2026031101-cornstalk-partner-a30e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE5NiBTYWx0ZWRfX01ucSN4D9s2/
 sUBbd6jhYFD/sUzqpYqSPexRx5nLh1o6DP7hoB0O5WsRZ6/tt9VkiMKCt3BVr1t1KjJav4jii1A
 Y7EDSUv38ZD9IxJBV1bHh+i5296cEy2buZ4J/F1u3U8qx8tgVHNuvjWKNnebMdracINEbmyPshl
 sbUDm+QqSWOV2BeGwbsPuaSwJvrJQOFL7Dr/VhNIG16eHT5n9rsnLWafQjh/6i8I/mbYkOhuP+1
 Rll9tcpr2fswZ7FyklJZAW3cvZEBHVW8MPyWWXWJ7hkZJsSVgh7Il/LqQIGe1RzigCCZyYTEHLf
 Fp0l07RvUgSd/Vqk9+jA91g9PYnwW1Vr0LJGLUZVkMunmJ5NqoI1yGAAwj0497vABlftsZBtiuH
 IfPb0D2NWhRHGhE5dv02JURpUlHmQUAAiS8M+YcN74kVZhNGqS7p0M2ld8J+7UalVks3+fT/Aoh
 oD8AzbIBxuN09b4dXiQ==
X-Proofpoint-ORIG-GUID: -wB5FBjXQ-Q779C_oe8KysL1drWk2MVG
X-Proofpoint-GUID: -wB5FBjXQ-Q779C_oe8KysL1drWk2MVG
X-Authority-Analysis: v=2.4 cv=V7NwEOni c=1 sm=1 tr=0 ts=69b1f368 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IAXstxnVdUbjqp5kDF4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603110196
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97085-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2283126B01A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/11/2026 6:16 AM, Greg Kroah-Hartman wrote:
[...]

>> +
>> +What:		/sys/bus/platform/drivers/qcom_eud/.../port
>> +Date:		January 2026
>> +Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
>> +Description:
>> +		Selects which USB port the Embedded USB Debugger (EUD)
>> +		is mapped to on platforms providing multiple High-Speed
>> +		USB ports.
>> +
>> +		Valid values:
>> +		  0 - Primary USB port
>> +		  1 - Secondary USB port
> 
> Why not use "primary" and "secondary" as values instead?  That makes
> this much simpler to understand.
> 

[...]

>>  
>> +static ssize_t port_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct eud_chip *chip = dev_get_drvdata(dev);
>> +
>> +	return sysfs_emit(buf, "%u\n", chip->port_idx);
> 
> Wait, you are returning a 0/1 here, yet using a u8?  How can that work?
> 

Thanks for the review, Greg.
I’ll switch the sysfs attribute to use "primary"/"secondary" values
(instead of numeric 0/1) as suggested and update the ABI doc and driver.
This should also resolve the ambiguity around the current 0/1 output.

Regards,
Elson

